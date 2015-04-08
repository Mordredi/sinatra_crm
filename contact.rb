class Contact

  attr_accessor :first_name, :last_name, :email, :notes, :id

  def initialize(first_name, last_name, email, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

end