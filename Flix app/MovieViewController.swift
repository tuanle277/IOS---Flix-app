import UIKit
import AlamofireImage

class MovieViewController: UIViewController
{
    @IBOutlet weak var backgroundPosterView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    var selectedIndex: Int!
    var movieList: [[String: Any]]!
    let bBaseURL = "https://image.tmdb.org/t/p/w300"
    let pBaseURL = "https://image.tmdb.org/t/p/w185"

    
    @IBAction func backAction(_ sender: UIButton)
    {
        dismiss(animated: true)
    }
    
    func setUp(title: String, overview: String, date: String, posterURL: URL, backdropURL: URL)
    {
        nameLabel.text = title
        nameLabel.adjustsFontSizeToFitWidth = true
        overviewLabel.text = overview
        overviewLabel.adjustsFontSizeToFitWidth = true
        dateLabel.text = date
        dateLabel.adjustsFontSizeToFitWidth = true
        posterView.af.setImage(withURL: posterURL)
        posterView.layer.borderWidth = 2.0
        posterView.layer.borderColor = UIColor.white.cgColor
        backgroundPosterView.af.setImage(withURL: backdropURL)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let posterURL = movieList[selectedIndex]["poster_path"] as! String
        let backdropURL = movieList[selectedIndex]["backdrop_path"] as! String
        setUp(title: movieList[selectedIndex]["title"] as! String, overview: movieList[selectedIndex]["overview"] as! String, date: movieList[selectedIndex]["release_date"] as! String, posterURL: URL(string: pBaseURL + posterURL)!, backdropURL: URL(string: bBaseURL + backdropURL)!)
    }
}
