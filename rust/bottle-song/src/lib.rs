use std::{collections::HashMap, ops::Index};


pub fn recite(start_bottles: u32, take_down: u32) -> String {


    let mut song_values = HashMap::new();
    song_values.insert(10, "Ten".to_string());
    song_values.insert(9, "Nine".to_string());
    song_values.insert(8, "Eight".to_string());
    song_values.insert(7, "Seven".to_string());
    song_values.insert(6, "Six".to_string());
    song_values.insert(5, "Five".to_string());
    song_values.insert(4, "Four".to_string());
    song_values.insert(3, "Three".to_string());
    song_values.insert(2, "Two".to_string());
    song_values.insert(1, "One".to_string());


    let text = "Ten green bottles hanging on the wall,
    Ten green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be nine green bottles hanging on the wall.

    Nine green bottles hanging on the wall,
    Nine green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be eight green bottles hanging on the wall.

    Eight green bottles hanging on the wall,
    Eight green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be seven green bottles hanging on the wall.

    Seven green bottles hanging on the wall,
    Seven green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be six green bottles hanging on the wall.

    Six green bottles hanging on the wall,
    Six green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be five green bottles hanging on the wall.

    Five green bottles hanging on the wall,
    Five green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be four green bottles hanging on the wall.

    Four green bottles hanging on the wall,
    Four green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be three green bottles hanging on the wall.

    Three green bottles hanging on the wall,
    Three green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be two green bottles hanging on the wall.

    Two green bottles hanging on the wall,
    Two green bottles hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be one green bottle hanging on the wall.

    One green bottle hanging on the wall,
    One green bottle hanging on the wall,
    And if one green bottle should accidentally fall,
    There'll be no green bottles hanging on the wall.";


    for value in (0..start_bottles).rev(){

        let v = song_values.get(&value).unwrap();

    }



 todo!("Return the bottle song starting at {start_bottles} and taking down {take_down} bottles")
}
