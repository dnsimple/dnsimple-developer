class PreprocessFilter < Nanoc::Filter
  identifier :preprocess

  REGEXP_MARKERS = /<(warning|note|info)>(.*?)<\/\1>/m

  def run(content, params = {})
    content = content.dup
    format_markers content
    content
  end

private

  def format_markers(content)
    content.gsub!(REGEXP_MARKERS) { %(<div class="marker marker-#{$1}" markdown="1">#{$2}</div>) }
  end

end
