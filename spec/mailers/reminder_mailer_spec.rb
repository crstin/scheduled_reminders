require 'rails_helper'

RSpec.describe ReminderMailer, type: :mailer do
  describe 'Email delivery' do
    let(:reminder) { build :reminder }
    let(:mail) { ReminderMailer.schedule_email reminder, 'to@example.org' }

    it 'renders the headers' do
      expect(mail.subject).to eq 'Reminder'
      expect(mail.to).to eq ['to@example.org']
      expect(mail.from).to eq ['from@example.com']
    end

    it 'renders the body' do
      expect(mail.body.encoded).to have_content reminder.title
      expect(mail.body.encoded).to have_content reminder.body
    end
  end

  describe 'Scheduled email' do
    before { clear_enqueued_jobs }
    let(:reminder) { create :reminder }

    it 'queues the reminder' do
      expect { ReminderMailer.schedule_email(reminder, 'to@example.org').deliver_later(wait_until: reminder.date) }.to have_enqueued_job.on_queue('mailers')
      expect { ReminderMailer.schedule_email(reminder, 'to@example.org').deliver_later(wait_until: reminder.date) }.to have_enqueued_job.at(reminder.date)
    end
  end
end
