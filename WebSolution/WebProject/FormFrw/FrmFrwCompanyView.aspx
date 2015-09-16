<%@ Page Title="" Language="C#" MasterPageFile="~/Master/View.Master" AutoEventWireup="true"
    CodeBehind="FrmFrwCompanyView.aspx.cs" Inherits="WebProject.FrmFrwCompanyView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl runat="server" ID="KPGridControlUser" TypeEntityNamespace="KPEntity.ORM.FrwCompany"
        PageFormUrl="FrmFrwCompany.aspx" WidthForm="400" HeightForm="155">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdCompany" Width="100" />
            <KP:KPColumnModel FieldName="CompanyName" Width="400" />
            <KP:KPColumnModel FieldName="CompanyFantasyName" Width="400" />
            <KP:KPColumnModel FieldName="Phone" Mask="TELEPHONE" Width="105" />
        </KPItemsModel>
        <KPButtonsModel>
            <KP:KPViewButtonSimple ID="ActionUserRelationship" Title="Translate_ButtonUserRelationship" OnClick="ActionUserRelationship_Click" />
        </KPButtonsModel>
    </KP:KPGridControl>
</asp:Content>
