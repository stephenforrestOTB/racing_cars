class TurnTicket
  attr_reader :ticket_number

  @@turn_number = -1
  def initialize
    @@turn_number += 1
    @ticket_number = @@turn_number
  end
end

class TicketDispenser
  def get_turn_ticket
    TurnTicket.new
  end
end
