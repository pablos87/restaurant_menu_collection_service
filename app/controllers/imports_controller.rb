class ImportsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
    if @import.valid?(import_params) && @import.parse_files
      redirect_to places_path
    else
      render :new
    end
  end

  private

  def import_params
    params.fetch(:import, {}).permit(data_files: [])
  end
end
