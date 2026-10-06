<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master" AutoEventWireup="true" CodeBehind="popUpContrato.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Envio.popUpContrato" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
        <style type="text/css">
        .link {
            font-weight: normal;
            color: blue;
            font-size: 10px;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            text-align: left;
            vertical-align: middle;
            padding: 3px 4px 3px 4px;
            cursor: pointer;
            text-decoration:underline;
        }
            </style>
 <script language="javascript" type="text/javascript">
     function validarFiltros(objeto, args) {
         var caixaTextoNumContrato = document.getElementById('<%= caixaTextoNumContrato.ClientID %>');
            var caixaTextoNomeMutuario = document.getElementById('<%= caixaTextoNomeMutuario.ClientID %>');
            var caixaTextoNumMatricula = document.getElementById('<%= caixaTextoNumMatricula.ClientID %>');
            var caixaTextoCPF = document.getElementById('<%= caixaTextoCPF.ClientID %>');

            try {
                var possuiNumContrato = caixaTextoNumContrato.value != "";
                var possuiNomeMutuario = caixaTextoNomeMutuario.value != "";
                var possuiNumMatricula = caixaTextoNumMatricula.value != "";
                var possuiCPF = caixaTextoCPF.value != "";

                if (!possuiNumContrato && !possuiNomeMutuario && !possuiNumMatricula && !possuiCPF) {
                    args.IsValid = false;
                    return;
                }

                args.IsValid = true;
            }
            catch (e) {
                args.IsValid = false;
            }
     }

     function obtemContrato(numeroContrato)
     {         
         window.returnValue = numeroContrato;
         window.opener.returnValue = numeroContrato;
        window.close()
         localStorage.setItem("selecionado", numeroContrato);         

         //alert(numeroContrato);
         //if (window.opener) {                         
         //       window.opener.returnValue = numeroContrato;                     
         //}
         //window.returnValue = numeroContrato;                          
         
         //window.close();                 
     }

     function checkRadioBtn(id) {
         var gv = document.getElementById('<%=gridContratos.ClientID %>');

             for (var i = 1; i < gv.rows.length; i++) {
                 var radioBtn = gv.rows[i].cells[0].getElementsByTagName("input");

                 // Check if the id not same
                 if (radioBtn[0].id != id.id) {
                     radioBtn[0].checked = false;
                 }
             }
     }

 </script>
</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Pesquisa Contrato
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
     <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr style="padding-bottom: 10px;">
                    <td style="width: 370px; vertical-align: top;">
                        Nome do Mutuário:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoNomeMutuario" runat="server" Width="150px" MaxLength="60"></glw:CaixaTexto>
                        <div>
                            <glw:ValidadorFiltroPesquisa ID="filtroNomeMutuario" ControlToValidate="caixaTextoNomeMutuario"
                                nomeCampo="Nome do Mutuário" ValidationGroup="quitacao" runat="server"></glw:ValidadorFiltroPesquisa>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="validadorNomeMutuario" runat="server" ControlToValidate="caixaTextoNomeMutuario"
                                ValidationExpression="[A-Z a-z]*" ErrorMessage="O Nome contém caracteres inválidos."
                                Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="quitacao"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                    <td style="width: 370px; vertical-align: top;">
                        Matrícula:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoNumMatricula" runat="server" Width="100px" MaxLength="13"></glw:CaixaTexto>
                        <asp:DropDownList runat="server" ID="comboLike">
                        </asp:DropDownList>
                        <div>
                            <glw:ValidadorFiltroPesquisa ID="filtroNumMatricula" ControlToValidate="caixaTextoNumMatricula"
                                nomeCampo="Número de Matrícula" ValidationGroup="quitacao" runat="server"></glw:ValidadorFiltroPesquisa>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="validadorNumMatricula" runat="server" ControlToValidate="caixaTextoNumMatricula"
                                ValidationExpression="[0-9A-Za-z]*" ErrorMessage="O Número de Matrícula contém caracteres inválidos."
                                Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="quitacao"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                </tr>
                <tr style="padding-bottom: 10px;">
                    <td style="width: 305px; vertical-align: top;">
                        CPF:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoCPF" runat="server" Width="150px" MaxLength="18"></glw:CaixaTexto>
                        <div>
                            <glw:ValidadorFiltroPesquisa ID="filtroCPF" ControlToValidate="caixaTextoCPF" nomeCampo="CPF"
                                ValidationGroup="quitacao" runat="server"></glw:ValidadorFiltroPesquisa>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="validadorCPF" runat="server" ControlToValidate="caixaTextoCPF"
                                ValidationExpression="[0-9]*" ErrorMessage="O CPF contém caracteres inválidos."
                                Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="quitacao"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                    <td style="width: 280px; vertical-align: top;">
                        Nº. Contrato:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoNumContrato" runat="server" Width="158px" MaxLength="18"></glw:CaixaTexto>
                        <div>
                            <glw:ValidadorFiltroPesquisa ID="filtroNumContrato" ControlToValidate="caixaTextoNumContrato"
                                nomeCampo="Num. do Contrato" ValidationGroup="quitacao" runat="server"></glw:ValidadorFiltroPesquisa>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="validadorNumContrato" runat="server" ControlToValidate="caixaTextoNumContrato"
                                ValidationExpression="[0-9]*" ErrorMessage="O Num. do Contrato contém caracteres inválidos."
                                Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="quitacao"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                    <td style="width: 280px;" style="text-align: right; padding-right: 30px; vertical-align: top;">
                        <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="quitacao" OnClick="botaoProcurar_Click"
                            permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                        <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false"
                            runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro."
                            ClientValidationFunction="validarFiltros" ValidationGroup="quitacao"></asp:CustomValidator>
                        <!--WO6477-->
                        <asp:Label ID="caixaDataAtualizacao" runat="server" />
                    </td>
                </tr>
            </table>
        </glw:SecaoFormulario>
        <tr>
            <td class="posSecaoFormulario" style="text-align: center;">
                <glw:Grid ID="gridContratos" runat="server" Width="850px" DataKeyNames="numero" AllowSorting="true"                                   
                    OnRowDataBound="gridContratos_RowDataBound">
                    <Columns>
<%--                         <asp:TemplateField HeaderText="Select">
                               <ItemTemplate><asp:RadioButton ID="RowSelector" runat="server" GroupName="SelectGroup" onclick="checkRadioBtn(this);" /></ItemTemplate>
                        </asp:TemplateField>--%>
                        <glw:CampoEntidadeComplexa DataField="numero" HeaderText="Num. Contrato" ItemStyle-CssClass="link" ItemStyle-ForeColor="Blue"/>
                        <glw:CampoEntidadeComplexa DataField="mutuario.nome" HeaderText="Nome" />
                        <glw:CampoEntidadeComplexa DataField="mutuario.matricula" HeaderText="Matrícula" />
                        <glw:CampoEntidadeComplexa DataField="tipo.descricao" HeaderText="Tipo Contrato" />
                        <asp:TemplateField HeaderText="Dt. Assinatura" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <div class="campoDataGrid">
                                    <span>
                                        <%# DataBinder.Eval(Container.DataItem, "dataAssinatura", "{0:dd/MM/yyyy}")%></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>                       
                    </Columns>
                </glw:Grid>
                <asp:ObjectDataSource ID="dataSourceContratos" 
                    runat="server" 
                    SelectMethod="consultarContratosAtivos"
                    TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyContrato" 
                    SortParameterName="ordenacao"
                    StartRowIndexParameterName="indiceLinha" 
                    MaximumRowsParameterName="maximoLinhas"
                    SelectCountMethod="totalContratosAtivos" 
                    OnSelecting="dataSourceContratos_Selecting"
                    EnablePaging="true" 
                    EnableCaching="false">
                    <SelectParameters>
                        <asp:ControlParameter Name="numero" ControlID="caixaTextoNumContrato" PropertyName="Text"
                            Direction="Input" Type="Int64" />
                        <asp:ControlParameter Name="nome" ControlID="caixaTextoNomeMutuario" PropertyName="Text"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="matricula" ControlID="caixaTextoNumMatricula" PropertyName="Text"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input"
                            Type="String" />
                        <asp:ControlParameter Name="instrucaoLike" ControlID="comboLike" PropertyName="selectedValue"
                            Direction="Input" Type="String" />
                        <asp:ControlParameter Name="DataLimite" ControlID="caixaDataAtualizacao" PropertyName="Text"  Direction="Input" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
<%--         <tr>
             <td><br />
                 <glw:BotaoAcao runat="server" Text="Ok" urlDaImagem="~/Imagens/imgProcurar.png"  OnClick="botaoValidarCRM_Click" OnClientClick="obtemContrato(132456);"/>
                 <glw:BotaoOculto ID="botaoOcultoFecharModal" runat="server" OnClick="botaoOcultoFecharModal_Click" />
             </td>
         </tr>--%>
    </table>
    <glw:SumarioValidacao ID="sumario" ValidationGroup="quitacao" runat="server" />
    <br />
    
</asp:Content>
<asp:Content ID="contentRodape" runat="server" ContentPlaceHolderID="ConteudoRodape">
</asp:Content>
