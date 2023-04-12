require 'test_helper'

describe "Correct links" do
  it "ensures that links are valid" do
    regexp = /(?<!\!)\[.*\]\((?!https?:\/\/|\/|mailto|#)[^\)]*\)/

    affected = []

    Dir["content/**/*.markdown"].each do |path|
      next unless File.file?(path)
      File.readlines(path).each do |line|
        affected << [path, line] if regexp.match(line)
      end
    end

    message  = "#{affected.size} lines contain invalid links:\n"
    affected.each_with_index do |(path, line), index|
      message << "#{("%d." % (index+1))} #{path} -> #{line}"
    end

    assert_equal 0, affected.size, message
  end
end
