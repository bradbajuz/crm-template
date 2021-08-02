class Company < ApplicationRecord
  validates :name, length: { maximum: 255 }
  validates :brand, length: { maximum: 8 }
  validates :title, length: { maximum: 255 }
  validates :welcome_page_heading, length: { maximum: 255 }
  validates :welcome_page_subheading, length: { maximum: 255 }
  validate :only_one_company, on: :create

  private

  def only_one_company
    errors.add(:base) if Company.count > 0
  end
end
