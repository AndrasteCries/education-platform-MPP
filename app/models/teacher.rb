# frozen_string_literal: true

class Teacher < ApplicationRecord
  validate :valid_email_domain

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subjects
  has_many :messages, as: :recipient
  def first_initials
    "#{last_name} #{first_name.first}. #{middle_name.first}."
  end

  def self.recent(limit)
    order(created_at: :desc).limit(limit)
  end

  private

  def valid_email_domain
    allowed_domains = ["karazin.ua"]
    email_domain = email.split("@").last if email.present?
    return if allowed_domains.include?(email_domain)

    errors.add(:email, "wrong domen")
  end
end
