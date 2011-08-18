
class StyleGuidelinesParser
  def initialize
    require 'nokogiri'
    fi = File.read("styleguide2008.xml")
    @xml = ::Nokogiri::XML(fi)
  end

  def styles
    @xml.css("class").first.css("category").collect do |category|
      category_number = category.attribute("id").content
      category_name  = category.css("name").first.content

      category.css("subcategory").collect do |style|
        x = {:category_number => category_number, :category_name => category_name}
        x[:style_name]   = style.css("name").first.content
        x[:style_number] = style.attribute("id").content
        x[:aroma]      = style.css("aroma").first.content
        x[:appearance] = style.css("appearance").first.content
        x[:flavor]     = style.css("flavor").first.content
        x[:mouthfeel]  = style.css("mouthfeel").first.content
        x[:impression] = style.css("impression").first.content
        x[:history]    = style.css("history").first.content     if style.css("history").first
        x[:comments]   = style.css("comments").first.content    if style.css("comments").first
        x[:ingredients]= style.css("ingredients").first.content if style.css("ingredients").first
        x[:examples]   = style.css("examples").first.content
        stats = style.css("stats")
        unless stats.css("exceptions").first
          if stats.css("og").first
            x[:og_low]     = stats.css("og low").first.content
            x[:og_high]    = stats.css("og high").first.content
          end
          if stats.css("fg").first
            x[:fg_low]     = stats.css("fg low").first.content
            x[:fg_high]    = stats.css("fg high").first.content
          end
          if stats.css("ibu").first
            x[:ibu_low]    = stats.css("ibu low").first.content
            x[:ibu_high]   = stats.css("ibu high").first.content
          end
          if stats.css("srm").first
            x[:srm_low]    = stats.css("srm low").first.content
            x[:srm_high]   = stats.css("srm high").first.content
          end
          if stats.css("abv").first
            x[:abv_low]    = stats.css("abv low").first.content
            x[:abv_high]   = stats.css("abv high").first.content
          end
        end
        x
      end
    end.flatten
  end

  def self.generate
    styles = StyleGuidelinesParser.new.styles
    styles.each do |style_params|
      puts style_params.keys
      puts "----------"
      style = Style.new(style_params)
      style.save!
    end
  end
end
