import UIKit

final class ThumbnailViewController: UIViewController {
    @IBOutlet private weak var thumbnailsTableView: UITableView!
    
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = thumbnailsTableView.dequeueReusableCell(withIdentifier: String(describing: ThumbnailTableViewCell.self), for: indexPath) as? ThumbnailTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}

// MARK: - TableView Delegate
extension ThumbnailViewController: UITableViewDelegate {
}
