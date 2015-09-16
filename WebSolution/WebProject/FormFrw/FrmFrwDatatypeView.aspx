<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwDatatypeView.aspx.cs"
    MasterPageFile="~/Master/View.Master" Inherits="WebProject.FrmFrwDatatypeView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControl" TypeEntityNamespace="KPEntity.ORM.FrwDatatype" WidthForm="280" HeightForm="100"
        runat="server" PageFormUrl="FrmFrwDatatype.aspx" EnableDelete="false">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdDatatype" Width="100" />
            <KP:KPColumnModel FieldName="TypeName" Width="400" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>
