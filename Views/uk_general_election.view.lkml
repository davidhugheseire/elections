view: uk_general_election {
  sql_table_name: uk_election.uk_general_election ;;



    #----------------------------------------- constituency

    dimension: ons_id {
      primary_key: yes
      type: string
      sql: ${TABLE}.ons_id ;;
   #   map_layer_name: uk_election_layer     # this is your map layer
    }

    dimension: ons_region_id {
      group_label: "Constituency Info"
      type: string
      sql: ${TABLE}.ons_region_id ;;
    }

    dimension: constituency {
      group_label: "Constituency Info"
      label: "Constituency"
      type: string
      sql: ${TABLE}.constituency_name ;;
    }



    dimension: constituency_type {
      group_label: "Constituency Info"
      label: "Constituency Type"
      type: string
      sql: ${TABLE}.constituency_type17 ;;
    }

    dimension: country_name {
      group_label: "Constituency Info"
      label: "Country"
      type: string
      sql: ${TABLE}.country_name ;;
    }

    dimension: county_name {
      group_label: "Constituency Info"
      label: "County"
      type: string
      sql: ${TABLE}.county_name ;;
    }

    dimension: region_name {
      group_label: "Constituency Info"
      label: "Region"
      type: string
        sql: case when ${TABLE}.region_name = "East" then "Eastern" else ${TABLE}.region_name end;;
    }


  measure: count_regions {
    group_label: "Constituency Info"
    label: "Regions"
    type: count_distinct
    sql: ${region_name} ;;
  }






    #-----------------------------------------Brexit 2016

    dimension: vote_leave {
      label: "Voted Leave"
      group_label: "Brexit"
      type: number
      sql: ${TABLE}.brexitleave ;;
      value_format: "0\%"
    }

    dimension: vote_remain {
      label: "Voted Remain"
      group_label: "Brexit"
      type: number
      sql: 100 - ${vote_leave} ;;
      value_format: "0\%"
    }

    measure: voted_leave {
      label: "Voted Leave Yes"
      type: number
      sql: sum(case when ${vote_leave} > 50 then 1 else null end) ;;
    }

#-----------------------------------------2010 Election

    dimension: 2010_elecorate {
      group_label: "2010 Election"
      label: "Electorate 2010"
      type: number
      sql: ${TABLE}.elecorate10 ;;
    }

    measure: 2010_elecorate_total {
      group_label: "2010 Election"
      label: "Electorate Total 2010"
      type: sum
      sql: ${2010_elecorate} ;;
      value_format: "#,##0"
    }

    dimension: 2010_turnout {
      group_label: "2010 Election"
      label: "Turnout 2010"
      type: number
      sql: ${TABLE}.turn10 ;;
      value_format: "0\%"
    }

    dimension: 2010_winner {
      group_label: "2010 Election"
      label: "Winning party 2010"
      type: string
      sql: case when ${TABLE}.winner10 is null then 'NI' else ${TABLE}.winner10 end ;;
    }

    dimension: 2010_winning_majority {
      group_label: "2010 Election"
      label: "Winning Majority 2010"
      type: number
      sql: ${TABLE}.majority10 ;;
      value_format: "0.00\%"
    }

  measure: 2010_winning_majority_measure {
    group_label: "2010 Election"
    label: "Winning Majority 2010"
    type: sum
    sql: ${TABLE}.majority10 ;;
    value_format: "0.00\%"
  }

    dimension: conservative_vote_2010 {
      group_label: "2010 Election"
      label: "Conservative Votes 2010"
      type: number
      sql: ${TABLE}.convote10 ;;
    }

    measure: conservative_total_vote_2010 {
      group_label: "2010 Election"
      label: "Conservative Total Votes 2010"
      type: sum
      sql: ${conservative_vote_2010} ;;
    }

    dimension: conservative_percent_2010 {
      group_label: "2010 Election"
      label: "Conservative POV 2010"
      type: number
      sql: ${TABLE}.con10 ;;
      value_format: "0.00\%"
    }

    dimension: labour_vote_2010{
      group_label: "2010 Election"
      label: "Labour Votes 2010"
      type: number
      sql: ${TABLE}.labvote10 ;;
    }

    dimension: labour_percent_2010 {
      group_label: "2010 Election"
      label: "Labour POV 2010"
      type: number
      sql: ${TABLE}.lab10 ;;
      value_format: "0.00\%"
    }

    measure: labour_total_vote_2010 {
      group_label: "2010 Election"
      label: "Labour Total Votes 2010"
      type: sum
      sql: ${labour_vote_2010} ;;
    }

    dimension: liberal_democrat_vote_2010 {
      group_label: "2010 Election"
      label: "Liberal Democrat Votes 2010"
      type: number
      sql: ${TABLE}.ldvote10 ;;
    }

    dimension: liberal_democrat_percent_2010 {
      group_label: "2010 Election"
      label: "Liberal Democrat POV 2010"
      type: number
      sql: ${TABLE}.ld10 ;;
      value_format: "0.00\%"
    }

    measure: liberal_democrat_total_vote_2010 {
      group_label: "2010 Election"
      label: "Liberal Democrat Total Votes 2010"
      type: sum
      sql: ${liberal_democrat_vote_2010} ;;
    }

    dimension: snp_vote_2010 {
      group_label: "2010 Election"
      label: "SNP Votes 2010"
      type: number
      sql: ${TABLE}.snpvote10 ;;
    }

    dimension: snp_percent_2010 {
      group_label: "2010 Election"
      label: "SNP POV 2010"
      type: number
      sql: ${TABLE}.snp10 ;;
      value_format: "0.00\%"
    }

    measure: snp_total_vote_2010 {
      group_label: "2010 Election"
      label: "SNP Total Votes 2010"
      type: sum
      sql: CAST(${snp_vote_2010} AS INT64) ;;
    }

    dimension: bnp_percent_2010 {
      group_label: "2010 Election"
      label: "BNP POV 2010"
      type: number
      sql: ${TABLE}.bnp10 ;;
      value_format: "0.00\%"
    }

    dimension: bnp_vote_2010 {
      group_label: "2010 Election"
      label: "BNP Votes 2010"
      type: number
      sql: ${TABLE}.bnpvote10 ;;
    }

    measure: bnp_total_vote_2010 {
      group_label: "2010 Election"
      label: "BNP Total Votes 2010"
      type: sum
      sql: ${bnp_vote_2010} ;;
    }

    dimension: green_vote_2010 {
      group_label: "2010 Election"
      label: "Green Votes 2010"
      type: number
      sql: ${TABLE}.greenvote10 ;;
    }

    dimension: green_percent_2010 {
      group_label: "2010 Election"
      label: "Green POV 2010"
      type: number
      sql: ${TABLE}.green10 ;;
      value_format: "0.00\%"
    }

    measure: green_total_vote_2010 {
      group_label: "2010 Election"
      label: "Green Total Votes 2010"
      type: sum
      sql: ${green_vote_2010} ;;
    }

    dimension: plaid_cymru_percent_2010 {
      group_label: "2010 Election"
      label: "Plaid Cymru POV 2010"
      type: number
      sql: ${TABLE}.pc10 ;;
      value_format: "0.00\%"
    }

    dimension: plaid_cymru_vote_2010 {
      group_label: "2010 Election"
      label: "Plaid Cymru Votes 2010"
      type: number
      sql: ${TABLE}.pcvote10 ;;
    }

    measure: plaid_cymru_total_vote_2010 {
      group_label: "2010 Election"
      label: "Plaid Cymru Total Votes 2010"
      type: sum
      sql: CAST(${plaid_cymru_vote_2010} AS INT64) ;;
    }

    dimension: ukip_percent_2010 {
      group_label: "2010 Election"
      label: "UKIP POV 2010"
      type: number
      sql: ${TABLE}.ukip10 ;;
      value_format: "0.00\%"
    }

    dimension: ukip_vote_2010 {
      group_label: "2010 Election"
      label: "UKIP Votes 2010"
      type: number
      sql: ${TABLE}.ukipvote10 ;;
    }

    measure: ukip_total_vote_2010 {
      group_label: "2010 Election"
      label: "UKIP Total Votes 2010"
      type: sum
      sql: ${ukip_vote_2010} ;;
    }



    dimension: sorting {
      group_label: "2010 Election"
      label: "Seat Sorting"
      type: number
      sql: case when ${2010_winner} = 'Conservative' then 1
         when ${2010_winner} = 'Labour' then 2
         when ${2010_winner} = 'Liberal Democrat' then 3
         when ${2010_winner} =  'NI' then 4
         when ${2010_winner} = 'Scottish National Party' then 5
         when ${2010_winner} = 'Plaid Cymru' then 6
         when ${2010_winner} = 'Green' then 7
         when ${2010_winner} = 'Other' then 8
         else 0
         end;;
    }

  dimension: party_image {
    label: "Party Image"
    group_label: "2010 Election"
    type: string
    sql: ${2010_winner} ;;
    html:
      {% if {{value}} == 'Conservative' %}
      <div><img src="https://www.una.org.uk/sites/default/files/styles/gallery_scale/public/conservative-party-logo.jpg?itok=dtUePSsP" width="55%" height="55%" align="middle"/></div>
      {% elsif {{value}} == 'Labour' %}
      <div><img src="https://www.una.org.uk/sites/default/files/styles/gallery_scale/public/labour%20FINAL.jpg?itok=A2jafuMz" width="55%" height="55%" align="middle"/></div>
      {% elsif {{value}} == 'Liberal Democrat' %}
      <div><img src="https://www.una.org.uk/sites/default/files/styles/gallery_scale/public/Liberal_Democrats_logo_2014%20real.jpg?itok=H-DP4Bb_" width="55%" height="55%" align="middle"/></div>
      {% elsif {{value}} == 'Scottish National Party' %}
      <div><img src="https://res.cloudinary.com/dods/image/upload/c_fill,g_center,h_500,w_1120/v1/logos/snp_logo_0_obvac0.jpg" width="55%" height="55%" align="middle"/></div>
      {% elsif {{value}} == 'Plaid Cymru' %}
      <div><img src="https://i.pinimg.com/originals/ab/03/0f/ab030fbd0515194056e047ca281abdf4.jpg" width="55%" height="55%" align="middle"/></div>
      {% elsif {{value}} == 'Green' %}
      <div><img src="https://www.greenparty.org.uk/assets/logos/visual-identity/Centred/White%20on%20Green/GPEW-centred-online-wg.png" width="55%" height="55%" align="middle"/></div>
      {% elsif {{value}} == 'Other' %}
      <div><img src="https://www.iamother.com/wp-content/uploads/2017/05/og-1.png" width="55%" height="55%" align="middle"/></div>
      {% endif %}
      ;;
  }



# measure: total_votes {
#   group_label: "2010 Election"
#   label: "Total Lab+Con"
#   type: sum
#   sql: ${conservative_vote_2010}+${labour_vote_2010};;
# }
#
#   measure: total_votes2 {
#     group_label: "2010 Election"
#     label: "Total Lib+bnp+gre"
#     type: sum
#     sql:${liberal_democrat_vote_2010}+${bnp_vote_2010}+${green_vote_2010};;
#   }
#
#
# measure: total_votes3 {
#   group_label: "2010 Election"
#   label: "Total Combined"
#   type: number
#   sql: sum(${liberal_democrat_vote_2010}+${bnp_vote_2010}+${green_vote_2010}+${conservative_vote_2010}+${labour_vote_2010});;
# }
#

#  +${snp_vote_2010}
#  ${plaid_cymru_vote_2010}+
#+${ukip_vote_2010}
# +${plaid_cymru_vote_2010}
# +${liberal_democrat_vote_2010}+${bnp_vote_2010}+${green_vote_2010}+${ukip_vote_2010}





#-----------------------------------------2015 Election

  dimension: winner15 {
    group_label: "2015 Election"
    label: "2015 Winner"
    type: string
    sql: ${TABLE}.winner15 ;;
  }

  dimension: electorate15 {
    group_label: "2015 Election"
    label: "Electorate 2010"
    type: number
    sql: ${TABLE}.electorate15 ;;
  }

  dimension: majority15 {
    group_label: "2015 Election"
    label: "Winning Majority 2010"
    type: number
    sql: ${TABLE}.majority15 ;;
  }

  dimension: totalvote15 {
    group_label: "2015 Election"
    label: "Votes 2010"
    type: number
    sql: ${TABLE}.totalvote15 ;;
  }

  dimension: turnout15 {
    group_label: "2015 Election"
    label: "Turnout 2010"
    type: number
    sql: ${TABLE}.turnout15 ;;
  }

  dimension: seatchange1015 {
    group_label: "2015 Election"
    label: "Seat Change 2010"
    type: string
    sql: ${TABLE}.seatchange1015 ;;
  }






  dimension: bnpvote15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.bnpvote15 ;;
  }

  dimension: con1015 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.con1015 ;;
  }

  dimension: con15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.con15 ;;
  }

  dimension: convote15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.convote15 ;;
  }

  dimension: lab1015 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.lab1015 ;;
  }

  dimension: lab15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.lab15 ;;
  }
  dimension: greenvote15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.greenvote15 ;;
  }
  dimension: green1015 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.green1015 ;;
  }

  dimension: green15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.green15 ;;
  }

  dimension: ld1015 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.ld1015 ;;
  }

  dimension: ld15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.ld15 ;;
  }

  dimension: ldvote15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.ldvote15 ;;
  }


  dimension: labvote15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.labvote15 ;;
  }

  dimension: other15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.other15 ;;
  }

  dimension: pc1015 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.pc1015 ;;
  }

  dimension: pc15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.pc15 ;;
  }

  dimension: pcvote15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.pcvote15 ;;
  }

  dimension: snp1015 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.snp1015 ;;
  }

  dimension: snp15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.snp15 ;;
  }

  dimension: snpvote15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.snpvote15 ;;
  }

  dimension: ukip1015 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.ukip1015 ;;
  }

  dimension: ukip15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.ukip15 ;;
  }

  dimension: ukipvote15 {
    group_label: "2015 Election"
    type: number
    sql: ${TABLE}.ukipvote15 ;;
  }











#-----------------------------------------2017 Election
  dimension: winner17 {
    group_label: "2017 Election"
    label: "2017 Winner"
    type: string
    sql: ${TABLE}.winner17 ;;
  }

  dimension: party_2017 {
    label: "2017 Party"
    group_label: "2017 Election"
    type: string
     sql: case
         when ${TABLE}.winner17 = 'Con' then 'Conservative'
         when ${TABLE}.winner17 = 'Lab' then 'Labour'
         when ${TABLE}.winner17 = 'LD' then 'Liberal Democrat'
         when ${TABLE}.winner17 = 'SNP' then 'Scottish National Party'
         when ${TABLE}.winner17 = 'PC' then 'Plaid Cymru'
         when ${TABLE}.winner17 = 'Ind' then 'Independent'
         when ${TABLE}.winner17 = 'SF' then 'Sinn Féin'
         else ${TABLE}.winner17
         end;;
  }

  dimension: seat_sorting_2017 {
    group_label: "2017 Election"
    label: "Seat Sorting"
    type: number
    sql: case
         when ${TABLE}.winner17  = 'Con'  then 1
         when ${TABLE}.winner17  = 'Lab'  then 2
         when ${TABLE}.winner17  = 'SNP'  then 3
         when ${TABLE}.winner17  = 'LD'   then 4
         when ${TABLE}.winner17  = 'PC'   then 7
         when ${TABLE}.winner17  = 'DUP'  then 5
         when ${TABLE}.winner17  = 'SF'   then 6
         else 9
         end;;
  }

    dimension: party_image_2017 {
    label: "Party Image 2017"
    group_label: "2017 Election"
    type: string
    sql: ${winner17} ;;
    html:
      {% if {{value}} == 'Con' %}
      <div><img src="https://www.una.org.uk/sites/default/files/styles/gallery_scale/public/conservative-party-logo.jpg?itok=dtUePSsP" width="100px" height="100px" align="middle"/></div>
      {% elsif {{value}} == 'Lab' %}
      <div><img src="https://www.una.org.uk/sites/default/files/styles/gallery_scale/public/labour%20FINAL.jpg?itok=A2jafuMz" width="100px" height="100px"  align="middle"/></div>
      {% elsif {{value}} == 'LD' %}
      <div><img src="https://www.una.org.uk/sites/default/files/styles/gallery_scale/public/Liberal_Democrats_logo_2014%20real.jpg?itok=H-DP4Bb_" width="100px" height="100px"  align="middle"/></div>
      {% elsif {{value}} == 'SNP' %}
      <div><img src="https://res.cloudinary.com/dods/image/upload/c_fill,g_center,h_500,w_1120/v1/logos/snp_logo_0_obvac0.jpg" width="100px" height="100px"  align="middle"/></div>
      {% elsif {{value}} == 'PC' %}
      <div><img src="https://i.pinimg.com/originals/ab/03/0f/ab030fbd0515194056e047ca281abdf4.jpg" width="100px" height="100px"  align="middle"/></div>
      {% elsif {{value}} == 'SF' %}
      <div><img src="https://ih0.redbubble.net/image.359729290.5990/flat,550x550,075,f.u4.jpg" width="100px" height="100px"  align="middle"/></div>
      {% elsif {{value}} == 'DUP' %}
      <div><img src="https://ichef.bbci.co.uk/images/ic/1200x675/p01lcnlr.jpg" width="100px" height="100px"  align="middle"/></div>
      {% endif %}
      ;;
  }


  dimension: electorate17 {
    group_label: "2017 Election"
    label: "2017 Electorate"
    type: number
    sql: ${TABLE}.electorate17 ;;
  }

  measure: electorate_total_17 {
    group_label: "2017 Election"
    label: "2017 Total Electorate"
    type: sum
    sql: ${TABLE}.electorate17 ;;
    #value_format: "#,##0"
  }

  dimension: valid_votes17 {
    group_label: "2017 Election"
    label: "2017 Votes"
    type: number
    sql: ${TABLE}.valid_votes17 ;;
  }

  measure: valid_total_votes17 {
    group_label: "2017 Election"
    label: "2017 Total Votes"
    type: sum
    sql: ${TABLE}.valid_votes17 ;;
  }

  dimension: turnout17 {
    group_label: "2017 Election"
    label: "2017 Turnout"
    type: number
    sql: ${TABLE}.turnout17 ;;
  }




  #-----------------------------------------2017 Conservative
  dimension: con1517 {
    group_label: "2017 Election"
    label: "Conservative Vote Change from 2015"
    type: number
    sql: ${TABLE}.con1517 ;;
    value_format: "0.00\%"
  }

  dimension: con17 {
    group_label: "2017 Election"
    label: "Conservative POV"
    type: number
    sql: ${TABLE}.con17 ;;
    value_format: "0.00\%"
  }

  dimension: convote17 {
    group_label: "2017 Election"
    label: "Conservative Votes"
    type: number
    sql: ${TABLE}.convote17 ;;
  }

  measure: con_total_vote17 {
    group_label: "2017 Election"
    label: "Conservative Total Votes"
    type: sum
    sql: ${TABLE}.convote17 ;;
  }

  #-----------------------------------------2017 Labour
  dimension: lab1517 {
    group_label: "2017 Election"
    label: "Labour Vote Change from 2015"
    type: number
    sql: ${TABLE}.lab1517 ;;
    value_format: "0.00\%"
  }

  dimension: lab17 {
    group_label: "2017 Election"
    label: "Labour POV"
    type: number
    sql: ${TABLE}.lab17 ;;
    value_format: "0.00\%"
  }

  dimension: labvote17 {
    group_label: "2017 Election"
    label: "Labour Votes"
    type: number
    sql: ${TABLE}.labvote17 ;;
  }

  measure: lab_total_vote17 {
    group_label: "2017 Election"
    label: "Labour Total Votes"
    type: sum
    sql: ${TABLE}.labvote17 ;;
  }

#-----------------------------------------2017 Liberal Democratic
  dimension: ld1517 {
    group_label: "2017 Election"
    label: "Liberal Vote Change from 2015"
    type: number
    sql: ${TABLE}.ld1517 ;;
    value_format: "0.00\%"
  }

  dimension: ld17 {
    group_label: "2017 Election"
    label: "Liberal Democratic POV"
    type: number
    sql: ${TABLE}.ld17 ;;
    value_format: "0.00\%"
  }

  dimension: ldvote17 {
    group_label: "2017 Election"
    label: "Liberal Democratic Votes "
    type: number
    sql: ${TABLE}.ldvote17 ;;
  }

  measure: ld_total_vote17 {
    group_label: "2017 Election"
    label: "Liberal Democratic Total Votes "
    type: sum
    sql: ${TABLE}.ldvote17 ;;
  }




















  dimension: invalid_votes17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.invalid_votes17 ;;
  }

  dimension: majority17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.majority17 ;;
  }

  measure: 2017_winning_majority_measure {
    group_label: "2017 Election"
    label: "Winning Majority 2017"
    type: sum
    sql: ${TABLE}.majority17 ;;
    drill_fields: [party_2017, party_image_2017]
  }




  dimension: alliance17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.alliance17 ;;
  }

  dimension: alliancevote17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.alliancevote17 ;;
  }



  dimension: dup17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.dup17 ;;
  }

  dimension: dupvote17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.dupvote17 ;;
  }



  dimension: green1517 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.green1517 ;;
  }

  dimension: green17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.green17 ;;
  }

  dimension: greenvote17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.greenvote17 ;;
  }




  dimension: ukip1517 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.ukip1517 ;;
  }

  dimension: ukip17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.ukip17 ;;
  }

  dimension: ukipvote17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.ukipvote17 ;;
  }

  dimension: uup17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.uup17 ;;
  }

  dimension: uupvote17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.uupvote17 ;;
  }




  dimension: sdlp17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.sdlp17 ;;
  }

  dimension: sdlpvote17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.sdlpvote17 ;;
  }

    dimension: other17 {
      group_label: "2017 Election"
      type: number
      sql: ${TABLE}.other17 ;;
    }

    dimension: othervote17 {
      group_label: "2017 Election"
      type: number
      sql: ${TABLE}.othervote17 ;;
    }

  dimension: pc1517 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.pc1517 ;;
  }

  dimension: pc17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.pc17 ;;
  }

    dimension: pcvote17 {
      group_label: "2017 Election"
      type: number
      sql: ${TABLE}.pcvote17 ;;
    }

    dimension: result17 {
      group_label: "2017 Election"
      type: string
      sql: ${TABLE}.result17 ;;
    }

  dimension: second17 {
    group_label: "2017 Election"
    type: string
    sql: ${TABLE}.second17 ;;
  }

  dimension: snpvote17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.snpvote17 ;;
  }

  dimension: snp1517 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.snp1517 ;;
  }

  dimension: snp17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.snp17 ;;
  }

  dimension: sf17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.sf17 ;;
  }

  dimension: sfvote17 {
    group_label: "2017 Election"
    type: number
    sql: ${TABLE}.sfvote17 ;;
  }




    measure: count {
      type: count
      drill_fields: [constituency, county_name, region_name, country_name]
    }
  }
