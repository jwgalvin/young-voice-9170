class StudentsController < ApplicationController

  def index
    @students =  Student.order_abc
    #@num_of_profs = Student.find(params[:id]).professors_count
  end

end
