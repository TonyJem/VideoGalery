import Foundation

enum MvvmModel {
    case initial(Model)
    case generated(Model)
    
    struct Model {
        let image: String
        let isHiden: Bool
    }
}
