Pod::Spec.new do |s|
  s.name     = 'HCMCacheManager'
  s.version  = '0.0.1'
  s.license  =  { :type => "MIT", :file => "LICENSE" }
  s.summary  = 'for supconit hcmobile development'
  s.description  = '缓存管理' 
  s.homepage = 'https://github.com/LionBuer/HCMCacheManager'
  s.author   = {"徐畅"=>"yb_xuchang@163.com"}
  s.social_media_url = "https://github.com/LionBuer"

  s.source   = { :git => 'https://github.com/LionBuer/HCMCacheManager.git' , :tag => "v#{s.version}"}

  s.source_files = '*.{h,m}'

  s.ios.frameworks = 'Foundation', 'UIKit'

  s.ios.deployment_target = '8.0'
  
  s.requires_arc = true
	
end

