require 'rails_helper'

RSpec.describe Reminder, type: :model do
  subject { build(:reminder) }

  describe 'validations' do
    %w[title body date].each do |attribute|
      describe attribute do
        it 'must be present' do
          expect(subject).to be_valid
          subject[attribute] = nil
          expect(subject).to_not be_valid
        end
      end
    end
  end
end
