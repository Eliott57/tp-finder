import 'package:faker/faker.dart';

import 'dart:math';

import '../../models/bachelor.dart';

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

List<Bachelor> BachelorSeeder() {
  Faker faker = Faker();

  List<Bachelor> bachelors = [];

  List<String> malesNames = [
    'Gabriel',
    'Ethan',
    'Nathan',
    'Thomas',
    'Lucas',
    'Louis',
    'Hugo',
    'Raphaël',
    'Noah',
    'Léo',
    'Liam',
    'Adam',
    'Alexandre',
    'Mathis',
    'Victor'
  ];

  List<String> femalesNames = [
    'Emma',
    'Léa',
    'Chloé',
    'Manon',
    'Sarah',
    'Alice',
    'Camille',
    'Juliette',
    'Lola',
    'Zoé',
    'Anna',
    'Clara',
    'Lina',
    'Louise',
    'Éléna'
  ];

  for(int i = 1; i <= 15; i++){
    Bachelor newBachelor = Bachelor(
        femalesNames[random(0, femalesNames.length)],
        faker.person.name().split(' ')[1],
        Gender.woman,
        'images/woman-$i.png',
        [Gender.man],
        faker.job.title(),
        faker.lorem.sentence()
    );

    bachelors.add(newBachelor);
  }

  for(int i = 1; i <= 15; i++){
    Bachelor newBachelor = Bachelor(
        malesNames[random(0, malesNames.length)],
        faker.person.name().split(' ')[1],
        Gender.man,
        'images/man-$i.png',
        [Gender.woman],
        faker.job.title(),
        faker.lorem.sentence()
    );

    bachelors.add(newBachelor);
  }

  bachelors.shuffle();

  return bachelors;
}