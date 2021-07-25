protocol ViewModelProtocol: class {
    var updateView: ((MvvmModel)->())? { get set }
    var videos: [MvvmModel.Video] { get set }
    
    func showDefaultThumbnail(for index: Int)
    func showGeneratedThumbnail(for index: Int)
}

class ViewModel: ViewModelProtocol {
    
    var updateView: ((MvvmModel) -> ())?
    
    var videos: [MvvmModel.Video] =  MvvmModel.Video.fetchVideos()

    func showDefaultThumbnail(for index: Int) {
        var video = videos[index]
        video.setThumbnailToDefault()
        updateView?(.initial(MvvmModel.Video(title: video.title, url: video.url, defaultImage: video.defaultImage)))
    }
    
    func showGeneratedThumbnail(for index: Int) {
        var video = videos[index]
        video.setGeneratedThumbnail()
        updateView?(.generated(MvvmModel.Video(title: video.title, url: video.url, defaultImage: video.defaultImage)))
    }
}
