//
//  Application.swift
//  Examples
//
//  Created by xuemincai on 16/7/16.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation

enum ApplicationType {
    
    case undefind
    case _500px
    case airbnb
    case appstore
    case camera
    case dropbox
    case facebook
    case fancy
    case foursquare
    case iCloud
    case instagram
    case iTunesConnect
    case kickstarter
    case path
    case pinterest
    case photos
    case podcasts
    case remote
    case safari
    case skype
    case slack
    case tumblr
    case twitter
    case videos
    case vesper
    case vine
    case whatsapp
    case WWDC
    
    init (_ string: String) {
        
        let initializers = ["500px": ApplicationType._500px,
                            "Airbnb": ApplicationType.airbnb,
                            "AppStore": ApplicationType.appstore,
                            "Camera": ApplicationType.camera,
                            "Dropbox": ApplicationType.dropbox,
                            "Facebook": ApplicationType.facebook,
                            "Fancy": ApplicationType.fancy,
                            "Foursquare": ApplicationType.foursquare,
                            "iCloud": ApplicationType.iCloud,
                            "Instagram": ApplicationType.instagram,
                            "iTunes Connect": ApplicationType.iTunesConnect,
                            "Kickstarter": ApplicationType.kickstarter,
                            "Path": ApplicationType.path,
                            "Pinterest": ApplicationType.pinterest,
                            "Photos": ApplicationType.photos,
                            "Podcasts": ApplicationType.podcasts,
                            "Remote": ApplicationType.remote,
                            "Safari": ApplicationType.safari,
                            "Skype": ApplicationType.skype,
                            "Slack": ApplicationType.slack,
                            "Tumblr": ApplicationType.tumblr,
                            "Twitter": ApplicationType.twitter,
                            "Videos": ApplicationType.videos,
                            "Vesper": ApplicationType.vesper,
                            "Vine": ApplicationType.vine,
                            "WhatsApp": ApplicationType.whatsapp,
                            "WWDC": ApplicationType.WWDC]
        
        self = initializers[string] ?? ApplicationType.undefind
        
    }
    
}


struct Application {
    
    
    var displayName = "" {
        willSet {
            
            self.iconName = "icon_\(displayName)".lowercased().replacingOccurrences(of: " ", with: "_")
            self.type = ApplicationType(self.displayName)
            
        }
    }
    
    var developerName = ""
    
    var identifier = ""
    var iconName = ""
    var type: ApplicationType
    
    init(dict: [String:AnyObject]) {
        
        self.displayName = dict["display_name"] as? String ?? ""
        self.developerName = dict["developer_name"] as? String ?? ""
        self.identifier = dict["identifier"] as? String ?? ""
        self.iconName = "icon_\(displayName)".lowercased().replacingOccurrences(of: " ", with: "_")
        self.type = ApplicationType(self.displayName)
        
    }
    
}
