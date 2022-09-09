import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!

    var movies = [[String: Any]]()
    var movieInfo: Array<Movie> = []
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
        tableView.rowHeight = 210
        tableView.estimatedRowHeight = 210
        
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
                 
                 self.tableView.reloadData()
                 
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
             }
        }
        task.resume()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return movieInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: tableView.frame.width, height: cell.frame.height)
        let movie = movieInfo[indexPath.row]
        cell.setUp(movie: movie, indexPath: indexPath)
        cell.poster.af.setImage(withURL: movie.imageURL)
        return cell
    }
}

