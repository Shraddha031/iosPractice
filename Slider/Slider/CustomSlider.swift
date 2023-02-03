//import Foundation
//import UIKit
//
//class ThumbTextSlider: UISlider {
//var thumbTextLabel: UILabel = UILabel()
//
//private var thumbFrame: CGRect {
//    return thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
//}
//
//override func layoutSubviews() {
//    super.layoutSubviews()
//
//    thumbTextLabel.frame = thumbFrame
//    thumbTextLabel.text = Double(value).roundTo(places: 1).description
//}
//
//override func awakeFromNib() {
//    super.awakeFromNib()
//    addSubview(thumbTextLabel)
//    thumbTextLabel.textAlignment = .center
//    thumbTextLabel.layer.zPosition = layer.zPosition + 1
//}
//}
