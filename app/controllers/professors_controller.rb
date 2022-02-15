class ProfessorsController < ApplicationController

  def index
    @prof_list = Professor.order_abc
  end

  def show
    # binding.pry
    @prof_student_list = Professor.find(params[:id]).students
  end

end
