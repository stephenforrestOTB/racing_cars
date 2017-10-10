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
  def initialize(sequence_generator = TurnNumberSequence)
    @sequence_generator = sequence_generator
  end
  def get_turn_ticket
    TurnTicket.new(next_number)
  end
  private
  def next_number
    @sequence_generator.next_turn_number
  end
end
