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
  <main>
    <?php if (!is_user_logged_in()) { ?>
      <section class = "login-form">
        <h2>Login</h2>

        <?php echo login_form('/home-admin', $session_messages); ?>
      </section>
    <?php } ?>
  </main>
</body>

</html>
