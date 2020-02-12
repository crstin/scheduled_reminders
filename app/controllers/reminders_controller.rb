class RemindersController < ApplicationController
  before_action :set_reminder, only: %i[show edit update destroy]

  def index
    @reminders = Reminder.all
  end

  def show; end

  def new
    @reminder = Reminder.new
  end

  def edit; end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.user_id = current_user.id

    if @reminder.save
      redirect_to @reminder, notice: 'Reminder was successfully created.'
      set_email_schedule
    else
      render :new
    end
  end

  def update
    if @reminder.update(reminder_params)
      redirect_to @reminder, notice: 'Reminder was successfully updated.'
      set_email_schedule
    else
      render :edit
    end
  end

  def destroy
    @reminder.destroy
    redirect_to reminders_url, notice: 'Reminder was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reminder_params
    params.require(:reminder).permit(:title, :body, :date, :user_id)
  end

  def set_email_schedule
    ReminderMailer.schedule_email(@reminder, current_user.email).deliver_later!(wait_until: @reminder.date)
  end
end
