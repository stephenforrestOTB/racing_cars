class Sensor
  OFFSET = 16

  def pop_next_pressure_psi_value
    Sensor::OFFSET + Sensor.sample_pressure()
  end

  def self.sample_pressure
    # placeholder implementation that simulate a real sensor in a real tire
    6 * rand * rand
  end

end

class Alarm

  attr_reader :is_alarm_on, :low_pressure_threshold, :high_pressure_threshold

  def initialize(low,high)
    @low_pressure_threshold = low
    @high_pressure_threshold = high
    @sensor = Sensor.new()
    @is_alarm_on = false
  end

  def check
    unless psi.between?(low_pressure_threshold, high_pressure_threshold)
      @is_alarm_on = true
    end
  end
  private

  def psi
    @sensor.pop_next_pressure_psi_value()
  end
end
