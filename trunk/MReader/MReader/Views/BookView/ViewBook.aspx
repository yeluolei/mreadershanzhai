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
        <div id="titlebar">
            <h2 id="title">
                <%=Model.book.Title %></h2>
        </div>
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
                                    <li>
                                        <%=Html.ActionLink("Leave a comment","Index","BookInfo",
                                               new {bookid = Model.book.ID},new{}) %></li>
                                    <li>
                                        <label>
                                            Average Rating :</label><br />
                                        <input type="radio" class="star" id="stara" />
                                        <input type="radio" class="star" id="stara" />
                                        <input type="radio" class="star" id="stara" />
                                        <input type="radio" class="star" id="stara" />
                                        <input type="radio" class="star" id="stara" /></li>
                                </ul>
                            </div>
                            <div id="bookprofile">
                                <h3>
                                    <a href="#">Book Information</a></h3>
                                <div>
                                    <p>
                                        <b>
                                            <%:Html.Label("Title:") %></b>
                                        <br />
                                        &nbsp&nbsp
                                        <%=Model.book.Title %></p>
                                    <p>
                                        <b>
                                            <%:Html.Label("Author:") %></b><br />
                                        &nbsp&nbsp
                                        <%=Model.book.Author %></p>
                                    <p>
                                        <b>
                                            <%:Html.Label("PublishData:") %>
                                        </b>
                                        <br />
                                        &nbsp&nbsp
                                        <%=Model.book.PublishDate %>
                                    </p>
                                    <p>
                                        <b>
                                            <%:Html.Label("Publisher:") %></b><br />
                                        &nbsp&nbsp
                                        <%=Model.book.Publisher %></p>
                                    <p>
                                        <b>
                                            <%:Html.Label("Price:") %></b><br />
                                        &nbsp&nbsp
                                        <%=Model.book.Price %></p>
                                </div>
                                <h3 id="bookmarktitle">
                                    <a href="#" id="getBookmark">Bookmark</a></h3>
                                <div id="bookmark_content">
                                </div>
                            </div>
                            <%-- bookprofile--%>
                        </div>
                    </td>
                    <td>
                        <div id="toolbar">
                            <table>
                                <tr>
                                    <td>
                                        <div id="previousbutton">
                                            <img class="imagebutton" alt="previous" onclick="previous()" src="/images/arrow_left_green_48.png" />
                                        </div>
                                    </td>
                                    <td>
                                        <%=Html.TextBox("pageIndex",Model.pageIndex) %>
                                        <%=Html.Label("/"+Model.book.TotalPages.ToString() + " Pages")%>
                                        <input id="go" type="submit" value="Go" />
                                    </td>
                                    <td>
                                        <div id="nextbutton">
                                            <img onclick="next()" class="imagebutton" alt="next" src="/images/arrow_right_green_48.png" />
                                        </div>
                                    </td>
                                    <td>
                                        <input id="bookmark" type="button" value="bookmark" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="bookcontent">
                            <img id="book" height="1035px" width="800px" alt="loading" oncontextmenu="return false;"
                                src="<%=Model.pageURL%>" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%}%>
    <div class="demo">
        <div id="dialog" title="Add Bookmark">
            <label>
                note:</label><input type="text" id="note2" /><br />
            <input type="button" id="submitnote" value="submit" />
        </div> 
         <div id="dialog2" title="Add Bookmark">
            <label>OK</label>
            <input type="button" id="Button1" value="submit" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="/Content/jquery.rating.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery.rating.js" type="text/javascript"></script>
    <link href="/Content/BookViewStyle.css" rel="stylesheet" type="text/css" />
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
            var tempTitle;

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
                        
                        $("#stara").rating("select", parseInt('<%=Model.book.averageRating %>'));
                        $("#stara").rating("disable");
                        $("#submitnote").click( function() {
                                GetURL();
                                $.get( ajaxUrl, function(data, textStatus){ /*alert("succeed");*/} );
                                $("#dialog").dialog("close");$("#dialog2").dialog("show");
                                getbookmarkJson();
                        });
                        $("#bookmark").click( function() {
                                $("#dialog").dialog("open");}
                                            );

                        $("#bookprofile").accordion({
	                        event: "mouseover"
                        });

                        $("#getBookmark").click(function(){
                                                        $.getJSON( ("/bookview/getbookmark?bookid=" +  <%=Model.book.ID %>),{},
                                            function(data){ 
                                                                var temp = "";
                                                                $("#bookmark_content").text("");
                                                                for( var i = 0; i<data.length; ++i)
                                                                {
                                                                    temp = "<div id =\""+data[i].ID +"\"><p id=\"mark\" title=\"" + data[i].note +"\" >"+data[i].createtime+"  page:<a href = \"javascript:gotoPage("+data[i].pageNum+")\">"+data[i].pageNum +">></a></p> <a onclick=\"deletebookmark(" +data[i].ID+","+ i + ")\">delete</a></div>";
                                                                    $("#bookmark_content").append(temp);
                                                                    $("#bookmark_content #mark").draggable({ revert: 'invalid' , containment: '#bookmark_content', scroll: false});
                                                                }                                                   
//                                                                $("#bookmark_content").after("<div class=\"deletebookmark\"></div>");
                                                                $("#deletebookmark").droppable()
                                                          } 
                                        );
//                                bindlable();
                        });
                        getbookmarkJson(); 
                        bindlable();
                        $("#dialog").dialog({autoOpen:false, show: 'blind', modal:true, height: 140, hide: 'explode'});
                        $("#dialog2").dialog({autoOpen:false, show: 'blind', modal:true, height: 140, hide: 'explode'});
                        $("#go").button();
                        $("#bookmark").button();
                        $("#submitnote").button();
//                        $("#bookmark").droppable({
//			                        activeClass: 'ui-state-hover',
//			                        hoverClass: 'ui-state-active',
//			                        drop: function(event, ui) {
//				                        $(this).addClass('ui-state-highlight');
//			                        }
//		                            });
                       
                    } );

            function GetURL(){
                ajaxUrl = "/bookview/addbookmark?bookid=" +  <%=Model.book.ID %> + "&pageNum=" + pageNumGlobal + "&note=" + $("#note2").val();
                }

            function gotoPage( pageNum ) {
                document.getElementById("book").src = bookURLGlobal.replace(regex,pageNum);
                document.getElementById("pageIndex").value = pageNum;
                pageNumGlobal = pageNum;
                Buttonvisible();
                }  
               
            function bindlable(){              
                $("#mark").live("mouseover", function(e){
       	                this.myTitle = this.title;
		                this.title = "a";	
	                    var tooltip = "<div id='tooltip'>"+ "<p><h3>note:</h3>"+this.myTitle +"</p><\/div>"; //创建 div 元素
		                $("body").append(tooltip);	//把它追加到文档中
		                $("#tooltip")
			                .css({
				                "top": (e.pageY+y) + "px",
				                "left": (e.pageX+x)  + "px"
			                }).show("fast");	  //设置x坐标和y坐标，并且显示
                    });   

                     $("#mark").live("mouseout",function(){		
		                this.title = this.myTitle;
		                $("#tooltip").remove();   //移除 
                    });

                    $("#mark").live("mousemove",function(e){
		                $("#tooltip")
			                .css({
				                "top": (e.pageY+y) + "px",
				                "left": (e.pageX+x)  + "px"});
			                });
              }

              function deletebookmark( id, cnt ){
                    $.get(("/bookview/deletebookmark?id=" + id),function(){ $("#"+id).remove(); });
                    
              }

              function getbookmarkJson(){ 
                                $.getJSON( ("/bookview/getbookmark?bookid=" +  <%=Model.book.ID %>),
                                            function(data){ 
                                                                var temp = "";
                                                                $("#bookmark_content").text("");
                                                                for( var i = 0; i<data.length; ++i)
                                                                {
                                                                    temp = "<div id =\""+data[i].ID +"\"><p id=\"mark\" title=\"" + data[i].note +"\" >"+data[i].createtime+"  page:<a href = \"javascript:gotoPage("+data[i].pageNum+")\">"+data[i].pageNum +">></a></p> <a onclick=\"deletebookmark(" +data[i].ID+","+ i + ")\">delete</a></div>";
                                                                    $("#bookmark_content").append(temp);
                                                                    $("#bookmark_content #mark").draggable({ revert: 'invalid' , containment: '#bookmark_content', scroll: false});
                                                                }                                                   
//                                                                $("#bookmark_content").after("<div class=\"deletebookmark\"></div>");
//                                                                $("#deletebookmark").droppable()
                                                          } 
                                        );
//                                bindlable();
                                    }
                                          
    </script>
</asp:Content>
