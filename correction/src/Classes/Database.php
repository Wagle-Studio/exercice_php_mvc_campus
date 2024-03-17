<?php

// Inclut une seule fois le fichier de configuration pour accéder aux constantes de connexion à la base de données.
require_once __DIR__ . "/../config.php";

/**
 * Classe Database pour gérer la connexion à la base de données.
 */
class Database
{
    // Propriété privée pour stocker l'instance de la connexion PDO.
    private $db;

    /**
     * Constructeur de la classe Database.
     * Établit la connexion à la base de données lors de la création d'une instance de Database.
     */
    public function __construct()
    {
        // L'utilisation d'un bloc try-catch permet de capturer et gérer les exceptions pouvant survenir pendant l'exécution du code.
        try {
            // Initialise une connexion avec la base de données en utilisant l'extension PDO (PHP Data Objects).
            // Les informations de connexion sont récupérées à partir des variables définies dans `config.php`.
            $this->db = new PDO(
                'mysql:host=' . DATABASE_HOST . ';dbname=' . DATABASE_NAME . ';charset=utf8',
                DATABASE_USERNAME,
                DATABASE_PASSWORD
            );
        } catch (Exception $error) {
            // En cas d'erreur de connexion, le script est arrêté et un message d'erreur est affiché.
            die('Erreur : ' . $error->getMessage());
        }
    }

    /**
     * Méthode pour récupérer l'instance de la connexion à la base de données.
     * 
     * @return PDO L'instance de PDO représentant la connexion à la base de données.
     */
    public function getDb()
    {
        return $this->db;
    }
}
