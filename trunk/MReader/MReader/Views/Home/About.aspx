<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About</h2>
    
    <div style=" margin-left:50px; margin-top:30px;font-size:140%;">
        This is a site produced by:<br />
        <a href="mailto:latioswang@yahoo.com.cn">王硕杰</a>
        <div>朱新宇</div>
        <div>叶宇翔</div>
        <div>孙海洋</div>
        <div>叶如锐</div>
        （排名不分先后，第一个除外）
        <p>Feel free to reach us.</p>
    </div>
</asp:Content>
