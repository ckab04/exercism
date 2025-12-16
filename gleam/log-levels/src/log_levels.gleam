import gleam/string
pub fn message(log_line: String) -> String {

  let result = case string.split_once(log_line, ":"){
    Ok(#(_, second)) -> second
    Error(Nil)  -> ""
  }

  string.trim(result)
}

pub fn log_level(log_line: String) -> String {
  let val = case string.split(log_line, ":"){
    [first, .._] -> first
    [] -> ""
  }

  val
  |> string.replace("[", "")
  |> string.replace("]", "")
  |> string.lowercase

}

pub fn reformat(log_line: String) -> String {
  let #(val1, val2) =
  case string.split_once(log_line, ":"){
    Ok(#(first, second)) -> #(first, second)
    Error(Nil) -> #("", "")
  }

 let v =  val1
  |> string.drop_start(1)
  |> string.drop_end(1)

  string.trim(val2) <> " (" <> string.lowercase(v) <> ")"
}
