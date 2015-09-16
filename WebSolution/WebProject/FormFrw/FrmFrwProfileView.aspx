<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/View.Master"
    CodeBehind="FrmFrwProfileView.aspx.cs" Inherits="WebProject.FormFrw.FrmFrwProfileView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControlFrwProfile" TypeEntityNamespace="KPEntity.ORM.FrwProfile"
        runat="server" PageFormUrl="FrmFrwProfile.aspx" HeightForm="150" WidthForm="325">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdProfile" Width="100" />
            <KP:KPColumnModel FieldName="Description" Width="300" />
        </KPItemsModel>
        <KPButtonsModel>
            <KP:KPViewButtonSimple ID="BtnRelacionarUsuario" Title="Translate_ButtonUserRelationship" OnClick="BtnRelacionarUsuario_Click" />
            <KP:KPViewButtonSimple ID="BtnRelacionarTela" Title="Translate_ButtonWindowRelationship" OnClick="BtnRelacionarTela_Click" />
        </KPButtonsModel>
    </KP:KPGridControl>
</asp:Content>

