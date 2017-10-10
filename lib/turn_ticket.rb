class TurnTicket
  attr_reader :turn_number

  def initialize turn_number
    @turn_number = turn_number
  end
end

class TurnNumberSequence

  @@turn_number = -1

  def self.next_turn_number
    @@turn_number += 1

    @@turn_number
  end
end

class TicketDispenser
  attr_reader :sequence_generator, :ticket_type
  def initialize(sequence_generator = TurnNumberSequence, ticket_type = TurnTicket)
    @sequence_generator = sequence_generator
    @ticket_type = ticket_type
  end
  def get_turn_ticket
    ticket_type.new(next_number)
  end
  private
  def next_number
    sequence_generator.next_turn_number
  end
end
