# Project 3, Milestone 3: **Administrator** Design Journey

[← Table of Contents](../design-journey.md)


## Milestone 2 Feedback Revisions
> Explain what you individually revised in response to the Milestone 1 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

I changed the link for the edit page on the admin side to encompass the whole tile so that the entire song is clickable.


## Edit Form - UPDATE query
> Plan your query to update an entry in your catalog.

```sql
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
```


## Edit Form - Sample Test Data
> Document sample test data to edit an entry in your catalog.
> Upload a sample file to the `design-plan/admin` folder for us to upload when editing the entry.

**Sample Edit Data:**

  - song_name: He's The Greatest Dancer
  - artist: Sister Sledge
  - lyrics: Oh, what, wow
He's the greatest dancer
Oh, what, wow
That I've ever seen
Oh, what, wow
He's the greatest dancer
Oh, what, wow
One night in a disco on the outskirts of Frisco
I was cruising with my favorite gang
The place was so boring filled with out-of-towners touring
I knew that it wasn't my thing
I really wasn't caring, but I felt my eyes staring
At a guy who stuck out in the crowd
He had the kind of body that would shame Adonis
And a face that would make any man proud
Oh, what, wow
He's the greatest dancer
Oh, what, wow
That I've ever seen (ooh)
Oh, what, wow
He's the greatest dancer
Oh, what, wow
The champion of dance, his moves will put you in a trance
And he never leaves the disco alone
Arrogance but not conceit, as a man he's complete
My creme de la creme, please take me home
He wears the finest clothes, the best designers Heaven knows
Ooh, from his head down to his toes
Halston, Gucci, Fiorucci
He looks like a still, that man is dressed to kill
Oh, what, wow
He's the greatest dancer
Oh, what, wow
That I've ever seen (I've ever seen)
Oh, what, wow
He's the greatest dancer
Oh, what, wow (ooh, ooh, ooh-wow)
Oh, what, wow (hey)
He's the greatest dancer
Oh, what, wow
That I've ever seen (I love your moves)
Oh, what, wow
He's the greatest dancer
Oh, what, wow (that I've ever seen)
Oh, what, wow
He's the greatest dancer
Oh, what, wow
That I've ever seen (I've ever seen)
Oh, what, wow
He's the greatest dancer
Oh, what, wow (ooh, ooh, ooh-wow)
Oh, what, wow (hey)
He's the greatest dancer
Oh, what, wow
That I've ever seen (I love your moves)
Oh, what, wow
He's the greatest dancer
Oh, what, wow (that I've ever seen)
 - album_name: We Are Family
 - song_year: 1979

**Sample Upload File:** `design-plan/admin/20.jpeg`


## Contributors

I affirm that I am submitting my work for the administrator requirements in this milestone.

Admin Lead: Sophia Hertel


[← Table of Contents](../design-journey.md)
