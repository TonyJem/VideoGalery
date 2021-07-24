import UIKit

class ThumbnailTableViewCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    
    private let containerCornerRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Colors.mainBackround
        containerView.layer.cornerRadius = containerCornerRadius
    }
    
    func fillCell(with image: UIImage) {
        thumbnailImageView.image = image
    }
}
