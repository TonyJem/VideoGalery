import UIKit
 
struct Video {
 
  let videoImage: UIImage!
  let videoTitle: String!
  let videoUrl: URL!
 
  private enum VideoTitle: String {
    case videoTitleOne = "Aladdin"
    case videoTitleTwo = "Avez Vous"
    case videoTitleThree = "The Kings Trumpet"
    case videoTitleFour = "Popeye the Sailor Meets Aladdin and His Wonderful Lamp"
  }
 
  private enum VideoUrl: String {
    case videoOne = "https://ia802609.us.archive.org/23/items/Aladdin_315/Aladdin_512kb.mp4"
    case videoTwo = "https://ia800604.us.archive.org/19/items/Avez-vousDjVu...LePlusPetitZooDuMonde/104_Le_Plus_Petit_Zoo_du_Monde.mp4"
    case videoThree = "https://ia800705.us.archive.org/28/items/TheSpiritOf43_56/The_Spirit_of__43_512kb.mp4"
    case videoFour = "https://ia800703.us.archive.org/30/items/Popeye_the_Sailor_Meets_Aladdin_and_His_Wonderful_Lamp/Popeye_-_Aladdin_and_His_Wonderful_Lamp_512kb.mp4"
  }
 
  static func fetchVideos() -> [Video]{
    let v1 = Video(videoImage:  #imageLiteral(resourceName: "video1"), videoTitle: VideoTitle.videoTitleOne.rawValue, videoUrl: URL(string: VideoUrl.videoOne.rawValue)!)
    let v2 = Video(videoImage:  #imageLiteral(resourceName: "video2"), videoTitle: VideoTitle.videoTitleTwo.rawValue, videoUrl: URL(string: VideoUrl.videoTwo.rawValue)!)
    let v3 = Video(videoImage:  #imageLiteral(resourceName: "video3"), videoTitle: VideoTitle.videoTitleThree.rawValue, videoUrl: URL(string: VideoUrl.videoThree.rawValue)!)
    let v4 = Video(videoImage:  #imageLiteral(resourceName: "video4"), videoTitle: VideoTitle.videoTitleFour.rawValue, videoUrl: URL(string: VideoUrl.videoFour.rawValue)!)
 
    return [v1, v2, v3, v4]
  }
}
