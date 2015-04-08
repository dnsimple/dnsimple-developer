require 'rubygems'
require 'bundler/setup'
require 'fileutils'


desc "Compile the site"
task :compile do
  puts "Compiling site"
  FileUtils.rm_r('output') if File.exist?('output')
  `nanoc compile`
end

desc "Publish to S3"
task :'publish' => :compile do
  puts "Publishing to S3"
  `s3_website push`
  puts "Published"
end

