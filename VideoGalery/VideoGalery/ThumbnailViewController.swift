import UIKit

final class ThumbnailViewController: UIViewController {
    @IBOutlet private weak var thumbnailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Funny videos"
        
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
        return UITableViewCell()
    }
    
}

// MARK: - TableView Delegate
extension ThumbnailViewController: UITableViewDelegate {
}
