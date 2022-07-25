# frozen_string_literal: true

require("spec_helper")
require("yaml")

RSpec.describe("Ruby version") do
  it("ci matrix includes minimum ruby version") do
    minimum_ruby_version = normalize(extract_minimum_ruby_version_from_gemspec)
    ruby_versions = extract_ruby_versions_from_ci_matrix.map { |version| normalize(version) }
    expect(ruby_versions).to(include(minimum_ruby_version))
  end

  private

  def extract_minimum_ruby_version_from_gemspec
    minimum_ruby_version = File.read("ps-core-ruby-styles.gemspec")[/(?<=required_ruby_version = ">= ).*(?="$)/]
    return minimum_ruby_version unless minimum_ruby_version.nil?

    flunk("Failed to extract required_ruby_version from gemspec")
  end

  def extract_ruby_versions_from_ci_matrix
    YAML.load_file(".github/workflows/ruby.yml")
      .fetch("jobs").fetch("build").fetch("strategy").fetch("matrix").fetch("ruby")
  end

  # Remove the trailing .0 for versions of the form X.Y.0
  # Otherwise, return the version unchanged
  def normalize(version)
    version.match?(/^\d+\.\d+\.0$/) ? version.chomp(".0") : version
  end
end
