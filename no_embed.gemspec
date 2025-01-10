# frozen_string_literal: true

require_relative "lib/no_embed/version"

Gem::Specification.new do |spec|
  spec.name = "no_embed"
  spec.version = NoEmbed::VERSION
  spec.authors = ["mykbren"]
  spec.email = ["myk.bren@gmail.com"]

  spec.summary = "Noembed API ruby wrapper"
  spec.description = "Use Noembed to get oEmbed data from supported resources"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"


  spec.metadata["source_code_uri"] = "https://github.com/mykbren/no_embed"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
