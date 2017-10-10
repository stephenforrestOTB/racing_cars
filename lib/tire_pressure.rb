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

  attr_reader :is_alarm_on, :acceptable_range

  def initialize(range, sensor)
    @acceptable_range = range
    @sensor = sensor
    @is_alarm_on = false
  end

  def override
    @is_alarm_on = !@is_alarm_on
  end

  def check
    unless acceptable_range.cover?(psi)
      @is_alarm_on = true
    end
  end
  private

  def psi
    @sensor.pop_next_pressure_psi_value()
  end
end
