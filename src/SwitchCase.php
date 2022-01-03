<?php

$nilai = "E";

switch($nilai){
    case "A":
        echo "Anda Lulus dengan baik";
        break;
    case "B":
    case "C": 
        echo "Anda lulus";
        break;
    default:
        echo "Salah jurusan";
        break;

}
