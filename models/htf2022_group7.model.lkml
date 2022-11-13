connection: "htf2022bq"

# include all the views
include: "/views/**/*.view"

datagroup: htf2022_group7_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: htf2022_group7_default_datagroup

explore: countries {}

explore: forest_coverage_mha {}

explore: co2_emissions {}

explore: generated_waste {}

explore: energy_sources {}

explore: magic_potions {}
