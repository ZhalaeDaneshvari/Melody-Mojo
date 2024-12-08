-- database: ../test.sqlite
-- Note: Do not delete the line above! It is helpful for testing your init.sql file.
--
-- TODO: entries, tags, and entry_tags table schemas
-- TODO: seed data

--- Users ---
CREATE TABLE users (
  id INTEGER NOT NULL UNIQUE,
  name TEXT NOT NULL,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT)
);

-- password: monkey
INSERT INTO
  users (id, name, username, password)
VALUES
  (
    1,
    'Alex Smith',
    'alex',
    '$2y$10$QtCybkpkzh7x5VN11APHned4J8fu78.eFXlyAMmahuAaNcbwZ7FH.'
  );

--- Sessions ---
CREATE TABLE sessions (
  id INTEGER NOT NULL UNIQUE,
  user_id INTEGER NOT NULL,
  session TEXT NOT NULL UNIQUE,
  last_login TEXT NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT) FOREIGN KEY(user_id) REFERENCES users(id)
);

--Tags table--
CREATE TABLE genres (
    id INTEGER NOT NULL UNIQUE,
    genre TEXT NOT NULL,
    PRIMARY KEY (id AUTOINCREMENT)
);

INSERT INTO genres (id, genre) VALUES (9, "Pop");
INSERT INTO genres (id, genre) VALUES (1, "Rock");
INSERT INTO genres (id, genre) VALUES (2, "R&B");
INSERT INTO genres (id, genre) VALUES (3, "Country");
INSERT INTO genres (id, genre) VALUES (4, "EDM");
INSERT INTO genres (id, genre) VALUES (5, "Indie");
INSERT INTO genres (id, genre) VALUES (6, "Soul");
INSERT INTO genres (id, genre) VALUES (7, "Rap");
INSERT INTO genres (id, genre) VALUES (8, "Dance");


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

-- Source: https://chat.openai.com/ --
--Genre: Pop–
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        0,
        'Lover',
        'Taylor Swift',
        "We could leave the Christmas lights up 'til January
And this is our place, we make the rules
And there's a dazzling haze, a mysterious way about you dear
Have I known you 20 seconds or 20 years?
Can I go where you go?
Can we always be this close forever and ever?
And ah, take me out, and take me home
You're my, my, my, my
Lover
We could let our friends crash in the living room
This is our place, we make the call
And I'm highly suspicious that everyone who sees you wants you
I've loved you three summers now, honey, but I want 'em all
Can I go where you go?
Can we always be this close forever and ever?
And ah, take me out, and take me home (forever and ever)
You're my, my, my, my
Lover
Ladies and gentlemen, will you please stand?
With every guitar string scar on my hand
I take this magnetic force of a man to be my lover
My heart's been borrowed and yours has been blue
All's well that ends well to end up with you
Swear to be overdramatic and true to my lover
And you'll save all your dirtiest jokes for me
And at every table, I'll save you a seat, lover
Can I go where you go?
Can we always be this close forever and ever?
And ah, take me out, and take me home (forever and ever)
You're my, my, my, my
Oh, you're my, my, my, my
Darling, you're my, my, my, my
Lover", "Lover",2019, '0.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Falbum%2F1NAmidJlEaVgA3MpcPFYGq&psig=AOvVaw25jDRxNAvCmT1aHA3zvL9B&ust=1713038156484000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMilrMi6vYUDFQAAAAAdAAAAABAH');

--Genre: Country--
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        1,
        'The Bones',
        'Maren Morris',
        "We're in the home stretch of the high times
We took a hard left, but we're alright
Yeah, life sure can try to put love through it, but
We built this right, so nothing's ever gonna move it
When the bones are good, the rest don't matter
Yeah, the paint could peel, the glass could shatter
Let it break, 'cause you and I remain the same
When there ain't a crack in the foundation
Baby, I know any storm we're facing will
Blow right over while we stay put
The house don't fall when the bones are good
Mmm-mmm, mmm
Call it dumb luck, but, baby, you and I
Can't even mess it up although we both try
No, it don't always go the way we planned it, but the
Wolves came and went and we're still standing
When the bones are good, the rest don't matter
Yeah, the paint could peel, the glass could shatter
Let it break, 'cause you and I remain the same
When there ain't a crack in the foundation
Baby, I know any storm we're facing will
Blow right over while we stay put
The house don't fall when the bones are good
When the bones are good
Bones are good, the rest (baby, it don't really matter), the rest don't matter
Paint could peel, the glass (oh, the glass, oh, the glass) could shatter
Bones are good, the rest (ooh), the rest don't matter (ooh-ooh, ooh)
Paint could peel, the glass, the glass could shatter (yeah)
When the bones are good, the rest don't matter
Yeah, the paint could peel, the glass could shatter
Let it break (let it break, let it break), 'cause you and I remain the same (woo-ooh-ooh, ooh)
When there ain't a crack in the foundation (woo-ooh-ooh, ooh)
Baby, I know any storm we're facing will
Blow right over while we stay put
The house don't fall when the bones are good
Yeah-eh-ey
Ooh-ooh-ooh, ooh-ooh-ooh
Ooh-ooh-ooh, ooh",
        'Girl',
        2019,'1.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F7yFhA2fUsL2oIMWlw5DaHQ&psig=AOvVaw0TpT45iMiVi44pfXmsc6lU&ust=1713038218206000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMCcyOW6vYUDFQAAAAAdAAAAABAE');

--Genre: Rap--
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        2,
        'SICKO MODE',
        'Travis Scott',
        "Astro, yeah
Sun is down, freezin' cold
That's how we already know winter's here
My dawg would prolly do it for a Louis belt
That's just all he know, he don't know nothin' else
I tried to show 'em, yeah
I tried to show 'em, yeah, yeah
Yeah, yeah, yeah
Gone on you with the pick and roll
Young LaFlame, he in sicko mode
Woo, made this here with all the ice on in the booth
At the gate outside, when they pull up, they get me loose
Yeah, Jump Out boys, that's Nike boys, hoppin' out coupes
This shit way too big, when we pull up give me the loot
(Gimme the loot)
Was off the Remy, had a Papoose
Had to hit my old town to duck the news
Two-four hour lockdown, we made no moves
Now it's 4AM and I'm back up poppin' with the crew
I just landed in, Chase B mixes pop like Jamba Juice
Different colored chains, think my jeweler really sellin' fruits
And they chokin', man, know the crackers wish it was a noose
Some-some-some, someone said
To win the retreat, we all in too deep
P-p-playin' for keeps, don't play us for weak (someone said)
To win the retreat, we all in too deep
P-p-playin' for keeps, don't play us for weak (yeah)
This shit way too formal, y'all know I don't follow suit
Stacey Dash, most of these girls ain't got a clue
All of these hoes I made off records I produced
I might take all my exes and put 'em all in a group
Hit my esés, I need the bootch
'Bout to turn this function to Bonnaroo
Told her, 'Hop in, you comin' too'
In the 305, bitches treat me like I'm Uncle Luke
(Don't stop, pop that pussy)
Had to slop the top off, it's just a roof (uh)
She said, 'Where we goin'?' I said, 'The moon'
We ain't even make it to the room
She thought it was the ocean, it's just the pool
Now I got her open, it's just the Goose
Who put this shit together? I'm the glue (someone said)
Shorty FaceTimed me out the blue
Someone said (playin'-playin' for keeps)
Someone said, motherfuck what someone said
(Don't play us for weak)
Yeah
Astro
Yeah, yeah
Tay Keith, fuck these niggas up (ayy, ayy)
She's in love with who I am
Back in high school, I used to bus it to the dance (yeah)
Now I hit the FBO with duffles in my hands
I did half a Xan, thirteen hours 'til I land
Had me out like a light, ayy, yeah
Like a light, ayy, yeah
Like a light, ayy
Slept through the flight, ayy
Knocked for the night, ayy, 767, man
This shit got double bedroom, man
I still got scores to settle, man
I crept down the block (down the block), made a right (yeah, right)
Cut the lights (yeah, what?), paid the price (yeah)
Niggas think it's sweet (nah, nah), it's on sight (yeah, what?)
Nothin' nice (yeah), baguettes in my ice (aww, man)
Jesus Christ (yeah), checks over stripes (yeah)
That's what I like (yeah), that's what we like (yeah)
Lost my respect, you not a threat
When I shoot my shot, that shit wetty like I'm Sheck (bitch)
See the shots that I took (ayy), wet like I'm Book (ayy)
Wet like I'm Lizzie, I be spinnin' Valley
Circle blocks 'til I'm dizzy (yeah, what?)
Like where is he? (Yeah, what?)
No one seen him (yeah, yeah)
I'm tryna clean 'em (yeah)
She's in love with who I am
Back in high school, I used to bus it to the dance
Now I hit the FBO with duffles in my hand (woo)
I did half a Xan, thirteen hours 'til I land
Had me out like a light, like a light
Like a light, like a light
Like a light (yeah), like a light
Like a light
Yeah, passed the dawgs a celly
Sendin' texts, ain't sendin' kites, yeah
He said, 'Keep that on lock'
I said, 'You know this shit, it's stife', yeah
It's absolute (yeah), I'm back reboot (it's lit)
LaFerrari to Jamba Juice, yeah (skrrt, skrrt)
We back on the road, they jumpin' off, no parachute, yeah
Shawty in the back
She said she workin' on her glutes, yeah (oh my God)
Ain't by the book, yeah
This how it look, yeah
'Bout a check, yeah
Just check the foots, yeah
Pass this to my daughter, I'ma show her what it took (yeah)
Baby mama cover Forbes, got these other bitches shook, yeah
Ye-ah",
        'Astroworld',
        2018, '2.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F2xLMifQCjDGFmkHkpNLD9h&psig=AOvVaw0AzMGYb1xPSsxlxHwtbhdl&ust=1713038246845000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKieoPO6vYUDFQAAAAAdAAAAABAE'
    );

--Genre: Indie--
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        3,
        'My Number',
        'Foals',
        "You don't have my number
We don't need each other now
We don't need the city
The creed or the culture now

'Cause I feel, well, I feel alive
I feel, well, I feel alive
I feel the streets are not pulling me down

So people of the city
I don't need your counsel now
And I don't need your good advice
'Cause you don't have my lover's touch

You don't have my number
We don't need each other now
The creed or the culture
We can move beyond it now

Now the wolf is knocking at my door
Bang-bang, it asks for more
Stand here, we stand tall
We can move beyond these walls

And I don't need your counsel
And I don't need these city streets
And I don't need that good advice
'Cause we can move beyond it now

You don't have my number
We don't need each other now
The creed or the culture
You don't have my lover's touch

'Cause I feel, well, I feel alive
I feel, well, I feel alive
I feel the streets are not far from here

Can you even hear me?
Do you even know my name?
Can you see the ocean there?
You don't have my lover's touch
You don't have my number
You don't have my number
I wonder, can you hear me?
And are you even listening now?

'Cause you don't have my number
And we don't need each other now
And you can't steal my thunder
'Cause you don't have my lover's touch

You don't have my number
And I don't need no one now
And I don't need these city streets
The creed or the culture now
Now
Now",
        'Holy Fire',
        2013, '3.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F04caEZhAsQKnWqKsMwk9ud&psig=AOvVaw2a9AHvaXi1TFnhwDIlwuuW&ust=1713038352666000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOi85aW7vYUDFQAAAAAdAAAAABAE'
    );

--Genre: Rock--
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        4,
        'Do I Wanna Know?',
        'Arctic Monkeys',
        "Have you got colour in your cheeks?
Do you ever get that fear that you can't shift
The type that sticks around like summat in your teeth?
Are there some aces up your sleeve?
Have you no idea that you're in deep?
I dreamt about you nearly every night this week
How many secrets can you keep?
'Cause there's this tune I found that makes me think of you somehow and I play it on repeat
Until I fall asleep
Spilling drinks on my settee

(Do I wanna know?)
If this feeling flows both ways?
(Sad to see you go)
Was sort of hoping that you'd stay
(Baby, we both know)
That the nights were mainly made for saying things that you can't say tomorrow day

Crawling back to you

Ever thought of calling when you've had a few?
'Cause I always do
Maybe I'm too busy being yours to fall for somebody new
Now I've thought it through

Crawling back to you

So have you got the guts?
Been wondering if your heart's still open and if so I wanna know what time it shuts
Simmer down and pucker up
I'm sorry to interrupt. It's just I'm constantly on the cusp of trying to kiss you
I don't know if you feel the same as I do
But we could be together if you wanted to

(Do I wanna know?)
If this feeling flows both ways?
(Sad to see you go)
Was sort of hoping that you'd stay
(Baby, we both know)
That the nights were mainly made for saying things that you can't say tomorrow day

Crawling back to you (crawling back to you)

Ever thought of calling when you've had a few? (you've had a few)
'Cause I always do ('cause I always do)
Maybe I'm too (maybe I'm too busy) busy being yours to fall for somebody new
Now I've thought it through

Crawling back to you

(Do I wanna know?)
If this feeling flows both ways?
(Sad to see you go)
Was sort of hoping that you'd stay
(Baby, we both know)
That the nights were mainly made for saying things that you can't say tomorrow day

(Do I wanna know?)
Too busy being yours to fall
(Sad to see you go)
Ever thought of calling darling?
(Do I wanna know?)
Do you want me crawling back to you?",
        'AM',
        2013, '4.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F5FVd6KXrgO9B3JPmC8OPst&psig=AOvVaw3oCH0H2HSIYAOQB4gvHk5N&ust=1713038378053000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMCQ4rG7vYUDFQAAAAAdAAAAABAE'
    );

--Genre: EDM--
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        5,
        'Strobe',
        'deadmau5',
        "adI'm sorry, but I don't want to be an emperor
That's not my business
I don't want to rule or conquer anyone
I should like to help everyone if possible
Jew, Gentile, black man, white
We all want to help one another, human beings are like that
We want to live by each other's happiness, not by each other's misery
We don't want to hate and despise one another
In this world there's room for everyone and the good earth is rich
And can provide for everyone
The way of life can be free and beautiful
But we have lost the way
Greed has poisoned men's souls
Has barricaded the world with hate
Has goose-stepped us into misery and bloodshed
We have developed speed, but we have shut ourselves in
Machinery that gives abundance has left us in want
Our knowledge has made us cynical
Our cleverness hard and unkind
We think too much and feel too little

The hate of men will pass, and dictators die
And the power they took from the people will return to the people
And so long as men die, liberty will never perish",
'For Lack of a Better Name',
        2009, '5.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F31NiyZrUd1r4icY7xkvnWv&psig=AOvVaw3Ctpc2otrjqxVWwfBLiI86&ust=1713038402428000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOihpr27vYUDFQAAAAAdAAAAABAE'
    );

--Genre: R&B--
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        6,
        'Blinding Lights',
        'The Weeknd',
        "Yeah I've been tryna call
I've been on my own for long enough
Maybe you can show me how to love, maybe
I'm going through withdrawals
You don't even have to do too much
You can turn me on with just a touch, baby
I look around and
Sin City's cold and empty (oh)
No one's around to judge me (oh)
I can't see clearly when you're gone
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
(Hey, hey, hey)
I'm running out of time
'Cause I can see the sun light up the sky
So I hit the road in overdrive, baby, oh
The city's cold and empty (oh)
No one's around to judge me (oh)
I can't see clearly when you're gone
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
I said, ooh, I'm drowning in the night
Oh, when I'm like this, you're the one I trust
I'm just walking by to let you know (by to let you know)
I can never say it on the phone (say it on the phone)
Will never let you go this time (ooh)
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch
(Hey, hey, hey)
I said, ooh, I'm blinded by the lights
No, I can't sleep until I feel your touch",
        'After Hours',
        2020, '6.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Falbum%2F3sL9Myf7JF1k9TbrXE46ou&psig=AOvVaw1fSy1ChSBZbNZxRdri2AA3&ust=1713038424640000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMiLgsi7vYUDFQAAAAAdAAAAABAE'
    );

-- Pop/Rock --
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        7,
        'Somebody That I Used to Know',
        'Gotye ft. Kimbra',
        "Now and then I think of when we were together
Like when you said you felt so happy you could die
Told myself that you were right for me
But felt so lonely in your company
But that was love, and it's an ache I still remember
You can get addicted to a certain kind of sadness
Like resignation to the end, always the end
So when we found that we could not make sense
Well, you said that we would still be friends
But I'll admit that I was glad it was over
But you didn't have to cut me off
Make out like it never happened and that we were nothing
And I don't even need your love
But you treat me like a stranger, and that feels so rough
No, you didn't have to stoop so low
Have your friends collect your records and then change your number
I guess that I don't need that, though
Now you're just somebody that I used to know
Now you're just somebody that I used to know
Now you're just somebody that I used to know
Now and then I think of all the times you screwed me over
But had me believing it was always something that I'd done
And I don't wanna live that way
Reading into every word you say
You said that you could let it go
And I wouldn't catch you hung up on somebody that you used to know
But you didn't have to cut me off
Make out like it never happened and that we were nothing (aah-ooh)
And I don't even need your love (ooh)
But you treat me like a stranger, and that feels so rough (aah)
No, you didn't have to stoop so low (ooh)
Have your friends collect your records and then change your number (aah)
I guess that I don't need that, though
Now you're just somebody that I used to know
Somebody (I used to know)
Somebody (now you're just somebody that I used to know)
Somebody (I used to know)
Somebody (now you're just somebody that I used to know)
I used to know
That I used to know
I used to know
Somebody",
        'Making Mirrors',
        2011, '7.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Falbum%2F0r2xXrd3oQ338oO29kNXPg&psig=AOvVaw1lTLlzl6V_kzw_AYwhu3Qd&ust=1713038460392000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKD5kNm7vYUDFQAAAAAdAAAAABAE'
    );

-- Country/Pop --
INSERT INTO
    songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
    (
        8,
        'Meant to Be',
        'Bebe Rexha ft. Florida Georgia Line',
        "Baby, lay on back and relax
Kick your pretty feet up on my dash
No need to go nowhere fast
Let's enjoy right here where we at
Who knows where this road is supposed to lead
We got nothing but time
As long as you're right here next to me
Everything's gonna be alright
If it's meant to be, it'll be, it'll be
Baby, just let it be
If it's meant to be, it'll be, it'll be
Baby, just let it be
So, won't you ride with me, ride with me?
See where this thing goes
If it's meant to be, it'll be, it'll be
Baby, if it's meant to be
I don't mean to be so uptight
But my heart's been hurt a couple times
By a couple guys that didn't treat me right
I ain't gonna lie, ain't gonna lie
'Cause I'm tired of the fake love, show me what you're made of
Boy, make me believe
Whoa, hold up, girl, don't you know you're beautiful?
And it's easy to see
If it's meant to be, it'll be, it'll be
Baby, just let it be
If it's meant to be, it'll be, it'll be
Baby, just let it be
So, won't you ride with me, ride with me?
See where this thing goes
If it's meant to be, it'll be, it'll be
Baby, if it's meant to be
So, come on, ride with me, ride with me
See where this thing goes
So, come on, ride with me, ride with me
Baby, if it's meant to be
Maybe we do
Maybe we don't
Maybe we will
Maybe we won't
But if it's meant to be, it'll be, it'll be
Baby, just let it be (sing it, Bebe)
If it's meant to be, it'll be, it'll be (come on)
Baby, just let it be (let's go)
So, won't you ride with me, ride with me?
See where this thing goes
If it's meant to be, it'll be, it'll be
Baby, if it's meant to be (yeah)
If it's meant to be, it'll be, it'll be
Baby, if it's meant to be
If it's meant to be, it'll be, it'll be
Baby, if it's meant to be (mm)",
        'All Your Fault: Pt. 2',
        2017, '8.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F7iDa6hUg2VgEL1o1HjmfBn&psig=AOvVaw2KtpyRPk4p_TysNzfecvBk&ust=1713038482840000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjf4OO7vYUDFQAAAAAdAAAAABAE'
    );

-- Rap/R&B --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (9, 'Love Galore', 'SZA ft. Travis Scott',"I need, I need
I need, I need
I need, I need
I need, I need
I need, I need
Love, love, love, love
'Long as we got
Love, love, love, oh
'Long as we got
Done with these niggas
I don't love these niggas
I dust off these niggas
Do it for fun
Don't take it personal
Personally, I'm surprised you
Called me after the things I said
Skrrt, skrrt on niggas (yeah)
Skrrt up on niggas
Skrrt down, you acting like me
Acting like we
Wasn't more than a summer fling
I said farewell
You took it well
Promise I won't cry over spilled milk
(Ooh no, I won't)
Gimme a paper towel
Gimme another Valium
Gimme another hour or two
Hour with you
Why you bother me when you know you don't want me? (Yeah)
Why you bother me when you know you got a woman? (Yeah)
Why you hit me when you know you know better?
Know you know better
Know your crew better than you do
Call me looking for ya (yeah)
I be looking for ya (yeah)
Got me looking forward to weekends
With you, baby
With you, baby
With you, baby
With you
We do whatever we want
Go wherever we want
Love however we want
It don't matter
You'll do whatever I want
Get whatever I want
Get whatever I need
It's about
Love, love, love, love
'Long as we got
Love, love, love
'Long as we got
Should've never gave you my number
I did it with you (ooh)
Should've never let you hit it
I split it with you
I regret it
You gots a fetish
You gots a problem
Now it's a problem, oh no
Skrrt, skrrt on bitches (yeah)
I don't know these bitches (yeah)
Dig dirt on bitches
Do it for fun
Don't take it personal, baby
Love on my ladies
Luh-love to my ladies
Uh, dated a few (straight up)
Why you bother me?
Why you bother me?
Why you bother me? (Why you bother me? Yeah)
Last time I checked you were the one that left (the one)
Me in a wreck, me in a mess (yeah, yeah, yeah)
You all I rep, like my side I rep (yeah, side)
That's that Mo city
That side that you can't come 'round at night, yeah (it's lit)
You like to get me high
You don't want no one beside ya
You like when I make fire
You say, 'La Flame, keep makin' fire' (keep makin' fire)
Let me cum inside ya
Let me plant that seed inside ya
Ass and titties, titties
The only thing that stuck with me, with me
Only thing that was real
Only thing I could feel, you feel me? (Feel me)
So why you bother me, why you bother me? (with you, baby)
Tryna catch a P.O.V, yeah (with you, baby, with you)
Love, love, love, love
'Long as we got
Love, love, love
'Long as we got
Ooh, I came to your city
Lookin' for lovin' and licky
'Cause you promised to put it down
All up in your city, lookin' for you
Searchin' for your light, oh
Only thing keeping me from droppin' you right now
Right now, love
Only thing keepin' me by your side
Only thing keepin' me by your side now
But see Solána, if you don't say something
Speak up for yourself
They think you stupid
You know what I'm saying?", 'Ctrl', 2017, '9.jpeg','jpeg','https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F0q75NwOoFiARAVp4EXU4Bs&psig=AOvVaw2N6NYc_I7BvbnN-YPyWf9a&ust=1713038507327000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLjCse-7vYUDFQAAAAAdAAAAABAE');
-- Country/Pop/Rock --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (10, 'Whistle', 'Flo Rida', "Can you blow my whistle baby, whistle baby
Let me know
Girl I'm gonna show you how to do it
And we start real slow
You just put your lips together
And you come real close
Can you blow my whistle baby, whistle baby
Here we go
Look, I'm bettin' you like people
And I'm bettin' you love freak mode
And I'm bettin' you like girls
That give love to girls and stroke your little ego
I bet you I'm guilty, your honor
That's just how we live in my genre
Who in the hell done paved the road wider?
There's only one Flo and one Rida
I'm a damn shame, order more champagne
Pull a damn hamstring tryna put it on ya
Let your lips spin back around corner
Slow it down, baby, take a little longer
Can you blow my whistle baby, whistle baby
Let me know
Girl I'm gonna show you how to do it
And we start real slow
You just put your lips together
And you come real close
Can you blow my whistle baby, whistle baby
Here we go (hey)
Whistle baby, whistle baby (hey)
Whistle baby, whistle baby (hey)
Whistle baby, whistle baby (hey)
Whistle baby, whistle baby
It's like everywhere I go, my whistle ready to blow
Shawty don't even know, she can get any for the low
Told me she's not a pro, it's okay, it's under control
Show me soprano 'cause, girl, you can handle
Baby, we start slow then you come up and park close
Girl, I'm the whistle man, my Bugatti the same notes
Show me your perfect pitch, you got it, my banjo
Talented with your lips like you blew out a candle
So amusing (amusing)
Now you can make a whistle with the music (music)
Hope you ain't got no issues, you can do it (do it)
Even if it's no picture, never lose it (lose it)
Can you blow my whistle baby, whistle baby
Let me know
Girl I'm gonna show you how to do it
And we start real slow
You just put your lips together
And you come real close
Can you blow my whistle baby, whistle baby
Here we go (hey)
Whistle baby, whistle baby (hey)
Whistle baby, whistle baby
Whistle baby, whistle baby
Whistle baby, whistle baby
Go on, girl, you can twerk it
Let me see you whistle while you work it
I'ma lay back, don't stop it
'Cause I love it how you drop it, drop it, drop it on me
Now, shorty, let that whistle blow, oh-oh-oh
Yeah, baby, make that whistle blow, oh-oh
Can you blow my whistle baby, whistle baby
Let me know
Girl I'm gonna show you how to do it
And we start real slow
You just put your lips together
And you come real close
Can you blow my whistle baby, whistle baby
Here we go
You blow my whistle baby
Whistle baby, whistle baby
You blow my whistle baby
Whistle baby, whistle baby
You blow my whistle baby
Whistle baby, whistle baby
You blow my whistle baby
Whistle baby, whistle baby",'Wild Ones', 2012, '10.jpeg', 'jpeg', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F0ltBH1JNzSvQJPjJpvTu9B&psig=AOvVaw2Y5z2-8Imm_DL6wxbQilt-&ust=1713038526097000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjWpPi7vYUDFQAAAAAdAAAAABAE');


-- EDM/Pop --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (11, 'Closer', 'The Chainsmokers ft. Halsey', "Hey, I was doing just fine before I met you
I drink too much and that's an issue, but I'm okay
Hey, you tell your friends it was nice to meet them
But I hope I never see them again
I know it breaks your heart
Moved to the city in a broke-down car, and
Four years, no calls
Now you're looking pretty in a hotel bar
And I, I, I, I, I can't stop
No, I, I, I, I, I can't stop
So, baby, pull me closer
In the back seat of your Rover
That I know you can't afford
Bite that tattoo on your shoulder
Pull the sheets right off the corner
Of that mattress that you stole
From your roommate back in Boulder
We ain't ever getting older
We ain't ever getting older
We ain't ever getting older
You look as good as the day I met you
I forget just why I left you, I was insane
Stay and play that Blink-182 song
That we beat to death in Tucson, okay
I know it breaks your heart
Moved to the city in a broke-down car, and
Four years, no call
Now I'm looking pretty in a hotel bar
And I, I, I, I, I can't stop
No, I, I, I, I, I can't stop
So, baby, pull me closer
In the back seat of your Rover
That I know you can't afford
Bite that tattoo on your shoulder
Pull the sheets right off the corner
Of that mattress that you stole
From your roommate back in Boulder
We ain't ever getting older
We ain't ever getting older
We ain't ever getting older",'Collage', 2016, '11.jpeg', 'jpeg', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Falbum%2F0rSLgV8p5FzfnqlEk4GzxE&psig=AOvVaw3qSL_hD-PfnI0MGZu9rLjP&ust=1713038549467000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCNiYt4O8vYUDFQAAAAAdAAAAABAE');

-- R&B/Pop --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (12, 'Umbrella', 'Rihanna ft. JAY-Z', "Uh huh, uh huh (yeah, Rihanna)
Uh huh, uh huh (Good Girl Gone Bad)
Uh huh, uh huh (take three, action)
Uh huh, uh huh (Hov)
No clouds in my stones
Let it rain, I hydroplane in the bank
Comin' down like Dow Jones
When the clouds come, we gone
We Roc-A-Fella
We fly higher than weather
In G5's or better
You know me (you know me)
In anticipation for precipitation stack chips for the rainy day
Jay, Rain Man is back
With Little Ms. Sunshine, Rihanna, where you at?
You have my heart
And we'll never be worlds apart
Maybe in magazines
But you'll still be my star
Baby, 'cause in the dark
You can't see shiny cars
And that's when you need me there
With you I'll always share
Because
When the sun shines, we'll shine together
Told you I'll be here forever
Said I'll always be your friend
Took an oath, I'ma stick it out to the end
Now that it's raining more than ever
Know that we'll still have each other
You can stand under my umbrella
You can stand under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh, eh, eh-eh
These fancy things will never come in between
You're part of my entity, here for infinity
When the war has took its part
When the world has dealt its cards
If the hand is hard
Together we'll mend your heart
Because
When the sun shines, we shine together
Told you I'll be here forever
Said I'll always be your friend
Took an oath, I'ma stick it out to the end
Now that it's raining more than ever
Know that we'll still have each other
You can stand under my umbrella
You can stand under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh, eh, eh-eh
You can run into my arms
It's okay, don't be alarmed
Come into me (there's no distance in between our love)
So gon' and let the rain pour
I'll be all you need and more
Because
When the sun shines, we shine together
Told you I'll be here forever
Said I'll always be your friend
Took an oath, I'ma stick it out to the end
Now that it's raining more than ever
Know that we'll still have each other
You can stand under my umbrella
You can stand under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh
Under my umbrella, ella, ella, eh, eh, eh, eh, eh-eh
It's raining, raining
Ooh, baby, it's raining, raining
Baby, come into me
Come into me
It's raining, raining
Ooh, baby, it's raining, raining
You can always come into me
Come into me
It's pouring rain
It's pouring rain
Come into me
Come into me
It's pouring rain
It's pouring rain, come into me" ,'Good Girl Gone Bad', 2007, '12.jpeg', 'jpeg', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F49FYlytm3dAAraYgpoJZux&psig=AOvVaw2ks9mL3Z6yYlJlSl0DLQRj&ust=1713038568524000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCODNwYy8vYUDFQAAAAAdAAAAABAE');

-- Pop/Rock --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (13, 'High Hopes', 'Panic! At The Disco', "Had to have high, high hopes for a living
Shooting for the stars when I couldn't make a killing
Didn't have a dime but I always had a vision
Always had high, high hopes
Had to have high, high hopes for a living
Didn't know how but I always had a feeling
I was gonna be that one in a million
Always had high, high hopes
Mama said
Fulfill the prophecy
Be something greater
Go make a legacy
Manifest destiny
Back in the days
We wanted everything, wanted everything
Mama said
Burn your biographies
Rewrite your history
Light up your wildest dreams
Museum victories, everyday
We wanted everything, wanted everything
Mama said don't give up, it's a little complicated
All tied up, no more love and I'd hate to see you waiting
Had to have high, high hopes for a living
Shooting for the stars when I couldn't make a killing
Didn't have a dime but I always had a vision
Always had high, high hopes
Had to have high, high hopes for a living
Didn't know how but I always had a feeling
I was gonna be that one in a million
Always had high, high hopes (high, high hopes)
Mama said
It's uphill for oddities
Stranger crusaders
Ain't ever wannabes
The weird and the novelties
Don't ever change
We wanted everything, wanted everything
Stay up on that rise
Stay up on that rise and never come down, oh
Stay up on that rise
Stay up on that rise and never come down
Mama said don't give up, it's a little complicated
All tied up, no more love and I'd hate to see you waiting
They say it's all been done but they haven't seen the best of me
So I got one more run and it's gonna be a sight to see
Had to have high, high hopes for a living
Shooting for the stars when I couldn't make a killing
Didn't have a dime but I always had a vision
Always had high, high hopes
Had to have high, high hopes for a living
Didn't know how but I always had a feeling
I was gonna be that one in a million
Always had high, high hopes
Had to have high, high hopes for a living
Shooting for the stars when I couldn't make a killing
Didn't have a dime but I always had a vision
Always had high, high hopes
Had to have high, high hopes for a living
Didn't know how but I always had a feeling
I was gonna be that one in a million
Always had high, high hopes (high, high hopes)",'Pray for the Wicked', 2018, '13.jpeg', 'jpeg', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F1rqqCSm0Qe4I9rUvWncaom&psig=AOvVaw3XWqzhCeeqRO4x2PY2j75H&ust=1713038590491000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCNC-i5e8vYUDFQAAAAAdAAAAABAE');

-- Country/Rock --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (14, 'The Fighter', 'Keith Urban ft. Carrie Underwood', "I know he hurt you
Made you scared of love, too scared to love
He didn't deserve you
'Cause you're precious heart is a precious heart
He didn't know what he had and I thank God, oh
And it's gonna take just a little time
But you're gonna see that I was born to love you
What if I fall? (I won't let you fall)
What if I cry? (I'll never make you cry)
And if I get scared? (I'll hold you tighter)
When they're tryna get to you, baby, I'll be the fighter
What if I fall? (I won't let you fall)
What if I cry? (I promise I'll never make you cry)
And if I get scared? (I'll hold you tighter)
When they're tryna get to you, baby, I'll be the fighter
Look in the mirror
You're beautiful, so beautiful
I'm here to remind you
You're my only one, let me be the one
To heal all the pain that he put you through
With love like you never knew
Just let me show you
What if I fall? (I won't let you fall)
What if I cry? (I'll never make you cry)
And if I get scared? (I'll hold you tighter)
When they're tryna get to you, baby, I'll be the fighter
What if I fall? (I won't let you fall)
What if I cry? (I promise I'll never make you cry)
And if I get scared? (I'll hold you tighter)
When they're tryna get to you, baby, I'll be the fighter
I wanna believe that you got me, baby
I swear I do from now until the next life
I wanna love, wanna give you all my heart
What if I fall? (I won't let you fall)
What if I cry? (oh, I'll never make you cry)
And if I get scared? (I'll hold you tighter)
When they're tryna get to you, baby, I'll be the fighter
What if I fall? (I won't let you fall)
What if I cry? (I promise I'll never make you cry)
And if I get scared? (I'll hold you tighter)
When they're tryna get to you, baby, I'll be the fighter
What if I fall?
What if I cry?
And if I get scared? (I'll hold you tighter)
When they're tryna get to you, baby, I'll be the fighter",'Ripcord', 2016, '14.jpeg', 'jpeg', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F5OUSPcqhYTOzpbXzoEvKim&psig=AOvVaw2tHmnCmSiL1_Ogg054hNpl&ust=1713038617429000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjL96O8vYUDFQAAAAAdAAAAABAE');

-- Rap/Pop --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (15, 'Sunflower', 'Post Malone & Swae Lee', "Ayy, ayy, ayy, ayy (ooh)
Ooh, ooh, ooh, ooh (ooh)
Ayy, ayy
Ooh, ooh, ooh, ooh
Needless to say, I keep her in check
She was a bad-bad, nevertheless (yeah)
Callin' it quits now, baby, I'm a wreck (wreck)
Crash at my place, baby, you're a wreck (wreck)
Needless to say, I'm keeping her in check
She was all bad-bad, nevertheless
Callin' it quits now, baby, I'm a wreck
Crash at my place, baby, you're a wreck
Thinkin' in a bad way, losin' your grip
Screamin' at my face, baby, don't trip
Someone took a big L, don't know how that felt
Lookin' at you sideways, party on tilt
Ooh-ooh-ooh
Some things you just can't refuse
She wanna ride me like a cruise
And I'm not tryna lose
Then you're left in the dust
Unless I stuck by ya
You're the sunflower
I think your love would be too much
Or you'll be left in the dust
Unless I stuck by ya
You're the sunflower
You're the sunflower
Every time I'm leavin' on you (ooh)
You don't make it easy, no (no, no)
Wish I could be there for you
Give me a reason to, oh (oh)
Every time I'm walkin' out
I can hear you tellin' me to turn around
Fightin' for my trust and you won't back down
Even if we gotta risk it all right now, oh (now)
I know you're scared of the unknown ('known)
You don't wanna be alone (alone)
I know I always come and go (and go)
But it's out of my control
And you'll be left in the dust
Unless I stuck by ya
You're the sunflower
I think your love would be too much
Or you'll be left in the dust
Unless I stuck by ya
You're the sunflower
You're the sunflower (yeah)",'Spider-Man: Into the Spider-Verse Soundtrack', 2018, '15.jpeg', 'jpeg', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F1A6OTy97kk0mMdm78rHsm8&psig=AOvVaw0wcuZ_uqHyfiK9T1CcPvIo&ust=1713038636752000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLjcla28vYUDFQAAAAAdAAAAABAI');

-- Indie/Pop --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (16, 'Some Nights', 'fun.', "Some nights, I stay up cashing in my bad luck
Some nights, I call it a draw
Some nights, I wish that my lips could build a castle
Some nights, I wish they'd just fall off
But I still wake up, I still see your ghost
Oh Lord, I'm still not sure what I stand for, oh-oh
(Oh-ooh-woah) what do I stand for?
(Oh-ooh-woah) what do I stand for?
Most nights, I don't know anymore
Oh, oh-ooh-woah
Oh-ooh-woah, oh
Oh, oh-ooh-woah
Oh-ooh-woah, oh
This is it, boys, this is war
What are we waiting for?
Why don't we break the rules already?
I was never one to believe the hype
Save that for the black and white
Try twice as hard, and I'm half as liked
But here they come again to jack my style
That's alright (that's alright)
I found a martyr in my bed tonight
She stops my bones from wondering just who I am, who I am, who I am
Oh, who am I? Mmm, mmm-mmm
Well, some nights, I wish that this all would end
'Cause I could use some friends for a change
And some nights, I'm scared you'll forget me again
Some nights, I always win (I always win)
But I still wake up, I still see your ghost
Oh Lord, I'm still not sure what I stand for, oh-oh
(Oh-ooh-woah) what do I stand for?
(Oh-ooh-woah) what do I stand for?
Most nights, I don't know
so this is it?
I sold my soul for this?
Washed my hands of that for this?
I miss my mom and dad for this?
No, when I see stars, when I see-
When I see stars, that's all they are
When I hear songs
They sound like a swan, so come on
Oh come on, oh come on, oh come on
Well, this is it guys, that is all
Five minutes in, and I'm bored again
Ten years of this, I'm not sure if anybody understands
This one is not for the folks at home
Sorry to leave, Mom, I had to go
Who the fuck wants to die alone all dried up in the desert sun?
My heart is breaking for my sister
And the con that she called 'love'
And then I look into my nephew's eyes
Man, you wouldn't believe
The most amazing things
That can come from
Some terrible nights
Oh, oh-ooh-woah
Oh-ooh-woah, oh
Oh, oh-ooh-woah
Oh-ooh-woah, oh
The other night, you wouldn't believe
The dream I just had about you and me
I called you up, but we both agree
It's for the best you didn't listen
It's for the best we get our distance, oh
For the best you didn't listen
It's for the best we get our distance, oh",'Some Nights', 2012, '16.jpeg', 'jpeg', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Falbum%2F3KVTdZmRiy2H1fyIzKMBxJ&psig=AOvVaw2NHUoKpqLwGoSoXVhpdT3Q&ust=1713038664569000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCIDburq8vYUDFQAAAAAdAAAAABAE');

-- EDM/Rap --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (17, 'Happier', 'Marshmello ft. Bastille', "Lately, I've been, I've been thinking
I want you to be happier, I want you to be happier
When the morning comes
When we see what we've become
In the cold light of day we're a flame in the wind
Not the fire that we've begun
Every argument, every word we can't take back
'Cause with the all that has happened
I think that we both know the way that this story ends
Then only for a minute
I want to change my mind
'Cause this just don't feel right to me
I wanna raise your spirits
I want to see you smile but
Know that means I'll have to leave
Know that means I'll have to leave
Lately, I've been, I've been thinking
I want you to be happier, I want you to be happier
When the evening falls
And I'm left there with my thoughts
And the image of you being with someone else
Well, it's eating me up inside
But we ran our course, we pretended we're okay
Now if we jump together at least we can swim
Far away from the wreck we made
Then only for a minute
I want to change my mind
'Cause this just don't feel right to me
I wanna raise your spirits
I want to see you smile but
Know that means I'll have to leave
Know that means I'll have to leave
Lately, I've been, I've been thinking
I want you to be happier, I want you to be happier
So I'll go, I'll go
I will go, go, go
So I'll go, I'll go
I will go, go, go
Lately, I've been, I've been thinking
I want you to be happier, I want you to be happier
Even though I might not like this
I think that you'll be happier, I want you to be happier
Then only for a minute (only for a minute)
I want to change my mind
'Cause this just don't feel right to me
I wanna raise your spirits (wanna raise your spirits)
I want to see you smile but
Know that means I'll have to leave
Know that means I'll have to leave
Lately, I've been, I've been thinking
I want you to be happier, I want you to be happier
So I'll go, I'll go
I will go, go, go",'Happier', 2018, '17.jpeg', 'jpeg', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F7BqHUALzNBTanL6OvsqmC1&psig=AOvVaw3Tc4vcs62vUr-bliSs4RCx&ust=1713038687305000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLjOpcW8vYUDFQAAAAAdAAAAABAE');

-- R&B/Soul --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (18, 'Say So', 'Doja Cat', "Day to night to morning, keep with me in the moment
I'd let you had I known it, why don't you say so?
Didn't even notice, no punches left to roll with
You got to keep me focused, you want it, say so
Day to night to morning, keep with me in the moment
I'd let you had I known it, why don't you say so?
Didn't even notice, no punches left to roll with
You got to keep me focused, you want it, say so
It's been a long time since you fell in love
You ain't coming out your shell, you really ain't been yourself
Tell me what must I do (do tell, my love)
'Cause luckily I'm good at reading
I wouldn't bug him, but he won't stop cheesin'
And we can dance all day around it
If you front then I'll be bouncing
If you want it scream and shout it, babe
Before I leave you dry
Day to night to morning, keep with me in the moment
I'd let you had I known it, why don't you say so?
Didn't even notice, no punches left to roll with
You got to keep me focused, you want it, say so
Day to night to morning, keep with me in the moment
I'd let you had I known it, why don't you say so?
Didn't even notice, no punches left to roll with
You got to keep me focused, you want it, say so (yeah)
Let me check my chest, my breath right quick (ha)
He ain't never seen it in a dress like this (ah)
He ain't never even been impressed like this
Prolly why I got him quiet on the set like zip
Like it, love it, need it bad
Take it, own it, steal it, fast
Boy, stop playing, grab my ass
Why you actin' like you shy?
Shut it, save it, keep it, pushin'
Why you beating 'round the bush?
And knowing you want all this woman
Never knock it 'til you try (yeah, yeah)
All of them bitches hating I have you with me
All of my niggas saying you mad committed
Realer than anybody you had, and pretty
All of that body-ody, the ass and titties
Day to night to morning, keep with me in the moment
I'd let you had I known it, why don't you say so?
Didn't even notice, no punches left to roll with
You got to keep me focused, you want it, say so
Day to night to morning, keep with me in the moment
I'd let you had I known it, why don't you say so?
Didn't even notice, no punches left to roll with
You got to keep me focused, you want it, say so",'Hot Pink', 2019, "18.jpeg", "jpeg", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Ftrack%2F11VApNQCWLJdzxWrlmwzUa&psig=AOvVaw3Wfv8pjXhsKAPXwDk6AgP2&ust=1713038706013000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjNn868vYUDFQAAAAAdAAAAABAE");

-- Country/Pop/Rock --
INSERT INTO
  songs (id, song_name, artist, lyrics, album_name, song_year, file_name, file_ext, source)
VALUES
  (19, 'Need You Now', 'Lady A', "Picture perfect memories scattered all around the floor
Reaching for the phone 'cause I can't fight it anymore
And I wonder if I ever cross your mind
For me it happens all the time
It's a quarter after one, I'm all alone and I need you now
Said I wouldn't call but I've lost all control and I need you now
And I don't know how I can do without
I just need you now
Another shot of whiskey, can't stop looking at the door
I'm wishing you'd come sweeping in the way you did before
And I wonder if I ever cross your mind
For me it happens all the time
It's a quarter after one, I'm a little drunk and I need you now
Said I wouldn't call but I've lost all control and I need you now
And I don't know how I can do without
I just need you now
I guess I'd rather hurt than feel nothing at all
I guess I'd rather hurt than feel nothing at all
It's a quarter after one, I'm all alone and I need you now
I said I wouldn't call but I'm a little drunk and I need you now
And I don't know how I can do without
I just need you now
I just need you now",'Need You Now', 2010, "19.jpeg", "jpeg", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fopen.spotify.com%2Falbum%2F3hnGcNi8oqGdwTm3CeniFA&psig=AOvVaw1e6a3rnX7nHqDZrev2TJyW&ust=1713038726002000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjL2Ne8vYUDFQAAAAAdAAAAABAE");

--EntryTags table--
CREATE TABLE songGenres(
    id INTEGER NOT NULL UNIQUE,
    song_id INTEGER NOT NULL,
    genre INTEGER NOT NULL,
    PRIMARY KEY (id AUTOINCREMENT)
    FOREIGN KEY (song_id) REFERENCES songs(id)
    FOREIGN KEY (genre) REFERENCES genres(id)

);
INSERT INTO songGenres (song_id, genre) VALUES (0, 9);
INSERT INTO songGenres (song_id, genre) VALUES (0, 1);
INSERT INTO songGenres (song_id, genre) VALUES (1, 9);
INSERT INTO songGenres (song_id, genre) VALUES (1, 3);
INSERT INTO songGenres (song_id, genre) VALUES (2, 9);
INSERT INTO songGenres (song_id, genre) VALUES (2, 7);
INSERT INTO songGenres (song_id, genre) VALUES (3, 5);
INSERT INTO songGenres (song_id, genre) VALUES (3, 1);
INSERT INTO songGenres (song_id, genre) VALUES (4, 1);
INSERT INTO songGenres (song_id, genre) VALUES (4, 9);
INSERT INTO songGenres (song_id, genre) VALUES (5, 4);
INSERT INTO songGenres (song_id, genre) VALUES (5, 8);
INSERT INTO songGenres (song_id, genre) VALUES (6, 2);
INSERT INTO songGenres (song_id, genre) VALUES (6, 9);
INSERT INTO songGenres (song_id, genre) VALUES (7, 9);
INSERT INTO songGenres (song_id, genre) VALUES (7, 1);
INSERT INTO songGenres (song_id, genre) VALUES (8, 3);
INSERT INTO songGenres (song_id, genre) VALUES (8, 9);
INSERT INTO songGenres (song_id, genre) VALUES (9, 7);
INSERT INTO songGenres (song_id, genre) VALUES (9, 2);
INSERT INTO songGenres (song_id, genre) VALUES (10, 3);
INSERT INTO songGenres (song_id, genre) VALUES (10, 9);
INSERT INTO songGenres (song_id, genre) VALUES (10, 7);
INSERT INTO songGenres (song_id, genre) VALUES (11, 9);
INSERT INTO songGenres (song_id, genre) VALUES (11, 4);
INSERT INTO songGenres (song_id, genre) VALUES (12, 9);
INSERT INTO songGenres (song_id, genre) VALUES (12, 2);
INSERT INTO songGenres (song_id, genre) VALUES (13, 9);
INSERT INTO songGenres (song_id, genre) VALUES (13, 1);
INSERT INTO songGenres (song_id, genre) VALUES (14, 3);
INSERT INTO songGenres (song_id, genre) VALUES (14, 1);
INSERT INTO songGenres (song_id, genre) VALUES (15, 9);
INSERT INTO songGenres (song_id, genre) VALUES (15, 7);
INSERT INTO songGenres (song_id, genre) VALUES (16, 9);
INSERT INTO songGenres (song_id, genre) VALUES (16, 5);
INSERT INTO songGenres (song_id, genre) VALUES (17, 4);
INSERT INTO songGenres (song_id, genre) VALUES (17, 7);
INSERT INTO songGenres (song_id, genre) VALUES (18, 2);
INSERT INTO songGenres (song_id, genre) VALUES (18, 6);
INSERT INTO songGenres (song_id, genre) VALUES (19, 9);
INSERT INTO songGenres (song_id, genre) VALUES (19, 1);
INSERT INTO songGenres (song_id, genre) VALUES (19, 3);
