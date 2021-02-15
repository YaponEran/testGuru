module BadgesHelper
  def badge_notification(badges)
    I18n.t('helpers.badges_helper.message', count: badges.count)
  end
end
