<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/DialogoMestre.master"
    AutoEventWireup="true" CodeBehind="ListagemNovoAvalista.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.CicloNormal.Emprestimo.ListagemNovoAvalista" %>

<asp:Content ID="ConteudoAdicionalHead" runat="server" ContentPlaceHolderID="ConteudoAdicionalHead">
<script language="javascript" type="text/javascript">
        function validarFiltros(objeto, args)
        {
            var caixaTextoNome = document.getElementById('<%= caixaTextoNome.ClientID %>');
            var caixaTextoRazaoSocial = document.getElementById('<%= caixaTextoRazaoSocial.ClientID %>');
            var caixaTextoCPF = document.getElementById('<%= caixaTextoCPF.ClientID %>');
            
            try 
            {                                
                var possuiNome = caixaTextoNome.value != "";
                var possuiNumMatricula = caixaTextoRazaoSocial.value != "";
                var possuiCPF = caixaTextoCPF.value != "";
                
                if (!possuiNome && !possuiNumMatricula && !possuiCPF) 
                {
                    args.IsValid = false;
                    return;
                }

                args.IsValid = true;
            }
            catch (e)
            {                
                args.IsValid = false;
            }
        }
                
    </script>
</asp:Content>
<asp:Content ID="contentCabecalho" runat="server" ContentPlaceHolderID="ConteudoCabecalho">
    Avalista
</asp:Content>
<asp:Content ID="contentConteudo" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    <table cellpadding="0" cellspacing="0" border="0" class="secoesFormulario">
        <glw:SecaoFormulario ID="secaoPrincipal" tituloSecao="Filtros da Busca" expandeContraiSecao="true"
            runat="server">
            <table cellpadding="" cellspacing="0" border="0" width="100%">
                <tr style="padding-bottom: 10px;">                    
                    <td style="width: 405px; vertical-align: top;">
                        Nome:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoNome" runat="server" Width="300px" MaxLength="60"></glw:CaixaTexto>
                        <div>
                            <glw:ValidadorFiltroPesquisa ID="filtroNome" ControlToValidate="caixaTextoNome" nomeCampo="Nome"
                                ValidationGroup="emprestimo " runat="server"></glw:ValidadorFiltroPesquisa>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="caixaTextoNome"
                                ValidationExpression="[A-Z a-z]*" ErrorMessage="Nome contém caracteres inválidos."
                                Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimo"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                    
                    <td style="width: 350px; vertical-align: top;">
                        Razão Social:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoRazaoSocial" runat="server" Width="100px" MaxLength="13"></glw:CaixaTexto>
                        <asp:DropDownList runat="server" ID="comboLike">
                        </asp:DropDownList>
                        <div>
                            <glw:ValidadorFiltroPesquisa ID="filtroRazaoSocial" ControlToValidate="caixaTextoRazaoSocial"
                                nomeCampo="RazaoSocial" ValidationGroup="emprestimo" runat="server"></glw:ValidadorFiltroPesquisa>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="validadorRazaoSocial" runat="server" ControlToValidate="caixaTextoRazaoSocial"
                                ValidationExpression="[0-9A-Za-z]*" ErrorMessage="O Número de Matrícula contém caracteres inválidos."
                                Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimo"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                </tr>
                <tr style="padding-bottom: 10px;">
                    <td style="width: 305px; vertical-align: top;">
                        CPF ou CNPJ:&nbsp;
                        <glw:CaixaTexto ID="caixaTextoCPF" runat="server" Width="150px" MaxLength="18"></glw:CaixaTexto>
                        <div>
                            <glw:ValidadorFiltroPesquisa ID="filtroCPF" ControlToValidate="caixaTextoCPF" nomeCampo="CPF"
                                ValidationGroup="emprestimo" runat="server"></glw:ValidadorFiltroPesquisa>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="validadorCPF" runat="server" ControlToValidate="caixaTextoCPF"
                                ValidationExpression="[0-9]*" ErrorMessage="O CPF contém caracteres inválidos."
                                Text="Caracteres inválidos." SetFocusOnError="true" Display="Dynamic" ValidationGroup="emprestimo"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                    <td style="text-align: right; padding-right: 30px; vertical-align: bottom">
                        <glw:BotaoProcurar ID="botaoProcurar" runat="server" ValidationGroup="emprestimo"
                            OnClick="botaoProcurar_Click" permissoesExigidas="" Style="padding-top: 10px;"></glw:BotaoProcurar>
                        <glw:BotaoLimpar ID="botaoLimpar" OnClick="botaoLimpar_Click" CausesValidation="false"
                            runat="server" Style="padding-top: 10px;"></glw:BotaoLimpar>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:CustomValidator ID="validadorFiltros" runat="server" Display="Dynamic" ErrorMessage="Selecione ao menos um filtro."
                            ClientValidationFunction="validarFiltros" ValidationGroup="emprestimo"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
            <table cellpadding="" cellspacing="0" border="0" width="100%">           
                <tr style="padding-bottom: 10px;">
                    <td class="posSecaoFormulario" style="text-align: center;">
                        <div style="height: 130px; overflow: auto;">
                            <glw:Grid ID="gridAvalista" runat="server" Width="850px" Height="130px" DataKeyNames="id"
                             AllowSorting="true" OnRowDataBound="gridAvalista_RowDataBound" style="overflow: scroll;">                
                                <Columns>    
                                                                             <%--
                                    <glw:CampoLinkLimitado DataTextField="CPF" HeaderText="CPF" DataNavigateUrlFormatString="~/Paginas/CicloNormal/Emprestimo/PopupAvalista.aspx?id={0}"
                                        DataNavigateUrlFields="id" tamanhoMaximo="60" permissoesExigidas="consultar"/>--%>
                                        <%--William Moreira da Silva - SOL 205807 KTN 1989865 --%>                      
                                    <glw:CampoCheckBoxSelecao OnalterarCheckBox="campo_CheckedChanged" />z
                                    <glw:CampoLimitado DataField="CPF" HeaderText="CPF ou CNPJ" />
                                    <glw:CampoLimitado DataField="nome" HeaderText="Nome" />
                                    <glw:CampoLimitado DataField="razaoSocial" HeaderText="Razao Social" />                                                                      
                                    <glw:CampoLimitado DataField="id" HeaderText="Avalista" Visible="false"/>                
                                </Columns>
                            </glw:Grid>
                         </div>
                        <asp:ObjectDataSource ID="dataSourceAvalista" runat="server" SelectMethod="consultarGrupoAvalista"
                            TypeName="FUNCEF.Planus.WebEmprestimo.Web.Proxies.ProxyAvalista" SortParameterName="ordenacao"
                            StartRowIndexParameterName="indiceLinha" MaximumRowsParameterName="maximoLinhas"
                            SelectCountMethod="totalAvalista" OnSelecting="dataSourceAvalista_Selecting"
                            EnablePaging="true" EnableCaching="false">
                            <SelectParameters>
                                <asp:ControlParameter Name="nomeAvalista" ControlID="caixaTextoNome" PropertyName="Text"
                                    Direction="Input" Type="String" />
                                <asp:ControlParameter Name="razaoSocial" ControlID="caixaTextoRazaoSocial" PropertyName="Text"
                                    Direction="Input" Type="String" />
                                <asp:ControlParameter Name="cpf" ControlID="caixaTextoCPF" PropertyName="Text" Direction="Input"
                                    Type="String" />
                                <asp:ControlParameter Name="instrucaoLike" ControlID="comboLike" PropertyName="SelectedValue"
                                    Direction="Input" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </glw:SecaoFormulario>
        
    </table>
</asp:Content>
<asp:Content ID="contentRodape"  runat="server" ContentPlaceHolderID="ConteudoRodape">
    <table cellpadding="0" cellspacing="0" border="0" class="tableSecao">
            <table cellpadding="" cellspacing="0" border="2" class="tableSecao">
                <tr class="espacamento">  
                    <td >
                        <glw:BotaoAcao ID="botaoOK"  runat="server" Height="" urlDaImagem="~/Imagens/imgOK.png"  
                        Text="OK" OnClick="botaoOK_Click" />  
                    </td>
                    <td >
                        <glw:BotaoOculto ID="BotaoOcultoRetorno"  runat="server" />
                        
                    </td>
                </tr>
            </table>  
    </table>         
</asp:Content>
