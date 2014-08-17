class Plab < ActiveRecord::Base
  attr_accessible  :group_boop, :at_bat, :at_home, :avg, :bag, :ball, :bat_team, :batter, :catcher, :center_field,
                   :fteam, :bteam, :first_base, :hit, :left_field, :on_first, :on_second, :on_third, :outz,
                   :pitcher, :rbi, :right_field, :second_base, :shortstop, :strike, :third_base, :runner1b, :runner2b, :runner3b,
                   :walk,:ippies, :obp, :ops, :slg, :earned_runs, :era,
                   :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8, :c9, :c10, :c11,
                   :c12, :c13, :c15, :c16, :c17, :c18, :c19, :c20, :c22, :c21
end
