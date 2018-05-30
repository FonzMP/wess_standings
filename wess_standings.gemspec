
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wess_standings/version"

Gem::Specification.new do |spec|
  spec.name          = "wess_standings"
  spec.version       = WessStandings::VERSION
  spec.authors       = ["Alex Wilson"]
  spec.email         = ["fonzmp@gmail.com"]

  spec.summary       = "A schedule and results program for WESS motorcycle championships in 2018."
  spec.description   = "This application serves as a general purpose race schedule, race description, and race results application for the 2018 World Enduro Super Series (WESS) motorcycle championships. With an early start in the season, there's a lot of excitement still to come."
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri"
end
