module ApplicationHelper

  def current_year
    Date.current.strftime('%Y')
  end

  def github_url(author, repo)
    link_to 'Test-Guru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class: "flash-#{type}"
    end
  end
  
end
