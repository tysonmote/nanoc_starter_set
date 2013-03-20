include Nanoc3::Helpers::Filtering

# Load Compass

require 'compass'
Compass.add_project_configuration File.expand_path( File.join( NANOC_STARTER_SET_ROOT, "compass_config.rb"))

# Helpers

def asset_items( folder )
  items.select do |item|
    item.identifier =~ %r{^/#{folder}/}
  end.reject do |item|
    item.attributes[:all]
  end.map do |item|
    item
  end.sort_by( &:identifier )
end

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
