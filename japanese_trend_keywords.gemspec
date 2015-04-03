# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'japanese_trend_keywords/version'

Gem::Specification.new do |spec|
  spec.name          = "japanese_trend_keywords"
  spec.version       = JapaneseTrendKeywords::VERSION
  spec.authors       = ["No6Kitsunegasaki\n\n"]
  spec.email         = ["none.gingerale@gmail.com\n\n"]

  if spec.respond_to?(:metadata)
#    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Library to get japanese trend keywords.}
#  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/No6Kitsunegasaki/japanese_trend_keywords"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", "~> 4.0"
  spec.add_runtime_dependency "nokogiri", "~> 1.6"

  spec.add_development_dependency "test-unit-rr", "~> 1.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
