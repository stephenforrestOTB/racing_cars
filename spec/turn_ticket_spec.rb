require 'spec_helper'
require 'turn_ticket'

RSpec.describe TicketDispenser do
  context "one dispenser" do
    let(:ticket_zero) {subject.get_turn_ticket}
    let(:ticket_one) {subject.get_turn_ticket}
    it "returns a ticket object" do

      expect(subject.get_turn_ticket.class).to eq(TurnTicket)
    end
    it "always returns a new ticket" do

      expect(ticket_zero.object_id == ticket_one.object_id).to be(false)
    end
    it "always return a different number" do

      expect(ticket_zero.turn_number).to_not eq(ticket_one.turn_number)
    end
    it "increments number by 1 each ticket" do
      ticket_zero_id = ticket_zero.turn_number
      ticket_one_id = ticket_one.turn_number

      expect(ticket_one_id).to eq(ticket_zero_id + 1)
    end
  end
  context "multiple dispensers" do
    let(:second_dispenser) {TicketDispenser.new}
    it "increments number by 1 each ticket regardless of dispenser" do
      ticket_zero_id = subject.get_turn_ticket.turn_number
      ticket_one_id = second_dispenser.get_turn_ticket.turn_number

      expect(ticket_one_id).to eq(ticket_zero_id + 1)
    end
  end
end
