class BMIPersonModel {
  String genderBmi;
  String heightType;
  String weightType;
  int heightBmi;
  int weightBmi;
  int ageBmi;
  double bmiResult;

  BMIPersonModel(this.genderBmi, this.heightType, this.weightType,
      this.heightBmi, this.weightBmi, this.ageBmi, this.bmiResult);
}

class BmiCategory {
  String category;
  double lowRange;
  double highRange;
  String description;

  BmiCategory(
      this.category, this.lowRange, this.highRange, this.description);
}

List<BmiCategory> bmiCategory = [
  BmiCategory('Underweight', 0.0, 18.49, 'Possible nutritional deficiency and osteoporosis.'),
  BmiCategory('Normal', 18.5, 22.99, 'Low risk (healthy range).'),
  BmiCategory('Mild to moderate overweight', 23.0, 27.49, 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.'),
  BmiCategory('Very overweight to obese', 27.5, 100.0, 'High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome.'),
];