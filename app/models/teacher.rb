class Teacher < ApplicationRecord
  validate :valid_email_domain

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  private

  def valid_email_domain
    allowed_domains = ['karazin.ua']
    email_domain = email.split('@').last if email.present?
    unless allowed_domains.include?(email_domain)
      errors.add(:email, "wrong domen")
    end
  end

end
