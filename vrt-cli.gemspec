# frozen_string_literal: true

require_relative 'lib/vrt_cli/version'

Gem::Specification.new do |s|
  s.name          = 'vrt-cli'
  s.version       = VrtCli::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'A simple tool to visualize VRT (Vulnerability Rating Taxonomy) from the CLI.'
  s.description   = 'A simple tool to visualize VRT (Vulnerability Rating Taxonomy) from the CLI.'
  s.authors       = ['Alexandre ZANNI']
  s.email         = 'alexandre.zanni@europe.com'
  s.homepage      = 'https://noraj.github.io/vrt-cli/'
  s.license       = 'MIT'

  s.files         = Dir['bin/*'] + Dir['lib/**/*.rb'] + ['LICENSE']
  s.bindir        = 'bin'
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.metadata = {
    'yard.run'              => 'yard',
    'bug_tracker_uri'       => 'https://github.com/noraj/vrt-cli/issues',
    'changelog_uri'         => 'https://github.com/noraj/vrt-cli/releases',
    'documentation_uri'     => 'https://noraj.github.io/vrt-cli/',
    'homepage_uri'          => 'https://noraj.github.io/vrt-cli/',
    'source_code_uri'       => 'https://github.com/noraj/vrt-cli/',
    'funding_uri'           => 'https://github.com/sponsors/noraj',
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = ['>= 3.2.0', '< 5.0']

  s.add_runtime_dependency('docopt', '~> 0.6') # for argument parsing
  s.add_runtime_dependency('paint', '~> 2.3') # for colorized output
  s.add_runtime_dependency('vrt', '~> 0.13')
end
