//
//  Extension.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
import WebKit
import UIKit
import SDWebImage
import RxSwift
import RxCocoa
import SnapKit

extension UIImageView {
    
    func sdLoad(with url:URL? ,withPlaceholderImage : UIImage? = nil,completed:((UIImage?) -> Void)? = nil , clearCache : Bool = false) {
//        let image = (withPlaceholderImage != nil) ? withPlaceholderImage : UIImage(color: .clear) //UIImage(named: "icon-noImage")
        if clearCache == true
        {
            SDImageCache.shared.clearMemory()
            SDImageCache.shared.clearDisk()
        }
//        let image = UIImage(named: "imageLoading")
        let image = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).image()
        sd_setImage(with: url, placeholderImage: image ,options: .retryFailed) { (image, _, _, _) in
            completed?(image)
        }
    }
    
    func setImageTintColor(_ color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}

extension UIResponder {
    
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}
extension UITableViewCell {
    
    var tableView: UITableView? {
        return next(UITableView.self)
    }
    
    var indexPath: IndexPath? {
//        return tableView?.indexPath(for: self)
        return superTableView?.indexPath(for: self)
    }
    var superTableView : UITableView?{
        var view = self.superview
        while (view != nil) , (view?.isKind(of: UITableView.self) == false) {
            view = view?.superview
        }
        return (view as! UITableView)
    }
}
extension UICollectionViewCell {
    
    var collectionView: UICollectionView? {
        return next(UICollectionView.self)
    }
    
    var indexPath: IndexPath? {
//        return tableView?.indexPath(for: self)
        return superCollectionView?.indexPath(for: self)
    }
    var superCollectionView : UICollectionView?{
        var view = self.superview
        while (view != nil) , (view?.isKind(of: UICollectionView.self) == false) {
            view = view?.superview
        }
        return (view as! UICollectionView)
    }
}

extension UIView
{
    
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func loadNibView() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    }
}
protocol Nibloadable {

}

extension UIView: Nibloadable {
    
}

extension Nibloadable where Self : UIView
{
    /*
     static func loadNib(_ nibNmae :String = "") -> Self{
     let nib = nibNmae == "" ? "\(self)" : nibNmae
     return Bundle.main.loadNibNamed(nib, owner: nil, options: nil)?.first as! Self
     }
     */
    static func loadNib(_ nibNmae :String? = nil) -> Self{
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
    
    func loadNibView(_ nibNmae :String? = nil) -> UIView {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! UIView
    }
}

extension Nibloadable where Self : UIViewController
{
    /*
     static func loadNib(_ nibNmae :String = "") -> Self{
     let nib = nibNmae == "" ? "\(self)" : nibNmae
     return Bundle.main.loadNibNamed(nib, owner: nil, options: nil)?.first as! Self
     }
     */
    static func loadNib(_ nibNmae :String? = nil) -> Self{
        return UINib(nibName: nibNmae ?? "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! Self
    }
}

extension Array {
    func indexOfObject(object : AnyObject) -> NSInteger {
        return (self as NSArray).index(of: object)
    }
}
class UnderlinedLabel: UILabel {
    
    override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
            // Add other attributes if needed
            self.attributedText = attributedText
        }
    }
}

extension NSMutableAttributedString {
    
    /// 對同一串文字中的特定幾個字設定不同顏色
    ///
    /// - Parameters:
    ///   - textForAttribute: 要更改顏色的文字
    ///   - color: 要更改顏色
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}
extension URL {
    var queryDictionary: [String: String]? {
        guard let query = self.query else { return nil}
        
        var queryStrings = [String: String]()
        for pair in query.components(separatedBy: "&") {
            let pairArray = pair.components(separatedBy: "=")
            let key = pair.components(separatedBy: "=")[0]
            if pairArray.count>1
            {
                let value = pair
                    .components(separatedBy:"=")[1]
                    .replacingOccurrences(of: "+", with: " ")
                    .removingPercentEncoding ?? ""
                
                queryStrings[key] = value
            }else
            {
                queryStrings[key] = ""
            }
        }
        return queryStrings
    }
}


extension UIScrollView {
    // 鍵盤彈出將輸入框向上移動
    func scrollToKeyboardTop(keyboardHeight: CGFloat) {
        var contentInset:UIEdgeInsets = self.contentInset
        contentInset.bottom = keyboardHeight
        self.contentInset = contentInset
    }
    func updateContentView() {
        contentSize.height = subviews.sorted(by: {($0.frame.maxY + $0.frame.size.height)  < ($1.frame.maxY + $1.frame.size.height) }).last?.subviews.sorted(by: {($0.frame.maxY + $0.frame.size.height)  < ($1.frame.maxY + $1.frame.size.height) }).last?.frame.maxY ?? contentSize.height
    }
    func handleKeyBoardHeight(point : CGPoint)
    {
        self.setContentOffset(point, animated: true)
    }
}


//extension DecodingError: LocalizedError {
//
//    public var errorDescription: String? {
//        switch  self {
//        case .dataCorrupted(let context):
//            return NSLocalizedString(context.debugDescription, comment: "")
//        case .keyNotFound(_, let context):
//            return NSLocalizedString("\(context.debugDescription)", comment: "")
//        case .typeMismatch(_, let context):
//            return NSLocalizedString("\(context.debugDescription)", comment: "")
//        case .valueNotFound(_, let context):
//            return NSLocalizedString("\(context.debugDescription)", comment: "")
//        }
//    }
//}

extension CAGradientLayer {
    
    enum Point {
        case topRight, topLeft
        case bottomRight, bottomLeft
        case custion(point: CGPoint)
        
        var point: CGPoint {
            switch self {
            case .topRight: return CGPoint(x: 1, y: 0)
            case .topLeft: return CGPoint(x: 0, y: 0)
            case .bottomRight: return CGPoint(x: 1, y: 1)
            case .bottomLeft: return CGPoint(x: 0, y: 1)
            case .custion(let point): return point
            }
        }
    }
    
    convenience init(frame: CGRect, colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        self.init()
        self.frame = frame
        self.colors = colors.map { $0.cgColor }
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    convenience init(frame: CGRect, colors: [UIColor], startPoint: Point, endPoint: Point) {
        self.init(frame: frame, colors: colors, startPoint: startPoint.point, endPoint: endPoint.point)
    }
    
    func createGradientImage() -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        UIGraphicsBeginImageContext(bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UINavigationBar {
    func setGradientBackground(colors: [UIColor], startPoint: CAGradientLayer.Point = .topLeft, endPoint: CAGradientLayer.Point = .topRight) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors, startPoint: startPoint, endPoint: endPoint)
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}


extension UIApplication {
    class func topViewController(base: UIViewController? = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
//        if let presented = base?.presentedViewController {
//            return presented
//        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        if let tab = base as? UITabBarController {
//            if let selected = tab.selectedViewController {
//                return topViewController(base: selected)
//            }
            return base
        }
        if let alert = base as? UIAlertController {
            return alert
        }
        return base
    }
    var statusBarUIView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

            if let statusBar = keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                guard let statusBarFrame = keyWindow?.windowScene?.statusBarManager?.statusBarFrame else { return nil }
                let statusBarView = UIView(frame: statusBarFrame)
                statusBarView.tag = tag
                keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        } else {
            return nil
        }
      }
}


extension Decodable {
    static func map(JSONString:String) -> Self? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Self.self, from: Data(JSONString.utf8))
        } catch let error {
            print(error)
            return nil
        }
    }
}

extension UISearchBar {
    var textField : UITextField? {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            for view : UIView in (self.subviews[0]).subviews {
                if let textField = view as? UITextField {
                    return textField
                }
            }
        }
        return nil
    }
}

extension UITableView {
    func dequeueCell<T>(type: T.Type, indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: NSStringFromClass(type as! AnyClass), for: indexPath) as! T
        return cell
    }
    
    func dequeueHeaderFooter<T>(type: T.Type) -> T {
        let headerFooter = self.dequeueReusableHeaderFooterView(withIdentifier: NSStringFromClass(type as! AnyClass)) as! T
        return headerFooter
    }
    
    func registerCell(type: AnyClass) {
        self.register(type, forCellReuseIdentifier: NSStringFromClass(type))
    }
    
    func registerHeaderFooter(type: AnyClass) {
        self.register(type, forHeaderFooterViewReuseIdentifier: NSStringFromClass(type))
    }
    
    func registerXibCell(type: AnyClass) {
        self.register(UINib(nibName: "\(type)", bundle: nil), forCellReuseIdentifier: NSStringFromClass(type))
    }
    
    func registerXibHeader(type: AnyClass) {
        self.register(UINib(nibName: "\(type)", bundle: nil), forHeaderFooterViewReuseIdentifier: NSStringFromClass(type))
    }
    
    func refrashControl(tintColor: UIColor) -> UIRefreshControl{
        let refrashControl = UIRefreshControl()
        //let attributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
        //refrashController.attributedTitle = NSAttributedString(string: "正在更新", attributes: attributes)
        refrashControl.tintColor = tintColor
        refrashControl.backgroundColor = .clear
        self.addSubview(refrashControl)
        return refrashControl
    }
    func footerRefrashView() -> UIView{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: pWidth(40)))
        view.backgroundColor = .clear
        let activity = UIActivityIndicatorView()
        activity.style = .gray
        activity.backgroundColor = .clear
        view.addSubview(activity)
        activity.snp.makeConstraints { (maker) in
            maker.width.equalTo(pWidth(40))
            maker.height.equalTo(pWidth(40))
            maker.center.equalToSuperview()
        }
        activity.startAnimating()
        return view
    }
    func scrollToBottom(){

        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                section: self.numberOfSections - 1)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }

    func scrollToTop() {

        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .top, animated: false)
           }
        }
    }

    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
}

extension UICollectionView {
    func dequeueCell<T>(type:T.Type, indexPath:IndexPath) -> T {
        let cell = self.dequeueReusableCell(withReuseIdentifier:NSStringFromClass(type as! AnyClass),
                                            for:indexPath) as! T
        return cell
    }
    
    func dequeueHeader<T>(type:T.Type, indexPath:IndexPath) -> T {
        let header = self.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader,
                                                           withReuseIdentifier:NSStringFromClass(type as! AnyClass), for:indexPath) as! T
        return header
    }
    
    func dequeueFooter<T>(type:T.Type, indexPath:IndexPath) -> T {
        let footer = self.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionFooter,
                                                           withReuseIdentifier:NSStringFromClass(type as! AnyClass), for:indexPath) as! T
        return footer
    }
    
    func registerCell(type:AnyClass) {
        self.register(type, forCellWithReuseIdentifier:NSStringFromClass(type))
    }
    
    func registerXibCell(type:AnyClass) {
        self.register(UINib(nibName: "\(type)", bundle: nil), forCellWithReuseIdentifier: NSStringFromClass(type))
    }
    
    func registerHeader(type:AnyClass) {
        self.register(type,
                      forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier:NSStringFromClass(type))
    }
    func registerXibHeader(type:AnyClass) {
        self.register(UINib(nibName: "\(type)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(type))
    
    }
    
    func registerFooter(type:AnyClass) {
        self.register(type,
                      forSupplementaryViewOfKind:UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier:NSStringFromClass(type))
    }
    func registerXibFooter(type:AnyClass) {
          self.register(UINib(nibName: "\(type)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(type))
    }
    
    
    func pagingInCenter(_ scrollView:UIScrollView,
                        targetContentOffset:UnsafeMutablePointer<CGPoint>,
                        cellWidth:CGFloat,
                        itemSpacing:CGFloat,
                        leftEdgeInset:CGFloat) {
        let pageWidth:Float = Float(cellWidth + itemSpacing)
        // width + space
        let currentOffset:Float = Float(scrollView.contentOffset.x)
        let targetOffset:Float = Float(targetContentOffset.pointee.x)
        var newTargetOffset:Float = 0
        if targetOffset > currentOffset {
            newTargetOffset = ceilf(targetOffset / pageWidth) * pageWidth
        } else if (targetOffset == currentOffset) {
            newTargetOffset = roundf(targetOffset / pageWidth) * pageWidth
        } else {
            newTargetOffset = floorf(targetOffset / pageWidth) * pageWidth
        }
        if newTargetOffset < 0 {
            newTargetOffset = 0
        } else if (newTargetOffset > Float(scrollView.contentSize.width)) {
            newTargetOffset = Float(Float(scrollView.contentSize.width))
        }
        
        let leftGap = Float((UIScreen.main.bounds.width - cellWidth) / 2 - leftEdgeInset)
        targetContentOffset.pointee.x = CGFloat(newTargetOffset - leftGap)
    }
    
}

extension UIColor {
    func setImageColor(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
extension Encodable {
    /// Encode into JSON and return `Data`
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
