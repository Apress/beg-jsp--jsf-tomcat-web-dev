/*
**  Determine the number of days in the given month of the given year
*/
function daysInMonth(m, y) {
  var daysInMonth = 31;
  if (m == 4  ||  m == 6  ||  m == 9  ||  m == 11) daysInMonth = 30;
  if (m == 2) {
    daysInMonth = ((y%4) == 0)
                         ? (((y%100) == 0)
                                     ? (((y%400) == 0) ? 29 : 28)
                                     : 29
                                     )
                         :28
                         ;
    }
  return daysInMonth;
  }
/*
**  Adjust the days to the requested month and year
*/
function updateMonthDays(formName, kDate) {
  var ddObj = eval("document." + formName + ".dd" + kDate);
  var mmObj = eval("document." + formName + ".mm" + kDate);
  var yyObj = eval("document." + formName + ".yy" + kDate);
  var mm = mmObj[mmObj.selectedIndex].text;
  var yy = yyObj[yyObj.selectedIndex].text;
  var wantedDays  = daysInMonth(mm, yy);
  var currentDays = ddObj.length;
  /*
   *  REMOVE days from the end if we have too many
   */
  while (wantedDays < currentDays) {
    ddObj.options[ddObj.length - 1] = null;
    currentDays--;
    }
  /*
   *  ADD days at the end if we are missing some
   */
  while (wantedDays > currentDays) {
    currentDays++;
    ddObj.appendChild(new Option(currentDays));
    }
  //
  if (ddObj.selectedIndex < 0) ddObj.selectedIndex = 0;
  }
/*
**  Select today
*/
function selectToday(formName, kDate) {
  var ddObj = eval("document." + formName + ".dd" + kDate);
  var mmObj = eval("document." + formName + ".mm" + kDate);
  var yyObj = eval("document." + formName + ".yy" + kDate);
  yyObj[thisYear - firstYear].selected = true;
  mmObj[thisMonth].selected = true;
  updateMonthDays(formName, kDate);
  ddObj[thisDay].selected = true;
  }
/*
**  Copy a day to another
*/
function copyDay(formName, kFrom, kTo) {
  var ddFromObj = eval("document." + formName + ".dd" + kFrom);
  var mmFromObj = eval("document." + formName + ".mm" + kFrom);
  var yyFromObj = eval("document." + formName + ".yy" + kFrom);
  var ddToObj = eval("document." + formName + ".dd" + kTo);
  var mmToObj = eval("document." + formName + ".mm" + kTo);
  var yyToObj = eval("document." + formName + ".yy" + kTo);
  yyToObj[yyFromObj.selectedIndex].selected = true;
  mmToObj[mmFromObj.selectedIndex].selected = true;
  updateMonthDays(formName, kTo);
  ddToObj[ddFromObj.selectedIndex].selected = true;
  }
