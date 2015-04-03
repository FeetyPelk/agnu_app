class Article < ActiveRecord::Base
  belongs_to :author
  attr_accessible :body, :title

  searchkick autocomplete: ['title']
end
                                                                                                            Article