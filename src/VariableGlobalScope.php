<?php

$name = "Rizky";

function sayHello(){
    global $name;
    echo $name . PHP_EOL;
}

sayHello();