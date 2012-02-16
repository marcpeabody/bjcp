class QuizzesController < ApplicationController
  def takeSampleExam
    render 'quizzes/bjcpQuiz.html'
  end

  def show
    render 'quizzes/styleQuizzes'
  end

  def purpose
    render 'quizzes/purpose'
  end
end
