require "json"


options = {
  status:  :published,
  city: 3223,
  tags:    {"crystal", "ruby", "sweet"},
  context: {
    user: {
      id: 123,
    }
  }
}


def self.test
  puts options
end
hash =  options.to_h
hash[:username]=322
puts hash


nm =  {} of String =>Time
puts typeof(Time.now)
nm["1"]= Time.now
nm.delete ("2")
puts nm
puts PROGRAM_NAME
