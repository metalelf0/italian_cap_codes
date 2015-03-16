module ItalianCapCodes
  class Comune < ActiveRecord::Base
    belongs_to :province
  end
end
