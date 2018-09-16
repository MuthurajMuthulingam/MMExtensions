#
# Be sure to run `pod lib lint MMExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MMExtensions'
  s.version          = '0.0.3'
  s.summary          = 'A common extensions written on standard classes for Standard iOS applications written using Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A common extensions written on standard classes for Standard iOS applications written using Swift. One stop for all your extension needs on standard classes'

  s.homepage         = 'https://github.com/MuthurajMuthulingam/MMExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Muthuraj Muthulingam' => 'muthurajmuthulingam@gmail.com' }
  s.source           = { :git => 'https://github.com/MuthurajMuthulingam/MMExtensions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source_files = 'MMExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MMExtensions' => ['MMExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
