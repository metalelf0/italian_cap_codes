module ItalianCapCodes
  class Province < ActiveRecord::Base
    belongs_to :region
    has_many :comunes

    alias_method :comuni, :comunes
  end
end
