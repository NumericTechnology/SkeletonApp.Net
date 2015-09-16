<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Register.Master" AutoEventWireup="true"
    CodeBehind="FrmFrwCompany.aspx.cs" Inherits="WebProject.FrmFrwCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwCompanyBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdCompany"/>
            <KP:KPFormItemText FieldName="CompanyName" Width="370" IsRequired="true"/>
            <KP:KPFormItemText FieldName="CompanyFantasyName" Width="250" IsRequired="true"/>
            <KP:KPFormItemText FieldName="Phone" Mask="TELEPHONE" Width="105" />
        </KPColumnsModel>
    </KP:KPFormControl>
</asp:Content>
