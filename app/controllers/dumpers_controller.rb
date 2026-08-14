class DumpersController < ApplicationController
  def showDumpers
    @dumpers=Dumper.all
    render json: @dumpers
  end

end
