import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class TouristPlace {
  final String name;
  final String location;
  final String description;
  final int likes;
  final String image;
  final String mapUrl;

  const TouristPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.likes,
    required this.image,
    required this.mapUrl,
  });
}

const List<TouristPlace> places = [
  TouristPlace(
    name: 'Pailón del Diablo',
    location: 'Baños, Tungurahua',
    likes: 95,
    image: 'images/diablo.jpg',
    mapUrl: 'https://maps.app.goo.gl/4kSke8UYTzj2n14k9',
    description:
        'Una de las cascadas más impresionantes del Ecuador. Se encuentra en Baños de Agua Santa y ofrece senderos, puentes colgantes y miradores cercanos a la caída de agua.',
  ),
  TouristPlace(
    name: 'Mitad del Mundo',
    location: 'Quito, Pichincha',
    likes: 88,
    image: 'images/mundo.webp',
    mapUrl: 'https://maps.google.com/?q=Mitad+del+Mundo+Quito',
    description:
        'Monumento turístico ubicado en la línea ecuatorial. Permite conocer experimentos relacionados con la ubicación geográfica y la historia de las misiones geodésicas.',
  ),
  TouristPlace(
    name: 'Malecón 2000',
    location: 'Guayaquil, Guayas',
    likes: 82,
    image: 'images/malecon.jpg',
    mapUrl: 'https://maps.google.com/?q=Malecon+2000+Guayaquil',
    description:
        'Paseo turístico junto al río Guayas que cuenta con jardines, monumentos, museos, restaurantes y espacios recreativos para toda la familia.',
  ),
  TouristPlace(
    name: 'Cueva de los Tayos',
    location: 'Morona Santiago',
    likes: 77,
    image: 'images/tallos.jpg',
    mapUrl: 'https://maps.google.com/?q=Cueva+de+los+Tayos+Ecuador',
    description:
        'Sistema de cuevas ubicado en la Amazonía ecuatoriana. Es reconocido por sus formaciones subterráneas y las numerosas leyendas que rodean este lugar.',
  ),
  TouristPlace(
    name: 'Desierto de Palmira',
    location: 'Chimborazo',
    likes: 69,
    image: 'images/palmira.jpeg',
    mapUrl: 'https://maps.google.com/?q=Desierto+de+Palmira+Ecuador',
    description:
        'Paisaje único formado por extensas dunas de arena rodeadas por montañas andinas. Es considerado uno de los lugares más peculiares del Ecuador.',
  ),
  TouristPlace(
    name: 'Iglesia de San Francisco',
    location: 'Quito, Centro Histórico',
    likes: 74,
    image: 'images/iglesia.webp',
    mapUrl: 'https://maps.google.com/?q=Iglesia+de+San+Francisco+Quito',
    description:
        'Templo colonial construido durante la época española. Destaca por su arquitectura, obras de arte religioso y su importancia histórica para el país.',
  ),
  TouristPlace(
    name: 'Baños de Agua Santa',
    location: 'Tungurahua',
    likes: 91,
    image: 'images/agua.jpg',
    mapUrl: 'https://maps.google.com/?q=Banos+de+Agua+Santa',
    description:
        'Ciudad turística famosa por sus cascadas, aguas termales, deportes extremos y actividades de aventura rodeadas de naturaleza.',
  ),
  TouristPlace(
    name: 'Laguna de Quilotoa',
    location: 'Cotopaxi',
    likes: 93,
    image: 'images/laguna.jpeg',
    mapUrl: 'https://maps.google.com/?q=Laguna+de+Quilotoa',
    description:
        'Laguna de origen volcánico ubicada dentro de un cráter. Sus aguas de color turquesa y los senderos alrededor la convierten en uno de los principales atractivos del Ecuador.',
  ),
  TouristPlace(
    name: 'Isla Isabela',
    location: 'Galápagos',
    likes: 98,
    image: 'images/isla.jpg',
    mapUrl: 'https://maps.google.com/?q=Isla+Isabela+Galapagos',
    description:
        'La isla más grande del archipiélago de Galápagos. Alberga volcanes, playas, tortugas gigantes e importantes ecosistemas protegidos.',
  ),
  TouristPlace(
    name: 'Termas de Papallacta',
    location: 'Napo',
    likes: 85,
    image: 'images/termas.jpg',
    mapUrl: 'https://maps.app.goo.gl/n4arhS5jmCRn9Zdp6',
    description:
        'Complejo turístico de aguas termales ubicado en la cordillera oriental. Es reconocido por sus piscinas naturales y paisajes montañosos.',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Sitios turísticos del Ecuador';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4F1F8),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          title: const Text(
            appTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: places.length,
              itemBuilder: (context, index) {
                return TouristPlaceCard(place: places[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TouristPlaceCard extends StatelessWidget {
  const TouristPlaceCard({super.key, required this.place});

  final TouristPlace place;

  Future<void> openMap() async {
    final Uri uri = Uri.parse(place.mapUrl);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> sharePlace() async {
    await Share.share(
      '${place.name}\n${place.location}\n${place.description}\n\nUbicación: ${place.mapUrl}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 22),
      elevation: 5,
      shadowColor: Colors.black26,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(image: place.image),
            const SizedBox(height: 16),
            TitleSection(
              name: place.name,
              location: place.location,
              likes: place.likes,
            ),
            const SizedBox(height: 8),
            ButtonSection(onLocationTap: openMap, onShareTap: sharePlace),
            const SizedBox(height: 14),
            TextSection(description: place.description),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.asset(
          image,
          width: double.infinity,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: const Text('Imagen no encontrada'),
            );
          },
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.likes,
  });

  final String name;
  final String location;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      location,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        FavoriteWidget(initialLikes: likes),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key, required this.initialLikes});

  final int initialLikes;

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isFavorited = true;
  late int favoriteCount;

  @override
  void initState() {
    super.initState();
    favoriteCount = widget.initialLikes;
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorited) {
        favoriteCount--;
      } else {
        favoriteCount++;
      }
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: 'Favorito',
          onPressed: toggleFavorite,
          icon: Icon(
            isFavorited ? Icons.star : Icons.star_border,
            color: Colors.red,
          ),
        ),
        Text(
          '$favoriteCount',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
    required this.onLocationTap,
    required this.onShareTap,
  });

  final VoidCallback onLocationTap;
  final VoidCallback onShareTap;

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        Expanded(
          child: ButtonWithText(
            color: color,
            icon: Icons.info,
            label: 'INFO',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ButtonWithText(
            color: color,
            icon: Icons.location_on,
            label: 'UBICACIÓN',
            onTap: onLocationTap,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'COMPARTIR',
            onTap: onShareTap,
          ),
        ),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 6),
            FittedBox(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      softWrap: true,
      textAlign: TextAlign.justify,
      style: const TextStyle(fontSize: 14.5, height: 1.45),
    );
  }
}
