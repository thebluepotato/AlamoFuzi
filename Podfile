use_frameworks!

def common_pods
    pod 'Alamofire', '~> 4.0'
    pod 'Fuzi', '~> 2.0'
end

target 'AlamoFuzi-iOS' do
    platform :ios, '8.0'
    common_pods
end

target 'AlamoFuzi-OSX' do
    platform :osx, '10.10'
    common_pods
end

target 'AlamoFuzi-watchOS' do
    platform :watchos, '2.0'
    common_pods
end

target 'AlamoFuzi-tvOS' do
    platform :tvos, '9.0'
    common_pods
end

target 'AlamoFuziTests' do
    platform :ios, '9.0'
    pod 'AlamoFuzi'
end
