# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :recipient, polymorphic: true
end
