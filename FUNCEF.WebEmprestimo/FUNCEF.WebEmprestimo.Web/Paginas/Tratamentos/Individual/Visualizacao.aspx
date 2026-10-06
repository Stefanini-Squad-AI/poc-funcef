<%@ Page Language="C#" MasterPageFile="~/Paginas/Mestre/FormularioMestre.master"
    AutoEventWireup="true" CodeBehind="Visualizacao.aspx.cs" Inherits="FUNCEF.Planus.WebEmprestimo.Web.Paginas.Tratamentos.Individual.Visualizacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConteudoAdicionalHeadFormulario"
    runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="EspacoTituloPagina" runat="server">
    <glw:TituloPagina ID="aba1" titulo="Tratamento Individual de Parcelas" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ConteudoFormulario" runat="server">
    <table cellpadding="1" cellspacing="0" border="0" width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" class="tableSecao">
                    <tr>
                        <td class="espacamento">Número do Contrato:
                        </td>
                        <td>
                            <asp:Label ID="labelNumeroContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>Mutuário:
                        </td>
                        <td>
                            <asp:Label ID="labelMutuario" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td colspan="4" rowspan="3">
                            <asp:Panel ID="dadosParticipanteTitular" runat="server" GroupingText="Dados do Participante Titular">
                                <table>
                                    <tr>
                                        <td>Mutuário Títular:
                                        </td>
                                        <td colspan="5">
                                            <asp:Label ID="labelMutuarioTitular" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Matrícula:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelMatriculaTitular" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>CPF:
                                        </td>
                                        <td>
                                            <asp:Label ID="labelCPFTitular" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Insc. Previdenciária
                                        </td>
                                        <td>
                                            <asp:Label ID="labelInscPrevidenciariaTitular" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">Matrícula:
                        </td>
                        <td>
                            <asp:Label ID="labelMatricula" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>

                        <td>
                            <label>CPF:</label>
                        </td>
                        <td>
                            <asp:Label ID="labelCPF" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" colspan="2">Situação do Participante:
                        </td>
                        <td colspan="4">
                            <asp:Label ID="labelSituacaoParticipante" runat="server" CssClass="textoEstaticoNegrito"></asp:Label></td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td class="espacamentoMaior">Plano Previdenciário:
                        </td>
                        <td>
                            <asp:Label ID="labelPlanoPrev" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>Patrocinadora:
                        </td>
                        <td>
                            <asp:Label ID="labelPatrocinadora" runat="server" CssClass="textoEstaticoNegrito"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="espacamentoMaior">Tipo de Empréstimo:
                        </td>
                        <td>
                            <asp:Label ID="labelTipoEmprestimo" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td>Tipo de Contrato:
                        </td>
                        <td>
                            <asp:Label ID="labelTipoContrato" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>                        
                    </tr>
                    <tr>
                        <td class="espacamento">
                            Indexador:
                        </td>
                        <td>
                            <asp:Label ID="labelIndexador" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                        </td>
                        <td colspan="4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento" colspan="6">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="espacamento"></td>
                                    <td>
                                        Data de Assinatura<br />
                                        <glw:CaixaData ID="dataAssinatura" runat="server" Enabled="false" Width="100px"></glw:CaixaData>
                                    </td>
                                    <td>
                                        Data do Crédito<br />
                                        <glw:CaixaData ID="dataCredito" runat="server" Enabled="false" Width="100px"></glw:CaixaData>
                                    </td>
                                    <td>
                                        Data da 1º Parcela<br />
                                        <glw:CaixaData ID="dataPrimeiraParcelas" Enabled="false" runat="server" Width="100px"></glw:CaixaData>
                                    </td>
                                    <td align="center">
                                        Taxa Juros<br />
                                        <asp:Label ID="taxaJuros" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td align="center">
                                        Valor Solicitado<br />
                                        <asp:Label ID="valorSolicitado" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td align="center">
                                        Nº Parcelas<br />
                                        <asp:Label ID="numParcelas" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                    <td align="center">
                                        Valor da Parcela<br />
                                        <asp:Label ID="valorParcela" runat="server" CssClass="textoEstaticoNegrito"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" class="tableSecao">
                    <tr>
                        <td class="espacamento" style="padding-top:20px">
                            <asp:CheckBox ID="itensBaixadosManualmente" runat="server" Text="Exibir itens baixados manualmente"/>
                        </td>
                        <td style="padding-top:20px">
                            <asp:CheckBox ID="apenasItensSuspensos" runat="server" Text="Exibir APENAS itens suspensos" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="espacamento">
                            <asp:CheckBox ID="naoItensSuspensos" runat="server" Text="NÃO exibir itens suspensos" Checked="true" /></td>
                        <td>
                            <asp:CheckBox ID="itensPrestacaoEncargos" runat="server" Text="Exibir apenas itens de prestação e encargos" Checked="true" /></td>
                        <td>
                            <asp:CheckBox ID="CheckBoxDesconto" runat="server" Text="Política de Renegociação" OnCheckedChanged="CheckBoxDesconto_CheckedChanged" AutoPostBack="true" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ConteudoBotoesAcao" runat="server">
    <glw:BotaoAcao ID="botaoContinuar" runat="server" permissoesExigidas="consultar" OnClick="botaoContinuar_Click" tagImagem="botaoProximo" Text="Continuar"></glw:BotaoAcao>
    <glw:BotaoVoltar ID="botaoVoltar" runat="server" urlVoltar="Listagem.aspx" permissoesExigidas="mascaraVazia"></glw:BotaoVoltar>
    <glw:BotaoSair ID="botaoSair" runat="server" permissoesExigidas="mascaraVazia"></glw:BotaoSair>
</asp:Content>
