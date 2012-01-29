# -*- encoding: utf-8 -*-
require File.expand_path('../lib/law_of_demeter_violator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gabe Berke-Williams"]
  gem.email         = ["gabe@thoughtbot.com"]
  gem.description   = %q{Violate the Law of Demeter hardcore with this too-easy-to-use library.}
  gem.summary       = %q{Violate the Law of Demeter hardcore with this too-easy-to-use library.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "law_of_demeter_violator"
  gem.require_paths = ["lib"]
  gem.version       = LawOfDemeterViolator::VERSION

  gem.add_development_dependency("rspec", "~> 2.0")
  gem.add_development_dependency("bourne", "~> 1.0")
end
