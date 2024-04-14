class QuestionnaireSent < ApplicationRecord
  belongs_to :psychologist
  belongs_to :evaluated
  belongs_to :questionnaire
end
