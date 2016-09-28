Bundler.require(:default)

guard 'shell' do
  watch(/^doc\/index\.adoc$/) {|m|
    Asciidoctor.convert_file(m[0], :in_place => true)
  }
end

guard :livereload do
  watch(/doc\/.*\.(css|js|html)/)
end