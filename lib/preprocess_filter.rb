class PreprocessFilter < Nanoc::Filter
  identifier :preprocess

  def run(content, params = {})
    content = content.dup
    # Any preprocessing of the content should go here
    content
  end

end
