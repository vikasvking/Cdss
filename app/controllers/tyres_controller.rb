class TyresController < ApplicationController
  before_action :set_hemm
  before_action :set_tyre, only: %i[ show edit update destroy ]

  # GET /tyres or /tyres.json
  def index
    @tyres = @hemm.tyres.all
  end

  # GET /tyres/1 or /tyres/1.json
  def show
  end

  # GET /tyres/new
  def new
    @tyre = @hemm.tyres.new
  end

  # GET /tyres/1/edit
  def edit
  end

  # POST /tyres or /tyres.json
  def create
    @tyre = @hemm.tyres.new(tyre_params)

    respond_to do |format|
      if @tyre.save
        redirect_to hemm_tyres_path(@hemm), notice: "Tyre was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /tyres/1 or /tyres/1.json
  def update
    respond_to do |format|
      if @tyre.update(tyre_params)
        redirect_to hemm_tyres_path(@hemm), notice: "Tyre was successfully updated."
      else
        redirect_to :edit, status: :unprocessable_content

      end
    end
  end

  # DELETE /tyres/1 or /tyres/1.json
  def destroy
    @tyre.destroy!

    respond_to do |format|
      redirect_to hemm_tyre_path(@hemm)
    end
  end

  private
  def set_hemm
    @hemm=Hemm.find(params[:hemm_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_tyre
      @tyre = @hemm.tyres.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tyre_params
      params.require(:tyre).permit(
      :position,
      :pressure,
      :sensor_id,
      :active
      )
    end
end
