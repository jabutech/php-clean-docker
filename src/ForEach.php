<?php

// Digunakan untuk perulangan data array
$names = ["Rizky", "Dwi", "Aisyah"];

foreach($names as $name) {
    echo "Hai aku  $name" . PHP_EOL;
}

// Array with key
$person = [
    "first_name" => "Rizky",
    "middle_name" => "Letenk",
    "last_name" => "Darmawan",
];

foreach($person as $key => $value){
    echo "$key : $value" . PHP_EOL;
}