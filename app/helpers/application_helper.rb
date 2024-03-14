module ApplicationHelper
  def month_offset(date)
    date.beginning_of_month.wday - 1
  end

  def today?(date)
    date == Date.today
  end

  def today_class(date)
    'bg-amber-100' if today?(date)
  end
end
