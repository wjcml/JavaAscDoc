namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'images' unless Dir.exists? 'images'
    Dir.glob("book/*/images/*").each do |image|
      FileUtils.copy(image, "images/" + File.basename(image))
    end
  end

  desc 'build basic book formats'
  task :build => :prebuild do
    puts "Converting to HTML..."
    `bundle exec asciidoctor all.asc -o Java工程师之路.html`
    `bundle exec asciidoctor Java基础Build.asc -o Java基础.html`
    puts " -- HTML output at Java工程师之路.html Java基础.html"

    # 生成pdf，不想生成pdf文件可以注释掉
    # puts "Converting to PDF... (this one takes a while)"
    # `bundle exec asciidoctor-pdf -r asciidoctor-pdf-cjk-kai_gen_gothic -a pdf-style=KaiGenGothicCN all.asc -o Java工程师之路.pdf`
    # puts " -- PDF  output at Java工程师之路.pdf"
    
  end
end
