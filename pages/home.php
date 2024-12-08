<?php

const GENRES = array(
  1 => "Pop",
  2 => "Rock",
  3 => "R&B",
  4 => "Country",
  5 => "EDM",
  6 => "Indie",
  7 => "Soul" ,
  8 => "Dance"
);

$confirmation_message = false;

$corrective_feedback_css = array(
  "song" => "hidden",
  "artist" => "hidden",
  "lyrics" => "hidden",
  "album" => "hidden",
  "year" => "hidden",
  "cover" => "hidden"
);


$form_values = array(
  "form_song" => "",
  "form_artist" => "",
  "form_lyrics" => "",
  "form_album" => "",
  "form_year" => ""
);

$sticky_values = array(
  "song" => "",
  "artist" => "",
  "lyrics" => "",
  "album" => "",
  "year" => ""
);

define("MAX_FILE_SIZE", 1000000);

$upload_feedback = array(
  "gen_error" => false,
  "too_big" => false
);

$upload_source = NULL;
$upload_file_name = NULL;
$upload_file_ext = NULL;

//sorting
$sort_param = $_GET["sort"]; // untrusted

$sort_css_classes = array(
  "Pop" => "",
  "Rock" => "",
  "R&B" => "",
  "Country" => "",
  "EDM" => "",
  "Indie" => "",
  "Rap" => "",
  "Soul" => "",
  "Dance" => ""
);

$sorting = exec_sql_query(
  $db,
  'SELECT genres.id, genres.genre FROM genres');
  $sorting_records = $sorting->fetchAll();

if (in_array($sort_param, array("Pop", "Rock", "R&B", "Country","EDM", "Indie","Soul","Dance"))) {
  $sort_css_classes[$sort_param] = "active";

  $sql_sort_value = $sort_param;
}

if (isset($_POST["song_submit"])) {
  $upload_source = trim($_POST["song_submit"]); // untrusted
  if ($upload_source == "") {
    $upload_source = NULL;
  }
  $upload = $_FILES["jpeg-file"];
  $form_valid = true;
  if ($upload["error"] == UPLOAD_ERR_OK) {
    $upload_file_name = basename($upload["name"]);
    $upload_file_ext = strtolower(pathinfo($upload_file_name, PATHINFO_EXTENSION));
    if (!in_array($upload_file_ext, array("jpeg"))) {
      $form_valid = false;
      $upload_feedback["gen_error"] = true;
    }
  } else if (($upload["error"] == UPLOAD_ERR_INI_SIZE) || ($upload["error"] == UPLOAD_ERR_FORM_SIZE)) {
    $form_valid = false;
    $upload_feedback["too_big"] = true;
  } else {
    $form_valid = false;
    $upload_feedback["gen_error"] = true;
  }

  $form_values["form_song"] = trim($_POST["form_song"] == "" ? NULL : $_POST["form_song"]); // untrusted
  $form_values["form_artist"] = trim($_POST["form_artist"] == "" ? NULL : $_POST["form_artist"]); // untrusted
  $form_values["form_lyrics"] = trim($_POST["form_lyrics"] == "" ? NULL : $_POST["form_lyrics"]); // untrusted
  $form_values["form_album"] = trim($_POST["form_album"] == "" ? NULL : $_POST["form_album"]); // untrusted
  $form_values["form_year"] = trim($_POST["form_year"] == "" ? NULL : $_POST["form_year"]); // untrusted

  if ($form_values["form_song"] == "") {
    $form_valid = false;
    $corrective_feedback_css["song"] = "";
  }
  if ($form_values["form_artist"] == "") {
    $form_valid = false;
    $corrective_feedback_css["artist"] = "";
  }
  if ($form_values["form_lyrics"] == "") {
    $form_valid = false;
    $corrective_feedback_css["lyrics"] = "";
  }
  if ($form_values["form_album"] == "") {
    $form_valid = false;
    $corrective_feedback_css["album"] = "";
  }
  if ($form_values["form_year"] == "") {
    $form_valid = false;
    $corrective_feedback_css["year"] = "";
  }


  if ($form_valid) {
    $result = exec_sql_query(
      $db,
      "INSERT INTO songs (song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source) VALUES (:song_name, :artist, :lyrics, :album_name, :song_year, :file_name, :file_ext, :source);",
      array(

        ":song_name"        => $form_values["form_song"], // tainted/untrusted
        ":artist"      => $form_values["form_artist"], // tainted/untrusted
        ":lyrics"        => $form_values["form_lyrics"], // tainted/untrusted
        ":album_name"        => $form_values["form_album"], // tainted/untrusted
        ":song_year"     => $form_values["form_year"], // tainted/untrusted
        ":file_name" => $upload_file_name, // tainted/untrusted
        ":file_ext" => $upload_file_ext, // tainted/untrusted
        ":source" => $upload_source // tainted/untrusted
      )
    );
    $confirmation_message = true;
  } else {
    $sticky_values["song"] = $form_values["form_song"];

    $sticky_values["artist"] = $form_values["form_artist"];

    $sticky_values["lyrics"] = $form_values["form_lyrics"];

    $sticky_values["album"] = $form_values["form_album"];

    $sticky_values["year"] = $form_values["form_year"];
  }
  if ($result) {
    $record_id = $db->lastInsertId("id");
    $upload_storage_path = "public/uploads/songs/" . $record_id . "." . $upload_file_ext;
    if (move_uploaded_file($upload["tmp_name"], $upload_storage_path) == false) {
      error_log("Failed to permanently store the uploaded file on the file server. Please check that the server folder exists.");
    }
  }
}
?>


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
  <header>
    <h1 class="home-title">Melody Mojo</h1>
    <nav class="navigation" id="nav_menu">
    </nav>
    <a class = "add-song-home" href="/add-consumer"> Add Song </a>

  </header>


  <div class="home_container">
    <aside class = "home-aside">
      <p class="filter-by"> Filter By:</p>
      <div class="filter-list">
        <a class = "song-genre" href="/">All</a>
        <?php
        foreach ($sorting_records as $s_record) {
            ?>
            <a class="song-genre" href="/?<?php echo http_build_query(array("sort" => $s_record["id"])) ?> "><?php echo htmlspecialchars($s_record["genre"]) ?> </a>
            <?php
        }
        ?>
</div>
    </aside>
    <article>

      <div class="tile">
        <?php
        if($sort_param){
          $filtered = exec_sql_query(
            $db, 'SELECT songs.song_name AS "songs.song_name", songs.artist AS "songs.artist", songs.id AS "songs.id", songs.file_ext AS "songs.file_ext",  songs.file_name AS "songs.file_name" FROM songGenres INNER JOIN songs on songGenres.song_id = songs.id WHERE songGenres.genre = :genre_id;', array(
              ":genre_id" => $sort_param
            ));
            $records = $filtered->fetchAll();
        }
        else{
          $songs = exec_sql_query($db, 'SELECT songs.song_name AS "songs.song_name", songs.artist AS "songs.artist", songs.id AS "songs.id", songs.file_ext AS "songs.file_ext",  songs.file_name AS "songs.file_name" FROM songs;');
          $records = $songs->fetchAll();
        }

        foreach ($records as $record) {
          $song = $record["songs.song_name"];
          $artist = $record["songs.artist"];
          $genres = exec_sql_query(
            $db,
            'SELECT genres.id, genres.genre FROM genres INNER JOIN songGenres ON genres.id = songGenres.genre WHERE (songGenres.song_id = :song_id);',
            array(
              ":song_id" => $record['songs.id']
            )
          );
          $genres_records = $genres->fetchAll();
          $file_url = "/public/uploads/songs/" . $record["songs.id"] . "." . $record["songs.file_ext"];
          include 'includes/song-tile-consumer.php';
        }

        ?>
      </div>
    </article>
  </div>
  <cite class="citation">Source: https://chat.openai.com/</cite>
</body>
</html>
