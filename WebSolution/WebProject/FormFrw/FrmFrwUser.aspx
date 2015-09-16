<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Register.Master" AutoEventWireup="true"
    CodeBehind="FrmFrwUser.aspx.cs" Inherits="WebProject.FrmFrwUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwUserBO" OnKPEventAfterLoad="formControl_KPEventAfterLoad">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdUser" Width="300" />
            <KP:KPFormItemText FieldName="UserLogin" Width="150" IsRequired="true" />
            <KP:KPFormItemText FieldName="UserFullName" Width="300" IsRequired="true" />
            <KP:KPFormItemText FieldName="Phone" Mask="TELEPHONE" Width="105" />
            <KP:KPFormItemText FieldName="Email" Width="345" />
            <KP:KPFormItemZoom FieldName="objIdCompany" Width="50" DescriptionWidth="265" ZoomIDConfig="ZoomIdCompany" />
            <KP:KPFormItemPassword FieldName="UserPassword" Width="100" />
            <KP:KPFormItemCheckBox FieldName="RedefinePswdNextLogin" Width="225" />
            <KP:KPFormItemCheckBox FieldName="IsAccessAllowed" Width="225" />
        </KPColumnsModel>
        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomIdCompany" TypeEntityNamespace="KPEntity.ORM.FrwCompany"
                FieldReturnId="IdCompany" FieldReturnText="CompanyFantasyName" WidthZoom="420" HeightZoom="250"
                WindowTitle="Translate_ZoomCompany">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdCompany" Width="60" />
                    <KP:KPColumnModel FieldName="CompanyFantasyName" Width="330" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>
    </KP:KPFormControl>
</asp:Content>
