class Pepe::PepeTime
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
end