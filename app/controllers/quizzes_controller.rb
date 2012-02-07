class QuizzesController < ApplicationController
  def show
    render 'quizzes/styleQuizzes'
  end

  def purpose
    render 'quizzes/purpose'
  end
end
