#
#  Be sure to run `pod spec lint DZNEmptyDataSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "DZNEmptyDataSwift"
  s.version      = "0.2.0"
  s.summary      = "这是一个用于UITableView&UICollectionView空数据时，设置显示空数据提示。swift版本的DZNEmptyDataSet。"
  s.description  = "这个库只需要简单的配置，就能自动的在空数据时加载加配置的视图显示。"
  s.homepage     = "https://github.com/bay2/DZNEmptyDataSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "sim" => "sim_cai@icloud.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/bay2/DZNEmptyDataSwift.git", :tag => "#{s.version}" }
  s.source_files  = "DZNEmptyDataSwift/*.swift"
  s.framework  = "UIKit"
  s.requires_arc = true
end
