Pod::Spec.new do |s|
    s.name         = "AlamoFuzi"
    s.version      = "1.0.0"
    s.summary      = "XML/HTML response handlers for Alamofire using Fuzi"
    s.homepage     = "https://github.com/thebluepotato/AlamoFuzi"
    s.license      = "MIT"
    s.author       = { "Jonas Zaugg" => "jonas.zaugg@yahoo.com" }
    s.source       = { :git => "https://github.com/thebluepotato/AlamoFuzi.git", :tag => s.version }

    s.ios.deployment_target = "9.0"
    s.osx.deployment_target = "10.11"
    s.tvos.deployment_target = "9.0"
    s.watchos.deployment_target = "2.0"
    
    s.source_files = "Sources/*.swift"
    s.dependency     "Alamofire", "~> 4.0"
    s.dependency     "Fuzi", "~> 1.0"

    # Required for linting
    s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }

end
