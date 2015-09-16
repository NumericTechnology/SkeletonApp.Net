<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFrwParamView.aspx.cs"
    MasterPageFile="~/Master/View.Master" Inherits="WebProject.FrmFrwParamView" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadView" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControl" TypeEntityNamespace="KPEntity.ORM.FrwParam" EnableDelete="false"
        EnableEdit="false" EnableNew="false" runat="server" PageFormUrl="FrmFrwParam.aspx"
         WidthForm="395" HeightForm="330">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdParam" Width="300" />
            <KP:KPColumnModel FieldName="Description" Width="400" />
            <KP:KPEntityModel FieldName="objIdDatatype" FieldNameDescription="TypeName" Width="150" />
            <KP:KPBooleanModel FieldName="IsEditable" Width="80" />
            <KP:KPColumnModel FieldName="DefaultValue" Width="150" />
            <KP:KPBooleanModel FieldName="IsCompanyRequired" Width="110" />
            <KP:KPColumnModel FieldName="Regex" Width="150" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>
