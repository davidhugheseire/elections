connection: "dave_big_query"

include: "/view/*"                       # include all views in this project

explore: uk_general_election {}
explore: brexit {}


map_layer: my_neighborhood_layer {
 # file: "uk_constituency.topojson"
  url: "https://martinjc.github.io/UK-GeoJSON/json/eng/topo_wpc.json"
  property_key: "ons_id"
}


explore: derived_test {}
