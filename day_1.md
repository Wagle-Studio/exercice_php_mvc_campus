# Activité MVC 1 - Mise en place

---

### Partie 1 : 🚀 Créer un fichier de configuration

🎯 Objectif : Créer un fichier pour stocker les informations relatives à la base de données.

Créez un fichier `exercice/src/config.php` dans lequel vous déclarerez quatre constantes PHP :

- DATABASE_HOST : pour l'hôte de la base de données (localhost).
- DATABASE_NAME : pour le nom de votre base de données.
- DATABASE_USERNAME : pour le nom de votre utilisateur MySQL.
- DATABASE_PASSWORD : pour le mot de passe de votre utilisateur.

Ces informations seront exploitées lors de la connexion à la base de données via PDO.

---

### Partie 2 : 🚀 Créer la classe exploitant la BDD.

🎯 Objectif : Créer une classe `Db` pour communiquer avec la base de données.

Créez la classe `exercice/src/Classes/Db.php`, celle-ci a une propriété : `db`. Le `constructor()` de la classe ne reçoit aucun paramètre. N'oubliez pas les méthodes `get` et `set`.

C'est au sein du `constructor()` que nous allons initialiser la connexion avec la base de données grâce à PDO, cette connexion sera stockée dans la propriété `db`. Lorsque nous étendrons cette classe avec une classe enfant, nous pourrons bénéficier de la connexion établie grâce à l'héritage et ainsi profiter de la connexion à la base de données.

Pensez à utiliser le fichier de configuration pour les informations relatives à la base de données.

🔗 Lien de la documentation sur la connexion en PDO (un exemple est fourni) : https://www.php.net/manual/fr/pdo.connections.php

---

### Partie 3 : 🚀 Initialisation du démarrage

🎯 Objectif : Automatiser l'exécution d'une suite de tâches nécessaire à chaque démarrage du projet.

ℹ️ Nous allons exploiter la fonction PHP `spl_autoload_register`, qui nous permet de définir des fonctions d'autochargement. Lorsque nous tentons d'instancier une classe qui n'est pas encore définie, PHP exécutera automatiquement les fonctions d'autoload enregistrées, jusqu'à ce que la classe soit trouvée et chargée.

🔗 [Documentation PHP spl_autoload](https://www.php.net/manual/fr/function.spl-autoload-register.php)

Créez un fichier `exercice/src/init.php` dans lequel vous déclarerez une fonction `classLoader`. Cette fonction reçoit un paramètre `className`.

Dans cette fonction, déclarez 3 variables :

- `filePathClass`, qui recevra le paramètre `className` concaténé avec la chaîne de caractères `.php`.
- `folderPathClasses`, qui recevra une chaîne de caractères représentant le chemin vers le dossier contenant toutes les classes du projet.
- `folderPathModels`, qui recevra une chaîne de caractères représentant le chemin vers le dossier contenant tous les modèles du projet.
- `folderPathRepositories`, qui recevra une chaîne de caractères représentant le chemin vers le dossier contenant tous les répertoires du projet.

Vous aurez besoin de la fonction PHP `file_exists`, qui reçoit en paramètre une chaîne de caractères représentant le chemin vers un fichier. Si le fichier existe, la fonction retourne `true`, sinon `false`.

À l'aide de cette fonction, créez trois conditions :

- La première vérifie l'existence de la classe requise dans le dossier des classes. Si elle existe, elle est alors chargée avec `require`.
- La seconde vérifie l'existence de la classe requise dans le dossier des modèles. Si elle existe, elle est alors chargée avec `require`.
- La troisième vérifie l'existence de la classe requise dans le dossier des répertoires. Si elle existe, elle est alors chargée avec `require`.

La fonction `classLoader` doit être passée en paramètre à la fonction PHP `spl_autoload_register`, de cette manière lorsque nous tenterons d'instancier une classe qui n'est pas encore définie, PHP exécutera la fonction `classLoader`.

💡 Dans ce même fichier, démarrez la session PHP.
💡 Dans ce même fichier, créer une instance de la classe `Database` pour tester l'autochargement et vérifie que la connexion à la base de données fonctionne.
