module NanocStarterSet
  module Rules
    def self.extended( base )
      assets = File.expand_path( File.join( NANOC_STARTER_SET_ROOT, "rules", "assets.rb" ) )
      base.instance_eval do
        include_rules assets
      end
    end
  end
end

