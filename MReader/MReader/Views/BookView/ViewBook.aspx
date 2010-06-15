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
		                                    <a class="ui-accordion-link acc1"><b>Book Information</b>
			                                    <span class="ui-accordion-right"></span></a> 
		                                    <div> 
                                                <p id="mark"><b><%:Html.Label("Title:") %></b> <br />
			                                    &nbsp&nbsp <%=Model.book.Title %></p> 
                                                <p><b><%:Html.Label("Author:") %></b><br />
			                                    &nbsp&nbsp <%=Model.book.Author %></p>
                                               <p><b> <%:Html.Label("PublishData:") %> </b><br />
			                                    &nbsp&nbsp <%=Model.book.PublishDate %> </p>
                                               <p><b> <%:Html.Label("Publisher:") %></b><br />
                                                &nbsp&nbsp <%=Model.book.Publisher %></p>
                                               <p><b> <%:Html.Label("Price:") %></b><br />
                                                &nbsp&nbsp <%=Model.book.Price %></p>
		                                    </div> 
	                                    </li> 
	                                    <li> 
		                                    <div class="ui-accordion-left"></div> 
		                                    <a class="ui-accordion-link acc1" id="getBookmark"><b>Bookmark</b>
			                                    <span class="ui-accordion-right"></span></a> 
		                                    <div id = "bookmark_content">                                
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
                                           <img class="imagebutton" alt="previous" onclick = "previous()" src="/images/arrow_left_green_48.png" />
                                        </div>
                                    </td>
                                    <td>                                       
                                        <%=Html.TextBox("pageIndex",Model.pageIndex) %>
                                        <%=Html.Label("/"+Model.book.TotalPages.ToString() + " Pages")%>
                                        <input type="submit" value="Go" />
                                        
                                    </td>
                                    <td>
                                        <div id="nextbutton">                                    
                                            <img onclick="next()" class="imagebutton" alt="next" src="/images/arrow_right_green_48.png" />                     
                                        </div>
                                    </td>
                                    <td>
                                        <input id = "bookmark" type = "button" value="bookmark"/>
                                        <input id = "note" type = "button" value="note"/> 
                                        <img id = "scroll" src="/images/12-em-plus.png" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="bookcontent">
                            <img id="book" height="1035px" width="800px" alt="loading" oncontextmenu="return false;" src="<%=Model.pageURL%>"  />
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

        <script language="javascript" type="text/javascript">         

            var pageNumGlobal;
            var bookURLGlobal;
            var totalPagesGlobal;
            var regex = /\{[0-9]+\}/;
            var ajaxUrl;
            var ajaxUrl2;
            var firstClick = true;
            var x = 10;  
	        var y = 20;

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
                else{
                    pageNumGlobal = 1;
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

                    $("#bookmark").click( function() {
                            GetURL();
                            $.get( ajaxUrl,
                            function(data, textStatus){ alert("succeed");} );
                    });

                    $("#note").click(function(){
                            $("#toolbar").append("<input id=\"note2\" type = \"text\" />");});

	                    $("#acc1").accordion({
		                    alwaysOpen: false,
		                    autoheight: false,
		                    header: 'a.acc1',
		                    clearStyle: true
	                    });

                        $("#getBookmark").click(function () {
                                    $.getJSON( ("/bookview/getbookmark?bookid=" +  <%=Model.book.ID %>),
                                    function(data){ 
                                                    var temp = "";
                                                    for( var i = 0; i<data.length; ++i){
                                                        temp = temp + "<p >"+data[i].createtime+"  page:<a href = \"javascript:gotoPage("+data[i].pageNum+")\">"+data[i].pageNum +">></a></p>";
                                                    }
                                                    $("#bookmark_content").text("");
                                                   $("#bookmark_content").append(temp);
                                                 } );
                                    }); 


	                $("#mark").mouseover(function(e){
       	                this.myTitle = "test";
		                this.title = "";	
	                    var tooltip = "<div id='tooltip'>"+ "123412" +"<\/div>"; //创建 div 元素
		                $("body").append(tooltip);	//把它追加到文档中
		                $("#tooltip")
			                .css({
				                "top": (e.pageY+y) + "px",
				                "left": (e.pageX+x)  + "px"
			                }).show("fast");	  //设置x坐标和y坐标，并且显示
                    });
                    $("#mark").mouseout(function(){		
		                this.title = this.myTitle;
		                $("#tooltip").remove();   //移除 
                    });

                    $("#mark").mousemove(function(e){
		                $("#tooltip")
			                .css({
				                "top": (e.pageY+y) + "px",
				                "left": (e.pageX+x)  + "px"});
			                });
                       
                    } );

            function GetURL(){
                ajaxUrl = "/bookview/addbookmark?bookid=" +  <%=Model.book.ID %> + "&pageNum=" + pageNumGlobal;
                }

            function gotoPage( pageNum ) {
                document.getElementById("book").src = bookURLGlobal.replace(regex,pageNum);
                document.getElementById("pageIndex").value = pageNum;
                pageNumGlobal = pageNum;
                }      
                                          
   </script>
</asp:Content>
