# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-ppbuild/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-ppbuild'
  spec.version       = CocoapodsPpbuild::VERSION
  spec.authors       = ['彭懂']
  spec.email         = ['pengdong2014@xiaochuankeji.cn']
  spec.description   = %q{工程静态库编译，提高编译速度.}
  spec.summary       = %q{工程静态库编译，提高编译速度.}
  spec.homepage      = 'https://github.com/pdcodeunder/cocoapods-ppbuild.git'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
