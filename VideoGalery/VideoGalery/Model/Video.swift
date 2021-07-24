import UIKit

struct Video {
    
    let image: UIImage
    let title: String
    let url: URL
    
    private enum Title: String {
        case title01 = "Aladdin"
        case title02 = "Avez Vous"
        case title03 = "The Kings Trumpet"
        case title04 = "Popeye the Sailor Meets Aladdin and His Wonderful Lamp"
        case title05 = "The Barber of Seville"
        case title06 = "A Tale Of Two Kitties (1942)"
        case title07 = "Barbecue For Two (1960)"
        case title08 = "Porky In Wackyland (1938; computer-colorized version)"
        case title09 = "A Day At The Zoo (1939)"
        case title10 = "The Mouse Of Tomorrow (1942)"
    }
    
    private enum Url: String {
        case url01 = "https://ia802609.us.archive.org/23/items/Aladdin_315/Aladdin_512kb.mp4"
        case url02 = "https://ia800604.us.archive.org/19/items/Avez-vousDjVu...LePlusPetitZooDuMonde/104_Le_Plus_Petit_Zoo_du_Monde.mp4"
        case url03 = "https://ia800705.us.archive.org/28/items/TheSpiritOf43_56/The_Spirit_of__43_512kb.mp4"
        case url04 = "https://ia800703.us.archive.org/30/items/Popeye_the_Sailor_Meets_Aladdin_and_His_Wonderful_Lamp/Popeye_-_Aladdin_and_His_Wonderful_Lamp_512kb.mp4"
        case url05 = "https://ia800204.us.archive.org/13/items/TheBarberOfSeville/TheBarberOfSeville1944.mp4"
        case url06 = "https://ia800805.us.archive.org/13/items/ATaleOfTwoKitties1942/A%20Tale%20of%20Two%20Kitties%20%281942%29.mp4"
        case url07 = "https://ia800605.us.archive.org/24/items/BarbecueForTwo1960/Barbecue%20for%20Two%20%281960%29.mp4"
        case url08 = "https://ia601002.us.archive.org/17/items/PorkyInWackylandCCV/Porky%20in%20Wackyland%20%28CCV%29.mp4"
        case url09 = "https://ia800602.us.archive.org/33/items/ADayAtTheZoo1939/A%20Day%20at%20the%20Zoo%20%281939%29.mp4"
        case url10 = "https://ia800807.us.archive.org/32/items/TheMouseOfTomorrow1942/The%20Mouse%20of%20Tomorrow%20%281942%29.mp4"
        
    }
    
    static func fetchVideos() -> [Video] {
        let video01 = Video(image: #imageLiteral(resourceName: "video01"), title: Title.title01.rawValue, url: URL(string: Url.url01.rawValue)!)
        let video02 = Video(image: #imageLiteral(resourceName: "video02"), title: Title.title02.rawValue, url: URL(string: Url.url02.rawValue)!)
        let video03 = Video(image: #imageLiteral(resourceName: "video03"), title: Title.title03.rawValue, url: URL(string: Url.url03.rawValue)!)
        let video04 = Video(image: #imageLiteral(resourceName: "video04"), title: Title.title04.rawValue, url: URL(string: Url.url04.rawValue)!)
        let video05 = Video(image: #imageLiteral(resourceName: "video05"), title: Title.title05.rawValue, url: URL(string: Url.url05.rawValue)!)
        let video06 = Video(image: #imageLiteral(resourceName: "video06"), title: Title.title06.rawValue, url: URL(string: Url.url06.rawValue)!)
        let video07 = Video(image: #imageLiteral(resourceName: "video07"), title: Title.title07.rawValue, url: URL(string: Url.url07.rawValue)!)
        let video08 = Video(image: #imageLiteral(resourceName: "video08"), title: Title.title08.rawValue, url: URL(string: Url.url08.rawValue)!)
        let video09 = Video(image: #imageLiteral(resourceName: "video09"), title: Title.title09.rawValue, url: URL(string: Url.url09.rawValue)!)
        let video10 = Video(image: #imageLiteral(resourceName: "video10"), title: Title.title10.rawValue, url: URL(string: Url.url10.rawValue)!)
        
        return [video01, video02, video03, video04, video05, video06, video07, video08, video09, video10]
    }
}
