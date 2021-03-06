#!/usr/bin/env rake

require 'json'
require File.expand_path('../lib/less/rails/bootstrap/datepicker/version', __FILE__)

desc 'Update assets'
task :update do
  if ARGV.count > 1
    checkout_branch = "tags/#{ARGV.last}"
    task ARGV.last.to_sym {}
  else
    checkout_branch = '`git describe --abbrev=0`'
  end

  if Dir.exist?('bootstrap-datepicker-src')
    system("cd bootstrap-datepicker-src && git checkout master && git pull && git checkout #{checkout_branch}")
  else
    system('git clone git://github.com/eternicode/bootstrap-datepicker.git bootstrap-datepicker-src')
    system("cd bootstrap-datepicker-src && git checkout #{checkout_branch}")
  end

  system('cp bootstrap-datepicker-src/less/datepicker*.less             app/assets/stylesheets/bootstrap-datepicker/')
  system('cp bootstrap-datepicker-src/dist/js/bootstrap-datepicker.js   app/assets/javascripts/bootstrap-datepicker/core.js')
  system('cp bootstrap-datepicker-src/js/locales/*.js                   app/assets/javascripts/bootstrap-datepicker/locales/')
  system('git status')

  puts "\n"
  puts "bootstrap-datepicker version:            #{JSON.parse(File.read('./bootstrap-datepicker-src/bower.json'))['version']}"
  puts "less-rails-bootstrap-datepicker version: #{Less::Rails::Bootstrap::Datepicker::VERSION}"
end

desc 'Build'
task 'build' do
  system('gem build less-rails-bootstrap-datepicker.gemspec')
end

desc 'Build and publish the gem'
task :publish => :build do
  tags = `git tag`.split
  current_version = Less::Rails::Bootstrap::Datepicker::VERSION
  system("git tag -a #{current_version} -m 'Release #{current_version}'") unless tags.include?(current_version)
  system("gem push less-rails-bootstrap-datepicker-#{current_version}.gem")
  system('git push --follow-tags')
end

task :release => :publish do
end