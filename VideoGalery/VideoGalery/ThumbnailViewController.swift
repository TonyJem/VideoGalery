/*
 URL №1 "https://ia802609.us.archive.org/23/items/Aladdin_315/Aladdin_512kb.mp4"
 URL №2 "https://ia800604.us.archive.org/19/items/Avez-vousDjVu...LePlusPetitZooDuMonde/104_Le_Plus_Petit_Zoo_du_Monde.mp4"
 URL №3 "https://ia800705.us.archive.org/28/items/TheSpiritOf43_56/The_Spirit_of__43_512kb.mp4"
 URL №4 "https://ia800703.us.archive.org/30/items/Popeye_the_Sailor_Meets_Aladdin_and_His_Wonderful_Lamp/Popeye_-_Aladdin_and_His_Wonderful_Lamp_512kb.mp4
 */

/*
 Title №1: "Aladdin"
 Title №2: "Avez Vous"
 Title №3: "The Kings Trumpet"
 Title №4: "Popeye the Sailor Meets Aladdin and His Wonderful Lamp"
 */


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
