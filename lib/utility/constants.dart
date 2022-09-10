import '../models/task_model.dart';

const List<String> labels = [
  'Development',
  'Research',
  'Design',
  'Backend',
  'call',
  'message',
  'email'
];

const List<String> letters = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

final List<Task> tasks = [
  Task('Team Meeting', '10:00 AM', 'assets/meeting.svg',
      'Discuss all questions about new projects'),
  Task('Call the stylist', '11:00 AM', 'assets/phone.svg',
      'Agree on an evening look'),
  Task('Check mail', '2:00 PM', 'assets/mail.svg', 'Write to the manger'),
  Task('Go to Gym', '5:00 PM', 'assets/gym.svg',
      'It\'s good for my mind and my health'),
  Task('Team Meeting', '10:00 AM', 'assets/meeting.svg',
      'Discuss all questions about new projects'),
  Task('Call the stylist', '11:00 AM', 'assets/phone.svg',
      'Agree on an evening look'),
  Task('Check mail', '2:00 PM', 'assets/mail.svg', 'Write to the manger'),
  Task('Go to Gym', '5:00 PM', 'assets/gym.svg',
      'It\'s good for my mind and my health'),
];
