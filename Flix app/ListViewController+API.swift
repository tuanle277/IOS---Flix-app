import UIKit
import AlamofireImage

extension ListViewController
{
    func configAPI()
    {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 self.movies = dataDictionary["results"] as! [[String: Any]]
                 
                 let baseURL = "https://image.tmdb.org/t/p/w185"
                 for movie in self.movies
                 {
                     let poster_path = movie["poster_path"] as! String
                     self.movieInfo.append(Movie(newTitle: movie["title"] as! String, newOverview: movie["overview"] as! String, newImageURL: URL(string: baseURL + poster_path)!))
                 }
                 
                 print(self.movies)
                 
                 self.tableView.reloadData()
                 
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
             }
        }
        task.resume()
    }
}
