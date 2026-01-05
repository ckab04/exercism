import gleam/option.{type Option, None, Some}
import gleam/int.{max}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 -> {
        case player.level {
        _value if player.level < 10 -> option.Some(Player(..player, health: 100))
        _ -> option.Some(Player(..player, health: 100, mana: option.Some(100)))
      }
      //option.Some(Player(name: None, level: 0, health: 100, mana: None))

    }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) -> case mana {
      m if m < cost -> #(player, 0)
      m -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    }
    _ -> #(Player(..player, health: player.health - cost |> max(0)), 0)
  }
}
