class SportSessionsController < ApplicationController
  def index
    @sport_sessions = policy_scope(SportSession)
  end

  def show
    @booking = Booking.new
    @sport_session = SportSession.find(params[:id])
    authorize(@sport_session)
  end

  def new
    @user = User.find(params[:user_id])
    @sport_session = SportSession.new
    authorize(@sport_session)
  end

  def create
    @user = User.find(params[:user_id])
    @sport_session = SportSession.new(session_params)
    if @sport_session.save
      redirect_to sport_session_path
    else
      render :new
    end
  end

  def destroy
    authorize @sport_session
    @sport_session.destroy
    redirect_to sport_sessions_url
  end

  private

  def session_params
    params.require(:sport_sessions).permit(:sport, :title, :description, :location, :start_time,
                                           :duration, :price, :rating, :session_cover_picture, :capacity,
                                           :created_at, :updated_at, :user_id, :photo)
  end
end
