import gleam/list

// TODO: please define the Pizza custom type
//
pub type Pizza{
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(mypizza) -> 1 + pizza_price(mypizza)
    ExtraToppings(mypizza) -> 2 + pizza_price(mypizza)
  }

}

pub fn order_price(order: List(Pizza)) -> Int {
  let items_price = order_price_private(order, 0)

  let extra_price = case list.length(order){
    1 -> 3
    2 -> 2
    _ -> 0
  }

  items_price + extra_price

}


fn order_price_private(order: List(Pizza),  acc: Int) -> Int{
  case order {
    [] -> acc
    [first, ..rest] -> order_price_private(rest, acc + pizza_price(first))
  }
}
