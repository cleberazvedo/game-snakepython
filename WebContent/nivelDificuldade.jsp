<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game Snake Python</title>

        <link rel="stylesheet" href="css/styleGame.css">
        <link rel="stylesheet" href="css/grid.css">
        <script src="js/scriptGame.js"></script>
        <link rel="icon" type="image/png" sizes="16x16" href="image/favicon.png">
    </head>

    <body style="background-image: url('image/fundo1.png');">
        <div class="displayTelaDificuldades">

            <div class="row">

                <h1>SELECIONE O NÍVEL DE DIFICULDADE</h1>

                <div class="col-dm-4 col-dg-4 telaDificuldades backgroundS">
                    <a id="slug" href="nivelGame/slug.jsp">SLUG</a>
                    <label> Fácil </label>
                </div>
                <div class="col-dm-4 col-dg-4 telaDificuldades backgroundW">
                    <a id="worm" href="nivelGame/worm.jsp">WORM</a>
                    <label> Médio </label>
                </div>
                <div class="col-dm-4 col-dg-4 telaDificuldades backgroundP">
                    <a id="python" href="nivelGame/python.jsp">PYTHON</a>
                    <label> Difícil </label>
                </div>
            </div>

            <br>
        </div>
    </body>

    </html>