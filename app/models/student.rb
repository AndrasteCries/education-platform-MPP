class Student < ApplicationRecord
  VALID_CURRENCIES = %w[USD EUR UAH].freeze
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :currency, presence: true, inclusion: { in: VALID_CURRENCIES }

  has_and_belongs_to_many :groups
  has_many :student_responses
  has_many :messages, as: :recipient
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def currency_rates
    CurrencyRateService.call(self)
  end
end
