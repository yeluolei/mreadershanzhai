<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserCenter/UserCenter.Master" Inherits="System.Web.Mvc.ViewPage<MReader.Models.CustomerFormModel>" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<h2>Account Information</h2>
    <label >Name : </label> 
    <%=Html.Label(Model.Customer.UserName) %><br />
    <label>Remaining Money : </label> 
    <div>
    <%=Model.Customer.CurrentMoney.ToString("c")%></div>
    <label>Date Registered : </label>
    <%=Html.Label(Model.Customer.DateRegistered.ToString()) %><br />
    <label>User Level : </label>
    <%=Html.Label(Model.Customer.UserLevel.ToString() )%><br />
</asp:Content>
 