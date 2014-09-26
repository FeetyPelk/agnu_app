module QueryHelper

  def flush_left(p_hash)
    ((p_hash.has_key?("c_at_bat")) ||
        (p_hash.has_key?("c_hit")) ||
        (p_hash.has_key?("c_walk")) ||
        (p_hash.has_key?("c_avg")) ||
        (p_hash.has_key?("c_obp")) ||
        (p_hash.has_key?("c_slg")) ||
        (p_hash.has_key?("c_ops")) ||
        (p_hash.has_key?("c_era")) ||
        (p_hash.has_key?("c_whip")) ||
        (p_hash.has_key?("c_rbi")) ||
        (p_hash.has_key?("c_sacfly")) ||
        (p_hash.has_key?("c_hbp")) ||
        (p_hash.has_key?("c_ippies")) ||
        (p_hash.has_key?("c_earned_runs")) )
  end


        def subselect_earned(p_hash)
    if battery?(p_hash)
      subselect_earned_battery(p_hash)
    elsif fieldery?(p_hash)
      subselect_earned_fieldery(p_hash)
    else
      subselect_earned_teamery(p_hash)
    end
  end

  def subselect_earned_battery(p_hash)

     @subselect_earned =  "       (select count(eff.id)
                 from earned_facts_fat eff
                 join fielder_dims fd2 on
                (fd2.id = eff.ern_3
                 or fd2.id = eff.ern_2
                 or fd2.id = eff.ern_1
                 or fd2.id = eff.ern_b) "


    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      @subselect_earned = "#{@subselect_earned} and fd2.pitcher = fd.pitcher "
    end
      if p_hash[:group_catcher] == '1' || !p_hash[:catcher].to_s.blank?
        @subselect_earned = "#{@subselect_earned} and fd2.catcher = fd.catcher "
      end
      if p_hash[:group_first_base] == '1' || !p_hash[:first_base].to_s.blank?
        @subselect_earned = "#{@subselect_earned} and fd2.first_base = fd.first_base "
      end
      if p_hash[:group_second_base] == '1' || !p_hash[:second_base].to_s.blank?
        @subselect_earned = "#{@subselect_earned} and fd2.second_base = fd.second_base "
      end
      if p_hash[:group_third_base] == '1' || !p_hash[:third_base].to_s.blank?
        @subselect_earned = "#{@subselect_earned} and fd2.third_base = fd.third_base "
      end
      if p_hash[:group_shortstop] == '1' || !p_hash[:shortstop].to_s.blank?
        @subselect_earned = "#{@subselect_earned} and fd2.shortstop = fd.shortstop "
      end
      if p_hash[:group_left_field] == '1' || !p_hash[:left_field].to_s.blank?
        @subselect_earned = "#{@subselect_earned} and fd2.left_field = fd.left_field "
      end
      if p_hash[:group_center_field] == '1' || !p_hash[:center_field].to_s.blank?
        @subselect_earned = "#{@subselect_earned} and fd2.center_field = fd.center_field "
      end
      if p_hash[:group_right_field] == '1' || !p_hash[:right_field].to_s.blank?
        @subselect_earned = "#{@subselect_earned} and fd2.right_field = fd.right_field "
      end
    @subselect_earned = "#{@subselect_earned} where eff.ppn_id = pf.id) earned_runs "
    puts @subselect_earned

  end

  def subselect_earned_fieldery(p_hash)
    @subselect_earned =  "CASE when efs.ppn_id IS NULL THEN 0 ELSE 1 END earned_runs"
  end

  def subselect_earned_teamery(p_hash)
    @subselect_earned =  "pf.earned_runs earned_runs "
  end



  def join_add_earned_facts_slim (p_hash)
    if fieldery? p_hash and !battery? p_hash
    @inner_join = "#{@inner_join} left outer join earned_facts_slim efs on efs.ppn_id = pf.id "
    end

  end


  def join_add_player_dims(p_hash)

    if ((p_hash[:group_batter] == '1') ||!p_hash[:batter].to_s.blank?)
      @inner_join = "#{@inner_join} join player_dims pd on pf.player_key = pd.id "
      if !p_hash[:batter].to_s.blank?
        @inner_join = "#{@inner_join} and pd.player_name = '#{p_hash[:batter]}'"
      end
    end
  end

  def join_add_date_dims(p_hash)

    if ((p_hash[:group_year] == '1') ||
        (p_hash[:group_month] == '1') ||
        (!p_hash[:start_date].to_s.blank?) ||
        (!p_hash[:end_date].to_s.blank?))
      @inner_join = "#{@inner_join} join bb_date_dims dd on dd.id = pf.date_key"
      if !p_hash[:start_date].to_s.blank?
        @inner_join = "#{@inner_join} and dd.the_date >= '#{p_hash[:start_date]}'"
      end
      if !p_hash[:end_date].to_s.blank?
        @inner_join = "#{@inner_join} and dd.the_date <= '#{p_hash[:end_date]}'"
      end
    end
  end

  def join_baserunners(p_hash)
    join_runner1_dims(p_hash)
    join_runner2_dims(p_hash)
    join_runner3_dims(p_hash)
  end


  def join_runner1_dims(p_hash)

    if ((p_hash[:group_runner1b] == '1') ||!p_hash[:runner1b].to_s.blank?)
      @inner_join = "#{@inner_join}join player_dims br1 on pf.run1 = br1.id"
      if !p_hash[:runner1b].to_s.blank?
        @inner_join = "#{@inner_join} and br1.player_name = '#{p_hash[:runner1b]}'"
      end
    end
    #@runner1b_join = "join player_dims br1 on pf.run1 = br1.id and br1.player_name = 'Fred Turlock'"
    #@messo = @player_join
  end

  def join_runner2_dims(p_hash)

    if ((p_hash[:group_runner2b] == '1') ||!p_hash[:runner2b].to_s.blank?)
      @inner_join = "#{@inner_join} join player_dims br2 on pf.run2 = br2.id \n"
      if !p_hash[:runner2b].to_s.blank?
        @inner_join = "#{@inner_join} and br2.player_name = '#{p_hash[:runner2b]}'"
      end
    end
  end

  def join_runner3_dims(p_hash)

    if ((p_hash[:group_runner3b] == '1') ||!p_hash[:runner3b].to_s.blank?)
      @inner_join = "#{@inner_join}join player_dims br3 on pf.run3 = br3.id"
      if !p_hash[:runner3b].to_s.blank?
        @inner_join = "#{@inner_join} and br3.player_name = '#{p_hash[:runner3b]}'"
      end
    end
  end

  def subselect_earned_facts(p_hash)
    @earned_facts_sub = "(select count(field) from earned_facts sn
	                        join fielder_dim fd2 on fd2.field_key= sn.field "

     #limit by fielder goes here!

    @earned_facts_sub = "#{@earned_facts_sub} where sn.game_key = pf.game_key "

    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      @earned_facts_sub = "#{@earned_facts_sub} and sn.batter_key = pf.player_key "
    end


    @earned_facts_sub = "#{@earned_facts_sub}) earned_runs"
  end



  def join_add_fielder_team_dims(p_hash)

    if ((p_hash[:group_fteam] == '1') ||!p_hash[:fteam].to_s.blank?)
      @inner_join = "#{@inner_join} join team_dims tdf on pf.field_team_key = tdf.id \n"
      if !p_hash[:fteam].to_s.blank?
        @inner_join = "#{@inner_join} and tdf.id3_old = '#{p_hash[:fteam]}'"
      end
    end
  end

  def join_add_batter_team_dims(p_hash)

    if ((p_hash[:group_bteam] == '1') ||!p_hash[:bteam].to_s.blank?)
      @inner_join = "#{@inner_join} join team_dims tdb on pf.bat_team_key = tdb.id \n"
      if !p_hash[:bteam].to_s.blank?
        @inner_join = "#{@inner_join} and tdb.id3_old = '#{p_hash[:bteam]}'"
      end
    end
  end

  def join_add_fielder_dims (p_hash)


    if ((p_hash[:group_pitcher] == '1') ||
        (p_hash[:group_catcher] == '1') ||
        (p_hash[:group_first_base] == '1') ||
        (p_hash[:group_second_base] == '1') ||
        (p_hash[:group_shortstop] == '1') ||
        (p_hash[:group_third_base] == '1') ||
        (p_hash[:group_left_field] == '1') ||
        (p_hash[:group_center_field] == '1') ||
        (p_hash[:group_right_field] == '1') ||
        !p_hash[:pitcher].to_s.blank? ||
        !p_hash[:catcher].to_s.blank? ||
        !p_hash[:first_base].to_s.blank? ||
        !p_hash[:second_base].to_s.blank? ||
        !p_hash[:shortstop].to_s.blank? ||
        !p_hash[:third_base].to_s.blank? ||
        !p_hash[:left_field].to_s.blank? ||
        !p_hash[:center_field].to_s.blank? ||
        !p_hash[:right_field].to_s.blank?
    )
      @inner_join = "#{@inner_join} join fielder_dims fd on pf.field_key = fd.id "

      if !p_hash[:pitcher].to_s.blank?
        @inner_join = "#{@inner_join} and fd.pitcher = '#{p_hash[:pitcher]}'"
      end

      if !p_hash[:catcher].to_s.blank?
        @inner_join = "#{@inner_join} and fd.catcher = '#{p_hash[:catcher]}'"
      end

      if !p_hash[:first_base].to_s.blank?
        @inner_join = "#{@inner_join} and fd.first_base = '#{p_hash[:first_base]}'"
      end

      if !p_hash[:second_base].to_s.blank?
        @inner_join = "#{@inner_join} and fd.second_base = '#{p_hash[:second_base]}'"
      end

      if !p_hash[:shortstop].to_s.blank?
        @inner_join = "#{@inner_join} and fd.shortstop = '#{p_hash[:shortstop]}'"
      end

      if !p_hash[:third_base].to_s.blank?
        @inner_join = "#{@inner_join} and fd.third_base = '#{p_hash[:third_base]}'"
      end

      if !p_hash[:left_field].to_s.blank?
        @inner_join = "#{@inner_join} and fd.left_field = '#{p_hash[:left_field]}'"
      end

      if !p_hash[:center_field].to_s.blank?
        @inner_join = "#{@inner_join} and fd.center_field = '#{p_hash[:center_field]}'"
      end

      if !p_hash[:right_field].to_s.blank?
        @inner_join = "#{@inner_join} and fd.right_field = '#{p_hash[:right_field]}'"
      end

    end
  end



  def orderem(p_hash)


    @order_by = ""

    if p_hash[:group_year] == '1'    and p_hash[:sort_by].nil?
      @order_by = "#{@order_by} yearo asc,"
    end


    if p_hash[:group_month] == '1' and p_hash[:sort_by].nil?
      @order_by = "#{@order_by} montho,"
    end

    if p_hash[:order_avg] == '1'
      @order_by = "#{@order_by} avg desc,"
    end


    if p_hash[:order_batter] == '1'
      @order_by = "#{@order_by} pd.player_name,"
    end

    if p_hash[:order_fteam] == '1'
      @order_by = "#{@order_by} tdf.id3_old,"
    end

    if p_hash[:order_bteam] == '1'
      @order_by = "#{@order_by} tdb.id3_old,"
    end

    if p_hash[:order_pitcher] == '1'
      @order_by = "#{@order_by} fd.pitcher,"
    end

    #snoob

    if !p_hash[:sort_by].nil?
          if   p_hash[:booper].nil?
            @order_by = "#{@order_by} #{$flannel.key(p_hash[:sort_by])} desc,"
            p_hash[:booper] = '1'
          else
            @order_by = "#{@order_by} #{$flannel.key(p_hash[:sort_by])},"
            p_hash[:booper] = nil
          end
    end

    if !@order_by.blank?
      @order_by = "order by#{@order_by}"
      @order_by.sub!(/,$/, '')
    end



  end

  def outer_select(p_hash)
    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      @outer_select += "batter as #{$flannel.key("batter").to_s}"
      @outer_select += ", batter_key as #{$flannel.key("batter_key").to_s}"
    end

    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "pitcher as #{$flannel.key("pitcher").to_s}"
      @outer_select += ", pitcher_key as #{$flannel.key("pitcher_key").to_s}"
    end

    if p_hash[:group_catcher] == '1' || !p_hash[:catcher].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "catcher as #{$flannel.key("catcher").to_s}"
    end

    if p_hash[:group_first_base] == '1' || !p_hash[:first_base].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "first_base as #{$flannel.key("first_base").to_s}"
    end

    if p_hash[:group_second_base] == '1' || !p_hash[:second_base].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "second_base as #{$flannel.key("second_base").to_s}"
    end


    if p_hash[:group_shortstop] == '1' || !p_hash[:shortstop].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "shortstop as #{$flannel.key("shortstop").to_s}"
    end


    if p_hash[:group_third_base] == '1' || !p_hash[:third_base].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "third_base as #{$flannel.key("third_base").to_s}"
    end

    if p_hash[:group_left_field] == '1' || !p_hash[:left_field].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "left_field as #{$flannel.key("left_field").to_s}"
    end

    if p_hash[:group_center_field] == '1' || !p_hash[:center_field].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "center_field as #{$flannel.key("center_field").to_s}"
    end

    if p_hash[:group_right_field] == '1' || !p_hash[:right_field].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "right_field as #{$flannel.key("right_field").to_s}"
    end







=begin original selecto

    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      $pitcher_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "pitcher"
    end

    if p_hash[:group_shortstop] == '1' || !p_hash[:shortstop].to_s.blank?
      $shortstop_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "shortstop"
    end
=end

    if (p_hash[:group_year] == '1')
      $year_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "yearo as #{$flannel.key("yearo").to_s}"
    end

    if (p_hash[:group_month] == '1')
      $year_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "montho  as #{$flannel.key("montho").to_s}"
    end

    if p_hash[:group_fteam] == '1' || !p_hash[:fteam].to_s.blank?
      $fteam_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "fteam as #{$flannel.key("fteam").to_s}"
    end

    if p_hash[:group_bteam] == '1' || !p_hash[:bteam].to_s.blank?
      $bteam_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "bteam as #{$flannel.key("bteam").to_s}"
    end

    if p_hash[:group_runner1b] == '1' || !p_hash[:runner1b].to_s.blank?
      $runner1b_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "runner1b as #{$flannel.key("runner1b").to_s}"
    end

    if p_hash[:group_runner2b] == '1' || !p_hash[:runner2b].to_s.blank?
      $runner2b_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "runner2b as #{$flannel.key("runner2b").to_s}"
    end

    if p_hash[:group_runner3b] == '1' || !p_hash[:runner3b].to_s.blank?
      $runner3b_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "runner3b as #{$flannel.key("runner3b").to_s}"
    end

    if p_hash[:group_home_away] == '1'
      $home_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += " case when at_home = '1' then 'H' else 'A' end #{$flannel.key("at_home").to_s}"
      #@outer_select += "at_home"
    end


  end

  def inner_select(p_hash)
    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      @inner_select += "pf.id, pf.player_key as batter_key, pd.player_name as batter"
    else
      @inner_select+= "pf.game_key"
    end

    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.pitcher, fd.pitcher_key"
    end

    if p_hash[:group_catcher] == '1' || !p_hash[:catcher].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.catcher"
    end

    if p_hash[:group_first_base] == '1' || !p_hash[:first_base].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.first_base"
    end

    if p_hash[:group_second_base] == '1' || !p_hash[:second_base].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.second_base"
    end


    if p_hash[:group_shortstop] == '1' || !p_hash[:shortstop].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.shortstop"
    end


    if p_hash[:group_third_base] == '1' || !p_hash[:third_base].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.third_base"
    end

    if p_hash[:group_left_field] == '1' || !p_hash[:left_field].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.left_field"
    end

    if p_hash[:group_center_field] == '1' || !p_hash[:center_field].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.center_field"
    end

    if p_hash[:group_right_field] == '1' || !p_hash[:right_field].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.right_field"
    end

    if p_hash[:group_runner1b] == '1' || !p_hash[:runner1b].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "br1.player_name runner1b"
    end

    if p_hash[:group_runner2b] == '1' || !p_hash[:runner2b].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "br2.player_name runner2b"
    end

    if p_hash[:group_runner3b] == '1' || !p_hash[:runner3b].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "br3.player_name runner3b"
    end


    if (p_hash[:group_year] == '1')
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "dd.calendar_year yearo"
    end

    if (p_hash[:group_month] == '1')
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "dd.calendar_yearmonth montho"
    end

    if p_hash[:group_fteam] == '1' || !p_hash[:fteam].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "tdf.id3_old fteam"
    end

    if p_hash[:group_bteam] == '1' || !p_hash[:bteam].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "tdb.id3_old bteam"
    end

    if p_hash[:group_home_away] == '1'
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "pf.at_home"
    end


  end

  def joinem(p_hash)
    @inner_join = ""
    @outer_join = ""
    join_add_fielder_team_dims p_hash
    join_add_batter_team_dims p_hash
    join_add_fielder_dims p_hash
    join_add_player_dims p_hash
    join_add_earned_facts_slim p_hash
    join_baserunners p_hash
    join_add_date_dims p_hash


  end
  def fieldery?(p_hash)
    !p_hash[:pitcher].to_s.blank? ||
    !p_hash[:catcher].to_s.blank? ||
    !p_hash[:first_base].to_s.blank? ||
    !p_hash[:second_base].to_s.blank? ||
    !p_hash[:third_base].to_s.blank? ||
    !p_hash[:shortstop].to_s.blank? ||
    !p_hash[:left_field].to_s.blank? ||
    !p_hash[:center_field].to_s.blank? ||
    !p_hash[:right_field].to_s.blank? ||
    (p_hash[:group_pitcher] == '1') ||
    (p_hash[:group_catcher] == '1') ||
    (p_hash[:group_first_base] == '1') ||
    (p_hash[:group_second_base] == '1') ||
    (p_hash[:group_third_base] == '1') ||
    (p_hash[:group_shortstop] == '1') ||
    (p_hash[:group_left_field] == '1') ||
    (p_hash[:group_center_field] == '1') ||
    (p_hash[:group_right_field] == '1')

  end

  def battery?(p_hash)
    !p_hash[:batter].to_s.blank? ||
    !p_hash[:runner1b].to_s.blank? ||
    !p_hash[:runner2b].to_s.blank? ||
    !p_hash[:runner3b].to_s.blank? ||
     (p_hash[:group_batter] == '1') ||
     (p_hash[:group_runner1b] == '1') ||
     (p_hash[:group_runner2b] == '1') ||
     (p_hash[:group_runner3b] == '1')

  end

  def groupem(p_hash)

    @inner_group = ""
    @outer_group = ""

    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      $batter_colm = true
      #@inner_group = "#{@inner_group} pf.id,"
    #else
      #@inner_group = "#{@inner_group} pf.game_key,"
    end

    if p_hash[:group_year] == '1'
      $date_year_colm = true
      #@inner_group = "#{@inner_group} dd.calendar_year,"
      @outer_group = "#{@outer_group} fl.yearo,"
    end

    if p_hash[:group_month] == '1'
      $date_month_colm = true
      #@inner_group = "#{@inner_group} dd.calendar_yearmonth,"
      @outer_group = "#{@outer_group} fl.montho,"
    end


    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      $pitcher_colm = true
      #@inner_group = "#{@inner_group} fd.pitcher,"
      @outer_group = "#{@outer_group} pitcher, pitcher_key,"
    end

    if p_hash[:group_catcher] == '1' || !p_hash[:catcher].to_s.blank?
      $catcher_colm = true
      #@inner_group = "#{@inner_group} fd.catcher,"
      @outer_group = "#{@outer_group} fl.catcher,"
    end

    if p_hash[:group_batter] == '1' ||  !p_hash[:batter].to_s.blank?
      $batter_colm = true
      #@inner_group = "#{@inner_group} pd.player_name,"
      @outer_group = "#{@outer_group} fl.batter, fl.batter_key,"
    end

    if p_hash[:group_first_base] == '1' || !p_hash[:first_base].to_s.blank?
      $firstb_colm = true
      #@inner_group = "#{@inner_group} fd.first_base,"
      @outer_group = "#{@outer_group} fl.first_base,"
    end
    if p_hash[:group_second_base] == '1' || !p_hash[:second_base].to_s.blank?
      $secondb_colm = true
      #@inner_group = "#{@inner_group} fd.second_base,"
      @outer_group = "#{@outer_group} fl.second_base,"
    end
    if p_hash[:group_shortstop] == '1' || !p_hash[:shortstop].to_s.blank?
      $ss_colm = true
      #@inner_group = "#{@inner_group} fd.shortstop,"
      @outer_group = "#{@outer_group} shortstop,"
    end
    if p_hash[:group_third_base] == '1' || !p_hash[:third_base].to_s.blank?
      $thirdb_colm = true
      #@inner_group = "#{@inner_group} fd.third_base,"
      @outer_group = "#{@outer_group} third_base,"
    end
    if p_hash[:group_left_field] == '1' || !p_hash[:left_field].to_s.blank?
      $lf_colm = true
      #@inner_group = "#{@inner_group} fd.left_field,"
      @outer_group = "#{@outer_group} fl.left_field,"
    end
    if p_hash[:group_center_field] == '1' || !p_hash[:center_field].to_s.blank?
      $cf_colm = true
      #@inner_group = "#{@inner_group} fd.center_field,"
      @outer_group = "#{@outer_group} fl.center_field,"
    end
    if p_hash[:group_right_field] == '1' || !p_hash[:right_field].to_s.blank?
      $rf_colm = true
      #@inner_group = "#{@inner_group} fd.right_field,"
      @outer_group = "#{@outer_group} fl.right_field,"
    end
    if p_hash[:group_fteam] == '1' || !p_hash[:fteam].to_s.blank?
      $fteam_colm = true
      #@inner_group = "#{@inner_group} tdf.id3_old,"
      @outer_group = "#{@outer_group} fl.fteam,"
    end
    if p_hash[:group_bteam] == '1' || !p_hash[:bteam].to_s.blank?
      $bteam_colm = true
      #@inner_group = "#{@inner_group} tdb.id3_old,"
      @outer_group = "#{@outer_group} fl.bteam,"
    end
    if p_hash[:group_runner1b] == '1' || !p_hash[:runner1b].to_s.blank?
      $runner1b_colm = true
      #@inner_group = "#{@inner_group} br1.player_name,"
      @outer_group = "#{@outer_group} fl.runner1b,"
    end

    if p_hash[:group_runner2b] == '1' || !p_hash[:runner2b].to_s.blank?
      $runner2b_colm = true
      #@inner_group = "#{@inner_group} br2.player_name,"
      @outer_group = "#{@outer_group} fl.runner2b,"
    end

    if p_hash[:group_runner3b] == '1' || !p_hash[:runner3b].to_s.blank?
      $runner3b_colm = true
      #@inner_group = "#{@inner_group} br3.player_name,"
      @outer_group = "#{@outer_group} fl.runner3b,"
    end

    if p_hash[:group_home_away] == '1'
      $home_colm = true
      #@inner_group = "#{@inner_group} at_home,"
      @outer_group = "#{@outer_group} fl.at_home,"
    end

    #if !@inner_group.blank?
      #@inner_group = "group by#{@inner_group}"
      #@inner_group.sub!(/,$/, '')
    #end

    if !@outer_group.blank?
      @outer_group = "group by#{@outer_group}"
      @outer_group.sub!(/,$/, '')
    end



  end

  def selectem(p_hash)
    @er_where_id_or_game = ""
    @select_by_1 = "select "
    #outer_select
    @selectx = ", sum(fl.at_bat) #{$flannel.key("at_bat").to_s},
        sum(fl.hit) #{$flannel.key("hit").to_s}, sum(fl.walk) #{$flannel.key("walk").to_s},
       sum(fl.hbp) #{$flannel.key("hbp").to_s}, sum(fl.sacfly) #{$flannel.key("sacfly").to_s},
       sum(fl.outs) outz, sum(fl.rbi) #{$flannel.key("rbi").to_s},
       sum(fl.earned_runs) #{$flannel.key("earned_runs").to_s},
       round(CASE WHEN sum(fl.at_bat) = 0 then 0 else cast(sum(fl.hit) as numeric)/ sum(fl.at_bat) END,3) as #{$flannel.key("avg").to_s},
       cast(cast(sum(fl.outs) as integer)/3 ||'.'||sum(fl.outs)%3 as numeric) as #{$flannel.key("ippies").to_s},
       round(cast(sum(fl.hit + fl.walk + fl.hbp) as numeric) /
		     case sum(fl.at_bat + fl.walk + fl.sacfly + fl.hbp)
		       when 0 then null
		       else cast(sum(fl.at_bat + fl.walk +fl.sacfly + fl.hbp) as numeric)
		     end,5) #{$flannel.key("obp").to_s},
		     round(cast(sum(fl.bag) as numeric) /
		     case sum(fl.at_bat)
		       when 0 then null
		       else cast(sum(fl.at_bat) as numeric) end,5) #{$flannel.key("slg").to_s}
   from ( select "    #inner_select

    @select_by_2 = ", sum(fl.at_bat) #{$flannel.key('at_bat').to_s}, sum(fl.hit)  #{$flannel.key('hit').to_s},
    sum(fl.walk) #{$flannel.key('walk').to_s}, sum(fl.hbp) #{$flannel.key('hbp').to_s}, sum(fl.sacfly) #{$flannel.key('sacfly').to_s},
    sum(fl.outs) outz, sum(fl.rbi) #{$flannel.key("rbi").to_s},
        CASE sum(fl.at_bat)
    when 0 then null
  else
    round(cast(sum(fl.hit) as numeric)/ sum(fl.at_bat),3)
    END as #{$flannel.key("avg").to_s},

           sum(fl.earned_runs) #{$flannel.key("earned_runs").to_s},

    cast(cast(sum(fl.outs) as integer)/3 ||'.'||sum(fl.outs)%3 as numeric) as #{$flannel.key("ippies").to_s},
                                                             CASE sum(fl.outs) when 0 then null
    else round(sum(fl.earned_runs) * 9 / (cast(sum(fl.outs) as numeric)/3),2)
    end #{$flannel.key("era").to_s},

	  case sum(fl.outs)
	      when 0 then null
              else round(cast(sum(fl.walk) + sum(hit) as numeric) / (cast (sum(fl.outs)as numeric) /3),3)
    end  #{$flannel.key("whip").to_s},

    case sum(fl.at_bat + fl.walk + fl.sacfly + fl.hbp)
      when 0 then null
      else
        round(cast(sum(fl.hit + fl.walk + fl.hbp) as numeric) /
            cast(sum(fl.at_bat + fl.walk +fl.sacfly + fl.hbp) as numeric),3)
    end #{$flannel.key("obp").to_s},
    case sum(fl.at_bat)
      when 0 then null
      else round(cast(sum(fl.bag) as numeric) /
          cast(sum(fl.at_bat) as numeric),3)
    end  #{$flannel.key("slg").to_s},

    case  sum(fl.at_bat + fl.walk + fl.sacfly + fl.hbp)
      when 0 then null
      else case sum(fl.at_bat)
             when 0 then null
             else
               round(cast(sum(fl.hit + fl.walk + fl.hbp) as numeric) /
                   cast(sum(fl.at_bat + fl.walk +fl.sacfly + fl.hbp) as numeric) +
                   cast(sum(fl.bag) as numeric) /
                   cast(sum(fl.at_bat) as numeric),3)
           end
    end #{$flannel.key("ops").to_s}

    from ( select "

    @select_by = ",at_bat,
           hit,
           hbp,
           bag,
           sacfly,
           walk,
           made_outs outs,
           rbi,"
    #       (select count(field) from earned_facts sn
    #         join fielder_dims fd2 on fd2.id= sn.field
    #         and fd2.pitcher = fd.pitcher
    #          where sn.game_key = pf.game_key) earned_runs
    #subselect_earned  --varies on whether a fielder is selected
    @select_by_pf = "     from play_facts pf"
    #inner_join
    #inner_group"
    @select_by_4 = ") fl "
    # outer_group
    # outer_order"

    if p_hash[:group_batter] == '1' ||  !p_hash[:batter].to_s.blank?
      #@inner_whom = "pd.player_name batter"
      @er_where_id_or_game = "sn.ppn_id = pf.id"
      #@inner_join_player_dims += "join player_dims pd on pd.id = pf.player_key "
      # @inner_join_player_dims += "and pd.player_name = "
      #@inner_join_player_dims += " '#{p_hash[:batter]}'"
      #@inner_group += "group by pf.id, pd.player_name"
      # @outer_group += "group by batter"
      #@outer_order += "order by batter"
    end

    if @er_where_id_or_game.blank?; @er_where_id_or_game  = "sn.game_key = pf.game_key"; end   #MAYBE -- I am getting a little confused

=begin
  if (p_hash[:group_pitcher] == '1')
       if !@inner_whom.blank?; @inner_whom += ", "; end
       @inner_whom += "fd.pitcher"
       if @er_where_id_or_game.blank?; @er_where_id_or_game  = "sn.game_key = pf.game_key"; end
       if @inner_group.blank?
          @inner_group += "group by pf.game_key,"
       else
          @inner_group += ", "
       end
       @inner_group += "fd.pitcher"
       if @outer_group.blank?
         @outer_group += "group by "
       else
         @outer_group += ", "
       end
       @outer_group += "pitcher"
       if @outer_order.blank?
        @outer_order += "order by "
       else
        @outer_order += ", "
       end
       @outer_order += "pitcher"
  end
=end



    #@select_by = @select_by.gsub(/qh_outer_select_whom/,"#{@outer_select}")

    #@select_by = @select_by.gsub(/qh_inner_id_or_game/,"#{@inner_select}")

    #@select_by = @select_by.gsub(/qh_inner_whom/,"#{@inner_whom}")

    @select_by = @select_by.gsub(/qh_er_id_or_game/,"#{@er_where_id_or_game}")

    #@select_by = @select_by.gsub(/qh_inner_join_player_dims/,"#{@inner_join_player_dims}")

    #@select_by = @select_by.gsub(/qh_inner_join_date_dims/,"#{@inner_join_date_dims}")

    #@select_by = @select_by.gsub(/qh_outer_select_whom/,"#{@outer_select}")

    #@select_by = @select_by.gsub(/qh_inner_group/,"#{@inner_group}")

    #@select_by = @select_by.gsub(/qh_outer_group/,"#{@outer_group}")

    #@select_by = @select_by.gsub(/qh_outer_order/,"#{@outer_order}")






  end

  def selectfrom(p_hash)
    @select_from = 'from play_facts pf'
  end


  def sumfields
    @summer ||
        @summer =              ", round(CASE WHEN sum(pf.at_bat) = 0 then 0 else cast(sum(pf.hit) as numeric)/ sum(pf.at_bat) END,3) as avg,
                              sum(pf.made_outs)/3 ||'.'||sum(pf.made_outs)%3 as ippies,
                              sum(pf.at_bat) as at_bat, sum(pf.hit) as hit,
                              sum(pf.walk) as walk, sum(pf.rbi) as rbi,
                              round(case when (sum(at_bat) + sum(walk) + sum(sacfly) + sum(hbp) > 0) then
                                (cast (sum(hit) + sum(walk) + sum(hbp) as numeric) /
                                (cast(sum(at_bat) + sum(walk) + sum(sacfly) + sum(hbp) as numeric)))
                                 else 0
                              END,3) as OBP, "


  end

  def nosumfields
    @summer =              " null as avg,
                              pf.at_bat as at_bat, pf.hit as hit,
                              pf.walk as walk, pf.rbi as rbi, pf.at_home as at_home
                              null as ippies, null as OBP, null as slg, null as OPS, null as ERA, null as WHIP,
                              from play_facts pf "

  end

  def set_to_false

    $date_year_colm = false
    $date_month_colm = false
    $batter_colm = false
    $home_colm = false
    $pitcher_colm = false
    $catcher_colm = false
    $firstb_colm = false
    $secondb_colm = false
    $thirdb_colm = false
    $ss_colm = false
    $lf_colm = false
    $cf_colm = false
    $rf_colm = false
    $fteam_colm = false
    $bteam_colm = false
    $runner1b_colm = false
    $runner2b_colm = false
    $runner3b_colm = false


  end
  def build_hash  (p_hash)
=begin
    chash = {:c1 => "at_bat",
             :c2 => "hit",
             :c3 => "walk",
             :c4 => "yearo",
             :c5 => "batter",
             :c6 => "avg",
             :c7 => "obp",
             :c8 => "slg",
             :c9 => "ops",
             :c10 => "era",
             :c11 => "rbi",
             :c12 => "ippies",
             :c13 => "earned_runs"}
=end
    colcount = 0
    hidden = 100
    chash = Hash.new

    if p_hash[:group_year] == '1'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'yearo'
    end
    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'batter'
      chash[("c" + (hidden+=1).to_s).to_sym] =  'batter_key'
    end
    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'pitcher'
      chash[("c" + (hidden+=1).to_s).to_sym] =  'pitcher_key'
    end
    if p_hash[:group_fteam] == '1' || !p_hash[:fteam].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'fteam'
    end
    if p_hash[:group_bteam] == '1' || !p_hash[:bteam].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'bteam'
    end

    chash[("c" + (colcount+=1).to_s).to_sym] =  'at_bat'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'hit'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'walk'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'avg'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'obp'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'slg'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'ops'
     chash[("c" + (colcount+=1).to_s).to_sym] =  'era'
     chash[("c" + (colcount+=1).to_s).to_sym] =  'whip'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'rbi'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'sacfly'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'hbp'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'ippies'
      chash[("c" + (colcount+=1).to_s).to_sym] =  'earned_runs'

    if p_hash[:group_catcher] == '1' || !p_hash[:catcher].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'catcher'
    end

    if p_hash[:group_first_base] == '1' || !p_hash[:first_base].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'first_base'
    end

    if p_hash[:group_second_base] == '1' || !p_hash[:second_base].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'second_base'
    end

    if p_hash[:group_third_base] == '1' || !p_hash[:third_base].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'third_base'
    end

    if p_hash[:group_shortstop] == '1' || !p_hash[:shortstop].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'shortstop'
    end

    if p_hash[:group_left_field] == '1' || !p_hash[:left_field].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'left_field'
    end

    if p_hash[:group_center_field] == '1' || !p_hash[:center_field].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'center_field'
    end

    if p_hash[:group_right_field] == '1' || !p_hash[:right_field].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'right_field'
    end

    if p_hash[:group_runner1b] == '1' || !p_hash[:runner_1b].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'runner1b'
    end

    if p_hash[:group_runner2b] == '1' || !p_hash[:runner_2b].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'runner2b'
    end

    if p_hash[:group_runner3b] == '1' || !p_hash[:runner_3b].to_s.blank?
      chash[("c" + (colcount+=1).to_s).to_sym] =  'runner3b'
    end



    if !flush_left(p_hash)
        $flannel = chash.clone

    else
      h2 = Hash.new
      colcount = 0
      hidden = 100
      if (p_hash.has_key?("c_at_bat"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'at_bat'
      end

      if (p_hash.has_key?("c_hit"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'hit'
      end

      if (p_hash.has_key?("c_walk") )
        h2[("c" + (colcount+=1).to_s).to_sym] =  'walk'
      end

      if (p_hash.has_key?("c_obp"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'obp'
      end

      if (p_hash.has_key?("c_avg"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'avg'
      end

      if (p_hash.has_key?("c_slg"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'slg'
      end

      if (p_hash.has_key?("c_ops"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'ops'
      end

      if (p_hash.has_key?("c_era"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'era'
      end

      if (p_hash.has_key?("c_whip"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'whip'
      end

      if (p_hash.has_key?("c_rbi"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'rbi'
      end

      if (p_hash.has_key?("c_sacfly"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'sacfly'
      end

      if (p_hash.has_key?("c_hbp"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'hbp'
      end

      if (p_hash.has_key?("c_ippies"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'ippies'
      end

      if (p_hash.has_key?("c_earned_runs"))
        h2[("c" + (colcount+=1).to_s).to_sym] =  'earned_runs'
      end



      h2.each_value{|value| if chash.has_value?(value) then chash.each { |k, v| if v == value then chash.delete k end } end}


      h3 = Hash.new
      colcount = 0
      hidden = 100
      h2.each_value{|v| h3[("c" + (colcount+=1).to_s).to_sym] = v}
      #chash.each_value{|v| h3[("c" + (colcount+=1).to_s).to_sym] = v}   this is the old one
      chash.each_value {|v| v.to_s.end_with?("key") ? h3[("c" + (hidden+=1).to_s).to_sym] = v  : h3[("c" + (colcount+=1).to_s).to_sym] = v}
      #(year_start..year_end).each {|x| no_repeats?(x) ? puts(x) : puts("nil") }  this is an example of syntax only
      #(i > 10 ? "greater than" : "less than or equal to")

      $flannel = h3.clone

    end

  end


  def buildquery (p_hash)
    build_hash  p_hash
    set_to_false
    default_query = true
    @outer_select = ""
    @inner_select = ""
    @fielder_join = ""
    #@select_by = "select null as  batter, null as third_base, null as pitcher "
    @player_join = ""
    @runner1b_join = ""
    @runner2b_join = ""
    @runner3b_join = ""
    @inner_group = ""
    @outer_group = ""
    @order_by = ""
    @messo = "startmesso"

    #if p_hash[:batter].to_s.blank?
    #@messo = "no batta"
    # else
    # @messo = p_hash[:batter]
    #end

    a = p_hash[:batter]



    if (!p_hash[:batter].to_s.blank? || a ||
        !p_hash[:pitcher].to_s.blank? ||
        !p_hash[:catcher].to_s.blank? ||
        !p_hash[:first_base].to_s.blank? ||
        !p_hash[:second_base].to_s.blank? ||
        !p_hash[:shortstop].to_s.blank? ||
        !p_hash[:third_base].to_s.blank?||
        !p_hash[:left_field].to_s.blank?||
        !p_hash[:center_field].to_s.blank?||
        !p_hash[:right_field].to_s.blank?||
        !p_hash[:bteam].to_s.blank?||
        !p_hash[:fteam].to_s.blank?||
        p_hash[:group_batter] == '1' ||
        p_hash[:group_pitcher] == '1' ||
        p_hash[:group_catcher] == '1' ||
        p_hash[:group_first_base] == '1' ||
        p_hash[:group_second_base] == '1' ||
        p_hash[:group_shortstop] == '1' ||
        p_hash[:group_third_base] == '1' ||
        p_hash[:group_left_field] == '1' ||
        p_hash[:group_center_field] == '1' ||
        p_hash[:group_right_field] == '1' ||
        p_hash[:group_bteam] == '1' ||
        p_hash[:group_fteam] == '1')
      default_query = false
      outer_select p_hash
      inner_select p_hash
      subselect_earned p_hash
      groupem p_hash
      orderem p_hash
      joinem p_hash
      selectem p_hash
    end



    if default_query
      return  "select 0 as c1, 0 as c2, 0 as c3, 0 as c4, 0 as c5,
               0 as c6, 0 as c7, 0 as c8, 0 as c9, 0 as c10,
               0 as c11, 0 as c12, 0 as c13, 0 as c14, 0 as c15,
               0 as c16, 0 as c17, 0 as c18, 0 as c19, 0 as c20 from play_facts limit 10"
    end

    the__test_query =  "#{@select_by_1}
    #{@outer_select}
    #{@select_by_2}
    #{@inner_select}
    #{@select_by}

    #{@subselect_earned}
    #{@select_by_pf}

    #{@inner_join}
    #{@inner_group}
    #{@select_by_4}
    #{@outer_group}
    #{@outer_by}"

    the_query =  "#{@select_by_1}
    #{@outer_select}
    #{@select_by_2}
    #{@inner_select}
    #{@select_by}

    #{@subselect_earned}
    #{@select_by_pf}

    #{@inner_join}
    #{@inner_group}
    #{@select_by_4}
    #{@outer_group}
    #{@order_by}"

  end

end