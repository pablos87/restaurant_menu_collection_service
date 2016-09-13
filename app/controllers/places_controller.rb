class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Place
      .accessible_by(current_ability)
      .includes(menus: { events: {} })
      .order('id ASC')
      .search(params[:q])
    @sort_type = params[:q][:s] unless params[:q].blank?
    @places = @q.result.paginate(per_page: 50, page: params[:page])
  end
end
