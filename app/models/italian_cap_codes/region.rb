module ItalianCapCodes
  class Region < ActiveRecord::Base
    has_many :provinces
  end
end
