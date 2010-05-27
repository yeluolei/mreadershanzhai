<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>test</title>
    <script language="javascript" type="text/javascript">
        function preload() {
            var i = new Image();
            i.src = "/book/Essential_C++/Essential_C++-10.png";
           
            //        img.setAttribute("src","/book/Essential_C++/Essential_C++-10.png");     
        }
        function change() {
            var img = document.getElementById("book").src = "/book/Essential_C++/Essential_C++-10.png";
        }
    </script>
</head>
<body>
    <div><a href="#" onclick="change()">next</a>
        <img id="book" src="/book/Essential_C++/Essential_C++-1.png" / onclick="change()">
    </div>
</body>
</html>
