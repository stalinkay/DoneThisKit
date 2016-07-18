Pod::Spec.new do |s|
  s.name             = 'DoneThisKit'
  s.version          = '0.0.1'
  s.summary          = 'Swift client for iDoneThis API.'
  s.description      = <<-DESC
Swift client for iDoneThis API
                       DESC
  s.homepage         = 'https://github.com/tulapps/DoneThisKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pedro Piñera' => 'pepibumur@gmail.com', 'Sergi Gracia' => 'sergigram@gmail.com', 'Isaac Roldán' => "isaac.roldan@gmail.com" }
  s.source           = { :git => 'https://github.com/tulapps/DoneThisKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'DoneThisKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DoneThisKit' => ['DoneThisKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
