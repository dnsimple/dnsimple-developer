require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'
require 'fileutils'


desc "Compile the site"
task :compile do
  puts "Compiling site"
  FileUtils.rm_r('output') if File.exist?('output')
  `nanoc compile`
end

desc "Publish to S3"
task :publish => :compile do
  puts "Publishing to S3"
  puts `s3_website push`
  puts "Published"
end

task :default => [:test]
Rake::TestTask.new do |t|
  t.libs << "_test"
  t.test_files = FileList["_test/*_test.rb"]
  t.verbose = true
end

