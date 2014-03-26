class PlabsController < ApplicationController
  def home
    @Plabs = Plab.find_by_sql("select at_bat from play_facts limit 5")
  end
end
