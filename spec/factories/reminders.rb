FactoryBot.define do
  factory :reminder do
    title { 'TitleTestMsg' }
    body { 'BodyTestMsg' }
    date { '2020-02-20 02:02:02' }
    user
  end
end
