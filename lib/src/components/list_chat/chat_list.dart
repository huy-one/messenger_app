class Chat{
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({this.name='', this.lastMessage='', this.image='', this.time='', this.isActive =false});

}

List  chatsData =[
  Chat(
      name: 'Captain America',
      lastMessage: 'let\'s play game now ',
      image: 'assets/images/captain_america.png',
      time: '3m ago',
      isActive: false
  ),
  Chat(
      name: 'Cyclop M',
      lastMessage: 'Hope you are doing well...',
      image: 'assets/images/cyclop-marvel.png',
      time: '4m ago',
      isActive: true
  ),
  Chat(
      name: 'Groot',
      lastMessage: 'i\'m groot ',
      image: 'assets/images/groot.png',
      time: '3m ago',
      isActive: false
  ),
  Chat(
      name: 'Spiderman',
      lastMessage: 'Do you have update...',
      image: 'assets/images/spiderman-head.png',
      time: '3m ago',
      isActive: true
  ),
  Chat(
      name: 'Thor',
      lastMessage: 'I am Thor, son of Odin, God of thunder,... ',
      image: 'assets/images/thor.png',
      time: '3m ago',
      isActive: true
  ),
  Chat(
      name: 'Logan',
      lastMessage: 'Young boy... ',
      image: 'assets/images/logan-x-men.png',
      time: '10m ago',
      isActive: true
  ),
  Chat(
      name: 'Iron-man',
      lastMessage: 'do you want to work at stark? ',
      image: 'assets/images/iron-man.png',
      time: '3m ago',
      isActive: true
  ),

];