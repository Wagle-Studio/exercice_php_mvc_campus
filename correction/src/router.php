<?php

// Charge les fichiers des classes des contrôleurs.
require __DIR__ . "/Controllers/HomeController.php";
require __DIR__ . "/Controllers/StudentController.php";

// Crée des instances des contrôleurs.
$homeController = new HomeController();
$studentController = new StudentController();

// Récupère l'URI de la requête actuelle pour déterminer la route demandée par l'utilisateur.
$route = $_SERVER['REQUEST_URI'];

// Utilise un switch pour diriger la requête vers le bon contrôleur en fonction de l'URI.
switch ($route) {
    case URL_HOMEPAGE: // Si l'URI correspond à la page d'accueil.
        $homeController->index();
        break;
    case URL_STUDENTS: // Si l'URI correspond à la page des étudiants.
        $studentController->index();
        break;
    default: // Si aucune route correspondante n'est trouvée.
        $homeController->pageNotFound();
}
