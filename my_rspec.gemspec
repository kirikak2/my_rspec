require_relative 'lib/my_rspec/version'

Gem::Specification.new do |spec|
  spec.name          = "my_rspec"
  spec.version       = MyRspec::VERSION
  spec.authors       = ["Toshio Maki"]
  spec.email         = ["kirika.k2@gmail.com"]

  spec.summary       = %q{RSpec clone}
  spec.description   = %q{RSpec clone}
  spec.homepage      = "https://github.com/kirikak2/my_rspec"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/kirikak2/my_rspec"
  spec.metadata["changelog_uri"] = "http://github.com/kirikak2/my_rspec"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
