class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true, uniqueness: true
  validates :rule, presence: true, uniqueness: { scope: :rule_value}
  validates :octicon, presence: true, uniqueness: { scope: :color }
  validate :validate_rule_value

  OCTICONS = %w(file-code flame heart mortar-board pulse rocket ruby)
  COLORS =  %w(black white red blue green yellow)
  RULES =  %w(all_by_category all_tests first_try all_by_level)

  private

  def validate_rule_value
    send("validate_#{rule}") if rule != "all_tests"
  end

  def validate_all_by_category
    if Category.all.pluck(:id).exclude?(rule_value.to_i)
      errors.add(:category, "Invalid category id.")
    end
  end

  def validate_first_try
    if Test.all.pluck(:id).exclude?(rule_value.to_i)
      errors.add(:test, "Invalid test id.")
    end
  end

  def validate_all_by_level
    if Test.distinct.pluck(:level).exclude?(rule_value.to_i)
      errors.add(:test, "Invalid test level.")
    end
  end

end
