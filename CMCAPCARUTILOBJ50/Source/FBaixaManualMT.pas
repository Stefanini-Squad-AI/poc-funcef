//***************************************************************************************
{ ------------------------------------------------------------------------------
Rotina......: .dfm, SqlPendentes
Nº ATENDER..: WO13938
Data........: 22/08/2024
Responsável.: Leandro Pocebon
Descrição...: Inclusão da coluna Cod.Dossie e Alterado nome coluna Numero AP paa Numero AR
--------------------------------------------------------------------------------------------------
//Rotina                : trlBaixaIntBanco.MontaGrid, SbtnAbrirArquivoRetClick, ProcessaBaixaManual
//N. Sol..........      : 214738_15892
//N. Kintana......      : 2057238
//Data da Alteração:    : 14/03/2014
//Alteração Form:       : FBaixaIntBancoMT
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão do Parametro p/ indicar se a barra de progresso será apresentada ou não
//                        Alteração na ProcessaBaixaManual p/ incluir o valor zero na datalancamento
{ ------------------------------------------------------------------------------
Nº SOL......: WO7735
Data........: 07/02/2024
Responsável.: Luis Ferrari
Descrição...: Retirar as colunas: COMPL, TIPO e VALOR OM e acrescentado as colunas número da AP e Contas/Caixas  x Forma de Pag
--------------------------------------------------------------------------------------------------
Nº SOL......: 220237
Nº KINTANA..: 2052443
Data........: 14/11/2013
Responsável.: //MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443
Descrição...: FDO
--------------------------------------------------------------------------------------------------
Rotina............: .dfm, ActParcialExecute
N. Sol............: 124845-14262
N. Kintana........: 1977287
Data..............: 23/05/2013
Responsável.......: Edilaine Ferraresi
Descrição.........: Ajuste da rotina de arredondamento para diferença de centavos
********************************************************
Rotina..........: bbtnConfirmarClick
N. Sol..........: 123366/10522
N. Kintana......: 1726805
Data............: 09/07/2012
Responsável.....: Helen V. Bianchi
Descrição.......: Alterado a regra Dt de Baixa p/ Doc Filho PGA
********************************************************
Rotina..........: bbtnConfirmarClick
N. Sol..........: 126261/1121
N. Kintana......: 760963
Data............: 10/01/2012
Responsável.....: Helen V. Bianchi
Descrição.......: SqlDocsFilhoPag e SqlDocsFilhoRec Add o Field -  DATADISPONIB
********************************************************
Rotina........: bbtnConfirmarClick
N. Sol..........: 130745
N. Kintana......: 735881
Data............: 08/02/2010
Responsável.....: Bruno Bastos
Descrição.......: Passar a data programada dos documentos filhos no lugar da data de baixa.
********************************************************}
{ Rotina........: TFrmBaixaManualMT.ActParcialExecute
N. Sol..........: 109609
N. Kintana......: 498009
Data............: 07/04/2009
Responsável.....: Marilza Colpani
Descrição.......: Não permitir que o total da baixa do documento e/ou documentos
                seja superior ao total do valor do documento e/ou documentos.
********************************************************}
//Alterações
{=======================================================================================
// Autor     : Marcus Oliveira
// Data      : 12/04/2007
// Pendência : 24823
// Descrição : Ativa o portadorconta na query SqlPortadorForma
//------------------------------------------------------------------------------
// Autor     : Marcus Oliveira
// Data      : 07/03/2007
// Pendência : 24309
// Descrição : Criado o campo observação para o contas a pagar.
//------------------------------------------------------------------------------
// Autor     : André Tavares
// Data      : 21/11/2006
// Pendência : 22486
// Descrição : Alterei vários SQLs que listam portadorforma para filtrar pelo flag FLGENCCONTAS
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Autor     : Rodolpho da Silva
// Data      : 07/07/2005
// Pendência : 19589
// Descrição : Não permitir que a data da disponibilidade
//             seja menor que a data do recebimento
//------------------------------------------------------------------------------
// Rotina    : bbtnPgtoClick
// Data      : 01/07/04 (término)
// Autor     : David Ayrolla
// Pendência : 14646
// Descrição : Só permitir pagamento de documentos aprovados pelo RAD.
//------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 15/01/2004
Autor     : Fabio Fagundes
Pendência :
Descrição : Corrigida passagem do Parâmetro da data de Disponibilidade quando CAP
            if _CtrlFinanc.IntegraDispFinanc Then
               dDataDisp := CmpDadosParaBaixaCAP.ParamValues[2].AsDateTime;
---------------------------------------------------------------------------------------------------}

// Alterações
// André Tavares - 11/12/2003 - pendência 15680: comentei o código que limpa o grid
//
{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 28/07/2003
Autor     : André Pontes
Pendência : 14663
Descrição : Corrigida passagem da data para CFinan (estava "Date")
            dDataDifer := CmpDadosParaBaixaCAR.ParamValues[3].AsDateTime;
---------------------------------------------------------------------------------------------------}

{//  FDias - 16.10.2003 - acerto na data com float na baixa}

{ 03/07 by alex - reabertura da pend 12295 -
  para regularizar é obrigatório que o portador forma lance no financeiro }

{ 30/06/2003 - By Alex - Pend: 12295
Regularizar automaticamente doc não identificado
}

{ --------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 24/11/2003
Autor     : Alex Pereira
Pendência : 15678
Descrição : Contabilização caindo na conta de não identificado
            Necessário atribuir o parâmetro iCodLancNaoIdent, estava vindo com lixo
---------------------------------------------------------------------------------------------------}



{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ -  Baixa Manual de Títulos                            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 16/09/2002                             }
{                                                       }
{*******************************************************}



unit FBaixaManualMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fSairAjuda, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams, ImgList,
  CmParamReport, ActnList, MontaSelect, uCtrlDocumento, Menus, uCtrlBaixaDocumentos,
  uCtrlBaixaRecXPag, //Bruno Bastos - Sol 126261
  DBTables, Wwquery, uCtrlFinanc,uCMTypes;


type
  TFrmBaixaManualMT = class(TfrmOkCancelar)
    PnlDocSel: TPanel;
    Pnldocpago: TPanel;
    Panel8: TPanel;
    Pnldocpendentes: TPanel;
    GrdPendentes: TwwDBGrid;
    Panel4: TPanel;
    BtnTotal: TBitBtn;
    BtnParcial: TBitBtn;
    BtnSaldo: TBitBtn;
    Splitter1: TSplitter;
    SqlPendentes: TCMSqlParams;
    SqlSelecionados: TCMSqlParams;
    DsPendentes: TwwDataSource;
    DsSelecionados: TwwDataSource;
    CdsPendentes: TCMClientDataSet;
    CdsSelecionados: TCMClientDataSet;
    ImlBaixa: TImageList;
    BtnExcluir: TBitBtn;
    CmpBaixa: TCmParamReport;
    SqlPortadorForma: TCMSqlParams;
    SqlFormaRecPag: TCMSqlParams;
    SqlTipoDocRecPag: TCMSqlParams;
    SqlDocVazio: TCMSqlParams;
    ActBaixaManual: TActionList;
    ActProcurar: TAction;
    CmpDadosParaBaixaCAR: TCmParamReport;
    MsDoc: TMontaSelect;
    BtnSelecionar: TBitBtn;
    MenuPendentes: TPopupMenu;
    BaixaValorTotal1: TMenuItem;
    BaixaValorParcial1: TMenuItem;
    AlteraoSaldodoDocumento1: TMenuItem;
    N1: TMenuItem;
    Procurar1: TMenuItem;
    ActTotal: TAction;
    ActParcial: TAction;
    ActSaldo: TAction;
    ActExcluir: TAction;
    CdsUmPortadorForma: TCMClientDataSet;
    SQLUmPortadorForma: TCMSqlParams;
    CmpDadosParaBaixaCAP: TCmParamReport;
    wwQuery1: TwwQuery;
    wwDataSource1: TwwDataSource;
    wwQuery1IDFORCLI: TFloatField;
    wwQuery1OPERACAO: TStringField;
    wwQuery1CODTIPDOC: TFloatField;
    wwQuery1IDPESSOA: TFloatField;
    wwQuery1CODDOCUMENTO: TFloatField;
    wwQuery1NODOCUMENTO: TFloatField;
    wwQuery1COMPLDOCUMENTO: TStringField;
    wwQuery1DATAPROGRAMADA: TDateTimeField;
    wwQuery1DATAVENCTO: TDateTimeField;
    wwQuery1RECPAG: TStringField;
    wwQuery1NOME: TStringField;
    wwQuery1STATUS: TStringField;
    wwQuery1MOECODIGO: TFloatField;
    wwQuery1PLANO: TFloatField;
    wwQuery1PLACONTA: TStringField;
    wwQuery1CODSUBCONTA: TFloatField;
    wwQuery1CODCENTROCUSTO: TStringField;
    wwQuery1CODGRUPOCNAB: TFloatField;
    wwQuery1NOSSONUMERO: TStringField;
    wwQuery1NUMLANCTO: TFloatField;
    wwQuery1DATALANCTO: TDateTimeField;
    wwQuery1VLRLIQUIDO: TFloatField;
    wwQuery1VALOR: TFloatField;
    wwQuery1VALOROUTRAMOEDA: TFloatField;
    wwQuery1DEBCRE: TStringField;
    wwQuery1SITUACAO: TFloatField;
    wwQuery1STATUSVALOR: TFloatField;
    wwQuery1TIPO: TStringField;
    GrdSelecionados: TwwDBGrid;
    CmpDadosParaBaixa: TCmParamReport;
    sqlPlanoPrev: TCMSqlParams;
    cdsPlanoPrev: TCMClientDataSet;
    cdsConsultaPortador: TCMClientDataSet;
    SqlDocsFilhoPag: TCMSqlParams;
    SqlDocsFilhoRec: TCMSqlParams;
    CdsDocsFilhoPag: TCMClientDataSet;
    CdsDocsFilhoRec: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure ActBaixaManualUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure CdsPendentesAfterOpen(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActSaldoExecute(Sender: TObject);
    procedure ActParcialExecute(Sender: TObject);
    procedure ActTotalExecute(Sender: TObject);
    procedure ActProcurarExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
    procedure CdsSelecionadosBeforePost(DataSet: TDataSet);
    procedure GrdPendentesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure GrdSelecionadosTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure GrdSelecionadosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
     iordem   : integer;
    _Documento: TCtrlDocumento;
    _BaixaDocumentos: TCtrlBaixaDocumentos;

    //Bruno Bastos - Sol 126261 - Início
    BaixaRecXPag       : TCtrlBaixaRecXPag;
    //Bruno Bastos - Sol 126261 - Fim

    _CtrlFinanc : TCtrlFinanc;
    procedure LimpaSelecao;
    procedure MontaSQLDocPendentes;
    procedure MoveRegistrosGrid(GrdOrigem, GrdDestino: TwwDbGrid);
    function  RegLancFinanc(rValorLanc :Real; iCodPortador :LongInt):Integer;
    procedure GetParams;
  public
    { Public declarations }
     rValue: Double;  //Marilza Colpani 07/04/2009 N.Sol 109609/N.Kintana 498009
     sListaDocFilho: String; //Bruno Bastos - Sol 126261 - 16/12/2009
  end;

var
  FrmBaixaManualMT: TFrmBaixaManualMT;

implementation

Uses uCtrlParamIntegra, uSistema, CMProcuraSubTipo, uFuncaoGeral,
     uModulo, uCMDialogs, uFormManager, fLancAlteradoresMT, uDataBase, JclMath,
     uCtrlPadroes, fRegLancFiancMT, fParamGeraLote, FValorBaixaParcial;

{$R *.DFM}

procedure TFrmBaixaManualMT.FormCreate(Sender: TObject);
Var
  ParamCapCar: TCollectionItem;

begin
  inherited;
  _Documento := TCtrlDocumento.Create;
  _Documento.InitiAlizeAs(Padroes);

  _BaixaDocumentos := TCtrlBaixaDocumentos.Create;
  _BaixaDocumentos.InitiAlizeAs(Padroes);

  _CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,True);
  _CtrlFInanc.InitiAlizeAs(Padroes);

  //Bruno Bastos - Sol 126261 - Início
  BaixaRecXPag := TCtrlBaixaRecXPag.Create;
  BaixaRecXPag.InitializeAs(ParamIntegra);
  //Bruno Bastos - Sol 126261 - Fim

  MsDoc.Filtro.Add('DOCUMENTO.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));
  If ParamIntegra.RecPag = 'P' Then
  Begin
     CmpBaixa.ParamValues[1].Caption := 'Fornecedor';
     CmpBaixa.ParamValues[1].ProcuraFCSettings.ForCli := fcFornecedor;

     CmpBaixa.ParamValues[2].Caption := 'Contas Caixas X Formas de Pagto.';
     CmpBaixa.ParamValues[3].Caption := 'Formas de Pagamento';

     CmpDadosParaBaixaCAR.ParamValues[0].Caption := CmpBaixa.ParamValues[2].Caption;
     CmpDadosParaBaixaCAR.ParamValues[1].Caption := 'Nº Cheque\Borderô';
     CmpDadosParaBaixaCAP.ParamValues[0].Caption := CmpBaixa.ParamValues[2].Caption;
     CmpDadosParaBaixaCAP.ParamValues[1].Caption := 'Nº Cheque\Borderô';


     ParamCapCar := CmpBaixa.Params.Add;
     TCMParamsItem(ParamCapCar).Caption := 'Lista Doc´s tipo CPMF';
     TCMParamsItem(ParamCapCar).Controle := tcCheckBox;
     TCMParamsItem(ParamCapCar).TipodeDado := tdBoolean;
     TCMParamsItem(ParamCapCar).CheckBoxSetings.Checked := False;
  End
  Else
  Begin
     MsDoc.Colunas.Add('DOCUMENTO.NOSSONUMERO');
     MsDoc.Larguras.Add('20');
     MsDoc.Mascaras.Add('');
     MsDoc.Descricao.Add('Nosso Número');
     MsDoc.TipoDeDado.Add('C');
     MsDoc.SensivelACaixa.Add('S');

     CmpBaixa.ParamValues[1].Caption := 'Cliente';
     CmpBaixa.ParamValues[1].ProcuraFCSettings.ForCli := fcCliente;

     CmpBaixa.ParamValues[2].Caption := 'Contas Caixas X Tipos de Cobr.';
     CmpBaixa.ParamValues[3].Caption := 'Tipos de Cobrança';

     CmpDadosParaBaixaCAR.ParamValues[0].Caption := CmpBaixa.ParamValues[2].Caption;
     CmpDadosParaBaixaCAR.ParamValues[1].Caption := 'Nº Lote de Recebimento';
     CmpDadosParaBaixaCAP.ParamValues[0].Caption := CmpBaixa.ParamValues[2].Caption;
     CmpDadosParaBaixaCAP.ParamValues[1].Caption := 'Nº Lote de Recebimento';

     ParamCapCar := CmpBaixa.Params.Add;
     TCMParamsItem(ParamCapCar).Caption := 'Grupo CNAB';
     TCMParamsItem(ParamCapCar).Controle := tcEdit;
     TCMParamsItem(ParamCapCar).TipodeDado := tdInteger;
  End;

  SqlPortadorForma.Prepare;
  SqlPortadorForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlPortadorForma.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  SqlFormaRecPag.Prepare;
  SqlFormaRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlFormaRecPag.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  SqlTipoDocRecPag.Prepare;
  SqlTipoDocRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlTipoDocRecPag.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;

  CmpBaixa.ParamValues[2].LookupSettings.SQL.Text := SqlPortadorForma.SQLChanged;
  CmpBaixa.ParamValues[3].LookupSettings.SQL.Text := SqlFormaRecPag.SQLChanged;
  CmpBaixa.ParamValues[4].LookupSettings.SQL.Text := SqlTipoDocRecPag.SQLChanged;

  CmpDadosParaBaixaCAR.ParamValues[0].LookupSettings.SQL.Text := SqlPortadorForma.SQLChanged;
  CmpDadosParaBaixaCAP.ParamValues[0].LookupSettings.SQL.Text := SqlPortadorForma.SQLChanged;

  LimpaSelecao;


// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30032;
    bbtnAjuda.HelpContext := 30032;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

Procedure TFrmBaixaManualMT.MontaSQLDocPendentes;
Var
   rDifDocumento: Double;
Begin
   CdsPendentes.DisableControls;
   CdsSelecionados.DisableControls;
   Try

     With SqlPendentes, SQL Do
     Begin
        Clear;

        Add(' SELECT ');
        Add('     DECODE(NVL(D.FLGCONTAINVEST,0),0,''Velho'',''Novo'') AS TIPO, ');
        Add('     D.IDFORCLI, ');
        Add('     D.CODPORTFORMA, ');
        Add('     D.OPERACAO, ');
        Add('     D.CODTIPDOC, ');
        Add('     D.IDPESSOA, ');
        Add('     D.CODDOCUMENTO, ');
        Add('     D.NODOCUMENTO, ');
        Add('     D.COMPLDOCUMENTO, ');
        Add('     D.DATAPROGRAMADA, ');
        Add('     D.DATAVENCTO, ');
        Add('     D.RECPAG,');
        Add('     D.IDMODULO,');
        Add(FuncaoGeral.Decode(CmpDadosParaBaixa.ParamValues[18].AsInteger,1,'P.NOME,','P.RAZAOSOCIAL AS NOME,'));
        Add('     D.NUMAPGR, ');         // WO7735 Ferrari
        Add('     D.CODDOSSIE , ');         // WO13938 Leandro
        Add('     D.STATUS, ');
        Add('     D.MOECODIGO, ');
        Add('     D.PLANO, ');
        Add('     D.PLACONTA, ');
        Add('     D.CODSUBCONTA, ');
        Add('     D.CODCENTROCUSTO, ');
        Add('     D.CODGRUPOCNAB, ');
        Add('     D.NOSSONUMERO, ');
        Add('     L.NUMLANCTO, ');
        Add('     PO.DESCRICAO, ');       // WO7735 Ferrari
        Add('     L.DATALANCTO, ');
        Add('     S.SALDO AS VLRLIQUIDO, ');
        Add('     S.SALDO AS VALOR, ');
        Add('     S.SALDOOM AS VALOROUTRAMOEDA, ');
        Add('     L.DEBCRE,');
        Add('     DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO, ');
        Add('     ''S'' AS  FLGBAIXATOTAL, ');         // Edilaine - SOL 124845-14262 / KTN 1977287
        Add('     2 AS STATUSVALOR, ');
        Add(' ''             '' AS IDPLANOPREV, ');//MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443
        Add(' ''                                                                                                                                                                                                            '' AS PLANOPREV ');
        Add(' FROM ');
        Add('     PESSOA P, ');
        Add('     DOCUMENTO D, ');
        Add('     LANCTODOCUM L, ');
        Add('     PORTADORFORMA PO, ');           // WO7735 Ferrari
        Add('    (SELECT D.CODDOCUMENTO, ');
        Add('       SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR),DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))) AS SALDO, ');
        Add('       SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA),DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM ');
        Add('     FROM LANCTODOCUM L,DOCUMENTO D ');
        Add('     WHERE ');
        Add('       (D.CODDOCUMENTO = L.CODDOCUMENTO) ');

        //andre tavares - pendência 21601
        if ( trim (CmpDadosParaBaixa.ParamValues[ 14 ].AsString) <> '' )  then
          Add(' AND D.CODDOCUMENTO IN (SELECT DISTINCT CODDOCUMENTO FROM RATEIODOCUM WHERE IDPLANOPREV IN ('+ trim (CmpDadosParaBaixa.ParamValues[ 14 ].AsString) +') ) ');

        Add('        AND (D.RECPAG = :RECPAG) ');
        Add('        AND (D.IDPESSOA = :IDPESSOA) ');

        if trim(CmpDadosParaBaixa.paramValues[1].asString) <> '' then
           Add(' AND (D.IDFORCLI = :IDFORCLI) ');

        if trim(CmpDadosParaBaixa.paramValues[0].asString) <> '' then
          Add(' AND (D.CODPORTFORMA = :CODPORTFORMA) ');

        if trim(CmpDadosParaBaixa.paramValues[4].asString) <> '' then
          Add(' AND (D.CODFORMA = :CODFORMA) ');

        if CmpDadosParaBaixa.paramValues[5].value <> '' then
          Add(' AND (D.CODTIPDOC = :CODTIPDOC) ');

        if trim(CmpDadosParaBaixa.paramValues[6].asString) <> '' then
          Add(' AND (D.IDMODULO = :IDMODULO) ');

        if (trim(CmpDadosParaBaixa.paramValues[7].asString) <> '') then
          Add(' AND (D.DATAPROGRAMADA >= :DATAPROGINICIAL ) ');

        if (trim(CmpDadosParaBaixa.paramValues[8].asString) <> '') then
          Add(' AND (D.DATAPROGRAMADA <= :DATAPROGFINAL ) ');

        if trim(CmpDadosParaBaixa.paramValues[16].asString) <> '' then
          Add(' AND (D.CODDOCUMENTO = :CODDOCUMENTO) ');

        if not CmpDadosParaBaixa.paramValues[13].asBoolean then
        Begin
           If (ParamIntegra.RecPag = 'P') Then
               Add(' AND (D.CODTIPDOC <> :CODTIPDOCCPMF) ')
        End;


        Add('     GROUP BY D.CODDOCUMENTO) S ');

        Add(' WHERE ');

        Add('     (D.CODDOCUMENTO = S.CODDOCUMENTO) AND ');

        if ( trim (CmpDadosParaBaixa.ParamValues[ 14 ].AsString) <> '' )  then
          Add(' D.CODDOCUMENTO IN (SELECT DISTINCT CODDOCUMENTO FROM RATEIODOCUM WHERE IDPLANOPREV IN ('+ trim (CmpDadosParaBaixa.ParamValues[ 14 ].AsString) +') ) AND ');

        Add('     (D.RECPAG = :RECPAG) AND ');
        //Filtro de acordo com autorização de Usuário por tipo de documento
        Add('     (D.CODTIPDOC IN');
        Add('      (');
        Add('       SELECT');
        Add('         CODTIPDOC');
        Add('       FROM');
        Add('         TIPODOCRECPAG A');
        Add('       WHERE');
        Add('         A.RECPAG = :RECPAG AND');
        Add('         NOT EXISTS');
        Add('             (SELECT');
        Add('                *');
        Add('              FROM');
        Add('                USUARIOXTPDOCTO B');
        Add('              WHERE');
        Add('                 RECPAG = :RECPAG AND');
        Add('                 B.IDUSUARIO = :IDUSUARIO)');
        Add('       UNION');
        Add('       SELECT');
        Add('          CODTIPDOC');
        Add('       FROM');
        Add('          TIPODOCRECPAG A');
        Add('       WHERE');
        Add('          A.RECPAG = RECPAG AND');
        Add('          EXISTS');
        Add('             (SELECT');
        Add('                 *');
        Add('              FROM');
        Add('                 USUARIOXTPDOCTO B');
        Add('              WHERE');
        Add('                  RECPAG = :RECPAG AND');
        Add('                  A.CODTIPDOC = B.CODTIPDOC AND');
        Add('                  B.IDUSUARIO = :IDUSUARIO)');
        Add('      )');
        Add('     ) AND ');
        //Fim Filtro de acordo com autorização de Usuário por tipo de documento
        Add(' (D.OPERACAO = L.OPERACAO) AND ');
        Add(' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND (L.ESTORNO IS NULL) AND ');
        Add(' (D.IDPESSOA = :IDPESSOA ) AND ');
        Add(' (D.STATUS=''0'' OR D.STATUS=''1'' OR (D.STATUS IS  NULL)) AND ');
        Add(' (RTRIM(D.OPERACAO) IN (''2'',''3'',''14'')) AND ');
        Add(' (D.IDFORCLI = P.IDPESSOA) AND ');
        Add(' (PO.CODPORTFORMA (+)= D.CODPORTFORMA) AND ');       // WO7735 Ferrari

        //************************************************
        //      Implementação para FUNCEF - Pendencia 14223
        //************************************************
        //************************************************

        Add(' (D.CODDOCUMENTO !=ALL ');
        Add('    (SELECT ');
        Add('        CODDOCUMENTO ');
        Add('     FROM ');
        Add('        LOTEXDOCUM ');
        Add('     WHERE ');
        Add('        FLGBAIXA IS NULL OR FLGBAIXA = ''N''))');


        if trim(CmpDadosParaBaixa.paramValues[1].asString) <> '' then
           Add(' AND (D.IDFORCLI = :IDFORCLI) ');

        if trim(CmpDadosParaBaixa.paramValues[0].asString) <> '' then
          Add(' AND (D.CODPORTFORMA = :CODPORTFORMA) ');

        if trim(CmpDadosParaBaixa.paramValues[4].asString) <> '' then
          Add(' AND (D.CODFORMA = :CODFORMA) ');

        if CmpDadosParaBaixa.paramValues[5].value <> '' then
          Add(' AND (D.CODTIPDOC = :CODTIPDOC) ');

        if trim(CmpDadosParaBaixa.paramValues[6].asString) <> '' then
          Add(' AND (D.IDMODULO = :IDMODULO) ');

        if (trim(CmpDadosParaBaixa.paramValues[7].asString) <> '') then
          Add(' AND (D.DATAPROGRAMADA >= :DATAPROGINICIAL ) ');

        if (trim(CmpDadosParaBaixa.paramValues[8].asString) <> '') then
          Add(' AND (D.DATAPROGRAMADA <= :DATAPROGFINAL ) ');

        if (trim(CmpDadosParaBaixa.paramValues[15].asString) <> '') then
          Add(' AND (L.DATALANCTO = :DATALANCTO ) ');

        if trim(CmpDadosParaBaixa.paramValues[16].asString) <> '' then
          Add(' AND (D.CODDOCUMENTO = :CODDOCUMENTO) ');

        if (not CmpDadosParaBaixa.paramValues[13].asBoolean) then
        Begin
           If (ParamIntegra.RecPag = 'P') Then
               Add(' AND (D.CODTIPDOC <> :CODTIPDOCCPMF) ')
        End;


        Add(' ORDER BY P.NOME, D.DATAPROGRAMADA, D.NODOCUMENTO ');

        Prepare;
        ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
        ParamByName('RECPAG').AsString    := ParamIntegra.RecPag;

        if trim(CmpDadosParaBaixa.paramValues[1].asString) <> '' then
          ParamByName('IDFORCLI').AsString := CmpDadosParaBaixa.paramValues[1].AsString;

        if trim(CmpDadosParaBaixa.paramValues[0].asString) <> '' then
          ParamByName('CODPORTFORMA').AsString := CmpDadosParaBaixa.paramValues[0].AsString;

        if trim(CmpDadosParaBaixa.paramValues[4].asString) <> '' then
          ParamByName('CODFORMA').AsString := CmpDadosParaBaixa.paramValues[4].AsString;

        if CmpDadosParaBaixa.paramValues[5].value <> '' then
          ParamByName('CODTIPDOC').AsInteger := strToIntDef(CmpDadosParaBaixa.paramValues[5].Value, 0);

        if trim(CmpDadosParaBaixa.paramValues[6].asString) <> '' then
          ParamByName('IDMODULO').AsString := CmpDadosParaBaixa.paramValues[6].AsString;

        if (trim(CmpDadosParaBaixa.paramValues[7].asString) <> '') then
          ParamByName('DATAPROGINICIAL').asDate := trunc(CmpDadosParaBaixa.paramValues[7].asDateTime);

        if (trim(CmpDadosParaBaixa.paramValues[8].asString) <> '') then
          ParamByName('DATAPROGFINAL').asDate := trunc(CmpDadosParaBaixa.paramValues[8].asDateTime);

        if (trim(CmpDadosParaBaixa.paramValues[15].asString) <> '') then
          ParamByName('DATALANCTO').AsDate := trunc(CmpDadosParaBaixa.ParamValues[15].AsDateTime);

        if trim(CmpDadosParaBaixa.paramValues[16].asString) <> '' then
          ParamByName('CODDOCUMENTO').AsInteger := StrToIntDef(CmpDadosParaBaixa.ParamValues[16].AsString, -1);

        if (not CmpDadosParaBaixa.paramValues[13].asBoolean) then
        Begin
           If (ParamIntegra.RecPag = 'P') Then
              ParamByName('CODTIPDOCCPMF').AsInteger := Modulo.CodDocCPMF
        End;

        Open;

//--------------------------- início - André Tavares - pendência 21601 - 15/08/2006
        CdsPendentes.DisableControls;
        CdsPendentes.First;
        while not CdsPendentes.eof do
        begin
          sqlPlanoPrev.Prepare;
          sqlPlanoPrev.ParamByName('CODDOCUMENTO').asInteger := CdsPendentes.FieldByname( 'CODDOCUMENTO' ).asInteger;
          sqlPlanoPrev.Open;
          cdsPlanoPrev.first;
          CdsPendentes.Edit;
          CdsPendentes.fieldByName('PLANOPREV').asString := '';

          while not cdsPlanoPrev.eof do
          begin
            CdsPendentes.Edit;
            if (cdsPlanoPrev.recno > 1) then
            begin
              CdsPendentes.fieldByName('PLANOPREV').asString := CdsPendentes.fieldByName('PLANOPREV').asString + '; '+ cdsPlanoPrev.fieldByName('NOME').asString;
              CdsPendentes.fieldByName('IDPLANOPREV').asString := cdsPlanoPrev.fieldByName('IDPLANOPREV').asString;//MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443
            end
            else
            begin
              CdsPendentes.fieldByName('PLANOPREV').asString := CdsPendentes.fieldByName('PLANOPREV').asString + cdsPlanoPrev.fieldByName('NOME').asString;
              CdsPendentes.fieldByName('IDPLANOPREV').asString := cdsPlanoPrev.fieldByName('IDPLANOPREV').asString;//MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443
            end;
            CdsPendentes.Post;
            cdsPlanoPrev.next;
          end;
          CdsPendentes.Next;
        end;//while
        CdsPendentes.EnableControls;
//--------------------------- fim - André Tavares - pendência 21601 - 15/08/2006


        //Verifica se existem documentos já selecionados para baixa
        If Not CdsSelecionados.IsEmpty Then
        Begin
           CdsPendentes.First;
           While Not CdsPendentes.Eof Do
           Begin
             If CdsSelecionados.Locate('CODDOCUMENTO',VarArrayOf([CdsPendentes.FieldByName('CODDOCUMENTO').AsFloat]),[]) Then
             Begin
                rDifDocumento := CdsPendentes.FieldByName('VALOR').AsFloat - CdsSelecionados.FieldByName('VALOR').AsFloat;

                If IsFloatZero(rDifDocumento) Then
                   CdsPendentes.Delete
                Else
                Begin
                   CdsPendentes.Edit;
                   CdsPendentes.FieldByName('VALOR').AsFloat := rDifDocumento;
                   CdsPendentes.Post;

                   CdsPendentes.Next;
                End;
             End
             Else
                CdsPendentes.Next;
          End;
        End;




     End;

     CdsPendentes.EnableControls;
     CdsSelecionados.EnableControls;
   Except
     CdsPendentes.EnableControls;
     CdsSelecionados.EnableControls;
     Raise;
   End;
End;

procedure TFrmBaixaManualMT.LimpaSelecao;
begin
  CdsPendentes.Data := SqlDocVazio.Data;
  CdsSelecionados.Data := SqlDocVazio.Data;
end;

procedure TFrmBaixaManualMT.ActBaixaManualUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  bbtnConfirmar.Enabled := Not CdsSelecionados.IsEmpty;
  bbtnCancelar.Enabled := bbtnConfirmar.Enabled;
  ActExcluir.Enabled := Not CdsSelecionados.IsEmpty;
  ActTotal.Enabled := Not CdsPendentes.IsEmpty;
  ActParcial.Enabled := ActTotal.Enabled And (GrdPendentes.SelectedList.Count = 1);
  ActSaldo.Enabled := ActParcial.Enabled;
end;

procedure TFrmBaixaManualMT.CdsPendentesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
end;

procedure TFrmBaixaManualMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaSelecao;
end;

procedure TFrmBaixaManualMT.MoveRegistrosGrid(GrdOrigem,
  GrdDestino: TwwDbGrid);
Var
  Y: Integer;

begin
  if (Not GrdOrigem.DataSource.DataSet.IsEmpty) and (GrdOrigem.SelectedList.count > 0) Then
  Begin
    GrdOrigem.DataSource.DataSet.DisableControls;
    GrdDestino.DataSource.DataSet.DisableControls;

    For Y := 0 To GrdOrigem.SelectedList.count - 1 Do
    Begin
       GrdOrigem.DataSource.DataSet.GotoBookmark(GrdOrigem.SelectedList[Y]);

       //Bruno Bastos - Sol 126261 - Início
       if _BaixaDocumentos.DocTemPai(GrdOrigem.DataSource.DataSet.FieldByName('CODDOCUMENTO').AsInteger, 0) then
         continue;
       //Bruno Bastos - Sol 126261 - Fim

       //DAVID - Pendência 14646
       //Verifica se o processo RAD foi autorizado
       if Sistema.UsaRAD Then
       begin
         if not _BaixaDocumentos.ProcessoRadLiberado( GrdOrigem.DataSource.DataSet.FieldByName('CODDOCUMENTO').AsInteger ) then
         begin
           Msgdlg( 'O documento ' + GrdOrigem.DataSource.DataSet.FieldByName('NODOCUMENTO').AsString + ' não está autorizado para esta operação.', 'Aviso', mtinformation, [mbOk], 0 );
           GrdOrigem.DataSource.DataSet.EnableControls;
           GrdDestino.DataSource.DataSet.EnableControls;
           exit;
         end;
       end;

       If GrdDestino.DataSource.DataSet.Locate('CODDOCUMENTO',VarArrayOf([GrdOrigem.DataSource.DataSet.FieldByName('CODDOCUMENTO').AsFloat]),[]) Then
       Begin

          GrdOrigem.DataSource.DataSet.Edit;
          GrdOrigem.DataSource.DataSet.FieldByName('VALOR').AsFloat := GrdOrigem.DataSource.DataSet.FieldByName('VALOR').AsFloat +
                                                                       GrdDestino.DataSource.DataSet.FieldByName('VALOR').AsFloat;
          GrdOrigem.DataSource.DataSet.FieldByName('VALOROUTRAMOEDA').AsFloat := GrdOrigem.DataSource.DataSet.FieldByName('VALOROUTRAMOEDA').AsFloat +
                                                                         GrdDestino.DataSource.DataSet.FieldByName('VALOROUTRAMOEDA').AsFloat;
          GrdOrigem.DataSource.DataSet.Post;


          MoveFields(GrdOrigem.DataSource.DataSet, GrdDestino.DataSource.DataSet, OpAlterar, True);
       End
       Else
          MoveFields(GrdOrigem.DataSource.DataSet, GrdDestino.DataSource.DataSet, OpInserir, True);
    End;

    GrdOrigem.SelectedList.Clear;
    GrdOrigem.DataSource.Dataset.First;
    GrdDestino.DataSource.Dataset.First;

    GrdOrigem.DataSource.DataSet.EnableControls;
    GrdDestino.DataSource.DataSet.EnableControls;

    //Bruno Bastos - 16/12/2009 - Início
    if sListaDocFilho <> '' then
    begin                             
      if pos(',', sListaDocFilho) > 0 then
        MsgDlg( ' Os documentos que não foram inseridos no grid de documentos selecionados são "filhos" de outros documentos.'+#13#10+
                ' Esses documentos serão baixados junto com o documento "pai", se o mesmo foi selecionado.'+#13#10+
                ' Documentos "filhos": '+sListaDocFilho, 'Aviso', mtinformation, [mbOk], 0 )
      else
        MsgDlg(' O documento ' + sListaDocFilho + ' é "filho" de outro. '+#13#10+
               ' Esse documento será baixado junto com o documento "pai", se o mesmo foi selecionado.', 'Aviso', mtinformation, [mbOk], 0);
    end;
    //Bruno Bastos - 16/12/2009 - Fim
  End;
end;

procedure TFrmBaixaManualMT.bbtnConfirmarClick(Sender: TObject);
  //Nilton 21/11/08 - Pendencia: 100730
  Function ValidaObrigatoriedadeObservacao(const pPortador : String) : Boolean;
  var oCds : TwwQuery;
  begin
    oCds := TwwQuery.Create(Nil);
    try
      oCDs.DatabaseName := 'BaseDados';
      oCds.Sql.Add('SELECT FLGOBSERVOBRIGATORIA'+#13#10+
                   'FROM PORTADORFORMA'+#13#10+
                   'WHERE CODPORTFORMA = '+pPortador);
      oCds.Open;
      Result := oCds.FieldByName('FLGOBSERVOBRIGATORIA').asString = 'S';
      oCds.Close;
    finally
      FreeAndNil(oCds);
    end;
  end;

Var
  rValorTotal: Double;
  bDiferido: Boolean;
  dDataDifer, dDataDisp : TDateTime;    // FDias - 29.07.2003 - Pend. 14663
  iCODLANCFINANCnIdent: Integer;
  bDocumentoPPDiferente: Boolean;
  dDataFloat : TDateTime;
  bObrigaObservacao, bObsNaoPreenchido : Boolean;
  dDataDisp_Filho : TDateTime; //Helen - Sol: 126621/1121 - KTN: 760963
begin
  inherited;
  bDocumentoPPDiferente := false;

  CdsSelecionados.DisableControls;

  rValorTotal := 0;
  CdsSelecionados.First;
  While Not CdsSelecionados.Eof Do
  Begin
    rValorTotal := rValorTotal + CdsSelecionados.FieldByName('VALOR').AsFloat;
    If bObrigaObservacao then
      Break;
    CdsSelecionados.Next;
  End;

  CdsSelecionados.First;
  CdsSelecionados.EnableControls;

  // pend 15678 - by Alex
  iCODLANCFINANCnIdent := 0;

  if Sistema.IdModulo = 4 then // CAR
  begin
     CmpDadosParaBaixaCAR.ParamValues[1].TextDefault := IntToStr(_Documento.GetNumChqBordero);
     If Trim(CmpDadosParaBaixaCAR.ParamValues[1].TextDefault) = '-1' Then
        Raise Exception.Create(_Documento.MessageInfo);
     CmpDadosParaBaixaCAR.ParamValues[2].TextDefault := DateToStr(Date);
     CmpDadosParaBaixaCAR.ParamValues[3].TextDefault := DateToStr(Date);
     CmpDadosParaBaixaCAR.ParamValues[4].TextDefault := FloatToStr(rValorTotal);

     If CmpDadosParaBaixaCAR.Execute Then
     Begin

        //Pendência 26948 - Germano N. Souza - 28/11/07
        if length(CmpDadosParaBaixaCAR.ParamValues[1].AsString)>15 then
        begin
          MsgDlg('Código cheque com mais de 15 dígitos. ' + #13 +'Verifique o código digitado.',Sistema.NomeCompleto,mtConfirmation,[mbok],0);
          exit;
        end;

        // Início -  Rodolpho da Silva - P: 19425 - 15/06/2005
        if CmpDadosParaBaixaCAR.ParamValues[2].AsDateTime > date then
        begin
           if MsgDlg('A data informada para a baixa do(s) documento(s) é superior a data atual. ' + #13 +
                      'Deseja continuar?',Sistema.NomeCompleto,mtConfirmation,[mbyes,mbNo],0) = mrNo then
             Exit;
        end;
        // Fim  -  Rodolpho da Silva - P: 19425 - 15/06/2005

        //Inicio - Nilton 26/11/08 - Pendencia: 100730.
        bObsNaoPreenchido:= CmpDadosParaBaixaCAR.ParamValues[5].IsNull;
        bObrigaObservacao := ValidaObrigatoriedadeObservacao(CmpDadosParaBaixaCAR.ParamValues[0].Asstring);
        if ((bObrigaObservacao = True) and (bObsNaoPreenchido = True)) then
        begin
           MsgDlg('O Campo Observação é de preenchimento obrigatório!','Aviso',mtWarning,[mbOk],0);
           Exit;
        end;
        //Fim - Nilton 26/11/08 - Pendencia: 100730.

        // Início -  Rodolpho da Silva - P: 19589 - 07/07/2005
        if ((not CmpDadosParaBaixaCAR.ParamValues[3].IsNull) and (CmpDadosParaBaixaCAR.ParamValues[2].AsDateTime > CmpDadosParaBaixaCAR.ParamValues[3].AsDateTime)) then
        begin
           MsgDlg('A data da disponibilidade não pode ser maior que a data do recebimento!','Aviso',mtWarning,[mbOk],0);
           Exit;
        end;
        // Fim -  Rodolpho da Silva - P: 19589 - 07/07/2005


         // André Pontes - 28/07/2003 - Pendência 14663
        if _CtrlFinanc.IntegraDispFinanc Then        // FDias - 29.07.2003 - Pend. 14663
          dDataDisp := CmpDadosParaBaixaCAR.ParamValues[3].AsDateTime
        else
          dDataDisp := CmpDadosParaBaixaCAR.ParamValues[2].AsDateTime;

         // FIM André Pontes - 28/07/2003 - Pendência 14663

        SQLUmPortadorForma.Prepare;
        SQLUmPortadorForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
        SQLUmPortadorForma.ParamByName('CODPORTFORMA').AsInteger := CmpDadosParaBaixaCAR.ParamValues[0].AsInteger;
        SQLUmPortadorForma.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
        SQLUmPortadorForma.Open;


        //Validação do float
        if CdsUmPortadorForma.FieldByName('DMAIS').AsInteger <= 0 then
          dDataFloat := CmpDadosParaBaixaCAR.ParamValues[2].AsDateTime
        else
          dDataFloat :=_Documento.AjustaDataFloat( CmpDadosParaBaixaCAR.ParamValues[2].AsDateTime,
             CdsUmPortadorForma.FieldByName('DMAIS').AsInteger, slCAR );

        if dDataFloat <> CmpDadosParaBaixaCAR.ParamValues[3].AsDateTime then
          If MsgDlg( 'A data de ''float'' deste documento é diferente da data de disponibilidade informada. Confirma operação assim mesmo?', 'Baixa', mtWarning, [mbYes, mbNo], 0) = mrNo then
            exit;


        bDiferido := (Trim(CdsUmPortadorForma.FieldByName('FLGCHEQUEDIFERIDO').AsString) = 'S');
        if bDiferido then
           InputDate('Data do Diferido', 'Indique a Data do Diferido', dDataDifer)
        else    // FDias - 29.07.2003 - Pend. 14663
           dDataDifer :=  0;

        if not _CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,
                                           CmpDadosParaBaixaCAR.ParamValues[3].AsDateTime) then
        begin
           // Rodolpho da Silva - P: 19904 - 07/03/2006
           MsgDlg(_CtrlFinanc.MessageInfo, Caption, mtWarning, [mbOk], 0);
           Exit;
        end;

        { 03/07 by alex - reabertura da pend 12295 -
          para regularizar é obrigatório que o portador forma lance no financeiro }
        if CdsUmPortadorForma.FieldByName('LANCAFINANC').AsString = 'S' then begin
          {30/03/03 by alex pend 12295}
          iCODLANCFINANCnIdent := RegLancFinanc(ABS(rValorTotal),
                 CdsUmPortadorForma.FieldByName('CODPORTADOR').AsInteger);
          {fim 30/03/03 by alex pend 12295}
        end;
        //Marcus  22240 P.09/10/2006  Passando parametro 5

        //Bruno Bastos - Sol 126261 - Início
        //Bruno Bastos - Sol 129418 - Início
        if (not cdsDocsFilhoPag.IsEmpty) and (not cdsDocsFilhoRec.IsEmpty) then
        begin
        //Bruno Bastos - Sol 129418 - Fim
          //Bruno Bastos - Sol: 130745 - Kintana: 735881 - if not BaixaRecXPag.FazRecxPagto(CmpDadosParaBaixaCAP.ParamValues[2].AsDateTime, cdsDocsFilhoPag.data, cdsDocsFilhoRec.data) then
          //Helen - Sol: 126621/1121 - if not BaixaRecXPag.FazRecxPagto(cdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsDateTime, cdsDocsFilhoPag.data, cdsDocsFilhoRec.data) then //Bruno Bastos - Sol: 130745 - Kintana: 735881
          if (dDataDisp  > cdsDocsFilhoRec.FieldByName('DATAVENCTO').AsDateTime ) then
              dDataDisp_Filho := dDataDisp
          else
              //Helen - SOL: 123366/10522 KTN: 1726805 - Inicio
              //dDataDisp_Filho := dDataDisp;
              dDataDisp_Filho   := cdsDocsFilhoRec.FieldByName('DATADISPONIB').AsDateTime;
              //Helen - SOL: 123366/10522 KTN: 1726805 - Fim
          if not  BaixaRecXPag.FazRecxPagto(dDataDisp,cdsDocsFilhoPag.data, cdsDocsFilhoRec.data,dDataDisp_Filho) then //Helen - Sol: 126621/1121
          begin
            MsgDlg(BaixaRecXPag.MessageInfo, 'Informação', mtInformation, [mbOk], 0);
            exit;
          End;
        end; //Bruno Bastos - Sol 129418
        //Bruno Bastos - Sol 126261 - Fim

        If _BaixaDocumentos.ProcessaBaixaManual(Modulo.ControlaEmisCheque, CmpDadosParaBaixaCAR.ParamValues[0].AsInteger,
             strtofloat(CmpDadosParaBaixaCAR.ParamValues[1].AsString), CdsSelecionados.Data,  0, {Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014}
             CmpDadosParaBaixaCAR.ParamValues[2].AsDateTime,
             TSistemaLancto(Sistema.IdModulo - 3), Modulo.LancaBaixaFloat, Sistema.IdUsuario, Sistema.IdEmpresa,
             Sistema.IdEspAcesso, ParamIntegra.Plano,  Sistema.UsaPlanoPatro, ParamIntegra.IntegraContab, ParamIntegra.PartidaDobrada,
             True, 0, 0, -1, True,

             dDataDifer, iCODLANCFINANCnIdent, dDataDisp, false, FALSE, false, CmpDadosParaBaixa.ParamValues[5].AsString
                                                                     + ' - ' + CmpDadosParaBaixaCAR.ParamValues[5].AsString ) then    // FDias - 29.07.2003 - Pend. 14663 (inclusão de dDataDisp)
          begin
            MsgDlg('Documentos baixado(s) com sucesso', Caption, mtInformation, [mbOk], 0);
            CdsSelecionados.Data := SqlDocVazio.Data;
          end
          else
            MsgDlg(_BaixaDocumentos.MessageInfo,'Atenção',mtError, [mbOk], 0);

     End;
  end;

  if Sistema.IdModulo = 3 then // CAP
  begin
     CmpDadosParaBaixaCAP.ParamValues[1].TextDefault := IntToStr(_Documento.GetNumChqBordero);
     If Trim(CmpDadosParaBaixaCAP.ParamValues[1].TextDefault) = '-1' Then
        Raise Exception.Create(_Documento.MessageInfo);
     CmpDadosParaBaixaCAP.ParamValues[2].TextDefault := DateToStr(Date);
     CmpDadosParaBaixaCAP.ParamValues[3].TextDefault := FloatToStr(rValorTotal);

     If CmpDadosParaBaixaCAP.Execute Then
     Begin

        //Pendência 26948 - Germano N. Souza - 28/11/07
        if length(CmpDadosParaBaixaCAP.ParamValues[1].AsString)>15 then
        begin
          MsgDlg('Código cheque com mais de 15 dígitos. ' + #13 +'Verifique o código digitado.',Sistema.NomeCompleto,mtConfirmation,[mbok],0);
          exit;
        end;

        //início - andre tavares - pendencia 21601 - 24/08/2006
        CdsSelecionados.DisableControls;
        try
          CdsSelecionados.First;
          while not CdsSelecionados.Eof do
          begin
            if not _BaixaDocumentos.VerificaPortadorContaXPlano( CdsSelecionados.fieldByName('CODDOCUMENTO').AsInteger,
                                                                 CmpDadosParaBaixaCAP.ParamValues[0].AsInteger ) then
            begin
              CdsSelecionados.Edit;
              CdsSelecionados.FieldByName('FLGPPDIFERENTE').asString := 'S';
              CdsSelecionados.Post;
              bDocumentoPPDiferente := true;
            end;
            CdsSelecionados.next;
          end;
        finally
          CdsSelecionados.EnableControls;
          CdsSelecionados.First;
        end;

        if bDocumentoPPDiferente then
        begin
          Msgdlg('Um ou mais documentos selecionados possuem rateios cujos planos previdenciários'+#13+
                 'contábeis não estão relacionados à Conta Caixa X Forma de Pagamento selecionada.',
                 'Atenção!',mtInformation,[mbOk],0);
          exit;
        end;
        //fim - andre tavares - pendencia 21601 - 24/08/2006


        dDataDifer := Date;
        SQLUmPortadorForma.Prepare;
        SQLUmPortadorForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
        SQLUmPortadorForma.ParamByName('CODPORTFORMA').AsInteger := CmpDadosParaBaixaCAP.ParamValues[0].AsInteger;
        SQLUmPortadorForma.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
        SQLUmPortadorForma.Open;

        bDiferido := (Trim(CdsUmPortadorForma.FieldByName('FLGCHEQUEDIFERIDO').AsString) = 'S');

        if bDiferido then
           InputDate('Data do Diferido', 'Indique a Data do Diferido', dDataDifer )
        else    // FDias - 29.07.2003 - Pend. 14663
           dDataDifer :=  0;  //  FDias - 20.10.2003

        if not _CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,
                                           CmpDadosParaBaixaCAP.ParamValues[2].AsDateTime) then
        begin
           // Rodolpho da Silva - P: 19904 - 07/03/2006
           MsgDlg(_CtrlFinanc.MessageInfo, Caption, mtWarning, [mbOk], 0);
           Exit;
        end;

        // Fabio Fagundes 15/01/2004
        if _CtrlFinanc.IntegraDispFinanc Then
           dDataDisp := CmpDadosParaBaixaCAP.ParamValues[2].AsDateTime;

        //Bruno Bastos - Sol 126261 - Início
        //Bruno Bastos - Sol 129418 - Início
        if (not cdsDocsFilhoPag.IsEmpty) and (not cdsDocsFilhoRec.IsEmpty) then
        begin
        //Bruno Bastos - Sol 129418 - Fim
          //Bruno Bastos - Sol: 130745 - Kintana: 735881 - if not BaixaRecXPag.FazRecxPagto(CmpDadosParaBaixaCAP.ParamValues[2].AsDateTime, cdsDocsFilhoPag.data, cdsDocsFilhoRec.data) then
//Helen - SOL:126261/1121 Inicio     if not BaixaRecXPag.FazRecxPagto(cdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsDateTime, cdsDocsFilhoPag.data, cdsDocsFilhoRec.data) then //Bruno Bastos - Sol: 130745 - Kintana: 735881
          if (dDataDisp > cdsDocsFilhoPag.FieldByName('DATAVENCTO').AsDateTime ) then
              dDataDisp_Filho := dDataDisp
          else
              //Helen - SOL: 123366/10522 KTN: 1726805 - Inicio
              //dDataDisp_Filho := dDataDisp;
              dDataDisp_Filho := cdsDocsFilhoPag.FieldByName('DATADISPONIB').AsDateTime;
              //Helen - SOL: 123366/10522 KTN: 1726805 - Fim
          if not  BaixaRecXPag.FazRecxPagto(dDataDisp,cdsDocsFilhoPag.data, cdsDocsFilhoRec.data,dDataDisp_Filho) then //Helen - Sol: 126621/1121
          begin
            MsgDlg(BaixaRecXPag.MessageInfo, 'Informação', mtInformation, [mbOk], 0);
            exit;
          End;
        end; //Bruno Bastos - Sol 129418
        //Bruno Bastos - Sol 126261 - Fim


        If _BaixaDocumentos.ProcessaBaixaManual(Modulo.ControlaEmisCheque, CmpDadosParaBaixaCAP.ParamValues[0].AsInteger,
           strtofloat(CmpDadosParaBaixaCAP.ParamValues[1].AsString), CdsSelecionados.Data, 0, {Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014}
            CmpDadosParaBaixaCAP.ParamValues[2].AsDateTime,
           TSistemaLancto(Sistema.IdModulo - 3), Modulo.LancaBaixaFloat, Sistema.IdUsuario, Sistema.IdEmpresa,
           Sistema.IdEspAcesso, ParamIntegra.Plano,  Sistema.UsaPlanoPatro, ParamIntegra.IntegraContab, ParamIntegra.PartidaDobrada, True, 0, 0, -1, True,
           dDataDifer, iCODLANCFINANCnIdent, dDataDisp, false, false, false, CmpDadosParaBaixa.ParamValues[5].AsString
                                                                   + ' - ' + CmpDadosParaBaixaCAP.ParamValues[4].AsString ) then
        begin
          MsgDlg('Documentos baixado(s) com sucesso', Caption, mtInformation, [mbOk], 0);
          CdsSelecionados.Data := SqlDocVazio.Data;
        end
        else
          MsgDlg(_BaixaDocumentos.MessageInfo,'Atenção',mtError, [mbOk], 0);
     End;
  end;

end;

procedure TFrmBaixaManualMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //Bruno Bastos - Sol 126261 - Início
  BaixaRecXPag.Free;
  //Bruno Bastos - Sol 126261 - Fim

  _Documento.Free;
  _BaixaDocumentos.Free;
end;

procedure TFrmBaixaManualMT.ActSaldoExecute(Sender: TObject);
begin
  inherited;
   //início - andré tavares - pendência 21647 - 11/04/2006
   _BaixaDocumentos.UpdateEmissBloq(CdsPendentes.FieldByName('CODDOCUMENTO').AsFloat);
   //fim - andré tavares - pendência 21647 - 11/04/2006

  Application.Tag := CdsPendentes.FieldByName('CODDOCUMENTO').AsInteger;
  AbrirFormModal(FrmLancAlteradores, TFrmLancAlteradores);
  If Application.Tag <> 0 Then
  Begin
     CdsPendentes.Edit;
     CdsPendentes.FieldByName('VALOR').AsFloat := CdsPendentes.FieldByName('VALOR').AsFloat + (Application.Tag/100);
     CdsPendentes.Post;
  End;
end;

procedure TFrmBaixaManualMT.ActParcialExecute(Sender: TObject);
Var
//  rValue: Double;
  bInsereDoc : Boolean;
  frmValorBaixaParcial: TfrmValorBaixaParcial;
begin
  inherited;

  CdsPendentes.DisableControls;
  CdsSelecionados.DisableControls;

  //DAVID - Pendência 14646
  //Verifica se o processo RAD foi autorizado
  if Sistema.UsaRAD Then
  begin
   if not _BaixaDocumentos.ProcessoRadLiberado( CdsPendentes.FieldByName('CODDOCUMENTO').AsInteger ) then
   begin
     Msgdlg( 'O documento ' + CdsPendentes.FieldByName('NODOCUMENTO').AsString + ' não está autorizado para geração de lote.', 'Aviso', mtinformation, [mbOk], 0 );
     CdsPendentes.EnableControls;
     CdsSelecionados.EnableControls;
     exit;
   end;
  end;

  rValue := CdsPendentes.FieldByName('VALOR').AsFloat;

  //Marilza Colpani 07/04/2009 N.Sol 109609/N.Kintana 498009
  //Substituído o Imput por um formulário

  if not Assigned(frmValorBaixaParcial) then
    frmValorBaixaParcial := TfrmValorBaixaParcial.Create(nil);
  try
    frmValorBaixaParcial.ValorDocumento :=  rValue;
    frmValorBaixaParcial.edtValor.Value :=  rValue;
    frmValorBaixaParcial.ShowModal;

    bInsereDoc := frmValorBaixaParcial.ModalResult = mrok;

  finally
    frmValorBaixaParcial.Free;
  end;

  if bInsereDoc then
  Begin
    //Bruno Bastos - 16/12/2009 - Início
    if _BaixaDocumentos.DocTemPai(CdsPendentes.FieldByName('CODDOCUMENTO').AsInteger, 0) then
    begin
      MsgDlg(' O documento ' + CdsPendentes.FieldByName('NODOCUMENTO').AsString + ' é "filho" de outro. '+#13#10+
             ' Esse documento será baixado junto com o documento "pai", se o mesmo foi selecionado.', 'Aviso', mtinformation, [mbOk], 0);
      exit;
    end;
    //Bruno Bastos - 16/12/2009 - Fim

    CdsPendentes.Edit;
    CdsPendentes.FieldByName('VALOR').AsFloat := (CdsPendentes.FieldByName('VALOR').AsFloat - rValue);
    CdsPendentes.Post;

    If CdsSelecionados.Locate('CODDOCUMENTO',VarArrayOf([CdsPendentes.FieldByName('CODDOCUMENTO').AsFloat]),[]) Then
    Begin
      CdsSelecionados.Edit;
      CdsSelecionados.FieldByName('VALOR').AsFloat := CdsSelecionados.FieldByName('VALOR').AsFloat + rValue;
      CdsSelecionados.FieldByName('STATUSVALOR').AsFloat := 3;
      // Edilaine - SOL 124845-14262 / KTN 1977287
      // verifica se documento tem baixas com outros documentos
      if _BaixaDocumentos.DocumentoComBaixaMista(CdsSelecionados.FieldByName('CODDOCUMENTO').AsInteger ) then
         CdsSelecionados.FieldByName('FLGBAIXATOTAL').AsString := 'M'
      else
         CdsSelecionados.FieldByName('FLGBAIXATOTAL').AsString := 'N';
      // Edilaine - SOL 124845-14262 / KTN 1977287 - fim
      CdsSelecionados.Post;
    End
    Else
    Begin
      MoveFields(CdsPendentes, CdsSelecionados, OpInserir, False);

      //Bruno Bastos - Sol 126261 - Início
      cdsAux.Data := _BaixaDocumentos.BuscaDocFilho(CdsSelecionados.FieldByName('CODDOCUMENTO').AsInteger, 0);
      while not cdsAux.eof do
      begin
        if cdsAux.FieldByName('RECPAG').AsString = 'P' then
        begin
          CdsDocsFilhoPag.Insert;
          CdsDocsFilhoPag.FieldByName('SELECIONA').AsString       := 'S';
          CdsDocsFilhoPag.FieldByName('BAIXAPARCIAL').AsString    := 'N';
          CdsDocsFilhoPag.FieldByName('CODTIPDOC').AsInteger      := cdsAux.FieldByName('CODTIPDOC').AsInteger;
          CdsDocsFilhoPag.FieldByName('IDMODULO').AsInteger       := cdsAux.FieldByName('IDMODULO').AsInteger;
          CdsDocsFilhoPag.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
          CdsDocsFilhoPag.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
          CdsDocsFilhoPag.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
          CdsDocsFilhoPag.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
          CdsDocsFilhoPag.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
          CdsDocsFilhoPag.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
          CdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
          CdsDocsFilhoPag.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
          CdsDocsFilhoPag.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
          CdsDocsFilhoPag.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
          CdsDocsFilhoPag.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
          CdsDocsFilhoPag.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
          CdsDocsFilhoPag.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
          CdsDocsFilhoPag.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
          CdsDocsFilhoPag.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
          CdsDocsFilhoPag.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
          CdsDocsFilhoPag.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
          CdsDocsFilhoPag.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
          CdsDocsFilhoPag.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
          CdsDocsFilhoPag.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
          CdsDocsFilhoPag.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
          CdsDocsFilhoPag.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
          CdsDocsFilhoPag.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
          CdsDocsFilhoPag.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
          //Helen - Sol: 126621/1121 KTN: 760963
          CdsDocsFilhoPag.FieldByName('DATADISPONIB').AsString    := cdsAux.FieldByName('DATADISPONIB').AsString;
          CdsDocsFilhoPag.Post;
        end
        else
        begin
          CdsDocsFilhoRec.Insert;
          CdsDocsFilhoRec.FieldByName('SELECIONA').AsString       := 'S';
          CdsDocsFilhoRec.FieldByName('BAIXAPARCIAL').AsString    := 'N';
          CdsDocsFilhoRec.FieldByName('CODTIPDOC').AsInteger      := cdsAux.FieldByName('CODTIPDOC').AsInteger;
          CdsDocsFilhoRec.FieldByName('IDMODULO').AsInteger       := cdsAux.FieldByName('IDMODULO').AsInteger;
          CdsDocsFilhoRec.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
          CdsDocsFilhoRec.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
          CdsDocsFilhoRec.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
          CdsDocsFilhoRec.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
          CdsDocsFilhoRec.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
          CdsDocsFilhoRec.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
          CdsDocsFilhoRec.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
          CdsDocsFilhoRec.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
          CdsDocsFilhoRec.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
          CdsDocsFilhoRec.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
          CdsDocsFilhoRec.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
          CdsDocsFilhoRec.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
          CdsDocsFilhoRec.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
          CdsDocsFilhoRec.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
          CdsDocsFilhoRec.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
          CdsDocsFilhoRec.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
          CdsDocsFilhoRec.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
          CdsDocsFilhoRec.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
          CdsDocsFilhoRec.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
          CdsDocsFilhoRec.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
          CdsDocsFilhoRec.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
          CdsDocsFilhoRec.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
          CdsDocsFilhoRec.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
          CdsDocsFilhoRec.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
          //Helen - Sol: 126621/1121 KTN: 760963
          CdsDocsFilhoRec.FieldByName('DATADISPONIB').AsString    := cdsAux.FieldByName('DATADISPONIB').AsString;
          CdsDocsFilhoRec.Post;
        end;
        cdsAux.Next;
      end;
      //Bruno Bastos - Sol 126261 - Fim

      CdsSelecionados.Edit;
      CdsSelecionados.FieldByName('VALOR').AsFloat := rValue;
      CdsSelecionados.FieldByName('STATUSVALOR').AsFloat := 3;
      // Edilaine - SOL 124845-14262 / KTN 1977287
      // verifica se documento tem baixas com outros documentos
      if _BaixaDocumentos.DocumentoComBaixaMista(CdsSelecionados.FieldByName('CODDOCUMENTO').AsInteger ) then
         CdsSelecionados.FieldByName('FLGBAIXATOTAL').AsString := 'M'
      else
         CdsSelecionados.FieldByName('FLGBAIXATOTAL').AsString := 'N';
      // Edilaine - SOL 124845-14262 / KTN 1977287 - fim
      CdsSelecionados.Post;
    End;

    If IsFloatZero(CdsPendentes.FieldByName('VALOR').AsFloat) Then  CdsPendentes.Delete
  End;
  CdsPendentes.EnableControls;
  CdsSelecionados.EnableControls;
end;

procedure TFrmBaixaManualMT.ActTotalExecute(Sender: TObject);
var
  I : integer;

begin
  inherited;
  //Bruno Bastos - 16/12/2009 - Início
  sListaDocFilho := '';
  For I := 0 To GrdPendentes.SelectedList.count - 1 Do
  Begin
    if _BaixaDocumentos.DocTemPai(GrdPendentes.DataSource.DataSet.FieldByName('CODDOCUMENTO').AsInteger, 0) then
    begin
      if sListaDocFilho = '' then
        sListaDocFilho := GrdPendentes.DataSource.DataSet.FieldByName('NODOCUMENTO').AsString
      else
        sListaDocFilho := sListaDocFilho + ',' + GrdPendentes.DataSource.DataSet.FieldByName('NODOCUMENTO').AsString;
    end;
  end;
  //Bruno Bastos - 16/12/2009 - Fim

  MoveRegistrosGrid(GrdPendentes, GrdSelecionados);


  // Edilaine - SOL 124845-14262 / KTN 1977287
  // verifica se documento tem baixas com outros documentos
  if _BaixaDocumentos.DocumentoComBaixaMista(CdsSelecionados.FieldByName('CODDOCUMENTO').AsInteger ) then
  begin
    CdsSelecionados.Edit;
    CdsSelecionados.FieldByName('FLGBAIXATOTAL').AsString := 'M'; // Mista
    CdsSelecionados.Post;
  end;
  // Edilaine - SOL 124845-14262 / KTN 1977287 - fim


  //Bruno Bastos - Sol 126261 - Início
  if sListaDocFilho <> '' then
  begin
    sListaDocFilho := '';
    exit;
  end;

  SqlDocsFilhoPag.open;
  SqlDocsFilhoRec.open;
  GrdSelecionados.DataSource.DataSet.First;
  while not GrdSelecionados.DataSource.DataSet.eof do
  begin
    cdsAux.Data := _BaixaDocumentos.BuscaDocFilho(GrdSelecionados.DataSource.DataSet.FieldByName('CODDOCUMENTO').AsInteger, 0);
    while not cdsAux.eof do
    begin
      if cdsAux.FieldByName('RECPAG').AsString = 'P' then
      begin
        CdsDocsFilhoPag.Insert;
        CdsDocsFilhoPag.FieldByName('SELECIONA').AsString       := 'S';
        CdsDocsFilhoPag.FieldByName('BAIXAPARCIAL').AsString    := 'N';
        CdsDocsFilhoPag.FieldByName('CODTIPDOC').AsInteger      := cdsAux.FieldByName('CODTIPDOC').AsInteger;
        CdsDocsFilhoPag.FieldByName('IDMODULO').AsInteger       := cdsAux.FieldByName('IDMODULO').AsInteger;
        CdsDocsFilhoPag.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
        CdsDocsFilhoPag.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
        CdsDocsFilhoPag.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
        CdsDocsFilhoPag.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
        CdsDocsFilhoPag.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
        CdsDocsFilhoPag.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
        CdsDocsFilhoPag.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
        CdsDocsFilhoPag.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
        CdsDocsFilhoPag.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
        CdsDocsFilhoPag.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
        CdsDocsFilhoPag.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
        CdsDocsFilhoPag.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
        CdsDocsFilhoPag.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
        CdsDocsFilhoPag.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
        CdsDocsFilhoPag.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
        CdsDocsFilhoPag.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
        CdsDocsFilhoPag.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
        CdsDocsFilhoPag.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        CdsDocsFilhoPag.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
        CdsDocsFilhoPag.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
        CdsDocsFilhoPag.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
        CdsDocsFilhoPag.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
        CdsDocsFilhoPag.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
        //Helen - Sol: 126621/1121 KTN: 760963
        CdsDocsFilhoPag.FieldByName('DATADISPONIB').AsString    := cdsAux.FieldByName('DATADISPONIB').AsString;
        CdsDocsFilhoPag.Post;
      end
      else
      begin
        CdsDocsFilhoRec.Insert;
        CdsDocsFilhoRec.FieldByName('SELECIONA').AsString       := 'S';
        CdsDocsFilhoRec.FieldByName('BAIXAPARCIAL').AsString    := 'N';
        CdsDocsFilhoRec.FieldByName('CODTIPDOC').AsInteger      := cdsAux.FieldByName('CODTIPDOC').AsInteger;
        CdsDocsFilhoRec.FieldByName('IDMODULO').AsInteger       := cdsAux.FieldByName('IDMODULO').AsInteger;
        CdsDocsFilhoRec.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
        CdsDocsFilhoRec.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
        CdsDocsFilhoRec.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
        CdsDocsFilhoRec.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
        CdsDocsFilhoRec.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
        CdsDocsFilhoRec.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDocsFilhoRec.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
        CdsDocsFilhoRec.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
        CdsDocsFilhoRec.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
        CdsDocsFilhoRec.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
        CdsDocsFilhoRec.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
        CdsDocsFilhoRec.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
        CdsDocsFilhoRec.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
        CdsDocsFilhoRec.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
        CdsDocsFilhoRec.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
        CdsDocsFilhoRec.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
        CdsDocsFilhoRec.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
        CdsDocsFilhoRec.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
        CdsDocsFilhoRec.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        CdsDocsFilhoRec.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
        CdsDocsFilhoRec.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
        CdsDocsFilhoRec.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
        CdsDocsFilhoRec.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
        CdsDocsFilhoRec.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
        //Helen - Sol: 126621/1121 KTN: 760963
        CdsDocsFilhoRec.FieldByName('DATADISPONIB').AsString    := cdsAux.FieldByName('DATADISPONIB').AsString;
        CdsDocsFilhoRec.Post;
      end;
      cdsAux.Next;
    end;
    GrdSelecionados.DataSource.DataSet.Next;
  end;
  //Bruno Bastos - Sol 126261 - Fim
end;




procedure TFrmBaixaManualMT.ActProcurarExecute(Sender: TObject);
begin
  inherited;
  FrmParamGeraLote := TFrmParamGeraLote.Create(self);
  FrmParamGeraLote.EventoGetParam := GetParams;
  FrmParamGeraLote.bGeraLote := false;

  // Rodolpho da Silva - 28/11/2006
  FrmParamGeraLote.ExibirCheckBox(True);

  FrmParamGeraLote.ShowModal;

  if FrmParamGeraLote.modalResult = mrOK then
     MontaSQLDocPendentes;
end;

procedure TFrmBaixaManualMT.ActExcluirExecute(Sender: TObject);
begin
  inherited;
  MoveRegistrosGrid(GrdSelecionados, GrdPendentes);

  //Bruno Bastos - Sol 126261 - 16/12/2009 - Início
  SqlDocsFilhoPag.open;
  SqlDocsFilhoRec.open;
  GrdSelecionados.DataSource.DataSet.First;
  while not GrdSelecionados.DataSource.DataSet.eof do
  begin
    cdsAux.Data := _BaixaDocumentos.BuscaDocFilho(GrdSelecionados.DataSource.DataSet.FieldByName('CODDOCUMENTO').AsInteger, 0);
    while not cdsAux.eof do
    begin
      if cdsAux.FieldByName('RECPAG').AsString = 'P' then
      begin
        CdsDocsFilhoPag.Insert;
        CdsDocsFilhoPag.FieldByName('SELECIONA').AsString       := 'S';
        CdsDocsFilhoPag.FieldByName('BAIXAPARCIAL').AsString    := 'N';
        CdsDocsFilhoPag.FieldByName('CODTIPDOC').AsInteger      := cdsAux.FieldByName('CODTIPDOC').AsInteger;
        CdsDocsFilhoPag.FieldByName('IDMODULO').AsInteger       := cdsAux.FieldByName('IDMODULO').AsInteger;
        CdsDocsFilhoPag.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
        CdsDocsFilhoPag.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
        CdsDocsFilhoPag.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
        CdsDocsFilhoPag.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
        CdsDocsFilhoPag.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
        CdsDocsFilhoPag.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
        CdsDocsFilhoPag.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
        CdsDocsFilhoPag.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
        CdsDocsFilhoPag.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
        CdsDocsFilhoPag.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
        CdsDocsFilhoPag.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
        CdsDocsFilhoPag.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
        CdsDocsFilhoPag.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
        CdsDocsFilhoPag.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
        CdsDocsFilhoPag.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
        CdsDocsFilhoPag.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
        CdsDocsFilhoPag.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
        CdsDocsFilhoPag.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        CdsDocsFilhoPag.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
        CdsDocsFilhoPag.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
        CdsDocsFilhoPag.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
        CdsDocsFilhoPag.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
        CdsDocsFilhoPag.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
        //Helen - Sol: 126621/1121 KTN: 760963
        CdsDocsFilhoPag.FieldByName('DATADISPONIB').AsString    := cdsAux.FieldByName('DATADISPONIB').AsString;
        CdsDocsFilhoPag.Post;
      end
      else
      begin
        CdsDocsFilhoRec.Insert;
        CdsDocsFilhoRec.FieldByName('SELECIONA').AsString       := 'S';
        CdsDocsFilhoRec.FieldByName('BAIXAPARCIAL').AsString    := 'N';
        CdsDocsFilhoRec.FieldByName('CODTIPDOC').AsInteger      := cdsAux.FieldByName('CODTIPDOC').AsInteger;
        CdsDocsFilhoRec.FieldByName('IDMODULO').AsInteger       := cdsAux.FieldByName('IDMODULO').AsInteger;
        CdsDocsFilhoRec.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
        CdsDocsFilhoRec.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
        CdsDocsFilhoRec.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
        CdsDocsFilhoRec.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
        CdsDocsFilhoRec.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
        CdsDocsFilhoRec.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDocsFilhoRec.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
        CdsDocsFilhoRec.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
        CdsDocsFilhoRec.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
        CdsDocsFilhoRec.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
        CdsDocsFilhoRec.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
        CdsDocsFilhoRec.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
        CdsDocsFilhoRec.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
        CdsDocsFilhoRec.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
        CdsDocsFilhoRec.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
        CdsDocsFilhoRec.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
        CdsDocsFilhoRec.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
        CdsDocsFilhoRec.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
        CdsDocsFilhoRec.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        CdsDocsFilhoRec.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
        CdsDocsFilhoRec.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
        CdsDocsFilhoRec.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
        CdsDocsFilhoRec.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
        CdsDocsFilhoRec.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
        //Helen - Sol: 126621/1121 KTN: 760963
        CdsDocsFilhoRec.FieldByName('DATADISPONIB').AsString    := cdsAux.FieldByName('DATADISPONIB').AsString;
        CdsDocsFilhoRec.Post;
      end;
      cdsAux.Next;
    end;
    GrdSelecionados.DataSource.DataSet.Next;
  end;
  //Bruno Bastos - Sol 126261 - 16/12/2009 - Fim
end;

procedure TFrmBaixaManualMT.CdsSelecionadosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if ParamIntegra.RecPag = 'P' then
     DataSet.FieldByName('DEBCRE').AsString := 'D'
  else
     DataSet.FieldByName('DEBCRE').AsString := 'C';
end;

function TFrmBaixaManualMT.RegLancFinanc(rValorLanc: Real;
  iCodPortador: Integer): Integer;
begin
  // Função inserida em 30/06/03 - by Alex - Pend. 12295
  //Busca os lancamentos não identificados no valor informado
  Result := -1;
  If ParamIntegra.RecPag = 'R' Then
  Begin
     Try
       Application.CreateForm(TFrmRegLancFinancMT,FrmRegLancFinancMT);
       FrmRegLancFinancMT.SqlLancFinanc.Prepare;
       FrmRegLancFinancMT.SqlLancFinanc.ParamByname('CODPORTADOR').AsInteger   := iCodPortador;
       FrmRegLancFinancMT.SqlLancFinanc.ParamByname('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
       FrmRegLancFinancMt.SqlLancFinanc.ParamByname('VALORLANCFINAN').AsFloat  := rValorLanc;
       FrmRegLancFinancMT.SqlLancFinanc.Open;
       FrmRegLancFinancMT.sDataLancto :=
         DatetoStr(_Documento.AjustaDataFloat(CmpDadosParaBaixaCAR.ParamValues[2].AsDateTime,
           CdsUmPortadorForma.FieldByName('DMAIS').AsInteger, TSistemaLancto(Sistema.IdModulo - 3)) );
       If Not FrmRegLancFinancMT.CdsLancFinanc.IsEmpty Then
          If (FrmRegLancFinancMT.ShowModal = MrOk) Then
             Result := FrmRegLancFinancMT.iCodlancnaoident;
     Finally
       FrmRegLancFinancMT.Free;
     End;
  End;
end;




procedure TFrmBaixaManualMT.GrdPendentesTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  IndexDef : TIndexDef;
  
  begin
  inherited;
//catia - p: 22472 - 14/07/2006
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  CdsPendentes.IndexName := '';
  CdsPendentes.IndexDefs.Clear;
  IndexDef := CdsPendentes.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  CdsPendentes.IndexName := IndexDef.Name;
  CdsPendentes.First;
//fim
end;

procedure TFrmBaixaManualMT.GrdSelecionadosTitleButtonClick(
  Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;

  begin
  inherited;
//catia - p: 22472 - 14/07/2006
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  CdsSelecionados.IndexName := '';
  CdsSelecionados.IndexDefs.Clear;
  IndexDef := CdsSelecionados.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  CdsSelecionados.IndexName := IndexDef.Name;
  CdsSelecionados.First;
//fim

end;


procedure TFrmBaixaManualMT.GetParams;//evento que pega os paâmetros do form Modal
var i: integer;
begin
   for i := 0 to FrmParamGeraLote.CmpDadosParaBaixa.params.Count - 1 do
     self.CmpDadosParaBaixa.ParamValues[i].Value := FrmParamGeraLote.CmpDadosParaBaixa.ParamValues[i].Value;
end;


procedure TFrmBaixaManualMT.GrdSelecionadosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;

  //andré tavares - pendência 21601
  if ((Sender As TwwDbGrid).DataSource.DataSet.FindField ('FLGPPDIFERENTE') <> nil) then
    if (Not (Sender As TwwDbGrid).DataSource.DataSet.IsEmpty) And
       ((Sender As TwwDbGrid).DataSource.DataSet.FieldByName('FLGPPDIFERENTE').AsString = 'S') then
    begin
       AFont.Color := clGrayText;
    end;

end;

end.




