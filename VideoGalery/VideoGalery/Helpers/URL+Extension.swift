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
        
        // TODO: insert defaultImage Picture here and to assets
        return #imageLiteral(resourceName: "video01")
    }
}
