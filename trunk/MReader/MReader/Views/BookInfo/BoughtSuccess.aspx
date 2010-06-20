<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.BookInfoFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    BoughtSuccess
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Bought Success</h2>
    <div class="book">
        <table>
            <tr>
                <td class="bookcover">
                    <a href="/bookview/viewbook/<%=Model.book.ID.ToString()%>">
                        <img class="cover" alt="cover" src="<%=(Model.bookcover)%>" />
                    </a>
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
                        <table>
                            <tr>
                                <td>
                                    <h3>
                                        Brief Discription:</h3>
                                </td>
                                <td>
                                    <%:Model.book.Description%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td>
                    <div>
                        Congratulations
                        <h3>
                            <%=User.Identity.Name %></h3>
                        your successfully purchaseed a new book!</div>
                    <%-- NOTE: actionlink must *not* omit the last |new {}|
                    --%>
                    <div>
                        The new book is
                        <h3>
                            <%=Html.ActionLink(Model.book.Title, "ViewBook", "BookView", new { id = Model.book.ID, page = 0 }, new { })%></h3>
                        (<--click it's name to read)
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Content/BookInfo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".bookInfo tr td:first").css('width', '100px');
            $(".favourite").button();
        }
     )
    </script>
    <style type="text/css">
        h3
        {
            display: inline;
            color: #0253a2;
        }
    </style>
</asp:Content>
