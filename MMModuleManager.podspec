#
# Be sure to run `pod lib lint MMModuleManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MMModuleManager'
  s.version          = '0.1.0'
  s.summary          = 'MMModuleManager is an iOS ModuleManager.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS 简单易用的模块管理组件
                       DESC

  s.homepage         = 'https://github.com/Mosquito1123/MMModuleManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mosquito1123' => 'winston.zhangwentong@gmail.com' }
  s.source           = { :git => 'https://github.com/Mosquito1123/MMModuleManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MMModuleManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MMModuleManager' => ['MMModuleManager/Assets/*.png']
  # }

   s.public_header_files = 'MMModuleManager/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
