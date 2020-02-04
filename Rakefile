require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'
require 'fileutils'
require 'yaml'
require 'json'
require './lib/redirector.rb'

task :default => [:test, :compile]

desc "Compile the project"
task :compile => [:clean, :compile_nanoc, :compile_openapi]

desc "Compile the site"
task :compile_nanoc do
  puts "Compiling site"
  Bundler.with_clean_env do
    yarn = sh(*%w(yarn))
    build = sh(*%w(yarn build))
    compile = sh(*%w(bundle exec nanoc compile))
  end

  FileUtils.cp_r 'dist', 'output'
  Redirector.new(File.readlines('_redirects')).generate('output')

  if $?.to_i == 0
    puts  "Compilation succeeded"
  else
    abort "Compilation failed: #{$?.to_i}\n #{yarn}\n #{build}\n #{compile}\n"
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

  publishing_result = `s3_website push`

  puts publishing_result

  if publishing_result.include?("[info] Successfully pushed the website to")
    puts "Publishing succeeded"
  else
    abort "ERROR: Publishing failed"
  end
end

task :clean do
  FileUtils.rm_r('output') if File.exist?('output')
end

Rake::TestTask.new do |t|
  t.libs << "_test"
  t.test_files = FileList["_test/*_test.rb"]
  t.verbose = true
end
