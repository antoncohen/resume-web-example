#!/usr/bin/env ruby
# Creates a robots.txt that allows only / to be indexed

robots = ['User-agent: *']

allow = ['js', 'css', 'javascripts', 'stylesheets']
disallow = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + ['.', '_']

allow.each do |path|
  robots << 'Allow: /' + path.to_s
end

disallow.each do |path|
  robots << 'Disallow: /' + path.to_s
end

puts robots.join("\n")
