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
        thumbnailImageView.image = video.image
        titleLabel.text = "\(video.title):"
        if video.title.isEmpty {
            titleLabel.text = "Noname video"
        }
    }
}
