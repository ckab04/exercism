import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(place, treasure) = place_location

  #(treasure,place)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  let #(place1, location1) = place_location
 let #(location2, place2) = treasure_location
 place1 == place2 && location1 == location2
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let place_of_treasure = case place {
    #(my_place, #(location, value)) -> place_location_to_treasure_location(#(location, value))
    _ -> #(0, "")
  }

  treasures
  |> list.filter(fn(treasure) { treasure.1  == place_of_treasure})

  list.length(treasures)

}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  todo
}
