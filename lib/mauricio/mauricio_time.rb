class Mauricio::MauricioTime
  def initialize
    @field = "discounttime"
  end

  def diner
    {@field => "18:00:00,23:59:59"}
  end

  def lunch
    {@field => "11:00:00,14:00:00"}
  end

  def now
    current = DateTime.current.strftime("%H:%M:%S")
    {@field => current}
  end

  def today
    {"weekday" => Date.today.wday}
  end

  def tomorrow
    {"weekday" => Date.tomorrow.wday}
  end

  def next_week
    {"weekday" => Date.today.wday}
  end

  def morning
    {@field => "08:00:00,12:00:00"}
  end

  def afternoon
    {@field => "12:00:01,17:59:59"}
  end

  def night
    {@field => "18:00:00,23:59:59"}
  end

  def sunday
    {"weekday" => "1"}
  end

  def monday
    {"weekday" => "2"}
  end

  def tuesday
    {"weekday" => "3"}
  end

  def wednesday
    {"weekday" => "4"}
  end

  def thrusday
    {"weekday" => "5"}
  end

  def saturday
    {"weekday" => "6"}
  end


end