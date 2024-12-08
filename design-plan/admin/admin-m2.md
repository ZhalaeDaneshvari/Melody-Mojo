# Project 3, Milestone 2: **Administrator** Design Journey

[← Table of Contents](../design-journey.md)


## Milestone 1 Feedback Revisions
> Explain what you revised in response to the Milestone 1 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

I changed the admin view all page to differentiate it a bit more from the consumer page, making it more of a list for ease of use and data access.


## Edit Page URL
> Design the URL for the administrator's edit page.
> What is the URL for the administrator's edit page?

/edit-entry

> What query string parameters will you include in the URL?

| Query String Parameter Name       | Description       |
| --------------------------------- | ----------------- |
| song_name                         | name of the song  |
|                                   |                   |
|                                   |                   |


## SQL Query Plan
> Plan the SQL query to retrieve a record from one of your query string parameters.

```
$songs_result = exec_sql_query($db,
    'SELECT songs.song_name AS "songs.song_name", songs.artist AS "songs.artist", songs.lyrics AS "songs.lyrics", songs.album_name AS "songs.album_name", songs.song_year AS "songs.song_year", songs.id AS "songs.id" FROM songs WHERE (songs.song_name = :song_name);',
    array(
        ":song_name" => $_GET['song_name']
    )
);
$song_record = $songs_result->fetchAll()[0];
```

> Plan the SQL query to retrieve all tag names for a specific record.

```
$genres = exec_sql_query($db,
    'SELECT genres.genre FROM genres INNER JOIN songGenres ON genres.id = songGenres.genre WHERE (songGenres.song_id = :song_id);',
    array(
        ":song_id" => $song_record['songs.id']
    )
);
$genres_records = $genres->fetchAll();
```


## Contributors

I affirm that I am submitting my work for the administrator requirements in this milestone.

Admin Lead: Sophia Hertel


[← Table of Contents](../design-journey.md)
