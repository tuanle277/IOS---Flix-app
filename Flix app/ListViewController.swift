import UIKit
import AlamofireImage

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!

    var movies = [[String: Any]]()
    var movieInfo: Array<Movie> = []

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toMovie"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let controller = segue.destination as! MovieViewController
                controller.selectedIndex = indexPath.row
                controller.movieList = movies
            }
        }
    }
    
    
}

