class Sourdough < ActiveRecord::Base
#  searchkick mappings: {
#      Sourdough: {
#          properties: {
#              namo: {type: "string", analyzer: "standard",
#                     fields:{raw: { type:  "string", index: "not_analyzed"}} }
#         }
#      }
#  }

  searchkick merge_mappings: true, mappings: {
               sourdough: {
                 properties: {
                   namo: {
                         type: "string",
                         analyzer: "searchkick_word_start_index"
                  },

              #     namokey: {
              #         type: "string",
               #        analyzer: "keyword"
                #   },
                   first_name: {
                       type: "string",
                       analyzer: "keyword"
                   },
                   last_name: {
                       type: "string",
                       analyzer: "keyword"
                   },

                   #     id: {
              #       type: "integer"
              #     },
               #    plays: {
                #     type: "integer"
                #   },
                   player_key: {
                     type: "integer" ,
                     index: "not_analyzed"
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



  attr_accessible :end_date, :namo, :namokey, :player_key, :start_date, :end_date
end
