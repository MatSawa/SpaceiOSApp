platform :ios, '11.0'
inhibit_all_warnings!

def rx_swift
  pod 'RxSwift', '5.1.1'
end

def realm
  pod 'RealmSwift', '10.4.0'
  pod 'RxRealm', '4.0.2'
end

def test_pods
  pod 'RxTest'
  pod 'RxBlocking'
  pod 'Nimble'
end

def material
  pod 'MaterialComponents/Cards', '119.2.0';
end

target 'NetworkPlatform' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  pod 'RxAlamofire', '5.7.1'
  pod 'Alamofire', '5.4.0'
  
  target 'NetworkPlatformTests' do
    inherit! :search_paths
    test_pods
  end
end

target 'DatabasePlatform' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  realm
  
  target 'DatabasePlatformTests' do
    inherit! :search_paths
    test_pods
  end
end

target 'Domain' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  realm
  
  target 'DomainTests' do
    inherit! :search_paths
    test_pods
  end
end

target 'Space' do
  use_frameworks!
  rx_swift
  material
  pod 'Swinject', '2.7.1'
  pod 'RxCocoa', '5.1.1'
  pod 'SnapKit', '5.0.1'
  pod 'R.swift', '5.3.0'
  pod 'SwiftLint', '0.41.0'
  pod 'Kingfisher', '5.15.8'
  pod 'SwiftDate', '6.3.1'
  
  target 'SpaceTests' do
    inherit! :search_paths
  end
end
