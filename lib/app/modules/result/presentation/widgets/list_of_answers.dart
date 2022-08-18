import 'dart:math';

List<String> answersGifs = ['dance', 'wapa', 'monica', 'rachel', 'phoebe'];

String getOneGif() {
  Random random = Random();
  var randomGif = random.nextInt(answersGifs.length);
  return answersGifs[randomGif];
}
