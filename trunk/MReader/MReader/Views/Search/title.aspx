<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<  MReader.Models.BookSearchResult >" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><% foreach (string keyword in Model.keyword) {%>
        <%: Html.Label(keyword)%>
    <%}%></h2>

    <% foreach ( var book in Model.books ) {
           Html.RenderPartial("bookform",book);} %>
       
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<script src="/Scripts/jquery-1.4.1.js" type="text/javascript"></script>
<script type="text/javascript" language ="javascript">

    function highlightWord(node, word) {
        // Iterate into this nodes childNodes 
        if (node.hasChildNodes) {
            var hi_cn;
            for (hi_cn = 0; hi_cn < node.childNodes.length; hi_cn++) {
                highlightWord(node.childNodes[hi_cn], word);
            }
        }

        // And do this node itself 
        if (node.nodeType == 3) { // text node 
            tempNodeVal = node.nodeValue.toLowerCase();
            tempWordVal = word.toLowerCase();
            if (tempNodeVal.indexOf(tempWordVal) != -1) {
                pn = node.parentNode;
                if (pn.className != "highlight") {
                    // word has not already been highlighted! 
                    nv = node.nodeValue;
                    ni = tempNodeVal.indexOf(tempWordVal);
                    // Create a load of replacement nodes 
                    before = document.createTextNode(nv.substr(0, ni));
                    docWordVal = nv.substr(ni, word.length);
                    after = document.createTextNode(nv.substr(ni + word.length));
                    hiwordtext = document.createTextNode(docWordVal);
                    hiword = document.createElement("span");
                    hiword.className = "highlight";
                    hiword.appendChild(hiwordtext);
                    pn.insertBefore(before, node);
                    pn.insertBefore(hiword, node);
                    pn.insertBefore(after, node);
                    pn.removeChild(node);
                }
            }
        }
    }


    //根据Tag名高亮关键字
    function SearchHighlightTag(node, key) {
        if (!document.createElement) return;
        if (key.length === 0) return false;
        var array = new Array();
        array = key.split(" ");
        var element = document.getElementsByTagName(node);
        for (var i = 0; i < array.length; i++) {
            for (var j = 0; j < element.length; j++) {
                highlightWord(element[j], array[i]);
            }
        }
    }
    //根据ID高亮关键字
    function SearchHighlightID(node, key) {
        if (!document.createElement) return;
        if (key.length === 0) return false;
        var array = new Array();
        array = key.split(" ");
        var element = document.getElementById(node);
        for (var i = 0; i < array.length; i++) {
            for (var j = 0; j < element.length; j++) {
                highlightWord(element, array[i]);
            }
        }
    }

    $(document).after(function () {
        SearchHighlightID("searchresult","<%=Model.SSKeyWord %>");
    })

</script>
</asp:Content>

