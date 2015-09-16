<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwActivityLogView.aspx.cs" MasterPageFile="~/Master/View.Master"
    Inherits="WebProject.FormFrw.FrmFrwActivityLogView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControlFrwActivityLog" TypeEntityNamespace="KPEntity.ORM.FrwActivityLog" PropertyCompanyEntity="!"
        runat="server" PageFormUrl="FrmFrwActivityLog.aspx" EnableDelete="false" EnableEdit="false" EnableNew="false" RowNum="RowsView_100" OnKPEventOrder="KPGridControlFrwActivityLog_KPEventOrder">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdActivityLog" Width="50" Visible="false" />
            <KP:KPColumnModel FieldName="Login" Width="160" />
            <KP:KPEntityModel FieldName="objIdUser" Width="150" FieldNameDescription="UserFullName" />
            <KP:KPColumnModel FieldName="DateAccess" Width="120" Mask="DATEMINUTE" />
            <KP:KPColumnModel FieldName="Description" Width="450" />
            <KP:KPColumnModel FieldName="IPAddress" Width="100" />
            <KP:KPEntityModel FieldName="objIdWindow" Width="180" FieldNameDescription="WindowTitle" />
            <KP:KPEntityModel FieldName="objIdCompany" Width="200" FieldNameDescription="CompanyName" />
        </KPItemsModel>
        <KPButtonsModel>
            <KP:KPViewButtonSimple ID="ActionVisualize" Title="Translate_ButtonView" OnClick="ActionVisualize_Click" />
        </KPButtonsModel>
    </KP:KPGridControl>
</asp:Content>

