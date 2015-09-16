<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwParamListView.aspx.cs" 
MasterPageFile="~/Master/View.Master" Inherits="WebProject.FrmFrwParamListView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControl" TypeEntityNamespace="KPEntity.ORM.FrwParamList"
        runat="server" PageFormUrl="FrmFrwParamList.aspx">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdParamList" Width="100" />
            <KP:KPEntityModel FieldName="objIdCompany" Width="400" />
            <KP:KPEntityModel FieldName="objIdDatatype" Width="400" />
            <KP:KPEntityModel FieldName="objIdParam" Width="400" />
            <KP:KPColumnModel FieldName="Value" Width="400" />
            <KP:KPColumnModel FieldName="Description" Width="400" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>