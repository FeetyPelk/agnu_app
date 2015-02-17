class SearchController < ApplicationController
  class SearchController < ApplicationController
    def query
      # Get the search terms from the q parameter and do a search
      # as we seen in the previous part of the article.
      puts 'agNOOOOOOOOO'
      $foofter = false
      begin
        boopies = Article.search query: {match: {body: q}}   #this works,, period
      rescue
        $foofter = true;
      end
      #boopies = Sourdough.search query: {match: {namoraw:"Derek Jeter"}}
      # boopies = Sourdough.search
      # {
      #    query: {
      #    match: {
      #     namo: "derek jeter"
      #}
      # }
      #}

      if $foofter
        puts "************ MESSED UP ******************"
      else
        #############################boopies.each do |boopy|
        respond_to do |format|
          format.json do
            # Create an array from the search results.
            results = boopies.each do |boopy|
              # Each element will be a hash containing only the title of the article.
              # The title key is used by typeahead.js.
              { title: boopies.body }
            end
            render json: results
          end
        end

        ########################   $ES_player_key = boopy.player_key
        #######################3   puts '///////   '+boopy.player_key.to_s+'   ////////////'

      end

    end
  end
end
