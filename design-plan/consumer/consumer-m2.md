# Project 3, Milestone 2: **Consumer** Design Journey

[← Table of Contents](../design-journey.md)


## Milestone 1 Feedback Revisions
> Explain what you revised in response to the Milestone 1 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

I made no revisions, as there was no feedback for the consumer side of the website from M1.


## Details Page URL
> Design the URL for the consumer's detail page.
> What is the URL for the detail page?

/song-details

> What query string parameters will you include in the URL?

| Query String Parameter Name       | Description       |
| --------------------------------- | ----------------- |
| song_name                         | name of the song to find details |
|                                   |                   |
|                                   |                   |


## SQL Query Plan
> Plan the SQL query to retrieve a record from one of your query string parameters.

```
On the home page: 
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
On the home page:
$genres = exec_sql_query(
            $db,
            'SELECT genres.genre FROM genres INNER JOIN songGenres ON genres.id = songGenres.genre WHERE (songGenres.song_id = :song_id);',
            array(
              ":song_id" => $record['songs.id']
            )
          );
          $genres_records = $genres->fetchAll();

On the details page itslef:
<?php
        foreach ($genres_records as $g_record) {
            ?>
            <p class="song-genre"><?php echo htmlspecialchars($g_record["genre"]); ?></p>
            <?php
        }
        ?>
```


## Contributors

I affirm that I am submitting my work for the consumer requirements in this milestone.

Consumer Lead: Zhalae Daneshvari


[← Table of Contents](../design-journey.md)
