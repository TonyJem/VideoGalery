import UIKit
import AVKit

final class ThumbnailViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var videos: [Video] = {
        return Video.fetchVideos()
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Funny videos"
        
        tableView.register(UINib(nibName: String(describing: ThumbnailTableViewCell.self), bundle: Bundle.main),
                           forCellReuseIdentifier: String(describing: ThumbnailTableViewCell.self))
        tableView.backgroundColor = Colors.mainBackround
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: selectedIndexPath, animated: animated)
    }
}

// MARK: - TableView DataSource
extension ThumbnailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ThumbnailTableViewCell.self),
                                                       for: indexPath) as? ThumbnailTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.video = videos[indexPath.row]
        cell.fillCell()
        return cell
    }
}

// MARK: - TableView Delegate
extension ThumbnailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVideo = videos[indexPath.row]
        let player = AVPlayer(url: selectedVideo.url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.allowsPictureInPicturePlayback = true
        playerViewController.player?.play()
        
        present(playerViewController, animated: true, completion: nil)
    }
}

// MARK: - ThumbnailTableViewCell Delegate
extension ThumbnailViewController: ThumbnailTableViewCellDelegate {
    
    func onDefaultThumbnailButtonTap(cell: ThumbnailTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        videos[indexPath.row].setThumbnailToDefault()
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func onGeneratedThumbnailButtonTap(cell: ThumbnailTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        videos[indexPath.row].setGeneratedThumbnail()
        print("🟢 Generate Thumbnail from URL for cell: \(videos[indexPath.row].title) ...")
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
