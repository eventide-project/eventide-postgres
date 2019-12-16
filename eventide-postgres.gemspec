# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'eventide-postgres'
  s.version = '1.0.0.1'
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

  s.add_runtime_dependency 'evt-message_store', '~> 1.0'
  s.add_runtime_dependency 'evt-message_store-postgres', '~> 1.0'
  s.add_runtime_dependency 'evt-messaging', '~> 1.0'
  s.add_runtime_dependency 'evt-messaging-postgres', '~> 1.0'
  s.add_runtime_dependency 'evt-entity_projection', '~> 1.0'
  s.add_runtime_dependency 'evt-entity_store', '~> 1.0'
  s.add_runtime_dependency 'evt-entity_cache', '~> 1.0'
  s.add_runtime_dependency 'evt-entity_snapshot-postgres', '~> 1.0'
  s.add_runtime_dependency 'evt-consumer', '~> 1.0'
  s.add_runtime_dependency 'evt-consumer-postgres', '~> 1.0'
  s.add_runtime_dependency 'evt-message_store-postgres-database', '~> 1.0'

  s.add_runtime_dependency 'evt-async_invocation', '~> 1.0'
  s.add_runtime_dependency 'evt-attribute', '~> 1.0'
  s.add_runtime_dependency 'evt-casing', '~> 1.0'
  s.add_runtime_dependency 'evt-clock', '~> 1.0'
  s.add_runtime_dependency 'evt-component_host', '~> 1.0'
  s.add_runtime_dependency 'evt-configure', '~> 1.0'
  s.add_runtime_dependency 'evt-dependency', '~> 1.0'
  s.add_runtime_dependency 'evt-identifier-uuid', '~> 1.0'
  s.add_runtime_dependency 'evt-initializer', '~> 1.0'
  s.add_runtime_dependency 'evt-invocation', '~> 1.0'
  s.add_runtime_dependency 'evt-log', '~> 1.0'
  s.add_runtime_dependency 'evt-mimic', '~> 1.0'
  s.add_runtime_dependency 'evt-poll', '~> 1.0'
  s.add_runtime_dependency 'evt-reflect', '~> 0.2.0.0'
  s.add_runtime_dependency 'evt-schema', '~> 1.0'
  s.add_runtime_dependency 'evt-set_attributes', '~> 1.0'
  s.add_runtime_dependency 'evt-settings', '~> 1.0'
  s.add_runtime_dependency 'evt-subst_attr', '~> 1.0'
  s.add_runtime_dependency 'evt-telemetry', '~> 1.0'
  s.add_runtime_dependency 'evt-transform', '~> 1.0'
  s.add_runtime_dependency 'evt-try', '~> 1.0'
  s.add_runtime_dependency 'evt-validate', '~> 1.0'
  s.add_runtime_dependency 'evt-virtual', '~> 1.0'
  s.add_runtime_dependency 'ntl-actor', '~> 1.0'
  s.add_runtime_dependency 'terminal_colors', '~> 1.0'
  s.add_runtime_dependency 'pg', '~> 1.0'
end
