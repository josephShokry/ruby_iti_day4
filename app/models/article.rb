class Article < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  before_save :archive_if_needed

  scope :un_archived, -> { where(archived: false) }
  
  private

  def archive_if_needed
    if reports_count >= 3
      self.archived = true
    end
  end
end
