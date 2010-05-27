<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	test2
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>test2</h2>
    <script language="javascript" type="text/javascript">preload()</script>
    <div><a href="#" onclick="change()">next</a>
        <img id="book" src="/book/Essential_C++/Essential_C++-1.png" / onclick="change("book")">
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="javascript" type="text/javascript">
        function preload() {
            var i = new Image();
            alert("ssss");
            i.src = "/book/Essential_C++/Essential_C++-10.png";

            //        img.setAttribute("src","/book/Essential_C++/Essential_C++-10.png");     
        }
        function change( book ) {
            alert("bbok");
            var img = document.getElementById("book").src = "/"+book+"/Essential_C++"+"/"+"Essential_C++-10.png";
        }
    </script>
</asp:Content>
