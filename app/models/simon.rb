class Simon < ActiveRecord::Base
  def search_data
    as_json only: [:term, :value]
  end

  searchkick
  attr_accessible :term, :value
end
