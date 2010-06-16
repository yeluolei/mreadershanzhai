<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Model.book.Title %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Content/BookInfo.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Model.book.Title %></h2>
    <div class="book">
        <div class="bookcover">
            <img class="cover" alt="cover" src="<%=(Model.bookcover)%>" />
        </div>
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
                <div>
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
            
        </div>
    </div>
    <div class="behindBook">
        <table>
            <tr>
                <td class="remark">
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
                    <div>
                        Pages:</div>
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
