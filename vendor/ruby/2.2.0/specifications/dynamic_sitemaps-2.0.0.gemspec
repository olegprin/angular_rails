# -*- encoding: utf-8 -*-
# stub: dynamic_sitemaps 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "dynamic_sitemaps"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Lasse Bunk"]
  s.date = "2013-08-03"
  s.description = "Dynamic Sitemaps is a plugin for Ruby on Rails that enables you to easily create flexible, dynamic sitemaps for Google, Bing, and Yahoo."
  s.email = ["lassebunk@gmail.com"]
  s.homepage = "http://github.com/lassebunk/dynamic_sitemaps"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Dynamic sitemap generation plugin for Ruby on Rails."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["~> 3.2.13"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_development_dependency(%q<timecop>, ["~> 0.6.1"])
      s.add_development_dependency(%q<webmock>, ["~> 1.13.0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.2.13"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_dependency(%q<timecop>, ["~> 0.6.1"])
      s.add_dependency(%q<webmock>, ["~> 1.13.0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.2.13"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6.0"])
    s.add_dependency(%q<timecop>, ["~> 0.6.1"])
    s.add_dependency(%q<webmock>, ["~> 1.13.0"])
  end
end
