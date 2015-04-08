class Rolodex

  attr_accessor :contacts

  def initialize
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(id)
    @contacts.find { |contact| contact.id == id  }#contact.id == id }
  end

  def delete_contact(id)
    @contacts.delete(find(id))
  end

end