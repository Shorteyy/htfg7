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

explore: financial_status {
  join: people {
    type: inner
    sql_on:  ${people.id} = ${financial_status.id};;
    relationship: many_to_one
  }
}

explore: nationalities {}

explore: physical_characteristics {}

explore: locations {
  join: events {
    type: inner
    sql_on: ${events.id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: events {
  join: locations {
    type: inner
    sql_on: ${locations.id} = ${events.id} ;;
    relationship: many_to_one
  }
}

explore: religions {}

explore: people {}

explore: ride_info {}

explore: ride_passengers {}

explore: taxi_rides {
  join: taxis {
    type: inner
    sql_on: ${taxi_rides.taxi_id} = ${taxis.id} ;;
    relationship: many_to_one
  }
  join: ride_passengers {
    type: inner
    sql_on:  ${ride_passengers.ride_id} = ${taxis.id};;
    relationship: many_to_one

  }
  join: ride_info {
    type: inner
    sql_on:  ${ride_info.ride_id} = ${taxis.id};;
    relationship: many_to_one

  }
  join: people {
    type: inner
    sql_on:  ${people.id} = ${ride_passengers.passenger_id};;
    relationship: many_to_one
  }

  join: events {
    type: inner
    sql_on:  ${events.id} = ${ride_info.dropoff_location};;
    relationship: many_to_one

  }
}



explore: roles {}

explore: sub_departments {}

explore: taxis {}
