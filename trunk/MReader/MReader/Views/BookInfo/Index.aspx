<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Model.book.Title %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Content/BookInfo.css" rel="stylesheet" type="text/css" />
    <link href="/Content/jquery.rating.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery.rating.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".bookInfo tr td:first").css('width', '100px');
            $(".button a").button();
            $("#Buy").button();
            $(".favourite").button();

            $("#stara").rating("select", parseInt('<%=Model.book.averageRating %>') - 1);
            $("#stara").rating("disable");
            function runEffect() {
                //most effect types need no options passed by default
                var options = { to: { width: 100, height: 20} };
                //run the effect
                $("#RemarkContent").hide('scale', options, 500, callback);
            };

            //callback function to bring a hidden box back
            function callback() {
                setTimeout(function () {
                    $("#RemarkContent:hidden").removeAttr('style').hide().fadeIn();
                }, 1000);
            };


            //set effect from select menu value
            $(".comment").click(function () {
                runEffect();
                return true;
            }).button();
        }
    )
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Model.book.Title %></h2>
    <div class="book">
        <table>
            <tr>
                <td class="bookcover">
                    <img class="cover" alt="cover" src="<%=(Model.bookcover)%>" />
                </td>
                <td>
                    <div class="bookInfo">
                        <table>
                            <tr>
                                <td>
                                    Author :
                                </td>
                                <td>
                                    <%: Model.book.Author %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    ISBN:
                                </td>
                                <td>
                                    <%:Model.book.ISBN %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Publisher :
                                </td>
                                <td>
                                    <%:Model.book.Publisher %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Publisher date :
                                </td>
                                <td>
                                    <%:Model.book.PublishDate.ToShortDateString()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Price :
                                </td>
                                <td>
                                    <%: Model.book.Price.ToString("C") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="button">
                                        <%if (Model.customer.HasBought(Model.book.ID))
                                          {%>
                                        <%: Html.ActionLink("Read", "ViewBook", "BookView", new { id = Model.book.ID }, new { })%>
                                        <% }%>
                                        <%else
                                            { %>
                                        <%:Html.ActionLink("Buy", "Buy", new { bookid = Model.book.ID })%>
                                        <%}%>
                                    </div>
                                </td>
                                <td>
                                    <% if (!Model.customer.HasFaved(Model.book.ID))
                                       { %>
                                    <div class="favourite">
                                        <%= Html.ActionLink("Add to favourite","Favourite","Bookinfo",new {bookid = Model.book.ID},new{}) %>
                                    </div>
                                    <%} %>
                                    <% else
                                        {
                                    %>
                                    <h6>
                                        This book is in your
                                        <%=Html.ActionLink("favourite list","favourite","usercenter",new{},new{}) %>.
                                    </h6>
                                    <%} %>
                                </td>
                            </tr>
                        </table>
                        <div>
                            <%:Model.book.Description%></div>
                    </div>
                </td>
                <td>
                    <div>
                        <label>
                            <%=Model.book.rate1 %>
                            people rated
                        </label>
                        <br />
                        <input type="radio" name="star1" class="star" disabled="disabled" checked="checked" />
                        <input type="radio" name="star1" class="star" disabled="disabled" />
                        <input type="radio" name="star1" class="star" disabled="disabled" />
                        <input type="radio" name="star1" class="star" disabled="disabled" />
                        <input type="radio" name="star1" class="star" disabled="disabled" /><br />
                        <label>
                            <%=Model.book.rate2 %>
                            people rated
                        </label>
                        <br />
                        <input type="radio" name="star2" class="star" disabled="disabled" />
                        <input type="radio" name="star2" class="star" disabled="disabled" checked="checked" />
                        <input type="radio" name="star2" class="star" disabled="disabled" />
                        <input type="radio" name="star2" class="star" disabled="disabled" />
                        <input type="radio" name="star2" class="star" disabled="disabled" /><br />
                        <label>
                            <%=Model.book.rate3 %>
                            people rated
                        </label>
                        <br />
                        <input type="radio" name="star3" class="star" disabled="disabled" />
                        <input type="radio" name="star3" class="star" disabled="disabled" />
                        <input type="radio" name="star3" class="star" disabled="disabled" checked="checked" />
                        <input type="radio" name="star3" class="star" disabled="disabled" />
                        <input type="radio" name="star3" class="star" disabled="disabled" /><br />
                        <label>
                            <%=Model.book.rate4 %>
                            people rated
                        </label>
                        <br />
                        <input type="radio" name="star4" class="star" disabled="disabled" />
                        <input type="radio" name="star4" class="star" disabled="disabled" />
                        <input type="radio" name="star4" class="star" disabled="disabled" />
                        <input type="radio" name="star4" class="star" disabled="disabled" checked="checked" />
                        <input type="radio" name="star4" class="star" disabled="disabled" /><br />
                        <label>
                            <%=Model.book.rate5 %>
                            people rated
                        </label>
                        <br />
                        <input type="radio" name="star5" class="star" disabled="disabled" />
                        <input type="radio" name="star5" class="star" disabled="disabled" />
                        <input type="radio" name="star5" class="star" disabled="disabled" />
                        <input type="radio" name="star5" class="star" disabled="disabled" />
                        <input type="radio" name="star5" class="star" disabled="disabled" checked="checked" /><br />
                        <label>
                            Average rating
                        </label>
                        <br />
                        <input type="radio" name="stara" id="stara" class="star" />
                        <input type="radio" name="stara" id="stara" class="star" />
                        <input type="radio" name="stara" id="stara" class="star" />
                        <input type="radio" name="stara" id="stara" class="star" />
                        <input type="radio" name="stara" id="stara" class="star" /><br />   
                        <div>
                            <% if (!Model.customer.HasRated(Model.book.ID))
                               { %>
                            rate as
                            <%= Html.ActionLink("1 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 1},new{})%>
                            <%= Html.ActionLink("2 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 2},new{})%>
                            <%= Html.ActionLink("3 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 3},new{})%>
                            <%= Html.ActionLink("4 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 4},new{})%>
                            <%= Html.ActionLink("5 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 5},new{})%>
                            stars.
                            <%} %>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div class="behindBook">
        <table>
            <tr>
                <td class="remark">
                    <div class="topBar">
                        <center>
                            <h4 style="display: inline;">
                                Book</h4>
                        </center>
                    </div>
                    <%foreach (var remark in Model.paginatedRemarks)
                      { %>
                    <li>
                        <div class="bar">
                            <table>
                                <tr>
                                    <td class="user">
                                        <span>
                                            <%:Html.Encode(remark.RemarkUserName)%>
                                        </span>
                                    </td>
                                    <td class="time">
                                        <span>
                                            <%:Html.Encode(remark.RemarkTime.ToString())%></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <p>
                            <%:Html.Encode(remark.RemarkContent.ToString())%></p>
                    </li>
                    <%} %>
                    <% using (Html.BeginForm("Index", "BookInfo"))
                       {%>
                    <%:Html.Hidden("bookid", Model.book.ID)%>
                    <%:Html.Hidden("PageIndex",Model.pageIndex) %>
                    <%--上一页与下一页--%>
                    <% if (Model.HasPreviousPage)
                       { %>
                    <%= Html.ActionLink("PrePage",
                               "Index",
                               new { bookid = Model.book.ID, page = (Model.pageIndex - 1) }, new { })%>
                    <% } %>
                    <%for (int i = 0; i < Model.TotalPage(); i++)
                      {%>
                    <%= Html.ActionLink((i + 1).ToString(),
                               "Index",
                               new { bookid = Model.book.ID, page = i }, new { })%>
                    &nbsp;
                    <%} %>
                    <% if (Model.HasNextPage)
                       { %>
                    <%= Html.ActionLink("Next page",
                               "Index",
                               new { bookid = Model.book.ID, page = (Model.pageIndex + 1) }, new { })%>
                    <% } %>
                    <div id="remarkarea">
                        <%:Html.TextArea("RemarkContent")%>
                        <input class="comment" type="submit" value="Leave a comment" />
                        <%} %>
                    </div>
                </td>
                <td class="buyers">
                    <div class="topBar">
                        <center>
                            <h4 style="display: inline;">
                                Sale History</h4>
                        </center>
                    </div>
                    <%foreach (var buyer in Model.LatestBuyers)
                      { %>
                    <li>
                        <%:Html.Encode(buyer.BuyUserName) %>
                        Bought@
                        <%:Html.Encode(buyer.BuyTime.ToString()) %>
                    </li>
                    <%} %>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
