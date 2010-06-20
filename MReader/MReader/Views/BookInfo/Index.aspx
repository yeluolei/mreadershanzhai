<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Model.book.Title %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Content/BookInfo.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        $(function () {
            $("#button a").button();
            $("#favouritelist a").button();
        })
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
                        </table>
                        <div id="button" class = "forbutton">
                            <%if (Model.customer.HasBought(Model.book.ID))
                              {%>
                            <%: Html.ActionLink("Read", "ViewBook", "BookView", new { id = Model.book.ID }, new { })%>
                            <% }%>
                            <%else
                                { %>
                            <%:Html.ActionLink("Buy", "Buy", new { bookid = Model.book.ID })%>
                            <%}%>
                        </div>
                        <div>
                            <%:Model.book.Description%></div>
                        <div id = "favouritelist" class ="forbutton" >
                            <% if (!Model.customer.HasFaved(Model.book.ID))
                               { %>
                            <%= Html.ActionLink("Add to favourite","Favourite","Bookinfo",new {bookid = Model.book.ID},new{}) %>
                            <%} %>
                            <% else
                                {
                            %>
                            This book is in your
                            <%=Html.ActionLink("favourite list","favourite","usercenter",new{},new{}) %>.
                            <%} %>
                        </div>
                    </div>
                </td>
                <td>
                    <div>
                        <p>
                            <%=Model.book.rate1 %>
                            people rated the book as 1 star</p>
                        <p>
                            <%=Model.book.rate2 %>
                            people rated the book as 2 star</p>
                        <p>
                            <%=Model.book.rate3 %>
                            people rated the book as 3 star</p>
                        <p>
                            <%=Model.book.rate4 %>
                            people rated the book as 4 star</p>
                        <p>
                            <%=Model.book.rate5 %>
                            people rated the book as 5 star</p>
                        <p>
                            Average rating is
                            <%=Model.book.averageRating.ToString() %>
                            stars.</p>
                        <% if (!Model.customer.HasRated(Model.book.ID))
                           { %>
                        <label>
                            rate as
                        </label>
                        <%= Html.ActionLink("1 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 1},new{})%>
                        <%= Html.ActionLink("2 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 2},new{})%>
                        <%= Html.ActionLink("3 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 3},new{})%>
                        <%= Html.ActionLink("4 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 4},new{})%>
                        <%= Html.ActionLink("5 ","rate","bookinfo",new{bookid = Model.book.ID,rating = 5},new{})%>
                        <label>
                            stars.</label>
                        <%} %>
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
                            Comment</center>
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
                    <%:Html.Hidden("id", Model.book.ID)%>
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
                    <%:Html.TextArea("RemarkContent")%>
                    <input class="comment" type="submit" value="Leave a comment" />
                    <%} %>
                </td>
                <td class="buyers">
                    <div class="topBar">
                        <center>
                            Sale History
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
