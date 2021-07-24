import UIKit
import AVFoundation

extension URL {
    func getThumbnailImage() -> UIImage {
        let asset: AVAsset = AVAsset(url: self)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print("🔴 \(error)")
        }
//        TODO: Here return nil, and cell should show default if nil
        return #imageLiteral(resourceName: "videoDefault")
    }
}
