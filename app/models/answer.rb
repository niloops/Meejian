class Answer
  include Mongoid::Document

  field :question, type: String
  field :answer, type: String

  embedded_in :interview
end
