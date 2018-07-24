class Patient
  attr_reader :name, :cured
  attr_accessor :room, :id
  # STATE:
  # - name: string
  # - cured: boolean
  # - ailment: string

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @room = attributes[:room]
    @cured = attributes[:cured] || false
  end

  # # attr_reader
  # def name
  #   @name
  # end

  # # attr_accessor
  # def name=(value)
  #   @name = value
  # end

  def cure
    @cured = true
  end
end

# paul = Patient.new(cured: false, name: "John")
# p paul

# ringo = Patient.new(name: "Ringo")
# p ringo

# ringo.cure
# p ringo
