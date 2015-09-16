<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Register.Master" AutoEventWireup="true"
    CodeBehind="FrmFrwParamValue.aspx.cs" Inherits="WebProject.FrmFrwParamValue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadRegister" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwParamValueBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdParamValue" />
            <KP:KPFormItemEntity ID="objParamIdParam" FieldName="objIdParam" FieldNameDescription="IdParam" Title="Parâmetro" Width="400" />
            <KP:KPFormItemEntity ID="objParamDescription" FieldName="objIdParam" FieldNameDescription="Description" Title="Label_Descricao" Width="400" />
            <KP:KPFormItemText Title="Valor" FieldName="Value" Width="400" IsRequired="true" />
        </KPColumnsModel>
    </KP:KPFormControl>
</asp:Content>
