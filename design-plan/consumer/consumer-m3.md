# Project 3, Milestone 3: **Consumer** Design Journey

[← Table of Contents](../design-journey.md)


## Milestone 2 Feedback Revisions
> Explain what you individually revised in response to the Milestone 1 feedback (1-2 sentences)
> If you didn't make any revisions, explain why.

Before I had a button on each tile that said show more details, but I changed it so now each tile is fully clickable instead.


## Insert Form - INSERT query
> Plan your query to insert an entry in your catalog.

```sql
    $result = exec_sql_query(
      $db,
      "INSERT INTO songs (song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source) VALUES (:song_name, :artist, :lyrics, :album_name, :song_year, :file_name, :file_ext, :source);",
      array(

        ":song_name"        => $form_values["form_song"],
        ":artist"      => $form_values["form_artist"],
        ":lyrics"        => $form_values["form_lyrics"],
        ":album_name"        => $form_values["form_album"],
        ":song_year"     => $form_values["form_year"],
        ":file_name" => $upload_file_name,
        ":file_ext" => $upload_file_ext,
        ":source" => $upload_source
      )
    );
```

## Insert Form - Sample Test Data
> Document sample test data to insert an entry in your catalog.
> Upload a sample file to the `design-plan/consumer` folder for us to upload when inserting the entry.

**Sample Insert Data:**
  - song_name: Make You Mine
  - artist: Madison Beer
  - lyrics: I-I-I wanna feel, feel, feel
Wanna taste, taste, taste
Wanna get you goin'
I-I-I wanna lay, lay, lay
Wanna string, string, string
Wanna make you mine
Live inside my mind
You can see the shrine
Got you on my walls
Believe it (believe it)
Baby, don't be scared
Want you everywhere
Catch you if you fall
I mean it (I mean it)
Closer I get
Can you resist?
It's relentless
It's why
I wanna feel the rush
I wanna taste the crush
I wanna get you goin'
I wanna lay you down
I wanna string you up
I wanna make you mine
I wanna feel the rush
I wanna taste the crush
I wanna feel
I wanna lay you down
I wanna string you up
I wanna make you mine
I-I-I wanna feel, feel, feel
Wanna taste, taste, taste
Wanna get you goin'
I-I-I wanna lay, lay, lay
Wanna string, string, string
Wanna make you mine
Make you mine
(Can't you feel the rush?)
(Can't you feel the rush?)
(Can't you feel the rush?)
Make you mine
See it in my eyes
How they never lie
Just a little bite
Are you dreamin'? (Are you dreamin'?)
Now I got you up
Would you look at us?
Fantasy the life
And I'm screamin', screamin'
Closer I get
Can you resist?
It's relentless
It's why
I wanna feel the rush
I wanna taste the crush
I wanna get you goin'
I wanna lay you down
I wanna string you up
I wanna make you mine
I wanna feel the rush
I wanna taste the crush
I wanna feel
I wanna lay you down
I wanna string you up
I wanna make you mine
I-I-I wanna feel, feel, feel
Wanna taste, taste, taste
Wanna get you goin'
I-I-I wanna lay, lay, lay
Wanna string, string, string
Wanna make you mine
I-I-I wanna feel, feel, feel
Wanna taste, taste, taste
Wanna get you goin'
I-I-I-I-I-I wanna string, string, string
Wanna make you mine
Make you mine
(Can't you feel the rush?)
(Can't you feel the rush?)
(Can't you feel the rush?)
Make you mine
  - album_name: Make You Mine
  - song_year: 2024
  - file_name: makeYouMine.jpeg
**Sample Upload File:** `design-plan/consumer/makeYouMine.jpeg`


## Contributors

I affirm that I am submitting my work for the consumer requirements in this milestone.

Consumer Lead: Zhalae Daneshvari


[← Table of Contents](../design-journey.md)
