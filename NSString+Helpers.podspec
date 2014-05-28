Pod::Spec.new do |s|
  s.name             	  = "NSString+Helpers"
  s.version          	  = "0.1.1"
  s.summary          	  = "A category on NSString for validation and manipulation."
  s.description      	  = "A category on NSString that extends main class by adding methods for string's validation and manipulation."
  s.homepage         	  = "https://github.com/Bogdan-Stasjuk/NSString-Helpers"
  s.license      		    = { :type => 'MIT', :file => 'LICENSE' }
  s.author           	  = { "Bogdan Stasjuk" => "Bogdan.Stasjuk@gmail.com" }
  s.source           	  = { :git => "https://github.com/Bogdan-Stasjuk/NSString-Helpers.git", :tag => '0.1.1' }
  s.social_media_url 	  = 'https://twitter.com/Bogdan_Stasjuk'
  s.platform     		    = :ios, '6.0'
  s.requires_arc 	      = true
  s.source_files 	      = 'NSString+Helpers/*.{h,m}'
  s.public_header_files = 'NSString+Helpers/*.h'
end
