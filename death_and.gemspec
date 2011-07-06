# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "death_and/version"
 
Gem::Specification.new do |s|
  s.name        = "death_and"
  s.version     = DeathAnd::VERSION
  s.authors     = ["Bryan McKelvey"]
  s.email       = ["bryan.mckelvey@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/death_and"
  s.summary     = %q{Helping you calculate life's other inevitability}
  s.description = %q{Tax stuff}
   
  s.rubyforge_project = "death_and"

  s.add_dependency('bundler', '~> 1.0.15')
  s.add_dependency('ansi', '~> 1.3.0')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
