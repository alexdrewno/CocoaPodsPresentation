# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'CocoaPodsPresentation' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'FoldingCell’, '~> 2.0.3' 

  # Pods for CocoaPodsPresentation

	
  target 'CocoaPodsPresentationTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CocoaPodsPresentationUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end