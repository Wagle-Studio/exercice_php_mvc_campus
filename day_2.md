# Activité MVC 2 - Modèles et Répertoires

Dans une architecture MVC, on retrouve un duo composé d'un modèle et d'un répertoire, qui est généralement en correspondance avec les tables de la base de données. Ce duo modèle-répertoire est indissociable, et chacun joue un rôle très différent.

### Les Modèles

Les modèles représentent les objets du domaine de l'application, souvent en correspondance avec les tables de la base de données. Chaque modèle contient des propriétés et des méthodes qui reflètent les caractéristiques et les comportements des objets du domaine. Par exemple, dans une application de commerce, vous pourriez rencontrer des modèle telles que `Product`, `Customer`, et `Order`.

### Les Répertoires

Les répertoires (ou _repositories_) contiennent toute la logique nécessaire pour accéder aux données stockées, que ce soit pour lire, créer, mettre à jour ou supprimer des enregistrements dans la base de données. Ils travaillent directement avec les modèle pour mener à bien ces opérations.

---

### Partie 1 : 🚀 Créer le duo modèle-répertoire des étudiants

🎯 Objectif : Créer le duo modèle-répertoire représentant la table `Student`.

Créez un fichier `exercice/src/Models/Student.php` pour accueillir la classe `Student` avec ses propriétés et méthodes `get` et `set` (se reporter au fichier `schema_bdd_campus.png`). Propriétés : id, name, surname, birthdate, email, departmentId. La classe n'a pas besoin de `constructor()`, explication plus tard.

Créez un fichier `exercice/src/Repositories/StudentRepository.php` pour accueillir la classe `StudentRepository`, celle-ci doit étendre la classe `Database` afin d'hériter de la connexion PDO créée dans cette dernière. Cette classe n'a pas de propriétés et n'exploite pas de `constructor()`. Elle n'a pas de méthodes `get` et `set`.

---

### Partie 2 : 🚀 Implémenter le CRUD des étudiants

🎯 Objectif : Implémenter les méthodes CRUD pour l'exploitation de la table `Student`.

ℹ️ Le rôle du répertoire d'un modèle est de mettre à disposition les méthodes permettant l'exploitation de la table concernée dans la base de données. Pour cela, il est nécessaire d'implémenter des fonctions permettant les actions du CRUD (Créer, Lire, Mettre à jour, Supprimer).

#### Récupérer tous les étudiants - GET ALL

Définissez dans le fichier `exercice/src/Repositories/StudentRepository.php` une méthode `getAll`. Son rôle sera de récupérer l'ensemble des étudiants enregistrés en base de données. Cette méthode exploitera la connexion PDO établie dans la classe parente pour exécuter la requête SQL appropriée.

Pour exécuter la requête SQL, vous devrez utiliser la méthode `query` de votre connexion PDO. Cette méthode prend une requête SQL sous forme de chaîne de caractères en paramètre et retourne un objet de la classe `PDOStatement` que vous devrez stocker dans une variable `query`.

L'objet retourné dans `query` met à disposition une méthode `fetchAll` permettant d'accéder à tous les résultats de la requête. Cette méthode prend deux paramètres : `fetchAll(PDO::FETCH_CLASS, Student::class)`.

- Le paramètre `PDO::FETCH_CLASS` indique que l'on souhaite récupérer les résultats sous forme d'instances de la classe spécifiée,
- Le paramètre `Student::class` indique la classe concernée.

Ce système permet de récupérer les données sous forme d'objets de la classe `Student` sans manipulation supplémentaire.

💡 Testez votre code : dans le fichier `exercice/index.php`, instanciez le répertoire des étudiants puis faites appel à la méthode `getAll` pour afficher les données issues de la base de données à l'écran.

#### Récupérer un étudiant par son identifiant unique - FIND BY ID

Définissez dans le fichier `exercice/src/Repositories/StudentRepository.php` une méthode `findById`. Son rôle sera de récupérer un étudiant enregistré en base de données grâce à son identifiant unique (id). Cette méthode exploitera la connexion PDO établie dans la classe parente pour exécuter la requête SQL appropriée.

Pour exécuter la requête SQL, vous devrez utiliser la méthode `prepare` de votre connexion PDO. Cette méthode prend une requête SQL sous forme de chaîne de caractères en paramètre et retourne un objet de la classe `PDOStatement` que vous devrez stocker dans une variable `req`. Attention, la requête n'est pas exactement la même qu'à l'exercice précédent, voir document ci-dessous.

[🔗 Lien vers la documentation d'une requête préparée PHP PDO](https://www.php.net/manual/fr/pdo.prepared-statements.php)

À cet instant, la requête n'est pas encore exécutée côté base de données, elle est en préparation, il va donc être nécessaire de l'exécuter et de lui fournir les paramètres à utiliser. Pour cela, vous devrez utiliser la méthode `execute` de l'objet `PDOStatement` précédemment stocké dans la variable `req`. Cette méthode prend en argument un tableau (qui peut être associatif ou non, selon la manière dont vous avez préparé votre requête) contenant les données à utiliser.

À la suite de la soumission de la requête, l'objet retourné met à disposition une méthode `fetchAll`, tout comme c'était le cas dans l'exercice précédent.

💡 Testez votre code : dans le fichier `exercice/index.php`, instanciez le répertoire des étudiants puis faites appel à la méthode `findById` en lui fournissant un ID au hasard (vérifiez qu'il existe en base de données) pour afficher les données issues de la base de données à l'écran.

#### Créer un étudiant - CREATE

Définissez dans le fichier `exercice/src/Repositories/StudentRepository.php` une méthode `create`. Son rôle sera de créer un étudiant en base de données. Cette méthode recevra des paramètres contenant les informations nécessaires à la création de l'étudiant et exploitera la connexion PDO établie dans la classe parente pour exécuter la requête SQL appropriée.

Vous aurez donc besoin d'une requête préparée pour exécuter la requête SQL adéquate à la création d'un enregistrement en base de données, cela est très proche du code de la méthode `findById` créée précédemment.

#### Mettre à jour un étudiant - UPDATE

Définissez dans le fichier `exercice/src/Repositories/StudentRepository.php` une méthode `update`. Son rôle sera de mettre à jour l'étudiant en base de données. Cette méthode recevra des paramètres contenant les informations nécessaires à la mise à jour de l'étudiant et exploitera la connexion PDO établie dans la classe parente pour exécuter la requête SQL appropriée.

Vous aurez donc besoin d'une requête préparée pour exécuter la requête SQL adéquate à la mise à jour d'un enregistrement en base de données, cela est très proche des méthodes créées précédemment.

#### Supprimer un étudiant - DELETE

Définissez dans le fichier `exercice/src/Repositories/StudentRepository.php` une méthode `delete`. Son rôle sera de supprimer un étudiant en base de données. Cette méthode recevra un paramètre permettant d'identifier l'étudiant à supprimer et exploitera la connexion PDO établie dans la classe parente pour exécuter la requête SQL appropriée.

Vous aurez donc besoin d'une requête préparée pour exécuter la requête SQL adéquate à la suppression d'un enregistrement en base de données, cela est très proche des méthodes créées précédemment.


