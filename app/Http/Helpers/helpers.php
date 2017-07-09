<?php
/**
* $datetime format: $datestr="2011-09-23 19:10:18";//Your date
*/
function time_elapsed_string($datetime, $full = false) {

    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
      'y' => 'year',
      'm' => 'month',
      'w' => 'week',
      'd' => 'day',
      'h' => 'hour',
      'i' => 'minute',
      's' => 'second',
    );
    foreach ($string as $k => &$v) {
      if ($diff->$k) {
        $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
      } else {
        unset($string[$k]);
      }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}

/**
* $datetime format: $datestr="2011-09-23 19:10:18";//Your date
*/
function time_remaining_string($datetime)
{
  //Convert to date
  // $datestr="2011-09-23 19:10:18";//Your date

  $datestr = $datetime;
  $date=strtotime($datestr);//Converted to a PHP date (a second count)

  //Calculate difference
  $diff=$date-time();//time returns current time in seconds
  // return $diff;
  $days=floor($diff/(60*60*24));//seconds/minute*minutes/hour*hours/day)
  $hours=round(($diff-$days*60*60*24)/(60*60));

  //Report
  // echo "$days days $hours hours remain<br />";

  $str = 'due';
  if($diff > 0) {
    $str = 'remain';
  }

  return array("$days day(s) $hours hour(s) $str", $diff);
}
