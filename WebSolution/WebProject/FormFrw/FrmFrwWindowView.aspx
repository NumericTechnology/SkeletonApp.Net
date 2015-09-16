<%@ Page Title="" Language="C#" MasterPageFile="~/Master/View.Master" AutoEventWireup="true"
    CodeBehind="FrmFrwWindowView.aspx.cs" Inherits="WebProject.FormFrw.FrmFrwWindowView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControl1" TypeEntityNamespace="KPEntity.ORM.FrwWindow"
        runat="server" PageFormUrl="FrmFrwWindow.aspx" RowNum="RowsView_100" 
        WidthForm="545" HeightForm="200" EnableDelete="false">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdWindow" Width="120"/>
            <KP:KPColumnModel FieldName="WindowTitle" Width="250" />
            <KP:KPColumnModel FieldName="WindowAlias" Width="100" />
            <KP:KPColumnModel FieldName="WindowDescription" Width="380" />
            <KP:KPColumnModel FieldName="WindowPath" Width="400" />
            <KP:KPColumnModel FieldName="WindowEnum" Width="220" />
            <KP:KPColumnModel FieldName="WindowWidth" Width="60" />
            <KP:KPColumnModel FieldName="WindowHeight" Width="60" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>
