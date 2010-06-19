<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Buy
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Purchase :<%= Model.book.Title %>
    </h2>
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
                        <div>
                            <%:Model.book.Description%></div>
                        <div>
                            <% if (!Model.customer.HasFaved(Model.book.ID))
                               { %>
                            <%= Html.ActionLink("Add to favourite","Favourite","Bookinfo",new {bookid = Model.book.ID},new{}) %>
                            <%} %>
                        </div>
                    </div>
                </td>
                <td>
                    <%=Html.ValidationSummary() %>
                    <h3>
                        <%=Html.Label("User name : ") %>
                        <%=Html.Encode(Model.customer.UserName) %>
                        <br />
                        <%=Html.Label("Current Balance : ") %>
                        <%=Html.Encode(Model.customer.CurrentMoney.ToString("C")) %><br />
                    </h3>
                    <%=Html.ActionLink("Recharge my account", "Balance", "UserCenter", new { }, new { })%>
                    <% using (Html.BeginForm())
                       { %>
                    <input type="submit" value="Buy" />
                    <%} %>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Content/BookInfo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        h3
        {
            color: #0253a2;
        }
        a</style>
</asp:Content>
