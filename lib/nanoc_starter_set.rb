require "nanoc_starter_set/version"

module NanocStarterSet
  # In your Rules file:
  #
  #     eval NanocStarterSet.asset_rules
  #
  # I know, amazing, right?
  def self.asset_rules
    path = File.expand_path(File.join(__FILE__, "..", "nanoc_starter_set", "rules.rb" ) )
    File.read path
  end
end

