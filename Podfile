use_frameworks!

def common_pods
    pod 'Alamofire', '~> 5.0.0-beta'
    pod 'Fuzi', '~> 3.0'
end

target 'AlamoFuzi-iOS' do
    platform :ios, '10.0'
    common_pods
end

target 'AlamoFuzi-OSX' do
    platform :osx, '10.12'
    common_pods
end

target 'AlamoFuzi-watchOS' do
    platform :watchos, '3.0'
    common_pods
end

target 'AlamoFuzi-tvOS' do
    platform :tvos, '10.0'
    common_pods
end

target 'AlamoFuziTests' do
    platform :ios, '10.0'
    #pod 'AlamoFuzi'
    pod 'AlamoFuzi', :git => 'https://github.com/thebluepotato/AlamoFuzi.git', :branch => 'master'
end
