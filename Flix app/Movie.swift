import UIKit
import AlamofireImage

class Movie: NSObject
{
    var title: String!
    var overview: String!
    var imageURL: URL!
    
    init(newTitle: String, newOverview: String, newImageURL: URL)
    {
        title = newTitle
        overview = newOverview
        imageURL = newImageURL
    }
}
