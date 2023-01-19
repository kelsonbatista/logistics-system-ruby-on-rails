class DeadlinesController < ApplicationController
  def index
    @deadlines = Deadline.all
  end
end
