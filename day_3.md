# Activité MVC 3 - Routeur, Contrôleur et Vue 1/2

Dans une architecture MVC, l'interaction entre le routeur, le contrôleur et la vue constitue un processus essentiel pour la navigation. Ces trois composants travaillent ensemble pour répondre aux requêtes des utilisateurs, traiter les données et présenter les résultats de manière cohérente.

### Le Routeur

Le routeur a pour rôle de diriger les requêtes entrantes vers le bon contrôleur, en fonction de l'URL et de la méthode HTTP utilisée (GET, POST, etc.). Il agit comme un dispatcher, décodant l'URL de la requête pour déterminer quelle action du contrôleur devrait être invoquée.

### Le Contrôleur

Les contrôleurs sont au cœur de l'application, agissant comme intermédiaires entre les modèles, les vues et les services externes. Ils traitent les données entrantes, font appel aux modèles pour accéder aux données nécessaires, appliquent la logique métier, et préparent les données à être affichées. Ensuite, ils passent ces données à la vue appropriée.

### La Vue

Les vues sont responsables de la présentation des données à l'utilisateur. Elles prennent les données préparées par le contrôleur et les affichent. Les vues sont généralement spécifiques à une action du contrôleur, assurant que l'affichage est bien adapté au contexte de la requête. Elles permettent de séparer la logique de présentation de la logique métier, rendant l'application plus facile à maintenir et à évoluer.

---

### Partie 1 : 🚀 Mettre en place le répertoire public

🎯 Objectif : Créer le répertoire public pour protéger nos projets et mettre en place le routeur de l'application.

Dans le dossier `exercice/public`, créez un fichier `exercice/public/index.php` ainsi qu'un fichier `exercice/public/.htaccess`.

Vous pouvez effacer le contenu du fichier `exercice/index.php` à la racine de votre dossier d'exercice pour le remplacer par une redirection vers le dossier `/public`.

💡 Si tout est bon, vous ne devriez plus avoir accès à l'index de la racine du dossier d'exercice, car celui-ci vous redirige vers le fichier `index.php` du dossier `/public`.

Une fois dans le dossier `public`, nous devons nous assurer que l'utilisateur ne puisse pas consulter les autres fichiers de ce dossier. Pour cela, nous allons ajouter une configuration à notre serveur Apache avec le code suivant (ℹ️ le code avec commentaires est disponible dans la correction) :

```txt
<IfModule mod_rewrite.c>

  RewriteEngine On

  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d

  RewriteRule ^ index.php [QSA,L]

</IfModule>
```

Maintenant que le serveur redirigera forcément l'utilisateur vers le fichier `index.php` du dossier `/public`, dans ce fichier `index.php`, faites appel au fichier `init.php` comme c'était précédemment le cas lorsque vous le faisiez depuis le fichier `index.php` à la racine du projet.

---

### Partie 2 : 🚀 Créer un routeur

🎯 Objectif : Créer un routeur pour écouter les requêtes de l'utilisateur et le rediriger vers la page adéquate.

Créez un fichier `exercice/src/router.php` et incluez ce fichier à la fin du fichier `init.php` (lui-même appelé par le fichier `index.php` du dossier `/public`).

💡 Pour être sûr que tout fonctionne, utilisez un `echo()` dans le fichier du routeur et assurez-vous de voir cet echo dans la page du navigateur.

L'objectif du routeur sera le suivant : interpréter la requête envoyée par l'utilisateur. Cette requête est envoyée par l'utilisateur lorsqu'il demande à accéder à une certaine route du site. En interprétant le nom de la route demandée, le routeur sera capable de faire appel au contrôleur adéquat, qui, lui-même, fera appel à la vue pour créer l'interface utilisateur.

Examinez ce que contient la variable superglobale `$_SERVER` et, plus précisément, `$_SERVER['REQUEST_URI']` pour mieux comprendre ce que le routeur va devoir interpréter pour indiquer la marche à suivre.

Dès lors, créez un `switch` et, pour les deux routes suivantes, exécutez un `echo()` différent pour chacune d'elles.

- route n°1 : "/"
- route n°2 : "/students"

Pour finir, si tout fonctionne, vous pouvez créez des constantes dans le fichier `config.php` contenant les noms des différentes route de votre application et ensuite y faire appel, par exemple : `define("URL_HOMEPAGE", "<url_de_ma_page_accueil>");` et les utilisées.

---

### Partie 3 : 🚀 Créer les contrôleurs

🎯 Objectif : Créer les contrôleurs qui seront appelés par le routeur.

Dans le dossier `exercice/src/Controllers`, créez un fichier `HomeController.php` ainsi qu'un fichier `StudentController.php`.

Dans le fichier `HomeController.php`, définissez une méthode `index` qui exécutera `echo('<p>Home controller</p>');`. Faites de même dans le fichier `StudentController.php`, en adaptant le `echo()` pour le distinguer.

Les deux contrôleurs sont prêts à être utilisés dans le routeur. Créez une instance de chacun d'entre eux au début du routeur, puis remplacez le `echo()` précédemment utilisé pour la page d'accueil ("/") par un appel à la méthode `index()` de la classe `HomeController`.

Dorénavant, lorsqu'un utilisateur souhaite consulter la page d'accueil ("/"), le routeur fait appel à la méthode `index()` du `HomeController`, qui se charge d'afficher un message. Ce message sera remplacé par un appel à la vue dans la suite de cette activité.

Apportez les mêmes modifications du router pour la route "/students", qui doit faire appel au contrôleur `StudentController` et sa méthode `index()`.