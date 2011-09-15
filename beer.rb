require 'dm-core'
require 'dm-infinispan-adapter'

class Beer
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :rating, Integer
  property :notes, Text
end

DataMapper.setup(:default, :adapter=>'infinispan', :persist=>true)
DataMapper.finalize


