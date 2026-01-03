import gleam/list
import gleam/float
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  let result = f -. 32.0
  result /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
 let v =  case left {
    Fahrenheit(value) -> fahrenheit_to_celsius(value)
    Celsius(value)-> value
  }

  let r = case right{
    Fahrenheit(value) -> fahrenheit_to_celsius(value)
    Celsius(value)-> value
  }

  float.compare(v, r)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, by: fn(city1: City, city2:  City) -> Order{
    compare_temperature(city1.temperature, city2.temperature)
  }
  )
}
