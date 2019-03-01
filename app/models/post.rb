# frozen_string_literal: true

class Post < ApplicationRecord
  validates_presence_of :date, :rationale
  belongs_to :user, dependent: :destroy
end
