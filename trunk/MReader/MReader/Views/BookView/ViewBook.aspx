<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage< MReader.Models.BookPageFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    bookview
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%using (Html.BeginForm())
      {%>
    <div id="pager">
        <div id="header">
        </div>
        <div id="titlebar"><h2 id="title"><%=Model.book.Title %></h2></div>
        <div id="content">
            <%=Html.Hidden("ID",Model.book.ID) %> 
            <table id="viewport">
                <tr>
                    <td id="sideviewport">
                        <div id="sidebar">  
                                <div id="sidebarcover">
                                    <img alt="cover" height="125" width="90px" src="<%=(Model.bookcover) %>" />
                                </div>
                                <div id="sidebarnav">
                                    <ul>
                                       <li><%=Html.ActionLink("Leave a comment","Index","BookInfo",
                                               new {bookid = Model.book.ID},new{}) %></li>
                                       
                                    </ul>
                                </div>
                                <div id="bookprofile">
                                    <ul id="acc1" class="ui-accordion-container"> 
	                                    <li> 
		                                    <div class="ui-accordion-left"></div> 
		                                    <a class="ui-accordion-link acc1" id="getBookmark">Bookmark
			                                    <span class="ui-accordion-right"></span></a> 
		                                    <div id = "bookmark_content">                                
<%--			                                    <ul class="ui-accordion-container" id="acc2"> 
				                                    <li> 
					                                    <div class="ui-accordion-left"></div> 
					                                    <a class="ui-accordion-link acc2">2a
						                                    <span class="ui-accordion-right"></span></a> 
					                                    <div> 
						                                    2a<br /> 
						                                    2a<br /> 
 
						                                    2a<br /> 
					                                    </div> 
				                                    </li> 
				                                    <li> 
					                                    <div class="ui-accordion-left"></div> 
					                                    <a class="ui-accordion-link acc2">2b
						                                    <span class="ui-accordion-right"></span></a> 
					                                    <div> 
						                                    2b<br /> 
 
						                                    2b<br /> 
						                                    2b<br /> 
					                                    </div> 
				                                    </li> 
			                                    </ul> --%>
		                                    </div> 
	                                    </li> 
	                                    <li> 
 
		                                    <div class="ui-accordion-left"></div> 
		                                    <a class="ui-accordion-link acc1">Book Information
			                                    <span class="ui-accordion-right"></span></a> 
		                                    <div> 
			                                    <%=Model.book.Title %><br /> 
			                                    <%=Model.book.Author %><br /> 
			                                    <%=Model.book.PublishDate %><br /> 
                                                <%=Model.book.Publisher %><br />
                                                <%=Model.book.Price %><br />
		                                    </div> 
 
	                                    </li> 
                                    </ul> 
                                </div> <%-- bookprofile--%>
                        </div>
                    </td>
                    <td>
                        <div id="toolbar">
                            <table>
                                <tr>
                                    <td>
                                        <div id = "previousbutton">  
                                           <a href="#" onclick="previous()"><img src="/images/arrow_left_green_48.png" /></a>
                                        </div>
                                    </td>
                                    <td>                                       
                                        <%=Html.TextBox("pageIndex",Model.pageIndex) %>
                                        <%=Html.Label("/"+Model.book.TotalPages.ToString() + " Pages")%>
                                        <input type="submit" value="Go" />
                                    </td>
                                    <td>
                                        <div id="nextbutton">                                    
                                            <a href="#" onclick="next()" ><img src="/images/arrow_right_green_48.png" /></a>                     
                                        </div>
                                    </td>
                                    <td>
                                        <input id = "bookmark" type = "button" value="bookmark"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="bookcontent">
                            <img id="book" height="1035px" width="800px" alt="loading" src="<%=Model.pageURL%>" />
                        </div>
                        
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%}%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID= "HeadContent" runat="server">
        <link href="/Content/BookViewStyle.css" rel="stylesheet" type="text/css" />

        <link href="/Content/accordion/flora.accordion.css" rel="stylesheet" type="text/css" />
        <script src="/Scripts/accordion/jquery.accordion.js" type="text/javascript"></script>
<%--        <script src="/Scripts/accordion/jquery.dimensions.js" type="text/javascript"></script>--%>

        <script language="javascript" type="text/javascript">         

            var pageNumGlobal;
            var bookURLGlobal;
            var totalPagesGlobal;
            var regex = /\{[0-9]+\}/;
            var ajaxUrl;
            var ajaxUrl2;
            var firstClick = true;

            function preload(imgURL) {
                var i = new Image();
                i.src = imgURL;
            }
            function Buttonvisible() {
                if (pageNumGlobal + 1 <= totalPagesGlobal) {
                    document.getElementById("nextbutton").style.display = "inline";
                }
                else {
                    document.getElementById("nextbutton").style.display = "none";
                }

                if (pageNumGlobal - 1 > 0) {
                    document.getElementById("previousbutton").style.display = "inline";
                }
                else {
                    document.getElementById("previousbutton").style.display = "none";
                }
            }
            function next() {
                pageNumGlobal = eval(pageNumGlobal) + 1;
                if (pageNumGlobal <= totalPagesGlobal) {
                    var img = document.getElementById("book").src = bookURLGlobal.replace(regex,pageNumGlobal);
                    document.getElementById("pageIndex").value = pageNumGlobal;
                }
                Buttonvisible();
                preload();
            }
            function previous() {
                pageNumGlobal = eval(pageNumGlobal) - 1;
                if ( pageNumGlobal > 0) {
                    var img = document.getElementById("book").src = bookURLGlobal.replace(regex,pageNumGlobal);
                    document.getElementById("pageIndex").value = pageNumGlobal;
                }
                Buttonvisible();
            }

            function preload() {
                var temp = eval(pageNumGlobal) + 1;
                if (temp <= totalPagesGlobal) {
                    var img = bookURLGlobal.replace(regex,temp);
                    var i = new Image();
                    i.src = img;
                }
            }
            
            $(document).ready( function(){
                    pageNumGlobal = <%=Model.pageIndex%>;
                    bookURLGlobal = "<%= Model.book.Content %>";
                    totalPagesGlobal = <%=Model.book.TotalPages %>;
                    Buttonvisible();

//                    alert("http://" + window.location.host + "/bookview/addbookmark");

                    $("#bookmark").click( function() {
                            GetURL();
                            $.get( ajaxUrl,
                            function(data, textStatus){ alert("succeed");} );
                    });



	                    $("#acc1").accordion({
		                    alwaysOpen: false,
		                    autoheight: false,
		                    header: 'a.acc1',
		                    clearStyle: true
	                    });
	                    $("#acc2").accordion({
		                    alwaysOpen: false,
		                    autoheight: false,
		                    header: 'a.acc2',
		                    clearStyle: true
	                    });

                        $("#getBookmark").click(function () {
                                    $.getJSON( ("/bookview/getbookmark?bookid=" +  <%=Model.book.ID %>),
                                    function(data){ 
                                                    var temp = "";
                                                    for( var i = 0; i<data.length; ++i){
                                                        temp = temp + data[i].createtime+"  page:<a href = \"javascript:gotoPage("+data[i].pageNum+")\">"+data[i].pageNum +">></a><br />";
                                                    }
                                                    $("#bookmark_content").text("");
                                                   $("#bookmark_content").append(temp);
                                                 } );
                                    });
                    } );

            function GetURL(){
                ajaxUrl = "/bookview/addbookmark?bookid=" +  <%=Model.book.ID %> + "&pageNum=" + pageNumGlobal;
                }

            function gotoPage( pageNum ) {
//                var img = document.getElementById("book").src = bookURLGlobal.replace(regex,pageNum);
                document.getElementById("book").src = bookURLGlobal.replace(regex,pageNum);
                document.getElementById("pageIndex").value = pageNum;
                pageNumGlobal = pageNum;
                }
            
            

   </script>
</asp:Content>
