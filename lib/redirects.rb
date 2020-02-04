class Redirects
  def self.generate(pages)
    pages.each do |page|
      args = page.strip.split(/\s+/)
      create_redirect *args
    end
  end

  private

  def self.create_redirect(src, dest)
    content = template dest
    dir = File.join(File.dirname(__FILE__), '..', 'output', src)
    redirect_path = File.join(dir, 'index.html')
    printf "Creating redirect from #{src} to #{dest}\n"
    FileUtils.mkdir_p dir unless File.exist? dir
    File.write(redirect_path, content) unless File.exist? redirect_path
  end

  def self.template(url)
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
