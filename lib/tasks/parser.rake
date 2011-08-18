$:.unshift("lib/tasks")
$:.unshift("app/models")
require 'style_guidelines_parser'
require 'style'

namespace :bjcp do
  desc "Auto generate the Style models from the guidelines xml"
  task :generate do |t|
    styles = StyleGuidelinesParser.new.styles
    styles.each do |style_params|
      puts style_params.keys
      puts "----------"
      style = Style.new({:comments => 'AAAAAAAAAAAAAAAAAAAAAAA'})
      style.save!
    end
  end
end
