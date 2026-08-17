unit FExecLancMultDesp;

//	------------------------------------------------------------------------------------------------
//
//	Lançamento Múltiplo de Despesas
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  24/04/2003
//	Data de Término   :  25/04/2003
//
//	------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  TEdNum, Grids, Wwdbigrd, Wwdbgrid, mFornecedor, TREdit, Mask, wwdbedit,
  Wwdbspin, wwdbdatetimepicker, CMDateTimePicker, wwdblook, Db, DBTables,
  Wwquery, Wwdatsrc, MontaSelect, uCMTypes, uOrcamento, mOrcamento;

type
  TfrmExecLancMultDesp = class(TfrmWizardMT)
    updAlterador: TUpdateSQL;
    dsAlterador: TwwDataSource;
    qryAlterador: TwwQuery;
    qryAlteradorDESCRICAO: TStringField;
    qryAlteradorVLRALTERADOR: TFloatField;
    qryAlteradorIDDOCUMENTO: TFloatField;
    qryAlteradorCODALTERADOR: TFloatField;
    updRateio: TUpdateSQL;
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
    dsRateio: TwwDataSource;
    Label22: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    lblReferenciaAP: TLabel;
    Label7: TLabel;
    lblCentroCusto: TLabel;
    lblContaBancaria: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    DBcboGrupo: TwwDBLookupCombo;
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
    edtReferenciaAP: TEdit;
    edtNumDocumento: TEdit;
    btnAtualizar: TfcShapeBtn;
    memObs: TMemo;
    DBcboCentroCusto: TwwDBLookupCombo;
    dbCboContaBancaria: TwwDBLookupCombo;
    chkContrato: TCheckBox;
    Label4: TLabel;
    pgcLancamentos: TPageControl;
    tbsLancamentos: TTabSheet;
    DBgrdLancamentos: TwwDBGrid;
    tbsErro: TTabSheet;
    memErro: TMemo;
    Panel3: TPanel;
    btnExclui: TfcShapeBtn;
    btnInsert: TfcShapeBtn;
    btnTotaliza: TfcShapeBtn;
    edtTotalLanc: TRealEdit;
    Panel1: TPanel;
    lblParcelas: TLabel;
    chkParcelar: TCheckBox;
    DBspnNumParcelas: TwwDBSpinEdit;
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
    molFornecedor1: TmolFornecedor;
    gbPeriodoCtbDiaria: TGroupBox;
    Label11: TLabel;
    Label28: TLabel;
    edtDtinictbdiaria: TCMDateTimePicker;
    edtDtfimctbdiaria: TCMDateTimePicker;
    qryRateioCONTRATO_EXTENSO: TStringField;
    molOrcamento1: TmolOrcamento;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure DBgrdLancamentosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancamentosTopRowChanged(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnTotalizaClick(Sender: TObject);
    procedure rdgAcreDescClick(Sender: TObject);
    procedure molFornecedor1btnBuscaFornClick(Sender: TObject);
    procedure bbtnInsereAlteradorClick(Sender: TObject);
    procedure DBcboFormaRecPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure DBcboTipoRecDesCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    iResult       : smallint;
    sTipoImovel   : string;
    iDocumento    : integer;
    iErro         : Integer;

    Orcamento     : TOrcamentoBack;

    procedure AbreTabelas;
    procedure FechaTabelas;
    procedure AbreTipoAlterador;
    procedure CalculaDataCtbDiaria;

    function  VerificaPreenchimento          : Boolean;
    function  VerificaPreenchimentoAlterador : Boolean;
    function  VerificaTipoImoveisLanc        : Boolean;
    function  VerificaContaBancaria          : Boolean;

    function  ContinuaPagSelecao : Boolean;
    function  ContinuaPagImovel  : Boolean;
    function  VoltaPagImovel     : Boolean;

    function  CalculaRateio: Boolean;
    function  TotalizaRateio( var fTotalRateio: Extended) : Boolean;
    function  BuscaContratoImovel(const iIdImovel: Integer): Boolean;

    function  GeraLancamentos : ShortInt;
    function  GravaLancamento(const iDocumento: Integer) : Boolean;
  public
    { Public declarations }
  end;

var
  frmExecLancMultDesp: TfrmExecLancMultDesp;

implementation

{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, UComunsImobiliario, uVerificaPreenchimento, UModulo, UDiasInUteis,
   dImobiliario, dLookImobiliario, uFuncoesImob, uDocumento,
   DMS, dLancImovel, dRelLancamento, uCMRptManager, uImpostoRetido, uModuloImobiliario,
   FProgresso;

{ TfrmExecLancMultDesp }

procedure TfrmExecLancMultDesp.AbreTabelas;
var
   sGrupoAnt   : string;
   sRecDesAnt  : string;
   sFormaAnt   : string;
   sCCAnt      : string;
begin
   // Parametros do Sistema
   dtmImobiliario.qryParamImob.Close;
   ParametrosSistema;

   // Grupo de Rateio
   if DBcboGrupo.LookupValue <> '' then sGrupoAnt := DBcboGrupo.LookupValue;
   LimpaParametros(dtmLookImobiliario.qryLookGrupoRateio);
   dtmLookImobiliario.qryLookGrupoRateio.ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
   dtmLookImobiliario.qryLookGrupoRateio.Open;
   if length(trim(sGrupoAnt)) > 0 then DBcboGrupo.LookupValue := sGrupoAnt;

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

   // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
   if length(trim(sCCAnt)) > 0 then begin
      DBcboCentroCusto.LookupValue := sCCAnt;
   end else begin
      if not(dtmImobiliario.qryParamImobCODCENTROCUSTO.isNULL) then begin
         DBcboCentroCusto.LookupValue := dtmImobiliario.qryParamImobCODCENTROCUSTO.AsString;
      end;
   end;
end;

procedure TfrmExecLancMultDesp.FechaTabelas;
begin
   qryRateio.Close;
   dtmImobiliario.qryParamImob.Close;
   dtmLookImobiliario.qryLookGrupoRateio.Close;
   dtmLookImobiliario.qryLookFormaRecPag.Close;
   dtmLookImobiliario.qryLookTipoRecDes.Close;
   dtmLookImobiliario.qryLookContaBancaria.Close;
end;

procedure TfrmExecLancMultDesp.AbreTipoAlterador;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin
      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);
      ParamByName('PCODTIPIMOVEL').AsString      := sTipoImovel;
      ParamByName('PIDEMPRESAPROP').AsInteger    := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString            := 'P';
      case rdgAcreDesc.ItemIndex of
         0: ParamByName('PACRESDECRES').AsString := 'C'; // Acréscimo
         1: ParamByName('PACRESDECRES').AsString := 'D'; // Desconto
      end;
      Open;
   end;
end;

procedure TfrmExecLancMultDesp.FormCreate(Sender: TObject);
begin
  inherited;
  molFornecedor1.btnLimpaFornClick( Self );
  chkContrato.Checked := ModuloImobiliario.AdminImob.bFlgObrigaContrato;

  if ModuloImobiliario.AdminImob.bFlgHistContDifAP then
       memObs.MaxLength := 1000    // histórico contábil (concatenado) <> obs ap
  else memObs.MaxLength := 200;    // histórico contábil = obs ap

  // Habilita o Nr. do Orçamento apenas quando a integração estiver ligada
  molOrcamento1.Clear;
  molOrcamento1.Visible := ModuloImobiliario.AdminImob.bFlgIntegraOrcamen;
  if ModuloImobiliario.AdminImob.bFlgIntegraOrcamen then begin
     Orcamento := TOrcamentoBack.Create;
  end;

  // Apenas exibe o período da Ctb diária, se o mesmo estiver ativado no parâmetro
  if ModuloImobiliario.AdminImob.bFlgDiario then begin
     gbPeriodoCtbDiaria.Visible := True;
     lblReferenciaAP.Top        := 268;
     edtReferenciaAP.Top        := 282;
     lblCentroCusto.Top         := 308;
     dbcboCentroCusto.Top       := 322;
     chkContrato.Top            := 324;
     chkContrato.Left           := 352;
  end else begin
     gbPeriodoCtbDiaria.Visible := False;
     lblReferenciaAP.Top        := 204;
     edtReferenciaAP.Top        := 219;
     lblCentroCusto.Top         := 245;
     dbcboCentroCusto.Top       := 259;
     chkContrato.Top            := 287;
     chkContrato.Left           := 8;
  end;
end;


procedure TfrmExecLancMultDesp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModuloImobiliario.AdminImob.bFlgIntegraOrcamen then FreeAndNil( Orcamento );
  if ( (qryRateio.Active) and (qryRateio.UpdatesPending) ) then qryRateio.CancelUpdates;
  FechaTabelas;
  inherited;
end;


procedure TfrmExecLancMultDesp.FormShow(Sender: TObject);
begin
  inherited;
  PagControle.ActivePageIndex := 0;
  AbreTabelas;
  Repaint;

  // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
  // na contabilidade e no contas a pagar
  iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

  // preenche o número do documento = id.Documento 18/07
  edtNumDocumento.Text := FormatFloat('#0', iDocumento);

  // competência default
  cboMes.ItemIndex := DiasInUteis.ExtraiMes(Date)-1;
  DBspnAno.Value   := DiasInUteis.ExtraiAno(Date);
end;

procedure TfrmExecLancMultDesp.cboMesChange(Sender: TObject);
begin
  inherited;
  edtDataLanc.Date := FuncoesImob.DataLancamento((cboMes.ItemIndex + 1), word(trunc(DBspnAno.Value)), edtDataVenc.Date);
  CalculaDataCtbDiaria;
end;


function TfrmExecLancMultDesp.VerificaPreenchimento: Boolean;
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

      if ( edtNumDocumento.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar o Nr. do documento!', edtNumDocumento);

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

         if (dtmLookImobiliario.qryLookTipoRecDesFLGDIARIO.AsString = 'M') or
            (dtmLookImobiliario.qryLookTipoRecDesFLGDIARIO.AsString = 'A') then begin

            if (length(trim(edtDtinictbdiaria.Text)) = 0) then
               raise EValidacao.CreateVal('É necessário indicar a Data de início da Contabilização!', edtDtinictbdiaria);

            if (length(trim(edtDtfimctbdiaria.Text)) = 0) then
               raise EValidacao.CreateVal('É necessário indicar a Data de início da Contabilização!', edtDtfimctbdiaria);

            if (edtDtinictbdiaria.Date > edtDtfimctbdiaria.Date) then
               raise EValidacao.CreateVal('Data de início da Contabilização diária não deve ser superior a data de término!', edtDtfimctbdiaria);
         end;

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

function TfrmExecLancMultDesp.VerificaPreenchimentoAlterador: Boolean;
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

function TfrmExecLancMultDesp.VerificaTipoImoveisLanc: Boolean;
var  sTipoImovelAnt, sTipoImovelAtual : string;
begin
   Result := False;
   if not ModuloImobiliario.AdminImob.bFlgMultiTipo then begin
      try
         with qryRateio do begin
            First;
            sTipoImovelAnt := qryRateioCODTIPIMOVEL.AsString;
            while not(EOF) do begin
               sTipoImovelAtual := qryRateioCODTIPIMOVEL.AsString;
               if (sTipoImovelAtual <> sTipoImovelAnt) then
                  raise EValidacao.CreateVal('Para efetuar o lançamento é necessário que TODOS os Imóveis sejam do mesmo Tipo!', btnContinuar);

               Next;
            end;
         end;
      except
         on ev : EValidacao do begin
            if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;
      end;
      sTipoImovel := sTipoImovelAnt;
   end else begin
      sTipoImovel := qryRateioCODTIPIMOVEL.AsString;
   end;
   Result := True;
end;

function TfrmExecLancMultDesp.VerificaContaBancaria: Boolean;
begin
   Result := True;
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
      lblContaBancaria.Enabled := false;
      dbCboContaBancaria.Enabled := false;
      dtmLookImobiliario.qryLookContaBancaria.Close;
      dbCboContaBancaria.LookupValue := '';
   end;
end;


function TfrmExecLancMultDesp.TotalizaRateio( var fTotalRateio: Extended): Boolean;
begin
   Result       := True;
   fTotalRateio := 0;
   qryRateio.DisableControls;
   qryRateio.First;
   while not qryRateio.EOF do begin
      fTotalRateio := fTotalRateio + ComunsImobiliario.Arredonda(qryRateioVALOR.AsFloat, 2);
      if (qryRateioIDCONTRATOIMOVEL.IsNull) and (chkContrato.Checked) then Result := False;
      qryRateio.Next;
   end;
   qryRateio.First;
   qryRateio.EnableControls;

   fTotalRateio       := ComunsImobiliario.Arredonda(fTotalRateio, 2);
   edtTotalLanc.Value := fTotalRateio;
end;

function TfrmExecLancMultDesp.CalculaRateio: Boolean;
var fValorRateado, fTotalRateado : extended;
    sMensagem, sParam : string;
    iContador : integer;
    bImovelSemContrato : Boolean;
begin
   Result := True;
   with qryRateio do begin
      Close;

      // Define Parâmetros
      sParam := ' AND I.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) +#13;
      if DBcboGrupo.LookupValue <> '' then
           sParam := sParam + '   AND ( GXI.IDGRUPORATEIO = ' + DBcboGrupo.LookupValue + ' ) ' +#13
      else sParam := sParam + '   AND ( GXI.IDGRUPORATEIO = -1 ) ' +#13;

      SQL.Text :=
          'SELECT I.IMOCODIGO, I.CODTIPIMOVEL, '+#13+
          '       ( IM.IMONOME || '' - '' || I.IMONOME ) AS IMOVEL_EXTENSO, '+#13+
          '       C.CONTRATO_EXTENSO,                          '+#13+
          '       GXI.GXIPERCENTRATEIO, GXI.IDIMOVEL,          '+#13+
          '       C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME,  '+#13+
          '       NVL(C.PERCENT_RATEIO,100) AS PERCENT_RATEIO, '+#13+
          '       0 AS VALOR '+#13+
          '  FROM IMOVEL I, IMOVEL IM, GRUPOXIMOVEL GXI, '+#13+
          '       ( '+#13+
          '        SELECT CXI.IDIMOVEL, C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME,    '+#13+
          '               ( C.CONNUMERO || '' - '' || C.CONNOME ) AS CONTRATO_EXTENSO, '+#13+
          '               DECODE(NVL(CXI.FLGRATEIO,0), 0, 100,      '+#13+
          '                      DECODE(CXI.CIMPERCENTRATEIO, NULL, 0, CXI.CIMPERCENTRATEIO)) AS PERCENT_RATEIO '+#13+
          '          FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI     '+#13+
          '         WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '+#13+
          '           AND C.FLGTIPOCONTRATO = ''L'' '+#13+
          '           AND C.FLGSTATUS = ''V''       '+#13+
          '       ) C '+#13+
          ' WHERE GXI.IDIMOVEL = I.IDIMOVEL      '+#13+
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL '+#13+
          '   AND I.IDIMOVEL = C.IDIMOVEL(+)     '+#13+ sParam +
          ' ORDER BY IMOVEL_EXTENSO ';
      Open;
   end;

   if not qryRateio.isEmpty then begin
      fTotalRateado := ComunsImobiliario.Arredonda(edtVlrTotal.Value, 2);

      qryRateio.First;
      iContador := 1;
      while not qryRateio.EOF do begin
         fValorRateado := ComunsImobiliario.Arredonda(edtVlrTotal.Value * qryRateioGXIPERCENTRATEIO.AsFloat / 100, 2);

   //      Rateio do Rateio = se o imóvel possuir mais de um contrato então o
   //      rateio deve ser rateado novamente pelo campo CONTRATOxIMOVEL.CimPercentRateio.
   //      So que neste caso o usuário pode não ter cadastrado um rateio de contrato
   //      com 100% gerando talvez uma inconsistência no último lançamento

         fValorRateado := ComunsImobiliario.Arredonda(fValorRateado * qryRateioPERCENT_RATEIO.AsFloat / 100, 2);

         qryRateio.Edit;

         // se for o ultimo registro da query colocar o valor restante nela
         if iContador = qryRateio.RecordCount then
              qryRateioVALOR.AsFloat := fTotalRateado
         else qryRateioVALOR.AsFloat := fValorRateado;

         qryRateio.Post;
         qryRateio.Next;

         fTotalRateado := fTotalRateado - fValorRateado;

         inc(iContador);
      end;
   end;

   TotalizaRateio( fTotalRateado );
end;


//--------------------------------------------------------------------------------------------------
// Retorno:  0 :  lançamentos gerados sem ocorrências
//          -1 :  lançamentos gerados mas houve ocorrências
//          -2 :  erro fatal: lançamentos NÃO gerados
//--------------------------------------------------------------------------------------------------
function TfrmExecLancMultDesp.GeraLancamentos: ShortInt;
var fPercentRateio, fSobraRateio  : double;
    fCount, fAtual                : Integer;
    sErro       : string;
begin
   Result := 0;
   fCount := qryRateio.RecordCount;

   // Exibe caixa de dialogo com a barra de progresso
   frmProgresso.MostraFormProgresso('Gerando Lançamentos...',False,False);
   Application.ProcessMessages;

   try
      try
         fSobraRateio   := edtTotalLanc.Value;

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

                  if not GravaLancamento(iDocumento) then Result := -2;

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

         if Result <= -2 then raise exception.create('Erro na tentativa do lançamento');
      except
         Result := -2;
         MsgDlg('Houve ERRO na tentativa de Lançamento! Os Lançamentos não foram gerados.', 'Erro', mtError, [mbOk], 0);
      end;
   finally
      frmProgresso.EscondeFormProgresso;
   end;
end;

function TfrmExecLancMultDesp.GravaLancamento(const iDocumento: Integer): Boolean;
begin
   Result := True;
   try
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
         ParamByName('PIDMODULO').AsInteger           := Sistema.IdModulo;

         // Período para contabilização diária
         if (length(trim(edtDtinictbdiaria.Text)) > 0) then
            ParamByName('PDTINICTBDIARIA').AsDateTime := edtDtinictbdiaria.Date;
         if (length(trim(edtDtfimctbdiaria.Text)) > 0) then
            ParamByName('PDTFIMCTBDIARIA').AsDateTime := edtDtfimctbdiaria.Date;

         // Campos obrigatorios para a AP
         if DBcboFormaRecPag.LookupValue <> '' then
            ParamByName('PCODFORMA').AsInteger        := StrToInt(DBcboFormaRecPag.LookupValue);
         ParamByName('PREFERENCIAAP').AsString        := edtReferenciaAP.Text;
         ParamByName('PCODCENTROCUSTO').AsString      := DBcboCentroCusto.LookupValue;

         // Número da Reserva orçamentária
         if molOrcamento1.iIdCompromisso > 0 then
           ParamByName('PIDRESERVAORCAMEN').AsFloat   := molOrcamento1.iIdCompromisso;

         ExecSQL;
      end;
   except
      Result := False;
   end;
end;

procedure TfrmExecLancMultDesp.btnContinuarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
     0 : if ContinuaPagSelecao then inherited;
     1 : if ContinuaPagImovel  then inherited;
  end;
end;

procedure TfrmExecLancMultDesp.btnVoltarClick(Sender: TObject);
begin
  case PagControle.ActivePageIndex of
     1 : if VoltaPagImovel then inherited;
     2 : if VoltaPagImovel then inherited;
  end;
end;


function TfrmExecLancMultDesp.ContinuaPagSelecao: Boolean;
begin
  Result := False;
  // Abre a query de rateio imovel
  if VerificaPreenchimento then begin
    try
      btnContinuar.Enabled := False;
      if CalculaRateio then begin
        iErro  := 0;
        Result := True;
      end;
    finally
      btnContinuar.Enabled := True;
    end;
  end;
end;

function TfrmExecLancMultDesp.ContinuaPagImovel: Boolean;
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
   with qryAlterador do begin
      LimpaParametros(qryAlterador);
      ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
      Open;
   end;
   Result := True;
end;


function TfrmExecLancMultDesp.VoltaPagImovel: Boolean;
begin
   Result := True;
   ImpostoRetido.Free;
   if ( (qryAlterador.Active) and (qryAlterador.UpdatesPending) ) then begin
      qryAlterador.CancelUpdates;
   end;
   qryAlterador.Close;
end;


procedure TfrmExecLancMultDesp.DBgrdLancamentosCalcCellColors( Sender: TObject; Field: TField; State: TGridDrawState;  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmExecLancMultDesp.DBgrdLancamentosTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecLancMultDesp.btnInsertClick(Sender: TObject);
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
              iErro := -91;
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

procedure TfrmExecLancMultDesp.btnExcluiClick(Sender: TObject);
var fTotalRateio : Extended;
begin
   if not(qryRateio.isEmpty) then begin
      inherited;
      qryRateio.Delete;
      if not(qryRateio.isEmpty) then begin
         TotalizaRateio( fTotalRateio );
      end else begin
         edtVlrTotal.Value  := 0;
         edtTotalLanc.Value := 0;
      end;
   end;
end;

procedure TfrmExecLancMultDesp.btnTotalizaClick(Sender: TObject);
var fTotalRateio : Extended;
begin
  inherited;
  TotalizaRateio( fTotalRateio );
end;


procedure TfrmExecLancMultDesp.rdgAcreDescClick(Sender: TObject);
begin
  inherited;
  AbreTipoAlterador;
end;


procedure TfrmExecLancMultDesp.molFornecedor1btnBuscaFornClick(Sender: TObject);
begin
  inherited;
  molFornecedor1.btnBuscaFornClick(Sender);
  VerificaContaBancaria;
end;

procedure TfrmExecLancMultDesp.bbtnInsereAlteradorClick(Sender: TObject);
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

procedure TfrmExecLancMultDesp.btnExcluiAlteradorClick(Sender: TObject);
begin
  inherited;
  if not qryAlterador.IsEmpty then qryAlterador.Delete;
end;

procedure TfrmExecLancMultDesp.DBcboFormaRecPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  VerificaContaBancaria;
end;

procedure TfrmExecLancMultDesp.btnConfirmarClick(Sender: TObject);
var sMsg: string;
    fTotalRateio : Extended;
begin
   ImpostoRetido.Free;
   if not VerificaTipoImoveisLanc then exit;

   // o total lançado tem que bater com o total do lançamento
   TotalizaRateio( fTotalRateio );
   if Arredonda(fTotalRateio,2) <> Arredonda(edtVlrTotal.Value,2) then begin
      MsgDlg('Total do lançamento não confere com o valor lançado.','Aviso',mtwarning,[mbok],0);
      exit;
   end;

   // Busca ID da reserva de orçamento caso tenha sido digitado, ao invés de buscar no MontaSelect
   if (molOrcamento1.edtCompOrc.Value > 0) and (molOrcamento1.iIdCompromisso < 0) then begin
      molOrcamento1.iIdCompromisso := Orcamento.BuscaIdNumReserva(0, StrToInt(FloatToStr(molOrcamento1.edtCompOrc.Value)), True);
   end;

   btnConfirmar.Enabled := False;
   memErro.Text := '';

   try
      StartTransacao;

      iResult := GeraLancamentos;
      if iResult > -2 then begin
         if ( (qryAlterador.Active) and (qryAlterador.UpdatesPending) ) then begin
            qryAlterador.ApplyUpdates;
         end;

         // Grava erro no documento para posterior liberação
         if iErro < 0 then begin
            if not FuncoesImob.RegistraErroDocumento(iDocumento, iErro) then begin
               MsgDlg('Houve ERRO ao registrar a necessidade de liberação do documento.', 'Erro', mtError, [mbOk], 0);
               btnConfirmar.Enabled := True;
               iResult := -2;
               Exit;
            end;
         end;

         CommitTransacao;

         if ( (iResult = 0) and (length(trim(memErro.Text)) = 0) ) then begin

            Screen.Cursor := crDefault;
            if MsgDlg('Lançamento concluído. Deseja imprimir para conferência?', 'Pergunta', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                TdtmRelLancamento.PrintRelLancamento(iDocumento, -1, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
                                                     Sistema.IdModulo, '', '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo,
                                                     sMsg, nil, cntBDE, rdtScreen, true, true, true, false, nil, false);
            Repaint;

            // gera o numero do próximo documento para contabilidade e contas a pagar
            iDocumento           := Documento.GetCodigo(dtmImobiliario.qryAux);
            edtNumDocumento.Text := FormatFloat('#0', iDocumento);

            // Limpa o frame de Orçamento
            molOrcamento1.Clear;

            // Retorna a pagina inicial
            IrParaPagina(0);
            qryRateio.Close;
            qryAlterador.Close;
         end;

      end else begin
         Raise Exception.Create('Verifique as ocorrencias geradas');
      end;
   except
      RollBackTransacao;
      IrParaPagina(1);
      pgcLancamentos.ActivePage := tbsErro;
      Repaint;
   end;
end;


procedure TfrmExecLancMultDesp.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  AbreTabelas;
  chkContrato.Checked := ModuloImobiliario.AdminImob.bFlgObrigaContrato;
end;

procedure TfrmExecLancMultDesp.CalculaDataCtbDiaria;
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

procedure TfrmExecLancMultDesp.DBcboTipoRecDesCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CalculaDataCtbDiaria;
end;

function TfrmExecLancMultDesp.BuscaContratoImovel(const iIdImovel: Integer): Boolean;
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

end.
