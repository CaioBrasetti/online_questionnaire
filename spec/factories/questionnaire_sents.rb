FactoryBot.define do
  factory :questionnaire_sent do
    status { ["pending", "completed", "in_progress"].sample }
    link_email { "linkwhere" }
    answers { { "q1" => "Answer 1", "q2" => "Answer 2" } }
    points { 0 }

    psychologist
    evaluated
    questionnaire
  end
end
