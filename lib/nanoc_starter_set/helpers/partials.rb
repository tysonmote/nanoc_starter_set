# Provides "render" helper
include Nanoc3::Helpers::Rendering

def partial( name, vars = {} )
  render "partials/#{name}", vars
end

