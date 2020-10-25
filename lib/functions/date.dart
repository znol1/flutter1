String rusDate(date) {
  var date1 = date.toString();
  List date2 = date1.split(' ');
  int n;
  if (date2[0].length == 3) {
    n = 2;
  } else {
    n = 1;
  }
  if (date2[0] == 'Jan') {
    return date2[1].substring(0, n) + ' Янв ' + date2[2];
  } else if (date2[0] == 'Feb') {
    return date2[1].substring(0, n) + ' Фев ' + date2[2];
  } else if (date2[0] == 'Mar') {
    return date2[1].substring(0, n) + ' Мар ' + date2[2];
  } else if (date2[0] == 'Apr') {
    return date2[1].substring(0, n) + ' Апр ' + date2[2];
  } else if (date2[0] == 'May') {
    return date2[1].substring(0, n) + ' Май ' + date2[2];
  } else if (date2[0] == 'June') {
    return date2[1].substring(0, n) + ' Июн ' + date2[2];
  } else if (date2[0] == 'July') {
    return date2[1].substring(0, n) + ' Июл ' + date2[2];
  } else if (date2[0] == 'Aug') {
    return date2[1].substring(0, n) + ' Авг ' + date2[2];
  } else if (date2[0] == 'Sept') {
    return date2[1].substring(0, n) + ' Сен ' + date2[2];
  } else if (date2[0] == 'Oct') {
    return date2[1].substring(0, n) + ' Окт ' + date2[2];
  } else if (date2[0] == 'Nov') {
    return date2[1].substring(0, n) + ' Ноя ' + date2[2];
  } else if (date2[0] == 'Dec') {
    return date2[1].substring(0, n) + ' Дек ' + date2[2];
  }
}
