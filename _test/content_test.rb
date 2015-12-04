require 'test_helper'

describe "Content" do

  BannedCharacters = [
    "\u201C", # U+201C “
    "\u201D", # U+201D ”
    "\u201E", # U+201E „
    "\u2018", # U+2018 ‘
    "\u2019", # U+2019 ’
    "\u201A", # U+201A ‚
    "\u201B", # U+201B ‛
  ]

  it "is sucessful" do
    regexp   = /[#{BannedCharacters.join}]/
    affected = []

    Dir["content/*"].each do |path| 
      next unless File.file?(path)
      File.readlines(path).each do |line|
        affected << [path, line] if regexp.match(line)
      end
    end

    message  = "#{affected.size} lines contain banned characters:\n"
    affected.each_with_index do |(path, line), index|
      message << "#{("%d." % (index+1))} #{path} -> #{line}"
    end

    assert_equal 0, affected.size, message
  end
end
