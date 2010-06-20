<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.SiteIncomeFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Index</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <%=Html.Hidden("PageIndex",Model.PurchaseHistory.PageIndex) %>
        <%=Html.Hidden("PageSize",Model.PurchaseHistory.PageSize) %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.StartTime) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.StartTime, String.Format("{0:g}", Model.StartTime)) %>
            <%: Html.ValidationMessageFor(model => model.StartTime) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.EndTime) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.EndTime, String.Format("{0:g}", Model.EndTime)) %>
            <%: Html.ValidationMessageFor(model => model.EndTime) %>
        </div>
        <div class="editor-field">
            <b>TotalIncome </b>from <b>
                <%: Html.Encode(Model.StartTime.ToString())%></b> to<b>
                    <%=Html.Encode(Model.EndTime.ToString()) %></b>:
            <%= Html.Encode(Model.TotalIncome.ToString("C")) %>
            <%: Html.ValidationMessageFor(model => model.TotalIncome) %>
        </div>
        <p>
            <input class="Query" type="submit" value="Query" />
        </p>
    </fieldset>
    <% } %>
    <table width="100%">
        <tr>
            <th>
                Purchase Time
            </th>
            <th>
                Price
            </th>
            <th>
                UserName
            </th>
            <th>
                Book
            </th>
        </tr>
        <%foreach (var i in Model.PurchaseHistory)
          {%>
        <tr>
            <td>
                <%=Html.Encode(i.PurchaseTime.ToString())%>
            </td>
            <td>
                <%=Html.Encode(i.Price.ToString("c"))%>
            </td>
            <td>
                <%=Html.Encode(i.UserName)%>
            </td>
            <td>
                <%=Html.Encode(i.BookTitle) %>
            </td>
        </tr>
        <%} %>
    </table>
    <label>Pages:</label>
    <%for (int i = 0; i < Model.PurchaseHistory.TotalPages; i++)
      {%>
    <%if (i!=Model.PurchaseHistory.PageIndex) { %>
    <%=Html.ActionLink((i+1).ToString(), "Index",
            new { starttime = Model.StartTime, endtime = Model.EndTime, pageindex = 
                i,pagesize = Model.PurchaseHistory.PageSize })%>
    <%}else { %>
    <%=Html.Encode((i+1).ToString()) %>
    <%} %>
    <%} %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" language="javascript">
        $(function () {
            $(".Query").button();
        }
        )
    </script>
</asp:Content>
