<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/View.Master" CodeBehind="FrmFrwMenuView.aspx.cs" Inherits="WebProject.FormFrw.FrmFrwMenuView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControlFrwMenu" TypeEntityNamespace="KPEntity.ORM.FrwMenu"
        runat="server" PageFormUrl="FrmFrwMenu.aspx" RowNum="RowsView_100" HeightForm="410" WidthForm="660">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdMenu" Width="100" />
            <KP:KPEntityModel FieldName="objIdParent" FieldNameDescription="WindowTitleMenu" Width="200" />
            <KP:KPColumnModel FieldName="Sequence" Width="100" Mask="INTEGER" />
            <KP:KPColumnModel FieldName="WindowTitleMenu" Width="200" />
            <KP:KPEntityModel FieldName="objIdWindow" FieldNameDescription="WindowTitle" Width="250" />
            <KP:KPEnumModel FieldName="IsVisible" Width="60" NamespaceEnum="KPEnumerator.KPEntity.StateVisibleEnum" />
            <KP:KPColumnModel FieldName="Width" Width="60" Mask="INTEGER" />
            <KP:KPColumnModel FieldName="Height" Width="60" Mask="INTEGER" />
            <KP:KPColumnModel FieldName="MinWidth" Width="60" Mask="INTEGER" />
            <KP:KPColumnModel FieldName="MinHeight" Width="60" Mask="INTEGER" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>


