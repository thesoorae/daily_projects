class Question < ActiveRecord::Base
  validates :poll_id, :question_text, presence: true

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    r = Hash.new(0)
    answer_choices.each do |choice|
      r[choice.answer_text] = choice.responses.count
    end
    r
  end
end
