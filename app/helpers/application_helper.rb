module ApplicationHelper
  def format_date created_at, show_time = false
    format = '%B %d, %Y' + (show_time === true ? ' %T' : '')
    Date.parse(created_at.to_s).strftime(format)
  end
end
