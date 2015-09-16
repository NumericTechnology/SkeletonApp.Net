<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwDatatype.aspx.cs" 
MasterPageFile="~/Master/Register.Master" Inherits="WebProject.FrmFrwDatatype" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwDatatypeBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdDatatype" Width="100" />
            <KP:KPFormItemText FieldName="TypeName" Width="250" IsRequired="true" />
        </KPColumnsModel>
    </KP:KPFormControl>
</asp:Content>
