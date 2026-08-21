class HemmsController < ApplicationController
  before_action :set_hemm, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session
  # GET /hemms or /hemms.json
  def index
    @hemms = Hemm.all
  end

  # GET /hemms/1 or /hemms/1.json
  def show
  end

  # GET /hemms/new
  def new
    @hemm = Hemm.new
  end

  # GET /hemms/1/edit
  def edit
  end

  # POST /hemms or /hemms.json
  def create
    @hemm = Hemm.new(hemm_params)

    respond_to do |format|
      if @hemm.save
        format.html { redirect_to @hemm, notice: "Hemm was successfully created." }
        format.json { render :show, status: :created, location: @hemm }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @hemm.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /hemms/1 or /hemms/1.json
  def update
    respond_to do |format|
      if @hemm.update(hemm_params)
        format.html { redirect_to @hemm, notice: "Hemm was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @hemm }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @hemm.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /hemms/1 or /hemms/1.json
  def destroy
    @hemm.destroy!

    respond_to do |format|
      format.html { redirect_to hemms_path, notice: "Hemm was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hemm
      @hemm = Hemm.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def hemm_params
      params.expect(hemm: [ :make, :model, :slno, :location ])
    end
end
