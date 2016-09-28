Bundler.require(:default)

guard 'shell' do
  watch(/^doc\/index\.adoc$/) {|m|
    Asciidoctor.convert_file m[0], to_file: true, safe: :safe
  }
end

guard :livereload do
  watch(/doc\/.*\.(css|js|html)/)
end