class Author < ActiveRecord::Base
  attr_accessible :name
  searchkick mappings: {
      author: {
          properties: {
              name: {
                  type: "string",
                  analyzer: "standard"
               }
          }
      }
  }
end
