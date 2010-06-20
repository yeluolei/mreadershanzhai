<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<script type="text/javascript">
    $(function () {
        $(".money").button();
    }
)
</script>
    <form runat="server">    
    <h2>Balance</h2>
    <%=Html.ValidationSummary() %>
    <label>User Name : </label>
    <%=Html.Label(Model.Customer.UserName) %><br />
    <label>Current Balance :<%= Model.Customer.CurrentMoney.ToString("C") %> </label><br />
    <%=Html.LabelFor(m =>m.MoneyToAdd) %>
    <%=Html.TextBoxFor(model=>model.MoneyToAdd) %><br />
    <input class="money" type="submit" value="Add Money" /><br />
    <%=Html.Label( Model.Message) %>
    </form>

</asp:Content>
