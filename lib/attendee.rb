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
    @normal         = Normalize.new
    @reg_date       = @normal.regdate(data[:regdate])
    @first_name     = @normal.first_name(data[:first_name])
    @last_name      = @normal.last_name(data[:last_name])
    @email_address  = @normal.email_address(data[:email_address])
    @home_phone     = @normal.home_phone(data[:homephone])
    @street         = @normal.street(data[:street])
    @city           = @normal.city(data[:city])
    @state          = @normal.state(data[:state])
    @zipcode        = @normal.zipcode(data[:zipcode])
  end
end
