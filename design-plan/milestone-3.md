# Project 3, Milestone 3: **Team** Design Journey

[← Table of Contents](design-journey.md)

**Make the case for your decisions using concepts from class, as well as other design principles, theories, examples, and cases from outside of class (includes the design prerequisite for this course).**

You can use bullet points and lists, or full paragraphs, or a combo, whichever is appropriate. The writing should be solid draft quality.


## Milestone 2 Team Feedback Revisions
> Explain what your **team** collectively revised in response to the Milestone 2 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

Changed the consumer view all page so each tile is clickable rather than a button on each tile that takes you to the show more details page.



## File Upload - Types of Files
> What types of files will you allow users to upload?
> Can users upload any type of file? Can user only upload one type of file?
> Or can users upload several different types of files?
> List the file extensions of the types of files your users may upload.

- .jpeg
- ...


## File Upload - Updated DB Schema
> Plan any updates you need to make to your database schema to support file uploads.
>
> 1. Copy your Project 3 DB Schema for the _entries_ table here.
> 2. Modify the schema to include any file upload information you desire to store in your database.
>    If you don't need to modify anything, explain why.

songs

```
CREATE TABLE songs (
    id INTEGER NOT NULL UNIQUE,
    song_name TEXT NOT NULL,
    artist TEXT NOT NULL,
    lyrics TEXT NOT NULL,
    album_name TEXT NOT NULL,
    song_year INTEGER NOT NULL,
    file_name TEXT NOT NULL,
    file_ext TEXT NOT NULL,
    source TEXT,
    PRIMARY KEY (id AUTOINCREMENT)
);
```


## File Upload - File Storage
> Plan the file path to store the uploaded files on the server's file system.
> Store the uploaded files in a subfolder of the `public/uploads` folder using the entries table name as the subfolder name.

$upload_storage_path = "public/uploads/songs/" . $record_id . "." . $upload_file_ext;



## File Upload - Path and URL
> Assume that a user completed the insert/edit entry form.
> The **id** for the new record is **154**.
>
> 1. Plan the file system path to store the uploaded file.
> 2. Plan the URL to load the uploaded file in your website's HTML.

**File System Storage Path:**

```
$file_url = "/public/uploads/songs/" . $record["songs.id"] . "." . $record["songs.file_ext"];
```

**Resource URL:**

```
<picture>
  <img class="album-cover" src="<?php echo htmlspecialchars($file_url); ?>" alt="<?php echo htmlspecialchars($record["songs.file_name"]); ?>">
</picture>
```


## File Upload - Form Input
> Write the HTML of an `<input>` element that allows users to upload a file.

```html
<input id="upload-file" type="file" name="jpeg-file" accept=".jpeg,image/jpeg+xml">
```


## File Upload - PHP File Upload Data
> Use the `name` attribute of the file input you planned above to plan how you will
> access the uploaded file data in PHP using the `$_FILES` superglobal.

> Write the PHP code to access the uploaded file data from the `$_FILES` superglobal.
> Only include the data you will extract from the `$_FILES` superglobal. For example, the file name.
> Hint: <https://www.php.net/manual/en/features.file-upload.post-method.php>

```
$_FILES[jpeg-file][file_url]
```


## Filtering by a Tag - Query String Parameters
> Plan the query string for filtering by a tag for the "view all" pages.
> (This plan should be exactly the same for both the consumer and admin views.)
> Include the query string parameter and its value.
> Document the value with the field from your database in all CAPITOL letters.

Example: `?category=ID` where `ID` is the `id` field from the `categories` table.

'?genre = ID' where 'ID' is the 'id' field from the 'genres' table


## Filtering by a Tag - SQL Query Plan
> Plan the SQL query to retrieve all entries with a specific tag using the query string parameter.

```
$filtered = exec_sql_query(exec_sql_query($db, 'SELECT songs.song_name AS "songs.song_name", songs.artist AS "songs.artist", songs.lyrics AS "songs.lyrics", songs.album_name AS "songs.album_name", songs.song_year AS "songs.song_year", songs.id AS "songs.id" FROM songs WHERE (genre = :songGenres.genre;');
        $records = $filtered->fetchAll();
```


## Contributors

I affirm that I have contributed to the team requirements for this milestone.

Consumer Lead: Zhalae Daneshvari

Admin Lead: Sophia Hertel


[← Table of Contents](design-journey.md)
