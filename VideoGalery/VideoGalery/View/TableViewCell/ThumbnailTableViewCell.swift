import UIKit

protocol ThumbnailTableViewCellDelegate {
    func onDefaultThumbnailButtonTap(cell: ThumbnailTableViewCell)
    func onGeneratedThumbnailButtonTap(cell: ThumbnailTableViewCell)
}

class ThumbnailTableViewCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var defaultThumbnailButton: UIButton!
    @IBOutlet private weak var generatedThumbnailButton: UIButton!
    
    var delegate: ThumbnailTableViewCellDelegate?
    
    private let containerCornerRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Colors.mainBackround
        containerView.layer.cornerRadius = containerCornerRadius
        
        defaultThumbnailButton.showsTouchWhenHighlighted = true
        generatedThumbnailButton.showsTouchWhenHighlighted = true
    }
    
    @IBAction func defaultThumbnailButtonAction(_ sender: UIButton) {
        delegate?.onDefaultThumbnailButtonTap(cell: self)
    }
    
    @IBAction func generatedThumbnailButtonAction(_ sender: UIButton) {
        delegate?.onGeneratedThumbnailButtonTap(cell: self)
    }
    
    func fillCell(with video: MvvmModel.Video) {
        thumbnailImageView.image = video.thumbnail
        titleLabel.text = "\(video.title):"
        if video.title.isEmpty {
            titleLabel.text = "Noname video:"
        }
    }
}
