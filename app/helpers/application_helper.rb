module ApplicationHelper
  def fix_url(url)
    url.starts_with?("http://") ? url : "http://" + url
  end

  def display_datetime(time)
    time.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end