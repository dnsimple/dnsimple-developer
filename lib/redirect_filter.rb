class Redirect < Nanoc::Filter
  identifier :redirect

  def run(content, params = {})
    generate_redirects params[:item]
    content
  end

private

  def generate_redirects(item)
    return unless item[:redirect_from]

    content = template item.identifier
    redirects = item[:redirect_from].is_a?(String) ? [item[:redirect_from]] : item[:redirect_from]

    redirects.each do |redirect|
      dir = File.join('output', redirect)
      redirect_path = File.join(dir, 'index.html')
      FileUtils.mkdir_p dir
      File.write(redirect_path, content) unless File.exist? redirect_path
    end
  end

  def template(url)
    <<-EOF
<!DOCTYPE html>
<html>
    <head>
        <meta charset=utf-8>
        <title>Redirecting...</title>
        <link rel=canonical href="#{url}">
        <meta http-equiv=refresh content="0; url=#{url}">
    </head>
    </html>
        <h1>Redirecting...</h1>
        <a href="#{url}">Click here if you are not redirected.</a>
        <script>location='#{url}'</script>
    </body>
</html>
EOF
  end

end
