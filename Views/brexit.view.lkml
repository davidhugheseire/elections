view: brexit {
  sql_table_name: uk_election.brexit ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: area {
    type: string
    sql: ${TABLE}.Area ;;
  }

  dimension: area_code {
    type: string
    sql: ${TABLE}.Area_Code ;;
  }

  dimension: electorate {
    type: number
    sql: ${TABLE}.Electorate ;;
  }

  dimension: leave {
    type: number
    sql: ${TABLE}.Leave ;;
  }

  dimension: pct_leave {
    type: number
    sql: ${TABLE}.Pct_Leave ;;
  }

  dimension: pct_remain {
    type: number
    sql: ${TABLE}.Pct_Remain ;;
  }

  dimension: pct_turnout {
    type: number
    sql: ${TABLE}.Pct_Turnout ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: region_code {
    type: string
    sql: ${TABLE}.Region_Code ;;
  }

  dimension: remain {
    type: number
    sql: ${TABLE}.Remain ;;
  }


  dimension: votes_cast {
    type: number
    sql: ${TABLE}.Votes_Cast ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
