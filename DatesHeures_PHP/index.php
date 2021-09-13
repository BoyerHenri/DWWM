<?php
    $unixTime = time();
    $timeZone = new \DateTimeZone('Europe/Paris');
    
    $time = new \DateTime();
    $time->setTimestamp($unixTime)->setTimezone($timeZone);
    
    $formattedTime = $time->format('Y/m/d H:i:s');
    echo $formattedTime;
    echo "<br><br>";
    //
    $formattedTime = $time->format('Y/m/d H:i:s');
    echo $formattedTime;

    //
    echo "<br><br>";
    setlocale(LC_TIME, "C");
    echo strftime("%A");

    //
    echo "<br><br>";
    $oDate=new DateTime();
    var_dump($oDate);
    echo "<br><br>";
    echo $oDate->format("d m Y A l");
    //
    echo "<br><br>";
    echo $oDate->format("l d F Y");
?>