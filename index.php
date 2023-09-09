<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Task</title>
</head>

<body>
    <?php
    echo "<h2>DevOps Task</h2>";
    echo "<h3>Host: " . gethostname() . "</h3>";

    // Database credentials from environment variables
    $servername = getenv('MYSQL_HOST');
    $username = getenv('MYSQL_USER');
    $password = getenv('MYSQL_PASSWORD');

    // Create connection
    $conn = new mysqli($servername, $username, $password);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // SQL query 
    $sql = "SHOW PROCESSLIST";
    $result = $conn->query($sql);
    
    // Print the result
    echo "<pre>";
    print_r($result);
    echo "</pre>";

    // Close the connection when done
    $conn->close(); 
    ?>
</body>

</html>
