# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nanoc_starter_set/version'

Gem::Specification.new do |spec|
  spec.name          = "nanoc_starter_set"
  spec.version       = NanocStarterSet::VERSION
  spec.authors       = ["Tyson Tate"]
  spec.email         = ["tyson@tysontate.com"]
  spec.description   = %q{Sensible defaults for a Nanoc site.}
  spec.summary       = %q{NanocStarterSet includes all the batteries you need to a sensible Markdown / SCSS based site with nice typography and compressed CSS / JS.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",    "~> 1.3"
  # The site engine
  spec.add_development_dependency "nanoc",      "~> 3.6.1"
  # Compress CSS
  spec.add_development_dependency "rainpress",  "~> 1.0"
  # Use Compass + SCSS for CSS
  spec.add_development_dependency "compass",    "~> 0.12.2"
  # Compress JS
  spec.add_development_dependency "uglifier",   "~> 1.3.0"
  # Markdown
  spec.add_development_dependency "kramdown",   "~> 1.0.1"
  # Nicer typography
  spec.add_development_dependency "typogruby",  "~> 1.0.15"
  # Watch for changes with 'nanoc autocompile'
  spec.add_development_dependency "mime-types", "~> 1.21"
  spec.add_development_dependency "rack",       "~> 1.5.2"
  # Rake tasks
  spec.add_development_dependency "rake",       "~> 10.0.3"
  spec.add_development_dependency "stringex",   "~> 1.5.1"
end
