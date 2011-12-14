class StyleComparisonsController < ApplicationController
  before_filter :comparison_count
  def random
    @style_comparison_index = random_index
    @style_comparison = StyleComparison.first(:offset => @style_comparison_index)
  end

  def by_index
    @style_comparison_index = params[:index] || random_index
    @style_comparison = StyleComparison.first(:offset => @style_comparison_index)
  end

  private
  def random_index
    rand(@style_comparison_count)
  end

  def comparison_count
    @style_comparison_count = StyleComparison.count
  end
end
