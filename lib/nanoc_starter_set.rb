require "nanoc_starter_set/version"

NANOC_STARTER_SET_ROOT = File.join( File.dirname( __FILE__ ), "nanoc_starter_set" )

module NanocStarterSet
  # In your Rules file:
  #
  #   include_rules NanocStarterSet.asset_rules
  #
  def self.asset_rules
    File.expand_path( File.join( NANOC_STARTER_SET_ROOT, "rules", "assets.rb" ) )
  end
end

