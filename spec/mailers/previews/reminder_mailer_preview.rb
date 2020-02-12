# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/reminder_mailer/schedule_email
  def schedule_email
    ReminderMailer.schedule_email(FactoryBot.build(:reminder), 'to@example.com')
  end
end
