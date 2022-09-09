import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    func setUp(movie: Movie, indexPath: IndexPath)
    {
        title.text = movie.title
        title.adjustsFontSizeToFitWidth = true 
        overview.text = movie.overview
    }
    
    static var identifier: String = "TableViewCell"
    
}
