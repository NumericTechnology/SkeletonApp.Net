<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwReleaseView.aspx.cs" 
MasterPageFile="~/Master/View.Master" Inherits="WebProject.FrmFrwReleaseView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControl" TypeEntityNamespace="KPEntity.ORM.FrwRelease"
        runat="server" PageFormUrl="FrmFrwRelease.aspx" EnableDelet="false" EnableEdit="false" EnableNew="false" >
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdRelease" Width="100" />
            <KP:KPColumnModel FieldName="Block" Width="400" />
            <KP:KPColumnModel FieldName="UserExec" Width="400" />
            <KP:KPColumnModel FieldName="KeyDatabase" Width="400" />
            <KP:KPColumnModel FieldName="DateUpdated" Width="400" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>