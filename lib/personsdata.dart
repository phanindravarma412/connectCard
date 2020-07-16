import 'persons.dart';

class PersonsData {
  List<Person> data = [
    Person('Keanu Reeves', 'Data Scientist', '+91 9001254555',
        'johnwick@gmail.com'),
    Person('Chris Hemsworth', 'Cloud Engineer', '+91 9778811235',
        'thor@gmail.com'),
    Person('Conor Mcgregor', 'UI/UX Designer', '+91 9542350000',
        'notoriousmma@gmail.com'),
    Person('Akshay Kumar', 'Full  Stack Developer', '+91 99884455566',
        'kesari@gmail.com'),
    Person('Dhoni', 'Project Manager', '+91 8521479630', 'msd@gmail.com'),
  ];

  int personNumber = 0;

  void nextPerson() {
    personNumber = (personNumber + 1) % data.length;
  }

  void previousPerson() {
    personNumber = (personNumber - 1) % data.length;
  }

  String getName() {
    return data[personNumber].name;
  }

  String getJobRole() {
    return data[personNumber].jobrole;
  }

  String getPhoneNumber() {
    return data[personNumber].phonenumber;
  }

  String getEmailNumber() {
    return data[personNumber].email;
  }
}
