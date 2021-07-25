protocol ViewModelProtocol: class {
    var updateView: ((MvvmModel)->())? { get set }
    
    func showDefaultThumbnail(for item: Int)
    func showGeneratedThumbnail()
}

class ViewModel: ViewModelProtocol {
    
    var updateView: ((MvvmModel) -> ())?
    
    func showDefaultThumbnail(for item: Int) {
        updateView?(.initial(MvvmModel.Model(image: "Loading", isHiden: false)))
    }
    
    func showGeneratedThumbnail() {
        updateView?(.generated(MvvmModel.Model(image: "Loading", isHiden: false)))
    }
}
