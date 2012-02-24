Bjcp::Application.routes.draw do
  root :to => 'styles#index'
  match 'styles/all' => 'styles#all_styles'
  match 'styles/all_names' => 'styles#all_names'
  match 'styles/styles_with_city' => 'styles#styles_with_city'
  match 'styles/styles' => 'styles#styles'
  match 'styles/show' => 'styles#show'
  match 'all_grain_recipe' => 'all_grain_recipes#sample'
  match 'style_comparisons/random' => 'style_comparisons#random'
  match 'style_comparisons/for_exam' => 'style_comparisons#for_exam'
  match 'judge_levels/all_levels' => 'judge_levels#all_levels'
  match 'judge_procedure/all' => 'judge_procedure#all_questions'
  match 'judge_procedure/sample' => 'judge_procedure#sample'
  match 'characteristics/sample' => 'characteristics#sample'
  # match 'quizzes/styleCode' => 'quizzes#style_code'
  # match 'quizzes/appearance' => 'quizzes#appearance'
  match 'quizzes' => 'quizzes#show'
  match 'takeSampleExam' => 'quizzes#takeSampleExam'
  match 'purpose' => 'quizzes#purpose'
  match 'tf' => 'quizzes#tf'
end
