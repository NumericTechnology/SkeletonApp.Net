<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwComponentView.aspx.cs" 
MasterPageFile="~/Master/View.Master" Inherits="WebProject.FrmFrwComponentView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControl" TypeEntityNamespace="KPEntity.ORM.FrwComponent"
        runat="server" PageFormUrl="FrmFrwComponent.aspx">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdComponent" Width="100" />
            <KP:KPEntityModel FieldName="objIdWindow" FieldNameDescription="WindowTitle" Width="250" />
            <KP:KPColumnModel FieldName="ComponentNameId" Width="250" />
            <KP:KPColumnModel FieldName="TranslateKeyName" Width="250" />
            <KP:KPColumnModel FieldName="Description" Width="500" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>