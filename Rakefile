namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'images' unless Dir.exists? 'images'
    Dir.glob("book/*/images/*").each do |image|
      FileUtils.copy(image, "images/" + File.basename(image))
    end
  end

  desc 'build basic html book'
  task :build_html => :prebuild do
    puts "Converting to HTML..."
    `bundle exec asciidoctor all.asc -o Java工程师之路.html`
    `bundle exec asciidoctor Java基础Build.asc -o Java基础.html`
    puts " -- -- HTML output at Java工程师之路.html Java基础.html"
  end

  desc 'build basic pdf book'
  task :build_pdf => :prebuild do
    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf -r asciidoctor-diagram -r asciidoctor-pdf-cjk-kai_gen_gothic -a pdf-style=resources/CN-theme.yml -a pdf-fontsdir=resources/fonts all.asc -o Java工程师之路.pdf --trace`
    puts " -- PDF  output at Java工程师之路.pdf"
  end
end
