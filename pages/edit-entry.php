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
    <h1 class ="edit-title">Edit Song</h1>
    <?php
    $form_values = array(
        "song" => "",
        "album-name" => "",
        "artist-name" => "",
        "song-year" => "",
        "lyrics" => "",
        "genres" => "",
        "source" => "",
        "old-song-name" => "",
        "jpeg-file" => "",
        "jpeg-file-name" => ""
    );


    if(isset($_FILES["jpeg-file"])){
        $upload = $_FILES["jpeg-file"];
        $upload_file_name = basename($upload["name"]);
        $upload_file_ext = strtolower(pathinfo($upload_file_name, PATHINFO_EXTENSION));
    }else{
        $upload_file_name = trim($_POST["jpeg-file-name"] == "" ? NULL : $_POST["jpeg-file-name"]); // untrusted
        $upload_file_ext = "jpeg";
    }

    // $form_values["jpeg-file"] = $upload_file_name;
    $form_values["jpeg-file-name"] = $upload_file_name;
    $form_values["source"] = trim($_POST["source"] == "" ? NULL : $_POST["source"]); // untrusted
    $form_values["song"] = trim($_POST["song"] == "" ? NULL : $_POST["song"]); // untrusted
    $form_values["album-name"] = trim($_POST["album-name"] == "" ? NULL : $_POST["album-name"]); // untrusted
    $form_values["artist-name"] = trim($_POST["artist-name"] == "" ? NULL : $_POST["artist-name"]); // untrusted
    $form_values["song-year"] = trim($_POST["song-year"] == "" ? NULL : $_POST["song-year"]); // untrusted
    $form_values["genres"] = trim($_POST["genres"] == "" ? NULL : $_POST["genres"]); // untrusted
    $form_values["lyrics"] = trim($_POST["lyrics"] == "" ? NULL : $_POST["lyrics"]); // untrusted
    $form_values["old-song-name"] = trim($_POST["old-song-name"] == "" ? NULL : $_POST["old-song-name"]); // untrusted

    $old_song_name = $_POST["old-song-name"];

    if (isset($_POST['edit-entry'])) {
        $form_valid = true;
        $result = exec_sql_query(
            $db,
            "UPDATE songs SET song_name = :song_name, artist = :artist, lyrics = :lyrics, album_name = :album_name, song_year = :song_year, file_name = :file_name, file_ext = :file_ext, source = :source WHERE song_name = :old_song_name;",
            array(

            ":song_name"        => $form_values["song"], // tainted/untrusted
            ":artist"      => $form_values["artist-name"], // tainted/untrusted
            ":lyrics"        => $form_values["lyrics"], // tainted/untrusted
            ":album_name"        => $form_values["album-name"], // tainted/untrusted
            ":song_year"     => $form_values["song-year"], // tainted/untrusted
            ":file_name" => $upload_file_name, // tainted/untrusted
            ":file_ext" => $upload_file_ext, // tainted/untrusted
            ":source" => $form_values["source"], // tainted/untrusted
            ":old_song_name"        => $old_song_name, // tainted/untrusted
            )
        );

    }
    if ($result) {
        $record_id = $db->lastInsertId("id");
        $upload_storage_path = "public/uploads/songs/" . $record_id . "." . $upload_file_ext;
        if (move_uploaded_file($upload["tmp_name"], $upload_storage_path) == false) {
          error_log("Failed to permanently store the uploaded file on the file server. Please check that the server folder exists.");
        }
      }


    define("MAX_FILE_SIZE", 1000000);

    $songs_result = exec_sql_query($db,
        'SELECT songs.source AS "songs.source", songs.song_name AS "songs.song_name", songs.artist AS "songs.artist", songs.lyrics AS "songs.lyrics", songs.album_name AS "songs.album_name", songs.song_year AS "songs.song_year", songs.id AS "songs.id", songs.file_ext AS "songs.file_ext",  songs.file_name AS "songs.file_name" FROM songs WHERE (songs.song_name = :song_name);',
        array(
            ":song_name" => $_GET['song_name']
        )
    );
    $song_record = $songs_result->fetchAll()[0];
    $genres = exec_sql_query($db,
        'SELECT genres.genre FROM genres INNER JOIN songGenres ON genres.id = songGenres.genre WHERE (songGenres.song_id = :song_id);',
        array(
            ":song_id" => $song_record['songs.id']
        )
        );
        $genres_records = $genres->fetchAll();


    $sticky_values = array(
        "song" => $song_record["songs.song_name"],
        "album-name" => $song_record["songs.album_name"],
        "artist-name" => $song_record["songs.artist"],
        "song-year" => $song_record["songs.song_year"],
        "lyrics" => $song_record["songs.lyrics"],
        "genres" => "",
        "source" => $song_record["songs.source"],
        "jpeg-file-name" => $song_record["songs.file_name"],
    );

    $genres_string = "";
    foreach ($genres_records as $g_record) {
        $genres_string .= htmlspecialchars($g_record["genre"]) . ", ";
    }
    $sticky_values["genres"] = rtrim($genres_string, ", ");

    ?>

    <p class = "lyrics-details"><?php echo htmlspecialchars($lyrics_record["songs.lyrics"]);?> </p>

    <form method="post" action="/home-admin" enctype="multipart/form-data" novalidate>
        <!-- placeholder image -->
        <!-- <figure class = "admin-album-cover"><img class="album-cover" src="public/images/placeholder.png" alt="Album Cover"></figure> -->

        <input type="hidden" name="old-song-name" value="<?php echo htmlspecialchars($_GET['song_name']); ?>">


        <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo MAX_FILE_SIZE; ?>">

        <div class="label-input">
        <label for="upload-file_field">Album Cover (JPEG):</label>
        <input id="upload-file_field" type="file" name="jpeg-file" accept=".jpeg,image/jpeg+xml">
        </div>

        <div class="label-input">
        <!-- <label for="upload-file_name_field">File Name:</label> -->
        <input id="upload-file_name_field" type="hidden" name="jpeg-file-name" value="<?php echo $sticky_values["jpeg-file-name"]; ?>">
        </div>

        <div class="label-input">
        <label for="upload-source_field" class="optional">Source URL (Optional):</label>
        <input id="upload-source_field" type="url" name="source" value="<?php echo $sticky_values["source"]; ?>">
        </div>


        <div class="label-input">
        <label for="song_name_field">Song Name:</label>
        <input id="song_name_field" type="text" name="song" value="<?php echo $sticky_values["song"]; ?>">
        </div>

        <div class="label-input">
        <label for="album_name_field">Album Name:</label>
        <input id="album_name_field" type="text" name="album-name" value="<?php echo $sticky_values["album-name"]; ?>">
        </div>

        <div class="label-input">
        <label for="artist_name_field">Artist Name:</label>
        <input id="artist_name_field" type="text" name="artist-name" value="<?php echo $sticky_values["artist-name"]; ?>">
        </div>

        <div class="label-input">
        <label for="song_year_field">Song Year:</label>
        <input id="song_year_field" type="text" name="song-year" value="<?php echo $sticky_values["song-year"]; ?>">
        </div>

        <div class="label-input">
        <label for="lyrics_field"> Lyrics:</label>
        <textarea id="lyrics_field" name="lyrics"><?php echo htmlspecialchars($sticky_values["lyrics"]); ?></textarea>
        </div>

        <div class="align-right">
            <button type="submit" name="edit-entry">
                Submit Edit
            </button>
        </div>
    </form>
</body>
