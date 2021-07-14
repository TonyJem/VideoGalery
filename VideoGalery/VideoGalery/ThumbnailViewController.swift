import UIKit

final class ThumbnailViewController: UIViewController {
    @IBOutlet private weak var thumbnailsTableView: UITableView!
    
    private let videoThumbnailNames = ["video1", "video2", "video3", "video4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Funny videos"
        
        thumbnailsTableView.register(UINib(nibName: String(describing: ThumbnailTableViewCell.self), bundle: Bundle.main),
                                  forCellReuseIdentifier: String(describing: ThumbnailTableViewCell.self))
        
        thumbnailsTableView.backgroundColor = .systemGray5
        thumbnailsTableView.tableFooterView = UIView()
        thumbnailsTableView.dataSource = self
        thumbnailsTableView.delegate = self
    }
}

// MARK: - TableView DataSource
extension ThumbnailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoThumbnailNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = thumbnailsTableView.dequeueReusableCell(withIdentifier: String(describing: ThumbnailTableViewCell.self), for: indexPath) as? ThumbnailTableViewCell else {
            return UITableViewCell()
        }
        cell.fillCell(with: showImage(videoThumbnailNames[indexPath.row]))
        return cell
    }
    
}

// MARK: - TableView Delegate
extension ThumbnailViewController: UITableViewDelegate {
}

// MARK: - Private Methods
private extension ThumbnailViewController {
    
    func showImage(_ name: String) -> UIImage {
        return #imageLiteral(resourceName: name)
    }
}
