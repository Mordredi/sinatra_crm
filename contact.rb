class Contact

  attr_accessor :first_name, :last_name, :email, :notes, :id
  # FIELDS = [:first_name, :last_name, :email, :notes, :id]
  # attr_accessor *FIELDS

  def initialize(first_name, last_name, email, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
    # update_attributes(attrs)
  end
  # def sanitize(attrs)
  #   attrs.keep_if { |k,v| FIELDS.include? k.to_sym }
  # end

  # def update_attributes(attrs)
  #   sanitize(attrs).each do |k,v|
  #     ivar = "@#{k}"
  #     instance_variable_set(ivar, v)
  #   end
  # end

  # def to_s
  #   FIELDS.map { |field| "#{k}: #{send(field)}" }.join(", ")
  # end

end