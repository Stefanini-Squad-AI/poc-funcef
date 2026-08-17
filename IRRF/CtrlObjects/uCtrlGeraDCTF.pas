{ Alterações
{ --------------------------------------------------------------------------------------------------
Rotina......: Exporta
Nº SOL......: 184749
Nº KINTANA..: 1729459
Data........: 11/07/2012
Responsável.: Edilaine
Descrição...: alteração do codigo do motivoSuspensao de 6 para 2
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaDebitoApuradoeCreditoVinculado
Nº SOL......: 179258
Nº KINTANA..: 1649137
Data........: 30/04/2012
Responsável.: Otacilio Aquino
Descrição...: Implementação na subConsulta o codigo 7431
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: GeraDebitoCreditoVinculados
Nº SOL......: 152945
Nº KINTANA..: 1159709
Data........: 18/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação da linha 19 "Débito de SCP/INC" com valor "0"  
---------------------------------------------------------------------------------------------------}
{ ------------------------------------------------------------------------------
Rotina.....: ListaSuspensao
N. Sol.....: 93514
N. Kintana.: 402652
Data.......: 01/09/2008
Responsável: Arnaldo V. Scarin
Descrição..: Alteração do Select, incluindo condição de filtro para
             que os registros de Finalização possam ser listados também
------------------------------------------------------------------------------ }


{*******************************************************************************
Analista.: Claudio Faria
Pendencia: 27936
Rotina...: ListaDebitoApuradoeCreditoVinculado e ListaSuspensao
Descrição: Correção na geração da lista de Suspensão.
*******************************************************************************}
{*******************************************************************************
Analista.: Claudio Faria
Pendencia: 27935
Rotina...: GeraSuspensao
Descrição: Correção no filtro da linha para caracteres  considerados inválidos.
*******************************************************************************}
{*******************************************************************************
Analista.: Bruno Bastos
Pendencia: 26945
Rotina...: ListaDebitoApuradoeCreditoVinculado e ListaSuspensao
Descrição: Usar o campo VlrIRRF da tabela Lancirrf e não da tabela Darf.
*******************************************************************************}
{*******************************************************************************
Analista.: Bruno Bastos
Pendencia: 21820
Data.....: 21/11/2007
Rotina...: Exporta
Descrição: Coloquei um if para não gerar registro quando a query não retornar nada.
*******************************************************************************}
{*******************************************************************************
Analista.: Bruno Bastos
Pendencia: 25189
Data.....: 07/08/2007
Rotina...: ListaDebitoApuradoeCreditoVinculado, Exporta
Descrição: Busca do campo VARIACAO para utilizar na gravação do arquivo.
*******************************************************************************}
{*******************************************************************************
Analista.: Claudio Faria
Pendencia: 21820
Data.....: 27/02/2007
Rotina...:
Descrição: Control para geração do arquivo da DCTF 1.3
*******************************************************************************}

unit uCtrlGeraDCTF;

interface

Uses uCmControlObject, DbClient, Sysutils, Classes, Dialogs, Controls, uSistema,
     uMensErro, uFuncoesUteisIR, uDiasUteis, Mask;

  Type
  TTipoGeracao  = (tpgNormal, tpgTriAnterior, tpgQuota);

  TCtrlGeraDCTF = Class(TCmControlObject)

  protected
    function ListaFundacao: OleVariant;
    function ListaPessoaFisisca(IdPessoa: String): OleVariant;

    function ListaDebitoApuradoeCreditoVinculado(psIdPessoa, psPeriodoInicial,
                                                 psPeriodoFinal, psCodNatureza :String;
                                                 ptpgTipoGeracao : TTipoGeracao): OleVariant;

    function ListaPagamentoComDARF(psIdPessoa, psPeriodoInicial, psPeriodoFinal,
                                   psGrupoTributo, psCodNatureza:String;
                                   ptpgTipoGeracao : TTipoGeracao): OleVariant;

    function ListaSuspensao(psIdPessoa,
                            psPeriodoInicial,
                            psPeriodoFinal  : String;
                            ptpgTipoGeracao : TTipoGeracao ) : OleVariant;

    function ListaQuotas(psIdPessoa, psPeriodoInicial, psPeriodoFinal:String): OleVariant;

    function GeraHeader(psAnoDeclaracao, psMesDeclaracao, psTipoDeclaracao,
                        psCNPJ, psNomeEmpresarial, psUF, psSituacao,
                        psPeriodoInicial, psPeriodoFinal, psDataOcorrencia:String): String;

    function GeraDadosIniciais(psCNPJ, psAnoMesOcorrencia, psSituacao,
                               psDataEvento, psDiaMesInicial, psDiaMesFinal,
                               psRetificadora, psNumRecibo, psFormaTributacao,
                               psQualificacaoPJ, psLevantouBalanco, psComDebitoSCP,
                               psEsteveInativa, psComIncorporacao,
                               psObrigadaApresentacao:String):String;

    function GeraDadosCadastraisEstabelecimento(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                                psDataEvento, psNomeEmpresarial, psCodNaturezaJuridica,
                                                psLogradouro, psNumero, psComplemento, psBairro,
                                                psMunicipio, psUF, psCEP, psDDDTelefone,  psTelefone,
                                                psDDDFax,  psFax, psCaixaPostal, psUFCaixaPostal,
                                                psCEPCaixaPostal, psEMail:String): String;

    function GeraDadosResponsavelxRepresentante(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                                          psDataEvento, psNomeRepresentante, psCPFRepresentante,
                                                          psDDDTelRepresentante, psTelRepresentante, psRamalTelRepresentante,
                                                          psDDDFaxRepresentante, psFaxRepresentante, psEMailFaxRepresentante,
                                                          psNomeResponsavel, psCPFResponsavel, psCRCResponsavel,
                                                          psUFResponsavel, psDDDTelResponsavel, psTelResponsavel,
                                                          psRamalTelResponsavel, psDDDFaxResponsavel, psFaxResponsavel,
                                                          psEMailFaxResponsavel :String): String;

    function GeraDebitoCreditoVinculados(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                         psDataEvento, psGrupoTributo, psCodigoReceita,
                                         psPeriodicidade, psAnoPeriodoApuracao, psMBQSPeriodo,
                                         psDSQDPeriodo, psOrdemEstabelecimento,
                                         psCNPJIncorporacao, psValorDebito, psBalancoReducao,
                                         psDivideQuotas:String): String;

    function GeraPagamentoComDARF(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                  psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                  psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                  psOrdemEstabelecimento, psCNPJIncorporacao,
                                  psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                  psDataVencimento, psNumReferencia, psValorPrincipal,
                                  psValorMulta, psValorJuros, psValorPagoDebito :String): String;

    function GeraCompensacaoPagamentoIndevido(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                              psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                              psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                              psOrdemEstabelecimento, psCNPJIncorporacao,
                                              psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                              psDataVencimento, psNumReferencia, psValorPrincipal,
                                              psValorMulta, psValorJuros, psValorPagoDebito,
                                              psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;

    function GeraOutraCompensacoes(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                   psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                   psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                   psOrdemEstabelecimento, psCNPJIncorporacao, psTipoCredito,
                                   psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;

    function GeraSuspensao(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                           psGrupoTributo, psCodigoReceita1, psPeriodicidade,
                           psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                           psOrdemEstabelecimento, psCNPJIncorporacao,
                           psValorSuspensoDebito, psMotivoSuspensao, psDeposito,
                           psNumeroProcesso, psVara, psMunicipio, psUF,
                           psIdentificaDebito, psPEriodoApuracao, psCPF_CNPJ,
                           psCodigoReceita2, psDataVencimento, psValorPrincipal,
                           psValorMulta, psValorJuros:String):String;

    function GeraParcelamento(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                              psGrupoTributo, psCodigoReceita, psPeriodicidade,
                              psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                              psOrdemEstabelecimento, psCNPJIncorporacao, psNumeroProcesso,
                              psValorParceladoDebito:String):String;

    function GeraDeducaoComDARF(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                psOrdemEstabelecimento, psCNPJIncorporacao,
                                psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                psDataVencimento, psNumReferencia, psValorPrincipal,
                                psValorMulta, psValorJuros, psValorPagoDebito,
                                psValorDeduzidoDebito:String):String;

    function GeraDebitoApuradoCreditoVinculado_TA(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                                  psDataEvento, psGrupoTributo, psCodigoReceita,
                                                  psPeriodicidade, psAnoPeriodoApuracao,
                                                  psTrimestrePeriodo, psValorDebito,
                                                  psQuantidadeQuota:String):String;

    function GeraPagamentoComDARF_TA(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                     psDataEvento, psGrupoTributo, psCodigoReceita,
                                     psPeriodicidade, psAnoPeriodoApuracao,
                                     psTrimestrePeriodo, psPeriodoApuracao,
                                     psCNPJdoDARF, psCodigoReceitaDARF, psDataVencimento,
                                     psNumReferencia, psValorPrincipal, psValorMulta,
                                     psValorJuros, psValorPagoDebito:String):String;

    function GeraCompensacaoPagamentoIndevido_TA(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                                 psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                                 psAnoPeriodoApuracao, psTrimestrePeriodo,
                                                 psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                                 psDataVencimento, psNumReferencia, psValorPrincipal,
                                                 psValorMulta, psValorJuros, psValorPagoDebito,
                                                 psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;

    function GeraOutraCompensacoes_TA(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                      psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                      psAnoPeriodoApuracao, psTrimestrePeriodo, psTipoCredito,
                                      psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;

    function GeraSuspensao_TA(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                              psGrupoTributo, psCodigoReceita1, psPeriodicidade,
                              psAnoPeriodoApuracao, psTrimestrePeriodo,
                              psValorSuspensoDebito, psMotivoSuspensao, psDeposito,
                              psNumeroProcesso, psVara, psMunicipio, psUF,
                              psIdentificaDebito, psPEriodoApuracao, psCPF_CNPJ,
                              psCodigoReceita2, psDataVencimento, psValorPrincipal,
                              psValorMulta, psValorJuros:String):String;

    function GeraParcelamento_TA(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                 psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                 psAnoPeriodoApuracao, psTrimestrePeriodo,
                                 psNumeroProcesso, psValorParceladoDebito:String):String;

    function GeraQuotas(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                        psGrupoTributo, psCodigoReceita, psPeriodicidade,
                        psAnoPeriodoApuracao, psTrimestrePeriodo, psNumeroQuota:String):String;

    function GeraPagamentoComDARFdaQuotas(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                          psDataEvento, psGrupoTributo, psCodigoReceita,
                                          psPeriodicidade, psAnoPeriodoApuracao,
                                          psTrimestrePeriodo, psNumeroQuota, psPeriodoApuracao,
                                          psCNPJdoDARF, psCodigoReceitaDARF, psDataVencimento,
                                          psNumReferencia, psValorPrincipal, psValorMulta,
                                          psValorJuros, psValorPagoDebito:String):String;


    function GeraCompensacaoPagamentoIndevidoQuotas(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                                    psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                                    psAnoPeriodoApuracao, psTrimestrePeriodo, psNumeroQuota,
                                                    psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                                    psDataVencimento, psNumReferencia, psValorPrincipal,
                                                    psValorMulta, psValorJuros, psValorPagoDebito,
                                                    psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;


    function GeraSuspensaodaQuotas(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                   psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                   psAnoPeriodoApuracao, psTrimestrePeriodo, psNumeroQuota,
                                   psTipoCredito, psValorCompensadoDebito, psFormalizaPedido,
                                   psPERDCOMP:String):String;


    function GeraTrailler(psCNPJ, psAnoMesOcorrencia, psSituacao,
                          psDataEvento, psQuantidadeRegistro:String):String;

    function CriaArquivo(Arquivo:String):Boolean;
    function GravaLinha(Arquivo, Linha: String):Boolean;


    function Completa(sNome: String; iTam : integer):String;
    function CompletaZero(sNome: String; iTam : integer):String;
    function ParaNumerico(sValue:String):String;
    function ConverteData(sData:String):String;

    function RetornaPeriodo(psPeriodicidade, psPeriodoApuracao:String):String;
    function VerificaCodNatureza(psCodNatureza, psPeriodicidade:String):String;

    Procedure MontaTabelaData(psPeriodicidade, psMesAno : String);
  private
    cdsFundacao                            : TClientDataSet;
    cdsResponsavel                         : TClientDataSet;
    cdsRepresentante                       : TClientDataSet;

    cdsDebitoApuradoeCreditoVinculado      : TClientDataSet;
    cdsDebitoApuradoeCreditoVinculadoTotal : TClientDataSet;
    cdsPagamentoComDARF                    : TClientDataSet;
    cdsSuspensao                           : TClientDataSet;

    cdsBeneficioResgatado                  : TClientDataSet;

    cdsTabelaDatas                         : TClientDataSet;

    procedure DoChangeDataBase; Override;

  public
    Constructor Create; Override;
    Destructor  Destroy; Override;

    function ListaEstados:OleVariant;

    function Exporta(Arquivo, idResponsavel, sCRCResponsavel, sUFResponsavel,
                     idRepresentante,
                     sAnoCalendario, sMesCopetencia, sTipoDeclaracao,
                     sUltReciboRatificada, sPeriodoInicial, sPeriodoFinal,
                     sSituacao, sNaturezaJuridica, sCNAE,
                     sDataOcorrencia, sBalancoReducao,
                     sFormaTributacao, sQualificacaoPJ,
                     sLevantouBalanco, sComDebitoSCP, sEsteveInativa,
                     sComIncorporacao, sObrigadaApresentacao:String):Boolean;
  End;

implementation

Var ArqImporta : TextFile;
    iQuantidadeRegistro : Integer;

const
  sTerminador = ''; 

{ TCtrlGeraDprev }

constructor TCtrlGeraDCTF.Create;
begin
  inherited;

  cdsFundacao                            := TClientDataSet.Create(nil);
  cdsResponsavel                         := TClientDataSet.Create(nil);
  cdsRepresentante                       := TClientDataSet.Create(nil);

  cdsDebitoApuradoeCreditoVinculado      := TClientDataSet.Create(nil);
  cdsDebitoApuradoeCreditoVinculadoTotal := TClientDataSet.Create(nil);
  cdsPagamentoComDARF                    := TClientDataSet.Create(nil);
  cdsSuspensao                           := TClientDataSet.Create(nil);

  cdsTabelaDatas                         := TClientDataSet.Create(nil);
end;

destructor TCtrlGeraDCTF.Destroy;
begin
  inherited;

  cdsFundacao.Free;
  cdsResponsavel.Free;
  cdsRepresentante.Free;

  cdsDebitoApuradoeCreditoVinculado.Free;
  cdsDebitoApuradoeCreditoVinculadoTotal.Free;
  cdsPagamentoComDARF.Free;
  cdsSuspensao.Free;

  cdsTabelaDatas.Free;
end;

procedure TCtrlGeraDCTF.DoChangeDataBase;
begin
  inherited;
end;

{-----------------------------------------------------------}
{ Funções auxiliares para a execução da exportação - Ínicio }

function TCtrlGeraDCTF.Completa(sNome: String; iTam: integer): String;
var
  i, k : integer;
  Espacos : string;
begin
  If Length(sNome) > iTam Then sNome := Copy( sNome, 1, iTam);

  sNome   := trim(sNome);
  i       := length(sNome);
  Espacos := '';
  for k := 1 to (iTam - i) do
     Espacos := Espacos + ' ';

  Result := sNome + Espacos;
end;

function TCtrlGeraDCTF.CompletaZero(sNome: String; iTam: integer): String;
var i, k : integer;
begin
  If Length(sNome) > iTam Then sNome := Copy( sNome, 1, iTam);

  sNome  := trim(sNome);
  i      := length(sNome);
  Result := '';
  for k := 1 to (iTam - i) do
     Result := Result + '0';
  Result := Result + sNome;
end;

function TCtrlGeraDCTF.CriaArquivo(Arquivo: String): Boolean;
begin
  Result := False;

  If FileExists(Arquivo) Then
    If MsgDlg('O arquivo ' + ExtractFileName(Arquivo) + ' já existe, ' + #13 +
              'deseja substituir esse arquivo?', 'IRRF', mtWarning, [mbYes, mbNo], 0) = mrYes then
      DeleteFile(Arquivo)
    Else
      Exit;

  Try
    AssignFile(ArqImporta, Arquivo);
    Rewrite(ArqImporta);
    CloseFile(ArqImporta);

    Result := True;
  Except
    Result := False;
  End;
end;

function TCtrlGeraDCTF.GravaLinha(Arquivo, Linha: String): Boolean;
begin
  If Linha = '' Then Exit;

  AssignFile(ArqImporta, Arquivo);
  Append(ArqImporta);

  Write(ArqImporta, Linha);
  WriteLn(ArqImporta);

  CloseFile(ArqImporta);
end;

function TCtrlGeraDCTF.ParaNumerico(sValue:String):String;
Var sFiltro, teste:String;
    iCount:Integer;
Begin
  sFiltro := ' ()-.';

  For iCount := 1 to Length(sFiltro) do
    sValue := StringReplace( sValue, sFiltro[icount], '', [rfReplaceAll]);

  Try
    StrToInt64(sValue);
    Result := sValue;
  Except
    Result := '';
 end;
end;

function TCtrlGeraDCTF.ConverteData(sData:String):String;
Begin
  Result := Copy(sData, 5, 4) + Copy(sData, 3, 2) + Copy(sData, 1, 2);
End;

function TCtrlGeraDCTF.RetornaPeriodo(psPeriodicidade, psPeriodoApuracao:String):String;
Var sDia:String;
Begin
  sDia := Copy(psPeriodoApuracao, 1, 2);

  If Pos(psPeriodoApuracao, '/') < 1 Then
    psPeriodoApuracao := FormatMaskText('99/99/9999;0; ', psPeriodoApuracao);

  If psPeriodicidade = 'D' Then Result := sDia;

  If psPeriodicidade = 'S' Then
    Result := '0' + IntToStr(NumWeekMonth(StrToDateTime(  psPeriodoApuracao)));

  If psPeriodicidade = 'M' Then
    Result := '00';

  If psPeriodicidade = 'Q' Then
  Begin
    If StrToInt(sDia) <= 15 Then
      Result := '01'
    Else
      Result := '02';
  End;

  If psPeriodicidade = 'X' Then
  Begin
    If StrToInt(sDia) <= 10 Then Result := '01';

    If (StrToInt(sDia) >= 11) and (StrToInt(sDia) <= 29) Then Result := '02';

    If StrToInt(sDia) >= 30 Then Result := '03';
  End;

  Result := Result
End;

function TCtrlGeraDCTF.VerificaCodNatureza(psCodNatureza, psPeriodicidade:String):String;
Var sDigito:String;
Begin
  If psPeriodicidade = 'D' Then sDigito := '01';
  If psPeriodicidade = 'M' Then sDigito := '02';
  If psPeriodicidade = 'X' Then sDigito := '03';
  If psPeriodicidade = 'Q' Then sDigito := '01';
  If psPeriodicidade = 'S' Then sDigito := '00';

  { Casos Especiais para o Tributo IRRF }
  If ((psCodNatureza = '0490') and (psPeriodicidade = 'X')) OR
     ((psCodNatureza = '5232') and (psPeriodicidade = 'X')) OR
     ((psCodNatureza = '5286') and (psPeriodicidade = 'X')) OR
     ((psCodNatureza = '0490') and (psPeriodicidade = 'X')) Then sDigito := '04';

  If ((psCodNatureza = '5299') and (psPeriodicidade = 'S')) Then sDigito := '01';

  If ((psCodNatureza = '5952') and (psPeriodicidade = 'Q')) Then sDigito := '02';

  If ((psCodNatureza = '5987') and (psPeriodicidade = 'Q')) Then sDigito := '04';  

  { Retorno }
  Result := psCodNatureza + sDigito;
End;

Procedure TCtrlGeraDCTF.MontaTabelaData(psPeriodicidade, psMesAno : String);
Var iDia, iMes, iAno, iUltDia : Integer;
    dtInicio, dtFim     : TDateTime;

   Procedure GravaTabela(psDtInicio, psDtFim : String);
   Begin
     cdsTabelaDatas.Append;
     cdsTabelaDatas.FieldByName('DATAINICIO').AsString := StringReplace(psDtInicio, '/', '', [rfReplaceAll]);
     cdsTabelaDatas.FieldByName('DATAFIM').AsString    := StringReplace(psDtFim,    '/', '', [rfReplaceAll]);
     cdsTabelaDatas.Post;
   End;

Begin
  cdsTabelaDatas.Close;
  cdsTabelaDatas.Data := GetDataPacket('SELECT ''        '' DATAINICIO, ''        '' DATAFIM FROM DUAL WHERE 1 = 2');


  dtInicio := StrToDate('01/' + psMesAno);
  iMes     := DiasUteis.ExtraiMes(dtInicio);
  iAno     := DiasUteis.ExtraiAno(dtInicio);
  dtFim    := DiasUteis.UltDiaMes(iAno, iMes);
  iUltDia  := DiasUteis.ExtraiDia(dtFim);

  // Diario
  If psPeriodicidade = 'D' Then
  Begin
    For iDia := 1 to iUltDia do
    Begin
      GravaTabela(IntToStr(iDia) + psMesAno, IntToStr(iDia) + psMesAno)
    End;
  End;

  // Semanal
  If psPeriodicidade = 'S' Then
  Begin
    For iDia := 1 to iUltDia do
    Begin
       If (DayOfWeek(StrToDate(IntToStr(iDia) + '/' + psMesAno)) = 7) Or
          (iDia = iUltDia) Then
       Begin
         If Length(IntToStr(iDia)) = 1 Then
           GravaTabela( FormatDateTime('dd/mm/yyyy', dtInicio), '0' + IntToStr(iDia) + '/' + psMesAno)
         Else
           GravaTabela( FormatDateTime('dd/mm/yyyy', dtInicio), IntToStr(iDia) + '/' + psMesAno);

         If (iDia <> iUltDia) Then
           dtInicio := StrToDate(IntToStr(iDia + 1) + '/' + psMesAno);
       End;
    End;
  End;

  // Decendial
  If psPeriodicidade = 'X' Then
  Begin
    GravaTabela('01/' + psMesAno, '10/' + psMesAno);

    If iMes = 2 Then
      GravaTabela('11/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno)
    Else
    Begin
      GravaTabela('11/' + psMesAno, '20/' + psMesAno);
      GravaTabela('21/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno);
    End;
  End;

  // Quinzenal
  If psPeriodicidade = 'Q' Then
  Begin
    GravaTabela('01/' + psMesAno, '15/' + psMesAno);
    GravaTabela('16/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno);
  End;

  // Mensal
  If psPeriodicidade = 'M' Then
  Begin
    GravaTabela('01/' + psMesAno, IntToStr(iUltDia) + '/' + psMesAno);
  End;
End;

{ Funções auxiliares para a execução da exportação - Fim }
{--------------------------------------------------------}

{---------------------------------------------------}
{ Query para retorna dados para exportação - Ínicio }

function TCtrlGeraDCTF.ListaEstados:OleVariant;
Var sSQL:String;
begin
  sSQL := ' SELECT CODESTADO FROM ESTADO ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDCTF.ListaFundacao: OleVariant;
Var sSQL:String;
begin
  sSQL := ' SELECT P.RAZAOSOCIAL, P.NUMDOCUMENTO, P.EMAIL, F.CODFUNDSPC,          ' +
          '        E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, E.CEP,        ' +
          ' 	   C.NOME AS MUNICIPIO, C.UF,                                     ' +
          ' 	   TD.DDD, TD.NUMERO AS NUMEROTEL, TF.DDD AS DDDFAX,              ' +
          '        TF.NUMERO AS NUMEROFAX                                         ' +
          ' FROM FUNDACAO   F,                                                    ' +
          '      PESSOA     P,                                                    ' +
          ' 	 ENDPESS    E,                                                    ' +
          ' 	 CIDADES    C,                                                    ' +
          ' 	 ( SELECT IDENDERECO, NUMERO,DDD                                  ' +
          ' 	  FROM TELENDPESS WHERE TIPO Like ''%C%'' ) TD,                   ' +
          ' 	 ( SELECT IDENDERECO, NUMERO,DDD                                  ' +
          ' 	  FROM TELENDPESS WHERE TIPO Like ''%F%'' ) TF                    ' +
          ' WHERE ( F.IDPESSOA       = P.IDPESSOA )                               ' +
          '   AND ( P.IDPESSOA       = E.IDPESSOA )                               ' +
          '   AND ( P.IDENDCOMERCIAL = E.IDENDERECO )                             ' +
          '   AND ( E.IDCIDADES      = C.IDCIDADES )                              ' +
          '   AND ( E.IDENDERECO     = TD.IDENDERECO(+) )                         ' +
          '   AND ( E.IDENDERECO     = TF.IDENDERECO(+) )                         ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDCTF.ListaPessoaFisisca(IdPessoa: String): OleVariant;
Var
  Ssql : string;
begin
  Ssql := ' SELECT P.RAZAOSOCIAL, P.NUMDOCUMENTO,                                                ' +
          '        EN.LOGRADOURO AS ENDEREO,  P.TIPO, P.EMAIL,                                   ' +
          '        EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO, EN.CEP,                               ' +
          '        REPLACE(REPLACE(REPLACE(TF.NUMERO, ''-''), ''(''), '')'') AS FAX,             ' +
          '        REPLACE(REPLACE(REPLACE(TD.NUMERO, ''-''), ''(''), '')'') AS TELEFONE, TD.DDD ' +
          ' FROM  PESSOA   P,                                                                    ' +
          '       ENDPESS EN,                                                                    ' +
          '       CIDADES  C,                                                                    ' +
          '       ESTADO  ES,                                                                    ' +
          '       ( SELECT IDENDERECO, NUMERO, DDD FROM TELENDPESS WHERE TIPO LIKE ''%P%'' ) TD, ' +
          '       ( SELECT IDENDERECO, NUMERO, DDD FROM TELENDPESS WHERE TIPO LIKE ''%F%'' ) TF  ' +
          ' WHERE ( P.IDPESSOA       = ' + IdPessoa + ' )                                        ' +
          '   AND ( EN.IDENDERECO(+) = P.IDENDRESIDENCIAL )                                      ' +
          '   AND ( EN.IDCIDADES     = C.IDCIDADES(+) )                                          ' +
          '   AND ( ES.IDESTADO(+)   = C.IDESTADO )                                              ' +
          '   AND ( EN.IDPESSOA(+)   = P.IDPESSOA )                                              ' +
          '   AND ( EN.IDENDERECO    = TD.IDENDERECO(+) )                                        ' +
          '   AND ( EN.IDENDERECO    = TF.IDENDERECO(+) )                                        ';

  Result := GetDataPacket(Ssql);
End;

function TCtrlGeraDCTF.ListaDebitoApuradoeCreditoVinculado(psIdPessoa, psPeriodoInicial,
                                                           psPeriodoFinal, psCodNatureza :String;
                                                           ptpgTipoGeracao : TTipoGeracao): OleVariant;
Var sSQL:String;
begin
  If ptpgTipoGeracao = tpgTriAnterior Then
  Begin
    psPeriodoInicial := '0110005';
    psPeriodoInicial := '3112005';
  End;

  sSQL := ' SELECT '                                                                                        + #13 +
          '   GRUPOTRIBUTO, '                                                                               + #13 +
          '   CODNATUREZA, '                                                                                + #13 +
          '   PERIODICIDADE, '                                                                              + #13 +

          '   VARIACAO, '                                                                                   + #13 +

          '   SUM(VALOR_TOTAL) AS VALOR_TOTAL '                                                             + #13 +
          ' FROM '                                                                                          + #13 +
          '  (SELECT '                                                                                      + #13 +
          '     NAT.GRUPOTRIBUTO, '                                                                         + #13 +
          '     NAT.CODNATUREZA, '                                                                          + #13 +

          '     NAT.VARIACAO, '                                                                             + #13 +

          '     NAT.PERIODICIDADE, '                                                                        + #13 +
          '     SUM (DAR.VLRIRRF + NVL (DAR.VLRMULTA, 0) + NVL (DAR.VLRJUROS, 0)) AS VALOR_TOTAL '          + #13 +
          '   FROM '                                                                                        + #13 +
          '     NATURENDIMENTO NAT, '                                                                       + #13 +
          '     DARF DAR, '                                                                                 + #13 +
          '     DOCUMENTO DOC '                                                                             + #13 +
          '   WHERE (DAR.IDPESSOA           = ' + psIDPessoa + ') '                                         + #13 +
          '     AND (DAR.CODNATUREZA        = NAT.CODNATUREZA(+)) '                                         + #13 +
          '     AND ((NAT.FLGUSADONADCTF    = ''S'') OR (NAT.FLGUSADONADCTF IS NULL)) '                     + #13 +
          '     AND (DAR.DATAINIAPURACAO   >= TO_DATE (' + quoteDstr(psPeriodoInicial) + ', ''DDMMYYYY''))' + #13 +
          '     AND (DAR.DATAFINALAPURACAO <= TO_DATE (' + quoteDstr(psPeriodoFinal)   + ', ''DDMMYYYY''))' + #13 +
          '     AND (DOC.STATUS             = ''2'') '                                                      + #13 +
          '     AND (NAT.CODNATUREZA   NOT IN (''7416'',''7431'')) '                                        + #13 +
          '     AND (DOC.CODDOCUMENTO       = DAR.CODDOCUMENTO) '                                           + #13 ;

  If ptpgTipoGeracao = tpgTriAnterior Then
    sSQL := sSQL + '     AND (NAT.GRUPOTRIBUTO IN (''01'', ''05'') ) '                       + #13 ;

  sSQL := sSQL + '   GROUP BY '                                                                + #13 +
                 '     NAT.GRUPOTRIBUTO, '                                                     + #13 +
                 '     NAT.CODNATUREZA, '                                                      + #13 +

                 '     NAT.VARIACAO, '                                                         + #13 +

                 '     NAT.PERIODICIDADE '                                                     + #13 +
                 '   HAVING '                                                                  + #13 +
                 '     SUM (DAR.VLRIRRF + NVL (DAR.VLRMULTA, 0) + NVL (DAR.VLRJUROS, 0)) > 0 ' + #13 ;

  If ptpgTipoGeracao = tpgNormal Then
    sSQL := sSQL + '   UNION '                                                                                       + #13 +
                   '   SELECT '                                                                                      + #13 +
                   '     ''02'' AS GRUPOTRIBUTO, '                                                                   + #13 +
                   '     ''0561'' AS CODNATUREZA, '                                                                  + #13 +
                   '     ''M'' AS PERIODICIDADE, '                                                                   + #13 +

                   '     NAT.VARIACAO, '                                                                             + #13 +

                   //CPREV - Pend. 26945 - '     SUM(DAR.VLRIRRF + NVL (DAR.VLRMULTA, 0) + NVL (DAR.VLRJUROS, 0)) AS VALOR_TOTAL '           + #13 +
                   '     SUM(LIR.VLRIRRF) AS VALOR_TOTAL '+ #13 + //CPREV - Pend. 26945

                   //CPREV - Pend. 26945 - '     SUM(DAR.VLRIRRF + NVL (DAR.VLRMULTA, 0) + NVL (DAR.VLRJUROS, 0)) AS VALOR_TOTAL '           + #13 +
                   '   FROM '                                                                                        + #13 +
                   '     NATURENDIMENTO NAT, '                                                                       + #13 +
                   '     DARF DAR, '                                                                                 + #13 +
                   '     DOCUMENTO DOC, '                                                                            + #13 +
                   '     LANCIRRF LIR, '                                                                             + #13 +
                   '     PESSOA PES, '                                                                               + #13 +
                   '     PROCJUD PRJ '                                                                               + #13 +
                   '   WHERE (DAR.IDPESSOA = ' + psIDPessoa + ') '                                                   + #13 +
                   '     AND (DOC.CODDOCUMENTO = DAR.CODDOCUMENTO) '                                                 + #13 +
                   '     AND (DAR.CODNATUREZA  = NAT.CODNATUREZA(+)) '                                               + #13 +
                   '     AND (DAR.IDDARF       = LIR.IDDARF ) '                                                      + #13 +
                   '     AND (LIR.IDBENEFIRRF  = PES.IDPESSOA) '                                                     + #13 +
                   '     AND (PES.IDPESSOA     = PRJ.IDPESSOA) '                                                     + #13 +
                   '     AND (NAT.CODNATUREZA IN (''7416'',''7431'')) '                                              + #13 +
                   '     AND ((NAT.FLGUSADONADCTF = ''S'') OR (NAT.FLGUSADONADCTF IS NULL)) '                        + #13 +
                   '     AND (DOC.STATUS = ''2'') '                                                                  + #13 +
                   '     AND (DAR.DATAINIAPURACAO   >= TO_DATE (' + quoteDstr(psPeriodoInicial) + ', ''DDMMYYYY''))' + #13 +
                   '     AND (DAR.DATAFINALAPURACAO <= TO_DATE (' + quoteDstr(psPeriodoFinal)   + ', ''DDMMYYYY''))' + #13 +
                   '     AND (PRJ.DATAINICIO        <= TO_DATE (' + quoteDstr(psPeriodoInicial) + ', ''DDMMYYYY''))' + #13 +
                 //  '     AND (PRJ.DATAFINAL         is null)'                                                      + #13 + //CPrev - 27936
                   '     AND ( (PRJ.SITPROCESSO = ''0'') OR ' + #13 + //CPrev - 27936
                   '           (PRJ.DATAFINAL       >= ( SELECT DISTINCT L.DATALANCAMENTO' + #13 +
                   '                                     FROM LANCIRRF L' + #13 +
                   '                                     WHERE L.DATALANCAMENTO >= TO_DATE (' + quoteDstr(psPeriodoInicial) + ', ''DD/MM/YYYY'')' + #13 +
                   '                                       AND L.DATALANCAMENTO <= TO_DATE (' + quoteDstr(psPeriodoFinal)   + ', ''DD/MM/YYYY'')' + #13 +
                   '                                       AND L.IDMODULO = 18' + #13 +
                                                           // Otacilio Aquino SOL 179258 KTN 1649137
                   '                                       AND L.CODNATUREZA IN (''7416'',''7431'') ) ) )' + #13 +
//                   '     AND (PRJ.SITPROCESSO = ''0'')'                                                              + #13 + //CPrev - 27936
                   '   GROUP BY '                                                                                    + #13 +
                   '     NAT.GRUPOTRIBUTO, '                                                                         + #13 +
                   '     NAT.CODNATUREZA, '                                                                          + #13 +

                   '     NAT.VARIACAO, '                                                                             + #13 +

                   '     NAT.PERIODICIDADE '                                                                         + #13 +
                   '   HAVING '                                                                                      + #13 +
                   //CPREV - Pend. 26945 - '     SUM (DAR.VLRIRRF + NVL (DAR.VLRMULTA, 0) + NVL (DAR.VLRJUROS, 0)) > 0) '                    + #13 ;
                   '     SUM (LIR.VLRIRRF) > 0) '                                                                    + #13 ; //CPREV - Pend. 26945


  If psCodNatureza <> '' Then
    sSQL := sSQL + ' WHERE (CODNATUREZA = ' + QuotedStr(psCodNatureza) + ') '                + #13 ;

  sSQL := sSQL + ' GROUP BY '                                                                + #13 +
                 '   GRUPOTRIBUTO, '                                                         + #13 +

                 '   VARIACAO, '                                                             + #13 +

                 '   CODNATUREZA, '                                                          + #13 +
                 '   PERIODICIDADE '                                                         + #13 ;

  Result := GetDataPacket(Ssql);
end;

function TCtrlGeraDCTF.ListaPagamentoComDARF(psIdPessoa, psPeriodoInicial, psPeriodoFinal,
                                             psGrupoTributo, psCodNatureza:String;
                                             ptpgTipoGeracao : TTipoGeracao): OleVariant;
Var sSQL:String;
begin
  If ptpgTipoGeracao = tpgTriAnterior Then
  Begin
    psPeriodoInicial := '0110005';
    psPeriodoInicial := '3112005';
  End;

  sSQL := ' SELECT NAT.GRUPOTRIBUTO, NAT.CODNATUREZA, NAT.DESCRICAO, ' + #13 +
          '        TO_CHAR(DAR.DATAINIAPURACAO,   ''DDMMYYYY'') AS DATAINIAPURACAO, ' + #13 +
	  ' 	   TO_CHAR(DAR.DATAFINALAPURACAO, ''DDMMYYYY'') AS DATAFINALAPURACAO, ' + #13 +
	  '        DAR.REFERENCIA, DAR.VLRIRRF, DAR.VLRMULTA, DAR.VLRJUROS, ' + #13 +
          ' 	   DAR.TIPOPROCESSO, DAR.PROCESSO, DAR.MEDIDAJUDICIAL, DAR.VARA, ' + #13 +
	  ' 	   DAR.DATAVENCDARF, ' + #13 +
          '        NAT.PERIODICIDADE, NAT.CODTIPRECDES, NAT.CODFORMA, NAT.FLGDEPOSITOJUDIC, ' + #13 +
          ' 	   NAT.FLGRESIDEXTERIOR, NAT.FLGRESIDEXTERIOR, NAT.FLGUSADONADCTF, ' + #13 +
          ' 	   NAT.FLGUSADONADIRF, NAT.IDFORCLI, NAT.RECPAG, NAT.IDPESSOA ' + #13 +
          ' FROM NATURENDIMENTO NAT, ' + #13 +
          '      DARF DAR, ' + #13 +
          ' 	 DOCUMENTO DOC ' + #13 +
          ' WHERE (DAR.IDPESSOA = ' + psIDPessoa + ') ' + #13 +
          '   AND (NAT.GRUPOTRIBUTO = ' + psGrupoTributo + ') ' + #13 +
          '   AND (NAT.CODNATUREZA = ' + psCodNatureza + ') ' + #13 +
          '   AND (DAR.CODNATUREZA = NAT.CODNATUREZA(+)) ' + #13 +
          '   AND ((NAT.FLGUSADONADCTF = ''S'') OR (NAT.FLGUSADONADCTF IS NULL)) ' + #13 +
          '   AND (DOC.STATUS = ''2'') ' + #13 +
          '   AND (DOC.CODDOCUMENTO = DAR.CODDOCUMENTO) ' + #13 +
          '   AND (DAR.DATAINIAPURACAO   >= TO_DATE(' + quoteDstr(psPeriodoInicial) + ', ''DDMMYYYY''))' + #13 +
          '   AND (DAR.DATAFINALAPURACAO <= TO_DATE(' + quotedStr(psPeriodoFinal)   + ', ''DDMMYYYY''))' + #13;

   If ptpgTipoGeracao = tpgTriAnterior Then
     sSQL := sSQL + '   AND (NAT.GRUPOTRIBUTO IN (''01'', ''05'') ) ' + #13;

   sSQL := sSQL + ' ORDER BY NAT.GRUPOTRIBUTO, NAT.CODNATUREZA ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraDCTF.ListaSuspensao(psIdPessoa,
                                      psPeriodoInicial,
                                      psPeriodoFinal : String;
                                      ptpgTipoGeracao : TTipoGeracao): OleVariant;
Var sSQL : String;
begin
  sSQL := 'SELECT NAT.GRUPOTRIBUTO,'+ #13 +
          '       NAT.CODNATUREZA,'+ #13 +
          '       NAT.DESCRICAO,'+ #13 +
          '       TO_CHAR (DAR.DATAINIAPURACAO,   ''DDMMYYYY'') AS DATAINIAPURACAO,' + #13 +
          '       TO_CHAR (DAR.DATAFINALAPURACAO, ''DDMMYYYY'') AS DATAFINALAPURACAO,' + #13 +
          '       DAR.REFERENCIA,' + #13 +
          '       LIR.VLRIRRF,' + #13 +
          '       DAR.VLRMULTA,' + #13 +
          '       DAR.VLRJUROS, ' + #13 +
          '       DAR.TIPOPROCESSO,' + #13 +
          '       DAR.PROCESSO,' + #13 +
          '       DAR.MEDIDAJUDICIAL,' + #13 +
          '       DAR.VARA,' + #13 +
          '       DAR.DATAVENCDARF,' + #13 +
          '       NAT.PERIODICIDADE,' + #13 +
          '       NAT.CODTIPRECDES,' + #13 +
          '       NAT.CODFORMA,' + #13 +
          '       NAT.FLGDEPOSITOJUDIC,' + #13 +
          '       NAT.FLGRESIDEXTERIOR,' + #13 +
          '       NAT.FLGRESIDEXTERIOR,' + #13 +
          '       NAT.FLGUSADONADCTF,' + #13 +
          '       NAT.FLGUSADONADIRF,' + #13 +
          '       NAT.IDFORCLI,' + #13 +
          '       NAT.RECPAG,' + #13 +
          '       NAT.IDPESSOA,' + #13 +
          '       PES.NUMDOCUMENTO,' + #13 +
          '       DOC.CODDOCUMENTO,' + #13 +
          '       PRJ.NUMEROPROCESSO,' + #13 +
          '       PRJ.UFSECAO,' + #13 +
          '       PRJ.CODVARA,' + #13 +
          '       PRJ.FLGFAZDEPOSITO,' + #13 +
          '       PRJ.NOMEVARA' + #13 +
          'FROM NATURENDIMENTO NAT,' + #13 +
          '     DARF DAR,' + #13 +
          '     DOCUMENTO DOC,' + #13 +
          '     LANCIRRF LIR,' + #13 +
          '     PESSOA PES,' + #13 +
          '     PROCJUD PRJ' + #13 +
          'WHERE (DAR.IDPESSOA          = ' + psIDPessoa + ') ' + #13 +
          '  AND (DOC.CODDOCUMENTO      = DAR.CODDOCUMENTO) ' + #13 +
          '  AND (DAR.CODNATUREZA       = NAT.CODNATUREZA(+)) ' + #13 +
          '  AND (DAR.IDDARF            = LIR.IDDARF ) ' + #13 +
          '  AND (LIR.IDBENEFIRRF       = PES.IDPESSOA) ' + #13 +
          '  AND (PES.IDPESSOA          = PRJ.IDPESSOA) ' + #13 +
          '  AND (NAT.CODNATUREZA       IN (''7416'',''7431'')) ' + #13 +
          '  AND ( (NAT.FLGUSADONADCTF  = ''S'') OR' + #13 +
          '        (NAT.FLGUSADONADCTF  IS NULL))' + #13 +
          '  AND (DOC.STATUS            = ''2'')' + #13 +
          '  AND (DAR.DATAINIAPURACAO   >= TO_DATE (' + quoteDstr(psPeriodoInicial) + ', ''DDMMYYYY''))' + #13 +
          '  AND (DAR.DATAFINALAPURACAO <= TO_DATE (' + quoteDstr(psPeriodoFinal)   + ', ''DDMMYYYY''))' + #13 +
          '  AND (PRJ.DATAINICIO        <= TO_DATE (' + quoteDstr(psPeriodoInicial) + ', ''DDMMYYYY''))' + #13 +

// Alterado por Arnaldo V. Scarin - 01/09/2008 - Sol: 94451 - Kintana: 407372
//          '   AND (PRJ.DATAFINAL         IS NULL)' + #13 + //CPrev - 27936
//          '   AND (PRJ.SITPROCESSO = ''0'')' + #13 + //CPrev - 27936
          '  AND ( (PRJ.SITPROCESSO = ''0'') OR ' + #13 + //CPrev - 27936
          '        (PRJ.DATAFINAL       >= ( SELECT DISTINCT L.DATALANCAMENTO' + #13 +
          '                                  FROM LANCIRRF L' + #13 +
          '                                  WHERE L.DATALANCAMENTO >= TO_DATE (' + quoteDstr(psPeriodoInicial) + ', ''DD/MM/YYYY'')' + #13 +
          '                                    AND L.DATALANCAMENTO <= TO_DATE (' + quoteDstr(psPeriodoFinal)   + ', ''DD/MM/YYYY'')' + #13 +
          '                                    AND L.IDMODULO = 18' + #13 +
                                               // Otacilio Aquino SOL 179258 KTN 1649137
          '                                    AND L.CODNATUREZA IN (''7416'',''7431'') ) ) )' + #13 +
          '  AND (DAR.VLRIRRF           > 0)';
  Result := GetDataPacket(sSQL);
End;

function TCtrlGeraDCTF.ListaQuotas(psIdPessoa, psPeriodoInicial, psPeriodoFinal:String): OleVariant;
Var sSQL:String;
begin
  sSQL := ' SELECT D.VLRIRRF, TO_CHAR(D.DATAFINALAPURACAO, ''DDMMYYYY'') AS  DATAFINALAPURACAO, ' +  #13 +
          '        D.CODNATUREZA, N.GRUPOTRIBUTO, D.REFERENCIA, D.VLRIRRF, D.VLRMULTA, D.VLRJUROS, ' + #13 +
          '        TO_CHAR(D.DATAVENCDARF, ''YYYYMMDD'') AS DATAVENCDARF, ' + #13 +
          '        D.TIPOPROCESSO, D.PROCESSO, D.MEDIDAJUDICIAL, D.VARA, C.NOME, C.CODESTADO ' + #13 +
          ' FROM DARF D, DOCUMENTO DO, NATURENDIMENTO N, CIDADES C ' + #13 +
          ' WHERE (D.IDPESSOA = ' + psIdPessoa + ') ' + #13 +
          '   AND (D.IDCIDADES = C.IDCIDADES(+) ' + #13 +
          '   AND (D.CODDOCUMENTO = DO.CODDOCUMENTO ' + #13 +
          '   AND (D.CODNATUREZA = N.CODNATUREZA(+) ' + #13 +
          '   AND ((N.FLGUSADONADCTF = ''S'') OR (N.FLGUSADONADCTF IS NULL)) ' + #13 +
          '   AND (DO.STATUS = ''2'' ' + #13 +
          '   AND (DAR.DATAINIAPURACAO   >= TO_DATE(' + quoteDstr(psPeriodoInicial) + ', ''DDMMYYYY''))' + #13 +
          '   AND (DAR.DATAFINALAPURACAO <= TO_DATE(' + quotedStr(psPeriodoFinal)   + ', ''DDMMYYYY''))' + #13 +
          '   AND (N.GRUPOTRIBUTO IN (''01'', ''05'', ''06'')) ' + #13 +
          ' ORDER BY DATAFINALAPURACAO ';

  Result := GetDataPacket(sSQL);
end;

{ Query para retorna dados para exportação - Fim      }
{-----------------------------------------------------}

{-----------------------------------------------------}
{ Geração do Layout do arquivo de exportação - Ínicio }

function TCtrlGeraDCTF.GeraHeader(psAnoDeclaracao, psMesDeclaracao, psTipoDeclaracao,
                                   psCNPJ, psNomeEmpresarial, psUF, psSituacao,
                                   psPeriodoInicial, psPeriodoFinal, psDataOcorrencia:String): String;
Var sLinha:String;
begin
  { Criticas }
  If psSituacao = '00' Then psDataOcorrencia := '';

  { Gerando Linhas }

  sLinha :=          Completa    ('DCTFM',            5); // Sistema
  sLinha := sLinha + Completa    ('',                 3); // Reservado
  sLinha := sLinha + Completa    ('',                 4); // Reservado
  sLinha := sLinha + Completa    (psAnoDeclaracao,    4); // Ano de Competência da Declaração
  sLinha := sLinha + CompletaZero('',                 4); // Reservado
  sLinha := sLinha + Completa    (psTipoDeclaracao,   1); // Tipo de Declaração
  sLinha := sLinha + Completa    (psCNPJ,            14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero('',                 1); // Reservado
  sLinha := sLinha + Completa    ('140',              3); // Versão
  sLinha := sLinha + Completa    (psNomeEmpresarial, 60); // Nome Empresárial
  sLinha := sLinha + Completa    (psUF,               2); // UF Domicílio
  sLinha := sLinha + CompletaZero('',                10); // Reservado
  sLinha := sLinha + CompletaZero('',                 1); // Reservado
  sLinha := sLinha + Completa    (psSituacao,         2); // Situação
  sLinha := sLinha + CompletaZero(psAnoDeclaracao,    4); // Ano de Competência
  sLinha := sLinha + CompletaZero(psMesDeclaracao,    2); // Mês de Competência
  sLinha := sLinha + CompletaZero('',                11); // Reservado
  sLinha := sLinha + Completa    (psPeriodoInicial,   8); // Período Base Inicial
  sLinha := sLinha + Completa    (psPeriodoFinal,     8); // Pedíodo Base Final
  sLinha := sLinha + CompletaZero(psDataOcorrencia,   8); // Data de Ocorrência do Evento
  sLinha := sLinha + CompletaZero('',                 1); // Reservado
  sLinha := sLinha + CompletaZero('',                 1); // Reservado
  sLinha := sLinha + Completa    ('',               207); // Reservado
  sLinha := sLinha + CompletaZero('',                10); // Reservado

  Result := sLinha;
end;

function TCtrlGeraDCTF.GeraDadosIniciais(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                         psDataEvento, psDiaMesInicial, psDiaMesFinal,
                                         psRetificadora, psNumRecibo, psFormaTributacao,
                                         psQualificacaoPJ, psLevantouBalanco, psComDebitoSCP,
                                         psEsteveInativa, psComIncorporacao,
                                         psObrigadaApresentacao:String):String;
Var sLinha, sCNPJ : String;
begin
  { Criticas }

  If psSituacao = '0' Then psDataEvento := '';

  If psRetificadora = '0' Then psNumRecibo := '';

  { Gerando Linhas }

  sLinha :=          Completa    ('R01',                   3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                 14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,      6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,              1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,            8); // Data do Evento
  sLinha := sLinha + CompletaZero(psDiaMesInicial,         4); // Inicio do Periodo
  sLinha := sLinha + CompletaZero(psDiaMesFinal,           4); // Final do Periodo
  sLinha := sLinha + CompletaZero(psRetificadora,          1); // Declaração Retificadora
  sLinha := sLinha + CompletaZero(psNumRecibo,            12); // Número do Recibo de Entrega a ser Retificada
  sLinha := sLinha + CompletaZero(psFormaTributacao,       1); // Forma da Tributação do Lucro
  sLinha := sLinha + CompletaZero(psQualificacaoPJ,        1); // Qualificação da Pessoa Juridica
  sLinha := sLinha + CompletaZero(psLevantouBalanco,       1); // PJ Levantou balanço de suspensão no mês
  sLinha := sLinha + CompletaZero(psComDebitoSCP,          1); // PJ Com débitos de SCP a serem declarados
  sLinha := sLinha + CompletaZero(psEsteveInativa,         1); // PJ Esteve inativa desde da data da sua constituição
  sLinha := sLinha + CompletaZero(psComIncorporacao,       1); // PJ Com incorporação submetida ao Regime Especial
  sLinha := sLinha + CompletaZero(psObrigadaApresentacao,  1); // PJ Esteve obrigada a apresentação da DCTF
  sLinha := sLinha + Completa    ('',                     10); // Reservado
  sLinha := sLinha + sTerminador;                              // Delemitador de Registro

  Result := sLinha;
end;

function TCtrlGeraDCTF.GeraDadosCadastraisEstabelecimento(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                                          psDataEvento, psNomeEmpresarial, psCodNaturezaJuridica,
                                                          psLogradouro, psNumero, psComplemento, psBairro,
                                                          psMunicipio, psUF, psCEP, psDDDTelefone,  psTelefone,
                                                          psDDDFax,  psFax, psCaixaPostal, psUFCaixaPostal,
                                                          psCEPCaixaPostal, psEMail:String): String;
Var sLinha:String;
begin
  { Gerando Linhas }

  sLinha :=          Completa    ('R02',                   3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                 14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,      6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,              1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,            8); // Data do Evento
  sLinha := sLinha + Completa    (psNomeEmpresarial,     115); // Nome Empresarial
  sLinha := sLinha + CompletaZero(psCodNaturezaJuridica,   4); // Código da Natureza Juríica
  sLinha := sLinha + Completa    (psLogradouro,           40); // Logradouro
  sLinha := sLinha + Completa    (psNumero,                6); // Número
  sLinha := sLinha + Completa    (psComplemento,          21); // Complemento
  sLinha := sLinha + Completa    (psBairro,               20); // Bairro
  sLinha := sLinha + Completa    (psMunicipio,            50); // Município
  sLinha := sLinha + Completa    (psUF,                    2); // UF
  sLinha := sLinha + Completa    (psCEP,                   8); // CEP
  sLinha := sLinha + Completa    (psDDDTelefone,           4); // DDD do Telefone
  sLinha := sLinha + Completa    (psTelefone,              8); // Telefone
  sLinha := sLinha + Completa    (psDDDFax,                4); // DDD do FAX
  sLinha := sLinha + Completa    (psFax,                   8); // Fax
  sLinha := sLinha + Completa    (psCaixaPostal,           6); // Caixa Postal
  sLinha := sLinha + Completa    (psUFCaixaPostal,         2); // UF da Caixa Postal
  sLinha := sLinha + Completa    (psCEPCaixaPostal,        8); // CEP Caixa Postal
  sLinha := sLinha + Completa    (psEMail,                40); // Correio Eletronico
  sLinha := sLinha + Completa    ('',                     10); // Reservado
  sLinha := sLinha + sTerminador;                              // Delemitador de Registro

  Result := sLinha;
end;

function TCtrlGeraDCTF.GeraDadosResponsavelxRepresentante(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                                          psDataEvento, psNomeRepresentante, psCPFRepresentante,
                                                          psDDDTelRepresentante, psTelRepresentante, psRamalTelRepresentante,
                                                          psDDDFaxRepresentante, psFaxRepresentante, psEMailFaxRepresentante,
                                                          psNomeResponsavel, psCPFResponsavel, psCRCResponsavel,
                                                          psUFResponsavel, psDDDTelResponsavel, psTelResponsavel,
                                                          psRamalTelResponsavel, psDDDFaxResponsavel, psFaxResponsavel,
                                                          psEMailFaxResponsavel :String): String;
Var sLinha:String;
begin
  { Gerando Linhas }

  sLinha :=          Completa    ('R03',                     3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                   14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,        6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,                1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,              8); // Data do Evento
  sLinha := sLinha + Completa    (psNomeRepresentante,     60); // Nome - Representante
  sLinha := sLinha + CompletaZero(psCPFRepresentante,      11); // CPF - Representante
  sLinha := sLinha + Completa    (psDDDTelRepresentante,    4); // DDD Telefone - Representante
  sLinha := sLinha + Completa    (psTelRepresentante,       8); // Telefone - Representante
  sLinha := sLinha + Completa    (psRamaltELRepresentante,  5); // Ramal Telefone - Representante
  sLinha := sLinha + Completa    (psDDDFaxRepresentante,    4); // DDD Fax- Representante
  sLinha := sLinha + Completa    (psFaxRepresentante,       8); // Fax- Representante
  sLinha := sLinha + Completa    (psEMailFaxRepresentante, 40); // Correio Eletronico - Representante
  sLinha := sLinha + Completa    (psNomeResponsavel,        60); // Nome - Responsavel
  sLinha := sLinha + CompletaZero(psCPFResponsavel,         11); // CPF - Responsavel
  sLinha := sLinha + Completa    (psCRCResponsavel,        15); // CRC - Responsavel
  sLinha := sLinha + Completa    (psUFResponsavel,          2); // UF - Responsavel
  sLinha := sLinha + Completa    (psDDDTelResponsavel,      4); // DDD - Responsavel
  sLinha := sLinha + Completa    (psTelResponsavel,          8); // Telefone - Responsavel
  sLinha := sLinha + Completa    (psRamalTelResponsavel,     5); // Ramal Telefone - Responsavel
  sLinha := sLinha + Completa    (psDDDFaxResponsavel,       4); // DDD Fax- Responsavel
  sLinha := sLinha + Completa    (psFaxResponsavel,          8); // Fax- Responsavel
  sLinha := sLinha + Completa    (psEMailFaxResponsavel,    40); // Correio Eletronico - Responsavel
  sLinha := sLinha + Completa    ('',                       10); // Reservado
  sLinha := sLinha + sTerminador;                                // Delemitador de Registro

  Result := sLinha
end;

function TCtrlGeraDCTF.GeraDebitoCreditoVinculados(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                                   psDataEvento, psGrupoTributo, psCodigoReceita,
                                                   psPeriodicidade, psAnoPeriodoApuracao, psMBQSPeriodo,
                                                   psDSQDPeriodo, psOrdemEstabelecimento,
                                                   psCNPJIncorporacao, psValorDebito, psBalancoReducao,
                                                   psDivideQuotas:String): String;
Var sLinha:String;
begin
  { Gerando Linhas }

  sLinha :=          Completa    ('R10',                   3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                 14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,      6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,              1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,            8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,          2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,         6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,         1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,    4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psMBQSPeriodo,           2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período
  sLinha := sLinha + CompletaZero(psDSQDPeriodo,           2); // Dia/Semana/Quinzena/Decêndio do Período
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento,  6); // Ordem do Estabelecimento
  sLinha := sLinha + CompletaZero(psCNPJIncorporacao,     14); // CNPJ da Incorporação
  sLinha := sLinha + CompletaZero('',                      1); // Reservado
  sLinha := sLinha + CompletaZero(psValorDebito,          14); // Valor do Débito
  sLinha := sLinha + CompletaZero(psBalancoReducao,        1); // Balanço de Redução
  sLinha := sLinha + CompletaZero(psDivideQuotas,          1); // O Saldo será dividido em quotas
  sLinha := sLinha + CompletaZero('',                      1); // Reservado
  // Alterado por FHBS - SOL: 152945 KTN: 1159709
  sLinha := sLinha + CompletaZero('',                      1); // Débito de SCP/INC
  //sLinha := sLinha + Completa    ('',                     10); // Reservado
  sLinha := sLinha + Completa    ('',                      9); // Reservado
  // Fim - Alterado por FHBS - SOL: 152945 KTN: 1159709
  sLinha := sLinha + sTerminador;                              // Delemitador de Registro

  Result := sLinha
End;

function TCtrlGeraDCTF.GeraPagamentoComDARF(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                            psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                            psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                            psOrdemEstabelecimento, psCNPJIncorporacao,
                                            psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                            psDataVencimento, psNumReferencia, psValorPrincipal,
                                            psValorMulta, psValorJuros, psValorPagoDebito :String): String;
Var sLinha :String;
begin
  { Limpa Linha }
  psDataVencimento := StringReplace(psDataVencimento, '/', '', [rfReplaceAll]);

  { Gerando Linhas }

  sLinha :=          Completa    ('R11',                   3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                 14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,      6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,              1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,            8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,          2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,         6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,         1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,    4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psMBQSPeriodo,           2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período
  sLinha := sLinha + CompletaZero(psDSQDPeriodo,           2); // Dia/Semana/Quinzena/Decêndio do Período
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento,  6); // Ordem do Estabelecimento
  sLinha := sLinha + CompletaZero(psCNPJIncorporacao,     14); // CNPJ da Incorporação
  sLinha := sLinha + CompletaZero('',                      1); // Reservado
  sLinha := sLinha + Completa    (psPeriodoApuracao,       8); // Periodo de Apuração
  sLinha := sLinha + CompletaZero(psCNPJdoDARF,           14); // CNPJ do DARF
  sLinha := sLinha + CompletaZero(psCodigoReceitaDARF,     4); // Código da Receita do DARF
  sLinha := sLinha + Completa    (psDataVencimento,        8); // Data do Vencimento
  sLinha := sLinha + Completa    (psNumReferencia,        17); // Numero de Referencia
  sLinha := sLinha + CompletaZero(psValorPrincipal,       14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,           14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,           14); // Valor dos Juros
  sLinha := sLinha + CompletaZero(psValorPagoDebito,      14); // Valor pago do Débito
  sLinha := sLinha + Completa    ('',                     10); // Reservado
  sLinha := sLinha + sTerminador;                              // Delemitador de Registro

  Result := sLinha;
end;

function TCtrlGeraDCTF.GeraCompensacaoPagamentoIndevido(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                                        psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                                        psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                                        psOrdemEstabelecimento, psCNPJIncorporacao,
                                                        psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                                        psDataVencimento, psNumReferencia, psValorPrincipal,
                                                        psValorMulta, psValorJuros, psValorPagoDebito,
                                                        psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;
Var sLinha:String;
begin
  { Critica }

  // se psFormalizaPedido = 3 obrigatório o psCNPJdoDARF e psCodigoReceitaDARF
  // se psCodigoReceitaDARF = 4028 p psNumReferencia = Codigo do Municipio
  // se psCodigoReceitaDARF = 1070 p psNumReferencia = Codigo do Imóvel Rural

  { Gerando Linhas }

  sLinha :=          Completa    ('R12',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psMBQSPeriodo,            2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período
  sLinha := sLinha + CompletaZero(psDSQDPeriodo,            2); // Dia/Semana/Quinzena/Decêndio do Período
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento,   6); // Ordem do Estabelecimento
  sLinha := sLinha + Completa    (psCNPJIncorporacao,      14); // CNPJ da Incorporação
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psPeriodoApuracao,        8); // Periodo de Apuração
  sLinha := sLinha + Completa    (psCNPJdoDARF,            14); // CNPJ do DARF
  sLinha := sLinha + CompletaZero(psCodigoReceitaDARF,      4); // Código da Receita do DARF
  sLinha := sLinha + Completa    (psDataVencimento,         8); // Data do Vencimento
  sLinha := sLinha + Completa    (psNumReferencia,         17); // Numero de Referencia
  sLinha := sLinha + CompletaZero(psValorPrincipal,        14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,            14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,            14); // Valor dos Juros
  sLinha := sLinha + CompletaZero(psValorCompensadoDebito, 14); // Valor Compensado do Débito
  sLinha := sLinha + CompletaZero(psFormalizaPedido,        1); // Formalização do Pedido
  sLinha := sLinha + Completa    (psPERDCOMP,              24); // Número do PERDCOMP ou Processo
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      50); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraOutraCompensacoes(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                             psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                             psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                             psOrdemEstabelecimento, psCNPJIncorporacao, psTipoCredito,
                                             psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;
Var sLinha:String;
begin
  { Gerando Linhas }

  sLinha :=          Completa    ('R13',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psMBQSPeriodo,            2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período
  sLinha := sLinha + CompletaZero(psDSQDPeriodo,            2); // Dia/Semana/Quinzena/Decêndio do Período
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento,   6); // Ordem do Estabelecimento
  sLinha := sLinha + Completa    (psCNPJIncorporacao,      14); // CNPJ da Incorporação
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psTipoCredito,            2); // Tipo de Crédito
  sLinha := sLinha + CompletaZero(psValorCompensadoDebito, 14); // Valor Compenssado do Debito
  sLinha := sLinha + CompletaZero(psFormalizaPedido,        1); // Formalização do Pedido
  sLinha := sLinha + Completa    (psPERDCOMP,              24); // Número do PERDCOMP ou Processo
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      50); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraSuspensao(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                     psGrupoTributo, psCodigoReceita1, psPeriodicidade,
                                     psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                     psOrdemEstabelecimento, psCNPJIncorporacao,
                                     psValorSuspensoDebito, psMotivoSuspensao, psDeposito,
                                     psNumeroProcesso, psVara, psMunicipio, psUF,
                                     psIdentificaDebito, psPEriodoApuracao, psCPF_CNPJ,
                                     psCodigoReceita2, psDataVencimento, psValorPrincipal,
                                     psValorMulta, psValorJuros:String):String;
Var sLinha:String;
begin
  { Limpa Linha }
  
  psDataVencimento := StringReplace(psDataVencimento, '/', '', [rfReplaceAll]);

  psNumeroProcesso := StringReplace(psNumeroProcesso, '.', '', [rfReplaceAll]);
  psNumeroProcesso := StringReplace(psNumeroProcesso, '-', '', [rfReplaceAll]);
  psNumeroProcesso := StringReplace(psNumeroProcesso, ',', '', [rfReplaceAll]); //CPrev - 27935
  psNumeroProcesso := StringReplace(psNumeroProcesso, '/', '', [rfReplaceAll]); //CPrev - 27935

  psVara := StringReplace(psVara, 'º', '', [rfReplaceAll]);
  psVara := StringReplace(psVara, 'ª', '', [rfReplaceAll]);

  psMunicipio := StringReplace(psMunicipio, 'º', '', [rfReplaceAll]);
  psMunicipio := StringReplace(psMunicipio, 'ª', '', [rfReplaceAll]);

  { Criticas }

  If StrToFloat(psValorSuspensoDebito) <= 0 Then Exit; 

  IF (psMotivoSuspensao = '2') or (psMotivoSuspensao = '5') Then psDeposito := '1';

  IF psMotivoSuspensao = '7' Then
  Begin
    psDeposito := '0';
    psNumeroProcesso := '';
  End; // Senão será obrigatório

  IF (psMotivoSuspensao = '5') or (psMotivoSuspensao = '7') Then
  Begin
    psVara      := '';
    psMunicipio := '';
    psUF        := '';
  End; // Senão será obrigatório

  // Se psDeposito = 1 será obrigatorio os campos
  //   psIdentificaDebito, psPEriodoApuracao, psCPF_CNPJ, psCodigoReceita,
  //   psDataVencimento, psValorPrincipal, psValorMulta, psValorJuros


  { Gerando Linhas }

  sLinha :=          Completa    ('R14',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita1,         6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psMBQSPeriodo,            2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período
  sLinha := sLinha + CompletaZero(psDSQDPeriodo,            2); // Dia/Semana/Quinzena/Decêndio do Período
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento,   6); // Ordem do Estabelecimento
  sLinha := sLinha + CompletaZero(psCNPJIncorporacao,      14); // CNPJ da Incorporação
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + CompletaZero(psValorSuspensoDebito,   14); // Valor Suspenso do Débito
  sLinha := sLinha + CompletaZero(psMotivoSuspensao,        1); // Motivo da Suspensão
  sLinha := sLinha + Completa    (psDeposito,               1); // Deposito
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psNumeroProcesso,        24); // Numero do Processo
  sLinha := sLinha + CompletaZero(psVara,                   2); // Vara
  sLinha := sLinha + Completa    (psMunicipio,             50); // Municipio
  sLinha := sLinha + CompletaZero(psUF,                     2); // UF
  sLinha := sLinha + Completa    (psIdentificaDebito,      20); // Identificacao do Debito
  sLinha := sLinha + Completa    (psPEriodoApuracao,        8); // Periodo de Apuracao
  sLinha := sLinha + Completa    (psCPF_CNPJ,              14); // CPF/CNPJ
  sLinha := sLinha + Completa    (psCodigoReceita2,         4); // Código da Receita
  sLinha := sLinha + Completa    (psDataVencimento,         8); // Data do Vencimento
  sLinha := sLinha + CompletaZero(psValorPrincipal,        14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,            14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,            14); // Valor dos Juros
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraParcelamento(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                        psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                        psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                        psOrdemEstabelecimento, psCNPJIncorporacao, psNumeroProcesso,
                                        psValorParceladoDebito:String):String;
Var sLinha:String;                                                              
Begin
  { Gerando Linhas }

  sLinha :=          Completa    ('R15',                     3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psMBQSPeriodo,            2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período
  sLinha := sLinha + CompletaZero(psDSQDPeriodo,            2); // Dia/Semana/Quinzena/Decêndio do Período
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento,   6); // Ordem do Estabelecimento
  sLinha := sLinha + Completa    (psCNPJIncorporacao,      14); // CNPJ da Incorporação
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psNumeroProcesso,        24); // Numero do Processo
  sLinha := sLinha + Completa    (psValorParceladoDebito,  14); // Valor Parcelado do Débito
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraDeducaoComDARF(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                          psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                          psAnoPeriodoApuracao, psMBQSPeriodo, psDSQDPeriodo,
                                          psOrdemEstabelecimento, psCNPJIncorporacao,
                                          psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                          psDataVencimento, psNumReferencia, psValorPrincipal,
                                          psValorMulta, psValorJuros, psValorPagoDebito,
                                          psValorDeduzidoDebito:String):String;
Var sLinha:String;
begin
  { Criticas }

  // Ver no relatório

  { Gerando Linhas }

  sLinha :=          Completa    ('R16',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psMBQSPeriodo,            2); // Mês/Bimestre/Trimestre/Quadrimestre/Semestre do Período
  sLinha := sLinha + CompletaZero(psDSQDPeriodo,            2); // Dia/Semana/Quinzena/Decêndio do Período
  sLinha := sLinha + CompletaZero(psOrdemEstabelecimento,   6); // Ordem do Estabelecimento
  sLinha := sLinha + Completa    (psCNPJIncorporacao,      14); // CNPJ da Incorporação
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psPeriodoApuracao,        8); // Periodo de Apuração
  sLinha := sLinha + Completa    (psCNPJdoDARF,            14); // CNPJ do DARF
  sLinha := sLinha + CompletaZero(psCodigoReceitaDARF,      4); // Código da Receita do DARF
  sLinha := sLinha + Completa    (psDataVencimento,         8); // Data do Vencimento
  sLinha := sLinha + Completa    (psNumReferencia,         17); // Numero de Referencia
  sLinha := sLinha + CompletaZero(psValorPrincipal,        14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,            14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,            14); // Valor dos Juros
  sLinha := sLinha + CompletaZero(psValorDeduzidoDebito,   14); // Valor Deduzido do Débito
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraDebitoApuradoCreditoVinculado_TA(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                                                          psDataEvento, psGrupoTributo, psCodigoReceita,
                                                                          psPeriodicidade, psAnoPeriodoApuracao,
                                                                          psTrimestrePeriodo, psValorDebito,
                                                                          psQuantidadeQuota:String):String;
Var sLinha:String;
Begin
  { Criticas }

  // Ver no relatório

  { Gerando Linhas }

  sLinha :=          Completa    ('R20',                 3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,               14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,    6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,            1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,          8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,        2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,       6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,       1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,  4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,    2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                    2); // Reservado
  sLinha := sLinha + CompletaZero('',                    6); // Reservado
  sLinha := sLinha + CompletaZero('',                   14); // Reservado
  sLinha := sLinha + CompletaZero('',                    1); // Reservado
  sLinha := sLinha + CompletaZero(psValorDebito,        14); // Valor do Debito
  sLinha := sLinha + CompletaZero('',                    1); // Reservado
  sLinha := sLinha + CompletaZero('',                    1); // Reservado
  sLinha := sLinha + CompletaZero(psQuantidadeQuota,     1); // Quantidade de Quotas
  sLinha := sLinha + Completa    ('',                   10); // Reservado
  sLinha := sLinha + sTerminador;                            // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraPagamentoComDARF_TA(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                               psDataEvento, psGrupoTributo, psCodigoReceita,
                                               psPeriodicidade, psAnoPeriodoApuracao,
                                               psTrimestrePeriodo, psPeriodoApuracao,
                                               psCNPJdoDARF, psCodigoReceitaDARF, psDataVencimento,
                                               psNumReferencia, psValorPrincipal, psValorMulta,
                                               psValorJuros, psValorPagoDebito :String):String;
Var sLinha:String;
Begin
  { Criticas }

  // Ver no relatório

  { Gerando Linhas }

  sLinha :=          Completa    ('R21',                 3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,               14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,    6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,            1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,          8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,        2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,       6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,       1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,  4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,    2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                    2); // Reservado
  sLinha := sLinha + CompletaZero('',                    6); // Reservado
  sLinha := sLinha + CompletaZero('',                   14); // Reservado
  sLinha := sLinha + CompletaZero('',                    1); // Reservado
  sLinha := sLinha + Completa    (psPeriodoApuracao,     8); // Periodo de Apuração
  sLinha := sLinha + Completa    (psCNPJdoDARF,         14); // CNPJ do DARF
  sLinha := sLinha + CompletaZero(psCodigoReceitaDARF,   4); // Código da Receita do DARF
  sLinha := sLinha + Completa    (psDataVencimento,      8); // Data do Vencimento
  sLinha := sLinha + Completa    (psNumReferencia,      17); // Numero de Referencia
  sLinha := sLinha + CompletaZero(psValorPrincipal,     14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,         14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,         14); // Valor dos Juros
  sLinha := sLinha + CompletaZero(psValorPagoDebito,    14); // Valor Pago do Débito
  sLinha := sLinha + Completa    ('',                   10); // Reservado
  sLinha := sLinha + sTerminador;                            // Delemitador de Registro
End;

function TCtrlGeraDCTF.GeraCompensacaoPagamentoIndevido_TA(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                                           psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                                           psAnoPeriodoApuracao, psTrimestrePeriodo,
                                                           psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                                           psDataVencimento, psNumReferencia, psValorPrincipal,
                                                           psValorMulta, psValorJuros, psValorPagoDebito,
                                                           psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;
Var sLinha:String;
begin
  { Critica }

  // se psFormalizaPedido = 3 obrigatório o psCNPJdoDARF e psCodigoReceitaDARF
  // se psCodigoReceitaDARF = 4028 p psNumReferencia = Codigo do Municipio
  // se psCodigoReceitaDARF = 1070 p psNumReferencia = Codigo do Imóvel Rural

  { Gerando Linhas }

  sLinha :=          Completa    ('R22',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,       2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                       2); // Reservado
  sLinha := sLinha + CompletaZero('',                       6); // Reservado
  sLinha := sLinha + CompletaZero('',                      14); // Reservado
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psPeriodoApuracao,        8); // Periodo de Apuração
  sLinha := sLinha + Completa    (psCNPJdoDARF,            14); // CNPJ do DARF
  sLinha := sLinha + CompletaZero(psCodigoReceitaDARF,      4); // Código da Receita do DARF
  sLinha := sLinha + Completa    (psDataVencimento,         8); // Data do Vencimento
  sLinha := sLinha + Completa    (psNumReferencia,         17); // Numero de Referencia
  sLinha := sLinha + CompletaZero(psValorPrincipal,        14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,            14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,            14); // Valor dos Juros
  sLinha := sLinha + CompletaZero(psValorCompensadoDebito, 14); // Valor Compensado do Débito
  sLinha := sLinha + CompletaZero(psFormalizaPedido,        1); // Formalização do Pedido
  sLinha := sLinha + Completa    (psPERDCOMP,              24); // Número do PERDCOMP ou Processo
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      50); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraOutraCompensacoes_TA(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                                psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                                psAnoPeriodoApuracao, psTrimestrePeriodo, psTipoCredito,
                                                psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;
Var sLinha:String;
begin
  { Gerando Linhas }

  sLinha :=          Completa    ('R23',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,       2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                       2); // Reservado
  sLinha := sLinha + CompletaZero('',                       6); // Reservado
  sLinha := sLinha + CompletaZero('',                      14); // Reservado
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psTipoCredito,            2); // Tipo de Crédito
  sLinha := sLinha + CompletaZero(psValorCompensadoDebito, 14); // Valor Compenssado do Debito
  sLinha := sLinha + CompletaZero(psFormalizaPedido,        1); // Formalização do Pedido
  sLinha := sLinha + Completa    (psPERDCOMP,              24); // Número do PERDCOMP ou Processo
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      50); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraSuspensao_TA(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                        psGrupoTributo, psCodigoReceita1, psPeriodicidade,
                                        psAnoPeriodoApuracao, psTrimestrePeriodo,
                                        psValorSuspensoDebito, psMotivoSuspensao, psDeposito,
                                        psNumeroProcesso, psVara, psMunicipio, psUF,
                                        psIdentificaDebito, psPEriodoApuracao, psCPF_CNPJ,
                                        psCodigoReceita2, psDataVencimento, psValorPrincipal,
                                        psValorMulta, psValorJuros:String):String;
Var sLinha:String;
begin
  { Criticas }

  IF (psMotivoSuspensao = '2') or (psMotivoSuspensao = '5') Then psDeposito := '1';

  IF psMotivoSuspensao = '7' Then
  Begin
    psDeposito := '0';
    psNumeroProcesso := '';
  End; // Senão será obrigatório

  IF (psMotivoSuspensao = '5') or (psMotivoSuspensao = '7') Then
  Begin
    psVara      := '';
    psMunicipio := '';
    psUF        := '';
  End; // Senão será obrigatório

  // Se psDeposito = 1 será obrigatorio os campos
  //   psIdentificaDebito, psPEriodoApuracao, psCPF_CNPJ, psCodigoReceita,
  //   psDataVencimento, psValorPrincipal, psValorMulta, psValorJuros

  { Gerando Linhas }

  sLinha :=          Completa    ('R24',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita1,         6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,       2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                       2); // Reservado
  sLinha := sLinha + CompletaZero('',                       6); // Reservado
  sLinha := sLinha + CompletaZero('',                      14); // Reservado
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psValorSuspensoDebito,   14); // Valor Suspenso do Débito
  sLinha := sLinha + CompletaZero(psMotivoSuspensao,        1); // Motivo da Suspensão
  sLinha := sLinha + Completa    (psDeposito,               1); // Deposito
  sLinha := sLinha + Completa    ('',                       1); // Reservado
  sLinha := sLinha + Completa    (psNumeroProcesso,        24); // Numero do Processo
  sLinha := sLinha + CompletaZero(psVara,                   2); // Vara
  sLinha := sLinha + Completa    (psMunicipio,             50); // Municipio
  sLinha := sLinha + CompletaZero(psUF,                     2); // UF
  sLinha := sLinha + Completa    (psIdentificaDebito,      20); // Identificacao do Debito
  sLinha := sLinha + Completa    (psPEriodoApuracao,        8); // Periodo de Apuracao
  sLinha := sLinha + Completa    (psCPF_CNPJ,              14); // CPF/CNPJ
  sLinha := sLinha + Completa    (psCodigoReceita2,         4); // Código da Receita
  sLinha := sLinha + Completa    (psDataVencimento,         8); // Data do Vencimento
  sLinha := sLinha + CompletaZero(psValorPrincipal,        14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,            14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,            14); // Valor dos Juros
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraParcelamento_TA(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                           psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                           psAnoPeriodoApuracao, psTrimestrePeriodo,
                                           psNumeroProcesso, psValorParceladoDebito:String):String;
Var sLinha:String;
Begin
  { Gerando Linhas }

  sLinha :=          Completa    ('R25',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,       2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                       2); // Reservado
  sLinha := sLinha + CompletaZero('',                       6); // Reservado
  sLinha := sLinha + CompletaZero('',                      14); // Reservado
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    (psNumeroProcesso,        24); // Numero do Processo
  sLinha := sLinha + Completa    (psValorParceladoDebito,  14); // Valor Parcelado do Débito
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraQuotas(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                  psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                  psAnoPeriodoApuracao, psTrimestrePeriodo, psNumeroQuota:String):String;
Var sLinha:String;
Begin
  sLinha :=          Completa    ('R30',                 3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,               14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,    6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,            1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,          8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,        2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,       6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,       1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,  4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,    2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                    2); // Reservado
  sLinha := sLinha + CompletaZero('',                    6); // Reservado
  sLinha := sLinha + CompletaZero('',                   14); // Reservado
  sLinha := sLinha + Completa    (psNumeroQuota,         1); // Numero da Quota
  sLinha := sLinha + Completa    ('',                   10); // Reservado
  sLinha := sLinha + sTerminador;
End;

function TCtrlGeraDCTF.GeraPagamentoComDARFdaQuotas(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                                    psDataEvento, psGrupoTributo, psCodigoReceita,
                                                    psPeriodicidade, psAnoPeriodoApuracao,
                                                    psTrimestrePeriodo, psNumeroQuota, psPeriodoApuracao,
                                                    psCNPJdoDARF, psCodigoReceitaDARF, psDataVencimento,
                                                    psNumReferencia, psValorPrincipal, psValorMulta,
                                                    psValorJuros, psValorPagoDebito:String):String;
Var sLinha:String;
Begin
  { Criticas }

  // Ver no relatório

  { Gerando Linhas }

  sLinha :=          Completa    ('R31',                 3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,               14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,    6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,            1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,          8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,        2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,       6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,       1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,  4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,    2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                    2); // Reservado
  sLinha := sLinha + CompletaZero('',                    6); // Reservado
  sLinha := sLinha + CompletaZero('',                   14); // Reservado
  sLinha := sLinha + Completa    (psNumeroQuota,         1); // Numero da Quota
  sLinha := sLinha + Completa    (psPeriodoApuracao,     8); // Periodo de Apuração
  sLinha := sLinha + Completa    (psCNPJdoDARF,         14); // CNPJ do DARF
  sLinha := sLinha + CompletaZero(psCodigoReceitaDARF,   4); // Código da Receita do DARF
  sLinha := sLinha + Completa    (psDataVencimento,      8); // Data do Vencimento
  sLinha := sLinha + Completa    (psNumReferencia,      17); // Numero de Referencia
  sLinha := sLinha + CompletaZero(psValorPrincipal,     14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,         14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,         14); // Valor dos Juros
  sLinha := sLinha + CompletaZero(psValorPagoDebito,    14); // Valor Pago do Débito
  sLinha := sLinha + Completa    ('',                   10); // Reservado
  sLinha := sLinha + sTerminador;                            // Delemitador de Registro
End;

function TCtrlGeraDCTF.GeraCompensacaoPagamentoIndevidoQuotas(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                                              psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                                              psAnoPeriodoApuracao, psTrimestrePeriodo, psNumeroQuota,
                                                              psPeriodoApuracao, psCNPJdoDARF, psCodigoReceitaDARF,
                                                              psDataVencimento, psNumReferencia, psValorPrincipal,
                                                              psValorMulta, psValorJuros, psValorPagoDebito,
                                                              psValorCompensadoDebito, psFormalizaPedido, psPERDCOMP:String):String;
Var sLinha:String;
begin
  { Critica }

  // se psFormalizaPedido = 3 obrigatório o psCNPJdoDARF e psCodigoReceitaDARF
  // se psCodigoReceitaDARF = 4028 p psNumReferencia = Codigo do Municipio
  // se psCodigoReceitaDARF = 1070 p psNumReferencia = Codigo do Imóvel Rural

  { Gerando Linhas }

  sLinha :=          Completa    ('R32',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,       2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                       2); // Reservado
  sLinha := sLinha + CompletaZero('',                       6); // Reservado
  sLinha := sLinha + CompletaZero('',                      14); // Reservado
  sLinha := sLinha + Completa    (psNumeroQuota,            1); // Numero da Quota
  sLinha := sLinha + Completa    (psPeriodoApuracao,        8); // Periodo de Apuração
  sLinha := sLinha + Completa    (psCNPJdoDARF,            14); // CNPJ do DARF
  sLinha := sLinha + CompletaZero(psCodigoReceitaDARF,      4); // Código da Receita do DARF
  sLinha := sLinha + Completa    (psDataVencimento,         8); // Data do Vencimento
  sLinha := sLinha + Completa    (psNumReferencia,         17); // Numero de Referencia
  sLinha := sLinha + CompletaZero(psValorPrincipal,        14); // Valor do Principal
  sLinha := sLinha + CompletaZero(psValorMulta,            14); // Valor da Multa
  sLinha := sLinha + CompletaZero(psValorJuros,            14); // Valor dos Juros
  sLinha := sLinha + CompletaZero(psValorCompensadoDebito, 14); // Valor Compensado do Débito
  sLinha := sLinha + CompletaZero(psFormalizaPedido,        1); // Formalização do Pedido
  sLinha := sLinha + Completa    (psPERDCOMP,              24); // Número do PERDCOMP ou Processo
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      50); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraSuspensaodaQuotas(psCNPJ, psAnoMesOcorrencia, psSituacao, psDataEvento,
                                             psGrupoTributo, psCodigoReceita, psPeriodicidade,
                                             psAnoPeriodoApuracao, psTrimestrePeriodo, psNumeroQuota,
                                             psTipoCredito, psValorCompensadoDebito, psFormalizaPedido,
                                             psPERDCOMP:String):String;
Var sLinha:String;
begin
  { Gerando Linhas }

  sLinha :=          Completa    ('R33',                    3); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,                  14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,       6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,               1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,             8); // Data do Evento
  sLinha := sLinha + CompletaZero(psGrupoTributo,           2); // Grupo de Tributo
  sLinha := sLinha + CompletaZero(psCodigoReceita,          6); // Código da Receita
  sLinha := sLinha + Completa    (psPeriodicidade,          1); // Periodicidade
  sLinha := sLinha + CompletaZero(psAnoPeriodoApuracao,     4); // Ano do Período de Apuração
  sLinha := sLinha + CompletaZero(psTrimestrePeriodo,       2); // Trimestre do periodo de apuração
  sLinha := sLinha + CompletaZero('',                       2); // Reservado
  sLinha := sLinha + CompletaZero('',                       6); // Reservado
  sLinha := sLinha + CompletaZero('',                      14); // Reservado
  sLinha := sLinha + Completa    (psNumeroQuota,            1); // Numero da Quota
  sLinha := sLinha + Completa    (psTipoCredito,            2); // Tipo de Crédito
  sLinha := sLinha + CompletaZero(psValorCompensadoDebito, 14); // Valor Compenssado do Debito
  sLinha := sLinha + CompletaZero(psFormalizaPedido,        1); // Formalização do Pedido
  sLinha := sLinha + Completa    (psPERDCOMP,              24); // Número do PERDCOMP ou Processo
  sLinha := sLinha + CompletaZero('',                       1); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      50); // Reservado
  sLinha := sLinha + Completa    ('',                       2); // Reservado
  sLinha := sLinha + Completa    ('',                      10); // Reservado
  sLinha := sLinha + sTerminador;                               // Delemitador de Registro

  Result := sLinha;
End;

function TCtrlGeraDCTF.GeraTrailler(psCNPJ, psAnoMesOcorrencia, psSituacao,
                                    psDataEvento, psQuantidadeRegistro:String):String;
Var sLinha:String;
begin
  { Gerando Linhas }

  sLinha :=          Completa    ('T9',                  2); // Tipo
  sLinha := sLinha + Completa    (psCNPJ,               14); // CNPJ do Contribuinte
  sLinha := sLinha + CompletaZero(psAnoMesOcorrencia,    6); // Mês de Ocorrência do Fator Gerador
  sLinha := sLinha + CompletaZero(psSituacao,            1); // Situação
  sLinha := sLinha + CompletaZero(psDataEvento,          8); // Data do Evento
  sLinha := sLinha + CompletaZero(psQuantidadeRegistro,  5); // Quantidade de Registro
  sLinha := sLinha + Completa    ('',                   56); // Reservado
  sLinha := sLinha + Completa    ('',                   10); // HashCode
  sLinha := sLinha + sTerminador;                            // Delemitador de Registro

  Result := sLinha;
End;

{ Geração do Layout do arquivo de exportação - Fim }
{--------------------------------------------------}

function TCtrlGeraDCTF.Exporta(Arquivo, idResponsavel, sCRCResponsavel, sUFResponsavel,
                               idRepresentante, sAnoCalendario, sMesCopetencia, sTipoDeclaracao,
                               sUltReciboRatificada, sPeriodoInicial, sPeriodoFinal,
                               sSituacao, sNaturezaJuridica, sCNAE,
                               sDataOcorrencia, sBalancoReducao,
                               sFormaTributacao, sQualificacaoPJ,
                               sLevantouBalanco, sComDebitoSCP, sEsteveInativa,
                               sComIncorporacao, sObrigadaApresentacao:String): Boolean;
Var sAnoMesOcorrencia,
    sMesOcorrencia,
    sCNPJIncorporacao,
    sPeriodoApuracao,
    sInicioPeriodo, sFinalPeriodo, sCodNaturezaCompleto:String;
    ptpgTipoGeracao : TTipoGeracao;
begin
   // Inicializar Variáveis
   result := False;

   iQuantidadeRegistro := 0;

   // Limpar Datas
   sPeriodoInicial := StringReplace(sPeriodoInicial, '/', '', [rfReplaceAll]);
   sPeriodoFinal   := StringReplace(sPeriodoFinal,  '/', '', [rfReplaceAll]);
   sDataOcorrencia := ConverteData(StringReplace(sDataOcorrencia, '/', '', [rfReplaceAll]));

   // Criticas da Geração

   If sSituacao = '00' Then sDataOcorrencia := '';

   // Inicia a Gravação do Arquivo

   If CriaArquivo( Arquivo ) Then
   Begin
     cdsFundacao.Data      := ListaFundacao;

     cdsRepresentante.Data := ListaPessoaFisisca(idRepresentante);
     cdsResponsavel.Data   := ListaPessoaFisisca(idResponsavel);

     GravaLinha( Arquivo, GeraHeader(sAnoCalendario, sMesCopetencia, sTipoDeclaracao,
                                     cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                     cdsFundacao.FieldByName('RAZAOSOCIAL').AsString,
                                     cdsFundacao.FieldByName('UF').AsString,
                                     sSituacao, sPeriodoInicial, sPeriodoFinal,
                                     sDataOcorrencia) );

    sAnoMesOcorrencia := Copy(sPeriodoInicial, 5, 4) + Copy(sPeriodoInicial, 3, 2);
    sMesOcorrencia    := Copy(sPeriodoInicial, 3, 2);
    sInicioPeriodo    := Copy(sPeriodoInicial, 1, 4);
    sFinalPeriodo     := Copy(sPeriodoFinal,   1, 4);
    sSituacao         := Copy(sSituacao,       2, 1);

    GravaLinha( Arquivo, GeraDadosIniciais( cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                            sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                            sInicioPeriodo, sFinalPeriodo, sTipoDeclaracao,
                                            sUltReciboRatificada, sFormaTributacao, sQualificacaoPJ,
                                            sLevantouBalanco, sComDebitoSCP, sEsteveInativa,
                                            sComIncorporacao, sObrigadaApresentacao) );

    GravaLinha( Arquivo, GeraDadosCadastraisEstabelecimento( cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                             sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                                             cdsFundacao.FieldByName('RAZAOSOCIAL').AsString,
                                                             sNaturezaJuridica,
                                                             cdsFundacao.FieldByName('LOGRADOURO').AsString,
                                                             cdsFundacao.FieldByName('NUMERO').AsString,
                                                             cdsFundacao.FieldByName('COMPLEMENTO').AsString,
                                                             cdsFundacao.FieldByName('BAIRRO').AsString,
                                                             cdsFundacao.FieldByName('MUNICIPIO').AsString,
                                                             cdsFundacao.FieldByName('UF').AsString,
                                                             cdsFundacao.FieldByName('CEP').AsString,
                                                             cdsFundacao.FieldByName('DDD').AsString,
                                                             cdsFundacao.FieldByName('NUMEROTEL').AsString,
                                                             cdsFundacao.FieldByName('DDDFAX').AsString,
                                                             cdsFundacao.FieldByName('NUMEROFAX').AsString,
                                                             '', '', '',
                                                             cdsFundacao.FieldByName('EMAIL').AsString ) );

    GravaLinha( Arquivo, GeraDadosResponsavelxRepresentante( cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                             sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                                             cdsRepresentante.FieldByName('RAZAOSOCIAL').AsString,
                                                             cdsRepresentante.FieldByName('NUMDOCUMENTO').AsString,
                                                             cdsRepresentante.FieldByName('DDD').AsString,
                                                             cdsRepresentante.FieldByName('TELEFONE').AsString,
                                                             '',
                                                             cdsRepresentante.FieldByName('DDD').AsString,
                                                             cdsRepresentante.FieldByName('FAX').AsString,
                                                             cdsRepresentante.FieldByName('EMAIL').AsString,
                                                             //'',
                                                             cdsResponsavel.FieldByName('RAZAOSOCIAL').AsString,
                                                             cdsResponsavel.FieldByName('NUMDOCUMENTO').AsString,
                                                             sCRCResponsavel, sUFResponsavel,
                                                             cdsResponsavel.FieldByName('DDD').AsString,
                                                             cdsResponsavel.FieldByName('TELEFONE').AsString,
                                                            '',
                                                             cdsResponsavel.FieldByName('DDD').AsString,
                                                             cdsResponsavel.FieldByName('FAX').AsString,
                                                             cdsResponsavel.FieldByName('EMAIL').AsString



                                                             ));


    ////////////////////////////////////
    //    Gerando Linhas Normais      //
    ////////////////////////////////////

    cdsDebitoApuradoeCreditoVinculado.Data := ListaDebitoApuradoeCreditoVinculado('1', sPeriodoInicial, sPeriodoFinal, '', tpgNormal);

    cdsDebitoApuradoeCreditoVinculado.First;

    While not cdsDebitoApuradoeCreditoVinculado.EOF do
    Begin

      MontaTabelaData(cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString,
                      Copy(sAnoMesOcorrencia, 5, 2) + '/' + Copy(sAnoMesOcorrencia, 1, 4));

      cdsTabelaDatas.First;

      While Not cdsTabelaDatas.EOF do
      Begin
        sPeriodoInicial   := cdsTabelaDatas.FieldByName('DATAINICIO').AsString;
        sPeriodoFinal     := cdsTabelaDatas.FieldByName('DATAFIM').AsString;

        cdsDebitoApuradoeCreditoVinculadoTotal.Data := ListaDebitoApuradoeCreditoVinculado('1', sPeriodoInicial, sPeriodoFinal,
                                                                                           cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString, tpgNormal);

        Inc(iQuantidadeRegistro);

        sCNPJIncorporacao := '';

        If cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString = '10' Then
           sCNPJIncorporacao := cdsFundacao.FieldByName('NUMDOCUMENTO').AsString;

        sCodNaturezaCompleto := cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString +
                                cdsDebitoApuradoeCreditoVinculado.FieldByName('VARIACAO').AsString;

        //CPREV - Pend. 21820
        if not cdsDebitoApuradoeCreditoVinculadoTotal.IsEmpty then
        begin
          GravaLinha( Arquivo, GeraDebitoCreditoVinculados( cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                            sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                                            cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString,
                                                            sCodNaturezaCompleto,
                                                            cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString,
                                                            sAnoCalendario, sMesOcorrencia,
                                                            RetornaPeriodo(cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString, sPeriodoFinal),
                                                            '', sCNPJIncorporacao,
                                                            FormataValor(2, cdsDebitoApuradoeCreditoVinculadoTotal.FieldByName('VALOR_TOTAL').AsString),
                                                            sBalancoReducao, '0' ) );
        end;

        // Pagamento Com Darf 
        cdsPagamentoComDARF.Data := ListaPagamentoComDARF('1',
                                                          sPeriodoInicial,
                                                          sPeriodoFinal,
                                                          cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString,
                                                          cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString,
                                                          tpgNormal);

        cdsPagamentoComDARF.First;

        While Not cdsPagamentoComDARF.Eof do
        Begin
          Inc(iQuantidadeRegistro);

          GravaLinha( Arquivo, GeraPagamentoComDARF(  cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                      sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                                      cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString,
                                                      sCodNaturezaCompleto,
                                                      cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString,
                                                      sAnoCalendario, sMesOcorrencia,
                                                      RetornaPeriodo(cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString, sPeriodoFinal),
                                                      '', sCNPJIncorporacao,
                                                      cdsPagamentoComDARF.FieldByName('DATAFINALAPURACAO').AsString,
                                                      cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                      cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString,
                                                      cdsPagamentoComDARF.FieldByName('DATAVENCDARF').AsString,
                                                      cdsPagamentoComDARF.FieldByName('REFERENCIA').AsString,
                                                      FormataValor(2, cdsPagamentoComDARF.FieldByName('VLRIRRF').AsString),
                                                      FormataValor(2, cdsPagamentoComDARF.FieldByName('VLRMULTA').AsString),
                                                      FormataValor(2, cdsPagamentoComDARF.FieldByName('VLRJUROS').AsString),
                                                      FormataValor(2, cdsPagamentoComDARF.FieldByName('VLRIRRF').AsString) ) );

          cdsPagamentoComDARF.Next;
        End;

        If cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString = '0561' Then
        Begin
          // Suspensao
          cdsSuspensao.Data := ListaSuspensao('1',
                                              sPeriodoInicial,
                                              sPeriodoFinal,
                                              tpgNormal);

          cdsSuspensao.First;

          While Not cdsSuspensao.Eof do
          Begin
            Inc(iQuantidadeRegistro);

            sCodNaturezaCompleto := cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString +
                                    cdsDebitoApuradoeCreditoVinculado.FieldByName('VARIACAO').AsString;

            GravaLinha( Arquivo, GeraSuspensao(  cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                 sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                                 cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString,
                                                 sCodNaturezaCompleto,
                                                 cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString,
                                                 sAnoCalendario, sMesOcorrencia,
                                                 RetornaPeriodo(cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString, sPeriodoFinal),
                                                 '', sCNPJIncorporacao,
                                                 FormataValor(2, cdsSuspensao.FieldByName('VLRIRRF').AsString),
                                                 '2', {'6',} // Edilaine - SOL 184749 - KTN 1729459 - alterado de 6 para 2
                                                 cdsSuspensao.FieldByName('FLGFAZDEPOSITO').AsString,
                                                 cdsSuspensao.FieldByName('NUMEROPROCESSO').AsString,
                                                 cdsSuspensao.FieldByName('CODVARA').AsString,
                                                 cdsSuspensao.FieldByName('NOMEVARA').AsString,
                                                 cdsSuspensao.FieldByName('UFSECAO').AsString,
                                                 cdsSuspensao.FieldByName('CODDOCUMENTO').AsString,
                                                 cdsSuspensao.FieldByName('DATAFINALAPURACAO').AsString,
                                                 cdsSuspensao.FieldByName('NUMDOCUMENTO').AsString,
                                                 '7431',
                                                 cdsSuspensao.FieldByName('DATAVENCDARF').AsString,
                                                 FormataValor(2, cdsSuspensao.FieldByName('VLRIRRF').AsString),
                                                 FormataValor(2, cdsSuspensao.FieldByName('VLRMULTA').AsString),
                                                 FormataValor(2, cdsSuspensao.FieldByName('VLRJUROS').AsString)) );

            cdsSuspensao.Next;
          End;
        End;

        cdsTabelaDatas.Next;
      End;
      cdsDebitoApuradoeCreditoVinculado.Next;
    End;

    ///////////////////////////////////////////////////
    //    Gerando Linhas de Trimestres Anteriores    //
    ///////////////////////////////////////////////////

    If sSituacao <> '0' Then
    Begin
      cdsDebitoApuradoeCreditoVinculado.Data := ListaDebitoApuradoeCreditoVinculado('1', sPeriodoInicial, sPeriodoFinal, '', tpgTriAnterior);

      cdsDebitoApuradoeCreditoVinculado.First;

      While not cdsDebitoApuradoeCreditoVinculado.EOF do
      Begin
        Inc(iQuantidadeRegistro);

        sCNPJIncorporacao := '';

        If cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString = '10' Then
           sCNPJIncorporacao := cdsFundacao.FieldByName('NUMDOCUMENTO').AsString;

        sCodNaturezaCompleto := cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString +
                                cdsDebitoApuradoeCreditoVinculado.FieldByName('VARIACAO').AsString;

        GravaLinha( Arquivo, GeraDebitoApuradoCreditoVinculado_TA( cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                                   sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                                                   cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString,
                                                                   sCodNaturezaCompleto,
                                                                   cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString,
                                                                   sAnoCalendario, '4', //Trimestre
                                                                   FormataValor(2, cdsDebitoApuradoeCreditoVinculado.FieldByName('VALOR_TOTAL').AsString),
                                                                   '1' ) );

        cdsPagamentoComDARF.Data := ListaPagamentoComDARF('1',
                                                          sPeriodoInicial,
                                                          sPeriodoFinal,
                                                          cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString,
                                                          cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString,
                                                          tpgTriAnterior);

        cdsPagamentoComDARF.First;

        While Not cdsPagamentoComDARF.Eof do
        Begin
          Inc(iQuantidadeRegistro);

          GravaLinha( Arquivo, GeraPagamentoComDARF_TA(  cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                         sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                                         cdsDebitoApuradoeCreditoVinculado.FieldByName('GRUPOTRIBUTO').AsString,
                                                         sCodNaturezaCompleto,
                                                         cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString,
                                                         sAnoCalendario, '04', //Trimestre
                                                         RetornaPeriodo(cdsDebitoApuradoeCreditoVinculado.FieldByName('PERIODICIDADE').AsString, sPeriodoFinal),
                                                         cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                                         cdsDebitoApuradoeCreditoVinculado.FieldByName('CODNATUREZA').AsString,
                                                         cdsPagamentoComDARF.FieldByName('DATAVENCDARF').AsString,
                                                         cdsPagamentoComDARF.FieldByName('REFERENCIA').AsString,
                                                         FormataValor(2, cdsPagamentoComDARF.FieldByName('VLRIRRF').AsString),
                                                         FormataValor(2, cdsPagamentoComDARF.FieldByName('VLRMULTA').AsString),
                                                         FormataValor(2, cdsPagamentoComDARF.FieldByName('VLRJUROS').AsString),
                                                         FormataValor(2, cdsPagamentoComDARF.FieldByName('VLRIRRF').AsString) ) );

          cdsPagamentoComDARF.Next;
        End;

        cdsDebitoApuradoeCreditoVinculado.Next;
      End;
    End;

    GravaLinha( Arquivo, GeraTrailler( cdsFundacao.FieldByName('NUMDOCUMENTO').AsString,
                                       sAnoMesOcorrencia, sSituacao, sDataOcorrencia,
                                       IntToStr(iQuantidadeRegistro) ) );
   End;

   result := True;
end;


End.





