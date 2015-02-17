class Sourdough < ActiveRecord::Base
#  searchkick mappings: {
#      Sourdough: {
#          properties: {
#              namo: {type: "string", analyzer: "standard",
#                     fields:{raw: { type:  "string", index: "not_analyzed"}} }
#         }
#      }
#  }

  searchkick mappings: {
               sourdough: {
                 properties: {
                   namo: {
                         type: "string",
                         analyzer: "standard"
                  },

                   namokey: {
                     type: "string",
                     analyzer: "keyword"
                  },

                   id: {
                     type: "integer"
                   },
                   plays: {
                     type: "integer"
                   },
                   player_key: {
                     type: "integer"
                   },
                   start_date: {
                     type: "string",
                     index: "not_analyzed"
                   },
                   end_date: {
                     type: "string",
                     index: "not_analyzed"
                   }
                 }
               }
  }



  attr_accessible :end_date, :namo, :namokey, :player_key, :start_date
end
