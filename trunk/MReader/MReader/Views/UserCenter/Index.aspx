<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master"
    Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <h2>
        Account Information</h2>
    <label><h5>
        Name :
        <%=Html.Label(Model.Customer.UserName) %></h5>
    </label>
    <br />
    <br />
    <label>
        Remaining Money :
        <%=Model.Customer.CurrentMoney.ToString("c")%></label>
    <br />
    <label>
        Date Registered :
        <%=Html.Label(Model.Customer.DateRegistered.ToString()) %></label>
    <br />
    <label>
        User Level :
        <%=Html.Label(Model.Customer.UserLevel.ToString() )%></label>
    <br />
</asp:Content>
