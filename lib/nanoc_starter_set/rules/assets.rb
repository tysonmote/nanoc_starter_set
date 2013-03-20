compile '/css/*/' do
  run_filters item
  filter :rainpress if item[:all]
end

# Only make a single /css/all.css file
route '/css/*/' do
  if item[:all]
    item.identifier.chop+".css"
  else
    nil
  end
end

compile '/js/*/' do
  run_filters item
  filter :uglify_js, { comments: false } if item[:all]
end

# Only make a single /js/all.css file
route '/js/*/' do
  if item[:all]
    item.identifier.chop+".js"
  else
    nil
  end
end

