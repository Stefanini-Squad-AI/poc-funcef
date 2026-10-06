<%-- SIG 50871
 Autor:  
 William Santana

 Data da Atualização:
 03/08/2017

 Criação de fucionalidade para importar modelos de contratos de empréstimo.--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImpressaoModelo.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.ModeloContrato.ImpressaoModelo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
        body, html { height: 100%; margin: 0; padding: 0; }
    </style>
    <glw:ReferenciaScript ID="ReferenciaScript1" runat="server" scriptUrl="~/Scripts/JQuery-1.3.2.js" />
    <script type="text/javascript">
        $(document).ready(function () {
            setHeight();
        });

        $(window).resize(function () {
            setHeight();
        });

        function setHeight() {
            $(document).height = window.screen.height;
            $(document).width = window.screen.width;
        }

    </script>
</head>
<body>
</body>
</html>
