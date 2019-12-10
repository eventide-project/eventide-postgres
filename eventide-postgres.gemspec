# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'eventide-postgres'
  s.version = '2.0.0.0'
  s.summary = 'Event-Sourced Autonomous Services Toolkit'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/eventide-postgres'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_runtime_dependency 'evt-entity_store'
  s.add_runtime_dependency 'evt-consumer-postgres'
  s.add_runtime_dependency 'evt-entity_snapshot-postgres'
end
