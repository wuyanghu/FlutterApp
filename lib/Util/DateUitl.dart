
class DateUtil{
    static String getyyyymmddhhmmss(){
      var now=new DateTime.now();
      var dateStr = "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}";
      return dateStr;
    }
}