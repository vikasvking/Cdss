class DumpersController < ApplicationController
  def showDumpers
    @dumpers=Dumper.all
    render json: @dumpers
  end

  def create_dumpers
    @dumper=Dumper.new(dumper_params)
    if @dumper.save
      render json: @dumper,status: :created
    else
      render json: @dumper.errors, status: :unprocessable_entity
    end
  end
  private
  def dumper_params
    params.require(:dumper).permit(:name,:project,:slno)
  end

end
