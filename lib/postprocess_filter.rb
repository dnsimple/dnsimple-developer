class PostprocessFilter < Nanoc::Filter
  identifier :postprocess

  def run(content, params = {})
    content = content.dup
    format_table content
    content
  end

private

  def format_table(content)
    content.gsub!(/<table>/, '<table class="table">')
  end

end
