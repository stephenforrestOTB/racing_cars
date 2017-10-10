require 'spec_helper'
require 'telemetry'

RSpec.describe TelemetryDiagnostics do
  let(:diagnostic_message) {"
LAST TX rate................ 100 MBPS\r\n
HIGHEST TX rate............. 100 MBPS\r\n
LAST RX rate................ 100 MBPS\r\n
HIGHEST RX rate............. 100 MBPS\r\n
BIT RATE.................... 100000000\r\n
WORD LEN.................... 16\r\n
WORD/FRAME.................. 511\r\n
BITS/FRAME.................. 8192\r\n
MODULATION TYPE............. PCM/FM\r\n
TX Digital Los.............. 0.75\r\n
RX Digital Los.............. 0.10\r\n
BEP Test.................... -5\r\n
Local Rtrn Count............ 00\r\n
Remote Rtrn Count........... 00"}

  context "with a successful connection to a client" do
    it "should return diagnostic message" do
      allow(subject.telemetry_client).to receive(:online_status) { true }
      subject.check_transmission
      expect(subject.diagnostic_info).to eq(diagnostic_message)
    end
  end
end