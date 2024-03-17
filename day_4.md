# Activité MVC 3 - Routeur, Contrôleur et Vue 2/2

Dans une architecture MVC, l'interaction entre le routeur, le contrôleur et la vue constitue un processus essentiel pour la navigation. Ces trois composants travaillent ensemble pour répondre aux requêtes des utilisateurs, traiter les données et présenter les résultats de manière cohérente.

---

### Partie 1 : 🚀 Créer une méthode pour rendre les vues depuis le contrôleur

🎯 Objectif : Créer une méthode permettant de faire appel à nos "vues" dans l'architecture MVC. Ce sont elles qui seront en charge de l'affichage de l'interface graphique des différentes pages.

Dans le dossier `exercice/src`, créez un dossier `Views` ainsi qu'un fichier `HomepageTemplate.php` dans `exercice/src/Views`. C'est ce fichier que vous exploiterez pour afficher la page d'accueil. Pour cela, il sera nécessaire de l'appeler depuis le contrôleur adéquat, ici, nous l'utiliserons dans la méthode `index()` du `HomeController`.

Afin de pouvoir appeler n'importe quelle vue et lui passer des données à exploiter, vous allez créer un `trait`. En PHP, un trait est utilisé pour grouper des fonctionnalités communes à différentes classes. Ce trait sera implémenté dans les répertoires, ces dernier pourrons alors exploiter les méthodes définies dans le trait. Cela ressemble au système d'héritage et permet de mutualiser notre code.

[🔗 Documentation officielle des Traits PHP](https://www.php.net/manual/fr/language.oop5.traits.php)

Le trait que vous allez créer contiendra une méthode `render` qui reçevra deux paramètres :

- `view` : une chaîne de caractères représentant le nom du fichier à appeler pour la vue.
- `data` : un tableau associatif contenant des clés et leurs valeurs, destinées à être exploitées dans la vue.

Dans un premier temps, le paramètre `data` sera parcouru par une boucle, créant dynamiquement des variables dont le nom correspond à la clé et stockant la valeur.

Dans un second temps, le paramètre `view` permettra de construire le chemin vers le fichier de vue souhaité, et utilisera `require_once` pour faire appel à ce dernier.

💡 Exemple : Le contrôleur des étudiants, `StudentController`, possède une méthode `studentList` appelée dans le routeur lorsque l'utilisateur consulte l'URL `/public/students`. Cette méthode doit faire appel à une vue pour construire l'interface graphique, elle utilise donc la méthode `render` dont "hérite" la classe `StudentController`, en lui passant deux paramètres : `StudentListTemplate` pour le nom du fichier de la vue et `viewData`, un tableau associatif contenant, entre autres, la liste de tous les étudiants du campus.

Cela aura pour conséquence d'appeler le fichier `/src/Views/StudentListTemplate.php` et de créer autant de variables qu'il n'y a d'élément dans le tableau `data`. Les variables créées seront directement accessibles depuis la vue, si votre tableau contient par exemple ['name' => 'Kévin'], vous aurez une variable `$name` disponible dans la vue `/src/Views/StudentListTemplate.php`, elle contiendra la valeur "Kévin".

---

### Partie 2 : 🚀 Créer les vues

Récapitulons !

1. Vous devriez avoir un `router` qui vérifie si l'URL correspond à celle de la page d'accueil, à la page des étudiants, ou alors à la page 404 si l'URL saisie n'est pas traitée.
2. Si l'URL saisie est reconnue, le `router` fait appel à un contrôleur, celui-ci est en charge de la logique et de l'appel à la vue.
3. Le contrôleur a bien accès à la méthode `render` de votre trait, qui permet de faire appel à une vue.

Il vous reste à créer différentes vues. On peut imaginer les vues suivantes :

- Une vue pour la page d'accueil (`HomeTemplate.php`).
- Une vue pour la page de liste des étudiants (`StudentListTemplate.php`).
- Une vue pour les pages introuvables (404) (`404.php`).

Chaque route fera donc appel à son contrôleur qui, lui-même, fera appel à la vue :

- L'URL `/` correspondant à la page d'accueil exploite le `HomeController` et sa méthode `index()`, qui appelle la vue (`HomeTemplate.php`).
- L'URL `/students` correspondant à la page des étudiants exploite le `StudentController` et sa méthode `index()`, qui appelle la vue (`StudentListTemplate.php`).
- Les autres URL ne correspondant à aucune de nos pages exploitent le `HomeController` et sa méthode `pageNotFound()`, qui appelle la vue (`404.php`).

Chacune des méthodes de contrôleur évoquées fait appel à la méthode `render` pour appeler la vue.

---

### Partie 3 : 🚀 Passer des données à la vue

Dans le contrôleur des étudiants `StudentController`, plus précisement dans la méthode qui gère la page de liste des étudiants, faite appel au répertoire des étudiants `StudentRepository` pour en récupérer la liste complète et passer cette dernière à la vue. La vue se chargera alors de parcourir le tableau d'étudiant pour en créer une liste.

🎉 Félicitation, vous venez de respecter les principes de l'architecture MVC, il reste des choses à améliorer dans notre projet mais cette base est solide ! Le projet est découpé en plusieurs couche et chacune d'entre elle a sa responsabilité propre.

---

### Partie bonus : 🚀 Créer une vue de détail d'un étudiant

Nous sommes ravis de notre page de liste des étudiants mais nous souhaiterions aussi avoir une page qui permet de voir les informations personnelles d'un étudiant en particulier.

Pour commencer, créez une nouvelle méthode dans le contrôleur des étudiants `StudentController` appelée `studentDetail()`. Créez également la vue spécifique et appelez votre nouvelle méthode dans le routeur lorsque l'URL contient `/students/1`, où le `1` correspond à un ID d'étudiant (le routage peut être différent selon les configurations, adaptez donc l'URL en conséquence).

Votre nouvelle méthode `studentDetail()` devra interpréter l'URL pour en extraire l'ID de l'étudiant, ici le `1`. Ensuite, à l'aide de cet ID, vous pourrez exploiter la méthode `findById()` de votre répertoire d'étudiants `StudentRepository` pour chercher les données de l'étudiant concerné en base de données.

Après avoir récupéré les données de l'étudiant, passez-les à la vue et affichez-les de manière simple.

C'est tout bon ? Maintenant, assurez-vous que cela fonctionne quel que soit l'ID de l'étudiant dans l'URL. Si c'est le cas, alors à nouveau, félicitations 🔥.
