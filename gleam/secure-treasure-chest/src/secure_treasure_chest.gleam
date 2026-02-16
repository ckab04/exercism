import gleam/string


// Please define the TreasureChest type
pub opaque type TreasureChest(treasure) {
  TreasureChest(password: String, treasure: treasure)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {

  let len = string.length(password)

  case len {
    _  if len < 8 -> Error("Password must be at least 8 characters long")
    _ -> Ok(TreasureChest(password: password, treasure: contents))
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {

  case chest.password == password{
    True -> Ok(chest.treasure)
    False -> Error("Incorrect password")
  }


}
