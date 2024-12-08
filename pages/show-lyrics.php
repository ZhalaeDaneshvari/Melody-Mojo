<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Home page of Melody Mojo">
  <link rel="stylesheet" type="text/css" href="styles/site.css">
  <title>Melody Mojo</title>
</head>

<body>
    <a href="/home-admin">
        <figure>
            <img class="back-button" src="public/images/back_button.png" alt="back button">
        </figure>
    </a>
<?php
    $lyrics_result = exec_sql_query(
        $db,
        "SELECT songs.lyrics AS 'songs.lyrics' FROM songs WHERE (songs.song_name = :song_name);",
        array(
            ":song_name" => $_GET['song_name']
        )
    );
    $lyrics_record = $lyrics_result->fetchAll()[0];
?>

<p class = "lyrics-details"><?php echo htmlspecialchars($lyrics_record["songs.lyrics"]);?> </p>
</body>
