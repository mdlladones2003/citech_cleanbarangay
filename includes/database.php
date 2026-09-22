<?php

$host = $_ENV['DB_HOST'] ?? '127.0.0.1';
$db   = $_ENV['DB_DATABASE'] ?? 'citech_cleanbarangay';
$user = $_ENV['DB_USERNAME'] ?? 'root';
$pass = $_ENV['DB_PASSWORD'] ?? '';
$port = $_ENV['DB_PORT'] ?? '3306';

// Enable error reporting for mysqli to catch connection issues
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    // Establish connection using MySQLi
    $conn = new mysqli($host, $user, $pass, $db, $port);
    
    // Set charset to match your database setting
    $conn->set_charset("utf8mb4");

} catch (mysqli_sql_exception $e) {
    // Log the actual error ($e->getMessage()) privately if needed
    die("Database connection failed.");
}