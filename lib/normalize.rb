class Normalize
  attr_reader :failure
  def initialize
    @failure = 'no info available'
  end

  def regdate(date)
    return failure if null?(date)
    date.strip[0].gsub(/-/, '/')
  end

  def regtime(time)
    return failure if null?(time)
    time.strip[1]
  end

  def first_name(name)
    return failure if null?(name)
    name.downcase
  end

  def last_name(name)
    return failure if null?(name)
    name.downcase
  end

  def email_address(address)
    return failure if null?(address)
    address.downcase
  end

  def home_phone(phone)
    return failure if null?(phone)
    raw = phone.gsub(/\D/, '')
    "(#{raw[0..2]})#{raw[3..5]}-#{raw[5..-1]}"
  end

  def street(street)
    return failure if null?(street)
    street.downcase
  end

  def city(city)
    return failure if null?(city)
    city.downcase
  end

  def state(state)
    return failure if null?(state)
    state.strip.upcase
  end

  def zipcode(zip)
    return failure if null?(zip)
    zip.strip.rjust(5, '0')
  end

  def null?(arg)
    arg.nil? || arg.strip.empty?
  end
end
