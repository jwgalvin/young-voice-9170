class ProfessorsController < ApplicationController

  def index
    @prof_list = Professor.order_abc
  end

end
