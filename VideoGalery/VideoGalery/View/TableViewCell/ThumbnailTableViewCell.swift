import UIKit

class ThumbnailTableViewCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private let containerCornerRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Colors.mainBackround
        containerView.layer.cornerRadius = containerCornerRadius
    }
    
    func fillCell(with video: Video) {
        thumbnailImageView.image = video.videoImage
        
        if let title = video.videoTitle {
            titleLabel.text = "\(title):"
        } else {
            titleLabel.text = "Unamed Video:"
        }
    }
}
