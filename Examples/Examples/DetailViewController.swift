//
//  DetailViewController.swift
//  Examples
//
//  Created by xuemincai on 16/7/12.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

extension ApplicationType {
    
    var navigationBarStyle: (barColor: UIColor, tintColor: UIColor, barstyle: UIStatusBarStyle) {
        
        get {
            
            switch self {
            case ._500px:
                return (#colorLiteral(red: 0.1411764706, green: 0.1411764706, blue: 0.1411764706, alpha: 1), #colorLiteral(red: 0.8431372549, green: 0.8431372549, blue: 0.8431372549, alpha: 1), .lightContent)
                
            case .airbnb:
                return (#colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1), #colorLiteral(red: 0.03137254902, green: 0.6823529412, blue: 1, alpha: 1), .default)
                
            case .camera:
                return (#colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3490196078, alpha: 1), #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1), .lightContent)
                
            case .dropbox:
                return (#colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1), #colorLiteral(red: 0, green: 0.4941176471, blue: 0.8980392157, alpha: 1), .default)
                
            case .facebook:
                return (#colorLiteral(red: 0.3137254902, green: 0.4274509804, blue: 0.6588235294, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), .lightContent)
                
            case .fancy:
                return (#colorLiteral(red: 0.2078431373, green: 0.231372549, blue: 0.2862745098, alpha: 1), #colorLiteral(red: 0.768627451, green: 0.7803921569, blue: 0.7960784314, alpha: 1), .lightContent)
                
            case .foursquare:
                return (#colorLiteral(red: 0, green: 0.6823529412, blue: 0.937254902, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), .lightContent)
                
            case .instagram:
                return (#colorLiteral(red: 0.1803921569, green: 0.368627451, blue: 0.5254901961, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), .lightContent)
                
            case .kickstarter:
                return (#colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9725490196, alpha: 1), #colorLiteral(red: 0.168627451, green: 0.8705882353, blue: 0.4509803922, alpha: 1), .default)
                
            case .path:
                return (#colorLiteral(red: 0.3294117647, green: 0.3098039216, blue: 0.2862745098, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 0.9490196078, alpha: 1), .lightContent)
                
            case .pinterest:
                return (#colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1), #colorLiteral(red: 0.7960784314, green: 0.1254901961, blue: 0.1529411765, alpha: 1), .default)
                
            case .slack:
                return (#colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.9647058824, alpha: 1), #colorLiteral(red: 0.2431372549, green: 0.7294117647, blue: 0.5725490196, alpha: 1), .default)
                
            case .skype:
                return (#colorLiteral(red: 0, green: 0.6862745098, blue: 0.9411764706, alpha: 1), #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1), .lightContent)
                
            case .tumblr:
                return (#colorLiteral(red: 0.1803921569, green: 0.2431372549, blue: 0.3254901961, alpha: 1), #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1), .lightContent)
                
            case .twitter:
                return (#colorLiteral(red: 0.3450980392, green: 0.6823529412, blue: 0.9411764706, alpha: 1), #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1), .lightContent)
                
            case .vesper:
                return (#colorLiteral(red: 0.368627451, green: 0.4901960784, blue: 0.6039215686, alpha: 1), #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1), .lightContent)
                
            case .videos:
                return (#colorLiteral(red: 0.2901960784, green: 0.2941176471, blue: 0.3019607843, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), .default)
                
            case .vine:
                return (#colorLiteral(red: 0, green: 0.7490196078, blue: 0.5607843137, alpha: 1), #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1), .default)
                
            case .WWDC:
                return (#colorLiteral(red: 0.9882352941, green: 0.3843137255, blue: 0.2745098039, alpha: 1), #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1), .default)
                
            default:
                return (#colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1), #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), .default)
            }
            
        }
    }
    
    var tableHeader: UIView {
        
        get {
            
            var imageName = ""
            
            if (self == .pinterest) {
                imageName = "header_pinterest"
            }
            
            if (self == .podcasts){
                imageName = "header_podcasts"
            }
            
            if (imageName != "") {
                
                let imageView = UIImageView(image: UIImage(named: imageName))
                
                return imageView
                
            }
            
            return UIView()
            
        }
        
    }
    
    var emptyDescription: AttributedString? {
        
        get {
            
            var text: String?
            var font: UIFont?
            var textColor: UIColor?
            
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .center
            paragraph.lineBreakMode = .byWordWrapping
            
            switch self {
            case ._500px:
                text = "Get started by uploading a photo."
                font = UIFont.boldSystemFont(ofSize: 15)
                textColor = #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.3294117647, alpha: 1)
                
            case .airbnb:
                text = "When you have messages, you’ll see them here."
                font = UIFont.systemFont(ofSize: 13)
                textColor = #colorLiteral(red: 0.8117647059, green: 0.8117647059, blue: 0.8117647059, alpha: 1)
                paragraph.lineSpacing = 4
                
            case .appstore:
                text = "There are no results for “wwdc2014”."
                font = UIFont.systemFont(ofSize: 14)
                textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
                
            case .camera:
                text = "This allows you to share photos from your library and save photos to your camera roll."
                font = UIFont.systemFont(ofSize: 14)
                textColor = #colorLiteral(red: 0.3725490196, green: 0.4117647059, blue: 0.4705882353, alpha: 1)
                
            case .dropbox:
                text = "Favorites are saved for offline access."
                font = UIFont.systemFont(ofSize: 14.5)
                textColor = #colorLiteral(red: 0.4823529412, green: 0.537254902, blue: 0.5803921569, alpha: 1)
                
            case .fancy:
                text = "Tap Add to List and add things to Owns"
                font = UIFont.systemFont(ofSize: 13)
                textColor = #colorLiteral(red: 0.4784313725, green: 0.4901960784, blue: 0.5137254902, alpha: 1)
                
            case .foursquare:
                text = "Nobody has liked or commented on your check-ins yet."
                font = UIFont.systemFont(ofSize: 14)
                textColor = #colorLiteral(red: 0.8078431373, green: 0.7960784314, blue: 0.7764705882, alpha: 1)
                
            case .iCloud:
                text = "Share photos and videos with just the people you choose, and let them add photos, videos, and comments."
                paragraph.lineSpacing = 2
                
            case .instagram:
                text = "Send photos and videos directly to your friends. Only the people you send to can see these posts."
                font = UIFont.systemFont(ofSize: 16)
                textColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
                paragraph.lineSpacing = 4
                
            case .iTunesConnect:
                text = "To add a favorite, tap the star icon next to an App's name."
                font = UIFont.systemFont(ofSize: 14)
                
            case .kickstarter:
                text = "When you back a project or follow a friend, their activity will show up here."
                font = UIFont.systemFont(ofSize: 14)
                textColor = #colorLiteral(red: 0.5098039216, green: 0.5215686275, blue: 0.5294117647, alpha: 1)
                
            case .path:
                text = "Send a message or create a group."
                font = UIFont.systemFont(ofSize: 14)
                textColor = #colorLiteral(red: 0.6509803922, green: 0.5921568627, blue: 0.5529411765, alpha: 1)
                
            case .photos:
                text = "You can sync photos and videos onto your iPhone using iTunes."
                
            case .podcasts:
                text = "You can subscribe to podcasts in Top Charts or Featured."
                
            case .remote:
                text = "You must connect to a Wi-Fi network to control iTunes or Apple TV"
                font = UIFont(name: "HelveticaNeue-Medium", size: 11.75)
                textColor = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
                
            case .safari:
                text = "Safari cannot open the page because your iPhone is not connected to the Internet."
                textColor = #colorLiteral(red: 0.4901960784, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
                paragraph.lineSpacing = 2
                
            case .skype:
                text = "Keep all your favorite people together, add favorites."
                font = UIFont(name: "HelveticaNeue-Light", size: 17.75)
                textColor = #colorLiteral(red: 0.6509803922, green: 0.7647058824, blue: 0.8196078431, alpha: 1)
                paragraph.lineSpacing = 3
                
            case .slack:
                text = "You don't have any recent mentions"
                font = UIFont(name: "Lato-Regular", size: 19)
                textColor = #colorLiteral(red: 0.8431372549, green: 0.8431372549, blue: 0.8431372549, alpha: 1)
                
            case .tumblr:
                text = "When you follow some blogs, their latest posts will show up here!"
                font = UIFont.systemFont(ofSize: 17)
                textColor = #colorLiteral(red: 0.5098039216, green: 0.5568627451, blue: 0.6117647059, alpha: 1)
                
            case .twitter:
                text = "You aren’t subscribed to any lists yet."
                font = UIFont.systemFont(ofSize: 12)
                textColor = #colorLiteral(red: 0.5333333333, green: 0.6, blue: 0.6509803922, alpha: 1)
                
            case .videos:
                text = "This video is playing on “Apple TV”."
                font = UIFont.systemFont(ofSize: 12)
                textColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
                
            case .vine:
                text = "This is where your private conversations will live"
                font = UIFont.systemFont(ofSize: 17)
                textColor = #colorLiteral(red: 0.6509803922, green: 0.6509803922, blue: 0.6509803922, alpha: 1)
                
            case .whatsapp:
                text = "You can exchange media with Ignacio by tapping on the Arrow Up icon in the conversation screen."
                font = UIFont.systemFont(ofSize: 15)
                textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
                
            case .WWDC:
                text = "Favorites are only available to Registered Apple Developers."
                font = UIFont.systemFont(ofSize: 16)
                textColor = #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1)
                
            default:
                return nil
            }
            
            guard let newText = text else {
                return nil
            }
            
            var attributes: [String: AnyObject] = [:]
            if let newFont = font { attributes[NSFontAttributeName] = newFont }
            if let newTextColor = textColor { attributes[NSForegroundColorAttributeName] = newTextColor }
            attributes[NSParagraphStyleAttributeName] = paragraph
            
            let attributedString =  NSMutableAttributedString(string: newText, attributes: attributes)
            
            if self == .skype {
                
                let range = (attributedString.string as NSString).range(of: "add favorites")
                attributedString.addAttributes([NSForegroundColorAttributeName: #colorLiteral(red: 0, green: 0.6784313725, blue: 0.9450980392, alpha: 1)], range: range)
            }
            
            return attributedString
            
        }
        
    }
    
    
    var emptyTitle: AttributedString? {
        
        get {
            
            var text: String?
            var font: UIFont?
            var textColor: UIColor?
            
            var attributes: [String: AnyObject] = [:]
            
            switch self {
            case ._500px:
                text = "No Photos"
                font = UIFont.boldSystemFont(ofSize: 17)
                textColor = #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.3294117647, alpha: 1)
                
            case .airbnb:
                text = "No Messages"
                font = UIFont(name: "", size: 22)
                textColor = #colorLiteral(red: 0.7882352941, green: 0.7882352941, blue: 0.7882352941, alpha: 1)
                
            case .camera:
                text = "Please Allow Photo Access"
                font = UIFont.boldSystemFont(ofSize: 18)
                textColor = #colorLiteral(red: 0.3725490196, green: 0.4117647059, blue: 0.4705882353, alpha: 1)
                
            case .dropbox:
                text = "Star Your Favorite Files"
                font = UIFont.boldSystemFont(ofSize: 17)
                textColor = #colorLiteral(red: 0.1450980392, green: 0.1568627451, blue: 0.168627451, alpha: 1)
                
            case .facebook:
                text = "No friends to show."
                font = UIFont.boldSystemFont(ofSize: 22)
                textColor = #colorLiteral(red: 0.6745098039, green: 0.6862745098, blue: 0.7411764706, alpha: 1)
                
                let shadow = NSShadow()
                shadow.shadowColor = UIColor.white()
                shadow.shadowOffset = CGSize(width: 0, height: 1)
                attributes[NSShadowAttributeName] = shadow
                
            case .fancy:
                text = "No Owns yet"
                font = UIFont.boldSystemFont(ofSize: 14)
                textColor = #colorLiteral(red: 0.2862745098, green: 0.2980392157, blue: 0.3254901961, alpha: 1)
                
            case .iCloud:
                text = "iCloud Photo Sharing"
                
            case .instagram:
                text = "Instagram Direct"
                font = UIFont(name: "", size: 26)
                textColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
                
            case .iTunesConnect:
                text = "No Favorites"
                font = UIFont.systemFont(ofSize: 22)
                
            case .kickstarter:
                text = "Activity empty"
                font = UIFont.boldSystemFont(ofSize: 16)
                textColor = #colorLiteral(red: 0.5098039216, green: 0.5215686275, blue: 0.5294117647, alpha: 1)
                attributes[NSKernAttributeName] = -0.1
                
            case .path:
                text = "Message Your Friends"
                font = UIFont.boldSystemFont(ofSize: 14)
                textColor = UIColor.white()
                
            case .pinterest:
                text = "No boards to display"
                font = UIFont.boldSystemFont(ofSize: 18)
                textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                
            case .photos:
                text = "No Photos or Videos"
                
            case .podcasts:
                text = "No Podcasts"
                
            case .remote:
                text = "Cannot Connect to a Local Network"
                font = UIFont(name: "HelveticaNeue-Medium", size: 18)
                textColor = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
                
            case .tumblr:
                text = "This is your Dashboard."
                font = UIFont.boldSystemFont(ofSize: 18)
                textColor = #colorLiteral(red: 0.6666666667, green: 0.7137254902, blue: 0.768627451, alpha: 1)
                
            case .twitter:
                text = "No lists"
                font = UIFont.boldSystemFont(ofSize: 14)
                textColor = #colorLiteral(red: 0.1607843137, green: 0.1843137255, blue: 0.2, alpha: 1)
                
            case .vesper:
                text = "No Notes"
                font = UIFont(name: "IdealSans-Book-Pro", size: 16)
                textColor = #colorLiteral(red: 0.8509803922, green: 0.862745098, blue: 0.8823529412, alpha: 1)
                
            case .videos:
                text = "AirPlay"
                font = UIFont.systemFont(ofSize: 17)
                textColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
                
            case .vine:
                text = "Welcome to VMs"
                font = UIFont.boldSystemFont(ofSize: 22)
                textColor = #colorLiteral(red: 0.3490196078, green: 0.3490196078, blue: 0.3490196078, alpha: 1)
                attributes[NSKernAttributeName] = 0.45
                
            case .whatsapp:
                text = "No Media"
                font = UIFont.systemFont(ofSize: 20)
                textColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
                
            case .WWDC:
                text = "No Favorites"
                font = UIFont(name: "HelveticaNeue-Medium", size: 16)
                textColor = #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1)
                
            default:
                return nil
            }
            
            guard let newText = text else {
                return nil
            }
            
            if let newFont = font {
                attributes[NSFontAttributeName] = newFont
            }
            
            if let newTextColor = textColor {
                attributes[NSForegroundColorAttributeName] = newTextColor
            }
            
            return AttributedString(string: newText, attributes: attributes)
            
        }
        
    }
    
    var emptyBackgroundColor: UIColor? {
        
        get {
            
            switch self {
            case ._500px:
                return UIColor.black()
                
            case .instagram, .slack, .videos:
                return UIColor.white()
                
            case .dropbox:
                return #colorLiteral(red: 0.9411764706, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
                
            case .facebook:
                return #colorLiteral(red: 0.9254901961, green: 0.9333333333, blue: 0.968627451, alpha: 1)
                
            case .fancy:
                return #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
                
            case .foursquare:
                return #colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9803921569, alpha: 1)
                
            case .kickstarter:
                return #colorLiteral(red: 0.968627451, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
                
            case .path:
                return #colorLiteral(red: 0.4470588235, green: 0.4274509804, blue: 0.4039215686, alpha: 1)
                
            case .pinterest:
                return #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1)
                
            case .tumblr:
                return #colorLiteral(red: 0.2039215686, green: 0.2745098039, blue: 0.3607843137, alpha: 1)
                
            case .twitter:
                return #colorLiteral(red: 0.9607843137, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
                
            case .vesper:
                return #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
                
            case .whatsapp:
                return #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
                
            default:
                return nil
            }
            
        }
        
    }
    
    var emptySpaceHeight: CGFloat {
        
        get {
            
            switch self {
            case ._500px, .foursquare, .iTunesConnect:
                return 9
                
            case .airbnb, .instagram:
                return 24
                
            case .appstore:
                return 34
                
            case .facebook:
                return 30
                
            case .fancy, .path:
                return 1
                
            case .kickstarter:
                return 15
                
            case .podcasts:
                return 35
                
            case .tumblr:
                return 10
                
            case .twitter:
                return 22
                
            case .vesper, .vine:
                return 0.1
                
            case .WWDC:
                return 18
                
            default:
                return 0
            }
            
        }
        
    }
    
    func emptyButtonTitle(_ state: UIControlState) -> AttributedString? {
        
        var text: String? = nil
        var font: UIFont? = nil
        var textColor: UIColor? = nil
        
        switch self {
        case .airbnb:
            text = "Start Browsing"
            font = UIFont.boldSystemFont(ofSize: 16)
            textColor = (state == .normal ? #colorLiteral(red: 0.01960784314, green: 0.6784313725, blue: 1, alpha: 1) : #colorLiteral(red: 0.4196078431, green: 0.8078431373, blue: 1, alpha: 1))
            
        case .camera:
            text = "Continue"
            font = UIFont.boldSystemFont(ofSize: 17)
            textColor = (state == .normal ? #colorLiteral(red: 0, green: 0.4941176471, blue: 0.8980392157, alpha: 1) : #colorLiteral(red: 0.2823529412, green: 0.631372549, blue: 0.9176470588, alpha: 1))
            
        case .dropbox:
            text = "Learn more"
            font = UIFont.systemFont(ofSize: 15)
            textColor = (state == .normal ? #colorLiteral(red: 0, green: 0.4941176471, blue: 0.8980392157, alpha: 1) : #colorLiteral(red: 0.2823529412, green: 0.631372549, blue: 0.9176470588, alpha: 1))
            
        case .foursquare:
            text = "Add friends to get started!"
            font = UIFont.boldSystemFont(ofSize: 14)
            textColor = (state == .normal ? #colorLiteral(red: 0, green: 0.6823529412, blue: 0.937254902, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            
        case .iCloud:
            text = "Create New Stream"
            font = UIFont.systemFont(ofSize: 14)
            textColor = (state == .normal ? #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1) : #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1))
            
        case .kickstarter:
            text = "Discover projects"
            font = UIFont.boldSystemFont(ofSize: 14)
            textColor = UIColor.white()
            
        case .WWDC:
            text = "Sign In"
            font = UIFont.systemFont(ofSize: 16)
            textColor = (state == .normal ? #colorLiteral(red: 0.9882352941, green: 0.3843137255, blue: 0.2745098039, alpha: 1) : #colorLiteral(red: 0.9921568627, green: 0.7333333333, blue: 0.6980392157, alpha: 1))
            
        default:
            return nil
        }
        
        guard let newText = text else {
            return nil
        }
        
        var attributes: [String: AnyObject] = [:]
        if let newFont = font {
            attributes[NSFontAttributeName] = newFont
        }
        
        if let newTextColor = textColor {
            attributes[NSForegroundColorAttributeName] = newTextColor
        }
        
        return AttributedString(string: newText, attributes: attributes)
        
    }
    
    
}

class DetailViewController: UITableViewController, EmptyDelegate, EmptyDataSource {
    
    var application: Application
    
    
    init(application: Application) {
        
        self.application = application
        
        super.init(style: .plain)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureHeaderAndFooter()
        configureTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureNavigationBar() {
        
        self.navigationController?.navigationBar.barTintColor = application.type.navigationBarStyle.barColor
        self.navigationController?.navigationBar.tintColor = application.type.navigationBarStyle.tintColor
        
        UIApplication.shared().setStatusBarStyle(application.type.navigationBarStyle.barstyle, animated: true)
        
        if let logo = UIImage(named: "logo_\(self.application.displayName.lowercased())") {
            self.navigationItem.titleView = UIImageView(image: logo)
        } else {
            self.navigationItem.title = self.application.displayName
        }
        
    }
    
    func configureHeaderAndFooter() {
        
        self.tableView.tableHeaderView = self.application.type.tableHeader
        self.tableView.tableFooterView = UIView()
        
    }
    
    func configureTableView() {
        
        self.tableView.dzn_emptyDelegate = self
        self.tableView.dzn_emptyDataSource = self
        
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // MARK: - EmptyDataSource
    func description(emptyView scrollView: UIScrollView) -> AttributedString? {
        return self.application.type.emptyDescription
    }
    
    func title(emptyView scrollView: UIScrollView) -> AttributedString? {
        return self.application.type.emptyTitle
    }
    
    func image(emptyView scrollView: UIScrollView) -> UIImage? {
       
        return UIImage(named: "placeholder_\(self.application.displayName)".lowercased().replacingOccurrences(of: " ", with: "_"))
        
    }
    
    func backgroundColor(emptyView scrollView: UIScrollView) -> UIColor? {
        return self.application.type.emptyBackgroundColor
    }
    
    func verticalOffset(emptyView scrollView: UIScrollView) -> CGFloat {
        
        if self.application.type == .kickstarter {
            return UIApplication.shared().statusBarFrame.height + (self.navigationController?.navigationBar.frame.height ?? 0)
        }
        
        if self.application.type == .twitter {
            return -(CGFloat)(roundf(Float(self.tableView.frame.size.height/2.5)))
        }

        return 0
        
    }
    
    func spaceHeight(emptyView scrollView: UIScrollView) -> CGFloat {
        return self.application.type.emptySpaceHeight
    }
    
    func buttonTitle(emptyView scrollView: UIScrollView, state: UIControlState) -> AttributedString? {
        return application.type.emptyButtonTitle(state)
    }
    
    func buttonBackgroundImage(emptyView scrollView: UIScrollView, forState state: UIControlState) -> UIImage? {
        
        var imageName = "button_background_\(self.application.displayName.lowercased())"
        
        if state == .normal {
            imageName += "_normal"
        }
        
        if state == .highlighted {
            imageName += "_highlight"
        }
        
        var capInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        var rectInsets = UIEdgeInsetsZero
        
        switch self.application.type {
        case .foursquare:
            capInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
            rectInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            
        case .iCloud:
            rectInsets = UIEdgeInsets(top: -19, left: -61, bottom: -19, right: -61)
            
        case .kickstarter:
            capInsets = UIEdgeInsets(top: 22, left: 22, bottom: 22, right: 22)
            rectInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: -20)
            
        default:
            break
        }
        
        return UIImage(named: imageName)?.resizableImage(withCapInsets: capInsets, resizingMode: .stretch).withAlignmentRectInsets(rectInsets)
        
    }


}

