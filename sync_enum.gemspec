# frozen_string_literal: true

require_relative 'lib/sync_enum/version'

Gem::Specification.new do |spec|
  spec.name          = 'sync_enum'
  spec.version       = SyncEnum::VERSION
  spec.authors       = ['Bruce Tesar']
  spec.email         = ['tesar@rutgers.edu']

  spec.summary       = 'Iterates over multiple enumerators.'
  spec.description   =
    <<~ENDOFSTRING
      Iterate over multiple enumerators in parallel, using the external
      interface based on the #next method. Each call to #next returns an
      array, containing the next element for each of the enumerators. A
      StopIteration exception is raised as soon as any of the enumerators
      runs out of elements.

      SyncEnum differs from the standard library's REXML::SyncEnumerator in
      its use of the #next external iterator interface, while
      REXML::SyncEnumerator uses an #each internal interator interface. The
      external interface is more convenient when you expect to end
      iteration before reaching the end of any of the enumerations,
      including cases where an enumerator generates an unending sequence.
    ENDOFSTRING

  spec.homepage      = 'https://github.com/brucetesar/sync_enum'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] =
    'https://github.com/brucetesar/sync_enum'
  spec.metadata['changelog_uri'] =
    'https://github.com/brucetesar/sync_enum/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been
  # added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject \
      { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Register the development-specific dependencies
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.7'
end
