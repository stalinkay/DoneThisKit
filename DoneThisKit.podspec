Pod::Spec.new do |s|
  s.name             = 'DoneThisKit'
  s.version          = '0.0.19'
  s.summary          = 'Swift client for iDoneThis API.'
  s.description      = <<-DESC
Swift client for iDoneThis API
                       DESC
  s.homepage         = 'https://github.com/carambalabs/DoneThisKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pedro Piñera' => 'pepibumur@gmail.com', 'Sergi Gracia' => 'sergigram@gmail.com', 'Isaac Roldán' => "isaac.roldan@gmail.com" }
  s.source           = { :git => 'https://github.com/carambalabs/DoneThisKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'DoneThisKit/Classes/**/*'
  
  s.ios.deployment_target = '8.0'
  # s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
  s.dependency 'CarambaKit/Networking', '~> 0.0'
  s.dependency 'SwiftyJSON', '~> 2.3'
end
