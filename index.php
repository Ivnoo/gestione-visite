<?php
include("db-connect.php");
?>


<!DOCTYPE html>
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Visite Prenotate">
    <meta name="description" content="">
    <title>Home</title>
    <link rel="stylesheet" href="css/nicepage.css" media="screen">
<link rel="stylesheet" href="css/Home.css" media="screen">
    <script class="u-script" type="text/javascript" src="js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 5.5.0, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
  <meta data-intl-tel-input-cdn-path="intlTelInput/"></head>
  <body class="u-body u-xl-mode" data-lang="en"><header class="u-clearfix u-header u-header" id="sec-15ce"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect></g></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-unstyled u-nav-1">
              <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="index.php" style="padding: 10px 20px;">Home</a></li>
              <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="pagamenti.php" style="padding: 10px 20px;">Pagamenti</a></li>
            <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" rel="nofollow" style="padding: 10px 20px;">Classi</a>
            <div class="u-nav-popup">
              <ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10">
                <?php
                  $cmd = "SELECT * FROM classi";
                  $qry = mysqli_query($con, $cmd);
                  if(mysqli_num_rows($qry) > 0) {
                    while($row = mysqli_fetch_assoc($qry)) {
                      echo '<li class="u-nav-item"><a class="u-button-style u-nav-link u-white" href="studenti.php?idClasse='.$row['id'].'">'.$row['classe'].'</a></li>';
                    }
                  }
                ?>
              </ul>
            </div>
          </li>
          <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="pacchetti.php" style="padding: 10px 20px;">Pacchetti</a></li>
        </ul>
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-inner-container-layout u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-3">
                  <li class="u-nav-item"><a class="u-button-style u-nav-link" href="index.php">Home</a></li>
                  <li class="u-nav-item"><a class="u-button-style u-nav-link">Classi</a>
                  <div class="u-nav-popup"><ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10">
                    
                </ul>
            </div>
          </li>
          <li class="u-nav-item"><a class="u-button-style u-nav-link" href="pacchetti.php">Pacchetti</a></li>
        </ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
      </div></header>
    <section class="u-clearfix u-section-1" id="sec-4f5a">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <br>
        <h2 class="u-align-center u-text u-text-default u-text-1">Visite Prenotate</h2>
        <br>
        <div class="u-expanded-width u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <?php
              $cmd = "SELECT visita.descrizione, visita.nome, visita.stato, visita.id_pacchetto, visita.id, visita.stato, classi.classe FROM visita, classi WHERE classi.id = visita.id_classe AND stato = 'Prenotata'";
              $qry = mysqli_query($con, $cmd);
              if(mysqli_num_rows($qry) > 0) {
                echo '<div class="u-container-style u-list-item u-repeater-item">';
                while($row = mysqli_fetch_assoc($qry)) {
                  echo '<div class="u-container-layout u-similar-container u-container-layout-1">';
                  echo '<h3 class="u-text u-text-default u-text-2">'.$row['nome'].'</h3>';
                  echo '<p class="u-text u-text-3">Classe: '.$row['classe'].'</p>';
                  echo '<p class="u-text u-text-3">'.$row['descrizione'].'</p>';
                  echo '<p class="u-text u-text-3">Stato: '.$row['stato'].'</p>';
                  echo '<p><a href="checkstatus.php?id='.$row['id'].'" class="u-border-2 u-border-hover-palette-1-base u-border-palette-1-base u-btn u-btn-round u-button-style u-hover-palette-1-base u-none u-radius-50 u-text-body-color u-btn-1">Aggiorna Stato</a></p>';
                  echo '<p><a href="pacchetti.php?idPacchetto='.$row['id_pacchetto'].'" class="u-border-2 u-border-hover-palette-1-base u-border-palette-1-base u-btn u-btn-round u-button-style u-hover-palette-1-base u-none u-radius-50 u-text-body-color u-btn-1">Mostra Pacchetto</a></p>';
                  echo '</div>';
                }
                echo '</div>';
              }
            ?>
          </div>
        </div>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-8281"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-align-center u-text u-text-default u-text-1">Gestione Visite ITIS P. Paleocapa - Comi Ivan</p>
      </div></footer>
  
</body></html>