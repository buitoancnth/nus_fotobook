module ApplicationHelper

  def format_time time
    Time.zone.at(time).strftime("%I:%M %p %m/%d/%Y")
  end
end
