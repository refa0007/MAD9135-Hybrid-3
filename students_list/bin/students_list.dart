import 'dart:convert';

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  List<Map<String, String>> jsonData = [];

  List<dynamic> decodedData = jsonDecode(json);
  for (var item in decodedData) {
    if (item is Map<String, dynamic>) {
      Map<String, String> convertedItem = {};
      item.forEach((key, value) {
        if (value is String) {
          convertedItem[key] = value;
        }
      });
      jsonData.add(convertedItem);
    }
  }

  Students students = Students(jsonData);

  students.sort("last");
  students.output();

  Map<String, String> newStudent = {
    "first": "Majed",
    "last": "Refai",
    "email": "majed@algonquincollege.com"
  };
  students.plus(newStudent);
  students.output();

  students.remove("last");
  students.output();
}

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void sort(String? field) {
    if (field != null) {
      people.sort((a, b) => (a[field]!.compareTo(b[field]!)));
    }
  }

  void output() {
    for (var person in people) {
      print("First Name: ${person['first']}");
      print("Last Name: ${person['last']}");
      print("Email: ${person['email']}");
      print("");
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field) {
    people.removeWhere((person) => person.containsKey(field));
  }
}
