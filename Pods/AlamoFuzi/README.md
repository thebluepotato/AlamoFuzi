# AlamoFuzi

[![Build Status](https://api.travis-ci.org/thebluepotato/AlamoFuzi.svg)](https://travis-ci.org/thebluepotato/AlamoFuzi)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/AlamoFuzi.svg)](https://cocoapods.org/pods/AlamoFuzi)
[![License](https://img.shields.io/cocoapods/l/AlamoFuzi.svg?style=flat&color=gray)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/cocoapods/p/AlamoFuzi.svg?style=flat)](http://thebluepotato.github.io/AlamoFuzi/)

**XML/HTML response handlers for Alamofire using Fuzi**

AlamoFuzi adds `.responseXML()` and `.responseHTML()` response handlers to [Alamofire](https://github.com/Alamofire/Alamofire)'s `DataRequest` class. Both document types are serialized using [Fuzi](https://github.com/cezheng/Fuzi), the preferred way to parse XML/HTML in Swift.


## Requirements

- iOS 9.0+ / Mac OS X 10.11+
- Xcode 8.0+
- Dependencies are automatically added using CocoaPods: Alamofire 4.0+, Fuzi 1.0+


## Installation

The easiest way to add AlamoFuzi to your project is to use CocoaPods.

### Using [CocoaPods](http://cocoapods.org/)
You can use [CocoaPods](http://cocoapods.org/) to install AlamoFuzi by adding it to your to your `Podfile`:

```ruby
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
pod 'AlamoFuzi', '~> 1.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Manually
Simply add `AlamoFuzi.Swift` to your project. Please note that Fuzi and Alamofire must be integrated to your project.

##Usage example
```swift
import Alamofire
import AlamoFuzi

Alamofire.request("http://example.org/").responseHTML { response in
    switch response.result {
    case .failure(let error):
        debugPrint("Error: \(error)")
        debugPrint(response)
    case .success(let document):
        // Parsing the HTML data
        if let example = document.firstChild(css: "div > p") {
            print(example.stringValue)
        }
    }
}
```

Please note that you need `import Alamofire` or `import Fuzi` if you're using any of their types or classes explicitly. In the example above, we do not explicitly use any types defined by Fuzi (e.g. `HTMLDocument`) so we don't have to import it separately.

[Full documentation here](http://thebluepotato.github.io/AlamoFuzi)

## License

AlamoFuzi is released under the MIT license. See [LICENSE](LICENSE) for details.
