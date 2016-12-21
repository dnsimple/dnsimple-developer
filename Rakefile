require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'
require 'fileutils'


task :default => [:test, :compile]

desc "Compile the site"
task :compile => [:clean] do
  puts "Compiling site"
  out = `bundle exec nanoc compile`

  if $?.to_i == 0
    puts  "Compilation succeeded"
  else
    abort "Compilation failed: #{$?.to_i}\n" +
          "#{out}\n"
  end
end

desc "Publish to S3"
task :publish => :compile do
  puts "Publishing to S3"
  puts `s3_website push`
  puts "Published"
end

task :clean do
  FileUtils.rm_r('output') if File.exist?('output')
end

Rake::TestTask.new do |t|
  t.libs << "_test"
  t.test_files = FileList["_test/*_test.rb"]
  t.verbose = true
end
