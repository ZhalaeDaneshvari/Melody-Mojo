<?php
$nav_home_class = '';

const GENRES = array(
  1 => "Pop",
  2 => "Rock",
  3 => "R&B",
  4 => "Country",
  5 => "EDM",
  6 => "Indie",
  7 => "Soul",
  8 => "Dance"
);

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


$form_values = array(
  "song" => "",
  "album-name" => "",
  "artist-name" => "",
  "song-year" => "",
  "lyrics" => "",
  "genres" => "",
  "source" => "",
  "jpeg-file" => ""
);

if(isset($_FILES["jpeg-file"]) && !empty($_FILES["jpeg-file"]["tmp_name"])){
  $upload = $_FILES["jpeg-file"];
  $upload_file_name = basename($upload["name"]);
  $upload_file_ext = strtolower(pathinfo($upload_file_name, PATHINFO_EXTENSION));
}else{
  $upload_file_name = trim($_POST["jpeg-file-name"] == "" ? NULL : $_POST["jpeg-file-name"]); // untrusted
  $upload_file_ext = "jpeg";
}

$form_values["jpeg-file-name"] = $upload_file_name;
$form_values["source"] = trim($_POST["source"] == "" ? NULL : $_POST["source"]); // untrusted
$form_values["song"] = trim($_POST["song"] == "" ? NULL : $_POST["song"]); // untrusted
$form_values["album-name"] = trim($_POST["album-name"] == "" ? NULL : $_POST["album-name"]); // untrusted
$form_values["artist-name"] = trim($_POST["artist-name"] == "" ? NULL : $_POST["artist-name"]); // untrusted
$form_values["song-year"] = trim($_POST["song-year"] == "" ? NULL : $_POST["song-year"]); // untrusted
$form_values["genres"] = trim($_POST["genres"] == "" ? NULL : $_POST["genres"]); // untrusted
$form_values["lyrics"] = trim($_POST["lyrics"] == "" ? NULL : $_POST["lyrics"]); // untrusted

$old_song_name = $_POST["old-song-name"];

if (isset($_POST['edit-entry'])) {

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
  $record_id = exec_sql_query(
    $db,
    "SELECT id FROM songs WHERE song_name = :song_name;",
    array(
        ":song_name" => $form_values["song"],
    ))->fetchColumn();
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
  'SELECT genres.id, genres.genre FROM genres INNER JOIN songGenres ON genres.id = songGenres.genre WHERE (songGenres.song_id = :song_id);',
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
  "jpeg-file" => $song_record["songs.file_name"]
);

$genres_string = "";
foreach ($genres_records as $g_record) {
  $genres_string .= htmlspecialchars($g_record["genre"]) . ", ";
}
$sticky_values["genres"] = rtrim($genres_string, ", ");



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
<?php if (is_user_logged_in()) { ?>
  <body>
    <h1 class = "title">Admin Page</h1>
      <?php if (is_user_logged_in()) { ?>
        <p class = "nameWelcome">User: <?php echo htmlspecialchars($current_user['name']); ?></p>
      <?php } ?>
    <header>
          <nav class="navigation" id="nav_menu">
            <div class = "consumer-home">
                <?php if (is_user_logged_in()) { ?>
                  <a href="<?php echo logout_url(); ?>">
                    <figure>
                      <img class="login-logo" src="public/images/login-logo.png" alt="Login Logo">
                      <figcaption>Log Out</figcaption>
                    </figure>
                    </a>
              <?php } ?>
            </div>
              <ul>
                  <li class="add-song"><a href="/add-admin"> Add Song </a></li>
              </ul>
          </nav>

      </header>
    <div class="home_container">
    <aside class = "admin">
        <p class="filter-by"> Filter By:</p>
        <div class="filter-list">
          <a class = "song-genre" href="/home-admin">All</a>
          <?php
          foreach ($sorting_records as $s_record) {
              ?>
              <a class="song-genre" href="/home-admin?<?php echo http_build_query(array("sort" => $s_record["id"])) ?> "><?php echo htmlspecialchars($s_record["genre"]) ?> </a>
              <?php
          }
          ?>
        </div>
      </aside>
      <article>
        <div class = "admin-column-titles">
          <h4 class = "album-cover-title">Album Cover</h4>
          <h4 class = "song-column">Song Name</h4>
          <h4>Album Name</h4>
          <h4>Artist Name</h4>
          <h4>Song Year</h4>
          <h4 class = "genre-col-title">Genres</h4>
          <h4>Lyrics</h4>
          <!-- <h4>Edit</h4> -->

        </div>
        <div class = "admin-tile">
          <!-- INNER JOIN songGenres ON songs.id = songGenres.song_id INNER JOIN genres ON songGenres.genre = genres.id -->
          <?php
          if($sort_param){
          $filtered = exec_sql_query($db, 'SELECT songs.song_name AS "songs.song_name", songs.artist AS "songs.artist", songs.lyrics AS "songs.lyrics", songs.album_name AS "songs.album_name", songs.song_year AS "songs.song_year", songs.id AS "songs.id", songs.file_ext AS "songs.file_ext", songs.file_name AS "songs.file_name" FROM songGenres INNER JOIN songs on songGenres.song_id = songs.id WHERE songGenres.genre = :genre_id;', array(
            ":genre_id" => $sort_param
          ));
          $records = $filtered ->fetchAll();
          }
          else{
            $songs = exec_sql_query($db, 'SELECT songs.song_name AS "songs.song_name", songs.artist AS "songs.artist", songs.lyrics AS "songs.lyrics", songs.album_name AS "songs.album_name", songs.song_year AS "songs.song_year", songs.id AS "songs.id", songs.file_ext AS "songs.file_ext", songs.file_name AS "songs.file_name" FROM songs;');
            $records = $songs->fetchAll();
          }

          foreach ($records as $record) {
            $song = $record["songs.song_name"];
            $artist = $record["songs.artist"];
            $lyrics = $record["songs.lyrics"];
            $album_name = $record["songs.album_name"];
            $song_year = $record["songs.song_year"];
            $genres = exec_sql_query(
              $db,
              'SELECT genres.genre FROM genres INNER JOIN songGenres ON genres.id = songGenres.genre WHERE (songGenres.song_id = :song_id);',
              array(
                ":song_id" => $record['songs.id']
              )
            );
            $genres_records = $genres->fetchAll();
            $file_url = "/public/uploads/songs/" . $record["songs.id"] . "." . $record["songs.file_ext"];

            include 'includes/song-tile-admin.php';
          }

          ?>
        </div>
      </article>
    </div>
    <cite class="citation">Source: https://chat.openai.com/</cite>
  </body>
  <?php } ?>
  <?php if (!is_user_logged_in()) { ?>
    <div class = "centerWords">
      <!-- <h1 class = "success" >Successfully Logged Out!</h1> -->
        <h2>Log In: </h2>
        <section class = "login-form marginNeg"><?php echo login_form('/home-admin', $session_messages); ?> </section>
        <h2>Or</h2>
        <h2 class = "continueHome" ><a href="/">Go to Consumer Home Page</a> <a> </a> </h2>
    </div>

  <?php } ?>
</html>
