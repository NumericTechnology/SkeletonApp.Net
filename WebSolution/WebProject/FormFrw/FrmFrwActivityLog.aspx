<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Register.Master" CodeBehind="FrmFrwActivityLog.aspx.cs"
    Inherits="WebProject.FormFrw.FrmFrwActivityLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwActivityLogBO" EnableSave="false" OnKPEventAfterControlsCreated="formControl_KPEventAfterControlsCreated">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdActivityLog" Width="100" />
            <KP:KPFormItemText FieldName="DateAccess" Width="110" Mask="DATE" />
            <KP:KPFormItemZoom FieldName="objIdCompany" Width="50" Title="Empresa" DescriptionWidth="250" ZoomIDConfig="ZoomIdCompany" />
            <KP:KPFormItemZoom FieldName="objIdUser" Width="50" Title="Usuário" DescriptionWidth="250" ZoomIDConfig="ZoomIdUser" />
            <KP:KPFormItemZoom FieldName="objIdWindow" Width="50" Title="Tela" DescriptionWidth="360" ZoomIDConfig="ZoomIdWindow" />
            <KP:KPFormItemText FieldName="InternalIpv4Address" Width="350" />
            <KP:KPFormItemText FieldName="ExternalIpv4Address" Width="374" />
            <KP:KPFormItemText FieldName="InternalIpv6Address" Width="420" />
            <KP:KPFormItemText FieldName="ExternalIpv6Address" Width="420" />
            <KP:KPFormItemText FieldName="Description" Width="374" />
            <KP:KPFormItemText FieldName="SessionId" Width="200" />
        </KPColumnsModel>
        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomIdCompany" TypeEntityNamespace="KPEntity.ORM.FrwCompany"
                FieldReturnId="IdCompany" FieldReturnText="CompanyName" WidthZoom="300" HeightZoom="200"
                WindowTitle="Translate_ZoomCompany">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdCompany" Width="90" />
                    <KP:KPColumnModel FieldName="CompanyName" Width="300" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>

        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomIdUser" TypeEntityNamespace="KPEntity.ORM.FrwUser" PropertyCompanyEntity="objIdCompany"
                FieldReturnId="IdUser" FieldReturnText="UserFullName" WidthZoom="420" HeightZoom="250"
                WindowTitle="Translate_ZoomWindowTitleUser">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdUser" Width="90" />
                    <KP:KPColumnModel FieldName="UserFullName" Width="300" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>

        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomIdWindow" TypeEntityNamespace="KPEntity.ORM.FrwWindow"
                FieldReturnId="IdWindow" FieldReturnText="WindowTitle" WidthZoom="420" HeightZoom="250"
                WindowTitle="Translate_ZoomWindowTitleWindow">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdWindow" Width="90" />
                    <KP:KPColumnModel FieldName="WindowTitle" Width="300" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>
    </KP:KPFormControl>
</asp:Content>

