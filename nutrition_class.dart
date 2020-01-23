class Nutrition 
  {
      double calories;
      double fat;
      double carbohydrates;
      double protein;
      double cholesterol;
      double sodium;

      Nutrition(double calories, double fat, double carbohydrates, double protein, double cholesterol, double sodium) 
      {
          this.calories = calories;
          this.fat = fat;
          this.carbohydrates = carbohydrates;
          this.protein = protein;
          this.cholesterol = cholesterol;
          this.sodium = sodium;
      }

      double getCalories() {
          return calories;
      }

      double getFat() {
          return fat;
      }

      double getCarbohydrates() {
          return carbohydrates;
      }

      double getProtein() {
          return protein;
      }

      double getCholesterol() {
          return cholesterol;
      }

      double getSodium() {
          return sodium;
      }

  }