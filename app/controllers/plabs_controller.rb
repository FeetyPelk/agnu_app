class PlabsController < ApplicationController
  include QueryHelper
  def home
    @Plabs = Plab.find_by_sql(buildquery params)
  end
end
