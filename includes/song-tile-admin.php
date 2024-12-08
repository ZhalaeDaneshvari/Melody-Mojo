
<div class = "container">
    <a class="admin-song-tile" href="/edit-entry?<?php echo http_build_query(array('song_name' => $song)); ?>">
        <figure><img class="album-cover" src="<?php echo htmlspecialchars($file_url); ?>" alt="<?php echo htmlspecialchars($record["songs.file_name"]); ?>"></figure>
        <p class = "tile-info-leftmost"><?php echo htmlspecialchars($song); ?></p>
        <p class = "tile-info"><?php echo htmlspecialchars($album_name); ?></p>
        <p class = "tile-info"><?php echo htmlspecialchars($artist); ?></p>
        <p class = "tile-info"><?php echo htmlspecialchars($song_year); ?></p>
        <div class = "genres">
        <?php
            foreach ($genres_records as $g_record) {
                ?>
                <p class="tile-info song-genre"><?php echo htmlspecialchars($g_record["genre"]); ?></p>
                <?php
            }
        ?>
        </div>
    </a>
    <a class = "show-lyrics-col" href="/show-lyrics?<?php echo http_build_query(array('song_name' => $song)); ?>">Show Lyrics</a>
</div>
