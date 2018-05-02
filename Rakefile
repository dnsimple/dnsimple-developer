require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'
require 'fileutils'
require 'yaml'
require 'json'


task :default => [:test, :compile]

desc "Compile the project"
task :compile => [:clean, :compile_nanoc, :compile_openapi]

desc "Compile the site"
task :compile_nanoc do
  puts "Compiling site"
  Bundler.with_clean_env do
    out = sh(*%w(bundle exec nanoc compile))
  end

  if $?.to_i == 0
    puts  "Compilation succeeded"
  else
    abort "Compilation failed: #{$?.to_i}\n" +
          "#{out}\n"
  end
end

desc "Compile the Openapi definition files"
task :compile_openapi do
  data = File.read("content/v2/openapi.yml")
  
  File.write("output/v2/openapi.yml", data)
  File.write("output/v2/openapi.json", JSON.dump(YAML.load(data)))
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
