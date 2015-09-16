<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Register.Master" CodeBehind="FrmFrwMenu.aspx.cs" Inherits="WebProject.FormFrw.FrmFrwMenu" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwMenuBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdMenu" Width="100" />
            <KP:KPFormItemZoom FieldName="objIdParent" Width="100" DescriptionWidth="200" ZoomIDConfig="ZoomIdParent" />
            <KP:KPFormItemZoom FieldName="objIdWindow" Width="50" DescriptionWidth="200" ZoomIDConfig="ZoomIdWindow" />
            <KP:KPFormItemText FieldName="Sequence" Width="100" Mask="INTEGER" />
            <KP:KPFormItemText FieldName="WindowTitleMenu" IsRequired="true" Width="516" />
            <KP:KPFormItemText FieldName="ImageUrl" Width="401" />
            <KP:KPFormItemText FieldName="Height" Width="100" />
            <KP:KPFormItemText FieldName="Width" Width="100" Mask="INTEGER" />
            <KP:KPFormItemText FieldName="MinHeight" Width="100" Mask="INTEGER" />
            <KP:KPFormItemText FieldName="MinWidth" Width="100" Mask="INTEGER" />
            <KP:KPFormItemCombo FieldName="IsVisible" Width="90" NamespaceEnum="KPEnumerator.KPEntity.StateVisibleEnum" />
        </KPColumnsModel>
        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomIdWindow" TypeEntityNamespace="KPEntity.ORM.FrwWindow"
                FieldReturnId="IdWindow" FieldReturnText="WindowTitle" WidthZoom="450" HeightZoom="300"
                WindowTitle="Translate_ZoomWindowTitleWindow">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdWindow" Width="80" />
                    <KP:KPColumnModel FieldName="WindowTitle" Width="320" />
                    <KP:KPColumnModel FieldName="WindowEnum" Width="150" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
            <KP:KPFormZoomModel ZoomID="ZoomIdParent" TypeEntityNamespace="KPEntity.ORM.FrwMenu"
                FieldReturnId="IdMenu" FieldReturnText="WindowTitleMenu" WidthZoom="450" HeightZoom="300"
                WindowTitle="Translate_ZoomMenu">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdMenu" Width="80" />
                    <KP:KPColumnModel FieldName="WindowTitleMenu" Width="320" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>
    </KP:KPFormControl>
</asp:Content>
