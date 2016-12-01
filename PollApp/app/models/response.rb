require 'byebug'
class Response < ActiveRecord::Base
validate :respondent_already_answered?
validate :is_author?


belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_id,
  class_name: :AnswerChoice

belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User



has_one :question,
  through: :answer_choice,
  source: :question




  def sibling_responses
    question.responses
      .where.not("responses.id IN (?)", self.id)
      # .where.not("responses", self)
  end

  def respondent_already_answered?
    debugger
    # if sibling_responses.pluck(:user_id).include?(respondent.id)
    if sibling_responses.exists?(user_id: user_id)
      p "pass"
      errors[:respondent] << "already answered"
    end
  end

  def is_author?
    if respondent.id == question.poll.author_id
      errors[:response] << "Author cannot answer"
    end
  end
end
