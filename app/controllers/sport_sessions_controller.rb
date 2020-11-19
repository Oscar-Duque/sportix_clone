class SportSessionsController < ApplicationController
  def index
    if params[:query].present?
      @sport_sessions = policy_scope(SportSession)
      sql_query = "sport ILIKE :query"
      @sport_sessions = SportSession.where(sql_query, query: "%#{params[:query]}%")
    else
      @sport_sessions = policy_scope(SportSession)
    end
  end

  def show
    @booking = Booking.new
    @sport_session = SportSession.find(params[:id])
    authorize(@sport_session)
  end

  def new
    @user = current_user
    @sport_session = SportSession.new
    authorize(@sport_session)
  end

  def create
    @user = current_user
    @sport_session = SportSession.new(session_params)
    @sport_session.user = current_user
    authorize(@sport_session)
    if @sport_session.save!
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @sport_session = SportSession.find(params[:id])
    authorize(@sport_session)
    @sport_session.destroy
    redirect_to user_path(current_user)
  end

  private

  def session_params
    params.require(:sport_session).permit(:sport, :title, :description, :location, :start_time,
                                           :finish_time, :price, :rating, :session_cover_picture, :capacity,
                                           :created_at, :updated_at, :user_id, :photo)
  end
end
