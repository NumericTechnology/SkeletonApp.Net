<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Register.Master" CodeBehind="FrmFrwProfile.aspx.cs" Inherits="WebProject.FormFrw.FrmFrwProfile" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwProfileBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdProfile" Width="100" />
            <KP:KPFormItemText FieldName="Description" Width="300" IsRequired="true" />
        </KPColumnsModel>
    </KP:KPFormControl>
</asp:Content>


