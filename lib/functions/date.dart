String rusDate(date) {
  var date1 = date.toString();
  List date2 = date1.split(' ');
  int n;
  if (date2[1].length == 3) {
    n = 2;
  } else {
    n = 1;
  }
  if (date2[0] == 'Jan') {
    return date2[1].substring(0, n) + ' Янв ';
  } else if (date2[0] == 'Feb') {
    return date2[1].substring(0, n) + ' Фев ';
  } else if (date2[0] == 'Mar') {
    return date2[1].substring(0, n) + ' Мар ';
  } else if (date2[0] == 'Apr') {
    return date2[1].substring(0, n) + ' Апр ';
  } else if (date2[0] == 'May') {
    return date2[1].substring(0, n) + ' Май ';
  } else if (date2[0] == 'June') {
    return date2[1].substring(0, n) + ' Июн ';
  } else if (date2[0] == 'July') {
    return date2[1].substring(0, n) + ' Июл ';
  } else if (date2[0] == 'Aug') {
    return date2[1].substring(0, n) + ' Авг ';
  } else if (date2[0] == 'Sept') {
    return date2[1].substring(0, n) + ' Сен ';
  } else if (date2[0] == 'Oct') {
    return date2[1].substring(0, n) + ' Окт ';
  } else if (date2[0] == 'Nov') {
    return date2[1].substring(0, n) + ' Ноя ';
  } else if (date2[0] == 'Dec') {
    return date2[1].substring(0, n) + ' Дек ';
  }
}
