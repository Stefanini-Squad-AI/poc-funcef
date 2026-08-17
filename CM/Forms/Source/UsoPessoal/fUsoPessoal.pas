unit FUsoPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, Pessoa, Menus, MontaSelect, DBTables, Wwquery, Wwdatsrc,
  TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, checklst,
  DBCtrls, TabControlDetalhe, wwdblook, Mask, wwdbedit,
  ExtCtrls, Wwtable, ExtDlgs, UDataBase, TREdit, Wwdbspin, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, Spin, CMDBLookupCombo,
  CmEventosCadastro, ImgList, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmUsoPessoal = class(TfrmPessoa)
    tbsDadosPess: TTabSheet;
    tbsUltEmpr: TTabSheet;
    dbgrUltEmpr: TwwDBGrid;
    qryProfissao: TwwQuery;
    qryPaises: TwwQuery;
    qrySindicato: TwwQuery;
    qryUf: TwwQuery;
    qryGrauInstr: TwwQuery;
    qrySitFunc: TwwQuery;
    qryMotivo: TwwQuery;
    tblHorario: TwwTable;
    qryCargo: TwwQuery;
    qryEstab: TwwQuery;
    qryLotacao: TwwQuery;
    Label14: TLabel;
    dblcNacional: TwwDBLookupCombo;
    Label34: TLabel;
    dblcSindi: TwwDBLookupCombo;
    Label15: TLabel;
    dblcNatural: TwwDBLookupCombo;
    Label20: TLabel;
    dblcProfissao: TwwDBLookupCombo;
    Label18: TLabel;
    dblcGrauInstr: TwwDBLookupCombo;
    dbrgSexo: TDBRadioGroup;
    Label2: TLabel;
    dbedDatNasc: TCMDateTimePicker;
    opndArqBmp: TOpenPictureDialog;
    qryUltEmpr: TwwQuery;
    updUltEmpr: TUpdateSQL;
    dsUlt: TwwDataSource;
    qryUltEmprIDPESSOA: TFloatField;
    qryUltEmprNUMSEQ: TFloatField;
    qryUltEmprIDCARGO: TFloatField;
    qryUltEmprDAT_ADMIS: TDateTimeField;
    qryUltEmprDATADEM: TDateTimeField;
    qryUltEmprULTSALARIO: TFloatField;
    qryUltEmprCARGO: TStringField;
    qryUltEmprEMPRESA: TStringField;
    qryUltEmprIDMOTIVO: TFloatField;
    qryFonte: TwwQuery;
    gbxFiliacao: TGroupBox;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    Label38: TLabel;
    Label39: TLabel;
    dsLot: TwwDataSource;
    tblLotacao: TwwTable;
    dbrgIsento: TDBRadioGroup;
    qryChefe: TwwQuery;
    tbshOutros: TTabSheet;
    tblVinculo: TwwTable;
    tblMovContr: TwwTable;
    Label44: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label45: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    tblTipoTrab: TwwTable;
    wwDBLookupCombo5: TwwDBLookupCombo;
    Label46: TLabel;
    gbxFGTS: TGroupBox;
    rgFGTSopcao: TDBRadioGroup;
    dbedDatOpc: TCMDateTimePicker;
    lblDatOpc: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    dbedValFG: TDBRealEdit;
    dbedContas: TwwDBEdit;
    tbsFuncional: TTabSheet;
    gbxIdent: TGroupBox;
    gbxContr: TGroupBox;
    gbxDeslig: TGroupBox;
    gbxSalar: TGroupBox;
    gbxLotacao: TGroupBox;
    Label35: TLabel;
    dbedMatric: TwwDBEdit;
    Label21: TLabel;
    dbedDatAdmis: TCMDateTimePicker;
    Label36: TLabel;
    dblcSitFunc: TwwDBLookupCombo;
    Label31: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label37: TLabel;
    dblcFonte: TwwDBLookupCombo;
    dbrgTipContra: TDBRadioGroup;
    gbxContrato: TGroupBox;
    lblFinal: TLabel;
    Label43: TLabel;
    dbedFinal: TCMDateTimePicker;
    dbedDura: TwwDBEdit;
    Label47: TLabel;
    dbedProrr: TwwDBEdit;
    Label23: TLabel;
    dbedDatSaida: TCMDateTimePicker;
    Label24: TLabel;
    dbedRetorno: TCMDateTimePicker;
    dbedSalario: TDBRealEdit;
    Label50: TLabel;
    Label51: TLabel;
    dbedDatSalar: TCMDateTimePicker;
    dbrgTipoSalar: TDBRadioGroup;
    gbxCargo: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    Label52: TLabel;
    dbedDatCargo: TCMDateTimePicker;
    Label29: TLabel;
    dblcEstab: TwwDBLookupCombo;
    Label32: TLabel;
    dblcLotacao: TwwDBLookupCombo;
    dbedNomeCC: TwwDBEdit;
    dbedDatLotac: TCMDateTimePicker;
    Label53: TLabel;
    dblcChefe: TwwDBLookupCombo;
    Label54: TLabel;
    tbshDependentes: TTabSheet;
    dbgrdDepen: TwwDBGrid;
    dsDep: TwwDataSource;
    qryDepen: TwwQuery;
    tbshOpcaoCargo: TTabSheet;
    gbxCargo1: TGroupBox;
    Label17: TLabel;
    dblcCargo1: TwwDBLookupCombo;
    dbedCargo1: TCMDateTimePicker;
    gbxCargo2: TGroupBox;
    Label26: TLabel;
    dblcCargo2: TwwDBLookupCombo;
    dbedCargo2: TCMDateTimePicker;
    gbxFaixa1: TGroupBox;
    Label27: TLabel;
    dbspeStep1: TwwDBSpinEdit;
    qryFaixa: TwwQuery;
    dblcFaixa1: TwwDBLookupCombo;
    tblParam: TwwTable;
    gbxFaixa2: TGroupBox;
    Label28: TLabel;
    dbspeStep2: TwwDBSpinEdit;
    dblcFaixa2: TwwDBLookupCombo;
    Label30: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    Label33: TLabel;
    wwDBEdit4: TwwDBEdit;
    qryAgBan: TwwQuery;
    gbxContaSal: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    dblcAgenciaSal: TwwDBLookupCombo;
    edContaSal: TwwDBEdit;
    dbedDatRefHor: TCMDateTimePicker;
    Label55: TLabel;
    tblCatEmpr: TwwTable;
    Label56: TLabel;
    wwDBLookupCombo8: TwwDBLookupCombo;
    Label57: TLabel;
    wwDBLookupCombo9: TwwDBLookupCombo;
    tblSitRisco: TwwTable;
    Label25: TLabel;
    dblcMotivo1: TwwDBLookupCombo;
    Label13: TLabel;
    dblcMotivo2: TwwDBLookupCombo;
    tblHstSit: TwwTable;
    tbshHistoricos: TTabSheet;
    pnlDataHist: TPanel;
    dtedHist: TCMDateTimePicker;
    Label60: TLabel;
    pgctrlHistoricos: TPageControl;
    tbshCursos: TTabSheet;
    tbshAvaliacoes: TTabSheet;
    tbshEvolucao: TTabSheet;
    tbshProntuario: TTabSheet;
    tbshBeneficios: TTabSheet;
    tbshFerias: TTabSheet;
    dbgrCursos: TwwDBGrid;
    qryCursos: TwwQuery;
    dsCursos: TwwDataSource;
    dbgrAval: TwwDBGrid;
    dsAval: TwwDataSource;
    qryAval: TwwQuery;
    dbgrEvol: TwwDBGrid;
    dsEvol: TwwDataSource;
    qryEvol: TwwQuery;
    dbgrBenef: TwwDBGrid;
    dsBenef: TwwDataSource;
    qryBenef: TwwQuery;
    dbgrMedic: TwwDBGrid;
    dsMedic: TwwDataSource;
    qryMedic: TwwQuery;
    dbgrFerais: TwwDBGrid;
    dsFerias: TwwDataSource;
    qryFerias: TwwQuery;
    qryHistRub: TwwQuery;
    dsHistRub: TwwDataSource;
    tbshContraCheque: TTabSheet;
    Panel3: TPanel;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    dbgrHistRub: TwwDBGrid;
    dbrgEstCivil: TDBRadioGroup;
    gbxDepend: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    dbedQtdIR: TwwDBEdit;
    dbedQtdSF: TwwDBEdit;
    dbedQtdTot: TwwDBEdit;
    tbshCursosExternos: TTabSheet;
    tbshProgramacaoFerias: TTabSheet;
    dbgrCursosExternos: TwwDBGrid;
    dbgrProgFerias: TwwDBGrid;
    pnlProgFerias: TPanel;
    pnlCursosExternos: TPanel;
    qryCursosExternos: TwwQuery;
    qryProgFerias: TwwQuery;
    updCursosExternos: TUpdateSQL;
    updProgFerias: TUpdateSQL;
    gbxCurso: TGroupBox;
    Label3: TLabel;
    dblcCurso: TwwDBLookupCombo;
    dblcEntid: TwwDBLookupCombo;
    gbxDatas: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    cmDatReIni: TCMDateTimePicker;
    cmDatReFim: TCMDateTimePicker;
    gbxCarga: TGroupBox;
    dbedDurTot: TDBEdit;
    dsCursosExternos: TwwDataSource;
    dsProgFerias: TwwDataSource;
    Label4: TLabel;
    dbedIniPeriodo: TCMDateTimePicker;
    Label5: TLabel;
    dbedIniGozo: TCMDateTimePicker;
    Label6: TLabel;
    dbedFimGozo: TCMDateTimePicker;
    spedDias: TSpinEdit;
    Label7: TLabel;
    dbspeParcFer: TwwDBSpinEdit;
    dbrgAbono: TDBRadioGroup;
    tblCurso: TwwQuery;
    qryEntid: TwwQuery;
    qryUltSeq: TwwQuery;
    qryAuxCurso: TwwQuery;
    dblcMotivo: TwwDBLookupCombo;
    qryMotivoFolha: TwwQuery;
    redProvento: TRealEdit;
    Label10: TLabel;
    redDesconto: TRealEdit;
    Label11: TLabel;
    redLiquido: TRealEdit;
    qryHistRubDESCRICAO: TStringField;
    qryHistRubFLGDESCONTO: TFloatField;
    qryHistRubTIPO: TStringField;
    qryHistRubVALORPROVENTO: TFloatField;
    qryHistRubREFERENCIA: TStringField;
    pnlUltEmpr: TPanel;
    dblcUltCargo: TwwDBLookupCombo;
    dbedUltAdm: TCMDateTimePicker;
    dbedUltDem: TCMDateTimePicker;
    dbedUltSal: TDBRealEdit;
    dblcUltMotivo: TwwDBLookupCombo;
    dbedUltCargo: TwwDBEdit;
    dbedUltEmpresa: TwwDBEdit;
    dbedNumSeq: TwwDBEdit;
    Label12: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    dtFinalPerAquis: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure qrySubTipoBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure PessoaChangeSubtipo(IdPessoa: Integer);
    Procedure PessoaSaveSubtipo(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryUltEmprAfterInsert(DataSet: TDataSet);
    procedure dbrgTipContraClick(Sender: TObject);
    procedure qrySubTipoAfterScroll(DataSet: TDataSet);
    procedure rgFGTSopcaoClick(Sender: TObject);
    procedure dblcSitFuncChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dtedHistChange(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure dblcCursoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryProgFeriasBeforeInsert(DataSet: TDataSet);
    procedure qryProgFeriasAfterInsert(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbedFimGozoExit(Sender: TObject);
    procedure spedDiasExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure qryCursosExternosBeforePost(DataSet: TDataSet);
    procedure RefrescaBotoesDet;
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure qryCursosExternosAfterInsert(DataSet: TDataSet);
    procedure qryCursosExternosBeforeInsert(DataSet: TDataSet);
    procedure dblcMotivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcUltCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    AlterSit: boolean;
    sMesRef: string;
    ProxNum, NumDiasGozo, NumDiasGozo3: integer;
    UltData, DatIni: TDateTime;
    wModelo, Ano1, Mes1, Dia1, Ano2, Mes2, Dia2: word;

  public
    { Public declarations }
  end;

var
  frmUsoPessoal: TfrmUsoPessoal;

implementation

uses uMensErro, uDiasUteis, dBaseDados, uUsoPessoal, uSistema;

{$R *.DFM}

procedure TfrmUsoPessoal.FormCreate(Sender: TObject);
var
  I: integer;
  wAno, wMes, wDia: word;
begin
  inherited;
  tblParam.Open;

  gbxCargo2.Visible := (tblParam.FieldByName('FLGDOISCARGOS').asInteger = 1);
  gbxFaixa1.Visible := (tblParam.FieldByName('FLGNIVELINDIV').asInteger = 1);
  gbxFaixa2.Visible := (tblParam.FieldByName('FLGDOISCARGOS').asInteger = 1) and
                       (tblParam.FieldByName('FLGNIVELINDIV').asInteger = 1);

  if (tblParam.FieldByName('FLGNIVELINDIV').asInteger = 1) then
  begin
    qryFaixa.Open;
    dblcFaixa1.Selected.Clear;
    dblcFaixa1.Selected.Add('IDFAIXASALARIAL' + #9 + '06' + #9 + 'Código');
    dblcFaixa1.Selected.Add('DATAEFETIV' + #9 + '15' + #9 + 'Data Efetivação');

    for I:=1 to tblParam.FieldByName('NUMSTEPS').Value do
      dblcFaixa1.Selected.Add('STEP' + IntToStr(I) + #9 + '15' + #9 +
        tblParam.FieldByName('TITSTEP' + IntToStr(I)).Value);

    if (tblParam.FieldByName('FLGNIVELINDIV').asInteger = 1) then
    begin
      dblcFaixa2.Selected.Clear;
      dblcFaixa2.Selected.Add('IDFAIXASALARIAL' + #9 + '06' + #9 + 'Código');
      dblcFaixa2.Selected.Add('DATAEFETIV' + #9 + '15' + #9 + 'Data Efetivação');

      for I:=1 to tblParam.FieldByName('NUMSTEPS').Value do
        dblcFaixa2.Selected.Add('STEP' + IntToStr(I) + #9 + '15' + #9 +
          tblParam.FieldByName('TITSTEP' + IntToStr(I)).Value);
    end;
    dbspeStep1.MaxValue := tblParam.FieldByName('NUMSTEPS').asInteger;
    dbspeStep2.MaxValue := tblParam.FieldByName('NUMSTEPS').asInteger;
  end;

  qryEstab.ParamByName('IdEmpresaProp').Value   := Pessoa.IdEmpresaPropria; 
  qryLotacao.ParamByName('IdEmpresaProp').Value := Pessoa.IdEmpresaPropria; 
  qrySitFunc.Open;
  qryUltEmpr.Prepare;
  qryDepen.Prepare;
  qryCargo.Open;
  qryLotacao.Open;
  tblLotacao.Open;
  qryMotivo.Open;
  qryEstab.Open;
  qryLotacao.Open;
  qryUf.Open;
  qryPaises.Open;
  qrySindicato.Open;
  qryGrauInstr.Open;
  qryChefe.Open;
  qryProfissao.Open;
  qryFonte.Open;
  tblHorario.Open;
  tblVinculo.Open;
  tblMovContr.Open;
  tblTipoTrab.Open;
  qryAgBan.Open;
  tblCatEmpr.Open;
  tblSitRisco.Open;

  qryMotivoFolha.Open;
  qryMotivoFolha.Locate('IdMotivo', tblParam.FieldByName('IdMotivo').asInteger, []);
  dblcMotivo.Text := qryMotivoFolha.FieldByName('Descricao').asString;

  // Chamada do Empregado Identificado
  if (UsoPessoal.ChavePessoa > 0) then
    PessoaChangePessoa(UsoPessoal.ChavePessoa)
  else
  begin
    Close;
    exit;
  end;

  DecodeDate(tblParam.FieldbyName('NormalIni').Value, wAno, wMes, wDia);
  wMes := wMes - 1;
  if (wMes = 0) then
  begin
    wMes := 12;
    wAno := wAno - 1;
  end;
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;

  pgctrlDetalhe.ActivePage := tbsDocumento;
end;

procedure TfrmUsoPessoal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryUltEmpr.Close;
  qryUltEmpr.Unprepare;
  qryDepen.Close;
  qryDepen.Unprepare;
end;

procedure TfrmUsoPessoal.dblcSitFuncChange(Sender: TObject);
begin
  inherited;
  if  (dsSubTipo.State in [dsEdit, dsInsert])  then  AlterSit := True;
end;

procedure TfrmUsoPessoal.cmbMesChange(Sender: TObject);
begin
  inherited;
  sMesRef := Trim(spnedAno.Text) +'/'+ UsoPessoal.PoeZero(cmbMes.ItemIndex+1);

  qryHistRub.Close;
  qryHistRub.ParamByName('IdPessoa').Value  := qrySubTipo.FieldByName('IdPessoa').Value;
  qryHistRub.ParamByName('IdMotivo').Value  := qryMotivoFolha.FieldByName('IdMotivo').Value;
  qryHistRub.ParamByName('DatIni').asString := sMesRef;
  qryHistRub.Open;
  redProvento.Value := 0;
  redDesconto.Value := 0;
  redLiquido.Value := 0;
  while not qryHistRub.EOF do
  begin
     redProvento.Value := redProvento.Value +
       UsoPessoal.iff_float(qryHistRub.FieldByName('FlgDesconto').AsInteger = 0,
                 qryHistRub.FieldByName('ValorProvento').AsFloat,0);

     redDesconto.Value := redDesconto.Value +
       UsoPessoal.iff_float(qryHistRub.FieldByName('FlgDesconto').AsInteger = 1,
                 qryHistRub.FieldByName('ValorProvento').AsFloat,0);

     redLiquido.Value  := redLiquido.Value +
       UsoPessoal.iff_float(qryHistRub.FieldByName('FlgDesconto').AsInteger <= 1,
                 qryHistRub.FieldByName('ValorProvento').AsFloat *
                 UsoPessoal.iff_int(qryHistRub.FieldByName('FlgDesconto').AsInteger = 1,-1,1),0);
                 
     qryHistRub.Next;
  end;
  qryHistRub.First;
end;

procedure TfrmUsoPessoal.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  AlterSit := false;
end;

procedure TfrmUsoPessoal.dbrgTipContraClick(Sender: TObject);
begin
  inherited;
  gbxContrato.Visible := (dbrgTipContra.ItemIndex > 0) and (dbrgTipContra.ItemIndex < 4);
end;

procedure TfrmUsoPessoal.rgFGTSopcaoClick(Sender: TObject);
begin
  inherited;
  lblDatOpc.Visible  := (rgFGTSopcao.ItemIndex = 0);
  dbedDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
end;

procedure TfrmUsoPessoal.bbtnConfirmarClick(Sender: TObject);
var
  DataSit: TDateTime;
begin
  inherited;
  if (AlterSit) then
  begin
      DataSit := qrySubTipo.FieldByName('DataAdmissao').Value;
      if  qrySitFunc.FieldByName('TipoSit').Value <> 'A'  then
          DataSit := qrySubTipo.FieldByName('DataDesligamento').Value;
      if  (qrySitFunc.FieldByName('TipoSit').Value = 'A')  and
          (qrySubTipo.FieldByName('DataRetorno').Value <> Null)  then
          DataSit := qrySubTipo.FieldByName('DataRetorno').Value;
      if  not  tblHstSit.Active  then  tblHstSit.Open;
      tblHstSit.Insert;
      tblHstSit.FieldByName('IdPessoa').Value :=
                qrySubTipo.FieldByName('IdPessoa').Value;
      tblHstSit.FieldByName('DataSitFunc').Value := DataSit;
      tblHstSit.FieldByName('IdSitFunc').Value :=
                qrySubTipo.FieldByName('IdSitFunc').Value;
      tblHstSit.FieldByName('IdMotivoOfic').Value :=
                qrySubTipo.FieldByName('IdMotivoDesligRAIS').Value;
      tblHstSit.FieldByName('IdMotivoGer').Value :=
                qrySubTipo.FieldByName('IdMotivoDesligGerencial').Value;
      try
        tblHstSit.Post;
      except
         MsgDlg('Erro na gravação do histórico de situação funcional',
                'Informação',mtInformation,[mbOk,mbHelp],0);
      end;

  end;
end;

procedure TfrmUsoPessoal.qrySubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  gbxContrato.Visible := (dbrgTipContra.ItemIndex > 0) and (dbrgTipContra.ItemIndex < 4);
  lblDatOpc.Visible   := (rgFGTSopcao.ItemIndex = 0);
  dbedDatOpc.Visible  := (rgFGTSopcao.ItemIndex = 0);
  AlterSit            := false;
  dtedHist.Date       := qrySubTipo.FieldByName('DataAdmissao').Value;

  if not tblCurso.Active then tblCurso.Open;
  if not qryEntid.Active then qryEntid.Open;  
  qryCursosExternos.Close;
  qryCursosExternos.ParamByName('IdPessoa').AsInteger := UsoPessoal.ChavePessoa;
  qryCursosExternos.Open;

  qryProgFerias.Close;
  qryProgFerias.ParamByName('IdPessoa').AsInteger := UsoPessoal.ChavePessoa;
  qryProgFerias.Open;

  dblcAgenciaSal.ReadOnly := (tblParam.FieldByName('FlgCtSalAlt').asInteger = 1);
  dblcAgenciaSal.Enabled  := dblcAgenciaSal.ReadOnly;
  dblcAgenciaSal.TabStop  := (tblParam.FieldByName('FlgCtSalAlt').asInteger = 1);
  edContaSal.ReadOnly     := (tblParam.FieldByName('FlgCtSalAlt').asInteger = 1);
  edContaSal.Enabled      := edContaSal.ReadOnly;
  edContaSal.TabStop      := (tblParam.FieldByName('FlgCtSalAlt').asInteger = 1);
end;

procedure TfrmUsoPessoal.dtedHistChange(Sender: TObject);
begin
  inherited;
  qryCursos.Close;
  qryCursos.ParamByName('IdPessoa').Value  := qrySubTipo.FieldByName('IdPessoa').Value;
  qryCursos.ParamByName('DatIni').asString := dtedHist.Text;
  qryCursos.Open;

  qryAval.Close;
  qryAval.ParamByName('IdPessoa').Value  := qrySubTipo.FieldByName('IdPessoa').Value;
  qryAval.ParamByName('DatIni').asString := dtedHist.Text;
  qryAval.Open;

  qryEvol.Close;
  qryEvol.ParamByName('IdPessoa').Value  := qrySubTipo.FieldByName('IdPessoa').Value;
  qryEvol.ParamByName('DatIni').asString := dtedHist.Text;
  qryEvol.Open;

  qryBenef.Close;
  qryBenef.ParamByName('IdPessoa').Value  := qrySubTipo.FieldByName('IdPessoa').Value;
  qryBenef.ParamByName('DatIni').asString := dtedHist.Text;
  qryBenef.Open;

  qryMedic.Close;
  qryMedic.ParamByName('IdPessoa').Value  := qrySubTipo.FieldByName('IdPessoa').Value;
  qryMedic.ParamByName('DatIni').asString := dtedHist.Text;
  qryMedic.Open;

  qryFerias.Close;
  qryFerias.ParamByName('IdPessoa').Value  := qrySubTipo.FieldByName('IdPessoa').Value;
  qryFerias.ParamByName('DatIni').asString := dtedHist.Text;
  qryFerias.Open;
end;

procedure TfrmUsoPessoal.qryUltEmprAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryUltEmpr.FieldByName('IdPessoa').Value := qry.FieldByName('IdPessoa').Value;
end;

procedure TfrmUsoPessoal.qrySubTipoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qrySubTipo.FieldByName('CODCENTROCUSTO').Value <> Null) then
    qrySubTipo.FieldByName('IDEMPRESA').Value := Pessoa.IdEmpresaPropria;
end;

procedure TfrmUsoPessoal.PessoaChangeSubtipo(IdPessoa: Integer);
begin
  with (qryUltEmpr) do
  begin
    if (qryUltEmpr.Active) and (qryUltEmpr.CachedUpdates) then
      CancelUpdates;

    ParamByName('IdPessoa').Value := IdPessoa;
    Close;
    Open;
  end;

  with (qryDepen) do
  begin
    ParamByName('IdPessoa').Value := IdPessoa;
    Close;
    Open;
  end;
end;

procedure TfrmUsoPessoal.PessoaSaveSubtipo(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.ApplyUpdates([qryUltEmpr]);
end;

procedure TfrmUsoPessoal.dblcCursoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if  ((qryCursosExternos.State = dsEdit) or (qryCursosExternos.State = dsInsert)) and
      (modified) then
  begin
         qryCursosExternos.FieldByName('IDENTIDINSTR').Value :=
             tblCurso.FieldByName('IDENTIDINSTR').Value;

         qryCursosExternos.FieldByName('DUR_TOT').Value :=
                           tblCurso.FieldByName('DUR_PRAT').Value +
                           tblCurso.FieldByName('DUR_TEOR').Value;
  end;
end;

procedure TfrmUsoPessoal.qryProgFeriasBeforeInsert(DataSet: TDataSet);
var
  iUltNum: integer;
  dtUltData: TDateTime;
begin
  inherited;
  qryFerias.Close;
  qryFerias.ParamByName('IdPessoa').Value  := qrySubTipo.FieldByName('IdPessoa').Value;
  qryFerias.ParamByName('DatIni').asString := qrySubTipo.FieldByName('DataAdmissao').asString;
  qryFerias.Open;

  iUltNum   := qryFerias.FieldByName('NUMSEQ').asInteger;
  dtUltData := qryFerias.FieldByName('INIPERIODOFERIAS').asDateTime;
  qryFerias.Next;
  while not(qryFerias.EOF) do
  begin
    if (iUltNum < qryFerias.FieldByName('NUMSEQ').asInteger) then
      iUltNum := qryFerias.FieldByName('NUMSEQ').asInteger;

    if (dtUltData < qryFerias.FieldByName('INIPERIODOFERIAS').asDateTime) then
      dtUltData := qryFerias.FieldByName('INIPERIODOFERIAS').asDateTime;
    qryFerias.Next;
  end;
  qryFerias.Last;

  ProxNum := iUltNum + 1;
  UltData := dtUltData;
  DatIni  := qrySubTipo.FieldByName('DATAADMISSAO').Value;
  if not(qryFerias.IsEmpty) then
  begin
    DatIni := UltData + 365;

    DecodeDate(UltData, Ano1, Mes1, Dia1);
    DecodeDate(DatIni, Ano2, Mes2, Dia2);

    if (Dia2 <> Dia1) then
      DatIni := DatIni+1;
  end;
  qryFerias.First;
  dtFinalPerAquis.Date := StrToDate(UsoPessoal. IncData (DateToStr(DatIni - 1), 0, 0, 1));
end;

procedure TfrmUsoPessoal.qryProgFeriasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryProgFerias.FieldByName('IDPESSOA').asInteger := qry.FieldByName('IDPESSOA').asInteger;
  qryProgFerias.FieldByName('NUMSEQ').asInteger   := ProxNum;
  qryProgFerias.FieldByName('INIPERIODOFERIAS').Value := DatIni;
  qryProgFerias.FieldByName('FLGOCORRIDA').asInteger  := 0;
  qryProgFerias.FieldByName('FLGABONO').asInteger     := 0;
  if (wModelo = 3) then // Testa Modelo FUNCEF
  begin
    qryProgFerias.FieldByName('QTDPARCDEVOL').asInteger := 5;
    dbspeParcFer.Value   := 5;
  end;
  if (wModelo < 3) then // Testa Modelo REFER/SERPROS
  begin
    qryProgFerias.FieldByName('QTDPARCDEVOL').asInteger := 6;
    dbspeParcFer.Value   := 6;
  end;
  if (wModelo > 3) then // Testa Modelo OUTROS
  begin
    qryProgFerias.FieldByName('QTDPARCDEVOL').asInteger := 1;
    dbspeParcFer.Value   := 1;
  end;
end;

procedure TfrmUsoPessoal.bbtnOkDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbshProgramacaoFerias  then
  begin
     with (qryProgFerias) do
     begin
       if (wModelo = 3) and (NumDiasGozo3 >= 14) and (dbspeParcFer.Value = 1) then
         MsgDlg('Será pago apenas 70% do adiantamento de férias !','Aviso', mtInformation,[mbOk,mbHelp],0);

       if (FieldbyName('INIGOZOFERIAS').Value = Null) then
       begin
         MsgDlg('Informe a Data de Início de Gozo das Férias',
                'Aviso', mtInformation,[mbOk,mbHelp],0);
         dbedIniGozo.SetFocus;
         exit;
       end;

       if (FieldbyName('FIMGOZOFERIAS').Value = Null) then
       begin
         MsgDlg('Informe a Data Final de Gozo das Férias',
                'Aviso', mtInformation,[mbOk,mbHelp],0);
         dbedFimGozo.SetFocus;
         exit;
       end;

       if (FieldbyName('INIPERIODOFERIAS').Value = Null) then
       begin
         MsgDlg('Informe a Data de Início do Período Aquisitivo das Férias',
                'Aviso', mtInformation,[mbOk,mbHelp],0);
         dbedIniPeriodo.SetFocus;
         exit;
       end;

       if (FieldbyName('INIGOZOFERIAS').Value    > FieldbyName('FIMGOZOFERIAS').Value) or
          (FieldbyName('INIPERIODOFERIAS').Value > FieldbyName('INIGOZOFERIAS').Value) then
       begin
         MsgDlg('Incompatibilidade Entre as Datas para Férias. Verifique !',
                'Aviso', mtInformation,[mbOk,mbHelp],0);
         dbedIniPeriodo.SetFocus;
         exit;
       end;

       if ((FieldbyName('INIPERIODOFERIAS').Value + 365) > FieldbyName('INIGOZOFERIAS').Value) then
         if (MsgDlg('Gozo das Férias Dentro do Período Aquisitivo. Confirma ?', LerMensagem(4),
             mtConfirmation,[mbYes, mbNo], 0) <> mrYes) then
           exit;
     end;
  end;

  inherited;

  RefrescaBotoesDet;

end;

procedure TfrmUsoPessoal.dbedFimGozoExit(Sender: TObject);
begin
  inherited;
  NumDiasGozo := DiasUteis.IntervaloDias(StrToDate(dbedIniGozo.Text),StrToDate(dbedFimGozo.Text))+1;
  if (wModelo = 3) then
  begin
    NumDiasGozo3 := NumDiasGozo + UsoPessoal.iff_int(dbrgAbono.ItemIndex=1,0,round(int(NumDiasGozo/2)));
    if (NumDiasGozo3 < 10) then
    begin
      MsgDlg('Número de Dias de Gozo não pode ser menor que 10 !','Aviso', mtInformation,[mbOk,mbHelp],0);
      dbedFimGozo.SetFocus;
      exit;
    end
    else
    if (NumDiasGozo3 <= 15) then
    begin
      qryProgFerias.FieldByName('QTDPARCDEVOL').Value := 1;
      dbspeParcFer.Value   := 1;
      dbspeParcFer.Enabled := false;
      dbspeParcFer.Color   := clBtnFace;
    end
    else
    begin
      dbspeParcFer.Enabled := true;
      dbspeParcFer.Color   := clWhite;
    end;
  end;

  if (Trim(dbedFimGozo.Text) <> '') and (Trim(dbedIniGozo.Text) <> '') then
    spedDias.Value := NumDiasGozo;
end;

procedure TfrmUsoPessoal.spedDiasExit(Sender: TObject);
begin
  inherited;
  if (wModelo = 3) then
  begin
    NumDiasGozo3 := spedDias.Value + UsoPessoal.iff_int(dbrgAbono.ItemIndex=1,0,round(int(spedDias.Value/2)));
    if (NumDiasGozo3 < 10) then
    begin
      MsgDlg('Número de Dias de Gozo não pode ser menor que 10 !','Aviso', mtInformation,[mbOk,mbHelp],0);
      spedDias.SetFocus;
      exit;
    end
    else
    if (NumDiasGozo3 <= 15) then
    begin
      qryProgFerias.FieldByName('QTDPARCDEVOL').Value := 1;
      dbspeParcFer.Value   := 1;
      dbspeParcFer.Enabled := false;
      dbspeParcFer.Color   := clBtnFace;
    end
    else
    begin
      dbspeParcFer.Enabled := true;
      dbspeParcFer.Color   := clWhite;
    end;
  end;

  if (Trim(spedDias.Text) <> '') and (Trim(dbedIniGozo.Text) <> '') then
    qryProgFerias.FieldByName('FIMGOZOFERIAS').Value :=
      StrToDate(dbedIniGozo.Text) + StrToInt(spedDias.Text) - 1;
end;

procedure TfrmUsoPessoal.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   try
      AplicaAlteracoes([qryCursosExternos, qryProgFerias]);
   except
      raise;
   end;

end; // CmeCadastro.Confirma(Self)


procedure TfrmUsoPessoal.FormShow(Sender: TObject);
begin
  inherited;
  if (tblParam.FieldByName('FlgEnderIns').asInteger = 1) or
     (tblParam.FieldByName('FlgEnderAlt').asInteger = 1) or
     (tblParam.FieldByName('FlgEnderExc').asInteger = 1) or
     (tblParam.FieldByName('FlgTelefIns').asInteger = 1) or
     (tblParam.FieldByName('FlgTelefAlt').asInteger = 1) or
     (tblParam.FieldByName('FlgTelefExc').asInteger = 1) or
     (tblParam.FieldByName('FlgConttIns').asInteger = 1) or
     (tblParam.FieldByName('FlgConttAlt').asInteger = 1) or
     (tblParam.FieldByName('FlgConttExc').asInteger = 1) or
     (tblParam.FieldByName('FlgCursoIns').asInteger = 1) or
     (tblParam.FieldByName('FlgCursoAlt').asInteger = 1) or
     (tblParam.FieldByName('FlgCursoExc').asInteger = 1) or
     (tblParam.FieldByName('FlgFeriaIns').asInteger = 1) or
     (tblParam.FieldByName('FlgFeriaAlt').asInteger = 1) or
     (tblParam.FieldByName('FlgFeriaExc').asInteger = 1) or
     (tblParam.FieldByName('FlgEmprgIns').asInteger = 1) or
     (tblParam.FieldByName('FlgEmprgAlt').asInteger = 1) or
     (tblParam.FieldByName('FlgEmprgExc').asInteger = 1) or
     (tblParam.FieldByName('FlgCtSalAlt').asInteger = 1) then
       sbtnAlterarClick(Self);

end;

procedure TfrmUsoPessoal.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  RefrescaBotoesDet;
end;

procedure TfrmUsoPessoal.qryCursosExternosBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryCursosExternos.FieldbyName('DESCRICAO').AsString := tblCurso.FieldbyName('DESCRICAO').AsString;
end;

procedure TfrmUsoPessoal.RefrescaBotoesDet;
begin
  if pgctrlDetalhe.ActivePage = tbshProgramacaoFerias  then
  begin
    sbtnInsDet.Enabled    := (tblParam.FieldByName('FlgFeriaIns').asInteger = 1);
    sbtnAltDet.Enabled    := (tblParam.FieldByName('FlgFeriaAlt').asInteger = 1);
    sbtnExcluiDet.Enabled := (tblParam.FieldByName('FlgFeriaExc').asInteger = 1);
  end;

  if pgctrlDetalhe.ActivePage = tbshCursosExternos  then
  begin
    sbtnInsDet.Enabled    := (tblParam.FieldByName('FlgCursoIns').asInteger = 1);
    sbtnAltDet.Enabled    := (tblParam.FieldByName('FlgCursoAlt').asInteger = 1);
    sbtnExcluiDet.Enabled := (tblParam.FieldByName('FlgCursoExc').asInteger = 1);
  end;

  if pgctrlDetalhe.ActivePage = tbsUltEmpr  then
  begin
    sbtnInsDet.Enabled    := (tblParam.FieldByName('FlgEmprgIns').asInteger = 1);
    sbtnAltDet.Enabled    := (tblParam.FieldByName('FlgEmprgAlt').asInteger = 1);
    sbtnExcluiDet.Enabled := (tblParam.FieldByName('FlgEmprgExc').asInteger = 1);
  end;

  if pgctrlDetalhe.ActivePage = tbsDet  then
  begin
    sbtnInsDet.Enabled    := (tblParam.FieldByName('FlgEnderIns').asInteger = 1);
    sbtnAltDet.Enabled    := (tblParam.FieldByName('FlgEnderAlt').asInteger = 1);
    sbtnExcluiDet.Enabled := (tblParam.FieldByName('FlgEnderExc').asInteger = 1);
  end;

  if pgctrlDetalhe.ActivePage = tbsTelefone  then
  begin
    sbtnInsDet.Enabled    := (tblParam.FieldByName('FlgTelefIns').asInteger = 1);
    sbtnAltDet.Enabled    := (tblParam.FieldByName('FlgTelefAlt').asInteger = 1);
    sbtnExcluiDet.Enabled := (tblParam.FieldByName('FlgTelefExc').asInteger = 1);
  end;

  if pgctrlDetalhe.ActivePage = tbsContato  then
  begin
    sbtnInsDet.Enabled    := (tblParam.FieldByName('FlgConttIns').asInteger = 1);
    sbtnAltDet.Enabled    := (tblParam.FieldByName('FlgConttAlt').asInteger = 1);
    sbtnExcluiDet.Enabled := (tblParam.FieldByName('FlgConttExc').asInteger = 1);
  end;
end;

procedure TfrmUsoPessoal.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  RefrescaBotoesDet;
end;

procedure TfrmUsoPessoal.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  RefrescaBotoesDet;
end;

procedure TfrmUsoPessoal.qryCursosExternosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  qryAuxCurso.Close;
  qryAuxCurso.ParamByName('IDPESSOA').asInteger := qry.FieldByName('IDPESSOA').asInteger;
  qryAuxCurso.Open;
  ProxNum := qryAuxCurso.FieldByName('NUMSEQ').asInteger + 1;
end;

procedure TfrmUsoPessoal.qryCursosExternosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryCursosExternos.FieldByName('IDPESSOA').asInteger := qry.FieldByName('IDPESSOA').asInteger;
  qryCursosExternos.FieldByName('NUMSEQ').asInteger   := ProxNum;
end;

procedure TfrmUsoPessoal.dblcMotivoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then cmbMesChange(Self);
end;

procedure TfrmUsoPessoal.dblcUltCargoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) and (dblcUltCargo.Text <> '') and (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
     qryUltEmpr.FieldbyName('CARGO').AsString := dblcUltCargo.Text;
end;

end.


{
ALTER TABLE PARAMRH ADD (
   FlgEnderIns    Number(1) Null,
   FlgEnderAlt    Number(1) Null,
   FlgEnderExc    Number(1) Null,
   FlgTelefIns    Number(1) Null,
   FlgTelefAlt    Number(1) Null,
   FlgTelefExc    Number(1) Null,
   FlgConttIns    Number(1) Null,
   FlgConttAlt    Number(1) Null,
   FlgConttExc    Number(1) Null,
   FlgCursoIns    Number(1) Null,
   FlgCursoAlt    Number(1) Null,
   FlgCursoExc    Number(1) Null,
   FlgFeriaIns    Number(1) Null,
   FlgFeriaAlt    Number(1) Null,
   FlgFeriaExc    Number(1) Null,
   FlgEmprgIns    Number(1) Null,
   FlgEmprgAlt    Number(1) Null,
   FlgEmprgExc    Number(1) Null,
   FlgCtSalAlt    Number(1) Null
)
}
