import gleam/string
import gleam/list
import simplifile
import gleam/result

pub fn read_emails(path: String) -> Result(List(String), Nil) {

  let content = case  simplifile.read(path) {
    Ok(value) -> value
    _ -> ""
  }

  content
  |>string.trim
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
  case simplifile.append(path, content){
    Ok(_) -> Ok(Nil)
    _ -> Error(Nil)
  }
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  use _ <- result.try(create_log_file(log_path))
  use emails <- result.try(read_emails(emails_path))

  list.each(emails, fn(email) {
use _ <- result.try(send_email(email))
 log_sent_email(log_path, email)
})
 Ok(Nil)

}

fn send_email(mail: String) -> Result(Nil, Nil){

  case string.contains(mail, "@") {
    True -> Ok(Nil)
    False -> Error(Nil)
  }

}
