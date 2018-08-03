#
# Be sure to run `pod lib lint JKUBS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JKUBS'
  s.version          = '0.1.4.2'
  s.summary          = 'this is a User Behavior Statistics tool. it can help you know user\'s behavior then adjust your app.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
this is a User Behavior Statistics tool. it can help you know user\'s behavior then adjust your app. ...
                       DESC

  s.homepage         = 'https://github.com/xindizhiyin2014/JKUBS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HHL110120' => '929097264@qq.com' }
  s.source           = { :git => 'https://github.com/xindizhiyin2014/JKUBS.git', :tag => s.version.to_s }
  s.social_media_url = 'http://blog.csdn.net/hanhailong18'

  s.ios.deployment_target = '7.0'

  s.source_files = 'JKUBS/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JKUBS' => ['JKUBS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'JKUBSAspects'
end
