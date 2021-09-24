#!/bin/sh
export PATH="/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin"
dir="$( cd "$( dirname "$0"  )" && pwd  )"
cd $dir

GEM_HOME=`pwd`/vendor/bundle/ruby/`ls vendor/bundle/ruby/`
GEM_BIN=$GEM_HOME/bin
export GEM_PATH=$GEM_PATH:$GEM_HOME
export PATH=$PATH:$GEM_BIN

rm -f Java工程师之路.html
# 下面这一行会删除根目录下的 images 文件夹，如果我们的图片是放在每个文章模块下的 images 文件夹中，就保留这一行；
# 如果我们的文章直接保留在 根目录下的 images 中，那么就需要注释掉下面这行命令，否则生成文档会将图片删除掉，那就。。。嘿嘿
#rm -f images/*

rm -rf .asciidoctor/


bundle exec rake book:build_html
sed -i 's#https://cdnjs.cloudflare.com/ajax/libs/highlight.js/.*/styles/github.min.css#css/github.min.css#' Java工程师之路.html
sed -i 's#https://cdnjs.cloudflare.com/ajax/libs/highlight.js/.*/highlight.min.js#js/highlight.min.js#' Java工程师之路.html
sed -i 's#https://cdnjs.cloudflare.com/ajax/libs/mathjax/.*/MathJax.js#js/MathJax/MathJax.js#' Java工程师之路.html
