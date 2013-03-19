# NanocStarterSet

(In development. Pull requests welcome!)

NanocStarterSet is a gem that makes it easy to start a Nanoc site with sensible
defaults and some handy batteries included. It uses:

* [kramdown](http://kramdown.rubyforge.org) for Markdown parsing with fenced
  code blocks.
* [compass](http://compass-style.org) for SCSS and a large library of helpful
  mixins / helpers.
* [rainpress](http://code.google.com/p/rainpress/) for compressing CSS.
* [uglifier](https://github.com/lautis/uglifier) for compressing JavaScript.
* [typogruby](http://avdgaag.github.com/typogruby/) for nice typography.

I recommend using
[prettify](http://code.google.com/p/google-code-prettify/) if you want to
syntax-highlight Markdown's fenced code blocks.

The included helpers and nanoc rules give you things like:

* A `/css/all.css` file that contains a joined and compressed copy of all your
  CSS files.
* A `/js/all.js` file that contains a joined and compressed copy of all your
  JavaScript files.
* ERB processing of your source files, if you suffix it with ".erb" 

## TODO

* Include a sensible default layout, and:
  * Include all.js and all.css
  * Include prettify
* Remove the all.js / all.css hackery
* Add more sensible defaults around blogs / pages
* Add CoffeeScript support
* Create a one-command site creator
* Support backtick fenced code blocks

## Installation

```console
% gem install nanoc_starter_set
% nanoc create-site my_site
```

## Usage

In your site's root, create a Gemfile:

```ruby
source "https://rubygems.org"
gem 'nanoc_starter_set'
```

Install the gems:

```console
$ bundle install
```

Add the following to lib/default.rb:

```ruby
require 'nanoc_starter_set/setup'
```

And in your Rules file, at the top:

```ruby
eval NanocStarterSet.asset_rules
```

Eval is necessary here because nanoc does some instance_eval hackery here that
breaks our ability to just 'load' or 'include' or 'require' the code.

## Recommended layout

```html
<!DOCTYPE html>
<!--[if IE 8]> <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width" />
    <meta name="generator" content="nanoc <%= Nanoc::VERSION %>"> 

    <title><%= @item[:title] %></title>

    <link rel="stylesheet" href="/css/all.css">
  </head>
  <body class="<%= body_class %>">
    <div id="main">
      <%= yield %>
    </div>
    <script src="/js/all.js"></script>
    <script>
      /* Highlight all <pre> tags with a <code> child */
      var preTags = document.getElementsByTagName( "pre" );
      for (var i = 0; i < preTags.length; i += 1) {
        var preTag = preTags[i];
        var codeTag = preTag.children[0];
        if ( codeTag && codeTag.tagName == "CODE" ) {
          preTag.className += " prettyprint";
        }
      }
      prettyPrint();
    </script>
  </body>
</html>
```

## Markdown notes

Kramdown does fenced code blocks like this:

```md
~~~ css
.my-example {
  color: red;
}
~~~
```

## CSS

Create an 'all' CSS file:

```console
$ mkdir -p content/css
$ touch content/css/all.scss.erb
```

With these contents:

```erb
---
all: true
---

<% asset_items( :css ).each do |item| %>
  <%= item.compiled_content %>
<% end %>
```

You can change the order of files by prefixing a number to their name:
"01_reset.css", etc.

## JS

Create an 'all' JS file:

```console
$ mkdir -p content/js
$ touch content/js/all.js.erb
```

With these contents:

```erb
---
all: true
---

<% asset_items( :js ).each do |item| %>
  <%= item.compiled_content %>
<% end %>
```

You can change the order of files by prefixing a number to their name:
"01_jquery.js", etc. Otherwise, it's they're included in alphabetical order.

## Misc.

Read the source of the gem to see what other functions it gives you.
Setup and integration and documentation could be much easier, of course.
It's just a hack to make my life easier.

