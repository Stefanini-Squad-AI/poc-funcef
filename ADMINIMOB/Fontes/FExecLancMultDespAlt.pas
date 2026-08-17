unit FExecLancMultDespAlt;

//	------------------------------------------------------------------------------------------------
//
//	Alteração de Lançamento Múltiplo de Despesas
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  28/05/2003
//	Data de Término   :  30/05/2003
//
//	------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdblook, TREdit, Mask, wwdbedit, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, mFornecedor, TEdNum, Grids, Wwdbigrd, Wwdbgrid,
  DBTables, Db, Wwquery, Wwdatsrc, MontaSelect, uCMTypes, uOrcamento, mOrcamento;

type
  TfrmExecLancMultDespAlt = class(TfrmWizardMT)
    panLancamentos: TPanel;
    Label22: TLabel;
    Label10: TLabel;
    lblContaBancaria: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblReferenciaAP: TLabel;
    lblCentroCusto: TLabel;
    lblIntegrado: TLabel;
    molFornecedor1: TmolFornecedor;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    lblDataVencimento: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    edtDataLanc: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    DBcboFormaRecPag: TwwDBLookupCombo;
    dbCboContaBancaria: TwwDBLookupCombo;
    edtNumDocumento: TEdit;
    DBcboTipoRecDes: TwwDBLookupCombo;
    edtReferenciaAP: TEdit;
    DBcboCentroCusto: TwwDBLookupCombo;
    memObs: TMemo;
    chkContrato: TCheckBox;
    btnProcurar: TfcShapeBtn;
    MS_Lancamento: TMontaSelect;
    dsAlterador: TwwDataSource;
    qryAlterador: TwwQuery;
    qryAlteradorDESCRICAO: TStringField;
    qryAlteradorIDDOCUMENTO: TFloatField;
    qryAlteradorCODALTERADOR: TFloatField;
    qryAlteradorVLRALTERADOR: TFloatField;
    updAlterador: TUpdateSQL;
    DSIMPOSTO: TwwDataSource;
    qryRateio: TwwQuery;
    qryRateioIMOCODIGO: TStringField;
    qryRateioIMOVEL_EXTENSO: TStringField;
    qryRateioCODTIPIMOVEL: TStringField;
    qryRateioGXIPERCENTRATEIO: TFloatField;
    qryRateioPERCENT_RATEIO: TFloatField;
    qryRateioVALOR: TFloatField;
    qryRateioIDIMOVEL: TFloatField;
    qryRateioIDCONTRATOIMOVEL: TFloatField;
    qryRateioCONNUMERO: TStringField;
    qryRateioCONNOME: TStringField;
    updRateio: TUpdateSQL;
    dsRateio: TwwDataSource;
    pgcLancamentos: TPageControl;
    tbsLancamentos: TTabSheet;
    DBgrdLancamentos: TwwDBGrid;
    tbsErro: TTabSheet;
    memErro: TMemo;
    Panel3: TPanel;
    btnExcluiImovel: TfcShapeBtn;
    btnInsereImovel: TfcShapeBtn;
    btnTotaliza: TfcShapeBtn;
    Label4: TLabel;
    edtTotalLanc: TRealEdit;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    Label9: TLabel;
    Label14: TLabel;
    rdgAcreDesc: TRadioGroup;
    DBcboAlterador: TwwDBLookupCombo;
    DBgrdAlteradoresLanc: TwwDBGrid;
    edtValor: TEditNum;
    Panel4: TPanel;
    bbtnInsereAlterador: TBitBtn;
    btnExcluiAlterador: TBitBtn;
    qryRateioCONTRATO_EXTENSO: TStringField;
    edtNumAP: TEdit;
    Label1: TLabel;
    gbPeriodoCtbDiaria: TGroupBox;
    Label11: TLabel;
    Label28: TLabel;
    edtDtinictbdiaria: TCMDateTimePicker;
    edtDtfimctbdiaria: TCMDateTimePicker;
    molOrcamento1: TmolOrcamento;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBgrdLancamentosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancamentosTopRowChanged(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure btnInsereImovelClick(Sender: TObject);
    procedure btnExcluiImovelClick(Sender: TObject);
    procedure btnTotalizaClick(Sender: TObject);
    procedure rdgAcreDescClick(Sender: TObject);
    procedure molFornecedor1btnBuscaFornClick(Sender: TObject);
    procedure bbtnInsereAlteradorClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure DBcboFormaRecPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure DBcboTipoRecDesCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    iResult       : smallint;
    sTipoImovel   : string;
    iDocumento    : integer;
    iPlanilha     : integer;
    iCodDocumento : integer;
    iNumAp        : integer;
    dDataLancto   : TDateTime;

    Orcamento     : TOrcamentoBack;

    procedure AbreTabelas;
    procedure FechaTabelas;
    procedure AbreTipoAlterador;
    procedure GravaLancamento(iDocumento: integer);
    procedure VerificaContaBancaria;
    procedure CalculaDataCtbDiaria;    

    function  VerificaPreenchimento: Boolean;
    function  VerificaPreenchimentoAlterador: Boolean;
    function  VerificaTipoImoveisLanc : Boolean;
    function  VerificaFechamentoDiario(const dDataFim: TDateTime): Boolean;
    function  BuscaContratoImovel(const iIdImovel: Integer): Boolean;
    function  TotalizaRateio(var fTotalRateio: Extended): Boolean;
    function  RefazRateio: Extended;
    function  GeraLancamentos: shortint;
    function  BuscaNumAp(const iDocumento: Integer): Integer;
    function  ExcluiDocumentoAnterior : Boolean;
    function  ContinuaPagSelecao : Boolean;
    function  ContinuaPagImovel  : Boolean;
    function  VoltaPagImovel     : Boolean;
  public
    { Public declarations }
  end;

var
  frmExecLancMultDespAlt: TfrmExecLancMultDespAlt;

implementation

{$R *.DFM}

uses
   USistema, UMensErro, UDatabase, UComunsImobiliario, uVerificaPreenchimento, UModulo, UDiasInUteis,
   dImobiliario, dLookImobiliario, uFuncoesImob, uDocumento, uMolduras,
   DMS, dLancImovel, dRelLancamento, uCMRptManager, uImpostoRetido, uModuloImobiliario,
   FProgresso, fAguarde;

procedure TfrmExecLancMultDespAlt.FormCreate(Sender: TObject);
begin
  inherited;
  molFornecedor1.iFornecedor := -1;
  lblIntegrado.Visible       := False;

  if ModuloImobiliario.AdminImob.bFlgHistContDifAP then
       memObs.MaxLength := 1000    // histórico contábil (concatenado) <> obs ap
  else memObs.MaxLength := 200;    // histórico contábil = obs ap

  // Apenas exibe o período da Ctb diária, se o mesmo estiver ativado no parâmetro
  if ModuloImobiliario.AdminImob.bFlgDiario then begin
     gbPeriodoCtbDiaria.Visible := True;
     lblReferenciaAP.Top        := 246;
     edtReferenciaAP.Top        := 260;
     lblCentroCusto.Top         := 286;
     dbcboCentroCusto.Top       := 300;
     chkContrato.Top            := 301;
     chkContrato.Left           := 360;
  end else begin
     gbPeriodoCtbDiaria.Visible := False;
     lblReferenciaAP.Top        := 206;
     edtReferenciaAP.Top        := 220;
     lblCentroCusto.Top         := 246;
     dbcboCentroCusto.Top       := 260;
     chkContrato.Top            := 301;
     chkContrato.Left           := 16;
  end;

  // Habilita o Nr. do Orçamento apenas quando a integração estiver ligada
  molOrcamento1.Clear;
  if ModuloImobiliario.AdminImob.bFlgIntegraOrcamen then begin
     Orcamento := TOrcamentoBack.Create;
     molOrcamento1.Visible := True;
     lblIntegrado.Left := 511;
  end else begin
     molOrcamento1.Visible := False;
     lblIntegrado.Left := 623;
  end;
end;

procedure TfrmExecLancMultDespAlt.FormShow(Sender: TObject);
begin
  inherited;
  IrParaPagina(0);
  btnProcurar.Enabled  := True;
  btnContinuar.Enabled := False;
  AbreTabelas;
end;

procedure TfrmExecLancMultDespAlt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModuloImobiliario.AdminImob.bFlgIntegraOrcamen then FreeAndNil( Orcamento );
  if ( (qryRateio.Active) and (qryRateio.UpdatesPending) ) then qryRateio.CancelUpdates;
  FechaTabelas;
  inherited;  
end;

procedure TfrmExecLancMultDespAlt.AbreTabelas;
var
   sGrupoAnt   : string;
   sRecDesAnt  : string;
   sFormaAnt   : string;
   sCCAnt      : string;
begin
   // Parametros do Sistema
   dtmImobiliario.qryParamImob.Close;
   ParametrosSistema;

   // Tipo de Despesa
   if DBcboTipoRecDes.LookupValue <> '' then sRecDesAnt := DBcboTipoRecDes.LookupValue;
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString := 'C';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;
   if length(trim(sRecDesAnt)) > 0 then DBcboTipoRecDes.LookupValue := sRecDesAnt;

   // Forma de Pagamento
   if DBcboFormaRecPag.LookupValue <> '' then sFormaAnt := DBcboFormaRecPag.LookupValue;
   with dtmLookImobiliario.qryLookFormaRecPag do begin
      LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString     := 'P';
      Open;
   end;
   if length(trim(sFormaAnt)) > 0 then DBcboFormaRecPag.LookupValue := sFormaAnt;

   // Centro de Custo
   if DBcboCentroCusto.LookupValue <> '' then sCCAnt := DBcboCentroCusto.LookupValue;
   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   // alteradores
   with qryAlterador do begin
      LimpaParametros(qryAlterador);
      ParamByName('PIDDOCUMENTO').AsInteger := -1;
      Open;
   end;

   // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
   if length(trim(sCCAnt)) > 0 then begin
      DBcboCentroCusto.LookupValue := sCCAnt;
   end else begin
      if not(dtmImobiliario.qryParamImobCODCENTROCUSTO.isNULL) then begin
         DBcboCentroCusto.LookupValue := dtmImobiliario.qryParamImobCODCENTROCUSTO.AsString;
      end;
   end;
end;



procedure TfrmExecLancMultDespAlt.FechaTabelas;
begin
  qryRateio.Close;
  qryAlterador.Close;

  dtmLookImobiliario.qryLookFormaRecPag.Close;
  dtmLookImobiliario.qryLookTipoRecDes.Close;

  dtmImobiliario.qryParamImob.Close;
  dtmLookImobiliario.qryLookContaBancaria.Close;
end;

function TfrmExecLancMultDespAlt.VerificaPreenchimento: Boolean;
var
  iDia, iMes, iAno, iDifMeses, iAnoComp, iMesComp: word;
  dDia1, dDia2: TDateTime;
  iAnoMesComp, iAnoMesIniCtb, iAnoMesFimCtb : Integer;
begin
   Result := False;
   try
      iAnoComp := Word(trunc(DBspnAno.Value));
      iMesComp := cboMes.ItemIndex + 1;

      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Despesa a ser rateada!', DBcboTipoRecDes);

      if ( molFornecedor1.iFornecedor = -1 ) then
         raise EValidacao.CreateVal('É necessário indicar o Fornecedor/Favorecido!', molFornecedor1.btnBuscaForn);

      if ( dbCboContaBancaria.Enabled ) and ( dbCboContaBancaria.LookupValue = '' ) then
         raise EValidacao.CreateVal('É necessário a conta bancária!', dbCboContaBancaria);

      if (edtVlrTotal.Value <= 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor Total a ser rateado!', edtVlrTotal);

      if (cboMes.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if (length(trim(edtDataVenc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if (length(trim(edtDataLanc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLanc);

      DecodeDate(edtDataLanc.Date, iAno, iMes, iDia);
      dDia1 := DiasInUteis.UltDiaMes (iAnoComp, iMesComp);
      if edtDataLanc.Date > dDia1 then
         raise EValidacao.CreateVal('A data de lançamento não pode ser após a sua competência!', edtDataLanc);

      if (iAno < DBspnAno.Value) or (iMes < cboMes.ItemIndex + 1) then
         if MsgDlg ('A data de lançamento esta digitada antes do vencimento. Continua?', 'AdminImob', mtConfirmation, [mbyes,mbno], 0) = MrNo then
           raise EValidacao.CreateVal('Altere data de Lançamento.', edtDataLanc);

      { 20/06
        se possui contabilização diária
           se despesas/receitas com periodicidade mensal
              a competencia do lançamento somente pode ser igual a competencia
              atual ou no máximo um mês apos
      }
      if ModuloImobiliario.AdminImob.bFlgDiario then begin

         if (edtDtinictbdiaria.Date > edtDtfimctbdiaria.Date) then
            raise EValidacao.CreateVal('Data de início da Contabilização diária não deve ser superior a data de término!', edtDtfimctbdiaria);

         if dtmLookImobiliario.qryLookTipoRecDesFLGDIARIO.AsString = 'M' then begin
            dDia1 := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                                ModuloImobiliario.AdminImob.iMesCompetencia, 1);
            dDia2 := EncodeDate(iAnoComp, iMesComp, 1);

            // só verificar se o lançamento for na competencia superior ao inicio da implementação na Fundação
            if dDia2 >= StrToDate('01/11/2002') then begin
               if dDia2 < dDia1 then begin  // tentativa de lançar em um mes anterior
                  raise EValidacao.CreateVal('A competência selecionada já foi encerrada!', edtDataLanc);
               end else begin
                  iDifMeses := DiasInUteis.IntervaloMeses(dDia1, dDia2);
                  if iDifMeses <= ModuloImobiliario.AdminImob.iMesBloqLancto then
                     MsgDlg('A competência selecionada ainda não foi inicializada, execute o fechamento mensal!', 'Informação', mtInformation, [mbok], 0)
                  else if iDifMeses > ModuloImobiliario.AdminImob.iMesBloqLancto then
                     raise EValidacao.CreateVal('A competência selecionada ainda não foi inicializada, execute o encerramento mensal!', edtDataLanc);
               end;
            end;

            // O período da contabilização diária deve estar dentro da competencia
            DecodeDate(edtDtinictbdiaria.Date, iAno, iMes, iDia);
            if (iAno <> iAnoComp) or (iMes <> iMesComp) then
               raise EValidacao.CreateVal('Data de início da Contabilização diária deve estar dentro da Competência!', edtDtinictbdiaria);

            DecodeDate(edtDtfimctbdiaria.Date, iAno, iMes, iDia);
            if (iAno <> iAnoComp) or (iMes <> iMesComp) then
               raise EValidacao.CreateVal('Data de término da Contabilização diária deve estar dentro da Competência!', edtDtfimctbdiaria);

         end else if dtmLookImobiliario.qryLookTipoRecDesFLGDIARIO.AsString = 'A' then begin
            // A competência do Lançamento deve estar compreendida entre o período da
            // contabilização diária
            iAnoMesComp   := StrToInt(FormatFloat('0999',iAnoComp) + FormatFloat('09',iMesComp));
            DecodeDate(edtDtinictbdiaria.Date, iAno, iMes, iDia);
            iAnoMesIniCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));
            DecodeDate(edtDtfimctbdiaria.Date, iAno, iMes, iDia);
            iAnoMesFimCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));

            if (iAnoMesComp < iAnoMesIniCtb) or (iAnoMesComp > iAnoMesFimCtb) then
               raise EValidacao.CreateVal('A Competência deve estar compreendida entre o período da Contabilização Diária!', edtDtInictbdiaria);
         end;
      end;

      // verifica se o vencimento escolhido é um dia inútil
      if ModuloImobiliario.AdminImob.bFlgDiaUtilAP then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if ModuloImobiliario.AdminImob.bFlgUsaAP then begin
         if (DBcboFormaRecPag.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento!', DBcboFormaRecPag);

         if (length(trim(edtReferenciaAP.Text)) = 0) then
            raise EValidacao.CreateVal('É necessário indicar a Referência / Processo!', edtReferenciaAP);

         if (DBcboCentroCusto.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);
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



function TfrmExecLancMultDespAlt.VerificaPreenchimentoAlterador: Boolean;
var fValor: Extended;
begin
   Result := False;
   try
      if (DBcboAlterador.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o alterador!', DBcboAlterador);

      try
         fValor := StrToFloat(edtValor.Text);
      except
         fValor := 0;
      end;

      if fValor = 0 then
         raise EValidacao.CreateVal('É necessário indicar um valor válido!', edtValor);
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

function TfrmExecLancMultDespAlt.VerificaTipoImoveisLanc: Boolean;
var sTipoImovelAnt, sTipoImovelAtual : string;
begin
   Result := False;

   if not ModuloImobiliario.AdminImob.bFlgMultiTipo then begin
      try
         with qryRateio do begin
            First;
            sTipoImovelAnt := qryRateioCODTIPIMOVEL.AsString;
            while not EOF do begin
               sTipoImovelAtual := qryRateioCODTIPIMOVEL.AsString;

               if (sTipoImovelAtual <> sTipoImovelAnt) then
                  raise Exception.Create('Para efetuar o lançamento é necessário que TODOS os Imóveis sejam do mesmo Tipo!');
               Next;
            end;
         end;
      except
         on e: Exception do begin
            MsgDlg(e.message, 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            Exit;
         end;
      end;
      sTipoImovel := sTipoImovelAnt;
   end else sTipoImovel := qryRateioCODTIPIMOVEL.AsString;
   Result := True;
end;

function TfrmExecLancMultDespAlt.TotalizaRateio(var fTotalRateio: Extended): Boolean;
begin
   Result        := True;
   fTotalRateio  := 0;
   Screen.Cursor := crHourGlass;

   qryRateio.DisableControls;
   qryRateio.First;
   while not qryRateio.EOF do begin
      fTotalRateio := fTotalRateio + Arredonda(qryRateioVALOR.AsFloat, 2);
      if (qryRateioIDCONTRATOIMOVEL.IsNull) and (chkContrato.Checked) then Result := False;
      qryRateio.Next;
   end;
   qryRateio.First;
   qryRateio.EnableControls;

   fTotalRateio         := Arredonda(fTotalRateio, 2);
   edtTotalLanc.Value   := fTotalRateio;

   Screen.Cursor := crDefault;
end;

procedure TfrmExecLancMultDespAlt.AbreTipoAlterador;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin
      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);
      ParamByName('PCODTIPIMOVEL').AsString     := sTipoImovel;
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString           := 'P';

      case rdgAcreDesc.ItemIndex of
         0: ParamByName('PACRESDECRES').AsString   := 'C'; // Acréscimo
         1: ParamByName('PACRESDECRES').AsString   := 'D'; // Desconto
      end;
      Open;
   end;
end;

function TfrmExecLancMultDespAlt.RefazRateio: Extended;
var fTotLanc : Extended;
begin
   LimpaParametros(qryRateio);
   qryRateio.ParamByName('PIDDOCUMENTO').AsInteger := iDocumento;
   qryRateio.Open;

   fTotLanc := 0;
   chkContrato.Checked := True;
   qryRateio.First;
   while not(qryRateio.EOF) do begin
      fTotLanc := fTotLanc + qryRateioVALOR.AsFloat;
      if qryRateioIDCONTRATOIMOVEL.IsNull then chkContrato.Checked := False;
      qryRateio.Next;
   end;
   Result := fTotLanc;
end;

//--------------------------------------------------------------------------------------------------
// Retorno:  0 :  lançamentos gerados sem ocorrências
//          -1 :  lançamentos gerados mas houve ocorrências
//          -2 :  erro fatal: lançamentos NÃO gerados
//--------------------------------------------------------------------------------------------------
function TfrmExecLancMultDespAlt.GeraLancamentos: shortint;
var fPercentRateio, fSobraRateio  : double;
    fCount, fAtual                : Integer;
    sErro                         : string;
begin
   Result := 0;
   fCount := qryRateio.RecordCount;

   // Exibe caixa de dialogo com a barra de progresso
   frmProgresso.MostraFormProgresso('Gerando Lançamentos...',False,False);
   Application.ProcessMessages;

   try
      try
         fSobraRateio := edtTotalLanc.Value;

         // insere a Observação na tabela ObsLancImovel
         if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

         fAtual := 0;
         qryRateio.First;
         while ( (Result > -2) and not(qryRateio.EOF) ) do begin

            // ProgressBar
            frmProgresso.AndaFormProgresso( fAtual, fCount );

            if Result > -2 then begin

               // Se o resultado for ZERO, não gerar lançamento
               // No caso de rateio de contrato existem rateios com 0% (CONTRATOXIMOVEL.CIMPERCENTRATEIO)
               if qryRateioVALOR.AsFloat <> 0 then begin

                  GravaLancamento(iDocumento);

               end else begin

                  // Registro de ocorrência (NÃO ERRO) por valor fZERO
                  sErro := '- Valor ZERO --> ' + qryRateioIMOVEL_EXTENSO.AsString;
                  if not(qryRateioIDCONTRATOIMOVEL.isNULL) then sErro := sErro + ', ' + qryRateioCONTRATO_EXTENSO.asString;
                  memErro.Lines.Add(sErro + ';' + #13);
                  Result := -1;
               end;
            end;
            qryRateio.Next;
            fAtual := fAtual + 1;
         end;
      except
         Result := -2;
         Raise;
         Repaint;
      end;
   finally
      frmProgresso.EscondeFormProgresso;
   end;
end;

procedure TfrmExecLancMultDespAlt.GravaLancamento(iDocumento: integer);
begin
   with dtmLancImovel.qryInsertLancImovel do begin
      LimpaParametros(dtmLancImovel.qryInsertLancImovel);

      ParamByName('PIDLANCIMOVEL').AsInteger      := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');

      if dbCboContaBancaria.Value <> '' then
         ParamByName('PIDCBANCARIA').AsInteger    := StrToInt(dbCboContaBancaria.LookupValue);

      ParamByName('PRECPAG').AsString             := 'P';

      ParamByName('PIDPESSOA').AsInteger          := Sistema.idEmpresa;
      ParamByName('PIDFORCLI').AsInteger          := molFornecedor1.iFornecedor;

      ParamByName('PIDIMOVEL').AsInteger          := qryRateioIDIMOVEL.AsInteger;
      ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);

      // Contrato pode ser preenchido ou não
      if ( not(qryRateioIDCONTRATOIMOVEL.isNULL) and (qryRateioIDCONTRATOIMOVEL.AsInteger > 0) ) then
      ParamByName('PIDCONTRATOIMOVEL').AsInteger   := qryRateioIDCONTRATOIMOVEL.AsInteger;

      ParamByName('PDATALANCAMENTO').AsDateTime    := edtDataLanc.Date;
      ParamByName('PDATAVENCIMENTO').AsDateTime    := edtDataVenc.Date;

      ParamByName('PVLRLANCOMPAGAR').AsFloat       := qryRateioVALOR.AsFloat;
      ParamByName('PVLRLANCPAGAR').AsFloat         := qryRateioVALOR.AsFloat;
      ParamByName('PMESREFERENCIA').AsInteger      := DiasInUteis.ExtraiMes(edtDataVenc.Date);
      ParamByName('PANOREFERENCIA').AsInteger      := DiasInUteis.ExtraiAno(edtDataVenc.Date);
      ParamByName('PMESCOMPETENCIA').AsInteger     := cboMes.ItemIndex + 1;
      ParamByName('PANOCOMPETENCIA').AsInteger     := word(trunc(DBspnAno.Value));
      ParamByName('PMOEDAPAGAR').AsInteger         := Modulo.iMoedaCorrente;
      ParamByName('PFLGINTEGRADO').AsInteger       := 0;   // lançamento não integrado.
      ParamByName('PIDUSUARIOSISTEMA').AsInteger   := Sistema.IdUsuario;
      ParamByName('PFLGORIGEMLANC').AsString       := 'M'; // M = Lançamentos Múltiplos
      ParamByName('PNODOCUMENTO').AsFloat          := StrToFloat(edtNumDocumento.Text);
      ParamByName('PIDDocumento').AsInteger        := iDocumento;

      // Período para contabilização diária
      ParamByName('PDTINICTBDIARIA').AsDateTime    := edtDtinictbdiaria.Date;
      ParamByName('PDTFIMCTBDIARIA').AsDateTime    := edtDtfimctbdiaria.Date;

      if iNumAp > 0 then
        ParamByName('PNUMAPALT').AsInteger         := iNumAp;

      // Número da Reserva orçamentária
      if molOrcamento1.iIdCompromisso > 0 then
        ParamByName('PIDRESERVAORCAMEN').AsFloat   := molOrcamento1.iIdCompromisso;

      // campos novos (André Pontes)
      ParamByName('PCODFORMA').AsInteger           := StrToInt(DBcboFormaRecPag.LookupValue);
      ParamByName('PREFERENCIAAP').AsString        := edtReferenciaAP.Text;
      ParamByName('PCODCENTROCUSTO').AsString      := DBcboCentroCusto.LookupValue;
      ParamByName('PIDMODULO').AsInteger           := Sistema.IdModulo;

      ExecSQL;
   end;
end;


procedure TfrmExecLancMultDespAlt.DBgrdLancamentosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmExecLancMultDespAlt.DBgrdLancamentosTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecLancMultDespAlt.cboMesChange(Sender: TObject);
begin
  inherited;
  edtDataLanc.Date := FuncoesImob.DataLancamento((cboMes.ItemIndex + 1), word(trunc(DBspnAno.Value)), edtDataVenc.Date);
  CalculaDataCtbDiaria;  
end;

procedure TfrmExecLancMultDespAlt.btnInsereImovelClick(Sender: TObject);
var iImovel  : integer;
    MS_      : TMontaSelect;
    iIndiceCodTipImovel: integer;
begin
   inherited;
   // verifica se é necessário indicar o contrato nos Lançamentos a pagar
   if chkContrato.Checked then begin
      // verifica se é possível indicar um contrato já encerrado nos Lançamentos a pagar
      if ModuloImobiliario.AdminImob.bFlgLancPagEncerra then
           MS_ := dtmMS.MS_ImovelContrato
      else MS_ := dtmMS.MS_ImovelContratoV;
      iIndiceCodTipImovel := 8;
   end else begin
      if ModuloImobiliario.AdminImob.bFlgLancPagInativo then
           MS_ := dtmMS.MS_Imovel
      else MS_ := dtmMS.MS_ImovelAtivo;
      iIndiceCodTipImovel := 4;
   end;

   MS_.Executar;
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if MS_.RetornouValor then begin
      Screen.Cursor := crHourGlass;


         // Imóvel
         qryRateio.Insert;
         qryRateioIDIMOVEL.AsInteger      := StrToInt(MS_.ValoresChave[1]);
         qryRateioIMOVEL_EXTENSO.AsString := MS_.ValoresChave[2] + ' - ' + MS_.ValoresChave[3];

         // Contrato
         if chkContrato.Checked then begin
            if StrToInt(MS_.ValoresChave[0]) > 0 then begin
               qryRateioIDCONTRATOIMOVEL.asInteger := StrToInt(MS_.ValoresChave[0]);
               qryRateioCONNUMERO.AsString         := MS_.ValoresChave[4];
               qryRateioCONNOME.AsString           := MS_.ValoresChave[5];
               qryRateioCONTRATO_EXTENSO.AsString  := MS_.ValoresChave[4] + ' - ' + MS_.ValoresChave[5];
            end;
         end else begin
            BuscaContratoImovel( qryRateioIDIMOVEL.AsInteger );
         end;

         qryRateioCODTIPIMOVEL.AsString := MS_.ValoresChave[iIndiceCodTipImovel];

         // Verifica se o Imóvel está ativo
         if MS_ <> dtmMS.MS_ImovelAtivo then begin
            if ( (MS_ <> dtmMS.MS_Imovel) and (MS_.ValoresChave[6] <> '1') ) or
                 (MS_ =  dtmMS.MS_Imovel) then begin
               if not ModuloImobiliario.AdminImob.bFlgLancPagInativo then begin
                  Screen.Cursor := crDefault;
                  MsgDlg('O Imóvel escolhido não está ativo! Não é possível atribuir-lhe uma despesa.', 'Aviso', mtWarning, [mbOk], 0);
                  Repaint;
                  qryRateio.Cancel;
                  Exit;
               end else begin
                 // Marca o documento para liberação
               end;
            end;
         end;
         qryRateio.Post;
      Screen.Cursor := crDefault;
   end else begin
      // cancela a inserção na query
      qryRateio.Cancel;
   end;
end;

procedure TfrmExecLancMultDespAlt.btnExcluiImovelClick(Sender: TObject);
var fTotalRateio : Extended;
begin
   if not qryRateio.isEmpty then begin
      inherited;
      Screen.Cursor := crHourGlass;
      qryRateio.Delete;
      if not qryRateio.isEmpty then begin
         TotalizaRateio( fTotalRateio );
      end else begin
         edtVlrTotal.Value  := 0;
         edtTotalLanc.Value := 0;
      end;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmExecLancMultDespAlt.btnTotalizaClick(Sender: TObject);
var fTotalRateio : Extended;
begin
   inherited;
   TotalizaRateio( fTotalRateio );
end;

procedure TfrmExecLancMultDespAlt.rdgAcreDescClick(Sender: TObject);
begin
  inherited;
  AbreTipoAlterador;
end;

procedure TfrmExecLancMultDespAlt.VerificaContaBancaria;
begin
   if (molFornecedor1.iFornecedor <> -1) and (DBcboFormaRecPag.LookupValue <> '') and (dtmLookImobiliario.qryLookFormaRecPagFLGDADOSBANCARIOS.AsString = 'S') then begin

      lblContaBancaria.Enabled := true;
      dbCboContaBancaria.Enabled := true;

      LimpaParametros(dtmLookImobiliario.qryLookContaBancaria);
      dtmLookImobiliario.qryLookContaBancaria.ParamByName('PIDPESSOA').AsInteger := molFornecedor1.iFornecedor;
      dtmLookImobiliario.qryLookContaBancaria.Open;
      if dtmLookImobiliario.qryLookContaBancaria.RecordCount > 1 then begin
         dtmLookImobiliario.qryLookContaBancaria.First;
         while not dtmLookImobiliario.qryLookContaBancaria.Eof do begin
            if dtmLookImobiliario.qryLookContaBancariaFLGCONTAPREF.AsInteger = 1 then begin
               dbCboContaBancaria.LookupValue := inttostr(dtmLookImobiliario.qryLookContaBancariaIDCBANCARIA.AsInteger);
               exit;
            end;
            dtmLookImobiliario.qryLookContaBancaria.Next;
         end;
      end else if dtmLookImobiliario.qryLookContaBancaria.RecordCount = 1 then begin
         dbCboContaBancaria.LookupValue := inttostr(dtmLookImobiliario.qryLookContaBancariaIDCBANCARIA.AsInteger);
      end;
   end else begin
      lblContaBancaria.Enabled   := False;
      dbCboContaBancaria.Enabled := False;
      dtmLookImobiliario.qryLookContaBancaria.Close;
      dbCboContaBancaria.LookupValue := '';
   end;
end;

procedure TfrmExecLancMultDespAlt.molFornecedor1btnBuscaFornClick(Sender: TObject);
begin
  inherited;
  molFornecedor1.btnBuscaFornClick(Sender);
  VerificaContaBancaria;
end;

procedure TfrmExecLancMultDespAlt.bbtnInsereAlteradorClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimentoAlterador then begin
      qryAlterador.Insert;
      qryAlteradorCODALTERADOR.AsInteger := strtoint(DBcboAlterador.LookupValue);
      qryAlteradorIDDOCUMENTO.AsInteger  := iDocumento;
      qryAlteradorVLRALTERADOR.AsFloat   := StrToFloat(edtValor.Text);
      qryAlteradorDESCRICAO.AsString     := DBcboAlterador.Text;
      qryAlterador.Post;
   end;
end;

procedure TfrmExecLancMultDespAlt.btnExcluiAlteradorClick(Sender: TObject);
begin
  inherited;
  qryAlterador.Delete;
end;

procedure TfrmExecLancMultDespAlt.DBcboFormaRecPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  VerificaContaBancaria;
end;

procedure TfrmExecLancMultDespAlt.btnProcurarClick(Sender: TObject);
var dDataFim : TDateTime;
begin
   inherited;
   MS_Lancamento.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   if MS_Lancamento.RetornouValor then begin
      LimpaParametros(dtmLancImovel.qryLancImovel);
      dtmLancImovel.qryLancImovel.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
      dtmLancImovel.qryLancImovel.ParamByName('PIDLANCIMOVEL').AsInteger := StrToIntDef(MS_Lancamento.ValoresChave[0],-1);
      dtmLancImovel.qryLancImovel.Open;

      // Verifica se a contabilização diária já está fechada
      if dtmLancImovel.qryLancImovelDTFIMCTBDIARIA.IsNull then
           dDataFim := -1
      else dtmLancImovel.qryLancImovelDTFIMCTBDIARIA.AsDateTime;
      if not VerificaFechamentoDiario(dDataFim) then Exit;

      // Verifica se o lançamento já foi integrado e guarda o nr. da AP
      if dtmLancImovel.qryLancImovelFLGINTEGRADO.IsNull then begin
         // Guarda o Nr. da AP já impressa
         iNumAp := BuscaNumAp(dtmLancImovel.qryLancImovelCODDOCUMENTO.AsInteger);
         lblIntegrado.Caption := 'Integrado';
      end else begin
         if dtmLancImovel.qryLancImovelNUMAPALT.IsNull then
              iNumAp := -1
         else iNumAp := dtmLancImovel.qryLancImovelNUMAPALT.AsInteger;
         lblIntegrado.Caption := 'Não Integrado';
      end;
      if iNumAp > 0 then
           edtNumAP.Text := IntToStr(iNumAp)
      else edtNumAp.Clear;
      lblIntegrado.Visible := True;

      // atribuir valores antigos
      DBcboTipoRecDes.LookupValue := dtmLancImovel.qryLancImovelIDTIPOCUSTORECIMO.AsString;
      molFornecedor1.iFornecedor  := dtmLancImovel.qryLancImovelIDFORCLI.AsInteger;
      AtribuiMolFornecedor(molFornecedor1.iFornecedor, molFornecedor1.edtNomeFantasia, molFornecedor1.edtRazaoSocial);

      iDocumento                     := dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger;
      iCodDocumento                  := dtmLancImovel.qryLancImovelCODDOCUMENTO.AsInteger;
      dDataLancto                    := dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime;
      edtNumDocumento.Text           := dtmLancImovel.qryLancImovelNODOCUMENTO.AsString;
      DBcboFormaRecPag.LookupValue   := dtmLancImovel.qryLancImovelCODFORMA.AsString;

      if not dtmLancImovel.qryLancImovelPLNCODIGO.IsNull then
           iPlanilha := dtmLancImovel.qryLancImovelPLNCODIGO.AsInteger
      else iPlanilha := -1;

      if not dtmLancImovel.qryLancImovelCODDOCUMENTO.IsNull then
           iCodDocumento := dtmLancImovel.qryLancImovelCODDOCUMENTO.AsInteger
      else iCodDocumento := -1;

      molOrcamento1.Clear;
      if not dtmLancImovel.qryLancImovelIDRESERVAORCAMEN.IsNull then begin
         molOrcamento1.iIdCompromisso   := dtmLancImovel.qryLancImovelIDRESERVAORCAMEN.AsInteger;
         molOrcamento1.iNumCompromisso  := Orcamento.BuscaIdNumReserva(StrToInt(FloatToStr(molOrcamento1.iIdCompromisso)), 0, True);
         molOrcamento1.edtCompOrc.Value := molOrcamento1.iNumCompromisso;
      end;

      // conta bancaria = o componente pode estar not enabled
      VerificaContaBancaria;  // ativa o combo conta bancária
      dbCboContaBancaria.LookupValue := dtmLancImovel.qryLancImovelIDCBANCARIA.AsString;

      cboMes.ItemIndex               := dtmLancImovel.qryLancImovelMESCOMPETENCIA.AsInteger - 1;
      DBspnAno.Value                 := dtmLancImovel.qryLancImovelANOCOMPETENCIA.AsInteger;
      edtDataVenc.Date               := dtmLancImovel.qryLancImovelDATAVENCIMENTO.AsDateTime;
      edtDataLanc.Date               := dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime;
      edtReferenciaAP.Text           := dtmLancImovel.qryLancImovelREFERENCIAAP.AsString;
      DBcboCentroCusto.LookupValue   := dtmLancImovel.qryLancImovelCODCENTROCUSTO.AsString;
      edtDtinictbdiaria.Date         := dtmLancImovel.qryLancImovelDTINICTBDIARIA.AsDateTime;
      edtDtfimctbdiaria.Date         := dtmLancImovel.qryLancImovelDTFIMCTBDIARIA.AsDateTime;
      memObs.Text                    := FuncoesImob.SelectObsLanc(iDocumento);

      if edtDtinictbdiaria.Text = '' then begin
         edtDtinictbdiaria.Enabled := False;
         edtDtfimctbdiaria.Enabled := False;
      end;

      edtVlrTotal.Value := RefazRateio;

      // ABRE QUERY ALTERADORES
      LimpaParametros(dtmLancImovel.qrySelectAlteraLanc);
      dtmLancImovel.qrySelectAlteraLanc.ParamByName('PIDDOCUMENTO').AsInteger := iDocumento;
      dtmLancImovel.qrySelectAlteraLanc.Open;

      // fazer um refresh na qryAlterador
      LimpaParametros(qryAlterador);
      qryAlterador.Open;

      while not dtmLancImovel.qrySelectAlteraLanc.Eof do begin
         qryAlterador.Insert;
         qryAlteradorCODALTERADOR.AsInteger := dtmLancImovel.qrySelectAlteraLancCODALTERADOR.AsInteger;
         qryAlteradorIDDOCUMENTO.AsInteger  := iDocumento;
         qryAlteradorVLRALTERADOR.AsFloat   := dtmLancImovel.qrySelectAlteraLancVLRALTERADOR.AsFloat;
         qryAlteradorDESCRICAO.AsString     := dtmLancImovel.qrySelectAlteraLancDESCRICAO.AsString;
         qryAlterador.Post;

         dtmLancImovel.qrySelectAlteraLanc.Next;
      end;
      dtmLancImovel.qrySelectAlteraLanc.Close;

      panLancamentos.Enabled := True;
      btnContinuar.Enabled   := True;
   end;
end;

function TfrmExecLancMultDespAlt.BuscaNumAp(const iDocumento: Integer): Integer;
var sSql : String;
begin
   Result := -1;
   sSql := 'SELECT NUMAPGR FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
   FazQuery(dtmImobiliario.qryAux, sSql);
   if ( not dtmImobiliario.qryAux.IsEmpty ) and ( dtmImobiliario.qryAux.FieldByName('NUMAPGR').AsInteger > 0 ) then begin
      Result := dtmImobiliario.qryAux.FieldByName('NUMAPGR').AsInteger;
   end;
end;

function TfrmExecLancMultDespAlt.ExcluiDocumentoAnterior: Boolean;
var bCapCar, bContab : Boolean;
    iResult : Integer;
    sErro   : String;
begin
  Result := True;
  Screen.Cursor := crHourGlass;
  try
     try
        frmAguarde.Mostra('Excluindo o documento anterior... ');

        if iCodDocumento > 0 then
             bCapCar := True
        else bCapCar := False;

        if iPlanilha > 0 then
             bContab := True
        else bContab := False;

        // Exclui o(s) lançamento(s)
        if FuncoesImob.ExcluiLancImovel(iDocumento, iPlanilha, dDataLancto,
                                        bCapCar, bContab, sErro) <> 0 then begin
           raise Exception.Create('Erro na exclusão do(s) Lançamento(s)' + #13#10 + sErro);
        end;
     except
        on e:Exception do begin
          Result := False;
          MsgDlg(e.Message,'Erro',mtError, [mbOk], 0);
        end;
     end;
  finally
     frmAguarde.Apaga;
     Screen.Cursor := crDefault;
  end;
end;

function TfrmExecLancMultDespAlt.VerificaFechamentoDiario(const dDataFim: TDateTime): Boolean;
var iDia, iMes, iAno: word;
    dDia1, dDia2: TDateTime;
begin
   Result := True;
   if ModuloImobiliario.AdminImob.bFlgDiario then begin
      if dDataFim > 0 then begin
         DecodeDate(dDataFim, iAno, iMes, iDia);
         dDia1 := EncodeDate(iAno, iMes, 1);
         dDia2 := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                             ModuloImobiliario.AdminImob.iMesCompetencia, 1);

         if dDia1 < dDia2 then begin
            MsgDlg('A Competência já foi encerrada, o lançamento não poderá ser alterado','Aviso',mtWarning,[mbok],0);
            Result := False;
         end;
      end;
   end;
end;

procedure TfrmExecLancMultDespAlt.btnContinuarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
     0 : if ContinuaPagSelecao then inherited;
     1 : if ContinuaPagImovel  then inherited;
  end;
end;

procedure TfrmExecLancMultDespAlt.btnVoltarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
     1 : if VoltaPagImovel then inherited;
     2 : if VoltaPagImovel then inherited;
  end;
end;

function TfrmExecLancMultDespAlt.ContinuaPagImovel: Boolean;
var fTotalRateio : Extended;
begin
   Result := False;
   if not VerificaTipoImoveisLanc then exit;

   if not TotalizaRateio( fTotalRateio ) then begin
     MsgDlg('Existem imóveis no grupo que não estão locados, ' +#13+
            'sendo que este lançamento obriga a informação do contrato', 'Aviso', mtWarning, [mbok], 0);
     exit;
   end;

   // o total lançado tem que bater com o total do lançamento
   if Arredonda(fTotalRateio,2) <> Arredonda(edtVlrTotal.Value,2) then begin
      MsgDlg('Total do lançamento não confere com o valor lançado.','Aviso',mtwarning,[mbok],0);
      exit;
   end;

   AbreTipoAlterador;
   Result := True;
end;

function TfrmExecLancMultDespAlt.ContinuaPagSelecao: Boolean;
begin
   Result := False;
   // Confirma a alteração de um documento já integrado
   if lblIntegrado.Caption = 'Integrado' then begin
      if MsgDlg('A alteração de um documento já integrado implicará na EXCLUSÃO ' + #13#10 +
                'das integrações já realizadas, sendo necessário que o documento' + #13#10 +
                'seja integrado novamente. Confirma ? ', 'Atenção', mtWarning, [mbYes, mbNo],0) = mrNo then begin
         Exit;
      end;
   end;
   // Abre a query de rateio imovel
   if VerificaPreenchimento then begin
      Result := True;
      btnProcurar.Enabled := False; 
   end;
end;

function TfrmExecLancMultDespAlt.VoltaPagImovel: Boolean;
begin
  if PagControle.ActivePageIndex = 1 then btnProcurar.Enabled := True;  ;
  Result := True;
end;

procedure TfrmExecLancMultDespAlt.btnConfirmarClick(Sender: TObject);
var sMsg: string;
    fTotalRateio : Extended;
begin
   if not VerificaTipoImoveisLanc then exit;

   TotalizaRateio( fTotalRateio );

   // o total lançado tem que bater com o total do lançamento
   if Arredonda(fTotalRateio,2) <> Arredonda(edtVlrTotal.Value,2) then begin
      MsgDlg('Total do lançamento não confere com o valor lançado.','Aviso',mtwarning,[mbok],0);
      exit;
   end;

   // Busca ID da reserva de orçamento caso tenha sido digitado, ao invés de buscar no MontaSelect
   molOrcamento1.iIdCompromisso := Orcamento.BuscaIdNumReserva(0, StrToInt(FloatToStr(molOrcamento1.edtCompOrc.Value)), True);

   StartTransacao;

   try
      if not ExcluiDocumentoAnterior then raise Exception.Create('Erro na Exclusão do Lançamento');

      iResult := GeraLancamentos;
      if iResult > -2 then begin

         CommitTransacao;

         if ( (qryAlterador.Active) and (qryAlterador.UpdatesPending) ) then begin
            qryAlterador.ApplyUpdates;
         end;

         if ( (iResult = 0) and (length(trim(memErro.Text)) = 0) ) then begin
            qryRateio.Close;

            Screen.Cursor := crDefault;
            if MsgDlg('Lançamento concluído. Deseja imprimir para conferência?', 'Pergunta', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                TdtmRelLancamento.PrintRelLancamento(iDocumento, -1, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
                       Sistema.IdModulo, '', '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo,
                       sMsg, nil, cntBDE, rdtScreen, true, true, true, false, nil, false);

            IrParaPagina(0);
            lblIntegrado.Caption := 'Não Integrado';
            btnProcurar.Enabled  := True;
            Repaint;
         end;
      end else begin
         abort;  // cai na exceção
      end;

   except
      RollBackTransacao;
      MsgDlg('Ocorreu um ERRO na tentativa de Alteração! O Lançamento não foi gerado.' +#13#10 +
             'Verifique as ocorrências geradas.', 'Erro', mtError, [mbOk], 0);
      IrParaPagina(1);
      pgcLancamentos.ActivePageIndex := 1;
      Repaint;
   end;
end;

function TfrmExecLancMultDespAlt.BuscaContratoImovel(const iIdImovel: Integer): Boolean;
var sSql : String;
begin
   Result := False;
   sSql := 'SELECT C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, '+#13+
           '       ( C.CONNUMERO || '' - '' || C.CONNOME ) AS CONTRATO_EXTENSO '+#13+
           '  FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI     '+#13+
           ' WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '+#13+
           '   AND C.FLGTIPOCONTRATO = ''L'' '+#13+
           '   AND C.FLGSTATUS = ''V''       '+#13+
           '   AND CXI.IDIMOVEL = ' + IntToStr( iIdImovel );

   if FazQuery(dtmImobiliario.qryAux, sSql ) then begin
      with dtmImobiliario.qryAux do begin
         if not IsEmpty then begin
            qryRateioIDCONTRATOIMOVEL.AsInteger := FieldByName('IDCONTRATOIMOVEL').AsInteger;
            qryRateioCONNUMERO.AsString         := FieldByName('CONNUMERO').AsString;
            qryRateioCONNOME.AsString           := FieldByName('CONNOME').AsString;
            qryRateioCONTRATO_EXTENSO.AsString  := FieldByName('CONTRATO_EXTENSO').AsString;
            Result := True;
         end;
      end;
   end;
end;

procedure TfrmExecLancMultDespAlt.CalculaDataCtbDiaria;
var iAnoComp, iMesComp : Integer;
begin
   if ModuloImobiliario.AdminImob.bFlgDiario then begin
      if (DBcboTipoRecDes.Text <> '') and (cboMes.Text <> '') and (DbspnAno.Value > 0) then begin
         iAnoComp := Word(trunc(DBspnAno.Value));
         iMesComp := cboMes.ItemIndex + 1;
         if dtmLookImobiliario.qryLookTipoRecDesFLGDIARIO.AsString = 'M' then begin
            edtDtinictbdiaria.Enabled := True;
            edtDtfimctbdiaria.Enabled := True;
            edtDtinictbdiaria.Date    := EncodeDate(iAnoComp,iMesComp,1);
            edtDtfimctbdiaria.Date    := DiasUteis.UltDiaMes(iAnoComp,iMesComp);
         end else if dtmLookImobiliario.qryLookTipoRecDesFLGDIARIO.AsString = 'A' then begin
            edtDtinictbdiaria.Enabled := True;
            edtDtfimctbdiaria.Enabled := True;
            edtDtinictbdiaria.Date    := EncodeDate(iAnoComp,1,1);
            edtDtfimctbdiaria.Date    := EncodeDate(iAnoComp,12,31);
         end else begin
            edtDtinictbdiaria.Enabled := False;
            edtDtfimctbdiaria.Enabled := False;
            edtDtinictbdiaria.Clear;
            edtDtfimctbdiaria.Clear;
         end;
      end else begin
         edtDtinictbdiaria.Clear;
         edtDtfimctbdiaria.Clear;
      end;
   end;
end;

procedure TfrmExecLancMultDespAlt.DBcboTipoRecDesCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CalculaDataCtbDiaria;
end;

end.
