connection: "htf2021"

# include all the views
include: "/views/**/*.view"

datagroup: htf2021_group7_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: htf2021_group7_default_datagroup

explore: ages {}

explore: companies {}

explore: event_reviews {
  join: events {
    type: left_outer
    sql_on: ${event_reviews.event_id} = ${events.id} ;;
    relationship: many_to_one
  }
}

explore: company_employees {}

explore: bnbreservations {}

explore: bnbcheckins {}

explore: aib_bnbs_nyc {}

explore: appearance {}

explore: gender {}

explore: financial_status {}

explore: nationalities {}

explore: physical_characteristics {}

explore: locations {}

explore: events {}

explore: religions {}

explore: people {
  join: ride_passengers {
    type:  left_outer
    sql_on: ${people.id} = ${ride_passengers.passenger_id} ;;
    relationship:  one_to_many
  }
  conditionally_filter: {
    filters: [ride_passengers.ride_id: "9"]
  }
}

explore: ride_info {}

explore: ride_passengers {}

explore: taxi_rides {
  join: taxis {
    type: left_outer
    sql_on: ${taxi_rides.taxi_id} = ${taxis.id} ;;
    relationship: many_to_one
  }
}

explore: roles {}

explore: sub_departments {}

explore: taxis {}
