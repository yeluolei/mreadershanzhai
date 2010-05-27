<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <form runat="server">
    <h2>Balance</h2>
    <label>User Name : </label>
    <%=Html.Label(Model.Customer.UserName) %><br />
    <label>Current Balance : </label>
    <%=Html.Label(Convert.ToDouble(Model.Customer.CurrentMoney).ToString()) %><br />

    <%=Html.LabelFor(m =>m.MoneyToAdd) %>
    <%=Html.TextBoxFor(model=>model.MoneyToAdd) %><br />
    <input type="submit" value="Add Money" /><br />
    <%=Html.Label( Model.Message) %>
    </form>

</asp:Content>
