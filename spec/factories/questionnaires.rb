FactoryBot.define do
  factory :questionnaire do
    questions { { "q1" => "What is your name?", "q2" => "What is your age?" } }
    title { "Basic Information" }
  end
end
