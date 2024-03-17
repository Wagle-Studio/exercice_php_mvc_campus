<?php

// Cet index doit être rendu inaccessible par le biais d'une configuration serveur (dans un fichier .htaccess). 
// Dans le cadre de l'activité, nous nous contenterons de rediriger l'utilisateur vers le dossier `public`.

header('location: public/');
