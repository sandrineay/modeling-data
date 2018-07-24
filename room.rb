require_relative "patient"

class Room
  attr_accessor :id
  # STATE:
  # - capacity: fixnum
  # - patients: array of instances of Patient

  def initialize(attributes = {})
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def full?
    @capacity == @patients.length
  end

  def add(patient)
    patient.room = self
    @patients << patient
  end
end

# room_1 = Room.new(capacity: 2)
# paul = Patient.new(name: "Paul")

# room_1.add(paul)

# p room_1

# p paul.room
# => room_1 ....














