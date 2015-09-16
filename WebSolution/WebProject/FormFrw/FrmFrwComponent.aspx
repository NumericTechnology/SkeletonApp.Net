<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwComponent.aspx.cs"
    MasterPageFile="~/Master/Register.Master" Inherits="WebProject.FrmFrwComponent" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadRegister" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="FormRegisterBody" runat="server">
    <KP:KPFormControl runat="server" ID="formControl" TypeBONamespace="KPBO.FrwComponentBO">
        <KPColumnsModel>
            <KP:KPFormItemKey FieldName="IdComponent" Width="100" />
            <KP:KPFormItemZoom FieldName="objIdWindow" Width="50" DescriptionWidth="280" ZoomIDConfig="ZoomobjIdWindow" IsRequired="true" />
            <KP:KPFormItemText FieldName="ComponentNameId" Width="175" IsRequired="true" />
            <KP:KPFormItemText FieldName="TranslateKeyName" Width="175" IsRequired="true" />
            <KP:KPFormItemText FieldName="Description" Width="367" MultiLine="true" Height="80" />
        </KPColumnsModel>
        <KPFormZoomConfig>
            <KP:KPFormZoomModel ZoomID="ZoomobjIdWindow" TypeEntityNamespace="KPEntity.ORM.FrwWindow" WindowTitle="Translate_ZoomWindowTitleWindow"
                FieldReturnId="IdWindow" FieldReturnText="WindowTitle" WidthZoom="330" HeightZoom="220">
                <KPZoomFieldsConfig>
                    <KP:KPColumnModel FieldName="IdWindow" Width="50" />
                    <KP:KPColumnModel FieldName="WindowTitle" Width="150" />
                    <KP:KPColumnModel FieldName="WindowDescription" Width="200" />
                </KPZoomFieldsConfig>
            </KP:KPFormZoomModel>
        </KPFormZoomConfig>
    </KP:KPFormControl>
</asp:Content>
