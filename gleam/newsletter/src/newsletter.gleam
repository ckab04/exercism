import gleam/string
import gleam/list
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  use content <- simplifile.read(path)

  content
  |>string.split("\n")
  |>list.map(string.trim)
  |> Ok
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  let _ = simplifile.create_file(path)
  Ok(Nil)
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  let content = email <> "\n"
  simplifile.write(path, content)
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  //use content <- read_emails(emails_path)
  let content = case read_emails(emails_path){
    Ok(x) -> x
    Error(y) -> []
  }

  content
  |>list.each(fn(mail){
    case send_email(mail){
      Ok(_) -> simplifile.write(log_path, mail)
      _ -> Error(_)
    }
  })

  Ok(Nil)
}

fn send_email(mail: String) -> Result(Nil, Nil){

  case string.contains(mail, "@") {
    True -> Ok(Nil)
    False -> Error(Nil)
  }

}
