
import UIKit

final class ThumbnailViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    lazy var videos: [Video] = {
        return Video.fetchVideos()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Funny videos"
        
        tableView.register(UINib(nibName: String(describing: ThumbnailTableViewCell.self), bundle: Bundle.main),
                                  forCellReuseIdentifier: String(describing: ThumbnailTableViewCell.self))
        
        tableView.backgroundColor = .systemGray5
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - TableView DataSource
extension ThumbnailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ThumbnailTableViewCell.self), for: indexPath) as? ThumbnailTableViewCell else {
            return UITableViewCell()
        }
        cell.fillCell(with: videos[indexPath.row].videoImage)
        return cell
    }
    
}

// MARK: - TableView Delegate
extension ThumbnailViewController: UITableViewDelegate {
}