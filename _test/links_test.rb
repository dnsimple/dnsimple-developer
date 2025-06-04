require 'test_helper'

describe 'Correct links' do
  it 'ensures that links are valid' do
    regexp = %r{(?<!!)\[.*\]\((?!https?://|/|mailto|#)[^)]*\)}

    affected = []

    Dir['content/**/*.markdown'].each do |path|
      next unless File.file?(path)

      File.readlines(path).each do |line|
        affected << [path, line] if regexp.match(line)
      end
    end

    message = "#{affected.size} lines contain invalid links:\n"
    affected.each_with_index do |(path, line), index|
      message << "#{format('%d.', index + 1)} #{path} -> #{line}"
    end

    assert_equal 0, affected.size, message
  end

  it 'ensures that internal links have trailing slash' do
    regexp = /\[[^\]]+\]\(([^)]+)\)/m
    affected = []

    Dir.glob('content/**/**/*.{md,markdown}').each do |path|
      next unless File.file?(path)

      File.readlines(path).each do |line|
        line.scan(regexp) do |matches|
          matches.each do |match|
            next unless File.extname(match) == '' # linked to a file
            next if match.end_with?('/') || match.include?('/#') # already has a trailing slash

            next unless match.start_with?('https://support.dnsimple.com/') ||
                        match.start_with?('https://developer.dnsimple.com/') ||
                        match.start_with?('https://blog.dnsimple.com/') ||
                        match.start_with?('https://howdns.works/') ||
                        match.start_with?('https://howndnssec.works/') ||
                        match.start_with?('https://howhttps.works/') ||
                        match.start_with?('/')

            affected.push([path, line])
          end
        end
      end
    end

    message = "#{affected.size} internal urls should end with a /:\n"
    affected.each_with_index do |(path, line), index|
      message << "#{index + 1}. #{path} -> #{line}"
    end

    assert_equal 0, affected.size, message
  end
end
