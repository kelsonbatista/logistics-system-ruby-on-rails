class HomeController < ApplicationController
  def index
    @home = root_path ? true : false
    @login = request.path == root_path ? true : false
  end
end
