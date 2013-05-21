require 'yaml'
require 'erb'

r = YAML::load(File.open('resume.yaml'))

directory 'site'
directory 'site/paper'

file 'site/paper' => 'site'

task :webdata => 'site' do
  sh 'rsync -aH --delete --exclude ".git" --exclude ".swp" --exclude "paper/" web/ site/', :verbose =>true
end

task :paperdata => 'site/paper' do
  sh 'rsync -aH --delete --exclude ".git" --exclude ".swp" paper/ site/paper/', :verbose =>true
end

task :web => 'webdata' do
  c = ERB.new(File.new('index.html.erb').read, nil, '<>') 
  File.open('site/index.html', 'w') { |f| f.puts c.result(binding) }
  puts 'web done'
end

# Printable version for PDF
task :paper => 'paperdata' do
  c = ERB.new(File.new('paper.html.erb').read, nil, '<>') 
  File.open('site/paper/print.html', 'w') { |f| f.puts c.result(binding) }
  puts 'paper done'
end

# Printable version with things like phone number removed
task :paper_web => 'paperdata' do
  c = ERB.new(File.new('paper-web.html.erb').read, nil, '<>') 
  File.open('site/paper/index.html', 'w') { |f| f.puts c.result(binding) }
  puts 'paper_web done'
end

# Plain text, no phone number
task :text_web => 'webdata' do
  c = ERB.new(File.new('text-web.erb').read, nil, '<>') 
  File.open('site/resume.txt', 'w') { |f| f.puts c.result(binding) }
  puts 'text_web done'
end

# Text with ESC codes for color and bold, read with 'less -R'
task :console_web => 'webdata' do
  c = ERB.new(File.new('console-web.erb').read, nil, '<>') 
  File.open('site/resume-color.txt', 'w') { |f| f.puts c.result(binding) }
  puts 'console_web done'
end

task :sync do
  sh 's3cmd sync -c ~/.s3cfg/resume --delete-removed --acl-public --exclude=".git" site/ s3://resume.antoncohen.com/'
end

task :build => [:web, :paper, :paper_web, :text_web, :console_web]

task :all => [:build, :sync]
