class JudgeLevelsController < ApplicationController
  def all_levels
    render :json => JUDGE_LEVELS
  end

JUDGE_LEVELS = [
  {:level => "Apprentice", :min_score=>'<60',
   :min_points=>'0', :judge_points=>'0', :gm_required=>false},
  {:level => "Recognized", :min_score=>'60',
   :min_points=>'0', :judge_points=>'0', :gm_required=>false},
  {:level => "Certified", :min_score=>'70',
   :min_points=>'5', :judge_points=>'2.5', :gm_required=>false},
  {:level => "National", :min_score=>'80',
   :min_points=>'20', :judge_points=>'10', :gm_required=>false},
  {:level => "Master", :min_score=>'90',
   :min_points=>'40', :judge_points=>'20', :gm_required=>false},
  {:level => "Grand Master", :min_score=>'90',
   :min_points=>'100', :judge_points=>'50', :gm_required=>true},
  {:level => "Grand Master II+", :min_score=>'90',
   :min_points=>'100 per level',
   :judge_points=>'50 per level', :gm_required=>true},
]
end
