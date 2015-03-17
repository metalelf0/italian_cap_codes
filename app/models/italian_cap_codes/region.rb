module ItalianCapCodes
  class Region < ActiveRecord::Base
    has_many :provinces
    has_many :comunes, through: :provinces
  end
end
