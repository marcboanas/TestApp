module ApplicationHelper
  def full_title(page_title)
    base_title = "Accounts Hero"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end

def date_format
    self.date.strftime("%a #{self.date.day.ordinalize} %b, 20%y")
end

def duration_format
    Time.at(self.duration * 60).utc.strftime("%H:%M")
end
