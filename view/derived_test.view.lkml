# If necessary, uncomment the line below to include explore_source.
# include: "elections.model.lkml"

view: derived_test {
  derived_table: {
    explore_source: uk_general_election {
      column: constituency {}
      column: plaid_cymru_vote_2010 {}
      column: plaid_cymru_total_vote_2010 {}
    }
    sql_trigger_value: select 1 ;;
  }
  dimension: constituency {}
  dimension: plaid_cymru_vote_2010 {
    label: "Uk General Election Plaid Cymru Votes 2010"
    type: number
  }
  dimension: plaid_cymru_total_vote_2010 {
    label: "Uk General Election Plaid Cymru Total Votes 2010"
    type: number
  }

  measure: max_column {
    description: "The first and last name of the user"
    label: "Max"
    type: number
    sql: max(${plaid_cymru_total_vote_2010} );;
  }



}
