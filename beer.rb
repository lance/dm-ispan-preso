class Beer
  include DataMapper::Resources

  property :id, Serial
  property :name, String
  property :rating, Integer
  property :notes, Text
end
