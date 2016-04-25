
Pod::Spec.new do |s|

s.name         = "AXCircularProgressView"
s.version      = "0.0.1"
s.summary      = "AXCircularProgressView."
s.description  = <<-DESC
https://github.com/devedbox/AXCircularProgressView
               DESC

s.homepage     = "https://github.com/devedbox/AXCircularProgressView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  #s.license      = "MIT (example)"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "aiXing" => "862099730@qq.com" }
  # Or just: s.author    = "aiXing"
  # s.authors            = { "aiXing" => "862099730@qq.com" }
  # s.social_media_url   = "http://twitter.com/aiXing"
  # s.platform     = :ios
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"
s.source       = { :git => "https://github.com/devedbox/AXCircularProgressView.git", :tag => "0.0.1" }
s.source_files  = "AXCircularProgressView/AXCircularProgressView/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
end
