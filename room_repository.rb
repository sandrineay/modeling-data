require "csv"
require_relative "room"

class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms[id - 1]
  end

  private

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end
  end
end
