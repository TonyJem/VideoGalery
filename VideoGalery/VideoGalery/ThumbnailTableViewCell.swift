import UIKit

class ThumbnailTableViewCell: UITableViewCell {
    @IBOutlet private weak var thunmbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(with image: UIImage) {
        thunmbnailImageView.image = image
    }
}
