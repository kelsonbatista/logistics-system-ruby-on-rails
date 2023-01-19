class DeadlinesController < ApplicationController
  before_action :find_deadline, only: [:edit, :update, :destroy]

  def index
    @deadlines = Deadline.all
  end

  def destroy
    if @deadline.destroy
      flash[:notice] = "Prazo excluído com sucesso"
      return redirect_to deadlines_path
    end
    flash.now[:alert] = "Erro ao excluir o prazo"
    render :index, status: :unprocessable_entity
  end

  def new
    @deadline = Deadline.new
    @modes = Mode.all.order(:name)
  end

  def create
    @deadline = Deadline.new(deadline_params)
    if @deadline.save
      flash[:notice] = 'Prazo cadastrado com sucesso'
      return redirect_to deadlines_path
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = 'Erro ao cadastrar prazo'
    render :new, status: :unprocessable_entity
  end

  def edit
    @modes = Mode.all.order(:name)
  end

  def update
    if @deadline.update(deadline_params)
      flash[:notice] = "Prazo atualizado com sucesso"
      return redirect_to deadlines_path
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = "Erro ao atualizar o prazo"
    render :edit, status: :unprocessable_entity
  end

  private

  def deadline_params
    params.require(:deadline).permit(:min_distance, :max_distance, :deadline, :mode_id)
  end

  def find_deadline
    @deadline = Deadline.find(params[:id])
  end
end
