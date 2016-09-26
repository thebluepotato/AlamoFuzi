Pod::Spec.new do |s|
    s.name         = "AlamoFuzi"
    s.version      = "1.0.0.beta1"
    s.summary      = "Fuzi support for Alamofire"
    s.homepage     = "https://github.com/thebluepotato/AlamoFuzi"
    s.license      = "MIT"
    s.author       = { "Jonas Zaugg" => "jonas.zaugg@yahoo.com" }
    s.platform     = :ios, "9.0"
    s.source       = { :git => "https://github.com/thebluepotato/AlamoFuzi.git", :branch => "master" }
    s.source_files = "AlamoFuzi/*.swift"
    s.dependency     "Alamofire", "~> 4.0"
end
