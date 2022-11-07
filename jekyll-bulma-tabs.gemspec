# frozen_string_literal: true
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/jekyll/bulma/tabs/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-bulma-tabs"
  spec.version = Jekyll::Bulma::Tabs::VERSION
  spec.authors = ["Yoko Harada"]
  spec.email = ["yokolet@gmail.com"]

  spec.summary = "A Jekyll plugin to add bulma compatible tabs."
  spec.description = "Generate a tabbed interface with bulma as a CSS framework."
  spec.homepage = "https://github.com/yokolet/jekyll-bulma-tabs"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.licenses = ["MIT"]
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.6", "< 5.0"
end
