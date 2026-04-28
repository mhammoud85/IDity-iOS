Pod::Spec.new do |s|
  s.name             = 'IDity'
  s.version          = '1.0.0'
  s.summary          = 'Advanced identity verification and face recognition SDK.'
  s.homepage         = 'https://football-lebanon.com'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Mohamad Hammoud' => 'mhammoud85@hotmail.com' }
  s.source           = { :git => 'https://github.com/mhammoud85/IDity-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.6'
  s.swift_version = '5.0'

  s.vendored_frameworks = 'IDity.xcframework'
  s.static_framework = false

  s.pod_target_xcconfig = { 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'OTHER_LDFLAGS' => '-framework "IDity"'
  }
  
  s.user_target_xcconfig = { 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' 
  }

  s.frameworks = 'UIKit', 'Vision', 'CoreMedia'
end
