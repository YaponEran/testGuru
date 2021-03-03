module Admin::BadgesHelper
  def category_rule
    Badge::RULES[0]
  end

  def first_try_rule
    Badge::RULES[1]
  end

  def level_rule
    Badge::RULES[2]
  end
end
