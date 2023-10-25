import 'dart:convert';

List<Planets> planetsFromJson(String str) =>
    List<Planets>.from(json.decode(str).map((x) => Planets.fromJson(x)));

String planetsToJson(List<Planets> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Planets {
  int id;
  String name;
  String imgs;
  String type;
  double distance;
  double aphelion;
  double mass;
  String discovered;

  Planets({
    required this.id,
    required this.name,
    required this.imgs,
    required this.type,
    required this.distance,
    required this.aphelion,
    required this.mass,
    required this.discovered,
  });

  factory Planets.fromJson(Map<String, dynamic> json) => Planets(
        id: json["id"],
        name: json["name"],
        imgs: json["imgs"],
        type: json["type"],
        distance: json["distance"]?.toDouble(),
        aphelion: json["aphelion"]?.toDouble(),
        mass: json["mass"]?.toDouble(),
        discovered: json["discovered"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgs": imgs,
        "type": type,
        "distance": distance,
        "aphelion": aphelion,
        "mass": mass,
        "discovered": discovered,
      };
}

// var milkyWayPlanetsList = [
//   Planets(
//     id: 1,
//     name: 'Mercury',
//     imgs:
//         'https://solarstory.net/img/articles/big/composite-image-of-mercury-by-messenger.jpg',
//     type: 'Terrestrial Planets',
//     distance: 36,
//     aphelion: 0.47,
//     mass: 0.33010,
//     discovered: 'Galileo Galilei',
//   ),
//   Planets(
//     id: 2,
//     name: 'Venus',
//     imgs:
//         'https://planetary.s3.amazonaws.com/web/assets/pictures/20180113_uvi_20160517_201715_365_l2b_v10_PseudoRGB.jpg',
//     type: 'Terrestrial Planets',
//     distance: 67.1,
//     aphelion: 0.73,
//     mass: 4.8673,
//     discovered: 'Galileo Galilei',
//   ),
//   Planets(
//     id: 3,
//     name: 'Earth',
//     imgs: 'http://www.solstation.com/stars/earth3sa.jpg',
//     type: 'Terrestrial Planets',
//     distance: 92.9,
//     aphelion: 1.0167,
//     mass: 5.9722,
//     discovered: 'entity by humans',
//   ),
//   Planets(
//     id: 4,
//     name: 'Mars',
//     imgs:
//         'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.independent.co.uk%2F2020%2F10%2F05%2F15%2Fmars%2520full%2520bright.jpg&f=1&nofb=1&ipt=5077e3568ad11f7a3f8cb9b5612cdae502ca83f10fe0ce1af4ea63faad6c0cad&ipo=images',
//     type: 'Terrestrial Planets',
//     distance: 141.5,
//     aphelion: 1.67,
//     mass: 0.64169,
//     discovered: 'Galileo Galilei',
//   ),
//   Planets(
//     id: 5,
//     name: 'Jupiter',
//     imgs:
//         'https://eblanchardblog.files.wordpress.com/2015/10/jupiter-image.jpg?w=1024&h=1024',
//     type: 'The Jovian Planets',
//     distance: 483.4,
//     aphelion: 5.46,
//     mass: 1.89813,
//     discovered: 'Galileo Galilei',
//   ),
//   Planets(
//     id: 6,
//     name: 'Saturn',
//     imgs:
//         'https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg',
//     type: 'The Jovian Planets',
//     distance: 886.7,
//     aphelion: 10.05,
//     mass: 568.32,
//     discovered: 'Galileo Galilei',
//   ),
//   Planets(
//     id: 7,
//     name: 'Uranus',
//     imgs:
//         'https://solarstory.net/img/articles/big/planet-uranus-by-voyager-2-in-1986.jpg',
//     type: 'The Jovian Planets',
//     distance: 1.7827,
//     aphelion: 20.11,
//     mass: 86.811,
//     discovered: 'William Herschel',
//   ),
//   Planets(
//     id: 8,
//     name: 'Neptune',
//     imgs:
//         'https://solarstory.net/img/articles/big/neptune-by-voyager-2-narrow-angle-camera.jpg',
//     type: 'The Jovian Planets',
//     distance: 2.7943,
//     aphelion: 30.34,
//     mass: 102,
//     discovered: 'J. Gottfried Galle',
//   ),
// ];
