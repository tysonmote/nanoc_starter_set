# Setup compass

require 'compass'
Compass.add_project_configuration File.expand_path(File.join(__FILE__, "..", "compass_config.rb"))

# Setup nanoc

include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo

# Asset Helpers

# Process an asset file, sprockets-style
def run_filters( item )
  item[:filename].scan( /\.\w+/ ).reverse.each do |suffix|
    case suffix
      when ".erb"  ; filter :erb
      when ".scss" ; filter :sass, Compass.sass_engine_options
      when ".md"   ; filter :kramdown, {
        enable_coderay: false,
        remove_block_html_tags: false,
      }
      when ".html" ; filter :typogruby
    end
  end
end

def asset_items( folder )
  items.select do |item|
    item.identifier =~ %r{^/#{folder}/}
  end.reject do |item|
    item.attributes[:all]
  end.map do |item|
    item
  end.sort_by( &:identifier )
end

# Other helpers

def body_class
  @item[:layout] || @item[:kind]
end

def pretty_date( date )
  attribute_to_time( date ).strftime( "%b %-d, %Y" )
end

def partial( name, vars = {} )
  render "partials/#{name}", vars
end

