Pod::Spec.new do |spec|
  spec.name         = "XHMvpFrameWork"
  spec.version      = "0.0.1"
  spec.license      = "MIT"
  spec.summary      = "XHMvpFrameWork is a MVP"
  spec.homepage     = "https://github.com/arvinhuanzi/XHMvpFrameWork"
  spec.author             = { "huan" => "arvinhuanzi@163.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/arvinhuanzi/XHMvpFrameWork.git", :tag => "0.0.1" }
  spec.requires_arc = true

  spec.source_files  = "XHMvpFrameWork"
  spec.public_header_files = "XHMvpFrameWork/AppDelegate.h"
  

end
