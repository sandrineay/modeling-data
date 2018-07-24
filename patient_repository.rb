require "csv"
require_relative "patient"
require_relative "room_repository"

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @patients = []
    @room_repository = room_repository
    load_csv
  end

  def add(patient)
    next_id = @patients.length + 1
    patient.id = next_id
    @patients << patient
    # save_csv
  end

  private

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      # row[:room_id] => Instance of room
      # Fetch into Room repo the instance of room with the id row[:room_id].to_i
      room = @room_repository.find(row[:room_id].to_i)
      patient = Patient.new(row)
      patient.room = room
      room.add(patient)
      @patients << patient
    end
  end
end

room_repo = RoomRepository.new("rooms.csv")
patient_repo = PatientRepository.new("patients.csv", room_repo)

p patient_repo










