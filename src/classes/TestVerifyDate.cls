@isTest
private class TestVerifyDate {
    
    @istest static void trailheadModuleTestclass(){
        Date myDate = Date.today();
        Date weekStart = myDate.toStartofWeek();
        Date newDate = myDate.addDays(31);
        Integer totalDays = Date.daysInMonth(myDate.year(), myDate.month());
        Date lastDay = Date.newInstance(myDate.year(), myDate.month(), totalDays);

        Date retDate = VerifyDate.CheckDates(myDate,weekStart);
        System.assertEquals(weekStart, retDate);
        
        Date rerVal2 = VerifyDate.CheckDates(myDate,newDate);
        System.assertEquals(lastDay, rerVal2);
    }
}