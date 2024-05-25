class Subject < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :teacher
  has_many :lessons

  scope :my_subjects, StudentSubjects

  def self.recent(limit)
    order(created_at: :desc).limit(limit)
  end

  def self.to_csv
    attributes = %w{id title description hours created_at updated_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |item|
        csv << attributes.map { |attr| item.send(attr) }
      end
    end
  end

end
