<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestHAP._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div id="dvStock">

        <div class="form-inline">
            <input id="txtId" class=" form-control" type="text" placeholder="請輸入股票代號" />
            <%--<button id="btnGet" class="btn btn-default"><i class="icon-search"></i>取得</button>--%>
            <a id="btnGet" class="btn btn-default"><i class="icon-search">取得</i></a>
            <%--<input id="btnGet" class="btn btn-default" type="button" value="取得" />--%>
        </div>



        <table id="tblStock" class="table">
            <tr></tr>
            <tr></tr>
        </table>


    </div>
    <script type="text/javascript">
        $(function () {
            $("#btnGet").click(function () {

                if ($("#txtId").val() === "") {
                    alert("請輸入股票代號！！！");
                    $("#txtId").focus();
                    return;
                }
                $.ajax({
                    url: "<%=appURL()%>/api/Stock/" + $("#txtId").val(),
                    dataType: "json",
                    success: function (data) {
                        $("#tblStock td").remove();
                        $.each(data, function (index, value) {
                            $("#tblStock tr:first").append("<td>" + value.ColumnName + "</td>");
                            $("#tblStock tr:gt(0)").append("<td>" + value.ColumnValue + "</td>");
                        });

                        if (data.length === 0) {
                            alert("此股票代號不存在！！！");
                            $("#txtId").focus();
                        }
                    },
                    error: function (jqXHR, textStatus, error) {
                        alert(textStatus);
                    }
                });
            });

        });
    </script>
</asp:Content>
