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
  listToBeSorted.sort((a,b) => a.totalTime.toString().compareTo(b.totalTime.toString()));
}

void TotalTimeDescending(List<Recipe> listToBeSorted) // Descending: Highest -> Lowest
{
 listToBeSorted.sort((a,b) => b.totalTime.toString().compareTo(a.totalTime.toString()));
}

