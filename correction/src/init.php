<?php

/**
 * Fonction d'autoload pour charger automatiquement les fichiers de classe requis.
 * Cette fonction recherche les fichiers de classe dans les dossiers "Classes" et "Models".
 * 
 * @param string $className Le nom de la classe à charger.
 */
function classLoader($className)
{
    // Construit le chemin du fichier à partir du nom de la classe.
    $filePathClass = $className . '.php';

    // Définit les chemins complets des dossiers "Classes", "Models" et "Repositories".
    $folderPathClasses = __DIR__ . '/Classes/';
    $folderPathModels = __DIR__ . '/Models/';
    $folderPathRepositories = __DIR__ . '/Repositories/';
    $folderPathControllers = __DIR__ . '/Controllers/';

    // Vérifie si le fichier de classe existe dans le dossier "Classes" et l'inclut si c'est le cas.
    if (file_exists($folderPathClasses . $filePathClass)) {
        require $folderPathClasses . $filePathClass;
    }

    // Vérifie si le fichier de classe existe dans le dossier "Models" et l'inclut si c'est le cas.
    if (file_exists($folderPathModels . $filePathClass)) {
        require $folderPathModels . $filePathClass;
    }

    // Vérifie si le fichier de classe existe dans le dossier "Repositories" et l'inclut si c'est le cas.
    if (file_exists($folderPathRepositories . $filePathClass)) {
        require $folderPathRepositories . $filePathClass;
    }

    // Vérifie si le fichier de classe existe dans le dossier "Controllers" et l'inclut si c'est le cas.
    if (file_exists($folderPathControllers . $filePathClass)) {
        require $folderPathControllers . $filePathClass;
    }
}

// Enregistre la fonction 'classLoader' comme fonction d'autoload.
// PHP appellera cette fonction chaque fois qu'une classe non chargée est instanciée.
spl_autoload_register('classLoader');

// Démarre une nouvelle session ou reprend une session existante.
session_start();

// Crée une instance de la classe 'Database'.
$database = new Database();

// Appelle la méthode 'getDb' de la classe Database.
$database->getDb();

// Importe le fichier `router.php` ayant la responsabilité du routing de l'application.
require_once __DIR__ . "/router.php";
