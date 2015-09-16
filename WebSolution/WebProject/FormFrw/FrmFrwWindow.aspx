<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Register.Master" AutoEventWireup="true"
    CodeBehind="FrmFrwWindow.aspx.cs" Inherits="WebProject.FormFrw.FrmFrwWindow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwWindowBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdWindow"/>
            <KP:KPFormItemText FieldName="WindowTitle" Width="200" IsRequired="true" Mask="ALPHANUMERIC" />
            <KP:KPFormItemText FieldName="WindowDescription" Width="300" Mask="ALPHANUMERIC" />
            <KP:KPFormItemText FieldName="WindowPath" Width="516" IsRequired="true" Mask="ALPHANUMERIC" />
            <KP:KPFormItemCombo ID="IdWindowEnum" FieldName="WindowEnum" Width="210" IsRequired="true" OnKPEventGetComboItems="IdWindowEnum_KPEventGetComboItems" />
            <KP:KPFormItemText FieldName="WindowAlias" Width="100" Mask="ALPHANUMERIC" />
            <KP:KPFormItemText FieldName="WindowWidth" Width="80" Mask="INTEGER" />
            <KP:KPFormItemText FieldName="WindowHeight" Width="80" Mask="INTEGER" />
        </KPColumnsModel>
    </KP:KPFormControl>
</asp:Content>
