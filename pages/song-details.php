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
    <a href="/">
        <figure>
            <img class="back-button" src="public/images/back_button.png" alt="back button">
        </figure>
    </a>
    <div class = "song-details-container">
        <?php
                $songs_result = exec_sql_query($db,
                    'SELECT songs.song_name AS "songs.song_name", songs.artist AS "songs.artist", songs.lyrics AS "songs.lyrics", songs.album_name AS "songs.album_name", songs.song_year AS "songs.song_year", songs.id AS "songs.id", songs.file_ext AS "songs.file_ext", songs.file_name AS "songs_file_name" FROM songs WHERE (songs.song_name = :song_name);',
                    array(
                        ":song_name" => $_GET['song_name']
                    )
                );
                $song_record = $songs_result->fetchAll()[0];
                $genres = exec_sql_query(
                    $db,
                    'SELECT genres.genre FROM genres INNER JOIN songGenres ON genres.id = songGenres.genre WHERE (songGenres.song_id = :song_id);',
                    array(
                      ":song_id" => $song_record['songs.id']
                    )
                  );
                  $genres_records = $genres->fetchAll();
                  $file_url = "/public/uploads/songs/" . $song_record["songs.id"] . "." . $song_record["songs.file_ext"];
            ?>
        <div class = "left-column">
        <figure><img class="details-album-cover" src="<?php echo htmlspecialchars($file_url); ?>" alt="<?php echo htmlspecialchars($song_record["songs.file_name"]); ?>"></figure>
            <p class = "lyrics"><?php echo htmlspecialchars($song_record["songs.lyrics"]);?> </p>
        </div>


            <div class = "right-column">
                <h1 class = "name"><?php echo htmlspecialchars($song_record["songs.song_name"]); ?></h1>
                <h2 class = "artist"><?php echo htmlspecialchars($song_record["songs.artist"]);?> </h2>
                <p><?php echo htmlspecialchars($song_record["songs.album_name"]);?> - <?php echo htmlspecialchars($song_record["songs.song_year"]);?> </p>
                <?php
                    foreach ($genres_records as $g_record) {
                        ?>
                        <p class="song-genre-home"><?php echo htmlspecialchars($g_record["genre"]); ?></p>
                        <?php
                    }
                ?>
            </div>

    </div>
</body>
