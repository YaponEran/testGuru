module ApplicationHelper

  NOTICE_KEYS = {
    alert: "alert alert-danger", notice: "alert alert-info", success: "alert alert-success",
    warning: "alert alert-warning", primary: "alert alert-primary"
  }

  def current_year
    Date.current.strftime('%Y')
  end

  def github_url(author, repo)
    link_to 'Test-Guru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def class_message(key)
    NOTICE_KEYS[key.to_sym]
  end
end
