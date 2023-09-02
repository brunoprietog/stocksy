# frozen_string_literal: true

require_relative "lib/stocksy/version"

Gem::Specification.new do |spec|
  spec.name = "stocksy"
  spec.version = Stocksy::VERSION
  spec.authors = ["Bruno Prieto"]
  spec.email = ["brunoprietog@hey.com"]

  spec.summary = "Command line tool to get stock market data"
  spec.homepage = "https://github.com/brunoprietog/stocksy"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.files = Dir["lib/**/*", "LICENSE.txt", "README.md"]
  spec.executables = %w[stocksy]

  spec.add_dependency "activesupport"
  spec.add_dependency "thor"
  spec.add_dependency "zeitwerk"

  spec.metadata["rubygems_mfa_required"] = "true"
end
