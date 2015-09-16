<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwParam.aspx.cs" 
MasterPageFile="~/Master/Register.Master" Inherits="WebProject.FrmFrwParam" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwParamBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdParam" />
            <KP:KPFormItemZoom FieldName="objIdDatatype" Width="30" DescriptionWidth="270" ZoomIDConfig="ZoomobjIdDatatype" IsRequired="true" />
            <KP:KPFormItemCheckBox FieldName="IsEditable" Width="150" />
            <KP:KPFormItemCheckBox FieldName="IsCompanyRequired" Width="150" />
            <KP:KPFormItemText FieldName="DefaultValue" Width="350" />
            <KP:KPFormItemText FieldName="Regex" Width="350" />
            <KP:KPFormItemText FieldName="Description" Width="350" IsRequired="true" />
        </KPColumnsModel>
        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomobjIdDatatype" TypeEntityNamespace="KPEntity.ORM.FrwDatatype" WindowTitle="Tipo de Dados"
            FieldReturnId="IdDatatype" FieldReturnText="TypeName" WidthZoom="350" HeightZoom="220">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdDatatype" Width="50" />
                    <KP:KPColumnModel FieldName="TypeName" Width="200" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>
    </KP:KPFormControl>
</asp:Content>
