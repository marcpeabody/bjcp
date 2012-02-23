class CharacteristicsController < ApplicationController
  def sample
    render :json => Characteristic.sample(params[:limit]).to_json
  end
end
