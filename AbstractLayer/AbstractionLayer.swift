//
//  AbstractionLayer.swift
//  emi-calculator
//
//  Created by Kiran on 31/05/22.
//

import Foundation
import UIKit



public enum States : String {
    case firstViewCollapsed
    case firstViewExpanded
    case secondViewCollapsed
    case secondViewExpanded
    case thirdViewCollapsed
    case thirdViewExpanded
}

/// This is the class for `Abstraction Layer`.
///
/// ```
///  let view = AbstractionLayer(frame: self.contentView.bounds)
///  view.view1TitleTextEx = "Anush Kiran"
///  view.setLabelValuesWhenExpanded(view1Title: "Hi", view1SubTitle: "Hello", view2Title: nil, view2Subtitle: nil, view3Title: nil, view3SubTitle: nil)
///  view.setLabelValuesWhenCollapsed(view1Title: "How are you?", view1SubTitle: "I'm good", view2Title: nil, view2Subtitle: nil, view3Title: nil, view3SubTitle: nil)
///  view.setBottomViewText(firstStateText: "Anush", secondStateText: "Kiran", thirdStateText: "AK")
///  view.addSubViews()
///  self.contentView.addSubview(view)
///
/// ```
///  1. Set Frame
///  2. Customise any variable which are  available if necessary . if it's nil it takes default values
///  3. call addSubViews() func
///  4. call addGestures() func
///  5. add AbstractionLayer view as subview
///
///  Note: Please do any customisation before calling addSubViews() func
///  Side Note : Looks better with dark mode enabled
///
/// - Warning: Please follow the above mentioned steps or else It wouldn't function as intended


public class AbstractionLayer : UIView {
    
    //MARK: - Local Variables
    public  var view1State : States = .firstViewExpanded
    public  var view2State : States = .secondViewCollapsed
    public  var view3State : States = .thirdViewCollapsed
    public var view1TitleTextEx = ""
    public var view1SubTitleTextEx = ""
    public var view2TitleTextEx = ""
    public var view2SubTitleTextEx = ""
    public var view3TitleTextEx = ""
    public var view3SubTitleTextEx = ""
    public var bottomViewTextEx = ""
    public var view1TitleTextCl = ""
    public var view1SubTitleTextCl = ""
    public var view2TitleTextCl = ""
    public var view2SubTitleTextCl = ""
    public var view3TitleTextCl = ""
    public var view3SubTitleTextCl = ""
    public var bottomViewFirstStateText = ""
    public  var bottomViewSecondStateText = ""
    public var bottomViewThirdStateText = ""
    public var xValue : CGFloat = 20
    public var yValue : CGFloat = 20
    public var spacing : CGFloat = 10
    public var height : CGFloat = 20
    public  var cornerRadius : CGFloat = 15
    public var titleFontSize : CGFloat = 20
    public  var subtitltFontSize : CGFloat = 20
    /// - Warning: Bottom View height is half of subviewCollapseStateHeight + spacing
    public  var subviewCollapseStateHeight : CGFloat = 150
    public  var subViewsBgColor : UIColor = UIColor(hexString: "#525E75")
    public  var bottomViewBgColor : UIColor = UIColor(hexString: "#243A73")
    public  var titleLabelColor : UIColor = UIColor(hexString: "#DFDFDE")
    public  var subtitleLabelColor : UIColor = UIColor(hexString: "#8D8DAA")
    private var isFirstTime : Bool = true
    private var stateNotHandled : Bool = false
    //MARK: - Initialisation
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Necessary Views
    
    public lazy var view1 : UIView = {
        let view = UIView()
        view.backgroundColor = subViewsBgColor
        let label = UILabel()
        label.frame = CGRect(x: xValue, y: yValue, width: self.frame.width - xValue*2 , height: height)
        label.text = view1State == .firstViewExpanded ? view1TitleTextEx : view1TitleTextCl
        label.font = UIFont.systemFont(ofSize: titleFontSize)
        label.textColor = titleLabelColor
        label.textAlignment = .left
        view.addSubview(label)
        
        
        let subLabel = UILabel()
        subLabel.frame = CGRect(x: xValue, y: yValue + height + spacing, width: self.frame.width - xValue * 2, height: height * 2)
        subLabel.text = view1State == .firstViewExpanded ? view1SubTitleTextEx : view1SubTitleTextCl
        subLabel.numberOfLines = 0
        subLabel.font = UIFont.systemFont(ofSize: subtitltFontSize)
        subLabel.textColor = subtitleLabelColor
        subLabel.textAlignment = .left
        view.addSubview(subLabel)
        return view
    }()
    
    public lazy var view2 : UIView = {
        let view = UIView()
        view.backgroundColor = subViewsBgColor
        let label = UILabel()
        label.frame = CGRect(x: xValue, y: yValue, width: self.frame.width - xValue * 2 , height: height)
        label.text = view2State == .secondViewExpanded ? view2TitleTextEx : view2TitleTextCl
        label.font = UIFont.systemFont(ofSize: titleFontSize)
        label.textColor = titleLabelColor
        label.textAlignment = .left
        view.addSubview(label)
        
        let subLabel = UILabel()
        subLabel.frame = CGRect(x: xValue, y: xValue + height + spacing, width: self.frame.width - xValue * 2, height: height * 2)
        subLabel.text = view2State == .secondViewExpanded ? view2SubTitleTextEx : view2SubTitleTextCl
        subLabel.numberOfLines = 0
        subLabel.font = UIFont.systemFont(ofSize: subtitltFontSize)
        subLabel.textColor = subtitleLabelColor
        subLabel.textAlignment = .left
        view.addSubview(subLabel)
        
        return view
    }()
    
    public lazy var view3 : UIView = {
        let view = UIView()
        view.backgroundColor = subViewsBgColor
        let label = UILabel()
        label.frame = CGRect(x: xValue , y: yValue, width: self.frame.width - xValue * 2 , height: height)
        label.text = view3State == .thirdViewExpanded ? view3TitleTextEx : view3TitleTextCl
        label.font = UIFont.systemFont(ofSize: titleFontSize)
        label.textColor = titleLabelColor
        label.textAlignment = .left
        view.addSubview(label)
        
        let subLabel = UILabel()
        subLabel.frame = CGRect(x: xValue , y: yValue + height + spacing, width: self.frame.width - xValue * 2, height: height * 2)
        subLabel.text = view3State == .thirdViewExpanded ? view3SubTitleTextEx : view3SubTitleTextCl
        subLabel.numberOfLines = 0
        subLabel.font = UIFont.systemFont(ofSize: subtitltFontSize)
        subLabel.textColor = subtitleLabelColor
        subLabel.textAlignment = .left
        view.addSubview(subLabel)
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [view1,view2,view3])
        stack.frame = self.bounds
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.backgroundColor = .black.withAlphaComponent(0.8)
        return stack
    }()
    
    public lazy var bottomView : UIView = {
        let view = UIView()
        view.frame = CGRect(x: self.frame.minX, y: self.frame.maxY - (subviewCollapseStateHeight/2+spacing), width: self.frame.width, height: subviewCollapseStateHeight/2+spacing)
        view.backgroundColor = bottomViewBgColor
        let label = UILabel()
        label.frame = CGRect(x: xValue, y: yValue, width: self.frame.width - xValue*2 , height: height)
        label.text = bottomViewFirstStateText.isEmpty ? "Proceed to EMI Selection" : bottomViewFirstStateText
        label.font = UIFont.systemFont(ofSize: titleFontSize)
        label.textColor = titleLabelColor
        label.textAlignment = .center
        view.addSubview(label)
        view.bringSubviewToFront(label)
        return view
    }()
    
    public lazy var topLayer : UIView = {
        let view = UIView()
        view.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: subviewCollapseStateHeight)
        view.backgroundColor = .black.withAlphaComponent(0.25)
        return view
    }()
    
    public lazy var middleLayer : UIView = {
        let view = UIView()
        view.frame = CGRect(x: self.bounds.minX, y: self.bounds.minY, width: self.bounds.width, height: subviewCollapseStateHeight*2)
        view.backgroundColor = .black.withAlphaComponent(0.25)
        return view
    }()
    
    //MARK: - Class functions
    
    public func addSubViews() {
        if view1TitleTextEx.isEmpty {
            self.setLabelValuesWhenExpanded(view1Title: nil, view1SubTitle: nil, view2Title: nil, view2Subtitle: nil, view3Title: nil, view3SubTitle: nil)
        }
        if view1TitleTextCl.isEmpty {
            self.setLabelValuesWhenCollapsed(view1Title: nil, view1SubTitle: nil, view2Title: nil, view2Subtitle: nil, view3Title: nil, view3SubTitle: nil)
        }
        if bottomViewFirstStateText.isEmpty || bottomViewSecondStateText.isEmpty || bottomViewThirdStateText.isEmpty {
            self.setBottomViewText(firstStateText: nil, secondStateText: nil, thirdStateText: nil)
        }
        
        self.addSubview(stack)
        self.addSubview(bottomView)
        self.addSubview(topLayer)
        self.addSubview(middleLayer)
        self.bringSubviewToFront(middleLayer)
        self.bringSubviewToFront(topLayer)
        self.bringSubviewToFront(bottomView)
        self.addGestures()
        addConstraintsToViews(selectedView: 4)
        if self.cornerRadius == 15 {
            self.setCornerRadiusForTopCorners(radius: nil)
        }
        
    }
    
    private func addGestures() {
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapAction1(_:)))
        view1.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapAction2(_:)))
        view2.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tapAction3(_:)))
        view3.addGestureRecognizer(tap3)
        let tapLayer1 = UITapGestureRecognizer(target: self, action: #selector(tapLayerAction1(_:)))
        topLayer.addGestureRecognizer(tapLayer1)
        let tapLayer2 =  UITapGestureRecognizer(target: self, action: #selector(tapLayerAction2(_:)))
        middleLayer.addGestureRecognizer(tapLayer2)
        let bottomViewTap = UITapGestureRecognizer(target: self, action: #selector(bottomViewTapAction(_:)))
        bottomView.addGestureRecognizer(bottomViewTap)
    }
    
    @objc func tapAction1(_ sender: UITapGestureRecognizer? = nil) {
        if !isFirstTime {
            addConstraintsToViews(selectedView: 1)
            handlingStateChanges(selectedView: 1)
        }
        
    }
    
    @objc func tapAction2(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 2)
        handlingStateChanges(selectedView: 2)
    }
    
    @objc func tapAction3(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 3)
        handlingStateChanges(selectedView: 3)
    }
    
    @objc func tapLayerAction1(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 1)
        handlingStateChanges(selectedView: 1)
    }
    
    @objc func tapLayerAction2(_ sender: UITapGestureRecognizer? = nil) {
        addConstraintsToViews(selectedView: 2)
        handlingStateChanges(selectedView: 2)
    }
    
    @objc func bottomViewTapAction(_ sender: UITapGestureRecognizer? = nil) {
        isFirstTime = false
        if view1State == .firstViewExpanded {
            addConstraintsToViews(selectedView: 5)
            handlingStateChanges(selectedView: 2)
        } else if view2State == .secondViewExpanded {
            addConstraintsToViews(selectedView: 3)
            handlingStateChanges(selectedView: 3)
        } else {
            stateNotHandled = true
            handlingStateChanges(selectedView: 0)
            print("not handled")
        }
        
    }
    
    //MARK: - Updating Corner Radius
    
    public func setCornerRadiusForTopCorners(radius : CGFloat?, maskedCorners : CACornerMask = [.layerMinXMinYCorner,.layerMaxXMinYCorner]) {
        self.layer.maskedCorners = maskedCorners
        self.layer.cornerRadius = radius ?? self.cornerRadius
        self.view1.layer.maskedCorners = maskedCorners
        self.view1.layer.cornerRadius = radius ?? self.cornerRadius
        self.view2.layer.maskedCorners = maskedCorners
        self.view2.layer.cornerRadius = radius ?? self.cornerRadius
        self.view3.layer.maskedCorners = maskedCorners
        self.view3.layer.cornerRadius = radius ?? self.cornerRadius
        self.bottomView.layer.maskedCorners = maskedCorners
        self.bottomView.layer.cornerRadius = radius ?? self.cornerRadius
    }
    
    //MARK: - Updating labels
    
    public func setLabelValuesWhenExpanded(view1Title : String?, view1SubTitle : String?, view2Title : String?, view2Subtitle : String?, view3Title : String?, view3SubTitle : String?) {
        self.view1TitleTextEx = view1Title ?? "hi Kiran, how much do you need?"
        self.view1SubTitleTextEx = view1SubTitle ?? "move the dial and set any amount you need upto ₹ 487,891"
        self.view2TitleTextEx = view2Title ?? "how do you wish to repay?"
        self.view2SubTitleTextEx = view2Subtitle ?? "choose on of our recommended plans or make your own"
        self.view3TitleTextEx = view3Title ?? "where should we send the money?"
        self.view3SubTitleTextEx = view3SubTitle ??  "amount will be credited to this bank account, EMI will also be debited from this bank account"
    }
    
    public func setLabelValuesWhenCollapsed(view1Title : String?, view1SubTitle : String?, view2Title : String?, view2Subtitle : String?, view3Title : String?, view3SubTitle : String?) {
        self.view1TitleTextCl = view1Title ?? "credit amount"
        self.view1SubTitleTextCl = view1SubTitle ?? "₹1,50,000"
        self.view2TitleTextCl = view2Title ?? "EMI"
        self.view2SubTitleTextCl = view2Subtitle ?? "₹4,247/mo"
        self.view3TitleTextCl = view3Title ?? "your accounts"
        self.view3SubTitleTextCl = view3SubTitle ?? "select an account"
    }
    
    public func setBottomViewText(firstStateText : String? , secondStateText : String?, thirdStateText : String?) {
        bottomViewFirstStateText = firstStateText ?? "proceed to EMI selection"
        bottomViewSecondStateText = secondStateText  ?? "select your bank account"
        bottomViewThirdStateText = thirdStateText ?? "tap for 1-click KYC"
    }
    
    
    private func handleBottomBarLabelText(firstStateText : String? , secondStateText : String?, thirdStateText : String?) -> String {
        
        if view1State == .firstViewExpanded {
            return firstStateText ?? "proceed to EMI selection"
        } else if view2State == .secondViewExpanded{
            return secondStateText ?? "select your bank account"
        } else {
            return thirdStateText ?? "tap for 1-click KYC"
        }
    }
    //MARK: - Functions which handle height and states
    
    private func addConstraintsToViews(selectedView : Int) {
        let heightConstraint1 = NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: subviewCollapseStateHeight)
        heightConstraint1.priority = UILayoutPriority(rawValue: 998)
        let heightConstraint2 = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: subviewCollapseStateHeight)
        heightConstraint2.priority = UILayoutPriority(rawValue: 999)
        let heightConstraint3 = NSLayoutConstraint(item: view3, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: subviewCollapseStateHeight)
        heightConstraint3.priority = UILayoutPriority(rawValue: 997)
        
        let heightConstraint5 = NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: subviewCollapseStateHeight/4)
        let heightConstraint6 = NSLayoutConstraint(item: view3, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: subviewCollapseStateHeight/4)
        
        let topLayerTop = NSLayoutConstraint(item: topLayer, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let topLayerBottom = NSLayoutConstraint(item: topLayer, attribute: .bottom, relatedBy: .equal, toItem: view1, attribute: .bottom, multiplier: 1, constant: 0)
        let middleLayerTop = NSLayoutConstraint(item: middleLayer, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        
        switch(selectedView) {
        case 1:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = true
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint2,heightConstraint3])
                print("1st view tapped")
                self.layoutIfNeeded()
            }, completion: nil)
            
            break
        case 2:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = false
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint3, topLayerTop, topLayerBottom])
                print("2nd view tapped")
                self.layoutIfNeeded()
            }, completion: nil)
            break
        case 3:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = false
                self.middleLayer.isHidden = false
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint2,middleLayerTop])
                print("3rd view tapped")
                self.layoutSubviews()
                self.layoutIfNeeded()
            }, completion: nil)
            break
        case 4:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = true
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint5,heightConstraint6])
                print("Bottom bar initial state")
                self.layoutSubviews()
                self.layoutIfNeeded()
            }, completion: nil)
            break
        case 5:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = false
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint1,heightConstraint6])
                print("bottom bar 1st tap")
                self.layoutSubviews()
                self.layoutIfNeeded()
            }, completion: nil)
            break
            
            
        default:
            UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.topLayer.isHidden = true
                self.middleLayer.isHidden = true
                self.removeConstraints(self.constraints)
                self.addConstraints([heightConstraint2,heightConstraint3])
                print("1 tapped")
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    private func handlingStateChanges(selectedView : Int) {
        switch (selectedView) {
        case 1:
            view1State = .firstViewExpanded
            view2State = .secondViewCollapsed
            view3State = .thirdViewCollapsed
            updateSubViews()
            break
        case 2:
            view1State = .firstViewCollapsed
            view2State = .secondViewExpanded
            view3State = .thirdViewCollapsed
            updateSubViews()
            break
        case 3:
            view1State = .firstViewCollapsed
            view2State = .secondViewCollapsed
            view3State = .thirdViewExpanded
            updateSubViews()
            break
        default:
            print("state not handled")
            updateSubViews()
            break
        }
        
    }
    
    private func updateSubViews() {
        self.view1.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        self.view2.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        self.view3.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        
        self.bottomView.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        
        let label1 = UILabel()
        label1.frame = CGRect(x: xValue, y: yValue, width: self.frame.width - xValue * 2 , height: height)
        //        label1.text = view1State == .firstViewExpanded ? "hi Kiran, how much do you need?" : "credit amount"
        label1.text = view1State == .firstViewExpanded ? view1TitleTextEx : view1TitleTextCl
        label1.font = UIFont.systemFont(ofSize: titleFontSize)
        label1.textColor = titleLabelColor
        label1.textAlignment = .left
        self.view1.addSubview(label1)
        
        
        let subLabel1 = UILabel()
        subLabel1.frame = CGRect(x: xValue, y: yValue + height + spacing , width: self.frame.width - xValue * 2, height: height * 2)
        subLabel1.text = view1State == .firstViewExpanded ? view1SubTitleTextEx : view1SubTitleTextCl
        subLabel1.numberOfLines = 0
        subLabel1.font = UIFont.systemFont(ofSize: subtitltFontSize)
        subLabel1.textColor = subtitleLabelColor
        subLabel1.textAlignment = .left
        self.view1.addSubview(subLabel1)
        
        let label2 = UILabel()
        label2.frame = CGRect(x: xValue, y: yValue, width: self.frame.width - xValue * 2 , height: height)
        label2.text = view2State == .secondViewExpanded ? view2TitleTextEx : view2TitleTextCl
        label2.font = UIFont.systemFont(ofSize: titleFontSize)
        label2.textColor = titleLabelColor
        label2.textAlignment = .left
        self.view2.addSubview(label2)
        
        let subLabel2 = UILabel()
        subLabel2.frame = CGRect(x: xValue, y: yValue + height + spacing, width: self.frame.width - xValue * 2, height: height * 2)
        subLabel2.text = view2State == .secondViewExpanded ? view2SubTitleTextEx : view2SubTitleTextCl
        subLabel2.numberOfLines = 0
        subLabel2.font = UIFont.systemFont(ofSize: subtitltFontSize)
        subLabel2.textColor = subtitleLabelColor
        subLabel2.textAlignment = .left
        self.view2.addSubview(subLabel2)
        
        
        let label3 = UILabel()
        label3.frame = CGRect(x: xValue, y: yValue, width: self.frame.width - xValue * 2 , height: height)
        label3.text = view3State == .thirdViewExpanded ? view3TitleTextEx : view3SubTitleTextCl
        label3.font = UIFont.systemFont(ofSize: titleFontSize)
        label3.textColor = titleLabelColor
        label3.textAlignment = .left
        self.view3.addSubview(label3)
        
        let subLabel3 = UILabel()
        subLabel3.frame = CGRect(x: xValue, y: yValue + height + spacing, width: self.frame.width - xValue * 2, height: height * 2)
        subLabel3.text = view3State == .thirdViewExpanded ?  view3SubTitleTextEx : view3SubTitleTextCl
        subLabel3.numberOfLines = 0
        subLabel3.font = UIFont.systemFont(ofSize: subtitltFontSize)
        subLabel3.textColor = subtitleLabelColor
        subLabel3.textAlignment = .left
        self.view3.addSubview(subLabel3)
        
        
        let label = UILabel()
        label.frame = CGRect(x: xValue, y: yValue, width: self.frame.width - xValue * 2 , height: height)
        label.text = handleBottomBarLabelText(firstStateText: bottomViewFirstStateText, secondStateText: bottomViewSecondStateText, thirdStateText: bottomViewThirdStateText)
        label.font = UIFont.systemFont(ofSize: titleFontSize)
        label.textColor = titleLabelColor
        label.textAlignment = .center
        bottomView.addSubview(label)
        
        if stateNotHandled {
            let label = UILabel()
            label.frame = CGRect(x: xValue, y: yValue * 2, width: self.frame.width - xValue * 2 , height: height)
            label.text = "join CRED for full experience !" //I hope I join CRED too
            label.font = UIFont.systemFont(ofSize: subtitltFontSize)
            label.textColor = subtitleLabelColor
            label.textAlignment = .center
            bottomView.addSubview(label)
            stateNotHandled = false
        }
    }
    
}
/// Just added a custom function to convert hex string to UIColor
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

