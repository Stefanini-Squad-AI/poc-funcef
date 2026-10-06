<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web._Default"
    EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <glw:TituloNavegador runat="server" />
    </title>

    <script language="javascript" type="text/javascript">
        function abrir() {
            var iHeigth, iWidth, pH, pW;
	        var url = '<%= Page.ResolveClientUrl("~/Paginas/Home/Default.aspx") %>';
	        
	        pW = 1;
	        
	        if (screen.height == 600) {
		        pH = 13;
	        }
        	
	        if (screen.height == 1024) {
		        pH = 7;
	        }
        	
	        if (screen.height != 1024 && screen.height != 600) {
		        pH = 10;
	        }
        	
	        iHeigth = screen.height - (screen.height * pH / 100) -10;
	        iWidth = screen.width - (screen.width * pW / 100);
	        
	        var janelaSistema = window.open(url, "", "height=" + iHeigth + ",width=" + iWidth + ",directories=no,location=no,menubar=no,resizable=yes,status=yes,titlebar=yes,toolbar=no,top=0,left=0,scrollbars=yes,scrolling=yes");
	        self.close();
	        janelaSistema.focus();
        }
    </script>

</head>
<body onload="return abrir();">
</body>
</html>
