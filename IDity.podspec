Pod::Spec.new do |s|
  s.name             = 'IDity'
  s.version          = '1.0.0'
  s.summary          = 'IDity for iOS'
  s.description      = 'Detailed description of your SDK'
  s.homepage         = 'https://github.com'
  s.license          = { :type => 'MIT' }
  s.author           = { 'You' => 'mhammoud85@hotmail.com' }

  s.platform         = :ios, '15.0'

  s.source           = {
    :http => 'https://github.com/mhammoud85/IDity-iOS/blob/main/IDity.xcframework.zip'
  }

  s.vendored_frameworks = 'IDity.xcframework'
end
