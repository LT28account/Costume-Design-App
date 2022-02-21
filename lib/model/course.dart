class Course {
  late String number;
  late String title;
  late String prereq;
  late String imageURL;

  Course({
    required this.number,
    required this.title,
    required this.prereq,
    required this.imageURL,
  });
}

var courseList = [
  Course(
    number: 'CMSC 1613',
    title: 'Programming I',
    prereq: 'CMSC 1513',
    imageURL: 'https://m.media-amazon.com/images/I/517rMbNEp+L._AC_UY218_.jpg',
  ),
  Course(
    number: 'CMSC 2613',
    title: 'Programming II',
    prereq: 'CMSC 1613',
    imageURL: 'https://m.media-amazon.com/images/I/517rMbNEp+L._AC_UY218_.jpg',
  ),
  Course(
    number: 'CMSC 3613',
    title: 'Data Structures and Algorithms',
    prereq: 'CMSC 2613',
    imageURL: 'https://m.media-amazon.com/images/I/61uRpcdPhNL._AC_UL320_.jpg',
  ),
  Course(
    number: 'CMSC 3103',
    title: 'Object Oriented SW Design',
    prereq: 'CMSC 2613',
    imageURL: 'https://m.media-amazon.com/images/I/51f82APJVnL._AC_UY218_.jpg',
  ),
  Course(
    number: 'CMSC 4303',
    title: 'Mobile Apps Programming',
    prereq: 'CMSC 3103',
    imageURL: 'https://m.media-amazon.com/images/I/61uCLY5ovYL._AC_UY218_.jpg',
  ),
  Course(
    number: 'CMSC 4373',
    title: 'Web Server Programming',
    prereq: 'CMSC 3103',
    imageURL: 'https://m.media-amazon.com/images/I/71TkE3ajzHL._AC_UY218_.jpg',
  ),
];
