require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'
require 'fileutils'
require 'yaml'
require 'json'
require 'open3'

PUBLISH_DIRECTORY = "output"
BUILD_YARN_DIRECTORY = "dist"

task default: [:test]

desc "Compile the site"
task compile: [:clean, :compile_nanoc, :compile_openapi]

desc "Remove the compilation artifacts"
task :clean do
  FileUtils.rm_r(PUBLISH_DIRECTORY) if File.exist?(PUBLISH_DIRECTORY)
  FileUtils.rm_r(BUILD_YARN_DIRECTORY) if File.exist?(BUILD_YARN_DIRECTORY)
end

desc "Compile the static site"
task :compile_nanoc do
  puts "Compiling site"

  stdout, stderr, status = Bundler.with_unbundled_env do
    Open3.capture3("yarn && yarn build && bundle exec nanoc compile")
  end
  if status.success?
    puts  "Compilation succeeded"
  else
    abort "ERROR: Compilation failed (#{$?.to_i}\n#{stdout}\n#{stderr}"
  end

  FileUtils.cp_r BUILD_YARN_DIRECTORY, PUBLISH_DIRECTORY
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

desc "Run the site"
task run: [:compile] do
  Bundler.with_unbundled_env do
    sh("bundle exec nanoc live")
  end
end

namespace :test do
  Rake::TestTask.new(:ruby) do |t|
    t.libs << "_test"
    t.test_files = FileList["_test/*_test.rb"]
    t.verbose = true
  end

  task :all => [:ruby]
end

task :test => [:compile, "test:all"]

