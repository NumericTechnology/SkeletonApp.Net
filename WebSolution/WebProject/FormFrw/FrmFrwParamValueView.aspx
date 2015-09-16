<%@ Page Title="" Language="C#" MasterPageFile="~/Master/View.Master" AutoEventWireup="true"
    CodeBehind="FrmFrwParamValueView.aspx.cs" Inherits="WebProject.FormFrw.FrmFrwParamValueView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyView" runat="server">
    <KP:KPGridControl ID="KPGridControl1" TypeEntityNamespace="KPEntity.ORM.FrwParamValue"
        HeightForm="215" WidthForm="425" runat="server" PageFormUrl="FrmFrwParamValue.aspx"
        EnableNew="false" EnableDelete="false">
        <KPItemsModel>
            <KP:KPColumnModel FieldName="IdParamValue" Width="50" />
            <KP:KPEntityModel FieldName="objIdParam" FieldNameDescription="IdParam" HeaderName="Parâmetro"
                Width="150" />
            <KP:KPEntityModel FieldName="objIdParam" FieldNameDescription="Description" HeaderName="Label_Descricao"
                Width="300" />
            <KP:KPColumnModel FieldName="Value" HeaderName="Valor" Width="450" />
        </KPItemsModel>
    </KP:KPGridControl>
</asp:Content>
