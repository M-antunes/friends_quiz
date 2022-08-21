import 'dart:math';

// List<String> excellentGifs = ['joey', 'chandler', 'monica', 'rachel', 'phoebe'];

// String getExcellentGif() {
//   Random random = Random();
//   var randomGif = random.nextInt(excellentGifs.length);
//   return excellentGifs[randomGif];
// }

List<String> gifs = ['joey', 'chandler', 'monica', 'rachel', 'phoebe', 'ross'];

String getGif() {
  Random random = Random();
  var randomGif = random.nextInt(gifs.length);
  return gifs[randomGif];
}

// List<String> averageGifs = ['joey', 'chandler', 'monica', 'rachel', 'phoebe'];

// String getAverageGif() {
//   Random random = Random();
//   var randomGif = random.nextInt(averageGifs.length);
//   return averageGifs[randomGif];
// }

// List<String> badGifs = ['joey', 'chandler', 'monica', 'rachel', 'phoebe'];

// String getBadGif() {
//   Random random = Random();
//   var randomGif = random.nextInt(badGifs.length);
//   return badGifs[randomGif];
// }
