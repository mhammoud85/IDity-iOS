Pod::Spec.new do |s|
  s.name             = 'IDity'
  s.version          = '1.0.0'
  s.summary          = 'Public SDK for IDity Identity Verification.'
  s.homepage         = 'https://football-lebanon.com' # Your public site
  s.license          = { :type => 'MIT' }
  s.author           = { 'Mohamad Hammoud' => 'mhammoud85@hotmail.com' }

  # POINT TO THE HOSTED ZIP FILE
  s.source           = { 
    :http => 'https://github.com/mhammoud85/IDity-iOS/releases/download/1.0.0/IDity.xcframework.zip' 
  }

  s.ios.deployment_target = '15.6'
  
  # Tell CocoaPods to use the framework inside the downloaded zip
  s.vendored_frameworks = 'IDity.xcframework'
  
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
