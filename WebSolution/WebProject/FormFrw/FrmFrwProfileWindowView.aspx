<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwProfileWindowView.aspx.cs" 
MasterPageFile="~/Master/View.Master" Inherits="WebProject.FrmFrwProfileWindowView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControl" TypeEntityNamespace="KPEntity.ORM.FrwProfileWindow"
        runat="server" PageFormUrl="FrmFrwProfileWindow.aspx">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdProfileWindow" Width="100" />
            <KP:KPEntityModel FieldName="objIdCompany" Width="400" />
            <KP:KPEntityModel FieldName="objIdWindow" Width="400" />
            <KP:KPEntityModel FieldName="objIdProfile" Width="400" />
            <KP:KPBooleanModel FieldName="IsPreview" Width="100" />
            <KP:KPBooleanModel FieldName="IsReadOnly" Width="100" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>