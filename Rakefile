require 'rubygems'
require 'bundler/setup'
require 'fileutils'


desc "Compile the site"
task :compile do
  FileUtils.rm_r('output') if File.exist?('output')
  `nanoc compile`
end

desc "Publish to developer.dnsimple.com"
task :publish do
  FileUtils.rm_r('output') if File.exist?('output')
  `nanoc compile`

  ENV['GIT_DIR'] = File.expand_path(`git rev-parse --git-dir`.chomp)
  osha = `git rev-parse refs/remotes/origin/gh-pages`.chomp
  Dir.chdir('output') do
    ENV['GIT_INDEX_FILE'] = gif = '/tmp/dev.gh.i'
    ENV['GIT_WORK_TREE'] = Dir.pwd
    File.unlink(gif) if File.file?(gif)
    `git add -A`
    tsha = `git write-tree`.strip
    puts "Created tree #{tsha}"
    if osha.size == 40
      csha = `echo '#{MessageGenerator.new.generate}' | git commit-tree #{tsha} -p #{osha}`.strip
    else
      csha = `echo '#{MessageGenerator.new.generate}' | git commit-tree #{tsha}`.strip
    end
    puts "Created commit #{csha}"
    puts `git show #{csha} --stat`
    puts "Updating gh-pages from #{osha}"

    `git update-ref refs/heads/gh-pages #{csha}`
    `git push origin gh-pages`
  end
end


class MessageGenerator

  FLICKR_URL = 'http://api.flickr.com/services/feeds/groups_pool.gne?id=32584222@N00&lang=en-us&format=json&nojsoncallback=1'

  def initialize
    require 'json'
    require 'net/http'
    require 'uri'
  end

  def generate
    photo = items.sample
    author = photo["author"].slice(/\((.+)\)/, 1)
    "#{photo["title"]} by #{author}\n#{photo["link"]}"
  end

  def items
    body = Net::HTTP.get(URI.parse(FLICKR_URL))
    json = JSON.parse(body)
    json["items"]
  end
end
