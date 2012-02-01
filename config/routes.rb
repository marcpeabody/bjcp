Bjcp::Application.routes.draw do
  root :to => 'styles#index'
  match 'styles/all' => 'styles#all_styles'
  match 'styles/styles' => 'styles#styles'
  match 'styles/show' => 'styles#show'
  match 'style_comparisons/random' => 'style_comparisons#random'
  match 'judge_procedure/all' => 'judge_procedure#all_questions'
  # match 'quizzes/styleCode' => 'quizzes#style_code'
  # match 'quizzes/appearance' => 'quizzes#appearance'
  match 'quizzes' => 'quizzes#show'
end
