unit FExecDesmembramento;


{-------------------------------------------------------------------------------
Nº SIG......: 113136
Data........: 04/07/2022
Responsável.: Cássio Florencio Rovaroto 
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
//Rotina......: -
//Nº SOL......: 212226
//Nº KINTANA..: 2037651
//Data........: 08/04/2014
//Responsável.: Helio Lima Custódio
//Descrição...: Transmite o valor de vida útil e taxa de depreciação do imóvel
//              base para os imoveis resultantes do desmembramento. Também
//              salva esses valores em histórico de vida útil para cada imovel resultante.
-------------------------------------------------------------------------------
Rotina...........: FormCreate, FormDestroy, CriaImoveisEConjuntos 
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 13/03/2014
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
-------------------------------------------------------------------------------}
// -----------------------------------------------------------------------------
//Rotina......: -
//Nº SOL......: 172902/8222
//Nº KINTANA..: 1577546
//Data........: 28/03/2012
//Responsável.: Wylliam Leite da Silva
//Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
// -----------------------------------------------------------------------------
//
//      Executa o Desmembramento de Imóveis
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  02/01/2002
//	Data de Término   :  07/01/2002
//
//------------------------------------------------------------------------------
{SOL  : 136732
Kintana: 821049
Responsável : Felipe de Oliveira
Data        : 16/08/2010
Descrição   : Acrescentado todos os campos necessários para o
              desmembramento de imóveis ser feito corretamente
--------------------------------------------------------------------------------}

//Rotina..........: Function DesmembramentoAtivoFixo
//N. Sol..........: 95458
//N. Kintana......: 41361495
//Data............: 07/08/2008
//Responsável.....: Emerson S.
//Descrição.......: Problema no desfazer Desmembramento.

//Rotina..........: Function VerificaBaixaTotalBem
//N. Sol..........: 95458
//N. Kintana......: 413614
//Data............: 28/11/2008
//Responsável.....: Cássio Camargo
//Descrição.......: Retorna se determinado bem de um imóvel possui a BAIXA TOTAL.

//Rotina..........: ExecutaDesmembramento
//N. Sol..........: 120454
//N. Kintana......: 574711
//Data............: 19/06/2009
//Responsável.....: Cássio Camargo
//Descrição.......: Erro no sistema ao realizar o desmembramento de um imóvel,
//                  quando o percentual de rateio é quebrado, como por exemplo 0,8333%.

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, TREdit, wwdbdatetimepicker, uCMClientDataSet,
  CMDateTimePicker, mImovelAtivo, Db, Wwdatsrc, DBTables, Wwquery,
  uCtrlMovDesmembramento, uCtrlBem, dbClient,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab,
  uCtrlImobObra, // Vando - SOL 154328-5901 / KTN 1373449

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  uCtrlHistoricoVidaUtil,
  uCtrlProvisaoImovel, uCMMath, uCtrlHistMovBem, uCtrlImobCAFxContab;

type
  TfrmExecDesmembramento = class(TfrmSairAjudaImob)
    Panel3: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    ntbPrincipal: TNotebook;
    btnContinuaSelecao: TfcShapeBtn;
    btnCancelaDesmembra: TfcShapeBtn;
    Panel4: TPanel;
    lblTitulo: TfcLabel;
    btnConfirmaDesmembra: TfcShapeBtn;
    molImovelAtivo1: TmolImovelAtivo;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    edtMestre: TEdit;
    Panel7: TPanel;
    btnContinuaEvento: TfcShapeBtn;
    btnVoltaEvento: TfcShapeBtn;
    Panel8: TPanel;
    Label5: TLabel;
    dsImovelxBem: TwwDataSource;
    edtSaldoContabil: TRealEdit;
    qryBemResult: TwwQuery;
    dsBemResult: TwwDataSource;
    updBemResult: TUpdateSQL;
    DBgrdResult: TwwDBGrid;
    qryBemResultIDIMOVEL_RESULT: TFloatField;
    qryBemResultIDBEM_ORIGEM: TFloatField;
    qryBemResultDESBEM: TStringField;
    qryBemResultPERCENT_DESMEMBRA: TFloatField;
    qryBemResultIXBGRUPO: TStringField;
    qryBemResultNOME_IMOVEL: TStringField;
    qryBemResult_GRUPO: TStringField;
    DBgrdBemOriginal: TwwDBGrid;
    updImovelResult: TUpdateSQL;
    dsImovelResult: TwwDataSource;
    qryImovelResult: TwwQuery;
    qryBemResultCC_ORIGINAL: TFloatField;
    qryBemResultCC_DESMEMBRA: TFloatField;
    qryImovelResultIDIMOVEL_RESULT: TFloatField;
    qryImovelResultPERCENT_DESMEMBRA: TFloatField;
    qryImovelResultCC_DESMEMBRA: TFloatField;
    qryImovelResultNOME_IMOVEL: TStringField;
    qryBemResultIDBEM_RESULT: TFloatField;
    qryBemResultIDMOVIMENTACAO_DESMEMBRA: TFloatField;
    qryBemResultNO_IMOVEL_RESULT: TFloatField;
    qryImovelResultNO_IMOVEL_RESULT: TFloatField;
    qryImovelResultIDEVENTO_RESULT: TFloatField;
    qryBemResultPLACA_RESULT: TFloatField;
    qryInsertDesmembraImovel: TwwQuery;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label2: TLabel;
    Label8: TLabel;
    edtNumImoveis: TRealEdit;
    GroupBox2: TGroupBox;
    memEvento: TMemo;
    dbgImoveis: TwwDBGrid;
    Label3: TLabel;
    edtDataOper: TCMDateTimePicker;
    qryBemResultFLGSEMPLACA: TFloatField;
    qryImovelResultIDIMOVELMESTRE: TFloatField;
    qryBemResultIDCONJUNTO_RESULT: TFloatField;
    qryBemResultIDGRUPO_RESULT: TFloatField;
    qryImovelXBem: TwwQuery;
    updImovelXBem: TUpdateSQL;
    qryImovelXBemIDIMOVEL: TFloatField;
    qryImovelXBemNOME_MESTRE: TStringField;
    qryImovelXBemNOME_IMOVEL: TStringField;
    qryImovelXBemIMOVEL_EXTENSO: TStringField;
    qryImovelXBemIDBEM: TFloatField;
    qryImovelXBemPLACA: TFloatField;
    qryImovelXBemDESBEM: TStringField;
    qryImovelXBemIXBGRUPO: TStringField;
    qryImovelXBemIMOCODIGO: TStringField;
    qryImovelXBemIMOMATRICULA: TStringField;
    qryImovelXBemCODTIPIMOVEL: TStringField;
    qryImovelXBemDESCTIPOIMOVEL: TStringField;
    qryImovelXBemFLGATIVO: TFloatField;
    qryImovelXBemSTATUS_IMOVEL: TStringField;
    qryImovelXBemFLGSTATUSOCUPACAO: TStringField;
    qryImovelXBemFLGSEMPLACA: TFloatField;
    qryImovelXBemIDLOCALIZACAO: TFloatField;
    qryImovelXBemIDRESPONSAVEL: TFloatField;
    qryImovelXBemIMOAREA: TFloatField;
    qryImovelXBemIMOAREAGERENCIAL: TFloatField;
    qryImovelXBemIMOFRACAOIDEAL: TFloatField;
    qryImovelXBemIMOPERCENTRATEIO: TFloatField;
    qryImovelXBemIMOMOEDACOMPRA: TFloatField;
    qryImovelXBemIMOVLRCOMPRA: TFloatField;
    qryImovelXBemIMODATACOMPRA: TDateTimeField;
    qryImovelXBemMOEDA_COMPRA: TStringField;
    qryImovelXBemIMOMOEDAREAVAL: TFloatField;
    qryImovelXBemIMOVLRREAVAL: TFloatField;
    qryImovelXBemIMODATAREAVAL: TDateTimeField;
    qryImovelXBemMOEDA_REAVAL: TStringField;
    qryImovelXBemIMOMOEDAMERCADO: TFloatField;
    qryImovelXBemIMOVLRMERCADO: TFloatField;
    qryImovelXBemIMODATAMERCADO: TDateTimeField;
    qryImovelXBemMOEDA_MERCADO: TStringField;
    qryImovelXBemCONTROLE: TStringField;
    qryImovelXBemBAIXATOTAL: TStringField;
    qryImovelXBemDTAINCLUSAO: TDateTimeField;
    qryImovelXBemFLGDEPREC: TFloatField;
    qryImovelXBemDATAULTDEP: TDateTimeField;
    qryImovelXBemDATAINICIODEP: TDateTimeField;
    qryImovelXBemTAXADEP: TFloatField;
    qryImovelXBemIDGRUPO: TFloatField;
    qryImovelXBemIDCLASSEBEM: TFloatField;
    qryImovelXBemVALHISTORICO: TFloatField;
    qryImovelXBemNOMEFORN: TStringField;
    qryImovelXBemCODGRUPO: TStringField;
    qryImovelXBemDESCGRUPO: TStringField;
    qryImovelXBemTIPOGRUPO: TStringField;
    qryImovelXBemCODCENTROCUSTO: TStringField;
    qryImovelXBemDESCCCUSTO: TStringField;
    qryImovelXBemTIPOCCUSTO: TStringField;
    qryImovelXBemCODCLASSEBEM: TStringField;
    qryImovelXBemDESCCLASSEBEM: TStringField;
    qryImovelXBemTIPOCLASSEBEM: TStringField;
    qryImovelXBemDESCCONJUNTO: TStringField;
    qryImovelXBemIDCONJUNTO: TFloatField;
    qryImovelXBemDESCLOCAL: TStringField;
    qryImovelXBemNOMERESP: TStringField;
    qryImovelXBemSUMVALCTB: TFloatField;
    qryImovelXBem_GRUPO: TStringField;
    qryImovelResultIMOCODIGO: TStringField;
    qryUpdImovel: TwwQuery;

    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnVoltaEventoClick(Sender: TObject);
    procedure btnContinuaEventoClick(Sender: TObject);
    procedure btnCancelaDesmembraClick(Sender: TObject);
    procedure molImovelAtivo1btnBuscaImovelClick(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure molImovelAtivo1btnLimpaImovelClick(Sender: TObject);
    procedure btnConfirmaDesmembraClick(Sender: TObject);
    procedure DBgrdResultEnter(Sender: TObject);
    procedure DBgrdResultExit(Sender: TObject);
    procedure qryBemResultCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgImoveisEnter(Sender: TObject);
    procedure dbgImoveisExit(Sender: TObject);
    procedure DBgrdResultCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormDestroy(Sender: TObject);
    procedure qryImovelXBemCalcFields(DataSet: TDataSet);


  private { Private declarations }

    CtrlBem               : TCtrlBem;
    CtrlMovDesmembramento : TCtrlMovDesmembramento;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    CtrlCafObra : TCtrlImobObra;  // Vando - SOL 154328-5901 / KTN 1373449
    CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil; //Helio - SOL Nº 212226 KINTANA Nº 2037651
    CtrlProvisaoImovel : TCtrlProvisaoImovel; //Cássio Rovaroto - SIG nº 113136
    CtrlCAFxContab : TCtrlImobCAFxContab; //Cássio Rovaroto - SIG nº 113136
    HistMovBem : TCtrlHistMovBem; //Cássio Rovaroto - SIG nº 113136
    
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;

    function VerificaPreenchimentoSelecao: boolean;
    function VerificaPreenchimentoDesmembra: boolean;

    procedure PreenchePlacaCAF;

    function MontaDesmembramento: shortint;
    function ExecutaDesmembramento: shortint;
    function CriaImoveisResult(iNumImoveis:Integer): boolean;
    function CriaImoveisEConjuntos : shortint;
    function VerificaPercentImoveis : Boolean;

    function RegistraEventoImovel(const iImovel:Integer; const sTipo:String;
                                  const fValorContabil: Currency; const fPercent: Double; var iEvento:int64) : ShortInt;
    function DesmembramentoAtivoFixo: ShortInt;
    function ConsolidaImoveis(const iEventoOrigem:int64): shortint;

    //Helio - SOL Nº 212226 KINTANA Nº 2037651
    function AtualizaTaxaDep: ShortInt;

    function VerificaBaixaTotalBem(idBemOriginal: integer) :  boolean;

    function DesmembraProvisaoCusto(bIntegraContab: Boolean = True): Shortint;

  public { Public declarations }

  end;


var
  frmExecDesmembramento: TfrmExecDesmembramento;
  fCorGrid : Double;



implementation
{$R *.DFM}
uses
   uSistema, dImobiliario, uComunsImobiliario, uMensErro,
   uFuncoesImob, uDataBase, dBaseDados, uEventoImovel, DMS, uIntegraBack,
   DCAF, uCAF, uVerificaPreenchimento, uModuloImobiliario, dLookImobiliario;


procedure TfrmExecDesmembramento.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlBem               := TCtrlBem.Create;
   CtrlMovDesmembramento := TCtrlMovDesmembramento.Create;
   CtrlCafObra           := TCtrlImobObra.create;  // Vando - SOL 154328-5901 / KTN 1373449
   CtrlBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   CtrlMovDesmembramento.InitializeAs( CtrlBem );
   CtrlCafObra.InitializeAs( CtrlBem );  // Vando - SOL 154328-5901 / KTN 1373449

   ntbPrincipal.PageIndex := 0;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlBem);
   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;
   CtrlHistoricoVidaUtil.InitializeAs(CtrlBem);
   //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651
   //Cássio Rovaroto - SIG nº 113136 - Início
   CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;
   CtrlProvisaoImovel.InitializeAs(CtrlBem);
   HistMovBem := TCtrlHistMovBem.Create;
   HistMovBem.InitializeAs(CtrlBem);
   CtrlCAFxContab := TCtrlImobCAFxContab.Create;
   CtrlCAFxContab.InitializeAs(CtrlBem);
   //Cássio Rovaroto - SIG nº 113136 - Fim
end;

procedure TfrmExecDesmembramento.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlBem );
  FreeAndNil( CtrlMovDesmembramento );
  FreeAndNil( CtrlHistoricoVidaUtil ); //Helio - SOL Nº 212226 KINTANA Nº 2037651
  inherited;
end;


procedure TfrmExecDesmembramento.DesabilitaBotoes;
begin
   Screen.Cursor     := crHourGlass;
   bbtnSair.Enabled  := False;
   btnContinuaSelecao.Enabled    := False;
   btnVoltaEvento.Enabled        := False;
   btnContinuaEvento.Enabled     := False;
   btnCancelaDesmembra.Enabled   := False;
   btnConfirmaDesmembra.Enabled  := False;
   molImovelAtivo1.btnBuscaImovel.Enabled := False;
   molImovelAtivo1.btnLimpaImovel.Enabled := False;
end;


procedure TfrmExecDesmembramento.HabilitaBotoes;
begin
   molImovelAtivo1.btnBuscaImovel.Enabled := True;
   molImovelAtivo1.btnLimpaImovel.Enabled := True;
   btnContinuaSelecao.Enabled    := True;
   btnVoltaEvento.Enabled        := True;
   btnContinuaEvento.Enabled     := True;
   btnCancelaDesmembra.Enabled   := True;
   btnConfirmaDesmembra.Enabled  := True;
   bbtnSair.Enabled := True;
   Screen.Cursor    := crDefault;
end;


procedure TfrmExecDesmembramento.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoSelecao then begin
      CriaImoveisResult(word(trunc(edtNumImoveis.Value)));
      ntbPrincipal.PageIndex := 1;
      dbgImoveis.SetFocus;
   end;
end;


function TfrmExecDesmembramento.VerificaPreenchimentoSelecao: boolean;
begin
   Result := False;
   try
      if ( length(trim(molImovelAtivo1.edtImovel.Text)) = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', molImovelAtivo1.btnBuscaImovel);
      if ( edtSaldoContabil.Value <= 0 ) then
         raise EValidacao.CreateVal('O imóvel não possui saldo. Verifique!', molImovelAtivo1.btnBuscaImovel);
      if ( edtDataOper.Date = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', edtDataOper);
      if ( edtNumImoveis.Value < 2 ) then
         raise EValidacao.CreateVal('É necessário que o Nº de Imóveis novos seja pelo menos 2 (dois)!', edtNumImoveis);

      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataOper.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataOper);
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;


function TfrmExecDesmembramento.CriaImoveisResult(iNumImoveis:Integer): Boolean;
var i : Integer;
    fPercent, fDif : Extended;
begin
   Result := True;
   edtMestre.Text := molImovelAtivo1.sMestre;
   //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Início
   //fDif     := 1000000;
   fPercent := ComunsImobiliario.Arredonda(100 / iNumImoveis, 4);
   //Alterada a regra para determinar a diferença nos imóveis desmembrados
   fDif := (100 - (fPercent * (iNumImoveis-1)));
   //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Fim
   qryImovelResult.Close;
   qryImovelResult.Open;

   for i := 1 to iNumImoveis do begin
      // grava os imóveis resultantes virtualmente
      qryImovelResult.Insert;
      qryImovelResultNO_IMOVEL_RESULT.AsInteger := i;
      qryImovelResultIDIMOVELMESTRE.AsFloat     := molImovelAtivo1.iMestre;
      qryImovelResultNOME_IMOVEL.AsString       := molImovelAtivo1.sImovel + '  -  ' + IntToStr(i);
      if i < iNumImoveis then
           qryImovelResultPERCENT_DESMEMBRA.AsFloat := fPercent
      //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Início
      else qryImovelResultPERCENT_DESMEMBRA.AsFloat := fDif; //(fDif / 10000); //
      qryImovelResult.Post;
      //fDif := fDif - Trunc(fPercent * 10000)
      //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Fim
   end;
   qryImovelResult.First;
end;


procedure TfrmExecDesmembramento.btnVoltaEventoClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;


procedure TfrmExecDesmembramento.btnContinuaEventoClick(Sender: TObject);
begin
   inherited;
   if VerificaPercentImoveis then begin
      DesabilitaBotoes;
      try
         MontaDesmembramento;
      finally
         ntbPrincipal.PageIndex := 2;
         HabilitaBotoes;
         DBgrdResult.SetFocus;
      end;
   end;
end;


function TfrmExecDesmembramento.MontaDesmembramento: shortint;
begin
   Result := 0;
   qryBemResult.Close;
   qryBemResult.Open;
   qryImovelResult.DisableControls;

   // percorre os bens originais
   qryImovelXBem.First;
   while not(qryImovelXBem.EOF) do begin
      qryImovelResult.First;
      while not qryImovelResult.eof do begin

         // cria virtualmente os bens resultantes
         qryBemResult.Append;
         qryBemResultNO_IMOVEL_RESULT.AsInteger := qryImovelResultNO_IMOVEL_RESULT.AsInteger;
         qryBemResultIDBEM_ORIGEM.AsInteger     := qryImovelXBemIDBEM.AsInteger;
         qryBemResultNOME_IMOVEL.AsString       := qryImovelResultNOME_IMOVEL.AsString;
         qryBemResultDESBEM.AsString            := copy((molImovelAtivo1.sMestre + ' - ' + qryImovelResultNOME_IMOVEL.AsString + ' - ' + qryImovelXBem_GRUPO.AsString), 1, 200);
         qryBemResultIXBGRUPO.AsString          := qryImovelXBemIXBGRUPO.AsString;
         qryBemResultIDGRUPO_RESULT.AsInteger   := qryImovelXBemIDGRUPO.AsInteger;
         qryBemResultPERCENT_DESMEMBRA.AsFloat  := qryImovelResultPERCENT_DESMEMBRA.AsFloat;
         qryBemResultCC_ORIGINAL.AsFloat        := qryImovelXBemSUMVALCTB.asFloat;
         qryBemResultFLGSEMPLACA.AsFloat        := qryImovelXBemFLGSEMPLACA.asFloat;
         if qryBemResultFLGSEMPLACA.AsFloat <> 0 then qryBemResultPLACA_RESULT.AsFloat := -1;
         qryBemResult.Post;
         qryImovelResult.Next;
      end;
      qryImovelXBem.Next;
   end;
   qryBemResult.First;
   qryImovelResult.EnableControls;
end;


procedure TfrmExecDesmembramento.btnCancelaDesmembraClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;



procedure TfrmExecDesmembramento.molImovelAtivo1btnBuscaImovelClick(Sender: TObject);
var
   fTotalContabil : currency;
   sFiltro        : string;
begin
   inherited;

   // Imóveis em obra náo podem ser desmembrados nesta tela, deve-se utilizar desmembramento de obras
   sFiltro := dtmMS.MS_ImovelAtivo.Filtro.Text;
   dtmMS.MS_ImovelAtivo.Filtro.Add('I.FLGSTATUS <> ''O'' ');

   molImovelAtivo1.btnBuscaImovelClick(Sender);
   Repaint;
   if dtmMS.MS_ImovelAtivo.RetornouValor then try
      DesabilitaBotoes;

      with qryImovelXBem do begin
         LimpaParametros(qryImovelXBem);
         ParamByName('PIDIMOVEL').asInteger  := molImovelAtivo1.iImovel;
         ParamByName('PIDPESSOA').asInteger  := Sistema.idEmpresa;
         Open;

         First;
         fTotalContabil := 0;
         while not(EOF) do begin
            Edit;
            qryImovelXBemSUMVALCTB.AsFloat := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                                    qryImovelXBemIDBEM.AsInteger,
                                                                    Date(),
                                                                    ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                                    ModuloImobiliario.InvestImob.iIdPaisCAF);
            Post;
            fTotalContabil := fTotalContabil + FieldByName('SUMVALCTB').asFloat;
            Next;
         end;
         edtSaldoContabil.Value := fTotalContabil;
      end;
   finally
      HabilitaBotoes;
      edtDataOper.SetFocus;
   end;

   // Retorna o filtro original
   dtmMS.MS_ImovelAtivo.Filtro.Text := sFiltro;

end;



procedure TfrmExecDesmembramento.DBgrdBemOriginalCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecDesmembramento.DBgrdBemOriginalTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmExecDesmembramento.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   case ntbPrincipal.PageIndex of
      0: lblTitulo.Caption := 'Desmembramento de Imóveis [ Seleção ]';
      1: lblTitulo.Caption := 'Desmembramento de Imóveis [ Imóveis Resultantes ]';
      2: lblTitulo.Caption := 'Desmembramento de Imóveis [ Resultado ]';
   end;
end;


procedure TfrmExecDesmembramento.molImovelAtivo1btnLimpaImovelClick(Sender: TObject);
begin
   inherited;
   molImovelAtivo1.btnLimpaImovelClick(Sender);
   qryImovelXBem.Close;
   edtSaldoContabil.Value := 0;
end;


procedure TfrmExecDesmembramento.btnConfirmaDesmembraClick(Sender: TObject);
begin
   inherited;
   qryBemResult.DisableControls;
   DesabilitaBotoes;
   try
      if VerificaPreenchimentoDesmembra then begin
         if ExecutaDesmembramento <> 0 then begin
            MsgDlg('Houve ERRO durante a tentativa de desmembramento do Imóvel!', 'Erro', mtError, [mbOk], 0);
         end else begin
            MsgDlg('Desmembramento Realizado com Sucesso !', 'Aviso', mtWarning, [mbOk], 0);
            molImovelAtivo1btnLimpaImovelClick(Self);
            ntbPrincipal.PageIndex := 0;
         end;
      end;
   finally
      HabilitaBotoes;
      qryBemResult.EnableControls;
   end;
end;


function TfrmExecDesmembramento.VerificaPreenchimentoDesmembra: boolean;
var
   iBemOrigem        : int64;
   fCC_Imovel        : double;
   sImovel, sMsgErro : string;
   fPercent          : Extended;
begin
   Result := False;
   try
      // -------------------------------------------------------------------------------------------
      // 1) verifica se os percentuais informados totalizam 100%
      qryImovelXBem.First;
      while not qryImovelXBem.EOF do begin
         fPercent    := 0;
         iBemOrigem  := qryImovelXBemIDBEM.asInteger;

         // acumula o percentual dos bens para cada bem original
         with qryBemResult do begin
            First;
            while not eof do begin
               if qryBemResultIDBEM_ORIGEM.asInteger = iBemOrigem then
                  //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Início
                  //fPercent := fPercent + Trunc(qryBemResultPERCENT_DESMEMBRA.asFloat * 10000);
                  fPercent := fPercent + (qryBemResultPERCENT_DESMEMBRA.asFloat * 10000);
                  //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Fim
                 // atualiza o custo contábil atual em função do percentual alterado
                 Edit;
                 qryBemResultCC_DESMEMBRA.AsFloat := Arredonda(qryBemResultCC_ORIGINAL.AsFloat * qryBemResultPERCENT_DESMEMBRA.AsFloat / 100, 2);
                 Post;
                 Next;
            end;
         end;

         // verifica o percentual acumulado
         //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Início
         //fPercent := Trunc(fPercent / 10000);
         fPercent := (fPercent / 10000);
         //Cássio - SOL Nº 120454 KINTANA Nº 574711 - Fim
         if ( Round(fPercent) <> 100 ) then begin
            sMsgErro := 'O total dos percentuais de desmembramento (' + FormatFloat('#,##0.0000 %', fPercent) +
                        ') do grupo ' + qryImovelXBem_GRUPO.asString +
                        ' não perfaz 100% !';
            raise EValidacao.CreateVal(sMsgErro, DBgrdResult);
         end;
         qryImovelXBem.Next;
      end;

      // -------------------------------------------------------------------------------------------
      // 2) consolida o custo contabil dos bens por imovel resultante
      qryImovelResult.First;
      while not(qryImovelResult.EOF) do begin
         fCC_Imovel := 0;

         // acumula o custo contábil dos bens para cada bem original
         with qryBemResult do begin
            First;
            while not(EOF) do begin
               // só processa se o imóvel for o mesmo
               if qryBemResultNO_IMOVEL_RESULT.asInteger = qryImovelResultNO_IMOVEL_RESULT.AsInteger then begin
                  fCC_Imovel  := fCC_Imovel + qryBemResultCC_DESMEMBRA.AsFloat;
               end;
               Next;
            end;
         end;

         // atualiza o custo contábil do Imóvel
         qryImovelResult.Edit;
         qryImovelResultCC_DESMEMBRA.AsFloat := fCC_Imovel;
         qryImovelResult.Post;
         qryImovelResult.Next;
      end;
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;


function TfrmExecDesmembramento.ExecutaDesmembramento: shortint;
var
   iEventoOrigem : int64;
begin
    Result := 0;
   StartTransacao;
   try
      try
         // Altera a situação e registra evento no imovel original
         Result := RegistraEventoImovel(molImovelAtivo1.iImovel,'O', edtSaldoContabil.Value, 100, iEventoOrigem);

         // Cria os Imóveis desmembrados no banco
         if Result = 0 then Result := CriaImoveisEConjuntos;

         // Cria Placa para os bens resultantes
         if Result = 0 then PreenchePlacaCAF;

         // Atualiza o IMOCODIGO
         if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) and (Result = 0) then
         begin
            qryBemResult.First;
            while not qryBemResult.eof do
            begin
               LimpaParametros(qryUpdImovel);
               qryUpdImovel.ParamByName('PIMOCODIGO').AsString  := Copy(qryBemResultPLACA_RESULT.AsString,2,6);
               qryUpdImovel.ParamByName('PIDIMOVEL').AsInteger  := qryBemResultIDIMOVEL_RESULT.AsInteger;
               qryUpdImovel.ExecSql;
               qryBemResult.Next;
            end;
            qryBemResult.First;
         end;

         // Executa o Desmembramento no CAF
         if Result = 0 then Result := DesmembramentoAtivoFixo;

         // Grava ImoveisXBens
         if Result = 0 then Result := ConsolidaImoveis(iEventoOrigem);

         //Helio - SOL Nº 212226 KINTANA Nº 2037651
         //atualiza taxa de depreciacao para os novos imoveis
         //e salva no historico de vida util
         if Result = 0 then Result := AtualizaTaxaDep;

         //Cássio Rovaroto - SIG nº 113136 - Início
         //Faz a distribuição do custo de provisão do imóvel desmembrado aos
         //imóveis resultantes.
          if Result = 0 then Result := DesmembraProvisaoCusto;
         //Cássio Rovaroto - SIG nº 113136 - Fim

         // se alguma parte apresentou problemas...
         if Result = -1 then begin
            RollBackTransacao;
         end else begin
            CommitTransacao;
         end;
      except
         RollBackTransacao;
         Result := -1;
         Raise;
         Repaint;
      end;
   finally
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
   end;
end;


function TfrmExecDesmembramento.RegistraEventoImovel(const iImovel:Integer; const sTipo:String;
                                                     const fValorContabil: Currency;  const fPercent: Double;
                                                     var iEvento:int64) : shortint;
begin
   try
      Result  := 0;
      iEvento := 0;
      if sTipo = 'O' then begin
         EventoImovel.AlteraSituacaoImovel(iImovel, 'D');
         // Registra o evento desmembramento "DM" no imóvel original
         iEvento := EventoImovel.RegistraEvento(iImovel, -1, Sistema.idUsuario, -1,
                                 -1, edtDataOper.Date, -1, 'BD', 'Baixa por Desmembramento',
                                 memEvento.Lines.Text, fPercent, fValorContabil, 0, False);
      end else begin
         // Registra o evento desmembramento "DM" no imóvel resultante
         iEvento := EventoImovel.RegistraEvento(iImovel, -1, Sistema.idUsuario, -1,
                                 -1, edtDataOper.Date, -1, 'ED', 'Entrada por Desmembramento',
                                 memEvento.Lines.Text, fPercent, 0, fValorContabil, False);
      end;
   except
      iEvento := 0;
      Result  := -1;
   end;
end;


function TfrmExecDesmembramento.CriaImoveisEConjuntos: ShortInt;
var iIDConjunto,iIDImovel : Integer;
begin
   Result := 0;
   qryImovelResult.First;
   try
      // cria no banco cada imóvel resultante e define a situação do mesmo
      while not qryImovelResult.EOF do begin
         iIDImovel := CAF.CriaImovel(qryImovelResultNOME_IMOVEL.AsString,
                                     '',
                                     qryImovelResultIDIMOVELMESTRE.asInteger,
                                     molImovelAtivo1.iImovel,
                                     -1,
                                     edtDataOper.Date,
                                     qryImovelResultCC_DESMEMBRA.AsFloat,
                                     qryImovelResultNO_IMOVEL_RESULT.AsInteger,
                                     qryImovelResultPERCENT_DESMEMBRA.AsFloat);
         if iIDImovel > 0 then begin
            EventoImovel.AlteraSituacaoImovel(iIDImovel, 'N');

            // Vando - SOL 154328-5901 / KTN 1373449 - inicio
            CtrlCafObra.GravaPlanoPatroxImovel(molImovelAtivo1.iImovel, iIDImovel);

            // grava o ID do imovel gerado na tabela virtual

            qryImovelResult.Edit;
            qryImovelResultIDIMOVEL_RESULT.AsFloat := iIDImovel;
            qryImovelResult.Post;

            // Cria o Conjunto equivalente no banco para o imóvel
            iIdConjunto := LeUltRegistro(nil,'CONJUNTO');
            LimpaParametros(dtmCAF.qryInsConjunto);
            dtmCAF.qryInsConjunto.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
            dtmCAF.qryInsConjunto.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
            dtmCAF.qryInsConjunto.ParamByName('PIDLOCALIZACAO').AsInteger := qryImovelXBemIDLOCALIZACAO.AsInteger;
            dtmCAF.qryInsConjunto.ParamByName('PIDRESPONSAVEL').AsInteger := qryImovelXBemIDRESPONSAVEL.AsInteger;
            dtmCAF.qryInsConjunto.ParamByName('PDESCCONJUNTO').AsString   := edtMestre.Text + ' - ' + qryImovelResultNOME_IMOVEL.AsString;
            dtmCAF.qryInsConjunto.ExecSQL;


            // Abre RATEIODEPRECIACAO do grupo original para copiar os Centros de Custos
            LimpaParametros(dtmCAF.qryRateioDepreciacao);
            dtmCAF.qryRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger := qryImovelXBemIDCONJUNTO.AsInteger;
            dtmCAF.qryRateioDepreciacao.Open;

            // Cria RATEIODEPRECIACAO para todos os centro de custos existentes anteriormente
            while not dtmCAF.qryRateioDepreciacao.eof do begin
               LimpaParametros(dtmCAF.qryInsRateioDepreciacao);
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger    := iIdConjunto;
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger     := Sistema.IdEmpresa;
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PCODCENTROCUSTO').AsString := dtmCAF.qryRateioDepreciacaoCODCENTROCUSTO.AsString;
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PPARTICIPACAO').AsInteger  := dtmCAF.qryRateioDepreciacaoPARTICIPACAO.AsInteger;
               dtmCAF.qryInsRateioDepreciacao.ParamByName('PDTAINICIO').AsDateTime    := edtDataOper.DateTime;
               dtmCAF.qryInsRateioDepreciacao.ExecSQL;
               dtmCAF.qryRateioDepreciacao.Next;
            end;

            // grava o ID do imovel e do Conjunto na tabela virtual de bens resultantes
            qryBemResult.First;
            while not qryBemResult.eof do begin
               if qryBemResultNO_IMOVEL_RESULT.AsFloat = qryImovelResultNO_IMOVEL_RESULT.AsFloat then begin
                  qryBemResult.Edit;
                  qryBemResultIDIMOVEL_RESULT.AsFloat   := iIDImovel;
                  qryBemResultIDCONJUNTO_RESULT.AsFloat := iIdConjunto;
                  qryBemResult.Post;
               end;
               qryBemResult.Next;
            end;
         end else begin
            Result := -1;
            Abort;
         end;
         qryImovelResult.Next;
      end;
   except
      Result := -1;
   end;
end;


procedure TfrmExecDesmembramento.PreenchePlacaCAF;
var sPlaca: string;
    iSeqPlaca : Integer;
    iPlaca    : Integer;
    iPrefixo  : Integer;
    iImovel   : Integer;
    iIdImovel : Integer;

   cdsBemResult  : TCMClientDataSet;
   sSQL          : String;
begin
   // procedimento que preenche o número das placas dos bens, se precisar
   iSeqPlaca := 0;
   iPrefixo  := 0;

   qryBemResult.First;

   if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 0) and
      (qryBemResultFLGSEMPLACA.AsInteger = 1) then
      Exit;

   try
      cdsBemResult := TCMClientDataSet.Create( nil );
      sSQL         :=
      'SELECT'                             + #13 +
      '   0 AS IDIMOVEL_RESULT,'           + #13 +
      '   -1 AS PLACA_RESULT,'             + #13 +
      '   0 AS IDGRUPO_RESULT,'            + #13 +
      // Marchetti - Pendencia 27080
      '   0 AS FLGSEMPLACA'                + #13 +
      // Fim Marchetti - Pendencia 27080
      'FROM'                               + #13 +
      '   DUAL'                            + #13 +
      'WHERE'                              + #13 +
      '   1=2'                             + #13 +
      'ORDER BY'                           + #13 +
      '   IDIMOVEL_RESULT, IDGRUPO_RESULT' + #13;

      cdsBemResult.Data := CtrlMovDesmembramento.GetDataPacket(sSQL);

      while not qryBemResult.Eof do
      begin
         cdsBemResult.Append;
         cdsBemResult.FieldByName('IDIMOVEL_RESULT').AsInteger := qryBemResultIDIMOVEL_RESULT.AsInteger;
         cdsBemResult.FieldByName('IDGRUPO_RESULT').AsInteger  := qryBemResultIDGRUPO_RESULT.AsInteger;
         // Marchetti - Pendencia 27080
         cdsBemResult.FieldByName('FLGSEMPLACA').AsInteger     := qryBemResultFLGSEMPLACA.AsInteger;
         // Fim Marchetti - Pendencia 27080

         cdsBemResult.Post;

         qryBemResult.Next;
      end;

      cdsBemResult.IndexFieldNames := 'IDIMOVEL_RESULT; IDGRUPO_RESULT';
      cdsBemResult.First;

      while not cdsBemResult.Eof do
      begin

         iIdImovel := cdsBemResult.FieldByName('IDIMOVEL_RESULT').AsInteger;

         if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) then Inc(iSeqPlaca);

         while (iIdImovel = cdsBemResult.FieldByName('IDIMOVEL_RESULT').AsInteger) and
               (not cdsBemResult.Eof) do
         begin
            iPlaca := CAF.PlacaCaf(cdsBemResult.FieldByName('IDGRUPO_RESULT').AsInteger,
                                   cdsBemResult.FieldByName('IDIMOVEL_RESULT').AsInteger,
                                   Sistema.IdEmpresa,
                                   // Marchetti - Pendencia 27080
                                   cdsBemResult.FieldByName('FLGSEMPLACA').AsInteger,
                                   // Fim Marchetti - Pendencia 27080
                                   iSeqPlaca);

            if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) and (iPlaca <> -1) then
            begin
               iImovel := molImovelAtivo1.iImovel;
               qryImovelXBem.Locate('IDIMOVEL', iImovel , []);

               LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
               dtmLookImobiliario.qryLookTipoImovel.Close;
               dtmLookImobiliario.qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := qryImovelXBemCODTIPIMOVEL.AsString;
               dtmLookImobiliario.qryLookTipoImovel.Open;

               if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull) and
                  (dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger = cdsBemResult.FieldByName('IDGRUPO_RESULT').AsInteger) then begin
                  iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumTer);
               end;

               if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull) and
                  (dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger = cdsBemResult.FieldByName('IDGRUPO_RESULT').AsInteger) then begin
                  iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumEdi);
               end;

               if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull) and
                  (dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsInteger = cdsBemResult.FieldByName('IDGRUPO_RESULT').AsInteger) then begin
                  iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumIns);
               end;

               iPlaca := StrToInt(IntToStr(iPrefixo) + CompletaInicio(IntToStr(iPlaca), '0',6));
            end;

            if iPlaca > 0 then
            begin
               cdsBemResult.Edit;
               cdsBemResult.FieldByName('PLACA_RESULT').AsInteger := iPlaca;
               cdsBemResult.Post;
            end;
            cdsBemResult.Next;

            if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao <> 1) then inc(iSeqPlaca);
         end;
      end;

      cdsBemResult.First;
      while not cdsBemResult.eof do
      begin
         if qryBemResult.Locate('IDIMOVEL_RESULT;IDGRUPO_RESULT',
                                VarArrayOf([cdsBemResult.FieldByName('IDIMOVEL_RESULT').AsInteger,
                                            cdsBemResult.FieldByName('IDGRUPO_RESULT').AsInteger]),
                                            []) then
         begin
            qryBemResult.Edit;
            qryBemResultPLACA_RESULT.AsInteger := cdsBemResult.FieldByName('PLACA_RESULT').AsInteger;
            qryBemResult.Post;
         end;

         cdsBemResult.Next;
      end;
   finally
      FreeAndNil( cdsBemResult );
   end;
end;


function TfrmExecDesmembramento.DesmembramentoAtivoFixo: ShortInt;
var
   iBemOrigem  : int64;
   i           : integer;
   iMovimento  : Integer;
   fRegistros  : double;
   vPlacas     : array of Extended;
   vConjuntos  : array of integer;
   vGrupos     : array of integer;
   vNomesBens  : array of string;
   vPercent    : array of currency;
   vIDBens     : array of integer;
   vSaldoBens  : array of currency;

   cdsGerBens  : TClientDataSet;
begin
  Result := 0;
  try
    try
      // Cria, abre vazio e associa o cds de bens desmembrados
      cdsGerBens := TClientDataSet.Create( nil );
      CtrlMovDesmembramento.cdsGerBens := cdsGerBens;

      cdsGerBens.Data := CtrlMovDesmembramento.GetDataPacket(
                          ' SELECT B.IDBEM, B.PLACA, B.DESBEM, B.IDCONJUNTO, '+
                          '        C.DESCCONJUNTO, B.IDGRUPO, G.CLASSE,      '+
                          '        G.NOME, (0.0000) AS PROPORCAO             '+
                          '   FROM BEM B, CONJUNTO C, GRUPO G                '+
                          '  WHERE B.IDBEM = -2                              '+
                          '    AND B.IDCONJUNTO = C.IDCONJUNTO               '+
                          '    AND B.IDGRUPO    = G.IDGRUPO                  ');

      fRegistros := qryImovelXBem.RecordCount;
      MostraProgresso(ProgressBar, lblProgress, lblContador, fRegistros, 'Processando desmembramento dos Bens...');

      // Executa o desmembramento para cada bem original
      qryImovelXBem.First;
      while not(qryImovelXBem.EOF) do
      begin
        iBemOrigem := qryImovelXBemIDBEM.AsInteger;
        // Determina o tamanho do vetor
        i := 0;
        qryBemResult.First;
        while not(qryBemResult.EOF) do
        begin
          //Cássio - SOL 95458 KINTANA 413614 - Início
          //Verifica se o BEM original não está totalemente baixado; se não gera os BENS Desmembrados; se sim, não gera bens
          if (qryBemResultIDBEM_ORIGEM.AsInteger = iBemOrigem) and (VerificaBaixaTotalBem(iBemOrigem)) then
          //Cássio - SOL 95458 KINTANA 413614 - Fim
          begin
          //Emerson - 12/09/2008 - N. Sol 95458 -  N. Kintana 413614
            if (qryBemResultPERCENT_DESMEMBRA.AsFloat >= 0) then
              inc(i)
            else
            begin
              qryBemResult.Edit;
              qryBemResultIDBEM_RESULT.asInteger := qryBemResultIDBEM_ORIGEM.AsInteger;
              qryBemResult.Post;
            end;
          end;
          qryBemResult.Next;
        end;

        // Verifica a quantidade de bens
        if i > 1 then
        begin
          // carrega o cds com os bens resultantes
          i := 0;
          qryBemResult.First;
          cdsGerBens.EmptyDataSet;

          while not(qryBemResult.EOF) do
          begin
            //Emerson - 12/09/2008 - N. Sol 95458 -  N. Kintana 413614
                  //if (qryBemResultIDBEM_ORIGEM.AsInteger = iBemOrigem) and (qryBemResultPERCENT_DESMEMBRA.AsFloat > 0)  then
                  if (qryBemResultIDBEM_ORIGEM.AsInteger = iBemOrigem) and (qryBemResultPERCENT_DESMEMBRA.AsFloat >= 0)  then

            begin
              cdsGerBens.Insert;
              cdsGerBens.FieldByName('IDCONJUNTO').AsInteger := qryBemResultIDCONJUNTO_RESULT.AsInteger;
              cdsGerBens.FieldByName('IDGRUPO').AsInteger    := qryBemResultIDGRUPO_RESULT.AsInteger;
              if qryBemResultPLACA_RESULT.AsFloat > 0 then
                cdsGerBens.FieldByName('PLACA').AsFloat     := qryBemResultPLACA_RESULT.AsFloat;
              cdsGerBens.FieldByName('DESBEM').AsString      := qryBemResultDESBEM.AsString;
              cdsGerBens.FieldByName('PROPORCAO').AsFloat    := qryBemResultPERCENT_DESMEMBRA.AsFloat;
              cdsGerBens.Post;
            end;
            qryBemResult.Next;
          end;
          //Cássio - SOL 95458 KINTANA 413614 - Início
          {Linha incluída para que os bens gerados sejam exibidos na ordem certa
          dentro do ClientDataSet cdsGerBens, na classe CtrlMovDesembramento.
          O problema ocorria quando desmembro bens que possuem o valor de rateio em 100%.}

          CtrlMovDesmembramento.cdsGerBens.Data := cdsGerBens.Data;
          //Cássio - SOL 95458 KINTANA 413614 - Fim

          CtrlMovDesmembramento.OpenTransaction := False;
          if not CtrlMovDesmembramento.ExecutaDesmembramento(Sistema.IdModulo,
                                                             Sistema.IdEmpresa,
                                                             Sistema.IdUsuario,
                                                             iBemOrigem,
                                                             edtDataOper.Date ) then
          begin
            raise Exception.Create( CtrlMovDesmembramento.MessageInfo );
          end;

          // Grava os IDs dos Bens e os custos contábeis na tabela de bens resultantes
          qryBemResult.First;
          cdsGerBens.First;
          while not(qryBemResult.EOF) do
          begin
            //Emerson - 12/09/2008 - N. Sol 95458 -  N. Kintana 413614
                  //if (qryBemResultIDBEM_ORIGEM.AsInteger = iBemOrigem) and (qryBemResultPERCENT_DESMEMBRA.AsFloat > 0)  then
                  if (qryBemResultIDBEM_ORIGEM.AsInteger = iBemOrigem) and (qryBemResultPERCENT_DESMEMBRA.AsFloat >= 0)  then
            begin
              qryBemResult.Edit;
              qryBemResultIDBEM_RESULT.asInteger  := cdsGerBens.FieldByName('IDBEM').AsInteger;
              qryBemResultCC_DESMEMBRA.asFloat    := CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                                           cdsGerBens.FieldByName('IDBEM').AsInteger,
                                                                           edtDataOper.Date,
                                                                           ModuloImobiliario.Investimob.iIdMoedaCAF,
                                                                           ModuloImobiliario.Investimob.iIdPaisCAF);
              qryBemResult.Post;
              cdsGerBens.Next;
            end;
            qryBemResult.Next;
          end;
        end;

        qryImovelXBem.Next;
        AndaProgresso(ProgressBar, lblProgress, lblContador, qryImovelXBem.RecNo, edtNumImoveis.Value);
      end;
    except
      on E : Exception do
      begin
        Result := -1;
        MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
    end;
  finally
    EscondeProgresso(ProgressBar, lblProgress, lblContador);
    FreeAndNil( cdsGerBens );
  end;
end;



function TfrmExecDesmembramento.ConsolidaImoveis(const iEventoOrigem: int64): shortint;
var
   iEventoResult            : int64;
   fCC_Acumulado, fSaldoTot : extended;
   fPercentDesmembra,fAreaTotal,fAreaNova : double;
   sSql, sSQLPlanoPatroXImovel : String;
   qryInsPlanoPatroXImovel, qryLoadPlanoPatroXImovel : TQuery;
begin
   Result    := 0;
   qryInsPlanoPatroXImovel := TQuery.Create(nil);
   qryLoadPlanoPatroXImovel := TQuery.Create(nil);
   qryInsPlanoPatroXImovel.DatabaseName := FuncaoGeral.DataBaseName;  //'BaseDados';
   qryLoadPlanoPatroXImovel.DatabaseName := FuncaoGeral.DataBaseName;
   try
      try
         MostraProgresso(ProgressBar, lblProgress, lblContador, edtNumImoveis.Value, 'Consolidando os novos valores dos Imóveis...');

         // Busca area total do Imovel Original para ser reateado entre os desmembrados
         fAreaTotal := 0;
         sSql := 'SELECT IMOAREA FROM IMOVEL ' +
                 ' WHERE IDIMOVEL = ' + IntToStr(molImovelAtivo1.iImovel);
         if not FazQuery(dtmImobiliario.qryAux,sSql) then begin
            Result := -1;
            Abort;
         end else begin
            fAreaTotal := dtmImobiliario.qryAux.FieldByName('IMOAREA').AsFloat;
         end;

         // Totaliza o custo contábil dos bens por imóvel gerado
         qryImovelResult.First;
         while (not qryImovelResult.EOF) and (Result = 0) do begin

            fCC_Acumulado := 0;
            fSaldoTot     := 0;
            qryBemResult.First;
            // percorre agora a tabela de bens resultantes
            while not qryBemResult.EOF do begin

               // acumula o saldo contabil total de todos bens de todos os imoveis para
               // calcular o percentual de desmembramento do imovel
               fSaldoTot := fSaldoTot + qryBemResultCC_DESMEMBRA.AsFloat;

               // se o bem pertencer ao imóvel, acumula o CC e gera ImovelxBem
               if qryBemResultIDIMOVEL_RESULT.AsInteger = qryImovelResultIDIMOVEL_RESULT.AsInteger then begin
                  fCC_Acumulado := fCC_Acumulado + qryBemResultCC_DESMEMBRA.AsFloat;

                  // grava o ImovelxBem
                  if qryBemResultIDBEM_RESULT.asInteger > 0 then begin
                     if (qryBemResultIDBEM_ORIGEM.AsInteger <> qryBemResultIDBEM_RESULT.AsInteger) then begin
                         with dtmCAF.qryInsImovelxbem do begin
                           LimpaParametros(dtmCAF.qryInsImovelxbem);
                           ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
                           ParamByName('PIDIMOVEL').AsInteger := qryBemResultIDIMOVEL_RESULT.AsInteger;
                           ParamByName('PIDBEM').AsInteger    := qryBemResultIDBEM_RESULT.asInteger;
                           ParamByName('PIXBGRUPO').AsString  := qryBemResultIXBGRUPO.AsString;
                           ExecSQL;
                        end;
                     end else begin
                        sSql := 'UPDATE IMOVELXBEM '+#13+
                                '   SET IDIMOVEL = ' + qryBemResultIDIMOVEL_RESULT.AsString +#13+
                                ' WHERE IDBEM    = ' + qryBemResultIDBEM_RESULT.AsString;
                        ExecutaQuery(dtmBaseDados.qry, sSql);
                     end;
                  end;
               end;

               // Vando - SOL 154328-5901 / KTN 1373449
               CtrlCafObra.AtualizaSegregacaoLancamentos(qryBemResultIDBEM_RESULT.asInteger, edtDataOper.DateTime);

               qryBemResult.Next;
            end;

            // calcula o percentual de desmembramento
            fPercentDesmembra := ( fCC_Acumulado / fSaldoTot) * 100;

            // Registra o Evento no imovel resultante
            Result := RegistraEventoImovel(qryImovelResultIDIMOVEL_RESULT.AsInteger, 'R',
                                           fCC_Acumulado, fPercentDesmembra, iEventoResult);
            if Result = -1 then Abort;

            // grava o custo contábil na tabela virtual
            qryImovelResult.Edit;
            qryImovelResultIDEVENTO_RESULT.AsInteger := iEventoResult;
            qryImovelResultCC_DESMEMBRA.AsFloat      := fCC_Acumulado;
            qryImovelResult.Post;

            // Grava DESMEMBRAIMOVEL
            with dtmCAF.qryInsDesmembraImovel do begin
               LimpaParametros(dtmCAF.qryInsDesmembraImovel);
               ParamByName('PIDIMOVELINI').AsInteger       := molImovelAtivo1.iImovel;
               ParamByName('PIDIMOVELFIM').AsInteger       := qryImovelResultIDIMOVEL_RESULT.AsInteger;
               ParamByName('PIDEVENTOIMOVELINI').AsInteger := iEventoOrigem;
               ParamByName('PIDEVENTOIMOVELFIM').AsInteger := iEventoResult;
               ParamByName('PFLGTIPODESMEMBRA').AsString   := 'D';
               ParamByName('PDMRDATA').AsDateTime          := edtDataOper.Date;
               ParamByName('PDMRPERCENT').AsFloat          := Arredonda(fPercentDesmembra, 4);
               ExecSQL;
            end;

            // Rateia a Area Total do Imovel original pelos Novos Imoveis e
            // atualiza o valor de aquisição, calculado após a depreciação do imóvel pai
            fAreaNova := ( fAreaTotal * fPercentDesmembra ) / 100;
            sSql := 'UPDATE IMOVEL ' +
                    '   SET IMOAREA = ' + FloatToStr(Arredonda(fAreaNova,0)) + ', ' +
                    '       IMOVLRCOMPRA = ' + ComunsImobiliario.StrTran(FloatToStr(Arredonda(fCC_Acumulado,2)),',','.') +
                    ' WHERE IDIMOVEL = ' + IntToStr(qryImovelResultIDIMOVEL_RESULT.AsInteger);
            if not ExecutarQuery(dtmImobiliario.qryAux,sSql) then begin
               Result := -1;
               Exit;
            end;

            {// Vando - SOL 154328-5901 / KTN 1373449 - comentado
            //--Emerson inicio- Kt 94180 SOL92381 verificando se existe segregação para incluir na PLANOPATROXIMOVEL--//
            //if RetornaSegregacaoOrigem( molImovelAtivo1.iImovel, qryLoadPlanoPatroXImovel) > 0 then
            if ComunsImobiliario.RetornaSegregacaoOrigem ( molImovelAtivo1.iImovel, qryLoadPlanoPatroXImovel) > 0 then
            begin
              while Not qryLoadPlanoPatroXImovel.Eof do
              begin
                qryInsPlanoPatroXImovel.SQL.Clear;
                sSQLPlanoPatroXImovel := 'INSERT INTO PLANOPATROXIMOVEL '   + #10#13 +
                                         '          (IDIMOVEL, IDPATRO, IDPLANOPREV, PPIPERCENTRATEIO, FLGTIPO) VALUES (' + #10#13 +
                                          IntToStr(qryImovelResultIDIMOVEL_RESULT.AsInteger)+ ', ' + #10#13 +
                                          qryLoadPlanoPatroXImovel.FieldByName('IDPATRO').AsString + ', ' + #10#13 +
                                          qryLoadPlanoPatroXImovel.FieldByName('IDPLANOPREV').AsString + ', ' + #10#13 +
                                          ComunsImobiliario.TrocaVirgPPto(qryLoadPlanoPatroXImovel.FieldByName('PPIPERCENTRATEIO').AsString) + ', ' + #10#13 +
                                          QuotedStr(qryLoadPlanoPatroXImovel.FieldByName('FLGTIPO').AsString)  + ')';

                qryInsPlanoPatroXImovel.SQL.Add(sSQLPlanoPatroXImovel);
                qryInsPlanoPatroXImovel.ExecSQL;

                qryLoadPlanoPatroXImovel.Next;
              end; //while
            end;
            //--Emerson - Kt 94180 SOL92381 --FIM-----------------------------//
            }// Vando - SOL 154328-5901 / KTN 1373449 - fim comentado

            qryImovelResult.Next;
            AndaProgresso(ProgressBar, lblProgress, lblContador, qryImovelResult.RecNo, edtNumImoveis.Value);
         end;
      except
         Result := -1;
         Raise;
         Repaint;
      end;
   finally
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
      FreeAndNil(qryInsPlanoPatroXImovel);
      FreeAndNil(qryLoadPlanoPatroXImovel);
   end;
end;

//Helio - SOL Nº 212226 KINTANA Nº 2037651
function TfrmExecDesmembramento.AtualizaTaxaDep: ShortInt;
var
   sSql : String; cdsHistoricoVidaUtil : TCMClientDataSet;
begin

   Result := 0;
   cdsHistoricoVidaUtil := TCMClientDataSet.Create(nil);

   cdsHistoricoVidaUtil.Data :=
        CtrlHistoricoVidaUtil.LookupHistoricoVidaUtilVigente(qryImovelXBem.FieldByName('IDIMOVEL').AsInteger);

   qryImovelXBem.First;
   while not(qryImovelXBem.EOF) do
   begin
        //nao atualiza a taxa quando o grupo for terreno
        if qryImovelXBem.FieldByName('IXBGRUPO').AsString <> 'T' then
        begin

            qryBemResult.First;
            while not(qryBemResult.EOF) do
            begin


                if (qryBemResultIDBEM_ORIGEM.AsInteger = qryImovelXBem.FieldByName('IDBEM').AsInteger) and
                    (cdsHistoricoVidaUtil.FieldByName('TXDEP_MES').AsString <> '0') then
                begin

                    //atualiza a taxa de depreciacao do bem
                    //de acordo a taxa do bem do imovel que foi desmembrado
                    sSql := 'UPDATE BEMXDEP                '+#13+
                          '   SET TAXADEP = ' + stringReplace(cdsHistoricoVidaUtil.FieldByName('TXDEP_MES').AsString, ',', '.', [rfIgnoreCase, rfReplaceAll])  +#13+
                          ' WHERE IDBEM = ' + qryBemResult.FieldByName('IDBEM_RESULT').AsString +#13+
                          ' AND IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +#13+
                          ' AND MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
                          ' AND IDBEMXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF);

                    if not CtrlHistoricoVidaUtil.ExecSQL(sSql) then
                        Result := -1;

                    if not CtrlHistoricoVidaUtil.GravaHistoricoVidaUtil(
                                qryBemResult.FieldByName('IDIMOVEL_RESULT').AsInteger,
                                cdsHistoricoVidaUtil.FieldByName('VIDAUTIL').AsInteger,
                                (cdsHistoricoVidaUtil.FieldByName('TXDEP_MES').AsFloat * 12),
                                cdsHistoricoVidaUtil.FieldByName('TXDEP_MES').AsFloat,
                                'Entrada por Desmembramento',
                                False)
                    then
                        Result := -1;
                end;

                qryBemResult.Next;
            end;

        end;

       qryImovelXBem.Next;
   end;

   FreeAndNil(cdsHistoricoVidaUtil);
end;
//FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

procedure TfrmExecDesmembramento.DBgrdResultEnter(Sender: TObject);
begin
   inherited;
   qryBemResult.Edit;
end;



procedure TfrmExecDesmembramento.DBgrdResultExit(Sender: TObject);
begin
   inherited;
   if ( (qryBemResult.Active) and (qryBemResult.State = dsEdit) ) then qryBemResult.Post;
end;



procedure TfrmExecDesmembramento.qryBemResultCalcFields(DataSet: TDataSet);
begin
   inherited;
   DataSet.FieldByName('_GRUPO').AsString := CAF.GrupoExtenso(DataSet.FieldByName('IXBGRUPO').AsString);
end;



procedure TfrmExecDesmembramento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryBemResult.Close;
   qryImovelXBem.Close;
   FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   inherited;
end;



procedure TfrmExecDesmembramento.dbgImoveisEnter(Sender: TObject);
begin
  inherited;
  qryImovelResult.Edit;
end;

procedure TfrmExecDesmembramento.dbgImoveisExit(Sender: TObject);
begin
   inherited;
   if ( (qryImovelResult.Active) and (qryImovelResult.State = dsEdit) ) then
      qryImovelResult.Post;
end;

function TfrmExecDesmembramento.VerificaPercentImoveis: Boolean;
var fTot : Extended;
       i :  integer;
begin
  i := 0;
   Result := True;
   with qryImovelResult do begin
      DisableControls;
      First;
      fTot := 0;
      while not eof do begin
         //fTot := fTot + Trunc(qryImovelResultPERCENT_DESMEMBRA.AsFloat * 10000);
         fTot := fTot + (qryImovelResultPERCENT_DESMEMBRA.AsFloat * 10000);
         Next;
         Inc(i);
      end;
      First;
      EnableControls;
   end;
   //fTot := Trunc(fTot / 10000);
   fTot := (fTot / 10000);
   if Round(fTot) <> 100 then begin
      Result := False;
      MsgDlg('Percentual de Desmembramento Inválido', 'Erro', mtError, [mbOk], 0);
   end;
end;


procedure TfrmExecDesmembramento.DBgrdResultCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var iNumImoveis : Integer;
    bMudaCor : Boolean;
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin

         iNumImoveis := qryImovelResult.RecordCount;
         if ((Sender as TwwDBGrid).CalcCellRow mod iNumImoveis) = 0 then begin
            if ABrush.Color = $00C0FFFF then
                 ABrush.Color := clWhite
            else ABrush.Color := $00C0FFFF;  // amarelo bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecDesmembramento.qryImovelXBemCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryImovelxBem_GRUPO.AsString := CAF.GrupoExtenso(qryImovelxBemIXBGRUPO.asString);
end;

//--Emerson - Kt 94180 SOL92381 --INICIO------------------------------//
//
// Responsavael : Emerson
// Data : 25.11.2008
// Descricao : Busca caso exista, registros de segregaçao .
//
{function TfrmExecDesmembramento.RetornaSegregacaoOrigem(iIdImovel: Integer;
  var qryRegistros: TQuery): Integer;
var
  sSQL: string;
begin
  sSQL := 'SELECT IDPATRO,          ' + #10#13 +
          '       IDPLANOPREV,      ' + #10#13 +
          '       PPIPERCENTRATEIO, ' + #10#13 +
          '       FLGTIPO           ' + #10#13 +
          '  FROM PLANOPATROXIMOVEL ' + #10#13 +
          ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);

  qryRegistros.SQL.Clear;
  qryRegistros.DatabaseName := 'BaseDados';
  qryRegistros.SQL.Add(sSql);
  qryRegistros.Open;

  Result := qryRegistros.RecordCount;
end;}

//Cássio - SOL 95458 KINTANA 413614 - Início
function TfrmExecDesmembramento.VerificaBaixaTotalBem(
  idBemOriginal: integer): boolean;
var
  sSQL : String;
  cdsVerificaBaixa : TCmClientDataSet;
begin
  Result := False;
  cdsVerificaBaixa := TCmClientDataSet.Create(nil);
  try
    sSQL := 'SELECT BAIXATOTAL ' + #10#13 +
            '  FROM BEM ' + #10#13 +
            ' WHERE IDBEM = ' + IntToStr(idBemOriginal);

    FazQuery(cdsVerificaBaixa, sSQL);

    if cdsVerificaBaixa.FieldByName('BAIXATOTAL').AsString = 'N' then
      Result := True
    else
      Result := False;
  finally
    cdsVerificaBaixa.Free;
  end;
end;
//Cássio - SOL 95458 KINTANA 413614 - Fim

function TfrmExecDesmembramento.DesmembraProvisaoCusto(bIntegraContab: Boolean = True): Shortint;
var
  cdsProvisaoImovel: TCMClientDataSet;
  dSaldoProvisaoBemResult, nSeqHist, nPlanilha : Extended;
  wDia, wMes, wAno: word;
  sMsgErro: string;
  iHistMovBem: Integer;
  iIdBemResultAnt: Integer;
  iIdProvisaoImovelNovo: Integer;
  iIdImovelAnt: Integer;
begin
  Result := 0;
  iIdProvisaoImovelNovo := 1;
  cdsProvisaoImovel := TCMClientDataSet.Create(nil);
  DecodeDate(edtDataOper.Date, wAno, wMes, wDia);
  try
    qryBemResult.First;
    CtrlProvisaoImovel.InicializaContabProvisao;
    while not qryBemResult.eof do
    begin
      if qryBemResult.FieldByName('IDBEM_RESULT').asInteger > 0 then
      begin
        cdsProvisaoImovel.Data := CtrlProvisaoImovel.GetProvisaoBemImovel(qryBemResult.FieldByName('IDBEM_ORIGEM').asInteger, edtDataOper.Date);
        if not cdsProvisaoImovel.IsEmpty then
        begin
          dSaldoProvisaoBemResult := CtrlProvisaoImovel.SaldoContabilBem(Sistema.IdEmpresa,
                                                                           qryBemResult.FieldByName('IDBEM_RESULT').asInteger,
                                                                           ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                                           1,
                                                                           edtDataOper.Date);

          iIdProvisaoImovelNovo := CtrlProvisaoImovel.InsereProvisaoImovelDesmembrado(cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger,
                                                                                      qryBemResult.FieldByName('IDIMOVEL_RESULT').asInteger,
                                                                                      edtDataOper.DateTime);
          if iIdProvisaoImovelNovo = -1 then
            raise Exception.Create(CtrlProvisaoImovel.MessageInfo);

          if not CtrlProvisaoImovel.ExecutaProvisaoCusto(qryBemResult.FieldByName('IDBEM_RESULT').asInteger,
                                                         Sistema.IdEmpresa,
                                                         Sistema.IdModulo,
                                                         ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                         iIdProvisaoImovelNovo,
                                                         qryBemResult.FieldByName('IDIMOVEL_RESULT').asInteger,
                                                         qryBemResult.FieldByName('IDGRUPO_RESULT').asInteger,
                                                         qryBemResult.FieldByName('IDCONJUNTO_RESULT').AsInteger,
                                                         ModuloImobiliario.InvestImob.iUnidNegoc,
                                                         0,
                                                         cdsProvisaoImovel.FieldByName('CODTIPIMOVEL').asString,
                                                         qryBemResultPLACA_RESULT.asString,
                                                         qryBemResultDESBEM.AsString,
                                                         '',
                                                         edtDataOper.DateTime,
                                                         dSaldoProvisaoBemResult,
                                                         cdsProvisaoImovel.FieldByName('PERCENTUAL').AsFloat,
                                                          True,
                                                          True) then
            raise Exception.Create(CtrlProvisaoImovel.MessageInfo);

          //Faz a baixa de provisão dos custos do bem anterior
          if qryBemResultIDBEM_ORIGEM.AsFloat <> iIdBemResultAnt then
          begin
            iIdBemResultAnt := qryBemResultIDBEM_ORIGEM.AsInteger;
            iIdImovelAnt := cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger;

            LimpaParametros(dtmCAF.qryLookBem);
            dtmCAF.qryLookBem.ParamByName('PIDBEM').AsInteger := iIdBemResultAnt;
            dtmCAF.qryLookBem.Open;

            if not CtrlProvisaoImovel.ExecutaProvisaoCusto(iIdBemResultAnt,
                                                           Sistema.IdEmpresa,
                                                           Sistema.IdModulo,
                                                           ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                           cdsProvisaoImovel.FieldByName('IDPROVISAOIMOVEL').AsInteger,
                                                           iIdImovelAnt,
                                                           dtmCAF.qryLookBem.FieldByName('IDGRUPO').asInteger,
                                                           dtmCAF.qryLookBem.FieldByName('IDCONJUNTO').asInteger,
                                                           ModuloImobiliario.InvestImob.iUnidNegoc,
                                                           0,
                                                           cdsProvisaoImovel.FieldByName('CODTIPIMOVEL').asString,
                                                           '',
                                                           dtmCAF.qryLookBem.FieldByName('DESBEM').asString,
                                                           '',
                                                           edtDataOper.DateTime,
                                                           0,
                                                           cdsProvisaoImovel.FieldByName('PERCENTUAL').AsFloat,
                                                           True,
                                                           True) then
              raise Exception.Create(CtrlProvisaoImovel.MessageInfo);

            dtmCAF.qryLookBem.Close;
          end;
        end;
      end;
      qryBemResult.Next;
    end;

    if CtrlProvisaoImovel.bContabProvisao then
    begin
      if not CtrlProvisaoImovel.ContabilizaProvisao(Sistema.IdModulo,
                                                    Sistema.IdEmpresa,
                                                    Sistema.IdUsuario,
                                                    edtDataOper.DateTime) then
        raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
    end;

    LimpaParametros(dtmCAF.qryUpdProvisaoImovel);
    dtmCAF.qryUpdProvisaoImovel.Prepare;
    dtmCAF.QryUpdProvisaoImovel.ParamByName('PDATAFIM').asDateTime := edtDataOper.DateTime;
    dtmCAF.QryUpdProvisaoImovel.ParamByName('PFLGATIVO').asString := 'N';
    dtmCAF.qryUpdProvisaoImovel.ParamByName('PIDIMOVEL').asInteger := iIdImovelAnt;
    dtmCAF.qryUpdProvisaoImovel.ExecSQL;

  finally
    FreeAndNil(cdsProvisaoImovel);
  end;
end;

end.
