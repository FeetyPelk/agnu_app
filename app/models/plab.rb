class Plab < ActiveRecord::Base
  attr_accessible  :group_boop, :at_bat, :at_home, :avg, :bag, :ball, :bat_team, :batter, :catcher, :center_field,
                   :fteam, :bteam, :first_base, :hit, :left_field, :on_first, :on_second, :on_third, :outz,
                   :pitcher, :rbi, :right_field, :second_base, :shortstop, :strike, :third_base, :runner1b, :runner2b, :runner3b,
                   :walk,:ippies, :obp, :ops, :slg, :earned_runs, :era
end
