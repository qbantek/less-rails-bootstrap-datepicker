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

  if Dir.exist?('bootstrap-datepicker-datepicker-src')
    system("cd bootstrap-datepicker-datepicker-src && git checkout master && git pull && git checkout #{checkout_branch}")
  else
    system('git clone git://github.com/eternicode/bootstrap-datepicker-datepicker.git bootstrap-datepicker-datepicker-src')
    system("cd bootstrap-datepicker-datepicker-src && git checkout #{checkout_branch}")
  end

  system('cp bootstrap-datepicker-datepicker-src/build/build.less                             app/assets/stylesheets/twitters/bootstrap-datepicker.less')
  system('cp bootstrap-datepicker-datepicker-src/build/build3.less                            app/assets/stylesheets/twitters/bootstrap-datepicker3.less')
  system('cp bootstrap-datepicker-datepicker-src/dist/js/bootstrap-datepicker-datepicker.js   app/assets/javascripts/twitter/bootstrap-datepicker/core.js')
  system('cp bootstrap-datepicker-datepicker-src/js/locales/*.js                              app/assets/javascripts/twitter/bootstrap-datepicker/locales/')
  system('git status')

  puts "\n"
  puts "bootstrap-datepicker-datepicker version:       #{JSON.parse(File.read('./bootstrap-datepicker-datepicker-src/bower.json'))['version']}"
  puts "less-rails-bootstrap-datepicker-datepicker version: #{Less::Rails::Bootstrap::Datepicker::VERSION}"
end

desc 'Build'
task 'build' do
  system('gem build less-rails-bootstrap-datepicker-datepicker.gemspec')
end

desc 'Build and publish the gem'
task :publish => :build do
  tags = `git tag`.split
  current_version = Less::Rails::Bootstrap::Datepicker::VERSION
  system("git tag -a #{current_version} -m 'Release #{current_version}'") unless tags.include?(current_version)
  system("gem push less-rails-bootstrap-datepicker-datepicker-#{current_version}.gem")
  system('git push --follow-tags')
end

task :release => :publish do
end