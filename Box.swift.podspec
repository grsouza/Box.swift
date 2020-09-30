Pod::Spec.new do |spec|
  spec.name = "Box.swift"
  spec.version = "1.2.0"
  spec.summary = "Micro library for Swift that makes possible to transform any value type into a reference type.  "
  spec.homepage = "https://github.com/grsouza/Box.swift"
  spec.license = "Apache 2.0"
  spec.author = { "Guilherme Souza" => "ogrsouza@gmail.com" }
  
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  spec.swift_version = "5.0"

  spec.source = { :git => "https://github.com/grsouza/Box.swift.git", :tag => "#{spec.version}" }

  spec.source_files = "Sources/**/*"
end
