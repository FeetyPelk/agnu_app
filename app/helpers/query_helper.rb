module QueryHelper

  def subselect_earned(p_hash)

    @subselect_earned ="       (select count(field) from earned_facts sn
             join fielder_dims fd2 on fd2.id= sn.field "
    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      @subselect_earned = "#{@subselect_earned} where sn.ppn_id = pf.id) earned_runs "
    else
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
      @subselect_earned = "#{@subselect_earned} where sn.game_key = pf.game_key) earned_runs "
    end
  end


  def join_add_player_dims(p_hash)

    if ((p_hash[:group_batter] == '1') ||!p_hash[:batter].to_s.blank?)
      @inner_join = "#{@inner_join} join player_dims pd on pf.player_key = pd.id"
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
    @earned_facts_sub = ""
    if (!p_hash[:batter].to_s.blank?)
      @earned_facts_sub = "(select count(field) from earned_facts sn
                         where sn.ppn_id = pf.id) earned_runs"
    else
      @earned_facts_sub = "(select count(field) from earned_facts sn
                         where sn.game_key = pf.game_key) earned_runs"
    end
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

    if p_hash[:group_year] == '1'
      @order_by = "#{@order_by} yearo,"
    end

    if p_hash[:group_month] == '1'
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

    if !@order_by.blank?
      @order_by = "order by#{@order_by}"
      @order_by.sub!(/,$/, '')
    end


  end

  def outer_select(p_hash)
    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      @outer_select += "batter"
    end

    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "pitcher"
    end

    if p_hash[:group_catcher] == '1' || !p_hash[:catcher].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "catcher"
    end

    if p_hash[:group_first_base] == '1' || !p_hash[:first_base].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "first_base"
    end

    if p_hash[:group_second_base] == '1' || !p_hash[:second_base].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "second_base"
    end


    if p_hash[:group_shortstop] == '1' || !p_hash[:shortstop].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "shortstop"
    end


    if p_hash[:group_third_base] == '1' || !p_hash[:third_base].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "third_base"
    end

    if p_hash[:group_left_field] == '1' || !p_hash[:left_field].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "left_field"
    end

    if p_hash[:group_center_field] == '1' || !p_hash[:center_field].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "center_field"
    end

    if p_hash[:group_right_field] == '1' || !p_hash[:right_field].to_s.blank?
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "right_field"
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
      @outer_select += "yearo"
    end

    if (p_hash[:group_month] == '1')
      $year_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "montho"
    end

    if p_hash[:group_fteam] == '1' || !p_hash[:fteam].to_s.blank?
      $fteam_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "fteam"
    end

    if p_hash[:group_bteam] == '1' || !p_hash[:bteam].to_s.blank?
      $bteam_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "bteam"
    end

    if p_hash[:group_runner1b] == '1' || !p_hash[:runner1b].to_s.blank?
      $runner1b_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "runner1b"
    end

    if p_hash[:group_runner2b] == '1' || !p_hash[:runner2b].to_s.blank?
      $runner2b_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "runner2b"
    end

    if p_hash[:group_runner3b] == '1' || !p_hash[:runner3b].to_s.blank?
      $runner3b_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += "runner3b"
    end

    if p_hash[:group_home_away] == '1'
      $home_colm = true
      if !@outer_select.blank?; @outer_select+= ", "; end
      @outer_select += " case when at_home = '1' then 'H' else 'A' end at_home"
      #@outer_select += "at_home"
    end


  end

  def inner_select(p_hash)
    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      @inner_select += "pf.id, pd.player_name as batter"
    else
      @inner_select+= "pf.game_key"
    end

    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      if !@inner_select.blank?; @inner_select+= ", "; end
      @inner_select += "fd.pitcher"
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
    join_baserunners p_hash
    join_add_date_dims p_hash


  end

  def groupem(p_hash)

    @inner_group = ""
    @outer_group = ""

    if p_hash[:group_batter] == '1' || !p_hash[:batter].to_s.blank?
      $batter_colm = true
      @inner_group = "#{@inner_group} pf.id,"
    else
      @inner_group = "#{@inner_group} pf.game_key,"
    end

    if p_hash[:group_year] == '1'
      $date_year_colm = true
      @inner_group = "#{@inner_group} dd.calendar_year,"
      @outer_group = "#{@outer_group} fl.yearo,"
    end

    if p_hash[:group_month] == '1'
      $date_month_colm = true
      @inner_group = "#{@inner_group} dd.calendar_yearmonth,"
      @outer_group = "#{@outer_group} fl.montho,"
    end


    if p_hash[:group_pitcher] == '1' || !p_hash[:pitcher].to_s.blank?
      $pitcher_colm = true
      @inner_group = "#{@inner_group} fd.pitcher,"
      @outer_group = "#{@outer_group} pitcher,"
    end

    if p_hash[:group_catcher] == '1' || !p_hash[:catcher].to_s.blank?
      $catcher_colm = true
      @inner_group = "#{@inner_group} fd.catcher,"
      @outer_group = "#{@outer_group} fl.catcher,"
    end

    if p_hash[:group_batter] == '1' ||  !p_hash[:batter].to_s.blank?
      $batter_colm = true
      @inner_group = "#{@inner_group} pd.player_name,"
      @outer_group = "#{@outer_group} fl.batter,"
    end

    if p_hash[:group_first_base] == '1' || !p_hash[:first_base].to_s.blank?
      $firstb_colm = true
      @inner_group = "#{@inner_group} fd.first_base,"
      @outer_group = "#{@outer_group} fl.first_base,"
    end
    if p_hash[:group_second_base] == '1' || !p_hash[:second_base].to_s.blank?
      $secondb_colm = true
      @inner_group = "#{@inner_group} fd.second_base,"
      @outer_group = "#{@outer_group} fl.second_base,"
    end
    if p_hash[:group_shortstop] == '1' || !p_hash[:shortstop].to_s.blank?
      $ss_colm = true
      @inner_group = "#{@inner_group} fd.shortstop,"
      @outer_group = "#{@outer_group} shortstop,"
    end
    if p_hash[:group_third_base] == '1' || !p_hash[:third_base].to_s.blank?
      $thirdb_colm = true
      @inner_group = "#{@inner_group} fd.third_base,"
      @outer_group = "#{@outer_group} third_base,"
    end
    if p_hash[:group_left_field] == '1' || !p_hash[:left_field].to_s.blank?
      $lf_colm = true
      @inner_group = "#{@inner_group} fd.left_field,"
      @outer_group = "#{@outer_group} fl.left_field,"
    end
    if p_hash[:group_center_field] == '1' || !p_hash[:center_field].to_s.blank?
      $cf_colm = true
      @inner_group = "#{@inner_group} fd.center_field,"
      @outer_group = "#{@outer_group} fl.center_field,"
    end
    if p_hash[:group_right_field] == '1' || !p_hash[:right_field].to_s.blank?
      $rf_colm = true
      @inner_group = "#{@inner_group} fd.right_field,"
      @outer_group = "#{@outer_group} fl.right_field,"
    end
    if p_hash[:group_fteam] == '1' || !p_hash[:fteam].to_s.blank?
      $fteam_colm = true
      @inner_group = "#{@inner_group} tdf.id3_old,"
      @outer_group = "#{@outer_group} fl.fteam,"
    end
    if p_hash[:group_bteam] == '1' || !p_hash[:bteam].to_s.blank?
      $bteam_colm = true
      @inner_group = "#{@inner_group} tdb.id3_old,"
      @outer_group = "#{@outer_group} fl.bteam,"
    end
    if p_hash[:group_runner1b] == '1' || !p_hash[:runner1b].to_s.blank?
      $runner1b_colm = true
      @inner_group = "#{@inner_group} br1.player_name,"
      @outer_group = "#{@outer_group} fl.runner1b,"
    end

    if p_hash[:group_runner2b] == '1' || !p_hash[:runner2b].to_s.blank?
      $runner2b_colm = true
      @inner_group = "#{@inner_group} br2.player_name,"
      @outer_group = "#{@outer_group} fl.runner2b,"
    end

    if p_hash[:group_runner3b] == '1' || !p_hash[:runner3b].to_s.blank?
      $runner3b_colm = true
      @inner_group = "#{@inner_group} br3.player_name,"
      @outer_group = "#{@outer_group} fl.runner3b,"
    end

    if p_hash[:group_home_away] == '1'
      $home_colm = true
      @inner_group = "#{@inner_group} at_home,"
      @outer_group = "#{@outer_group} fl.at_home,"
    end

    if !@inner_group.blank?
      @inner_group = "group by#{@inner_group}"
      @inner_group.sub!(/,$/, '')
    end

    if !@outer_group.blank?
      @outer_group = "group by#{@outer_group}"
      @outer_group.sub!(/,$/, '')
    end



  end

  def selectem(p_hash)
    @er_where_id_or_game = ""
    @select_by_1 = "select "
    #outer_select
    @selectx = ", sum(fl.at_bat) at_bat, sum(fl.hit) hit,
       sum(fl.walk) walk, sum(fl.hbp) hbp, sum(fl.sacfly) sacfly,
       sum(fl.outs) outz, sum(fl.rbi) rbi,
       sum(fl.earned_runs) earned_runs,
       round(CASE WHEN sum(fl.at_bat) = 0 then 0 else cast(sum(fl.hit) as numeric)/ sum(fl.at_bat) END,3) as avg,
       cast(sum(fl.outs) as integer)/3 ||'.'||sum(fl.outs)%3 as ippies,
       round(cast(sum(fl.hit + fl.walk + fl.hbp) as numeric) /
		     case sum(fl.at_bat + fl.walk + fl.sacfly + fl.hbp)
		       when 0 then null
		       else cast(sum(fl.at_bat + fl.walk +fl.sacfly + fl.hbp) as numeric)
		     end,5) obp,
		     round(cast(sum(fl.bag) as numeric) /
		     case sum(fl.at_bat)
		       when 0 then null
		       else cast(sum(fl.at_bat) as numeric) end,5) slg
   from ( select "    #inner_select

    @select_by_2 = ", sum(fl.at_bat) at_bat, sum(fl.hit) hit,
    sum(fl.walk) walk, sum(fl.hbp) hbp, sum(fl.sacfly) sacfly,
    sum(fl.outs) outz, sum(fl.rbi) rbi,
        CASE sum(fl.at_bat)
    when 0 then null
  else
    round(cast(sum(fl.hit) as numeric)/ sum(fl.at_bat),3)
    END as avg,

           sum(fl.earned_runs) earned_runs,

    cast(sum(fl.outs) as integer)/3 ||'.'||sum(fl.outs)%3 as ippies,
                                                             CASE sum(fl.outs) when 0 then null
    else round(sum(fl.earned_runs) * 9 / (sum(fl.outs)/3),2)
    end era,
    case sum(fl.at_bat + fl.walk + fl.sacfly + fl.hbp)
      when 0 then null
      else
        round(cast(sum(fl.hit + fl.walk + fl.hbp) as numeric) /
            cast(sum(fl.at_bat + fl.walk +fl.sacfly + fl.hbp) as numeric),3)
    end obp,
    case sum(fl.at_bat)
      when 0 then null
      else round(cast(sum(fl.bag) as numeric) /
          cast(sum(fl.at_bat) as numeric),3)
    end  slg,

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
    end ops

    from ( select "

    @select_by = ",sum(at_bat) at_bat,
           sum(hit) hit,
           sum(hbp) hbp,
           sum(bag) bag,
           sum(sacfly) sacfly,
           sum(walk) walk,
           sum(made_outs) outs,
           sum(rbi)rbi,"
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
                              null as ippies, null as OBP, null as slg, null as OPS, null as ERA,
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


  def buildquery (p_hash)
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
      return  "select 'moopers' as batter, 1 as avg, 0 as earned_runs, at_bat, hit, walk, rbi, 0 as ippies, 0 as OBP, 0 as slg, 0 as OPS, 0 as ERA from play_facts limit 10"
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