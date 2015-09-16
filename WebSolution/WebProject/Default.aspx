<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Base.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebProject.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <KP:KPAssetLoader runat="server" Source="~/Assets/Styles/Themes/Default/KPMenu.css" Type="STYLESHEET" />
    <KP:KPAssetLoader runat="server" Source="~/Assets/Styles/Themes/Default/KPTab.css" Type="STYLESHEET" />
    <KP:KPAssetLoader runat="server" Source="~/Assets/Scripts/JQuery/jquery.menu-aim.js" Type="JAVASCRIPT" />
    <KP:KPAssetLoader runat="server" Source="~/Assets/Scripts/Themes/Default/KPMenu.js" Type="JAVASCRIPT" />
    <KP:KPAssetLoader runat="server" Source="~/Assets/Scripts/Themes/Default/KPTab.js" Type="JAVASCRIPT" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentMenu" runat="server">
    <KP:KPMenuControl ID="KPMenuControl1" Title="Menu" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FormBody" runat="server">
    <KP:KPTabControl ID="KPTabControl1" runat="server" DashboardTitle="Translate_Dashboard" DashboardUrl="/Dashboard.aspx" />
    <%--<KP:KPTabControl ID="KPTabControl1" runat="server" />--%>

    <script type="text/javascript">
        $(function () {
            $(".MainMenuBar").KPMenu();
            $("#KPTabControl").KPTab({}, true);
            $(this).tooltip({ position: { my: "center top", at: "center bottom+5" }, show: { duration: "fast" } });
            //addNewTab("KPTabControl", "Fluxograma", "DashboardFluxogramaPDCA.aspx");
        });

    </script>
</asp:Content>
