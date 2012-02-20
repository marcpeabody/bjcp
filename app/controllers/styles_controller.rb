class StylesController < ApplicationController
  def index
    @styles = Style.all(:order => 'id')
  end

  def all_styles
    styles = Style.all(:order => 'id')
    render :json => styles.to_json
  end

  def styles
    if limit = params[:limit]
      styles = Style.sample(limit)
    else
      styles = Style.all
    end
    render :json => styles.to_json
  end

  def styles_with_city
    styles = Style.with_cities
    render :json => styles.to_json
  end

  def all_names
    render :json => Style.all_names.to_json
  end

  def show
  end
end
