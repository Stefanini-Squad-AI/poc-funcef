//*******************************************************************************************************
//N. Sol..........: SOL 209775 e SOL 233732
//N. Kintana......: Kintana 2024254 e 233732
//Data............: 17/06/2014
//Responsável.....: Fernando Xavier
//Descrição.......: Na geração do arquivo da DIPJ está com erro ao gerar os campos.
//*******************************************************************************************************
//N. Sol..........: SOL 208941
//N. Kintana......: Kintana 2020125
//Data............: 14/06/2013
//Responsável.....: Thiago Melo
//Descrição.......: A funcionalidade de geração do arquivo txt da DIPJ não está funcionando
//*******************************************************************************************************
//N. Sol..........: SOL 208410/14598
//N. Kintana......: KTN 2014896
//Data............: 07/06/2013
//Responsável.....: Marcio Sanches Spinosa SOL 208410/14598 KTN 2014896
//Descrição.......: ajutes na dacon para emitir o relatorio zerado nos meses de dezembro de cada ano
//*******************************************************************************************************
{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 04/10/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre
Unit uCtrlDaconMT;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbNormaVigente, DB, Dialogs,
   uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF},
   uCmClientDataSet, uDbLinhasDacon, uDbRelatorioDados, Wwquery;

Type
   tCtrlDaconMT = Class(TCmControlObject)
   Private
      DbLinhasDacon: TDbLinhasDacon;
      DbRelatorioDados: TDbRelatorioDados;
   Protected
      Function SelectDadosNumRecibo(Const pNumeroRecibo: String; pExercicio : string; pPeriodo : string; pTipoForm: string; pRetificadora : string; Const pInclueMesAno: Boolean = False): String;
      Function SelectDadosAnaliticos(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pLinha, pIdNorma: Integer): String;
      Function SelectCriacaoTabelaSaldo(Const pExercicio, pPeriodo, pTipoForm: String; Const pIdNorma: Integer): String;
      Function SelectDadosRelatorio(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String): String;
      Function SelectInformacoesAdicionais: String;
      Function SelectInformacoesAdicionaisDIPJ: String;

      Function SelectDadosCadastraisFuncef: String;
   Public
      IsDacon: Boolean;
      Function PesquisarRelatorioMesAno(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Var pIdNorma: Integer): boolean; Overload;
      Function PesquisarRelatorioMesAno(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Var pIdRelatorioDados: double): Boolean; Overload;
      Function PesquisarRelatorioNumRecibo(Const pNumeroRecibo: String; Var pExercicio, pPeriodo, pTipoForm: String; Var pIdNorma: Integer; var pRetificadora : string): Boolean;
      Function CarregarDadosRelatorioMesAno(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String): OleVariant;
      Function CarregarDadosRelatorioNumRecibo(Const pNumeroRecibo: String): OleVariant;
      Function CarregaBaseCalculoValores(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String): OleVariant;
      Function CarregarDadosAnaliticosMesAno(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pLinha, pIdNorma: Integer): OleVariant;
      Function IsExisteRelatorioGerado(Const pExercicio, pPeriodo, pTipoForm: String): boolean;
      Function IsExisteRelatorioGeradoReticador(Const pExercicio, pPeriodo, pTipoForm: String): boolean;
      Function IsExisteRelatorioGeradoNumero(Const pExercicio, pPeriodo, pTipoForm: String): boolean;
      Function CarregarInformacoesAdicionais(Const pExercicio, pPeriodo: String): OleVariant;
      Function CarregarInformacoesAdicionaisDIPJ(Const pExercicio: String): OleVariant;
      Function CarregarDadosCadastraisFuncef() : OleVariant;
      Function InserirLinhaRelatorioDadosCadastrais(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pIdNorma: Integer; Const pValor: Double): Integer;
      Function InserirSaldoPlanoContabil(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pIdNorma: Integer): Boolean;
      Function VerificarLancamentosContabeis(Const pExercicio, pPeriodo, pTipoForm: String; Const pIdNorma: Integer): Boolean;
      Function ExcluiDadosRelatorio(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pIdNorma: Integer): Boolean;
      Function CarregaDadosLinhas(Const pIdRelatorioDados: Integer): OleVariant;
      Function AtualizaDados(Const oCds: TClientDataSet): Boolean;
      Function AtualizaDadosDIPJ(Const oCds: TClientDataSet; iNrRecibo: Integer): Boolean;
      function AtualizaNumeroRecibo(oCds: TClientDataSet; sNumeroRecibo, sNumeroAntigo : string): Boolean;
      function ExisteRetificadora(Const pExercicio, pPeriodo, pTipoForm: String) : Boolean;
      function AtualizarCOFINS(const pIdRelatorio : string; pValorBase : Double) : Double;
      function AtualizarPIS(const pIdRelatorio : string; pValorBase : Double) : Double;

      // baruc
      function CarregarDadosRendimento(pExercicio: String) : OleVariant;
      function CarregarDadosDIPJ(pExercicio: String) : OleVariant;
      function SelecionaDIPJ(pExercicio: String; idTipo, IdNorma : Integer ): OleVariant;
      function iRetornaCategoria(idLinha, IdNorma : Integer ) : Integer;
      function MostrarGridAnaliticoPorConta(idTipo, idNorma, idRecibo : Integer; pExercicio, pConta: String) : OleVariant;


      function MostraDIPJAnalitico(idTipo, idNorma : Integer; pExercicio: String ) : OleVariant;
      function MostraDIPJSintetico(idTipo, idNorma : Integer; pExercicio: String ) : OleVariant;

      function MostraDIPJSinteticoAnoAnt(idTipo, idNorma, idCategoria : Integer; pExercicio: String ) : OleVariant;

      function MostrarPreviDIPJSintetico(idNorma : Integer; pExercicio: String ) : OleVariant;
      function iLocNorma(idTipo: Integer; pExercicio: String ) : Integer;
      function CarregaLinhasContas(idTipo, idNorma : Integer; pExercicio: String ) : OleVariant;

      function CarregaListaQualfRF : OleVariant;

      function TotalPorCategoria(idTipo, idNorma, iCategoria : Integer; pExercicio: String ) : Real;

      function InsertTabAnaliticoDIPJ(cdsAnaliticos: TCmClientDataSet; iNroRecibo : Integer) : Boolean;
      function InsertTabRendimentosDIPJ(cdsRendimentos: TCmClientDataSet; iNroRecibo, iNorma : Integer; strAno: String) : Boolean;
      function InsertTabContribPrevDIPJ(cdsContrPrevs: TCmClientDataSet; iNroRecibo, idNormaG : Integer) : Boolean;


      function TotalizaPrevidenciario(cdsContrPrevs: TCmClientDataSet; idNormaG: Integer; pExercicio: String) : OleVariant;

      function PreparaRendimentosArqEDI(iNroRecibo : Integer) : OleVariant;
      function LimpaRendimentosArqEDI(iNroRecibo : Integer) : Boolean;
      function GravaTabTem(idNroRecibo, idseq, codqualirf : Integer; ano, cpf, nome, cargo : String; irrf, rendimento : Real) : Boolean;

      function InsertTabReciboDIPJ(idNorma, idReciboOriginal: Integer; strExercicio, sTipo: String) : Integer;


      function SelectTabReciboDIPJ(idNorma: Integer; strExercicio: String) : Integer;

      function DeleteTabReciboDIPJ(iNRoRecibo: Integer) : Boolean;
      function DeleteTabAnaliticoDIPJ(iNRoRecibo: Integer) : Boolean;
      function DeleteTabRendimentosDIPJ(iNRoRecibo: Integer) : Boolean;
      function DeleteTabContribPrevDIPJ(iNRoRecibo: Integer) : Boolean;

      function DeleteTabContribComplPrevDIPJ(iNRoRecibo: Integer) : Boolean;

      function ExistirDIPJ(idNorma: Integer; pExercicio, pNroRecibo: String) : Integer;
      function MostraSinteticoDIPJGravado(iNroRecibo, iTpCat : Integer) : OleVariant;
      function MostrarPreviDIPJGravado(iNroRecibo : Integer) : OleVariant;
      function MostraAnaliticoDIPJGravado(iNroRecibo : Integer) : OleVariant;
      function MostraRendimentosDIPJGravado(iNroRecibo : Integer) : OleVariant;
      function TotalPorCategoriaDIPJGravada(iNroRecibo, iTpCategoria : Integer) : Real;
      function CarregaLinhasContasDIPJGravadas(iNroRecibo : Integer) : OleVariant;

      function ExistirNroReciboDIPJ(idNorma, idRecibo: Integer; pExercicio: String) : String;

      function ExistirReciboDIPJ(idNorma : Integer; sExercicio: String) : Integer;

      function InserirNroReciboDIPJ(IdRecibo: Integer; sNumRecibo: String; sDataRecibo :TDateTime) : Integer;
      function ContaQtdFuncPer(sExercicio: String; IdTipoQtd : Integer) : String;
      function MostraPreviComplDIPJ(idNorma : Integer; pExercicio: String ) : OleVariant;
      function MostraRecibosRetificadoresDIPJ(pExercicio: String; iNorma: Integer) : OleVariant;

      function ProcurarCodByDescricao(sTexto : String) : Integer;
      function AtualizaCodRF(sCPF: String; iCodRF, idRecibo, idSeq : Integer) : boolean;
      function ExisteCod99(idRecibo : Integer) : boolean;
      function ExistirReciboIni(idRecibo, idNorma : Integer; sRetificador, sExercicio : String) : Integer;


      // pnobre
      Function LocalizaNormaVigenteAtual(pTipo: String): Integer;


      Constructor Create;
      Destructor Destroy; Override;
   End;

Implementation

{ tCtrlDaconMT }

uses
  dBaseDados;

Constructor TCtrlDaconMT.Create;
Begin
   Inherited;
   DbLinhasDacon := TDbLinhasDacon.create(self);
   DbRelatorioDados := TDbRelatorioDados.Create(Self);
End;

Destructor TCtrlDaconMT.Destroy;
Begin
   DbLinhasDacon.Free;
   DbRelatorioDados.Free;
   Inherited;
End;

Function tCtrlDaconMT.CarregarDadosRelatorioMesAno(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String): OleVariant;
Var
  sSql: String;
Begin
  // Baruc, substituir LINHAS_DACON por LINHA_DIPJ
  // pnobre
  sSql := '';
  sSql := sSql + '';
  sSql := 'SELECT LD.IDLINHA, ';
  sSql := sSql + 'LR.IDNORMA, ';
  sSql := sSql + 'LR.DESCRICAO, ';
  sSql := sSql + 'RDC.IDRELATORIODADOS, ';
//sSql := sSql + '(SUM(LD.VLRCREDITO) - SUM(LD.VLRDEBITO)) AS VALOR, ';
  sSql := sSql + 'DECODE(NAT.DESCRICAO, ''NEGATIVA'', ((SUM(LD.VLRCREDITO) - SUM(LD.VLRDEBITO)) * -1), (SUM(LD.VLRCREDITO) - SUM(LD.VLRDEBITO))) AS VALOR, ';
  sSql := sSql + 'RDC.NURECIBO ';
  sSql := sSql + 'FROM LINHA_RELATORIO LR, ';
  //Baruc em 24/09/2012
  if pTipoForm <> '2' then
    sSql := sSql + 'LINHAS_DACON LD , '
  else
    sSql := sSql + 'LINHA_DIPJ LD , ';
  sSql := sSql + 'RELATORIO_DADOS_CADASTRAIS RDC, ';
  sSql := sSql + 'NATUREZA_LINHA NAT ';
  sSql := sSql + 'WHERE LR.IDLINHA = LD.IDLINHA ';
  sSql := sSql + 'AND LR.IDNORMA = LD.IDNORMA ';
  sSql := sSql + 'AND LD.IDRELATORIODADOS = RDC.IDRELATORIODADOS ';
  sSql := sSql + 'AND NAT.IDNATUREZA = LR.IDNATUREZA ';
  sSql := sSql + 'AND RDC.EXERCICIO = ' + QuotedStr(pExercicio) + ' ' ;
  //Baruc 19/09/2012 DIPJ INICIO
  if pTipoForm <> '2' then
    sSql := sSql + 'AND RDC.PERIODO = ' + QuotedStr(pPeriodo)  + ' ' ;
  //Baruc 19/09/2012 DIPJ INICIO
  sSql := sSql + 'AND RDC.IDTIPO = ' + pTipoForm  + ' ' ;
  sSql := sSql + 'AND RDC.RETIFICADORA = ' + QuotedStr(pRetificadora) + ' ' ;
  sSql := sSql + 'GROUP BY LD.IDLINHA, LR.IDNORMA, LR.DESCRICAO, RDC.IDRELATORIODADOS, ';
  sSql := sSql + 'RDC.NURECIBO, NAT.DESCRICAO ';
  sSql := sSql + 'ORDER BY RDC.NURECIBO, LR.DESCRICAO  ';
  Result := GetDataPacket(sSql);
End;



Function tCtrlDaconMT.CarregarDadosAnaliticosMesAno(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pLinha, pIdNorma: Integer): OleVariant;
Var
  sSql: String;
Begin
  sSql := SelectDadosAnaliticos(pExercicio, pPeriodo, pTipoForm, pRetificadora, pLinha, pIdNorma);
  Result := GetDataPacket(sSql);
End;

Function tCtrlDaconMT.CarregarDadosRelatorioNumRecibo(Const pNumeroRecibo: String): OleVariant;
Var
  sExercicio, sPeriodo, sTipoForm: String;
  idNormaAtual: Integer;
Begin
//   If PesquisarRelatorioNumRecibo(pNumeroRecibo, sExercicio, sPeriodo, sTipoForm, IdNormaAtual) Then
//      Result := CarregarDadosRelatorioMesAno(sExercicio, sPeriodo, sTipoForm);
End;

Function tCtrlDaconMT.PesquisarRelatorioMesAno(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Var pIdNorma: Integer): Boolean;
Var
  qryAux: TClientDataSet;
Begin
  qryAux := TClientDataSet.Create(Nil);
  qryAux.Data := CarregarDadosRelatorioMesAno(pExercicio, pPeriodo, pTipoForm, pRetificadora);
  Result := Not qryAux.IsEmpty;
  If Result Then
    pIdNorma := qryAux.FieldByName('IdNorma').asInteger;
  qryAux.Close;
  FreeAndNil(qryAux);
End;

Function tCtrlDaconMT.PesquisarRelatorioMesAno(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Var pIdRelatorioDados: double): Boolean;
Var
  qryAux: TClientDataSet;
Begin
  qryAux := TClientDataSet.Create(Nil);
  qryAux.Data := CarregarDadosRelatorioMesAno(pExercicio, pPeriodo, pTipoForm, pRetificadora);
  Result := Not qryAux.IsEmpty;
  If Result Then
    pIdRelatorioDados := qryAux.FieldByName('IdRelatorioDados').asInteger
  else
    pIdRelatorioDados := 0;
  qryAux.Close;
  FreeAndNil(qryAux);
End;

Function tCtrlDaconMT.PesquisarRelatorioNumRecibo(Const pNumeroRecibo: String; Var pExercicio, pPeriodo, pTipoForm: String;
Var pIdNorma: Integer; var pRetificadora : string): Boolean;
Var qryAux: TClientDataSet;
   sSql: String;
Begin
   sSql := SelectDadosNumRecibo(pNumeroRecibo, pExercicio, pPeriodo, pTipoForm, pRetificadora ,True);
   qryAux := TClientDataSet.Create(Nil);
   qryAux.Data := GetDataPacket(sSql);
   Result := Not qryAux.IsEmpty;
   If Result Then
      Begin
         pExercicio := qryAux.FieldbyName('Exercicio').asString;
         pPeriodo := qryAux.FieldbyName('Periodo').asString;
         pIdNorma := qryAux.FieldByName('IdNorma').asInteger;
      End;
   qryAux.Close;
   FreeAndNil(qryAux);
End;

Function TCtrlDaconMt.SelectDadosRelatorio(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String): String;
var
  strMsg : String;
Begin
  // Baruc, substituir LINHAS_DACON por LINHA_DIPJ
  // PNobre - 29/05/2012
  strMsg := '';
  strMsg := 'Select rdc.IdRelatorioDados, ';
  strMsg := strMsg + 'rdc.IdRelParam, ';
  strMsg := strMsg + 'rdc.EXERCICIO, ';
  strMsg := strMsg + 'rdc.PERIODO, ';
  strMsg := strMsg + 'rdc.NURECIBO, ';
  strMsg := strMsg + 'rdc.NURECRETIFICADOR, ';
  strMsg := strMsg + 'rdc.DATAGERACAO, ';
  strMsg := strMsg + 'rdc.VLRPIS, ';
  strMsg := strMsg + 'rdc.VLRCOFINS, ';
  strMsg := strMsg + '(Sum(ld.vlrcredito) - Sum(ld.vlrdebito)) as Valor ';
  strMsg := strMsg + 'From Relatorio_dados_cadastrais rdc, ';
  //Baruc em 24/09/2012
  if pTipoForm <> '2' then
    strMsg := strMsg + 'LINHAS_DACON LD  '  //padrão
  else
    strMsg := strMsg + 'LINHA_DIPJ LD  ';
  strMsg := strMsg + 'Where RDC.IdRelatorioDados = LD.IDRELATORIODADOS ';
  strMsg := strMsg + 'AND RDC.EXERCICIO = ' + QuotedStr(pExercicio);
  if pTipoForm <> '2' then
    strMsg := strMsg + ' AND RDC.PERIODO = ' + QuotedStr(pPeriodo);
  strMsg := strMsg + ' AND RDC.IDTIPO = ' + (pTipoForm);
  strMsg := strMsg + ' AND RDC.RETIFICADORA = ' + QuotedStr(pRetificadora);
  strMsg := strMsg + 'group by rdc.IdRelatorioDados, ';
  strMsg := strMsg + 'rdc.IdRelParam, ';
  strMsg := strMsg + 'rdc.EXERCICIO, ';
  strMsg := strMsg + 'rdc.PERIODO, ';
  strMsg := strMsg + 'rdc.NURECIBO, ';
  strMsg := strMsg + 'rdc.NURECRETIFICADOR, ';
  strMsg := strMsg + 'rdc.DATAGERACAO, ';
  strMsg := strMsg + 'rdc.VLRPIS, ';
  strMsg := strMsg + 'rdc.VLRCOFINS ';
  Result := strMsg;
End;


Function tCtrlDaconMT.SelectDadosNumRecibo(Const pNumeroRecibo: String;
                                           pExercicio : string;
                                           pPeriodo : string;
                                           pTipoForm : String;
                                           pRetificadora : string;
                                           Const pInclueMesAno: Boolean = False): String;
Var
  sSql : String;

Begin
  // Baruc, substituir LINHAS_DACON por LINHA_DIPJ
  sSql := '';
  // pnobre
  If pInclueMesAno Then
    sSql := 'SELECT RDC.EXERCICIO, RDC.IDNORMA, RDC.PERIODO, LR.DESCRICAO, '
  Else
    sSql := 'SELECT LR.DESCRICAO, ';
  sSql := sSql + 'LD.IDRELATORIODADOS, ';
  sSql := sSql + 'LD.IDLINHA, ';
  sSql := sSql + 'RDC.DATAGERACAO, ';
  sSql := sSql + '(SUM(LD.VLRCREDITO) - SUM(LD.VLRDEBITO)) AS VALOR ';
  sSql := sSql + 'FROM LINHA_RELATORIO LR, ';

  //Baruc em 24/09/2012
  if pTipoForm <> '2' then
    sSql := sSql + 'LINHAS_DACON LD , '
  else
    sSql := sSql + 'LINHA_DIPJ LD , '; // padrão
  sSql := sSql + 'RELATORIO_DADOS_CADASTRAIS RDC, ';
  sSql := sSql + 'NORMA_VIGENTE NV ';
  sSql := sSql + 'WHERE LR.IDNORMA = NV.IDNORMA ';
  sSql := sSql + 'AND RDC.IDNORMA = NV.IDNORMA ';
  sSql := sSql + 'AND RDC.EXERCICIO = ' + QuotedStr(pExercicio) + ' ';
  sSql := sSql + 'AND RDC.PERIODO = ' + QuotedStr(pPeriodo)  + ' ';
  sSql := sSql + 'and RDC.NURECIBO = ' + QuotedStr(pNumeroRecibo)  + ' ';
  sSql := sSql + 'and RDC.RETIFICADORA = ' + QuotedStr(pRetificadora)  + ' ';
  If pInclueMesAno Then
    sSql := sSql + 'GROUP BY RDC.EXERCICIO, RDC.PERIODO, LR.DESCRICAO, LD.IDRELATORIODADOS, LD.IDLINHA, RDC.DATAGERACAO, RDC.IDNORMA '
  Else
    sSql := sSql + 'GROUP BY LR.DESCRICAO, LD.IDRELATORIODADOS, LD.IDLINHA, RDC.DATAGERACAO, RDC.IDNORMA ';
  sSql := sSql + 'ORDER BY RDC.DATAGERACAO';
  Result := sSql;
End;

Function TCtrlDaconMT.SelectDadosAnaliticos(Const pExercicio, pPeriodo, pTipoForm, pRetificadora : String; Const pLinha, pIdNorma: Integer): String;
var
  strMsg : String;
Begin
   // PNOBRE
//   Result := 'SELECT * FROM (   ' + #13#10 +
//      '       SELECT LD.IDRELATORIODADOS, LD.IDLINHADACON,' + #13#10 +
//      '       PL.PLACONTA,' + #13#10 +
//      '       PL.PLANOME,' + #13#10 +
//      '       SUM(LD.VLRCREDITO) AS CREDITO,' + #13#10 +
//      '       SUM(LD.VLRDEBITO) AS DEBITO,' + #13#10 +
//      '       ((SUM(LD.VLRCREDITO)) - (SUM(LD.VLRDEBITO))) AS TOTAL, ' + #13#10 +
//      '       RDC.NURECIBO ' + #13#10 +
//      '  FROM LINHAS_DACON LD,' + #13#10 +
//      '       PLANOSALDO PS, ' + #13#10 +
//      '       PLANOCONTA PL,' + #13#10 +
//      '       RELATORIO_DADOS_CADASTRAIS RDC ' + #13#10 +
//      ' WHERE LD.IDRELATORIODADOS = RDC.IDRELATORIODADOS ' + #13#10 +
//      '   AND PS.PEREXERCICIO = ' + QuotedStr(pExercicio) + #13#10 +
//      '   AND PS.PERNUMERO = ' + QuotedStr(pPeriodo) + #13#10 +
//      '   AND RDC.IDTIPO = ' + QuotedStr(pTipoForm) + #13#10 +
//      '   AND RDC.RETIFICADORA = ' + QuotedStr(pRetificadora) + #13#10 +
//      '   AND PS.PLANO    = PL.PLANO' + #13#10 +
//      '   AND PS.PLACONTA = PL.PLACONTA' + #13#10 +
//      '   AND PS.PEREXERCICIO = RDC.EXERCICIO ' +  #13#10 +
//      '   AND PS.PERNUMERO = RDC.PERIODO ' + #13#10 +
//      '   AND LD.PLACONTA IN  ' + #13#10 +
//      '       (SELECT PLACONTA FROM LINHAXCONTACONTABIL LCC ' + #13#10 +
//      '        Join Linha_Relatorio lr on lr.idlinha = lcc.idlinha WHERE lr.idnorma = ' + IntToStr(pIdNorma) + ')' + #13#10 +
//      '   AND PL.PLANO = (SELECT PC.PLANO FROM PARAMCONTAB PC) ' + #13#10 +
//      '   AND LD.PLACONTA = PL.PLACONTA' + #13#10;
//   If pLinha <> 0 Then
//      Result := Result +
//         '   AND LD.IDLINHA = ' + IntToStr(pLinha) + #13#10;
//   Result := Result +
//      ' GROUP BY LD.IDRELATORIODADOS, LD.IDLINHADACON, PL.PLACONTA, PL.PLANOME, RDC.NURECIBO )' + #13#10 +
//      ' WHERE TOTAL <> 0' + #13#10;
  // Baruc, substituir LINHAS_DACON por LINHA_DIPJ
  strMsg := '';
  strMsg := ' SELECT * FROM (SELECT LD.IDRELATORIODADOS, ';
  //Baruc em 24/09/2012
  if pTipoForm <> '2' then
    strMsg := strMsg + 'LD.IDLINHADACON AS IDLINHADACON,  '
  else                          
    strMsg := strMsg + 'LD.IDLINHADIPJ AS IDLINHA,  '; // padrão
  strMsg := strMsg + 'PL.PLACONTA, ';
  strMsg := strMsg + 'PL.PLANOME, ';
  strMsg := strMsg + 'SUM(LD.VLRCREDITO) AS CREDITO, ';
  strMsg := strMsg + 'SUM(LD.VLRDEBITO) AS DEBITO, ';
  strMsg := strMsg + '((SUM(LD.VLRCREDITO)) - (SUM(LD.VLRDEBITO))) AS TOTAL, ';
  strMsg := strMsg + 'RDC.NURECIBO ';
  //Baruc em 24/09/2012
  if pTipoForm <> '2' then
    strMsg := strMsg + 'FROM LINHAS_DACON LD  '
  else
    strMsg := strMsg + 'FROM LINHA_DIPJ LD  '; // padrão
  strMsg := strMsg + 'INNER JOIN RELATORIO_DADOS_CADASTRAIS RDC ON (RDC.IDRELATORIODADOS = LD.IDRELATORIODADOS) ';
  strMsg := strMsg + 'INNER JOIN LINHA_RELATORIO LR ON (LR.IDLINHA = LD.IDLINHA) ';
  strMsg := strMsg + 'INNER JOIN LINHAXCONTACONTABIL LCC ON (LCC.IDLINHA = LD.IDLINHA AND LD.PLACONTA = LCC.PLACONTA) ';
  strMsg := strMsg + 'INNER JOIN PLANOCONTA PL ON (PL.PLACONTA = lcc.PLACONTA AND LCC.PLANO = PL.PLANO) ';
  strMsg := strMsg + 'WHERE LR.IDNORMA = ' + IntToStr(pIdNorma) + ' ';
  strMsg := strMsg + 'AND RDC.EXERCICIO = ' + QuotedStr(pExercicio) + ' ';
  if pTipoForm <> '2' then
    strMsg := strMsg + 'AND RDC.PERIODO = ' + QuotedStr(pPeriodo) + ' ';
  strMsg := strMsg + 'AND RDC.IDTIPO = ' + QuotedStr(pTipoForm) + ' ';
  strMsg := strMsg + 'AND RDC.RETIFICADORA = ' + QuotedStr(pRetificadora) + ' ';

  If pLinha <> 0 Then
    strMsg := strMsg + 'AND LD.IDLINHA = ' + IntToStr(pLinha) + ' ';
  strMsg := strMsg + 'GROUP BY PL.PLACONTA, LD.IDRELATORIODADOS , ';
  //Baruc em 24/09/2012
  if pTipoForm <> '2' then
    strMsg := strMsg + 'LD.IDLINHADACON,  '
  else
    strMsg := strMsg + 'LD.IDLINHADIPJ,  '; // padrão
  strMsg := strMsg + '  PL.PLACONTA, PL.PLANOME, RDC.NURECIBO ) ';
  strMsg := strMsg + 'WHERE TOTAL <> 0 ';
  Result := strMsg;
End;

Function tCtrlDaconMT.CarregaDadosLinhas(Const pIdRelatorioDados: Integer): OleVariant;
var
  strSql : String;
Begin
  // Baruc, substituir LINHAS_DACON por LINHA_DIPJ
  strSql := '';
  strSql := 'select distinct ld.idlinha,lr.descricao from linhas_dacon ld ';
  strSql := strSql + 'join linha_relatorio lr on lr.idlinha = ld.idlinha ';
  strSql := strSql + 'where idrelatoriodados = ' + IntToStr(pIdRelatorioDados);
  Result := GetDataPacket(strSql);
End;






Function tCtrlDaconMT.CarregaBaseCalculoValores(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String): OleVariant;
Var
  sSql: String;
Begin
  // pnobre
  sSql := SelectDadosRelatorio(pExercicio, pPeriodo, pTipoForm, pRetificadora);
  Result := GetDataPacket(sSql);
End;

Function tCtrlDaconMT.IsExisteRelatorioGerado(Const pExercicio, pPeriodo, pTipoForm: String): boolean;
Var
  qryAux: TClientDataSet;
  sSql:  String;
Begin
   // PNOBRE
   {   qryAux := TCmClientDataSet.Create(Nil);
      sSql := 'Select 1' + #13#10 +
         '  from DECLARACAO_CONTRIBUICOES' + #13#10 +
         ' where idNorma IN' + #13#10 +
         '       (SELECT nv.IdNorma' + #13#10 +
         '          FROM Norma_Vigente nv, Tipo_Relatorio tr' + #13#10 +
         '         Where nv.idtipo = tr.idtipo' + #13#10 +
         '           and (nv.DATAFIM IS NULL or' + #13#10 +
         '                nv.DATAFIM = TO_DATE(''30/12/1899'', ''DD/MM/YYYY'')))';}

   qryAux := TCmClientDataSet.Create(Nil);
   sSql := 'SELECT RDC.IDTIPO ';
   sSql := sSql + 'FROM RELATORIO_DADOS_CADASTRAIS RDC ';
   sSql := sSql + 'WHERE RDC.IDTIPO = ' + pTipoForm;
   sSql := sSql + '   AND RDC.EXERCICIO = ' + QuotedStr(pExercicio);
   //BARUC em 19/09/2012 - DIPJ - INICIO
//   if pTipoForm = '02' then //BARUC em 19/09/2012 - DIPJ
   sSql := sSql + '   AND RDC.PERIODO = ' + QuotedStr(pPeriodo);
   sSql := sSql + '   AND RDC.IDTIPO = ' +  pTipoForm;
   //BARUC em 19/09/2012 - DIPJ - FIM
   sSql := sSql + '   AND RDC.NURECIBO IS NULL';
   qryAux.data := GetDataPacket(sSql);
   Result := Not qryAux.isEmpty;
   qryAux.Close;
   FreeAndNil(qryAux);
End;

Function tCtrlDaconMT.CarregarInformacoesAdicionais(Const pExercicio, pPeriodo: String): OleVariant;
Var
  sSql: String;
Begin
  sSql := SelectInformacoesAdicionais();
  Result := GetDataPacket(sSql);
End;


Function tCtrlDaconMT.CarregarInformacoesAdicionaisDIPJ(Const pExercicio: String): OleVariant;
Var
  sSql: String;
Begin
  sSql := SelectInformacoesAdicionaisDIPJ();
  Result := GetDataPacket(sSql);
End;


Function TCtrlDaconMT.SelectInformacoesAdicionaisDIPJ(): String;
Begin
   // pnobre
   Result := 'Select' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 1) as Sistema,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 2) as Filler,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 4) as Filler_1,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 5) as Demonstrativo,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 7) as TipoNI,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 8) as PGD,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 6) as CNPJFundacao,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 9) as NomeFundacao,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 10) as UFFundacao,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 1) as TipoCadastral,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 3) as PeriodEntrega,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 7) as TipoDemonstrativo,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 8) as SituacaoEspecial,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 9) as DataEvento,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 10) as Desenquadramento,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 11) as DataDesenquadramento,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 13) as PJ,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 14) as TipoEntidade,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 15) as InclusaoSimples,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 16) as DataInclusaoSimples,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 17) as PISPasepCofins,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 18) as ApuracaoCreditos,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 19) as ApurPisDiferenciadasContrib,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 20) as ApuracaoPisSubstitutoTrib,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 21) as ApPisProdutoContribuinte,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 22) as ApPisProdutoTributario,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 23) as AdicaoContrCreditoAnteriores,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 24) as DiferimContrCreditoMes,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 25) as CredTransferido,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 26) as ContrCredDifTransferidos,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 27) as DescCredPJSucedidas,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 2 and ordem = 28) as MetDeterminacaoCred,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 1) as Tipo_3,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 2) as NomeRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 3) as CpfRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 4) as DDDRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 5) as FoneRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 6) as RamalRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 7) as DDDFaxRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 8) as FaxRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 9) as EmailRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 10) as NomeResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 11) as CpfResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 12) as CRCResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 13) as UFCRCResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 14) as DDDResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 15) as FoneResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 16) as RamalResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 17) as DDDFaxResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 18) as FaxResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 3 and ordem = 19) as EmailResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 5 and ordem = 1) as Tipo_5,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 5 and ordem = 2) as QuantRegistros,' + #13#10 +
      '  (select preenchimento from arquivodipj where grupo = 4 and ordem = 1) as Tipo_4,' + #13#10 +

      '  (select campo from arquivodipj where grupo = 4 and ordem = 5) as Linha_02,' + #13#10 +

      '  (select preenchimento from arquivodipj where grupo = 1 and ordem = 10) as UFDomicilio' + #13#10 +
      'from dual';
End;




Function TCtrlDaconMT.SelectInformacoesAdicionais(): String;
Begin
   // pnobre
   Result := 'Select' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 1) as Sistema,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 2) as Filler,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 4) as Filler_1,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 5) as Demonstrativo,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 7) as TipoNI,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 8) as PGD,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 6) as CNPJFundacao,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 9) as NomeFundacao,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 10) as UFFundacao,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 1) as TipoCadastral,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 3) as PeriodEntrega,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 7) as TipoDemonstrativo,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 8) as SituacaoEspecial,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 9) as DataEvento,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 10) as Desenquadramento,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 11) as DataDesenquadramento,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 13) as PJ,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 14) as TipoEntidade,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 15) as InclusaoSimples,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 16) as DataInclusaoSimples,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 17) as PISPasepCofins,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 18) as ApuracaoCreditos,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 19) as ApurPisDiferenciadasContrib,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 20) as ApuracaoPisSubstitutoTrib,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 21) as ApPisProdutoContribuinte,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 22) as ApPisProdutoTributario,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 23) as AdicaoContrCreditoAnteriores,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 24) as DiferimContrCreditoMes,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 25) as CredTransferido,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 26) as ContrCredDifTransferidos,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 27) as DescCredPJSucedidas,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 2 and ordem = 28) as MetDeterminacaoCred,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 1) as Tipo_3,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 2) as NomeRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 3) as CpfRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 4) as DDDRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 5) as FoneRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 6) as RamalRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 7) as DDDFaxRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 8) as FaxRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 9) as EmailRepresentante,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 10) as NomeResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 11) as CpfResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 12) as CRCResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 13) as UFCRCResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 14) as DDDResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 15) as FoneResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 16) as RamalResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 17) as DDDFaxResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 18) as FaxResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 3 and ordem = 19) as EmailResponsavel,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 5 and ordem = 1) as Tipo_5,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 5 and ordem = 2) as QuantRegistros,' + #13#10 +
      '  (select preenchimento from arquivodacon where grupo = 4 and ordem = 1) as Tipo_4,' + #13#10 +

      '  (select campo from arquivodacon where grupo = 4 and ordem = 5) as Linha_02,' + #13#10 +

      '  (select preenchimento from arquivodacon where grupo = 1 and ordem = 10) as UFDomicilio' + #13#10 +
      'from dual';
End;

Function tCtrlDaconMT.InserirLinhaRelatorioDadosCadastrais(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pIdNorma: Integer; Const pValor: Double): Integer;
Var qryAux: Twwquery;
Begin
   result := 0;
   // pnobre
   Try
      Try
         StartTransaction;

         qryAux := Twwquery.Create(Nil);
         qryAux.DataBaseName := 'BaseDados';
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('INSERT INTO RELATORIO_DADOS_CADASTRAIS               ');
         qryAux.SQL.Add('(IdRelatorioDados, IdTipo, IdNorma, EXERCICIO, PERIODO, DATAGERACAO, VLRPIS, VLRCOFINS, RETIFICADORA)');
         qryAux.SQL.Add(' VALUES (:p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8, :p9 ) ');
         qryAux.ParamByName('p1').asInteger := LeUltRegistro(Nil, 'RELATORIODADOSCADASTRAIS');
         qryAux.ParamByName('p2').asString := pTipoForm;
         If pIdNorma <> 0 Then
            qryAux.ParamByName('p3').asInteger := pIdNorma
         Else
            qryAux.ParamByName('p3').asString := '';
         qryAux.ParamByName('p4').AsString := pExercicio;
         qryAux.ParamByName('p5').AsString := pPeriodo;
         qryAux.ParamByName('p6').AsDateTime := Now;
         //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Inicio
//         qryAux.ParamByName('p7').AsFloat := pValor * 0.0065;
//         qryAux.ParamByName('p8').AsFloat := pValor * 0.04;

         qryAux.ParamByName('p7').AsFloat := 0 * 0.0065;
         qryAux.ParamByName('p8').AsFloat := 0 * 0.04;
         //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Fim
         qryAux.ParamByName('p9').AsString := pRetificadora;
         qryAux.ExecSQL;

         result := qryAux.ParamByName('p1').asInteger;
         Commit;
      Except
         On E: Exception Do
            Rollback;
      End
   Finally
      freeandnil(qryAux);
   End;
End;

Function tCtrlDaconMT.InserirSaldoPlanoContabil(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pIdNorma: Integer): Boolean;
Var
  oCds: TClientDataSet;
  iIdRelatorioDados: Integer;
  sSql: String;
  fValor: Double;

  Function SomaBaseCalculo(): Double;
  Begin
    Result := 0;
    oCds.First;
    While Not oCds.Eof Do
      Begin
        // PNobre - 28/05/2012
        Result := Result + (oCds.FieldByName('PLSCREDITOCOR').asFloat - oCds.FieldByName('PLSDEBITOCORRENTE').asFloat);

        // Result := Result + (oCds.FieldByName('PlsCreditoGer').asFloat - oCds.FieldByName('PlsDebitoGer').asFloat);
        oCds.Next;
      End;
    oCds.First;
  End;

  Procedure InsereDadosTabela(pCds : TClientDataSet);
  Var
    qryAux: Twwquery;
  Begin
    // pnobre
    Try
      Try
        StartTransaction;
        pCds.First;
        qryAux := Twwquery.Create(Nil);
        qryAux.DataBaseName := 'BaseDados';
        while not (pCds.Eof) do
          begin
            qryAux.Close;
            //baruc, colocar a tabela LINHA_DIPJ no lugar da LINHAS_DACON
            if pTipoForm <> '2' then
              begin
                //FROM LINHAS_DACON LD
                qryAux.SQL.Clear;
                qryAux.SQL.Add('INSERT INTO LINHAS_DACON  ');
                qryAux.SQL.Add('(IdLinhaDacon, IDRELATORIODADOS, IDLINHA, IDNORMA, PLACONTA, VLRDEBITO, VLRCREDITO)');
                qryAux.SQL.Add(' VALUES (:p1, :p2, :p3, :p4, :p5, :p6, :p7 ) ');
                qryAux.ParamByName('p1').DataType := ftInteger;
                qryAux.ParamByName('p2').DataType := ftInteger;
                qryAux.ParamByName('p3').DataType := ftInteger;
                qryAux.ParamByName('p4').DataType := ftInteger;
                qryAux.ParamByName('p5').DataType := ftString;
                qryAux.ParamByName('p6').DataType := ftFloat;
                qryAux.ParamByName('p7').DataType := ftFloat;
                qryAux.ParamByName('p1').Value := LeUltRegistro(Nil, 'LINHASDACON');
                qryAux.ParamByName('p2').Value := iIdRelatorioDados;
                qryAux.ParamByName('p3').Value := oCds.FieldByName('IdLInha').asInteger;
                qryAux.ParamByName('p4').Value := oCds.FieldByName('IdNorma').asInteger;
                qryAux.ParamByName('p5').Value := oCds.FieldByName('PlaConta').asString;
                qryAux.ParamByName('p6').Value := oCds.FieldByName('PLSDEBITOCORRENTE').asFloat;
                qryAux.ParamByName('p7').Value := oCds.FieldByName('PLSCREDITOCOR').asFloat;
//              ShowMessage(qryAux.Sql.Text);
                qryAux.ExecSQL;
                pCds.Next;
              end
            else
              begin
                //FROM LINHA_DIPJ LD
                qryAux.SQL.Clear;
                qryAux.SQL.Add('INSERT INTO LINHA_DIPJ ');
                qryAux.SQL.Add('(IDLINHADIPJ, IDRELATORIODADOS, IDLINHA, IDNORMA, PLACONTA, VLRDEBITO, VLRCREDITO, IDTIPODE_CATEGORIA');
                qryAux.SQL.Add(' VALUES (:p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8) ');
                qryAux.ParamByName('p1').DataType := ftInteger;
                qryAux.ParamByName('p2').DataType := ftInteger;
                qryAux.ParamByName('p3').DataType := ftInteger;
                qryAux.ParamByName('p4').DataType := ftInteger;
                qryAux.ParamByName('p5').DataType := ftString;
                qryAux.ParamByName('p6').DataType := ftFloat;
                qryAux.ParamByName('p7').DataType := ftFloat;
                qryAux.ParamByName('p8').DataType := ftInteger;
                qryAux.ParamByName('p1').Value := LeUltRegistro(Nil, 'LINHA_DIPJ');
                qryAux.ParamByName('p2').Value := iIdRelatorioDados;
                qryAux.ParamByName('p3').Value := oCds.FieldByName('IdLInha').asInteger;
                qryAux.ParamByName('p4').Value := oCds.FieldByName('IdNorma').asInteger;
                qryAux.ParamByName('p5').Value := oCds.FieldByName('PlaConta').asString;
                qryAux.ParamByName('p6').Value := oCds.FieldByName('PLSDEBITOCORRENTE').asFloat;
                qryAux.ParamByName('p7').Value := oCds.FieldByName('PLSCREDITOCOR').asFloat;
                qryAux.ParamByName('p8').Value := iRetornaCategoria(oCds.FieldByName('IdLInha').asInteger, oCds.FieldByName('IdNorma').asInteger);
//              ShowMessage(qryAux.Sql.Text);
                qryAux.ExecSQL;
                pCds.Next;
              end;
          end;
        Commit;
      Except
        On E: Exception Do
          Rollback;
        End
      Finally
        freeandnil(qryAux);
      End;
  End;
Begin
  Result := True;
  sSql := SelectCriacaoTabelaSaldo(pExercicio, pPeriodo, pTipoForm, pIdNorma);
  oCds := TClientDataSet.Create(Nil);
  oCds.Data := GetDataPacket(sSql);
  fValor := SomaBaseCalculo();
  If Not oCds.isEmpty Then
    Begin
      iIdRelatorioDados := InserirLinhaRelatorioDadosCadastrais(pExercicio,
                                                                pPeriodo,
                                                                pTipoForm,
                                                                pRetificadora,
                                                                pIdNorma,
                                                                fValor);
      oCds.First;
      InsereDadosTabela(oCds);
      oCds.Close;
//    While Not oCds.EOF Do
//      Begin
//        InsereDadosTabela(oCds);
//        oCds.Next;
//      End;
//    oCds.Close;
    End;
End;

Function tCtrlDaconMT.SelectCriacaoTabelaSaldo(Const pExercicio, pPeriodo, pTipoForm: String; Const pIdNorma: Integer): String;
Var
  sSql: String;
Begin
//marcio paulo tiago
{
  //baruc, colocar a tabela LINHA_DIPJ no lugar da LINHAS_DACON
  sSql :=  EmptyStr;
  sSql := 'select n.idNorma, lr.idlinha, lc.plano, lc.placonta, ps.perexercicio, ps.pernumero, ';
  // PNobre - 28/05/2012
  sSql := sSql + 'PS.PLSDEBITOCORRENTE , PS.PLSCREDITOCOR ';
  //sSql := sSql + 'ps.plsdebitoger, ps.plscreditoger';
  sSql := sSql + 'from planosaldo ps, linhaxcontacontabil lc, linha_relatorio lr, norma_vigente n ';
  sSql := sSql + 'where ps.plano    = lc.plano ';
  sSql := sSql + 'and ps.placonta = lc.placonta ';
  sSql := sSql + 'and lc.placonta <> 581  ';
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
  sSql := sSql + 'and lc.idlinha  = lr.idlinha ';
  sSql := sSql + 'and lr.idnorma  = n.idNorma ';
  sSql := sSql + 'and (n.datafim is null or ';
  sSql := sSql + 'n.datafim = to_date(''30/12/1899'',''dd/mm/yyyy'')) ';
  sSql := sSql + 'and n.idtipo    = ' + pTipoForm + ' ' ;
  sSql := sSql + 'and ps.perexercicio = ' + QuotedStr(pExercicio) + ' ' ;
  sSql := sSql + 'and ps.pernumero = ' + QuotedStr(pPeriodo) + ' ' ;
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Inicio
  sSql := sSql + 'union  ';
  sSql := sSql + 'select n.idNorma, lr.idlinha, ';
  sSql := sSql + 'lc.plano, ';
  sSql := sSql + 'lc.placonta, ';
  sSql := sSql + 'ps.perexercicio, ';
  sSql := sSql + 'ps.pernumero, ';
  sSql := sSql + 'PS.PLSDEBITOCORRENTE , ';
  sSql := sSql + 'PS.PLSCREDITOCOR ';
  sSql := sSql + 'from planosaldo ps, ';
  sSql := sSql + 'linhaxcontacontabil lc, ';
  sSql := sSql + 'linha_relatorio lr, ';
  sSql := sSql + 'norma_vigente n ';
  sSql := sSql + 'where ps.plano    = lc.plano ';
  sSql := sSql + 'and ps.placonta = lc.placonta ';
  sSql := sSql + 'and lc.placonta = 581 ';
  sSql := sSql + 'and ps.idplanoprev = 110 ';
  sSql := sSql + 'and lc.idlinha  = lr.idlinha ';
  sSql := sSql + 'and lr.idnorma  = n.idNorma ';
  sSql := sSql + 'and (n.datafim is null or ';
  sSql := sSql + 'n.datafim = to_date(''30/12/1899'',''dd/mm/yyyy'')) ';
  sSql := sSql + 'and n.idtipo    = ' + pTipoForm + ' ' ;
  sSql := sSql + 'and ps.perexercicio = ' + QuotedStr(pExercicio) + ' ' ;
  sSql := sSql + 'and ps.pernumero = ' + QuotedStr(pPeriodo)  + ' ' ;
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Fim
  Result := sSql;     }

  // Alterado por Paulo Nobre em 05/06/2013
  //Marcio Sanches Spinosa SOL 208410/14598 KTN 2014896 - inicio
   If pPeriodo <> '12' Then
      Begin
         sSql := EmptyStr;
         sSql := 'select n.idNorma, lr.idlinha, lc.plano, lc.placonta, ps.perexercicio, ps.pernumero, ';
         // PNobre - 28/05/2012
         sSql := sSql + 'PS.PLSDEBITOCORRENTE , PS.PLSCREDITOCOR ';
         //sSql := sSql + 'ps.plsdebitoger, ps.plscreditoger';
         sSql := sSql + 'from planosaldo ps, linhaxcontacontabil lc, linha_relatorio lr, norma_vigente n ';
         sSql := sSql + 'where ps.plano    = lc.plano ';
         sSql := sSql + 'and ps.placonta = lc.placonta ';
         sSql := sSql + 'and lc.placonta <> 581  ';
         //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
         sSql := sSql + 'and lc.idlinha  = lr.idlinha ';
         sSql := sSql + 'and lr.idnorma  = n.idNorma ';
         sSql := sSql + 'and (n.datafim is null or ';
         sSql := sSql + 'n.datafim = to_date(''30/12/1899'',''dd/mm/yyyy'')) ';
         sSql := sSql + 'and n.idtipo    = ' + pTipoForm + ' ';
         sSql := sSql + 'and ps.perexercicio = ' + QuotedStr(pExercicio) + ' ';
         sSql := sSql + 'and ps.pernumero = ' + QuotedStr(pPeriodo) + ' ';
         //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Inicio
         sSql := sSql + 'union  ';
         sSql := sSql + 'select n.idNorma, lr.idlinha, ';
         sSql := sSql + 'lc.plano, ';
         sSql := sSql + 'lc.placonta, ';
         sSql := sSql + 'ps.perexercicio, ';
         sSql := sSql + 'ps.pernumero, ';
         sSql := sSql + 'PS.PLSDEBITOCORRENTE , ';
         sSql := sSql + 'PS.PLSCREDITOCOR ';
         sSql := sSql + 'from planosaldo ps, ';
         sSql := sSql + 'linhaxcontacontabil lc, ';
         sSql := sSql + 'linha_relatorio lr, ';
         sSql := sSql + 'norma_vigente n ';
         sSql := sSql + 'where ps.plano    = lc.plano ';
         sSql := sSql + 'and ps.placonta = lc.placonta ';
         sSql := sSql + 'and lc.placonta = 581 ';
         sSql := sSql + 'and ps.idplanoprev = 110 ';
         sSql := sSql + 'and lc.idlinha  = lr.idlinha ';
         sSql := sSql + 'and lr.idnorma  = n.idNorma ';
         sSql := sSql + 'and (n.datafim is null or ';
         sSql := sSql + 'n.datafim = to_date(''30/12/1899'',''dd/mm/yyyy'')) ';
         sSql := sSql + 'and n.idtipo    = ' + pTipoForm + ' ';
         sSql := sSql + 'and ps.perexercicio = ' + QuotedStr(pExercicio) + ' ';
         sSql := sSql + 'and ps.pernumero = ' + QuotedStr(pPeriodo) + ' ';
         //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Fim
      End
   Else
      Begin

        // **********************************************************
         //******************* Marcio incluir aqui o SELECT DO TIAGO
         // **********************************************************
//         sSql := EmptyStr;
//         sSql := sSql + 'SELECT n.idNorma, lr.idlinha, lX.plano, lX.placonta, ';
//         sSql := sSql + QuotedStr(pExercicio) + ' as perexercicio, ' + QuotedStr(pPeriodo) + ' as pernumero, ';
//         sSql := sSql + {'2012','12',} ' SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) PLSDEBITOCORRENTE, ';
//         sSql := sSql + ' SUM(DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) PLSCREDITOCOR ' ;
//         sSql := sSql + ' FROM LANCAMENTO L, PLANILHA P, ';
//         sSql := sSql + '(SELECT LC.IDLINHA, LC.PLANO, PLATIPO, P.PLACONTA ';
//         sSql := sSql + ' FROM LINHAXCONTACONTABIL LC, PLANOCONTA P ';
//         sSql := sSql + ' WHERE TRIM(LC.PLACONTA) = ';
//         sSql := sSql + ' SUBSTR(TRIM(P.PLACONTA), 1, LENGTH(TRIM(LC.PLACONTA))) ';
//         sSql := sSql + ' And LC.PLANO = P.PLANO) LX,  LINHA_RELATORIO LR, norma_vigente n ';
//         sSql := sSql + ' WHERE L.PLNCODIGO = P.PLNCODIGO ';
//         sSql := sSql + ' And TRIM(L.PLACONTA) = TRIM(LX.PLACONTA) ';
//         sSql := sSql + ' And (TRIM(L.PLACONTA) = TRIM(LX.PLACONTA) or (l.PLACONTA = ''581'' AND L.IDPLANOPREV = 110)) ';
//         sSql := sSql + ' And L.PLANO = LX.PLANO ';
//         sSql := sSql + ' And LX.IDLINHA = LR.IDLINHA ';
//         sSql := sSql + ' And L.LACDEBCRE In (''C'', ''D'') ';
//         sSql := sSql + ' And TO_CHAR(P.PLNDATDIA, ''MM/YYYY'') = ' + QuotedStr(pPeriodo + '/' + pExercicio) ;{ '12/2012'}
//    //     sSql := sSql +
//         sSql := sSql + ' And UPPER(L.LACHIST1) Not LIKE ''ENCERRAMENTO DE BALANÇO%''' ;
//         sSql := sSql + ' And lr.idnorma = n.idNorma And (n.datafim Is null Or n.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'')) ';
//         sSql := sSql + ' And n.idtipo = ' + pTipoForm;
//         sSql := sSql + ' GROUP BY n.idNorma, lr.idlinha, lX.plano, lX.placonta, ';
//         sSql := ssql + ' perexercicio, pernumero ';
//         sSql := sSql + QuotedStr(pExercicio) + ', ' + QuotedStr(pPeriodo); { + '2012', '12'}

           sSql := EmptyStr;
           sSql := sSql + 'SELECT n.idNorma, lr.idlinha, lX.plano, lX.placonta, ';
           sSql := sSql + QuotedStr(pExercicio) + ' as perexercicio, ' + QuotedStr(pPeriodo) + ' as pernumero, ';
           sSql := sSql + ' SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) PLSDEBITOCORRENTE, ';
           sSql := sSql + ' SUM(DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) PLSCREDITOCOR ';
           sSql := sSql + ' FROM LANCAMENTO L, PLANILHA P, ';
           sSql := sSql + ' (SELECT LC.IDLINHA, LC.PLANO, PLATIPO, P.PLACONTA ';
           sSql := sSql + ' FROM LINHAXCONTACONTABIL LC, PLANOCONTA P ';
           sSql := sSql + ' WHERE TRIM(LC.PLACONTA) = ';
           sSql := sSql + ' SUBSTR(TRIM(P.PLACONTA), 1, LENGTH(TRIM(LC.PLACONTA))) ';
           sSql := sSql + ' And LC.PLANO = P.PLANO) LX, ';
           sSql := sSql + ' LINHA_RELATORIO LR, ';
           sSql := sSql + ' norma_vigente n ';
           sSql := sSql + 'WHERE L.PLNCODIGO = P.PLNCODIGO ';
           sSql := sSql + ' And TRIM(L.PLACONTA) = TRIM(LX.PLACONTA) ';
           sSql := sSql + ' AND L.IDPLANOPREV = DECODE (TRIM(L.PLACONTA),''581'',110,L.IDPLANOPREV) ';
           sSql := sSql + ' And L.PLANO = LX.PLANO ';
           sSql := sSql + ' And LX.IDLINHA = LR.IDLINHA ';
           sSql := sSql + ' And L.LACDEBCRE In (''C'', ''D'') ';
           sSql := sSql + ' And TO_CHAR(P.PLNDATDIA, ''MM/YYYY'') = ' + QuotedStr(pPeriodo + '/' + pExercicio) ;
           sSql := sSql + ' And UPPER(L.LACHIST1) Not LIKE ''ENCERRAMENTO DE BALANÇO%'' ';
           sSql := sSql + ' And lr.idnorma = n.idNorma ';
           sSql := sSql + ' And (n.datafim Is null Or ';
           sSql := sSql + ' n.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'')) ';
           sSql := sSql + ' And n.idtipo = '  + pTipoForm;
           sSql := sSql + 'GROUP BY n.idNorma, lr.idlinha, lX.plano, lX.placonta, perexercicio, pernumero ';

      End;
     //Marcio Sanches Spinosa SOL 208410/14598 KTN 2014896 - Fim
     Result := sSql;
End;

Function tCtrlDaconMT.VerificarLancamentosContabeis(Const pExercicio, pPeriodo, pTipoForm: String; Const pIdNorma: Integer): Boolean;
Var qryAux: TClientDataSet;
   sSql: String;
Begin
   qryAux := TClientDataSet.Create(Nil);
   sSql := SelectCriacaoTabelaSaldo(pExercicio, pPeriodo, pTipoForm, pIdNorma);
   qryAux.Data := GetDataPacket(sSql);
   Result := Not qryAux.IsEmpty;
   qryAux.Close;
   FreeAndNil(qryAux);
End;

Function tCtrlDaconMT.ExcluiDadosRelatorio(Const pExercicio, pPeriodo, pTipoForm, pRetificadora: String; Const pIdNorma: Integer): Boolean;
Var
  sSql: String;
  pIdRelatorioDados: double;
Begin
  Try
    // PNOBRE
    sSql := '';
    StartTransaction;
    Result := PesquisarRelatorioMesAno(pExercicio, pPeriodo, pTipoForm, pRetificadora, pIdRelatorioDados);
      // Baruc, substituir LINHAS_DACON por LINHA_DIPJ
    if pTipoForm <> '2' then
      sSql := 'Delete from Linhas_DACON Where idRelatorioDados = ' + FloattoStr(pIdRelatorioDados) + ' and idNorma = ' + IntToStr(pIdNorma)
    else
      sSql := 'Delete from LINHA_DIPJ Where idRelatorioDados = ' + FloattoStr(pIdRelatorioDados) + ' and idNorma = ' + IntToStr(pIdNorma);
    Result := ExecSql(sSql);
    If Result Then
      Begin
        sSql := '';
        sSql := 'Delete From RELATORIO_DADOS_CADASTRAIS Where IdRelatorioDados = ' + FloattoStr(pIdRelatorioDados);
        Result := ExecSql(sSql);
      End;
    Commit;
  Except
    On E: Exception Do
      Rollback;
  End;
End;

Function tCtrlDaconMT.AtualizaDados(Const oCds: TClientDataSet): Boolean;
Var sSql: String;
   fVlrCredito, fVlrDebito: String;
Begin
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Inicio
   fVlrCredito := StringReplace(oCds.FieldByName('Credito').asString, ',', '.', [rfReplaceAll]);
   fVlrDebito := StringReplace(oCds.FieldByName('Debito').asString, ',', '.', [rfReplaceAll]);
   //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908 - Fim
  // Baruc, substituir LINHAS_DACON por LINHA_DIPJ coloque um if antes
   sSql := 'Update linhas_dacon' + #13#10 +
      'Set VlrCredito = ' + fVlrCredito + ',' + #13#10 +
      '    VlrDebito = ' + fVlrDebito + #13#10 +
      'Where IdlinhaDacon = ' + oCds.FieldByname('IdLinhaDacon').asString;
   Result := ExecSql(sSql);
End;



Function tCtrlDaconMT.AtualizaDadosDIPJ(Const oCds: TClientDataSet; iNrRecibo: Integer): Boolean;
Var
  sSql: String;
  fVlrCredito, fVlrDebito, fVlrTotal: String;
  VlrCredito, VlrDebito, VlrTotal: Real;
  sPlanoConta, sIdRecibo : String;
Begin

  VlrCredito := oCds.FieldByName('Credito').AsCurrency;
  VlrDebito  := oCds.FieldByName('Debito').AsCurrency;

  VlrTotal    := VlrCredito - VlrDebito;

  fVlrCredito := FloatToStr(VlrCredito);
  fVlrDebito  := FloatToStr( VlrDebito);
  fVlrTotal   := FloatToStr(VlrTotal);

  fVlrCredito := StringReplace(fVlrCredito,',', '.', [rfReplaceAll]);
  fVlrDebito  := StringReplace(fVlrDebito, ',', '.', [rfReplaceAll]);
  fVlrTotal   := StringReplace(fVlrTotal,  ',', '.', [rfReplaceAll]);

  sSql := '';
  sSql := sSql + '';
  sSql := sSql + 'Update ANALITICO_DIPJ ';
  sSql := sSql + 'Set VlrCredito = ' + fVlrCredito + ',';
  sSql := sSql + '     VlrDebito = ' + fVlrDebito  + ',';
  sSql := sSql + '     VlrTotal  = ' + fVlrTotal;
  sSql := sSql + ' Where ';
  sSql := sSql + ' PlanoConta  = ' + oCds.FieldByname('PlanoConta').asString + ' and' ;
  sSql := sSql + ' IdRecibo    = ' + IntToStr(iNrRecibo);
  Result := ExecSql(sSql);


End;

// pnobre

Function tCtrlDaconMT.LocalizaNormaVigenteAtual(pTipo: String): Integer;
Var
  sSql: String;
  qryAux: Twwquery;
Begin
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IdNorma               ');
  qryAux.SQL.Add('FROM Norma_Vigente');
  qryAux.SQL.Add('WHERE idtipo =:p1 ');
  qryAux.SQL.Add('and (DATAFIM IS NULL or DATAFIM = TO_DATE(''30/12/1899'',''DD/MM/YYYY''))');
  qryAux.ParamByName('p1').asString := pTipo;
  qryAux.Open;

  result := qryAux.FieldByName('IdNorma').asInteger;
  freeandnil(qryAux);
End;

function tCtrlDaconMT.AtualizaNumeroRecibo(oCds: TClientDataSet; sNumeroRecibo, sNumeroAntigo : string): Boolean;
Var sSql, strValida: String;
   qryNumeroRecibo : Twwquery;
begin

    if not Assigned(qryNumeroRecibo) then
    begin
      qryNumeroRecibo := Twwquery.Create(Nil);
      qryNumeroRecibo.DataBaseName := 'BaseDados';
    end;

    ocds.First;
    while not oCds.Eof do
    begin
      if (oCds.FieldByName('NURECIBO').AsString = sNumeroAntigo) then
      begin
         if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

         qryNumeroRecibo.Close;
         qryNumeroRecibo.SQL.Clear;
         qryNumeroRecibo.SQL.Add('UPDATE RELATORIO_DADOS_CADASTRAIS SET NURECIBO = :NURECIB0 WHERE IDRELATORIODADOS = :IDRELATORIODADOS');
         qryNumeroRecibo.ParamByName('NURECIB0').DataType := ftString;
         qryNumeroRecibo.ParamByName('NURECIB0').Value := sNumeroRecibo;
         qryNumeroRecibo.ParamByName('IDRELATORIODADOS').DataType := ftInteger;
         qryNumeroRecibo.ParamByName('IDRELATORIODADOS').Value := oCds.FieldByName('IDRELATORIODADOS').AsString;
         qryNumeroRecibo.ExecSQL;

         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      end;
      oCds.Next;
    end;
    FreeAndNil(qryNumeroRecibo);
   Result := True;
end;

function tCtrlDaconMT.CarregarDadosCadastraisFuncef: OleVariant;
Var sSql: String;
Begin
   sSql := SelectDadosCadastraisFuncef();
   Result := GetDataPacket(sSql);
End;

function tCtrlDaconMT.SelectDadosCadastraisFuncef: String;
begin
  Result := 'SELECT EP.IDPESSOA, ' +
            'EP.NOMEEMPRESA, ' +
            'PE.NUMDOCUMENTO AS CNPJ, '+
            'EN.CEP, ' +
            'EN.TIPOENDERECO, ' +
            'EN.LOGRADOURO, ' +
            'EN.NUMERO, '+
            'EN.COMPLEMENTO, ' +
            'EN.BAIRRO, '+
            'CI.UF, ' +
            'CI.NOME AS NOME_CIDADE, '+
            'TE.DDD AS DDD_CONTATO, ' +
            'TE.NUMERO AS NUMERO_CONTATO, '+
            'TEF.DDD AS DDD_FAX, '+
            'TEF.NUMERO AS NUMERO_FAX, '+
            'PE.EMAIL ' +
            'FROM PESSOA PE '+
            'LEFT JOIN ENDPESS EN ON (EN.IDENDERECO = PE.IDENDCOMERCIAL) '+
            'LEFT JOIN CIDADES CI ON (CI.IDCIDADES = EN.IDCIDADES) '+
            'INNER JOIN ESTADO ES ON (ES.IDESTADO = CI.IDESTADO) '+
            'INNER JOIN EMPRESAPROP EP ON (EP.IDPESSOA = PE.IDPESSOA) ' +
            'LEFT JOIN TELENDPESS TE ON (TE.IDENDERECO = EN.IDENDERECO AND TE.TIPO = ''C'') ' +
            'LEFT JOIN TELENDPESS TEF ON (TEF.IDENDERECO = EN.IDENDERECO AND TEF.TIPO = ''F'') ' ;

end;

function tCtrlDaconMT.IsExisteRelatorioGeradoNumero(const pExercicio,
  pPeriodo, pTipoForm: String): boolean;
Var qryAux: TClientDataSet;
   sSql: String;
Begin
   // PNOBRE
   {   qryAux := TCmClientDataSet.Create(Nil);
      sSql := 'Select 1' + #13#10 +
         '  from DECLARACAO_CONTRIBUICOES' + #13#10 +
         ' where idNorma IN' + #13#10 +
         '       (SELECT nv.IdNorma' + #13#10 +
         '          FROM Norma_Vigente nv, Tipo_Relatorio tr' + #13#10 +
         '         Where nv.idtipo = tr.idtipo' + #13#10 +
         '           and (nv.DATAFIM IS NULL or' + #13#10 +
         '                nv.DATAFIM = TO_DATE(''30/12/1899'', ''DD/MM/YYYY'')))';}

   qryAux := TCmClientDataSet.Create(Nil);
   sSql := 'SELECT RDC.IDTIPO  ';
   sSql := sSql + 'FROM RELATORIO_DADOS_CADASTRAIS RDC ';
   sSql := sSql + 'WHERE RDC.IDTIPO = ' + pTipoForm;
   sSql := sSql + '   AND RDC.EXERCICIO = ' + QuotedStr(pExercicio);
   sSql := sSql + '   AND RDC.PERIODO = ' + QuotedStr(pPeriodo);
   sSql := sSql + '   AND RDC.NURECIBO IS NOT NULL';
   qryAux.data := GetDataPacket(sSql);
   Result := Not qryAux.isEmpty;
   qryAux.Close;
   FreeAndNil(qryAux);
End;


function tCtrlDaconMT.IsExisteRelatorioGeradoReticador(const pExercicio,
  pPeriodo, pTipoForm: String): boolean;
Var qryAux: TClientDataSet;
   sSql: String;
Begin
   qryAux := TCmClientDataSet.Create(Nil);
   sSql := 'SELECT RDC.IDTIPO ';
   sSql := sSql + 'FROM RELATORIO_DADOS_CADASTRAIS RDC ';
   sSql := sSql + 'WHERE RDC.IDTIPO = ' + pTipoForm;
   sSql := sSql + '   AND RDC.EXERCICIO = ' + QuotedStr(pExercicio);
   sSql := sSql + '   AND RDC.PERIODO = ' + QuotedStr(pPeriodo);
   sSql := sSql + '   AND RDC.RETIFICADORA = ' + QuotedStr('S');
   sSql := sSql + '   AND RDC.NURECIBO IS NULL';
   qryAux.data := GetDataPacket(sSql);
   Result := Not qryAux.isEmpty;
   qryAux.Close;
   FreeAndNil(qryAux);

end;

function tCtrlDaconMT.ExisteRetificadora(const pExercicio, pPeriodo,
  pTipoForm: String): Boolean;
Var qryAux: TClientDataSet;
    sSql   : string;
begin
  qryAux := TCmClientDataSet.Create(Nil);
  sSql := 'SELECT IDRELATORIODADOS ';
  sSql := sSql + 'FROM RELATORIO_DADOS_CADASTRAIS ';
  sSql := sSql + 'WHERE EXERCICIO = ' + pExercicio ;
  if pTipoForm <> '2' then
    sSql := sSql + 'AND PERIODO = ' + pPeriodo ;
  sSql := sSql + 'AND IDTIPO = ' + pTipoForm ;
  sSql := sSql + 'AND RETIFICADORA = ''S''';

  qryAux.data := GetDataPacket(sSql);
  Result := Not qryAux.isEmpty;
  qryAux.Close;
  FreeAndNil(qryAux);

end;

function tCtrlDaconMT.AtualizarCOFINS(
  const pIdRelatorio: string; pValorBase : Double): Double;
Var qryAux: TwwQuery;
    pVlrCofins : Double;
    sSql   : string;
begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';

  sSql := 'UPDATE  RELATORIO_DADOS_CADASTRAIS  ' +
          'SET VLRCOFINS = :PVLRCOFINS ' +
          'WHERE IDRELATORIODADOS = :PIDRELATORIODADOS ';

   pVlrCofins    := pValorBase * 0.04;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSql);
   qryAux.Params.ParamByName('PIDRELATORIODADOS').DataType  := ftInteger;
   qryAux.Params.ParamByName('PVLRCOFINS').DataType         := ftCurrency;

   qryAux.Params.ParamByName('PIDRELATORIODADOS').Value     := pIdRelatorio;
   qryAux.Params.ParamByName('PVLRCOFINS').Value            := pVlrCofins;

   qryAux.ExecSQL;

   qryAux.Close;
   FreeAndNil(qryAux);

   Result := pVlrCofins;

end;

function tCtrlDaconMT.AtualizarPIS(const pIdRelatorio: string;
  pValorBase: Double): Double;
Var qryAux: TwwQuery;
    pVlrPis : Double;
    sSql   : string;
begin
  qryAux := TwwQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';

  sSql := 'UPDATE  RELATORIO_DADOS_CADASTRAIS  ' +
          'SET VLRPIS = :PVLRPIS ' +
          'WHERE IDRELATORIODADOS = :PIDRELATORIODADOS ';

   pVlrPis       := pValorBase * 0.0065;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSql);
   qryAux.Params.ParamByName('PIDRELATORIODADOS').DataType  := ftInteger;
   qryAux.Params.ParamByName('PVLRPIS').DataType            := ftCurrency;

   qryAux.Params.ParamByName('PIDRELATORIODADOS').Value     := pIdRelatorio;
   qryAux.Params.ParamByName('PVLRPIS').Value               := pVlrPis;

   qryAux.ExecSQL;
   qryAux.Close;
   FreeAndNil(qryAux);

   Result := pVlrPis;
end;

// a partir desta linha funções para DIPJ - Baruc
function tCtrlDaconMT.CarregarDadosRendimento(pExercicio: String): OleVariant;
Var
  sSql: String;
Begin
  sSql := '';
  sSql := '       SELECT T1.CPF CPF, ';
  sSql := sSql + '       T1.NOME NOME, ';
  sSql := sSql + '       T1.CARGO CARGO, ';
  sSql := sSql + '       T1.IDCARGOEXT IDCARGO, ';
  sSql := sSql + '       T1.DATADEMISSAO DTDEMISSAO, ';
  sSql := sSql + '       SUM(DECODE(T1.COD_TIPO, ''1'', T1.VALOR)) AS IRRF, ';
  sSql := sSql + '       SUM(DECODE(T1.COD_TIPO, ''2'', T1.VALOR)) AS RENDIMENTO ';
  sSql := sSql + '  FROM (SELECT CPF, NOME, CARGO, COD_TIPO, TIPO, VALOR, IDCARGOEXT, DATADEMISSAO ';
  sSql := sSql + '          FROM (SELECT ''1'' AS COD_TIPO, E.IDCARGOEXT, E.DATADEMISSAO, ';
  sSql := sSql + '                       ''IRRF'' AS TIPO, ';
  sSql := sSql + '                       TRIM(P.NUMDOCUMENTO) CPF, ';
  sSql := sSql + '                       P.NOME NOME, ';
  sSql := sSql + '                       C.TITULO CARGO, ';
  sSql := sSql + '                       SUM(H.VALORPROVENTO) VALOR ';
  sSql := sSql + '                  FROM PESSOA P, ELEGPATRO E, CARGO C, HISTRUBSAL H ';
  sSql := sSql + '                 WHERE P.IDPESSOA = E.IDPESSOA ';
  sSql := sSql + '                   AND E.IDCARGOEXT = C.IDCARGO ';
  sSql := sSql + '                   AND E.IDPESSJUR = 1 ';
  sSql := sSql + '                   AND C.IDCARGO IN (SELECT C1.IDCARGO FROM CARGOXRUBRICA C1) ';
  sSql := sSql + '                   AND E.IDPESSOA = H.IDPESSOA ';
  sSql := sSql + '                   AND E.IDPESSJUR = H.IDPATRO ';
  sSql := sSql + '                   AND SUBSTR(H.MESCOBRANCA, 1, 4) = ' + pExercicio + ' ';
  sSql := sSql + '                   AND H.IDRUBRICA IN ';
  sSql := sSql + '                       (SELECT C1.IDPROVENTO ';
  sSql := sSql + '                          FROM CARGOXRUBRICA C1 ';
  sSql := sSql + '                         WHERE C1.FLGDESCONTO = 1) ';
  sSql := sSql + '                 GROUP BY TRIM(P.NUMDOCUMENTO), P.NOME, C.TITULO, E.IDCARGOEXT, E.DATADEMISSAO ';
  sSql := sSql + '                UNION ALL ';
  sSql := sSql + '                SELECT ''2'' AS COD_TIPO,E.IDCARGOEXT, E.DATADEMISSAO, ';
  sSql := sSql + '                       ''RENDIMENTO'' AS TIPO, ';
  sSql := sSql + '                       TRIM(P.NUMDOCUMENTO) CPF, ';
  sSql := sSql + '                       P.NOME NOME, ';
  sSql := sSql + '                       C.TITULO CARGO, ';
  sSql := sSql + '                       SUM(H.VALORPROVENTO) VALOR ';
  sSql := sSql + '                  FROM PESSOA P, ELEGPATRO E, CARGO C, HISTRUBSAL H ';
  sSql := sSql + '                 WHERE P.IDPESSOA = E.IDPESSOA ';
  sSql := sSql + '                   AND E.IDCARGOEXT = C.IDCARGO ';
  sSql := sSql + '                   AND E.IDPESSJUR = 1 ';
  sSql := sSql + '                   AND C.IDCARGO IN (SELECT C1.IDCARGO FROM CARGOXRUBRICA C1) ';
  sSql := sSql + '                   AND E.IDPESSOA = H.IDPESSOA ';
  sSql := sSql + '                   AND E.IDPESSJUR = H.IDPATRO ';
  sSql := sSql + '                   AND SUBSTR(H.MESCOBRANCA, 1, 4) =  ' + pExercicio + ' ';
  sSql := sSql + '                   AND H.IDRUBRICA IN ';
  sSql := sSql + '                       (SELECT C1.IDPROVENTO ';
  sSql := sSql + '                          FROM CARGOXRUBRICA C1 ';
  sSql := sSql + '                         WHERE C1.FLGDESCONTO = 2) ';
  sSql := sSql + '                 GROUP BY TRIM(P.NUMDOCUMENTO), P.NOME, C.TITULO, E.IDCARGOEXT, E.DATADEMISSAO ';
  sSql := sSql + '                 ORDER BY 1)) T1 ';
  sSql := sSql + ' GROUP BY T1.CPF, T1.NOME, T1.CARGO, IDCARGOEXT, DATADEMISSAO ';
  Result := GetDataPacket(sSql);

end;


function tCtrlDaconMT.CarregarDadosDIPJ(pExercicio: String): OleVariant;
Var
  sSql: String;
Begin
  sSql := '';
  sSql := 'SELECT TRIM(P.NUMDOCUMENTO) CPF, P.NOME, C.TITULO CARGO, SUM(H.VALORPROVENTO) RENDIMENTOS ';
  sSql := sSql + 'FROM   PESSOA P, ELEGPATRO E, CARGO C, HISTRUBSAL H ';
  sSql := sSql + 'WHERE  P.IDPESSOA                = E.IDPESSOA ';
  sSql := sSql + 'AND    E.IDCARGOEXT              = C.IDCARGO ';
  sSql := sSql + 'AND    E.IDPESSJUR               = 1  ';
  sSql := sSql + 'AND    C.IDCARGO                 IN (select c1.idcargo from cargoxrubrica c1 ) ';
  sSql := sSql + 'AND    E.DATADEMISSAO            IS NULL ';
  sSql := sSql + 'AND    E.IDPESSOA                = H.IDPESSOA ';
  sSql := sSql + 'AND    E.IDPESSJUR               = H.IDPATRO ';
  sSql := sSql + 'AND    substr(H.MESCOBRANCA,1,4) =  '  + pExercicio;
  sSql := sSql + ' AND    H.IDRUBRICA               IN (select c2.idprovento from cargoxrubrica c2 ) ';
  sSql := sSql + 'GROUP BY TRIM(P.NUMDOCUMENTO), P.NOME, C.TITULO ';
  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.SelecionaDIPJ(pExercicio: String; idTipo, IdNorma : Integer ): OleVariant;
Var
  sSql: String;
  qryAux: Twwquery;
Begin
  sSql := '';
  sSql := 'Select ';
  sSql := sSql + 'tp.idTipo                 as IdTipo, ';
  sSql := sSql + 'tp.Descricao              as TipoRelatorio, ';
  sSql := sSql + 'nv.idnorma                as IdNorma, ';
  sSql := sSql + 'nv.Descricao              as Norma, ';
  sSql := sSql + 'nv.DataInicio             as DataInicio, ';
  sSql := sSql + 'nv.datafim                as DataFim, ';
  sSql := sSql + 'lr.idlinha                as IdLinha, ';
  sSql := sSql + 'lr.cod_linha              as CodLinha, ';
  sSql := sSql + 'lr.descricao              as DescricaoLinha, ';
  sSql := sSql + 'na.idNatureza             as IdNatureza, ';
  sSql := sSql + 'na.descricao              as NaturezaLinha, ';
  sSql := sSql + 'tc.idtipodecategoria      as IdCategoria, ';
  sSql := sSql + 'tc.descricaocategoria     as Categoria, ';
  sSql := sSql + 'lc.placonta               as PlanoConta, ';
  sSql := sSql + 'pla.planome               as PlanoNome, ';
  sSql := sSql + 'PS.PLSDEBITOCORRENTE      as Debito, ';
  sSql := sSql + 'PS.PLSCREDITOCOR          as Credito, ';
  sSql := sSql + '(PS.PLSCREDITOCOR - PS.PLSDEBITOCORRENTE) as Total ';
//sSql := sSql + 'sum(PS.PLSDEBITOCORRENTE) as Debito, ';
//sSql := sSql + 'sum(PS.PLSCREDITOCOR)     as Credito, ';
//sSql := sSql + '(sum(PS.PLSCREDITOCOR) - sum(PS.PLSDEBITOCORRENTE)) as Total ';
  sSql := sSql + 'from ';
  sSql := sSql + 'tipo_relatorio       TP, ';
  sSql := sSql + 'Norma_vigente        NV, ';
  sSql := sSql + 'Linha_Relatorio      LR, ';
  sSql := sSql + 'Natureza_Linha       NA, ';
  sSql := sSql + 'TipoDeCategoria      TC, ';
  sSql := sSql + 'linhaxcontacontabil  LC, ';
  sSql := sSql + 'planoconta           PLA, ';
  sSql := sSql + 'planosaldo           PS ';
  sSql := sSql + 'where ';
  sSql := sSql + 'tp.idtipo               = nv.idtipo and ';
  sSql := sSql + 'nv.idnorma              = lr.idnorma and ';
  sSql := sSql + 'lr.idnatureza           = na.idnatureza and ';
  sSql := sSql + 'lr.idtipodecategoria    = tc.idtipodecategoria and ';
  sSql := sSql + 'lr.idlinha              = lc.idlinha and ';
  sSql := sSql + 'lc.plano                = pla.plano and ';
  sSql := sSql + 'lc.placonta             = pla.placonta and ';
  sSql := sSql + 'pla.plano               = ps.plano and ';
  sSql := sSql + 'pla.placonta            = ps.placonta and ';
  sSql := sSql + '(nv.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'') or nv.datafim is null) and ';
  sSql := sSql + 'ps.perexercicio         = ' + pExercicio + ' and ';
  sSql := sSql + 'tp.idTipo               = ' + IntToStr(idTipo) + ' and ';
  sSql := sSql + 'nv.IdNorma              = ' + IntToStr(IdNorma);
//  sSql := sSql + 'group by  tp.idTipo, lr.idlinha, lr.cod_linha, na.idNatureza, na.idNatureza, tc.idtipodecategoria, lc.placonta ';
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;
  while not qryAux.Eof do
    begin
      {
      iStatusLoc     := NewQueryI.FieldByName('STATUS_AULA').AsInteger;
      iStatusPessoa  := NewQueryI.FieldByName('STATUS_PESSOA').AsInteger;
      iTempoInicioI  := NewQueryI.FieldByName('TEMPO_INICIO_I').AsInteger;
      iTempoInicioII := NewQueryI.FieldByName('TEMPO_INICIO_II').AsInteger;
      iTempoFimI     := NewQueryI.FieldByName('TEMPO_FIM_I').AsInteger;
      }
    end;


   Result := GetDataPacket(sSql);


end;


function tCtrlDaconMT.iRetornaCategoria(idLinha, IdNorma : Integer ) : Integer;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := 'Select lr.idtipodecategoria as IdCategoria From Linha_Relatorio LR ';
  sSql := sSql + 'Where lr.IdLInha = ' + IntToStr(idLinha) + ' and ' ;
  sSql := sSql + 'lr.IdNorma = ' + IntToStr(IdNorma);

  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;

  Result := qryAux.FieldByName('IdCategoria').asInteger;
  freeandnil(qryAux);
end;

function tCtrlDaconMT.MostraDIPJAnalitico(idTipo, idNorma : Integer; pExercicio: String ) : OleVariant;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := '';
  sSql := 'Select ';
  sSql := sSql + 'tp.idTipo                 as IdTipo, ';
  sSql := sSql + 'tp.Descricao              as TipoRelatorio, ';
  sSql := sSql + 'nv.idnorma                as IdNorma, ';
  sSql := sSql + 'nv.Descricao              as Norma, ';
  sSql := sSql + 'nv.DataInicio             as DataInicio, ';
  sSql := sSql + 'nv.datafim                as DataFim, ';
  sSql := sSql + 'lr.idlinha                as IdLinha, ';
  sSql := sSql + 'lr.cod_linha              as CodLinha, ';
  sSql := sSql + 'lr.descricao              as DescricaoLinha, ';
  sSql := sSql + 'na.idNatureza             as IdNatureza, ';
  sSql := sSql + 'na.descricao              as NaturezaLinha, ';
  sSql := sSql + 'tc.idtipodecategoria      as IdCategoria, ';
  sSql := sSql + 'tc.descricaocategoria     as Categoria, ';
  sSql := sSql + 'lc.placonta               as PlanoConta, ';
  sSql := sSql + 'pla.planome               as PlanoNome, ';
  sSql := sSql + 'sum(PS.PLSDEBITOCORRENTE) as Debito, ';
  sSql := sSql + 'sum(PS.PLSCREDITOCOR)     as Credito, ';
  sSql := sSql + '(sum(PS.PLSCREDITOCOR) - sum(PS.PLSDEBITOCORRENTE)) as Total ';

  sSql := sSql + 'from ';
  sSql := sSql + 'tipo_relatorio       TP, ';
  sSql := sSql + 'Norma_vigente        NV, ';
  sSql := sSql + 'Linha_Relatorio      LR, ';
  sSql := sSql + 'Natureza_Linha       NA, ';
  sSql := sSql + 'TipoDeCategoria      TC, ';
  sSql := sSql + 'linhaxcontacontabil  LC, ';
  sSql := sSql + 'planoconta           PLA, ';
  sSql := sSql + 'planosaldo           PS ';

  sSql := sSql + 'where ';
  sSql := sSql + 'tp.idtipo               = nv.idtipo and ';
  sSql := sSql + 'nv.idnorma              = lr.idnorma and ';
  sSql := sSql + 'lr.idnatureza           = na.idnatureza and ';
  sSql := sSql + 'lr.idtipodecategoria    = tc.idtipodecategoria and ';
  sSql := sSql + 'lr.idlinha              = lc.idlinha and ';
  sSql := sSql + 'lc.plano                = pla.plano and ';
  sSql := sSql + 'lc.placonta             = pla.placonta and ';
  sSql := sSql + 'pla.plano               = ps.plano and ';
  sSql := sSql + 'pla.placonta            = ps.placonta and ';
  sSql := sSql + '(nv.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'') or nv.datafim is null) and ';
  sSql := sSql + 'ps.perexercicio         = ' + pExercicio + ' and ';
  sSql := sSql + 'tp.idTipo               = ' + IntToStr(idTipo)+  ' and ';
  sSql := sSql + 'nv.IdNorma              = ' + IntToStr(idNorma) + ' and ' ;
  sSql := sSql + 'tc.idtipodecategoria    <> 4 ';  

  sSql := sSql + 'group by  ';
  sSql := sSql + 'tp.idTipo, ';
  sSql := sSql + 'tp.Descricao, ';
  sSql := sSql + 'nv.idnorma, ';
  sSql := sSql + 'nv.Descricao, ';
  sSql := sSql + 'nv.DataInicio, ';
  sSql := sSql + 'nv.datafim, ';
  sSql := sSql + 'lr.idlinha, ';
  sSql := sSql + 'lr.cod_linha, ';
  sSql := sSql + 'lr.descricao, ';
  sSql := sSql + 'na.idNatureza, ';
  sSql := sSql + 'na.descricao, ';
  sSql := sSql + 'tc.idtipodecategoria, ';
  sSql := sSql + 'tc.descricaocategoria, ';
  sSql := sSql + 'lc.placonta, ';
  sSql := sSql + 'pla.planome ';


  sSql := sSql + 'order by  tc.descricaocategoria, lr.cod_linha ';

  Result := GetDataPacket(sSql);

end;

function tCtrlDaconMT.MostrarPreviDIPJSintetico(idNorma : Integer; pExercicio: String ) : OleVariant;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := '';
  sSql := ' SELECT NV.IDNORMA AS IDNORMA,  ';
  sSql := sSql + '       LR.IDLINHA AS IDLINHA,  ';
  sSql := sSql + '       LR.COD_LINHA AS CODLINHA,  ';
  sSql := sSql + '       LR.DESCRICAO AS DESCRICAOLINHA,  ';
  sSql := sSql + '       ((SUM(PS.PLSDEBITOCORRENTE) - SUM(PS.PLSCREDITOCOR))) TOTAL  ';
  sSql := sSql + '  FROM NORMA_VIGENTE       NV,  ';
  sSql := sSql + '       LINHA_RELATORIO     LR,  ';
  sSql := sSql + '       NATUREZA_LINHA      NA,  ';
  sSql := sSql + '       TIPODECATEGORIA     TC,  ';
  sSql := sSql + '       LINHAXCONTACONTABIL LC,  ';
  sSql := sSql + '       PLANOCONTA          PLA,  ';
  sSql := sSql + '       PLANOSALDO          PS  ';
  sSql := sSql + ' WHERE NV.IDNORMA = LR.IDNORMA  ';
  sSql := sSql + '   AND LR.IDNATUREZA = NA.IDNATUREZA  ';
  sSql := sSql + '   AND LR.IDTIPODECATEGORIA = TC.IDTIPODECATEGORIA  ';
  sSql := sSql + '   AND LR.IDLINHA = LC.IDLINHA  ';
  sSql := sSql + '   AND LC.PLANO = PLA.PLANO  ';
  sSql := sSql + '   AND LC.PLACONTA = PLA.PLACONTA  ';
  sSql := sSql + '   AND PLA.PLANO = PS.PLANO  ';
  sSql := sSql + '   AND PLA.PLACONTA = PS.PLACONTA  ';
  sSql := sSql + '   AND (NV.DATAFIM = TO_DATE(''30/12/1899'', ''DD/MM/YYYY'') OR NV.DATAFIM IS NULL)  ';
  sSql := sSql + '   AND PS.PERNUMERO BETWEEN 1 AND 11  ';
  sSql := sSql + '   AND PS.PEREXERCICIO = ' + pExercicio;
  sSql := sSql + '   AND NV.IDNORMA = ' + IntToStr(idNorma);
  sSql := sSql + '   AND TC.IDTIPODECATEGORIA = 4  ';
  sSql := sSql + ' GROUP BY NV.IDNORMA ,  ';
  sSql := sSql + '       LR.IDLINHA ,  ';
  sSql := sSql + '       LR.COD_LINHA ,  ';
  sSql := sSql + '       LR.DESCRICAO  ';
  sSql := sSql + 'ORDER BY LR.COD_LINHA  ';
  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.MostraDIPJSintetico(idTipo, idNorma : Integer; pExercicio: String ) : OleVariant;
Var
  sSql: String;
Begin
  sSql := '';
  sSql := 'Select ';
  sSql := sSql + 'tp.idTipo                 as IdTipo, ';
  sSql := sSql + 'tp.Descricao              as TipoRelatorio, ';
  sSql := sSql + 'nv.idnorma                as IdNorma, ';
  sSql := sSql + 'nv.Descricao              as Norma, ';
  sSql := sSql + 'nv.DataInicio             as DataInicio, ';
  sSql := sSql + 'nv.datafim                as DataFim, ';
  sSql := sSql + 'lr.idlinha                as IdLinha, ';
  sSql := sSql + 'lr.cod_linha              as CodLinha, ';
  sSql := sSql + 'lr.descricao              as DescricaoLinha, ';
  sSql := sSql + 'na.idNatureza             as IdNatureza, ';
  sSql := sSql + 'na.descricao              as NaturezaLinha, ';
  sSql := sSql + 'tc.idtipodecategoria      as IdCategoria, ';
  sSql := sSql + 'tc.descricaocategoria     as Categoria, ';
  sSql := sSql + 'sum(PS.PLSDEBITOCORRENTE) as Debito, ';
  sSql := sSql + 'sum(PS.PLSCREDITOCOR)     as Credito, ';
  sSql := sSql + '(sum(PS.PLSCREDITOCOR) - sum(PS.PLSDEBITOCORRENTE)) as Total ';
  sSql := sSql + 'from ';
  sSql := sSql + 'tipo_relatorio       TP, ';
  sSql := sSql + 'Norma_vigente        NV, ';
  sSql := sSql + 'Linha_Relatorio      LR, ';
  sSql := sSql + 'Natureza_Linha       NA, ';
  sSql := sSql + 'TipoDeCategoria      TC, ';
  sSql := sSql + 'linhaxcontacontabil  LC, ';
  sSql := sSql + 'planoconta           PLA, ';
  sSql := sSql + 'planosaldo           PS ';
  sSql := sSql + 'where ';
  sSql := sSql + 'tp.idtipo               = nv.idtipo and ';
  sSql := sSql + 'nv.idnorma              = lr.idnorma and ';
  sSql := sSql + 'lr.idnatureza           = na.idnatureza and ';
  sSql := sSql + 'lr.idtipodecategoria    = tc.idtipodecategoria and ';
  sSql := sSql + 'lr.idlinha              = lc.idlinha and ';
  sSql := sSql + 'lc.plano                = pla.plano and ';
  sSql := sSql + 'lc.placonta             = pla.placonta and ';
  sSql := sSql + 'pla.plano               = ps.plano and ';
  sSql := sSql + 'pla.placonta            = ps.placonta and ';
  sSql := sSql + '(nv.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'') or nv.datafim is null) and ';
  sSql := sSql + 'ps.perexercicio         = ' + pExercicio + ' and ';
  sSql := sSql + 'tp.idTipo               = ' + IntToStr(idTipo)+  ' and ';
  sSql := sSql + 'nv.IdNorma              = ' + IntToStr(idNorma) + ' and  ' ;
  sSql := sSql + 'tc.idtipodecategoria    <> 4 ';
  sSql := sSql + 'group by ';
  sSql := sSql + 'tp.idTipo, ';
  sSql := sSql + 'tp.Descricao, ';
  sSql := sSql + 'nv.idnorma, ';
  sSql := sSql + 'nv.Descricao, ';
  sSql := sSql + 'nv.DataInicio, ';
  sSql := sSql + 'nv.datafim, ';
  sSql := sSql + 'lr.idlinha, ';
  sSql := sSql + 'lr.cod_linha, ';
  sSql := sSql + 'lr.descricao, ';
  sSql := sSql + 'na.idNatureza, ';
  sSql := sSql + 'na.descricao, ';
  sSql := sSql + 'tc.idtipodecategoria, ';
  sSql := sSql + 'tc.descricaocategoria ';
  sSql := sSql + 'order by  tc.descricaocategoria, lr.cod_linha ';
  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.MostraDIPJSinteticoAnoAnt(idTipo, idNorma, idCategoria : Integer; pExercicio: String ) : OleVariant;
Var
  sSql: String;
Begin
  pExercicio := IntToStr(StrToInt(pExercicio) - 1);
  sSql := '';
  sSql := 'Select ';
  sSql := sSql + 'tp.idTipo                 as IdTipo, ';
  sSql := sSql + 'tp.Descricao              as TipoRelatorio, ';
//sSql := sSql + 'nv.idnorma                as IdNorma, ';
//sSql := sSql + 'nv.Descricao              as Norma, ';
  sSql := sSql + 'nv.DataInicio             as DataInicio, ';
  sSql := sSql + 'nv.datafim                as DataFim, ';
  sSql := sSql + 'lr.idlinha                as IdLinha, ';
  sSql := sSql + 'lr.cod_linha              as CodLinha, ';
  sSql := sSql + 'lr.descricao              as DescricaoLinha, ';
  sSql := sSql + 'na.idNatureza             as IdNatureza, ';
  sSql := sSql + 'na.descricao              as NaturezaLinha, ';
  sSql := sSql + 'tc.idtipodecategoria      as IdCategoria, ';
  sSql := sSql + 'tc.descricaocategoria     as Categoria, ';
  sSql := sSql + 'sum(PS.PLSDEBITOCORRENTE) as Debito, ';
  sSql := sSql + 'sum(PS.PLSCREDITOCOR)     as Credito, ';
  sSql := sSql + '(sum(PS.PLSCREDITOCOR) - sum(PS.PLSDEBITOCORRENTE)) as Total ';
  sSql := sSql + 'from ';
  sSql := sSql + 'tipo_relatorio       TP, ';
  sSql := sSql + 'Norma_vigente        NV, ';
  sSql := sSql + 'Linha_Relatorio      LR, ';
  sSql := sSql + 'Natureza_Linha       NA, ';
  sSql := sSql + 'TipoDeCategoria      TC, ';
  sSql := sSql + 'linhaxcontacontabil  LC, ';
  sSql := sSql + 'planoconta           PLA, ';
  sSql := sSql + 'planosaldo           PS ';
  sSql := sSql + 'where ';
  sSql := sSql + 'tp.idtipo               = nv.idtipo and ';
//sSql := sSql + 'nv.idnorma              = lr.idnorma and ';
  sSql := sSql + 'lr.idnatureza           = na.idnatureza and ';
  sSql := sSql + 'lr.idtipodecategoria    = tc.idtipodecategoria and ';
  sSql := sSql + 'lr.idlinha              = lc.idlinha and ';
  sSql := sSql + 'lc.plano                = pla.plano and ';
  sSql := sSql + 'lc.placonta             = pla.placonta and ';
  sSql := sSql + 'pla.plano               = ps.plano and ';
  sSql := sSql + 'pla.placonta            = ps.placonta and ';
  sSql := sSql + '(nv.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'') or nv.datafim is null) and ';
  sSql := sSql + 'ps.perexercicio         = ' + pExercicio + ' and ';
  sSql := sSql + 'tp.idTipo               = 2  and ';
//sSql := sSql + 'nv.IdNorma              = ' + IntToStr(idNorma) + ' and  ' ;
  sSql := sSql + 'tc.idtipodecategoria    <> 4 ';
  if idCategoria <> 0 then
    sSql := sSql + ' and tc.idtipodecategoria  = ' + IntToStr(idCategoria) + ' ' ;
  sSql := sSql + 'group by ';
  sSql := sSql + 'tp.idTipo, ';
  sSql := sSql + 'tp.Descricao, ';
//sSql := sSql + 'nv.idnorma, ';
  sSql := sSql + 'nv.Descricao, ';
  sSql := sSql + 'nv.DataInicio, ';
  sSql := sSql + 'nv.datafim, ';
  sSql := sSql + 'lr.idlinha, ';
  sSql := sSql + 'lr.cod_linha, ';
  sSql := sSql + 'lr.descricao, ';
  sSql := sSql + 'na.idNatureza, ';
  sSql := sSql + 'na.descricao, ';
  sSql := sSql + 'tc.idtipodecategoria, ';
  sSql := sSql + 'tc.descricaocategoria ';
  sSql := sSql + 'order by  tc.descricaocategoria, lr.cod_linha ';
  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.iLocNorma(idTipo: Integer; pExercicio: String ) : Integer;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := '';
  sSql := 'Select ';
  sSql := sSql + 'idnorma ';
  sSql := sSql + 'from Norma_vigente ';
  sSql := sSql + 'where ';
  sSql := sSql + '(datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'') or datafim is null) and ';
  sSql := sSql + 'idTipo = ' + IntToStr(idTipo)+  ' ';
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;

  Result := qryAux.FieldByName('IdNorma').asInteger;
  freeandnil(qryAux);

end;


function tCtrlDaconMT.CarregaListaQualfRF : OleVariant;
var
  sSql: String;
begin
  sSql := 'SELECT CODQUALIRF, DESCRICAORF FROM QUALIRF_DIPJ';
  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.CarregaLinhasContas(idTipo, idNorma : Integer; pExercicio: String ) : OleVariant;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := '';
  sSql := 'select distinct lr.cod_linha  as CodLinha, lr.descricao  as DescricaoLinha, ';
  sSql := sSql + 'tc.descricaocategoria as categoria ';
  sSql := sSql + 'from ';
  sSql := sSql + 'tipo_relatorio       TP, ';
  sSql := sSql + 'Norma_vigente        NV, ';
  sSql := sSql + 'Linha_Relatorio      LR, ';
  sSql := sSql + 'Natureza_Linha       NA, ';
  sSql := sSql + 'TipoDeCategoria      TC, ';
  sSql := sSql + 'linhaxcontacontabil  LC, ';
  sSql := sSql + 'planoconta           PLA, ';
  sSql := sSql + 'planosaldo           PS ';
  sSql := sSql + 'where ';
  sSql := sSql + 'tp.idtipo               = nv.idtipo and ';
  sSql := sSql + 'nv.idnorma              = lr.idnorma and ';
  sSql := sSql + 'lr.idnatureza           = na.idnatureza and ';
  sSql := sSql + 'lr.idtipodecategoria    = tc.idtipodecategoria and ';
  sSql := sSql + 'lr.idlinha              = lc.idlinha and ';
  sSql := sSql + 'lc.plano                = pla.plano and ';
  sSql := sSql + 'lc.placonta             = pla.placonta and ';
  sSql := sSql + 'pla.plano               = ps.plano and ';
  sSql := sSql + 'pla.placonta            = ps.placonta and ';
  sSql := sSql + '(nv.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'') or nv.datafim is null) and ';
  sSql := sSql + 'ps.perexercicio         = ' + pExercicio + ' and ';
  sSql := sSql + 'tp.idTipo               = ' + IntToStr(idTipo)+  ' and ';
  sSql := sSql + 'nv.IdNorma              = ' + IntToStr(idNorma) + ' and ' ;
  sSql := sSql + 'tc.idtipodecategoria in (1,2) ';
  sSql := sSql + 'order by  lr.descricao ';
  Result := GetDataPacket(sSql);

end;

function tCtrlDaconMT.MostrarGridAnaliticoPorConta(idTipo, idNorma, idRecibo : Integer; pExercicio, pConta: String) : OleVariant;
Var
  sSql: String;
Begin
  if idRecibo = 0 then
    begin
      sSql := '';
      sSql := 'Select ';
      sSql := sSql + 'tp.idTipo                 as IdTipo, ';
      sSql := sSql + 'tp.Descricao              as TipoRelatorio, ';
      sSql := sSql + 'nv.idnorma                as IdNorma, ';
      sSql := sSql + 'nv.Descricao              as Norma, ';
      sSql := sSql + 'nv.DataInicio             as DataInicio, ';
      sSql := sSql + 'nv.datafim                as DataFim, ';
      sSql := sSql + 'lr.idlinha                as IdLinha, ';
      sSql := sSql + 'lr.cod_linha              as CodLinha, ';
      sSql := sSql + 'lr.descricao              as DescricaoLinha, ';
      sSql := sSql + 'na.idNatureza             as IdNatureza, ';
      sSql := sSql + 'na.descricao              as NaturezaLinha, ';
      sSql := sSql + 'tc.idtipodecategoria      as IdCategoria, ';
      sSql := sSql + 'tc.descricaocategoria     as Categoria, ';
      sSql := sSql + 'lc.placonta               as PlanoConta, ';
      sSql := sSql + 'pla.planome               as PlanoNome, ';
      sSql := sSql + 'sum(PS.PLSDEBITOCORRENTE) as Debito, ';
      sSql := sSql + 'sum(PS.PLSCREDITOCOR)     as Credito, ';
      sSql := sSql + '(sum(PS.PLSCREDITOCOR) - sum(PS.PLSDEBITOCORRENTE)) as Total ';
      sSql := sSql + 'from ';
      sSql := sSql + 'tipo_relatorio       TP, ';
      sSql := sSql + 'Norma_vigente        NV, ';
      sSql := sSql + 'Linha_Relatorio      LR, ';
      sSql := sSql + 'Natureza_Linha       NA, ';
      sSql := sSql + 'TipoDeCategoria      TC, ';
      sSql := sSql + 'linhaxcontacontabil  LC, ';
      sSql := sSql + 'planoconta           PLA, ';
      sSql := sSql + 'planosaldo           PS ';
      sSql := sSql + 'where ';
      sSql := sSql + 'tp.idtipo               = nv.idtipo and ';
      sSql := sSql + 'nv.idnorma              = lr.idnorma and ';
      sSql := sSql + 'lr.idnatureza           = na.idnatureza and ';
      sSql := sSql + 'lr.idtipodecategoria    = tc.idtipodecategoria and ';
      sSql := sSql + 'lr.idlinha              = lc.idlinha and ';
      sSql := sSql + 'lc.plano                = pla.plano and ';
      sSql := sSql + 'lc.placonta             = pla.placonta and ';
      sSql := sSql + 'pla.plano               = ps.plano and ';
      sSql := sSql + 'pla.placonta            = ps.placonta and ';
      sSql := sSql + '(nv.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'') or nv.datafim is null) and ';
      sSql := sSql + 'ps.perexercicio         = ' + pExercicio + ' and ';
      sSql := sSql + 'tp.idTipo               = ' + IntToStr(idTipo)+  ' and ';
      sSql := sSql + 'nv.IdNorma              = ' + IntToStr(idNorma) + ' ' ;
      if pConta <> '0' then
        sSql := sSql + 'and lr.cod_linha            = ' + pConta + ' ';
      sSql := sSql + 'group by  ';
      sSql := sSql + 'tp.idTipo, ';
      sSql := sSql + 'tp.Descricao, ';
      sSql := sSql + 'nv.idnorma, ';
      sSql := sSql + 'nv.Descricao, ';
      sSql := sSql + 'nv.DataInicio, ';
      sSql := sSql + 'nv.datafim, ';
      sSql := sSql + 'lr.idlinha, ';
      sSql := sSql + 'lr.cod_linha, ';
      sSql := sSql + 'lr.descricao, ';
      sSql := sSql + 'na.idNatureza, ';
      sSql := sSql + 'na.descricao, ';
      sSql := sSql + 'tc.idtipodecategoria, ';
      sSql := sSql + 'tc.descricaocategoria, ';
      sSql := sSql + 'lc.placonta, ';
      sSql := sSql + 'pla.planome ';
      sSql := sSql + 'order by  tc.descricaocategoria, lr.cod_linha ';
      Result := GetDataPacket(sSql);
    end
  else
    begin
      sSql := '';
      sSql := '';
      sSql := sSql + '';
      sSql := sSql + 'select ';
      sSql := sSql + '  PLANOCONTA, ';
      sSql := sSql + '  PLANONOME, ';
      sSql := sSql + '  VLRDEBITO DEBITO, ';
      sSql := sSql + '  VLRCREDITO CREDITO, ';
      sSql := sSql + '  VLRTOTAL TOTAL ';
      sSql := sSql + 'from ';
      sSql := sSql + '  ANALITICO_DIPJ ';
      sSql := sSql + 'where ';
      sSql := sSql + '  idrecibo = ' + IntToStr(idRecibo) + ' ' ;
      if pConta <> '0' then
        sSql := sSql + 'and CodLinha            = ' + pConta + ' ';
      sSql := sSql + 'order by  categoria, CodLinha ';
      Result := GetDataPacket(sSql);
    end;


end;


function tCtrlDaconMT.TotalPorCategoriaDIPJGravada(iNroRecibo, iTpCategoria : Integer) : Real;
Var
  qryAux: Twwquery;
  sSql : String;
  iValor : Real;
Begin
  iValor := 0;
  sSql := '';
  sSql := sSql + '';
  sSql := sSql + 'select sum(VLRTOTAL) TOTAL from ANALITICO_DIPJ where ';
  sSql := sSql + '  idcategoria = ' + IntToStr(iTpCategoria) + ' and ' ;
  sSql := sSql + '  idrecibo    = ' + IntToStr(iNroRecibo) + ' ' ;

  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;
  iValor :=qryAux.FieldByName('Total').AsCurrency;
  Result := iValor;
  freeandnil(qryAux);
end;

function tCtrlDaconMT.TotalPorCategoria(idTipo, idNorma, iCategoria : Integer; pExercicio: String ) : Real;
Var
  qryAux: Twwquery;
  sSql, strTeste: String;
  iValor : Real;

Begin
  iValor := 0;
  sSql := '';
  sSql := 'Select ';
  sSql := sSql + 'tc.idtipodecategoria      as IdCategoria, ';
  sSql := sSql + 'tc.descricaocategoria     as Categoria, ';
  sSql := sSql + 'sum(PS.PLSDEBITOCORRENTE) as Debito, ';
  sSql := sSql + 'sum(PS.PLSCREDITOCOR)     as Credito, ';
  sSql := sSql + '(sum(PS.PLSCREDITOCOR) - sum(PS.PLSDEBITOCORRENTE)) as Total ';
  sSql := sSql + 'from ';
  sSql := sSql + 'tipo_relatorio       TP, ';
  sSql := sSql + 'Norma_vigente        NV, ';
  sSql := sSql + 'Linha_Relatorio      LR, ';
  sSql := sSql + 'Natureza_Linha       NA, ';
  sSql := sSql + 'TipoDeCategoria      TC, ';
  sSql := sSql + 'linhaxcontacontabil  LC, ';
  sSql := sSql + 'planoconta           PLA, ';
  sSql := sSql + 'planosaldo           PS ';
  sSql := sSql + 'where ';
  sSql := sSql + 'tp.idtipo               = nv.idtipo and ';
  sSql := sSql + 'nv.idnorma              = lr.idnorma and ';
  sSql := sSql + 'lr.idnatureza           = na.idnatureza and ';
  sSql := sSql + 'lr.idtipodecategoria    = tc.idtipodecategoria and ';
  sSql := sSql + 'lr.idlinha              = lc.idlinha and ';
  sSql := sSql + 'lc.plano                = pla.plano and ';
  sSql := sSql + 'lc.placonta             = pla.placonta and ';
  sSql := sSql + 'pla.plano               = ps.plano and ';
  sSql := sSql + 'pla.placonta            = ps.placonta and ';
  sSql := sSql + '(nv.datafim = to_date(''30/12/1899'', ''dd/mm/yyyy'') or nv.datafim is null) and ';
  sSql := sSql + 'ps.perexercicio         = ' + pExercicio + ' and ';
  sSql := sSql + 'tp.idTipo               = ' + IntToStr(idTipo)+  ' and ';
  sSql := sSql + 'nv.IdNorma              = ' + IntToStr(idNorma) + ' and ' ;
  sSql := sSql + 'tc.idtipodecategoria    = ' + IntToStr(iCategoria) + ' ' ;
  sSql := sSql + 'group by ';
  sSql := sSql + 'tc.idtipodecategoria, ';
  sSql := sSql + 'tc.descricaocategoria ';
//  Result := GetDataPacket(sSql);


  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;

  iValor :=qryAux.FieldByName('Total').AsCurrency;

  Result := iValor;


  freeandnil(qryAux);

end;




function tCtrlDaconMT.InsertTabRendimentosDIPJ(cdsRendimentos: TCmClientDataSet; iNroRecibo, iNorma : Integer; strAno: String) : Boolean;
Var
  qryAux: Twwquery;
  cdsRendimentoLoc : TCmClientDataSet;
  iFlagDem : Integer;
Begin
  try
    iFlagDem := 0;
    cdsRendimentoLoc := TCmClientDataSet.Create(Nil);
    cdsRendimentoLoc.data := cdsRendimentos.data;
    cdsRendimentoLoc.First;
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    while not (cdsRendimentoLoc.Eof) do
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' INSERT INTO RENDIMENTOS_DIPJ ');
        qryAux.SQL.Add(' ( ');
        qryAux.SQL.Add(' IDSEQ, IDRECIBO, IDNORMA, ANO, CPF, NOME, CARGO, IRRF, RENDIMENTO, CODQUALIRF, FLGDEMITIDO ');
        qryAux.SQL.Add(' ) ');
        qryAux.SQL.Add(' VALUES ');
        qryAux.SQL.Add(' ( ');
        qryAux.SQL.Add(' :IDSEQ, :IDRECIBO, :IDNORMA, :ANO, :CPF, :NOME, :CARGO, :IRRF, :RENDIMENTO, :CODQUALIRF, :FLGDEMITIDO ');
        qryAux.SQL.Add(' ) ');
        qryAux.ParamByName('IDSEQ').asInteger         := LeUltRegistro(Nil, 'RENDIMENTOS_DIPJ');
        qryAux.ParamByName('IDRECIBO').asInteger      := iNroRecibo;
        qryAux.ParamByName('IDNORMA').asInteger       := iNorma;
        qryAux.ParamByName('ANO').asString            := strAno;
        qryAux.ParamByName('CPF').asString            := cdsRendimentoLoc.FieldByName('CPF').asString;
        qryAux.ParamByName('NOME').asString           := cdsRendimentoLoc.FieldByName('NOME').asString;
        qryAux.ParamByName('CARGO').asString          := cdsRendimentoLoc.FieldByName('CARGO').asString;
        qryAux.ParamByName('IRRF').AsFloat            := cdsRendimentoLoc.FieldByName('IRRF').AsFloat;
        qryAux.ParamByName('RENDIMENTO').AsFloat      := cdsRendimentoLoc.FieldByName('RENDIMENTO').AsFloat;
        qryAux.ParamByName('CODQUALIRF').asInteger    := 99;
        if cdsRendimentoLoc.FieldByName('DTDEMISSAO').AsString = '' then
          iFlagDem := 1 //ativo
        else
          iFlagDem := 0; //demitido
        qryAux.ParamByName('FLGDEMITIDO').asInteger   := iFlagDem;
        qryAux.ExecSQL;
        cdsRendimentoLoc.Next;
      end;
      result := true;
      freeandnil(qryAux);
      freeandnil(cdsRendimentoLoc);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
        freeandnil(cdsRendimentoLoc);
      end;
  End;
end;


function tCtrlDaconMT.InsertTabContribPrevDIPJ(cdsContrPrevs: TCmClientDataSet; iNroRecibo, idNormaG : Integer) : Boolean;
Var
  qryAux: Twwquery;
  cdsAnalitico : TCmClientDataSet;
Begin
  try
    cdsAnalitico := TCmClientDataSet.Create(Nil);
    cdsAnalitico.data := cdsContrPrevs.data;
    cdsAnalitico.First;
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    while not (cdsAnalitico.Eof) do
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' INSERT INTO CONTRIBPREV_DIPJ ');
        qryAux.SQL.Add(' ( ');
        qryAux.SQL.Add(' IDSEQ, IDRECIBO, IDNORMA, IDLINHA,  ');
        qryAux.SQL.Add(' CODLINHA, DESCRICAOLINHA, TOTAL ');
        qryAux.SQL.Add(' ) ');
        qryAux.SQL.Add(' VALUES ');
        qryAux.SQL.Add(' ( ');
        qryAux.SQL.Add(' :IDSEQ, :IDRECIBO, :IDNORMA, :IDLINHA,  ');
        qryAux.SQL.Add(' :CODLINHA, :DESCRICAOLINHA, :TOTAL ');
        qryAux.SQL.Add(' ) ');
//      qryAux.ParamByName('IDSEQ').asInteger         := LeUltRegistro(Nil, 'ANALITICO_DIPJ');
        qryAux.ParamByName('IDSEQ').asInteger         := LeUltRegistro(Nil, 'CONTRIBPREV_DIPJ');
        qryAux.ParamByName('IDRECIBO').asInteger      := iNroRecibo;
        qryAux.ParamByName('IDNORMA').asInteger       := CdsAnalitico.FieldByName('IDNORMA').asInteger;
        qryAux.ParamByName('IDLINHA').asInteger       := CdsAnalitico.FieldByName('IDLINHA').asInteger;
        qryAux.ParamByName('CODLINHA').asString       := CdsAnalitico.FieldByName('CODLINHA').asString;
        qryAux.ParamByName('DESCRICAOLINHA').asString := CdsAnalitico.FieldByName('DESCRICAOLINHA').asString;
        qryAux.ParamByName('TOTAL').AsFloat           := CdsAnalitico.FieldByName('TOTAL').AsFloat;
        qryAux.ExecSQL;
        cdsAnalitico.Next;
      end;
      result := true;
      freeandnil(qryAux);
      freeandnil(cdsAnalitico);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
        freeandnil(cdsAnalitico);
      end;
  End;
end;


function tCtrlDaconMT.InsertTabAnaliticoDIPJ(cdsAnaliticos: TCmClientDataSet; iNroRecibo : Integer) : Boolean;
Var
  qryAux: Twwquery;
  cdsAnalitico : TCmClientDataSet;
Begin
  try
    cdsAnalitico := TCmClientDataSet.Create(Nil);
    cdsAnalitico.data := cdsAnaliticos.data;
    cdsAnalitico.First;
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    while not (cdsAnalitico.Eof) do
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' INSERT INTO ANALITICO_DIPJ ');
        qryAux.SQL.Add(' ( ');
        qryAux.SQL.Add(' IDSEQ, IDRECIBO, IDNORMA, IDLINHA, IDCATEGORIA, IDNATUREZA, DATAINICIO, DATAFIM, ');
        qryAux.SQL.Add(' CODLINHA, DESCRICAOLINHA, NATUREZALINHA, CATEGORIA, PLANOCONTA, PLANONOME, ');
        qryAux.SQL.Add(' VLRDEBITO, VLRCREDITO, VLRTOTAL ');
        qryAux.SQL.Add(' ) ');
        qryAux.SQL.Add(' VALUES ');
        qryAux.SQL.Add(' ( ');
        qryAux.SQL.Add(' :IDSEQ, :IDRECIBO, :IDNORMA, :IDLINHA, :IDCATEGORIA, :IDNATUREZA, :DATAINICIO, :DATAFIM, ');
        qryAux.SQL.Add(' :CODLINHA, :DESCRICAOLINHA, :NATUREZALINHA, :CATEGORIA, :PLANOCONTA, :PLANONOME, ');
        qryAux.SQL.Add(' :VLRDEBITO, :VLRCREDITO, :VLRTOTAL ');
        qryAux.SQL.Add(' ) ');
        qryAux.ParamByName('IDSEQ').asInteger         := LeUltRegistro(Nil, 'ANALITICO_DIPJ');
        qryAux.ParamByName('IDRECIBO').asInteger      := iNroRecibo;
        qryAux.ParamByName('IDNORMA').asInteger       := CdsAnalitico.FieldByName('IDNORMA').asInteger;
        qryAux.ParamByName('IDLINHA').asInteger       := CdsAnalitico.FieldByName('IDLINHA').asInteger;
        qryAux.ParamByName('IDCATEGORIA').asInteger   := CdsAnalitico.FieldByName('IDCATEGORIA').asInteger;
        qryAux.ParamByName('IDNATUREZA').asInteger    := CdsAnalitico.FieldByName('IDNATUREZA').asInteger;
        qryAux.ParamByName('DATAINICIO').asDate       := CdsAnalitico.FieldByName('DATAINICIO').AsDateTime;
        qryAux.ParamByName('DATAFIM').asDate          := CdsAnalitico.FieldByName('DATAFIM').AsDateTime;
        qryAux.ParamByName('CODLINHA').asString       := CdsAnalitico.FieldByName('CODLINHA').asString;
        qryAux.ParamByName('DESCRICAOLINHA').asString := CdsAnalitico.FieldByName('DESCRICAOLINHA').asString;
        qryAux.ParamByName('NATUREZALINHA').asString  := CdsAnalitico.FieldByName('NATUREZALINHA').asString;
        qryAux.ParamByName('CATEGORIA').asString      := CdsAnalitico.FieldByName('CATEGORIA').asString;
        qryAux.ParamByName('PlanoConta').asString     := CdsAnalitico.FieldByName('PlanoConta').asString;
        qryAux.ParamByName('PLANONOME').asString      := CdsAnalitico.FieldByName('PLANONOME').asString;
        qryAux.ParamByName('VLRDEBITO').AsFloat       := CdsAnalitico.FieldByName('DEBITO').AsFloat;
        qryAux.ParamByName('VLRCREDITO').AsFloat      := CdsAnalitico.FieldByName('CREDITO').AsFloat;
        qryAux.ParamByName('VLRTOTAL').AsFloat        := CdsAnalitico.FieldByName('TOTAL').AsFloat;
        qryAux.ExecSQL;
        cdsAnalitico.Next;
      end;
      result := true;
      freeandnil(qryAux);
      freeandnil(cdsAnalitico);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
        freeandnil(cdsAnalitico);
      end;
  End;

end;


function tCtrlDaconMT.InsertTabReciboDIPJ(idNorma, idReciboOriginal: Integer; strExercicio, sTipo: String) : Integer;
var
  qryAux: Twwquery;
  iNrReceibo : Integer;
begin
  try
    iNrReceibo := LeUltRegistro(Nil, 'ANALITICO_DIPJ');
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' INSERT INTO RECIBOS_DIPJ ');
    qryAux.SQL.Add(' ( ');
    qryAux.SQL.Add(' IDRECIBO, IDRECIBORET, IDNORMA, RETIFICADOR, EXERCICIO ');
    qryAux.SQL.Add(' ) ');
    qryAux.SQL.Add(' VALUES ');
    qryAux.SQL.Add(' ( ');
    qryAux.SQL.Add(' :IDRECIBO, :IDRECIBORET, :IDNORMA, :RETIFICADOR, :EXERCICIO ');
    qryAux.SQL.Add(' ) ');
    qryAux.ParamByName('IDRECIBO').asInteger      := iNrReceibo;
    if idReciboOriginal = 0 then
      qryAux.ParamByName('IDRECIBORET').asInteger      := iNrReceibo
    else
      qryAux.ParamByName('IDRECIBORET').asInteger      := idReciboOriginal;
    qryAux.ParamByName('IDNORMA').asInteger       := idNorma;
    qryAux.ParamByName('RETIFICADOR').asString    := sTipo;
    qryAux.ParamByName('EXERCICIO').asString      := strExercicio;
    qryAux.ExecSQL;
    result := iNrReceibo;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := 0;
        freeandnil(qryAux);
      end;
  End;
end;


function tCtrlDaconMT.SelectTabReciboDIPJ(idNorma: Integer; strExercicio: String) : Integer;
var
  qryAux  : Twwquery;
  iRes    : Integer;
begin
  iRes := 0;
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDRECIBO FROM RECIBOS_DIPJ ');
  qryAux.SQL.Add('WHERE ');
  qryAux.SQL.Add('EXERCICIO = :EXERCICIO AND ');
  qryAux.SQL.Add('IDNORMA   = :IDNORMA ');
  qryAux.ParamByName('EXERCICIO').AsString := strExercicio;
  qryAux.ParamByName('IDNORMA').AsInteger := idNorma;
  qryAux.Open;
  if not qryAux.Eof Then
    begin
      iRes :=  qryAux.FieldByName('IDRECIBO').AsInteger;
    end;
  result := iRes;
  freeandnil(qryAux);
end;

function tCtrlDaconMT.DeleteTabReciboDIPJ(iNRoRecibo: Integer) : Boolean;
var
  qryAux  : Twwquery;
  iRes    : Integer;
begin
  iRes := 0;
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM RECIBOS_DIPJ ');
    qryAux.SQL.Add('WHERE ');
    qryAux.SQL.Add('IDRECIBO = :IDRECIBO  ');
    qryAux.ParamByName('IDRECIBO').AsInteger := iNRoRecibo;
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;
end;

function tCtrlDaconMT.DeleteTabAnaliticoDIPJ(iNRoRecibo: Integer) : Boolean;
var
  qryAux  : Twwquery;
  iRes    : Integer;
begin
  iRes := 0;
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM ANALITICO_DIPJ ');
    qryAux.SQL.Add('WHERE ');
    qryAux.SQL.Add('IDRECIBO = :IDRECIBO  ');
    qryAux.ParamByName('IDRECIBO').AsInteger := iNRoRecibo;
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;
end;

function tCtrlDaconMT.DeleteTabRendimentosDIPJ(iNRoRecibo: Integer) : Boolean;
var
  qryAux  : Twwquery;
  iRes    : Integer;
begin
  iRes := 0;
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM RENDIMENTOS_DIPJ ');
    qryAux.SQL.Add('WHERE ');
    qryAux.SQL.Add('IDRECIBO = :IDRECIBO  ');
    qryAux.ParamByName('IDRECIBO').AsInteger := iNRoRecibo;
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;
end;

function tCtrlDaconMT.DeleteTabContribPrevDIPJ(iNRoRecibo: Integer) : Boolean;
var
  qryAux  : Twwquery;
  iRes    : Integer;
begin
  iRes := 0;
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM CONTRIBPREV_DIPJ ');
    qryAux.SQL.Add('WHERE ');
    qryAux.SQL.Add('IDRECIBO = :IDRECIBO  ');
    qryAux.ParamByName('IDRECIBO').AsInteger := iNRoRecibo;
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;
end;


function tCtrlDaconMT.DeleteTabContribComplPrevDIPJ(iNRoRecibo: Integer) : Boolean;
var
  qryAux  : Twwquery;
  iRes    : Integer;
begin
  iRes := 0;
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM COMPLPREV_DIPJ ');
    qryAux.SQL.Add('WHERE ');
    qryAux.SQL.Add('IDRECIBO = :IDRECIBO  ');
    qryAux.ParamByName('IDRECIBO').AsInteger := iNRoRecibo;
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;
end;

function tCtrlDaconMT.MostrarPreviDIPJGravado(iNroRecibo : Integer) : OleVariant;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := '';
  sSql := sSql + '';
  sSql := sSql + 'SELECT ';
  sSql := sSql + 'IDSEQ, IDRECIBO, IDNORMA, IDLINHA, CODLINHA, DESCRICAOLINHA, TOTAL ';
  sSql := sSql + '  FROM CONTRIBPREV_DIPJ ';
  sSql := sSql + 'WHERE ';
  sSql := sSql + '  idrecibo = ' + IntToStr(iNroRecibo) + ' ' ;
  sSql := sSql + 'order by codlinha ';
  Result := GetDataPacket(sSql);
end;

function tCtrlDaconMT.MostraSinteticoDIPJGravado(iNroRecibo, iTpCat : Integer) : OleVariant;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := '';
  sSql := sSql + '';
  sSql := sSql + ' select ';
  sSql := sSql + '   codlinha , descricaolinha, categoria, sum(vlrtotal) TOTAL ';
  sSql := sSql + ' from ';
  sSql := sSql + '   ANALITICO_DIPJ ';
  sSql := sSql + ' where ';
  sSql := sSql + '   idrecibo = ' + IntToStr(iNroRecibo) + ' and ' ;
  sSql := sSql + '   idcategoria <> 4 ';
  if iTpCat <> 0 then
    sSql := sSql + ' and idCategoria = ' + IntToStr(iTpCat);
  sSql := sSql + ' group by ';
  sSql := sSql + '   codlinha, descricaolinha, categoria ';
  sSql := sSql + ' order by ';
  sSql := sSql + '   codlinha, categoria  ';// SOL 209775 e SOL 233732
  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.MostraAnaliticoDIPJGravado(iNroRecibo : Integer) : OleVariant;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := '';
  sSql := sSql + '';
  sSql := sSql + 'select ';
  sSql := sSql + '  PLANOCONTA, ';
  sSql := sSql + '  PLANONOME, ';
  sSql := sSql + '  VLRDEBITO DEBITO, ';
  sSql := sSql + '  VLRCREDITO CREDITO, ';
  sSql := sSql + '  VLRTOTAL TOTAL ';
  sSql := sSql + 'from ';
  sSql := sSql + '  ANALITICO_DIPJ ';
  sSql := sSql + 'where ';
  sSql := sSql + '  idrecibo = ' + IntToStr(iNroRecibo) + ' and ' ;
  sSql := sSql + '  idcategoria <> 4 ';
  Result := GetDataPacket(sSql);
end;



function tCtrlDaconMT.MostraRendimentosDIPJGravado(iNroRecibo : Integer) : OleVariant;
Var
  qryAux: Twwquery;
  sSql: String;
Begin
  sSql := '';
  sSql := sSql + '';
  sSql := sSql + ' SELECT  ';
  sSql := sSql + ' R.IDSEQ IDSEQ, R.ANO ANO, R.CPF CPF, R.NOME NOME, R.CARGO CARGO,  ';
  sSql := sSql + ' R.IRRF IRRF, R.RENDIMENTO RENDIMENTO, Q.DESCRICAORF DESCRICAORF, R.CODQUALIRF  CODQUALIRF ';
  sSql := sSql + ' FROM   ';
  sSql := sSql + ' RENDIMENTOS_DIPJ R, QUALIRF_DIPJ Q  ';
  sSql := sSql + ' WHERE   ';
  sSql := sSql + ' R.CODQUALIRF  = Q.CODQUALIRF  AND   ';
  sSql := sSql + ' R.IDRECIBO = ' + IntToStr(iNroRecibo) + ' ';
  sSql := sSql + ' ORDER BY  R.NOME ';

  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.ExistirDIPJ(idNorma: Integer; pExercicio, pNroRecibo: String) : Integer;
var
  qryAux  : Twwquery;
begin
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDRECIBO, NUMERORECIBO  FROM RECIBOS_DIPJ ');
  qryAux.SQL.Add('WHERE ');
  qryAux.SQL.Add('EXERCICIO = :EXERCICIO AND ');
  if pNroRecibo <> '' then
    qryAux.SQL.Add(' NUMERORECIBO = :NUMERORECIBO AND ');
  qryAux.SQL.Add('IDNORMA   = :IDNORMA ');
  qryAux.ParamByName('EXERCICIO').AsString := pExercicio;
  if pNroRecibo <> '' then
    qryAux.ParamByName('NUMERORECIBO').AsString := pNroRecibo;
  qryAux.ParamByName('IDNORMA').AsInteger := idNorma;

  qryAux.Open;
  if not qryAux.Eof Then
    begin
      result :=  qryAux.FieldByName('IDRECIBO').AsInteger;
    end
  else
    result := 0;
  freeandnil(qryAux);
end;

function tCtrlDaconMT.CarregaLinhasContasDIPJGravadas(iNroRecibo : Integer) : OleVariant;
Var
  sSql: String;
Begin
  sSql := '';
  sSql := sSql + '';
  sSql := sSql + 'select distinct CodLinha, DescricaoLinha, Categoria, idcategoria from ANALITICO_DIPJ ';
  sSql := sSql + ' where idrecibo = ' + IntToStr(iNroRecibo);
  sSql := sSql + ' order by  idcategoria, codlinha  ';
  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.ExistirReciboIni(idRecibo, idNorma : Integer; sRetificador, sExercicio : String) : Integer;
var
  qryAux  : Twwquery;
begin
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDRECIBORET FROM RECIBOS_DIPJ ');
  qryAux.SQL.Add('WHERE ');
  qryAux.SQL.Add('IDRECIBO     = :IDRECIBO    AND ');
  qryAux.SQL.Add('IDNORMA      = :IDNORMA     AND ');
  qryAux.SQL.Add('IDRECIBO    != IDRECIBORET  AND ');
  qryAux.SQL.Add('RETIFICADOR  = :RETIFICADOR AND ');
  qryAux.SQL.Add('EXERCICIO    = :EXERCICIO ');
  qryAux.ParamByName('IDRECIBO').AsInteger   := idRecibo;
  qryAux.ParamByName('IDNORMA').AsInteger    := idNorma;
  qryAux.ParamByName('RETIFICADOR').AsString := sRetificador;
  qryAux.ParamByName('EXERCICIO').AsString   := sExercicio;
  qryAux.Open;
  if not qryAux.Eof Then
    begin
      result   := qryAux.FieldByName('IDRECIBORET').AsInteger;
    end;
  freeandnil(qryAux);
end;



function tCtrlDaconMT.ExistirReciboDIPJ(idNorma : Integer; sExercicio: String) : Integer;
var
  qryAux  : Twwquery;
begin
  result := 0;
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDRECIBO FROM RECIBOS_DIPJ ');
  qryAux.SQL.Add('WHERE ');
  qryAux.SQL.Add('EXERCICIO = :EXERCICIO AND ');
  qryAux.SQL.Add('IDNORMA   = :IDNORMA ');
  qryAux.ParamByName('EXERCICIO').AsString := sExercicio;
  qryAux.ParamByName('IDNORMA').AsInteger  := idNorma;
  qryAux.Open;
  if not qryAux.Eof Then
    begin
      result   := qryAux.FieldByName('IDRECIBO').AsInteger;
    end;
  freeandnil(qryAux);
end;



function tCtrlDaconMT.ContaQtdFuncPer(sExercicio: String; IdTipoQtd : Integer) : String;
var
  qryAux  : Twwquery;
  pQtdEmpr : String;
  sSql : String;
begin
  pQtdEmpr := '';
  sSql := '';

  { Thiago Melo SOL 208941 Kintana 2020125

  sSql := sSql + ' SELECT COUNT(E.IDPESSOA) QTD_EMPREGADOS ';
  sSql := sSql + ' FROM ELEGPATRO E, PESSOA P ';
  sSql := sSql + ' WHERE E.IDPESSOA = P.IDPESSOA ';
  sSql := sSql + ' AND IDPESSJUR = 1 ';
 if idTipoQtd = 1 then
    sSql := sSql + ' AND (DATADEMISSAO IS NULL OR DATADEMISSAO BETWEEN ''01/01/' + sExercicio  + ''' AND ''05/01/' + sExercicio + ''')'
  else
    sSql := sSql + ' AND (DATADEMISSAO IS NULL OR DATADEMISSAO >= SYSDATE) ';

  //sSql := sSql + ' AND    E.DATAADMISSAO <= ''31/12/' + sExercicio + '''';
  sSql := sSql + ' AND MATRICULA NOT LIKE ''E%'' ';
  sSql := sSql + ' AND IDSITFUNC <> 31  ';

  Thiago Melo SOL 208941 Kintana 2020125 Fim}


  // Thiago Melo SOL 208941 Kintana 2020125 Ini

  sSql := sSql + 'SELECT ';
  sSql := sSql + ' COUNT(F.IDPESSOA) QTD_EMPREGADOS ';
  sSql := sSql + 'FROM ';
  sSql := sSql + ' PESSOA P, PESSOAFISICA PF, ENDPESS EP, CIDADES CI, CARGO C, ';
  sSql := sSql + ' FUNCIONARIO F, SITFUNC ST, HORATRAB HT, FILIALPESSOA FP, CENTCUST CC ';
  sSql := sSql + 'WHERE ';
  sSql := sSql + ' (F.IDPESSOA         = P.IDPESSOA) AND ';
  sSql := sSql + ' (P.IDPESSOA         = PF.IDPESSOA) AND ';

  case idTipoQtd of
    1 : begin
          sSql := sSql + '  (F.DATAADMISSAO    <= TO_DATE(''01/01/' + sExercicio  + ''',''DD/MM/YYYY'')) AND ';
          sSql := sSql + ' ((ST.TIPOSIT           <> ' + QuotedStr('D') + ') OR ';
          sSql := sSql + '  (F.DATADESLIGAMENTO   IS NULL) OR ';
          sSql := sSql + '  (F.DATADESLIGAMENTO > TO_DATE(''05/01/' + sExercicio  + ''',''DD/MM/YYYY''))) AND ';
        end;
    2 : begin
          sSql := sSql + '  (F.DATAADMISSAO    <= TO_DATE(''31/12/' + sExercicio  + ''' ,''DD/MM/YYYY'')) AND ';
          sSql := sSql + ' ((ST.TIPOSIT           <> ' + QuotedStr('D') + ') OR ';
          sSql := sSql + '  (F.DATADESLIGAMENTO   IS NULL) OR ';
          sSql := sSql + '  (F.DATADESLIGAMENTO > TO_DATE(''31/12' + sExercicio  + ''' ,''DD/MM/YYYY''))) AND ';
        end;
  end;

  sSql := sSql + ' (F.TIPOCONTRATO     = ' + QuotedStr('E') + ') AND ';
  sSql := sSql + ' (F.IDEMPRESA        = 1) AND ';
  sSql := sSql + ' (F.IDESTAB          = FP.IDFILIALPESSOA) AND ';
  sSql := sSql + ' (F.IDSITFUNC        = ST.IDSITFUNC) AND ';
  sSql := sSql + ' (F.IDHORARIO        = HT.IDHORARIO) AND ';
  sSql := sSql + ' (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO(+)) AND ';
  sSql := sSql + ' (F.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND ';
  sSql := sSql + ' (F.IDEMPRESA        = CC.IDEMPRESA(+)) AND ';
  sSql := sSql + ' (P.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND ';
  sSql := sSql + ' (EP.IDCIDADES       = CI.IDCIDADES(+)) ';
  sSql := sSql + 'ORDER BY ';
  sSql := sSql + ' UPPER(P.Nome) ';

  // Thiago Melo SOL 208941 Kintana 2020125

  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;
  if not qryAux.Eof Then
    begin
      pQtdEmpr := qryAux.FieldByName('QTD_EMPREGADOS').AsString;
    end;
  result := pQtdEmpr;
  freeandnil(qryAux);

end;


function tCtrlDaconMT.ExistirNroReciboDIPJ(idNorma, idRecibo: Integer; pExercicio: String) : String;
var
  qryAux  : Twwquery;
  iRes    : Integer;
  pNroRec : String;
begin
  iRes := 0;
  pNroRec := '';

  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT NUMERORECIBO  FROM RECIBOS_DIPJ ');
  qryAux.SQL.Add('WHERE ');
  qryAux.SQL.Add('EXERCICIO = :EXERCICIO AND ');
  qryAux.SQL.Add('IDNORMA   = :IDNORMA AND ');
  qryAux.SQL.Add('IDRECIBO  = :IDRECIBO  ');

  qryAux.ParamByName('EXERCICIO').AsString := pExercicio;
  qryAux.ParamByName('IDNORMA').AsInteger  := idNorma;
  qryAux.ParamByName('IDRECIBO').AsInteger := idRecibo;
  qryAux.Open;
  if not qryAux.Eof Then
    begin
      pNroRec   := qryAux.FieldByName('NUMERORECIBO').AsString;
    end;
  result := pNroRec;
  freeandnil(qryAux);
end;


function tCtrlDaconMT.InserirNroReciboDIPJ(IdRecibo: Integer; sNumRecibo: String; sDataRecibo :TDateTime) : Integer;
var
  qryAux: Twwquery;
begin
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE RECIBOS_DIPJ SET ');
    qryAux.SQL.Add(' NUMERORECIBO = :NUMERORECIBO, ');
    qryAux.SQL.Add(' DATARECIBO   = :DATARECIBO ');
    qryAux.SQL.Add(' WHERE ');
    qryAux.SQL.Add(' IDRECIBO = :IDRECIBO ');
    qryAux.ParamByName('IDRECIBO').asInteger     := IdRecibo;
    qryAux.ParamByName('NUMERORECIBO').asString  := sNumRecibo;
    qryAux.ParamByName('DATARECIBO').asDate      := sDataRecibo;
    qryAux.ExecSQL;
    result := 1;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := 0;
        freeandnil(qryAux);
      end;
  End;
end;




function tCtrlDaconMT.MostraPreviComplDIPJ(idNorma : Integer; pExercicio: String ) : OleVariant;
var
  sSql : String;
begin
  sSql := '';
  sSql := sSql + ' SELECT LR.IDLINHA IDLINHA, ';
  sSql := sSql + '        NV.IDNORMA IDNORMA, ';
  sSql := sSql + '        LR.COD_LINHA CODLINHA, ';
  sSql := sSql + '        LR.DESCRICAO DESCRICAOLINHA, ';
  sSql := sSql + '        TD.CODTIPRECDES DESEMBOLSO, ';
  sSql := sSql + '        SUM(L.VLRLANCPAGAR) TOTAL ';
  sSql := sSql + '   FROM LANCAMENTOSIMOVEL    L, ';
  sSql := sSql + '        PADRLANCIMOVEL       P, ';
  sSql := sSql + '        LINHAXTIPODESEMBOLSO TD, ';
  sSql := sSql + '        LINHA_RELATORIO      LR, ';
  sSql := sSql + '        NORMA_VIGENTE        NV, ';
  sSql := sSql + '        TIPODECATEGORIA      TC ';
  sSql := sSql + '  WHERE P.CODTIPRECDES = TD.CODTIPRECDES ';
  sSql := sSql + '    AND L.IDTIPOCUSTORECIMO = P.IDTIPOCUSTORECIMO ';
  sSql := sSql + '    AND L.IDMODULO = P.IDMODULO ';
  sSql := sSql + '    AND L.RECPAG = P.RECPAG ';
  sSql := sSql + '    AND L.IDPESSOA = P.IDPESSOA ';
  sSql := sSql + '    AND L.CODTIPIMOVEL = P.CODTIPIMOVEL ';
  sSql := sSql + '    AND LR.IDLINHA = TD.IDLINHA ';
  sSql := sSql + '    AND TD.IDNORMA = NV.IDNORMA ';
  sSql := sSql + '    AND NV.IDNORMA =  ' + IntToStr(idNorma);
  sSql := sSql + '    AND TC.IDTIPODECATEGORIA = 4 ';
  sSql := sSql + '    AND L.IDTIPOCUSTORECIMO IN (197, 216, 158) ';
  sSql := sSql + '    AND L.ANOCOMPETENCIA = ' + pExercicio;
  sSql := sSql + '    AND P.RECPAG = ''P'' ';
  sSql := sSql + '    AND L.CODTIPIMOVEL IN (''RENDA'', ''CONST'', ''HOTEL'', ''SHOPP'', ''PATRO'') ';
  sSql := sSql + '    AND TO_CHAR(L.DATAVENCIMENTO, ''YYYY'') = ' + pExercicio;
  sSql := sSql + '  GROUP BY LR.IDLINHA, ';
  sSql := sSql + '           NV.IDNORMA, ';
  sSql := sSql + '           LR.COD_LINHA, ';
  sSql := sSql + '           LR.DESCRICAO, ';
  sSql := sSql + '           TD.CODTIPRECDES ';
  Result := GetDataPacket(sSql);
end;

function tCtrlDaconMT.MostraRecibosRetificadoresDIPJ(pExercicio: String; iNorma: Integer ) : OleVariant;
var
  sSql : String;
begin
  sSql := '';
  sSql := sSql + ' SELECT ';
  sSql := sSql + ' IDRECIBO, IDRECIBORET, NUMERORECIBO, DATARECIBO, RETIFICADOR, EXERCICIO ';
  sSql := sSql + ' FROM ';
  sSql := sSql + ' RECIBOS_DIPJ ';
  sSql := sSql + ' WHERE ';
  sSql := sSql + ' EXERCICIO = ' + pExercicio + ' AND IDNORMA = ' + IntToStr(iNorma);
  Result := GetDataPacket(sSql);
end;



function tCtrlDaconMT.ProcurarCodByDescricao(sTexto : String) : Integer;
var
  qryAux  : Twwquery;
  iRes    : Integer;
begin
  iRes := 99;
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CODQUALIRF, DESCRICAORF FROM QUALIRF_DIPJ  ');
  qryAux.SQL.Add('WHERE  ');
  qryAux.SQL.Add('DESCRICAORF = :DESCRICAORF');
  qryAux.ParamByName('DESCRICAORF').AsString := sTexto;
  qryAux.Open;
  if not qryAux.Eof Then
    begin
      iRes := qryAux.FieldByName('CODQUALIRF').asInteger;
    end;
  result := iRes;
  freeandnil(qryAux);
end;

function tCtrlDaconMT.AtualizaCodRF(sCPF: String; iCodRF, idRecibo, idSeq : Integer) : boolean;
var
  qryAux: Twwquery;
  sSql : String;
begin
  try
    sSql := '';
    sSql := ' UPDATE RENDIMENTOS_DIPJ SET  CODQUALIRF = ' + IntToStr(iCodRF);
    sSql := sSql + ' WHERE CPF = ' + sCPF + ' AND IDRECIBO = ' + IntToStr(idRecibo);
    sSql := sSql + ' AND IDSEQ = ' + IntToStr(idSeq);
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSql);
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;
end;



function tCtrlDaconMT.ExisteCod99(idRecibo : Integer) : boolean;
var
  qryAux  : Twwquery;
begin
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CPF FROM RENDIMENTOS_DIPJ ');
  qryAux.SQL.Add('WHERE ');
  qryAux.SQL.Add('CODQUALIRF = 99 AND ');
  qryAux.SQL.Add('IDRECIBO   = :IDRECIBO ');
  qryAux.ParamByName('IDRECIBO').AsInteger  := idRecibo;
  qryAux.Open;
//  while not qryAux.Eof do
  if not qryAux.Eof Then
    result := true
  else
    result := false;
  freeandnil(qryAux);
end;


function tCtrlDaconMT.TotalizaPrevidenciario(cdsContrPrevs: TCmClientDataSet; idNormaG: Integer; pExercicio: String) : OleVariant;
Var
  qryAux: Twwquery;
  cdsAnalitico : TCmClientDataSet;
  sSql, sMesAno : String;
  fValorBd, fValorLc, fValorNw : Real;
Begin
  try
    fValorBd := 0;
    fValorLc := 0;
    fValorNw := 0;
    sSql := '';
    sMesAno := '''12/' + pExercicio + '''';
    cdsAnalitico := TCmClientDataSet.Create(Nil);
    cdsAnalitico.data := cdsContrPrevs.data;
    cdsAnalitico.First;
    qryAux := Twwquery.Create(Nil);
    //cdsAnalitico.FieldByName('IDLINHA').AsInteger;
    qryAux.DataBaseName := 'BaseDados';
    while not (cdsAnalitico.Eof) do
      begin
        sSql := '';
        sSql := 'SELECT D.IDLINHA, D.VALOR_DEBITO - NVL(C.VALOR_CREDITO,0) AS TOTAL ';
        sSql := sSql + '  FROM (SELECT SUM(L.LACVALOR) VALOR_DEBITO, LX.IDLINHA ';
        sSql := sSql + '          FROM LANCAMENTO          L, ';
        sSql := sSql + '               PLANILHA            P, ';
        sSql := sSql + '               (SELECT L.IDLINHA, L.PLANO, PLATIPO, P.PLACONTA ';
        sSql := sSql + '                FROM   LINHAXCONTACONTABIL L, PLANOCONTA P ';
        sSql := sSql + '                WHERE  TRIM(L.PLACONTA) = SUBSTR(TRIM(P.PLACONTA),1,LENGTH(TRIM(L.PLACONTA))) ';
        sSql := sSql + '                AND    L.PLANO = P.PLANO) LX, ';
        sSql := sSql + '               LINHA_RELATORIO     LR, ';
        sSql := sSql + '               TIPODECATEGORIA     T ';
        sSql := sSql + '         WHERE L.PLNCODIGO = P.PLNCODIGO ';
        sSql := sSql + '           AND TRIM(L.PLACONTA) = TRIM(LX.PLACONTA) ';
        sSql := sSql + '           AND L.PLANO = LX.PLANO ';
        sSql := sSql + '           AND LX.IDLINHA = LR.IDLINHA ';
        sSql := sSql + '           AND L.LACDEBCRE = ''D'' ';
        sSql := sSql + '           AND TO_CHAR(P.PLNDATDIA, ''MM/YYYY'') = '  + sMesAno;
        sSql := sSql + '           AND UPPER(L.LACHIST1) NOT LIKE ''ENCERRAMENTO DE BALANÇO%'' ';
        sSql := sSql + '           AND LR.IDTIPODECATEGORIA = T.IDTIPODECATEGORIA ';
        sSql := sSql + '           AND T.IDTIPODECATEGORIA = 4 ';
        sSql := sSql + '           AND LR.IDLINHA = ' + IntToStr(cdsAnalitico.FieldByName('IDLINHA').AsInteger);
        sSql := sSql + '         GROUP BY LX.IDLINHA) D, ';
        sSql := sSql + '       (SELECT SUM(L.LACVALOR) VALOR_CREDITO, LX.IDLINHA ';
        sSql := sSql + '          FROM LANCAMENTO          L, ';
        sSql := sSql + '               PLANILHA            P, ';
        sSql := sSql + '               (SELECT L.IDLINHA, L.PLANO, PLATIPO, P.PLACONTA ';
        sSql := sSql + '                FROM   LINHAXCONTACONTABIL L, PLANOCONTA P ';
        sSql := sSql + '                WHERE  TRIM(L.PLACONTA) = SUBSTR(TRIM(P.PLACONTA),1,LENGTH(TRIM(L.PLACONTA))) ';
        sSql := sSql + '                AND    L.PLANO = P.PLANO) LX, ';
        sSql := sSql + '               LINHA_RELATORIO     LR, ';
        sSql := sSql + '               TIPODECATEGORIA     T ';
        sSql := sSql + '         WHERE L.PLNCODIGO = P.PLNCODIGO ';
        sSql := sSql + '           AND TRIM(L.PLACONTA) = TRIM(LX.PLACONTA) ';
        sSql := sSql + '           AND L.PLANO = LX.PLANO ';
        sSql := sSql + '           AND LX.IDLINHA = LR.IDLINHA ';
        sSql := sSql + '           AND L.LACDEBCRE = ''C'' ';
        sSql := sSql + '           AND TO_CHAR(P.PLNDATDIA, ''MM/YYYY'') = '  + sMesAno;
        sSql := sSql + '           AND UPPER(L.LACHIST1) NOT LIKE ''ENCERRAMENTO DE BALANÇO%'' ';
        sSql := sSql + '           AND LR.IDTIPODECATEGORIA = T.IDTIPODECATEGORIA ';
        sSql := sSql + '           AND T.IDTIPODECATEGORIA = 4 ';
        sSql := sSql + '           AND LR.IDLINHA = ' + IntToStr(cdsAnalitico.FieldByName('IDLINHA').AsInteger);
        sSql := sSql + '         GROUP BY LX.IDLINHA) C ';
        sSql := sSql + 'WHERE D.IDLINHA = C.IDLINHA (+) ';

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        qryAux.Open;
        if not qryAux.Eof Then  //while not qryAux.Eof do
          begin
            fValorLc := qryAux.FieldByName('TOTAL').AsFloat; //qryAux.Next;
          end
          else // SOL 209775 e SOL 233732
             fValorLc := 0; // SOL 209775 e SOL 233732

        fValorBd := cdsAnalitico.FieldByName('TOTAL').AsFloat;
        fValorNw := fValorBd + fValorLc;
        cdsAnalitico.Edit;
        cdsAnalitico.FieldByName('TOTAL').AsFloat := fValorNw;
        cdsAnalitico.Post;
        cdsAnalitico.Next;
      end;
      Result := cdsAnalitico.data;
      freeandnil(qryAux);
      freeandnil(cdsAnalitico);
  Except
    On E: Exception Do
      begin
        //result := false;
        freeandnil(qryAux);
        freeandnil(cdsAnalitico);
      end;
  End;

end;


function tCtrlDaconMT.PreparaRendimentosArqEDI(iNroRecibo : Integer) : OleVariant;
Var
  sSql : String;
Begin
  sSql := '';
  sSql := sSql + ' SELECT  ';
  sSql := sSql + ' R.IDSEQ IDSEQ, R.ANO ANO, R.CPF CPF, R.NOME NOME, R.CARGO CARGO,  ';
  sSql := sSql + ' R.IRRF IRRF, R.RENDIMENTO RENDIMENTO, R.CODQUALIRF  CODQUALIRF ';
  sSql := sSql + ' FROM   ';
  sSql := sSql + ' RENDIMENTOS_DIPJ_TEMP R ';
  sSql := sSql + ' WHERE   ';
  sSql := sSql + ' R.IDRECIBO = ' + IntToStr(iNroRecibo) + ' ';
  sSql := sSql + ' ORDER BY  R.NOME ';
  Result := GetDataPacket(sSql);
end;


function tCtrlDaconMT.LimpaRendimentosArqEDI(iNroRecibo : Integer) : Boolean;
var
  qryAux  : Twwquery;
begin
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' DELETE FROM RENDIMENTOS_DIPJ_TEMP ');
    qryAux.SQL.Add(' WHERE IDRECIBO = :IDRECIBO ');
    qryAux.ParamByName('IDRECIBO').AsInteger  := iNroRecibo;
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;

end;


function tCtrlDaconMT.GravaTabTem(idNroRecibo, idseq, codqualirf : Integer; ano, cpf, nome, cargo : String; irrf, rendimento : Real) : Boolean;
var
  qryAux  : Twwquery;
begin
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' INSERT INTO RENDIMENTOS_DIPJ_TEMP  ');
    qryAux.SQL.Add(' ( IDSEQ, IDRECIBO, ANO, CPF, NOME, CARGO, ');
    qryAux.SQL.Add(' IRRF, RENDIMENTO, CODQUALIRF ) ');
    qryAux.SQL.Add(' VALUES ');
    qryAux.SQL.Add(' ( :IDSEQ, :IDRECIBO,  :ANO, :CPF, :NOME, :CARGO, ');
    qryAux.SQL.Add(' :IRRF, :RENDIMENTO, :CODQUALIRF ) ');
    qryAux.ParamByName('IDSEQ').AsInteger       := idseq;
    qryAux.ParamByName('IDRECIBO').AsInteger    := idNroRecibo;
    qryAux.ParamByName('ANO').AsString          := ano;
    qryAux.ParamByName('CPF').AsString          := cpf;
    qryAux.ParamByName('NOME').AsString         := nome;
    qryAux.ParamByName('CARGO').AsString        := cargo;
    qryAux.ParamByName('IRRF').AsCurrency       := irrf;
    qryAux.ParamByName('RENDIMENTO').AsCurrency := rendimento;
    qryAux.ParamByName('CODQUALIRF').AsInteger  := codqualirf;
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;

end;


End.


