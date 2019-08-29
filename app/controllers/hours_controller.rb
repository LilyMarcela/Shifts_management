class HoursController < ApplicationController
  before_action :authenticate_user_from_token!
  load_and_authorize_resource

  def index
    @filtered_by_date = Hour.filter_by_date(params[:date])
    @hours = User.find(params[:user_id]).hours
    render json: @hours
  end

  def new; end

  def show
    render json: @hour
    self.response_body = { error: 'Access denied' }.to_json
  end

  def create
    @hour = Hour.new(hour_params)

    if @hour.save
      render json: @hour, status: :created
    else
      render json: @hour.errors, status: :unprocessable_entity
    end
  end

  def update
    if @hour.update(hour_params)
      render json: @hour
    else
      render json: @hour.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hour.destroy
  end

  private
    # def set_hour
    #   @hour = Hour.find(params[:id])
    # end

    def hour_params
      params.require(:hour)
      .permit(
        :user_id,
        :date_start,
        :date_end,
        :notes
        )
    end
end
