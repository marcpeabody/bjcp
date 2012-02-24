class AllGrainRecipesController < ApplicationController
  def sample
    render :json => AllGrainRecipe.sample.to_json
  end
end
