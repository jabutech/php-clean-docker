<?php

// Null Coalescing operator digunakan apakah sebuah array ada isinya atau tidak
// Null Coalescing operator ditandai dengan `??`

// Tanpa coalescing
$data = [
    "action" => "Create"
];

if(isset($data["action"])){
    // Jika ada jalankan action
    $action = $data["action"];
}else{
    // Jika tidak ada return nothong
    $action = "Nothing";
}

// Print
echo $action . PHP_EOL;

// Dengan null coalescing operator

$action = $data['action'] ?? "Nothing";
// Print
echo $action . PHP_EOL;