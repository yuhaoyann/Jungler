class Sale < ActiveRecord::Base

  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?",
    Date.current, Date.current)
  end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

  validates :name, presence: true
  validates :percent_off, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validate :end_date_is_after_start_date
  validate :percent_off_should_be_valid

  private

  def end_date_is_after_start_date
    if ends_on < starts_on
      errors.add(:ends_on, 'cannot be before the start date')
    end
  end

  def percent_off_should_be_valid
    if percent_off > 100 || percent_off < 0
      errors.add(:percent_off, 'shoud be between 0 and 100')
    end
  end

end
