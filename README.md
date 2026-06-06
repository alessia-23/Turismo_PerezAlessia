# 🇪🇨 Flutter - Turismo Ecuador

Aplicación desarrollada en Flutter como parte de la práctica **"Flutter Layout e Interactividad"**.

La aplicación permite visualizar información sobre distintos sitios turísticos del Ecuador, incluyendo imágenes, descripciones, ubicaciones y acceso directo a Google Maps mediante el botón **UBICACIÓN**.

---

## 👩‍💻 Autor

**Alessia Pérez**

---

## 🎯 Objetivo

- Utilizar la guía oficial de Flutter Layout.
- Implementar interfaces gráficas utilizando widgets de Flutter.
- Agregar interactividad en los íconos de favoritos.
- Mostrar información de 10 sitios turísticos del Ecuador.
- Implementar enlaces de Google Maps para cada destino turístico.
- Comprender el uso de StatefulWidget y StatelessWidget.

---

## 🛠 Tecnologías utilizadas

| Tecnología | Versión |
|------------|----------|
| Flutter | 3.44.1 |
| Dart | 3.12.1 |
| Visual Studio Code | Última versión |
| Google Chrome | Entorno de ejecución |
| Google Maps | Servicio de ubicación |
| url_launcher | Apertura de enlaces externos |

---

## 🚀 Funcionalidades

- Mostrar información de 10 sitios turísticos del Ecuador.
- Visualizar imágenes representativas de cada destino.
- Mostrar nombre, ubicación y descripción de cada lugar.
- Agregar interactividad en los íconos de favoritos.
- Redireccionar a Google Maps mediante el botón **UBICACIÓN**.
- Interfaz desarrollada utilizando widgets nativos de Flutter.

---

## 📍 Sitios turísticos incluidos

| Sitio Turístico | Provincia |
|-----------------|------------|
| Pailón del Diablo | Tungurahua |
| Mitad del Mundo | Pichincha |
| Malecón 2000 | Guayas |
| Cueva de los Tayos | Morona Santiago |
| Desierto de Palmira | Chimborazo |
| Iglesia de San Francisco | Pichincha |
| Baños de Agua Santa | Tungurahua |
| Laguna de Quilotoa | Cotopaxi |
| Isla Isabela | Galápagos |
| Termas de Papallacta | Napo |

---

## 📸 Evidencias

| Pantalla principal |
|--------------------|
|<img width="440" height="688" alt="image" src="https://github.com/user-attachments/assets/4b757635-88f3-43f5-b942-e4dca2f7b2f1" />|

<br>

| Sistema de favoritos |
|----------------------|
|<img width="440" height="669" alt="image" src="https://github.com/user-attachments/assets/5c787cb3-e8a3-4843-b03c-ef545c43981d" />|

<br>

| Botón UBICACIÓN |
|-----------------|
|<img width="440" height="690" alt="image" src="https://github.com/user-attachments/assets/d6c6b338-6d91-4b66-b313-a183cd9a0040" />|

<br>

| Google Maps |
|-------------|
|<img width="1364" height="713" alt="image" src="https://github.com/user-attachments/assets/7a806771-a09c-41a0-800c-b7519c032f5c" />|

---

## 🧠 Investigación

### StatefulWidget

Un StatefulWidget es un widget cuyo estado puede cambiar durante la ejecución de la aplicación.

Se utiliza cuando un componente necesita actualizarse después de una interacción del usuario.

En esta aplicación se utiliza para implementar el sistema de favoritos, permitiendo cambiar el estado del ícono y actualizar el contador de favoritos dinámicamente.

### StatelessWidget

Un StatelessWidget es un widget cuyo estado no cambia una vez construido.

Se utiliza para mostrar información estática dentro de la interfaz.

En esta aplicación se utiliza para componentes como:

- Sección de imágenes.
- Sección de títulos.
- Sección de texto.
- Tarjetas de sitios turísticos.

---

## 🧠 Lógica utilizada

La aplicación utiliza un StatefulWidget para controlar el estado del sistema de favoritos.

```dart
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({
    super.key,
    required this.initialLikes,
  });

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
}
```

---

## 📍 Integración con Google Maps

Cada sitio turístico posee un botón denominado **UBICACIÓN**.

Al presionar dicho botón, la aplicación abre Google Maps y redirecciona automáticamente al destino turístico seleccionado.

Implementación utilizada:

```dart
Future<void> openMap() async {
  final Uri uri = Uri.parse(place.mapUrl);

  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );
}
```

---

## 📂 Estructura del proyecto

```text
lib/
 └── main.dart

images/
 ├── agua.jpg
 ├── diablo.jpg
 ├── iglesia.webp
 ├── isla.jpg
 ├── laguna.jpeg
 ├── malecon.jpg
 ├── mundo.webp
 ├── palmira.jpeg
 ├── tallos.jpg
 └── termas.jpg
```

---

## ▶️ Ejecución

Clonar el repositorio:

```bash
git clone https://github.com/alessia-23/Turismo_PerezAlessia.git
```

Ingresar al proyecto:

```bash
cd Turismo_PerezAlessia
```

Instalar dependencias:

```bash
flutter pub get
```

Ejecutar:

```bash
flutter run
```

---

## 📌 Resultado

La aplicación permite visualizar información de distintos sitios turísticos del Ecuador mediante una interfaz desarrollada en Flutter, incorporando imágenes, descripciones, favoritos interactivos y acceso directo a Google Maps para consultar la ubicación de cada destino turístico.
