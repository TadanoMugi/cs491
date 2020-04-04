import 'recipe_class.dart';

//////////////////////////////////////////
///       SORTING FILTERS         
//////////////////////////////////////////

void HighestRating(List<Recipe> listToBeSorted) // Ascending: Lowest -> Highest
{
  listToBeSorted.sort((a,b) => a.rating.toDouble().compareTo(b.rating.toDouble()));
}

void LowestRating(List<Recipe> listToBeSorted) // Descending: Highest -> Lowest
{
 listToBeSorted.sort((a,b) => b.rating.toDouble().compareTo(a.rating.toDouble()));
}

void AlphabeticalAscending (List<Recipe> listToBeSorted) // A -> Z
{
  listToBeSorted.sort((a, b)=> a.name.toString().compareTo(b.name.toString()));
}

void AlphabeticalDescending (List<Recipe> listToBeSorted) // Z -> A
{
  listToBeSorted.sort((a, b)=> b.name.toString().compareTo(a.name.toString()));
}

void TotalTimeAscending(List<Recipe> listToBeSorted) // Ascending: Lowest -> Highest
{
  // convert everything to minutes
  listToBeSorted.sort((a,b) => convertTimeToMinutes(a.totalTime).compareTo(convertTimeToMinutes(b.totalTime)));
}

void TotalTimeDescending(List<Recipe> listToBeSorted) // Descending: Highest -> Lowest
{
 listToBeSorted.sort((a,b) => convertTimeToMinutes(b.totalTime).compareTo(convertTimeToMinutes(a.totalTime)));
}






/////// HELPER FUNCTION ///////

double convertTimeToMinutes(String totalTime)
{
  double day = 0;
  double hour = 0;
  double minute = 0;
  double second = 0;
  int valueOfDecrement = 3; // takes into account if the integer is double-digit or not
  int decrement;
  String temp;

  totalTime = totalTime.toLowerCase();
  
  if (totalTime.contains("day") || totalTime.contains("days"))
  {
    temp = totalTime;
    decrement = valueOfDecrement;
    if ((temp.indexOf("day", 0)-valueOfDecrement) == -1)
    {
      decrement = 2;
    }
    day = double.parse(temp.substring((temp.indexOf("day", 0)-decrement), temp.indexOf("day", 0)));
    print("DAY: " + day.toString());
  }
  if (totalTime.contains("hour") || totalTime.contains("hours"))
  {
    temp = totalTime;
    decrement = valueOfDecrement;
    if ((temp.indexOf("hour", 0)-valueOfDecrement) == -1)
    {
      decrement = 2;
    }
    hour = double.parse(temp.substring((temp.indexOf("hour", 0)-decrement), temp.indexOf("hour", 0)));
    print("Hour: " + hour.toString());
  }
  if (totalTime.contains("minute") || totalTime.contains("minutes"))
  {
    temp = totalTime;
    decrement = valueOfDecrement;
    if ((temp.indexOf("min", 0)-valueOfDecrement) == -1)
    {
      decrement = 2;
    }
    
    minute = double.parse(temp.substring((temp.indexOf("min", 0)-decrement), temp.indexOf("min", 0)));
    print("Min: " + minute.toString());
  }
  
  if (totalTime.contains("second") || totalTime.contains("seconds"))
  {
    temp = totalTime;
    decrement = valueOfDecrement;
    if ((temp.indexOf("sec", 0)-valueOfDecrement) == -1)
    {
      decrement = 2;
    }
    second = double.parse(temp.substring((temp.indexOf("sec", 0)-decrement), temp.indexOf("sec", 0)));
    print("sec: " + second.toString());
  }

  return ((day * 24 * 60) + (hour * 60) + (minute) + (second/60));
}