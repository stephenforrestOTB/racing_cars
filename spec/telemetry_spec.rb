require 'spec_helper'
require 'telemetry'
require 'client'
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
  let(:connected_client) {instance_double("TelemetryClient",
     online_status: true,
     disconnect: true,
     connect:  true,
     send: true,
     receive: "DIAGNOSTIC_MESSAGE STUB"
     )}

  context "with a successful connection to a client" do
    it "should return diagnostic message" do
      allow(TelemetryClient).to receive(:new) { connected_client }
      subject.check_transmission
      expect(subject.diagnostic_info).to eq("DIAGNOSTIC_MESSAGE STUB")
    end
  end
end
