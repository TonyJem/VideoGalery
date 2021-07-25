import UIKit
import AVKit

final class ThumbnailViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: ViewModelProtocol!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        
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
        return viewModel.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ThumbnailTableViewCell.self), for: indexPath) as? ThumbnailTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.fillCell(with: viewModel.videos[indexPath.row])
        return cell
    }
}

// MARK: - TableView Delegate
extension ThumbnailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVideo = viewModel.videos[indexPath.row]
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
        
        viewModel.showDefaultThumbnail(for: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func onGeneratedThumbnailButtonTap(cell: ThumbnailTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        viewModel.showGeneratedThumbnail(for: indexPath.row)
        print("🟢 Generate Thumbnail from URL for cell: \(viewModel.videos[indexPath.row].title) ...")
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
