import UIKit
import Photos

open class ImageStack {

  public struct Notifications {
    public static let imageDidPush = "imageDidPush"
    public static let imageDidDrop = "imageDidDrop"
    public static let stackDidReload = "stackDidReload"
  }

  open var images = [UIImage]()
  fileprivate let imageKey = "image"

  open func pushImage(_ image: UIImage) {
    images.append(image)
    NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.imageDidPush), object: self, userInfo: [imageKey: image])
  }

  open func dropImage(_ image: UIImage) {
    images = images.filter {$0 != image}
    NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.imageDidDrop), object: self, userInfo: [imageKey: image])
  }

  open func resetImages(_ imageArray: [UIImage]) {
    images = imageArray
    NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.stackDidReload), object: self, userInfo: nil)
  }

  open func containsImage(_ image: UIImage) -> Bool {
    return images.contains(image)
  }
}
