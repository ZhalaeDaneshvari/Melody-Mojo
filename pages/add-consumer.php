<?php
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
<a href="/">
        <figure>
            <img class="back-button" src="public/images/back_button.png" alt="back button">
        </figure>
    </a>
<?php if (!$confirmation_message) { ?>
      <section class = "add-song-page">
        <h2 class="subtitle">Want to Add a Song?</h2>
        <h3 class="subtitle">Add It Here: </h3>

        <form method="post" action="/" enctype="multipart/form-data">

          <p class="feedback <?php echo $corrective_feedback_css["song"]; ?>">Please provide the song name.</p>
          <div class="label-input">
            <label class = "type" for="name_field">Song Name:</label>
            <input id="name_field" type="text" name="form_song" value="<?php echo htmlspecialchars($sticky_values["song"]); ?>">
          </div>

          <p class="feedback <?php echo $corrective_feedback_css["artist"]; ?>">Please provide the song's artist.</p>
          <div class="label-input">
            <label class = "type" for="artist_field">Artist:</label>
            <input id="artist_field" type="text" name="form_artist" value="<?php echo htmlspecialchars($sticky_values["artist"]); ?>">
          </div>

          <p class="feedback <?php echo $corrective_feedback_css["album"]; ?>">Please provide the song's album name.</p>
          <div class="label-input">
            <label class = "type" for="album_name_field">Album Name:</label>
            <input id="album_name_field" type="text" name="form_album" value="<?php echo htmlspecialchars($sticky_values["album"]); ?>">
          </div>

          <p class="feedback <?php echo $corrective_feedback_css["year"]; ?>">Please provide the song's release year.</p>
          <div class="label-input">
            <label class = "type" for="year_field">Song Year:</label>
            <input id="year_field" type="text" name="form_year" value="<?php echo htmlspecialchars($sticky_values["year"]); ?>">
          </div>

          <p class="feedback <?php echo $corrective_feedback_css["lyrics"]; ?>">Please provide the song's lyrics.</p>
          <div class="label-input">
            <label class = "type" for="lyrics_field">Lyrics:</label>
            <!-- Change input to textarea -->
            <textarea class = "text-area" id="lyrics_field" name="form_lyrics"><?php echo htmlspecialchars($sticky_values["lyrics"]); ?></textarea>
          </div>

          <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo MAX_FILE_SIZE; ?>">

          <?php if ($upload_feedback["too_big"]) { ?>
            <p class="feedback">Sorry! The file failed to upload because it was too big. Please select a file that&apos;s no larger than 1MB.</p>
          <?php } ?>

          <?php if ($upload_feedback["gen_error"]) { ?>
            <p class="feedback">Sorry! Something went wrong. Please select an JPEG file to upload.</p>
          <?php } ?>

          <p class="feedback <?php echo $corrective_feedback_css["cover"]; ?>">Please provide the song's album cover.</p>
          <div class="label-input">
            <label class = "type" for="upload-file">Album Cover (JPEG):</label>
            <input id="upload-file" type="file" name="jpeg-file" accept=".jpeg,image/jpeg+xml">
          </div>

          <div class="label-input">
            <label class = "type optional" for="upload-source">Source URL (Optional):</label>
            <input id="upload-source" type="url" name="source" placeholder="URL where found">
          </div>

          <div class="align-right">
            <button type="submit" name="song_submit">
              Submit!
            </button>
          </div>
        </form>
      </section>
    <?php } ?>
    <?php if ($confirmation_message) { ?>
      <section class = "confirmation-message">
        <h2><?php echo htmlspecialchars($song); ?> Song Confirmation</h2>
        <p>Thank you for adding <em><?php echo htmlspecialchars($form_values["form_song"]); ?></em> sang by <em><?php echo htmlspecialchars($form_values["form_artist"]); ?></em>.
        <p><a href="/add-consumer">Add Another Song</a></p>
      </section>
    <?php } ?>
</body>
