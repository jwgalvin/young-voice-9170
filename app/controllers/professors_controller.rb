class ProfessorsController < ApplicationController

  def index
    @prof_list = Professor.order_abc
  end

  def show
    @prof_student_list = Professor.find(params[:id]).students
    # binding.pry
    accum = 0
    @prof_student_list.each do |student|
      accum += student.age
    end
    @avg_age = accum / @prof_student_list.count


  end


end
