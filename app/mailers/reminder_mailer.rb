class ReminderMailer < ApplicationMailer
  def schedule_email(reminder, recipient)
    @reminder = reminder
    mail to: recipient, subject: 'Reminder'
  end
end
