# frozen_string_literal: true

require_relative 'lib/vrt_cli/version'

Gem::Specification.new do |s|
  s.name          = 'vrt-cli'
  s.version       = Version::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'A simple tool to visualize VRT (Vulnerability Rating Taxonomy) from the CLI.'
  s.description   = 'A simple tool to visualize VRT (Vulnerability Rating Taxonomy) from the CLI.'
  s.authors       = ['Alexandre ZANNI']
  s.email         = 'alexandre.zanni@engineer.com'
  s.homepage      = 'https://noraj.github.io/vrt-cli/'
  s.license       = 'MIT'

  s.files         = Dir['bin/*'] + Dir['lib/**/*.rb'] + ['LICENSE']
  s.bindir        = 'bin'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.metadata = {
    'yard.run'          => 'yard',
    'bug_tracker_uri'   => 'https://github.com/noraj/vrt-cli/issues',
    'changelog_uri'     => 'https://github.com/noraj/vrt-cli/releases',
    'documentation_uri' => 'https://noraj.github.io/vrt-cli/',
    'homepage_uri'      => 'https://noraj.github.io/vrt-cli/',
    'source_code_uri'   => 'https://github.com/noraj/vrt-cli/'
  }

  s.required_ruby_version = ['>= 2.6.0', '< 3.0']

  s.add_runtime_dependency('docopt', '~> 0.6') # for argument parsing
  s.add_runtime_dependency('paint', '~> 2.2') # for colorized output
  s.add_runtime_dependency('vrt', '~> 0.11')

  s.add_development_dependency('bundler', ['>= 2.1.0', '< 2.3'])
  s.add_development_dependency('commonmarker', '~> 0.21') # for GMF support in YARD
  s.add_development_dependency('github-markup', '~> 4.0') # for GMF support in YARD
  s.add_development_dependency('minitest', '~> 5.12')
  s.add_development_dependency('rake', '~> 13.0')
  s.add_development_dependency('redcarpet', '~> 3.5') # for GMF support in YARD
  s.add_development_dependency('rubocop', '~> 1.12')
  s.add_development_dependency('yard', '~> 0.9')
end
