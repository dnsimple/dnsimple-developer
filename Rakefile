require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'
require 'fileutils'
require 'yaml'
require 'json'
require 'open3'

task :default => [:test, :compile]

desc "Compile the project"
task :compile => [:clean, :compile_nanoc, :compile_openapi]

desc "Compile the site"
task :compile_nanoc do
  puts "Compiling site"

  stdout, stderr, status = Bundler.with_clean_env do
    Open3.capture3("yarn && yarn build && bundle exec nanoc compile")
  end
  if status.success?
    puts  "Compilation succeeded"
  else
    abort "ERROR: Compilation failed (#{$?.to_i}\n#{stdout}\n#{stderr}"
  end

  FileUtils.cp_r 'dist', 'output'
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

  stdout, stderr, status = Open3.capture3("s3_website push")
  if status.success? && stdout.include?("Successfully pushed the website to")
    puts "Publishing succeeded"
  else
    abort "ERROR: Publishing failed\n#{stdout}\n#{stderr}"
  end
end

task :clean do
  FileUtils.rm_r('output') if File.exist?('output')
  FileUtils.rm_r('dist') if File.exist?('dist')
end

Rake::TestTask.new do |t|
  t.libs << "_test"
  t.test_files = FileList["_test/*_test.rb"]
  t.verbose = true
end
