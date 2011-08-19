class StylesController < ApplicationController
  def index
    @styles = Style.all(:order => 'id')
  end

  def all_styles
    styles = Style.all(:order => 'id')
    render :json => styles.to_json
  end
end
