import gleam/string
import gleam/result

pub fn first_letter(name: String) {
  name
  |>string.trim
  |>string.first
  |>result.unwrap("String is empty after trimming")
}

pub fn initial(name: String) {
  name
  |>first_letter
  |>string.capitalise
  |>string.append(".")
}

pub fn initials(full_name: String) {
  let f_n = full_name
  |>string.split(" ")


  case f_n {
    [first, second] -> first |>initial <> " " <> second |> initial
    _ ->""

  }
}

pub fn pair(full_name1: String, full_name2: String) {
  //      ******       ******
  //    **      **   **      **
  //  **         ** **         **
  // **            *            **
  // **                         **
  // **     X. X.  +  X. X.     **
  //  **                       **
  //    **                   **
  //      **               **
  //        **           **
  //          **       **
  //            **   **
  //              ***
  //               *
 let model =
  "      ******       ******
      **      **   **      **
    **         ** **         **
   **            *            **
   **                         **
   **     X. X.  +  X. X.     **
    **                       **
      **                   **
        **               **
          **           **
            **       **
              **   **
                ***
                 *
  "
  let f_n1 = full_name1 |> initials
  let f_n2 = full_name2 |> initials

  let model1 = string.replace(model, "X. X.", f_n1)
  string.replace(model1, "X. X.", f_n2)
}
