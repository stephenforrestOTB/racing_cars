require 'spec_helper'
require 'tire_pressure'

RSpec.describe "Tire pressure alarm" do
  let(:alarm) {Alarm.new((17..22), Sensor.new)}

  context "with safe tire pressure" do
    it "not sound the alarm" do
      allow(Sensor).to receive(:sample_pressure) { 3 }
      alarm.check
      expect(alarm.is_alarm_on).to be(false)
    end
  end
  context "with unsafe tire pressures" do
    it "sound the alarm if too low" do
      allow(Sensor).to receive(:sample_pressure) { 0 }
      alarm.check
      expect(alarm.is_alarm_on).to be(true)
    end
    it "sound the alarm if too high" do
      allow(Sensor).to receive(:sample_pressure) { 10 }
      alarm.check
      expect(alarm.is_alarm_on).to be(true)
    end
  end
  context "when override hit" do
    it "toggle alarm on" do
      alarm.override
      expect(alarm.is_alarm_on).to be(true)
    end
    it "toggle alarm off" do
      alarm.override
      expect(alarm.is_alarm_on).to be(true)

      alarm.override
      expect(alarm.is_alarm_on).to be(false)
    end

  end
end
