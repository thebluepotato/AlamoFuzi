Pod::Spec.new do |s|
    s.name         = "AlamoFuzi"
    s.version      = "3.0.0"
    s.summary      = "XML/HTML response handlers for Alamofire using Fuzi"
    s.homepage     = "https://github.com/thebluepotato/AlamoFuzi"
    s.license      = "MIT"
    s.author       = { "Jonas Zaugg" => "jonas.zaugg@yahoo.com" }
    s.source       = { :git => "https://github.com/thebluepotato/AlamoFuzi.git", :tag => s.version }
    # s.documentation_url = 'http://thebluepotato.github.io/AlamoFuzi'

    s.ios.deployment_target = "10.0"
    s.osx.deployment_target = "10.12"
    s.tvos.deployment_target = "10.0"
    s.watchos.deployment_target = "3.0"
    
    s.source_files = "Sources/*.swift"
    s.dependency     "Alamofire", "~> 5.0.0-beta"
    s.dependency     "Fuzi", "~> 3.0"

    s.swift_version = "5.0"

    # Required for linting
    s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }

end
