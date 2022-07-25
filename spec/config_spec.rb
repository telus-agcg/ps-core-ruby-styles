# frozen_string_literal: true

require("diffy")
require("rubocop")

RSpec.describe("Configuration") do
  it("config has no redundant entries") do
    skip if checking_rubocop_version_compatibility?
    config = RuboCop::ConfigLoader.load_file("rubocop.yml")
    default_config = RuboCop::ConfigLoader.default_configuration
    redundant_config = Hash.new { |hash, key| hash[key] = {} }
    config.delete("inherit_mode")
    config.each do |cop_name, cop_config|
      default_cop_config = default_config.fetch(cop_name)
      cop_config.each do |key, value|
        default_value = default_cop_config[key]
        redundant_config[cop_name][key] = value if value == default_value
      end
    end
    expect(redundant_config).to(eq({}))
  end

  private

  def checking_rubocop_version_compatibility?
    (ENV.fetch("CHECKING_RUBOCOP_VERSION_COMPATIBILITY", "") == "true")
  end
end
