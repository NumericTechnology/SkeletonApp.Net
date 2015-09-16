<%@ Page Title="" Language="C#" MasterPageFile="~/Master/View.Master" AutoEventWireup="true"
    CodeBehind="FrmFrwUserView.aspx.cs" Inherits="WebProject.FrmFrwUserView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControlUser" TypeEntityNamespace="KPEntity.ORM.FrwUser"
        runat="server" PageFormUrl="FrmFrwUser.aspx" 
        WidthForm="495" HeightForm="360">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdUser" Width="100" Sortable="true"  Visible="false"/>
            <KP:KPColumnModel FieldName="UserLogin" Width="200" />
            <KP:KPColumnModel FieldName="UserFullName" Width="200" />
            <KP:KPEntityModel FieldName="objIdCompany" FieldNameDescription="CompanyFantasyName" Width="200" />
            <KP:KPColumnModel FieldName="Phone" Mask="TELEPHONE" Width="105"/>
            <KP:KPColumnModel FieldName="Email" Width="200" />
            <KP:KPBooleanModel FieldName="RedefinePswdNextLogin" Width="115" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>
