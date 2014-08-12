class Attendee
  attr_reader :reg_date,
              :first_name,
              :last_name,
              :email_address,
              :home_phone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data)
    @reg_date      = data[:regdate] #normalize.reg_date
    @first_name    = data[:first_name]
    @last_name     = data[:last_name]
    @email_address = data[:email_address]
    @home_phone    = data[:homephone]
    @street        = data[:street]
    @city          = data[:city]
    @state         = data[:state]
    @zipcode       = data[:zipcode]
  end
end
