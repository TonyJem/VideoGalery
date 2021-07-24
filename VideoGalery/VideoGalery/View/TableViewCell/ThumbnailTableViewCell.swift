import UIKit

protocol ThumbnailTableViewCellDelegate {
    func onDefaultButtonTap(cell: ThumbnailTableViewCell)
}

class ThumbnailTableViewCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var defaultThumbnailButton: UIButton!
    @IBOutlet private weak var randomThumbnailButton: UIButton!
    
    var delegate: ThumbnailTableViewCellDelegate?
    
    private let containerCornerRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Colors.mainBackround
        containerView.layer.cornerRadius = containerCornerRadius
        
        defaultThumbnailButton.showsTouchWhenHighlighted = true
        randomThumbnailButton.showsTouchWhenHighlighted = true
    }
    
    @IBAction func defaultThumbnailButtonAction(_ sender: UIButton) {
        print("🟢 defaultThumbnailButton Did Tap")
        delegate?.onDefaultButtonTap(cell: self)
    }
    
    @IBAction func randomThumbnailButtonAction(_ sender: UIButton) {
        print("🟢 randomThumbnailButton Did Tap")
    }
    
    func fillCell(with video: Video) {
        thumbnailImageView.image = video.thumbnail
        titleLabel.text = "\(video.title):"
        if video.title.isEmpty {
            titleLabel.text = "Noname video:"
        }
    }
    
    
}
