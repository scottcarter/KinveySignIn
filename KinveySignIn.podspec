

Pod::Spec.new do |spec|
  spec.name         = 'KinveySignIn'
  spec.version      = '1.0.0'
  spec.platform     = :ios, '8.1'
  spec.license      =  { :type => 'Apache License, Version 2.0', :file => 'LICENSE.txt' }

  spec.homepage         = 'https://github.com/scottcarter/KinveySignIn'
  spec.authors          = 'Scott Carter' 
  spec.summary          = 'Kinvey SignIn'

  spec.source = { :git => "https://github.com/scottcarter/KinveySignIn.git", :tag => "v1.0.0" }

  spec.source_files  = 'KinveySignIn/**/*.{h,m}'

  spec.resources = 'KinveySignIn/Button Widgets/resources/*.png', 'KinveySignIn/doc/assets/*.png', 'KinveySignIn/iOS-UI-Utils/doc/*.png', 'KinveySignIn/Sign-In/resources/*.png'

  spec.requires_arc     = true

  spec.dependency 'KinveyKit', '1.27.1'
  spec.dependency 'Facebook-iOS-SDK', '3.20.0'


end

