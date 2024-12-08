<div class="song-tile-container">
    <a class="song-tile" href="/song-details?<?php echo http_build_query(array('song_name' => $song)); ?>">
        <figure><img class="album-cover" src="<?php echo htmlspecialchars($file_url); ?>" alt="<?php echo htmlspecialchars($record["songs.file_name"]); ?>"></figure>
        <h3 class="song-name"><?php echo htmlspecialchars($song); ?></h3>
        <p class="song-artist"><?php echo htmlspecialchars($artist); ?></p>
        <?php
        foreach ($genres_records as $g_record) {
            ?>
            <p class="song-genre-home"><?php echo htmlspecialchars($g_record["genre"]); ?></p>
            <?php
        }
        ?>
    </a>
</div>
