class HomeController < ApplicationController
  def index
    @questions = Question.all
  end

  def terms
  end

  def privacy
  end
end
