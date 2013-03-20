# Base helpers
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Capturing
include Nanoc3::Helpers::HTMLEscape
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Text
include Nanoc3::Helpers::XMLSitemap

# Starter Set helpers
require 'nanoc_starter_set/helpers/assets'
require 'nanoc_starter_set/helpers/partials'

# Misc. helpers

def body_class
  @item[:layout] || @item[:kind]
end

def pretty_date( date )
  attribute_to_time( date ).strftime( "%b %-d, %Y" )
end

