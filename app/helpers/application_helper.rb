module ApplicationHelper
  def fix_url(url)
    url.starts_with?("http://") ? url : "http://" + url
  end

  def display_datetime(time)
    if logged_in? && !current_user.time_zone.blank?
      time = time.in_time_zone(current_user.time_zone)
    end

    time.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end