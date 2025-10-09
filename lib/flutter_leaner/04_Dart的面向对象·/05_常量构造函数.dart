main(List<String> args) {
  const person1 = Person("name");
  const person2 = Person("name");

  print(identical(person1, person2));
}

class Person {
  final String name;

  const Person(this.name);
}
