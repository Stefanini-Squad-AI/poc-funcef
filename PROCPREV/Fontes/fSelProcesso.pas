unit fSelProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  Db, DBTables, Wwtable, Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn,
  Buttons, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelProcesso = class(TfrmOkCancelar)
    ds: TwwDataSource;
    qryAdvog1: TwwQuery;
    qryProcesso: TwwQuery;
    qryAdvog2: TwwQuery;
    qryAT: TwwQuery;
    PageControl1: TPageControl;
    tbshGeral: TTabSheet;
    tbshAdv: TTabSheet;
    rgAdv2: TRadioGroup;
    rgAT: TRadioGroup;
    gbxAdv2: TGroupBox;
    dblcAdv2: TwwDBLookupCombo;
    lstAdv2: TListBox;
    lstCodAdv2: TListBox;
    gbxAT: TGroupBox;
    dblcAT: TwwDBLookupCombo;
    lstAT: TListBox;
    lstCodAT: TListBox;
    rgAdv1: TRadioGroup;
    gbxAdv1: TGroupBox;
    dblcAdv1: TwwDBLookupCombo;
    lstAdv1: TListBox;
    lstCodAdv1: TListBox;
    qryTipoProc: TwwQuery;
    rgTRT: TRadioGroup;
    gbxTRT: TGroupBox;
    dblcTRT: TwwDBLookupCombo;
    lstTRT: TListBox;
    lstCodTRT: TListBox;
    qryAdvCasa: TwwQuery;
    rgAdvC: TRadioGroup;
    gbxAdvC: TGroupBox;
    dblcAdvC: TwwDBLookupCombo;
    lstAdvC: TListBox;
    lstCodAdvC: TListBox;
    qryTipoAcao: TwwQuery;
    tbshObjetos: TTabSheet;
    rgObjeto: TRadioGroup;
    gbxObjeto: TGroupBox;
    dblcObjeto: TwwDBLookupCombo;
    lstObjeto: TListBox;
    lstCodObjeto: TListBox;
    qryObjeto: TwwQuery;
    qryEtapa: TwwQuery;
    rgInstancia: TRadioGroup;
    gbxEtapa: TGroupBox;
    dblcEtapa: TwwDBLookupCombo;
    lstEtapa: TListBox;
    lstCodEtapa: TListBox;
    rgSentenca: TRadioGroup;
    gbxSentenca: TGroupBox;
    dblcSentenca: TwwDBLookupCombo;
    lstSentenca: TListBox;
    lstCodSentenca: TListBox;
    qrySentenca: TwwQuery;
    qryGrauInstr: TwwQuery;
    tblCargo: TwwQuery;
    tblProfis: TwwQuery;
    tblSindic: TwwQuery;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    tblEstab: TwwQuery;
    tblLotacao: TwwQuery;
    tbshContraParte: TTabSheet;
    PageControl2: TPageControl;
    tsDadosFunc: TTabSheet;
    tsDadosPess: TTabSheet;
    tsDadosOutros: TTabSheet;
    gbxIdade: TGroupBox;
    Label10: TLabel;
    ednIda1: TSpinEdit;
    ednIda2: TSpinEdit;
    gbxSexo: TGroupBox;
    cbxFeminino: TCheckBox;
    cbxMasculino: TCheckBox;
    gbxProfis: TGroupBox;
    dblcProfis: TwwDBLookupCombo;
    gbxGrauInstr: TGroupBox;
    dblcGrauInstr: TwwDBLookupCombo;
    rgSinal: TRadioGroup;
    gbxCep: TGroupBox;
    Label11: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    gbxAniv: TGroupBox;
    cbxAniv: TComboBox;
    GroupBox3: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    rgSinTot: TRadioGroup;
    speDepTot: TSpinEdit;
    speDepIR: TSpinEdit;
    rgSinIR: TRadioGroup;
    gbxEstCivil: TGroupBox;
    cbxSolt: TCheckBox;
    cbxCas: TCheckBox;
    cbxSep: TCheckBox;
    cbxViu: TCheckBox;
    cbxOutr: TCheckBox;
    cbxSepJud: TCheckBox;
    cbxDes: TCheckBox;
    pnlSelCargo: TPanel;
    rgSelEstab: TRadioGroup;
    gbxEstab: TGroupBox;
    dblcEstab: TwwDBLookupCombo;
    lstEstab: TListBox;
    rgSelSindi: TRadioGroup;
    gbxSindi: TGroupBox;
    dblcSindi: TwwDBLookupCombo;
    lstSindi: TListBox;
    lstCodSindi: TListBox;
    rgSelCargo: TRadioGroup;
    gbxCargo: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    lstCargo: TListBox;
    lstCodCargo: TListBox;
    lstCodEstab: TListBox;
    gbxLotacao: TGroupBox;
    dblcLotacao: TwwDBLookupCombo;
    rgSelCargoLot: TRadioGroup;
    pnlSelDadosFunc: TPanel;
    gbxSitPlano: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxCancelados: TCheckBox;
    cbxAssistidos: TCheckBox;
    cbxMantidos: TCheckBox;
    cbxMantidoParc: TCheckBox;
    cbxManutSaldo: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    ednSal1: TEditNum;
    ednSal2: TEditNum;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    gbxTempCar: TGroupBox;
    Label9: TLabel;
    ednCar1: TSpinEdit;
    ednCar2: TSpinEdit;
    rgSelPlano: TRadioGroup;
    gbxPlano: TGroupBox;
    dblcPlano: TwwDBLookupCombo;
    lstPlano: TListBox;
    lstCodPlano: TListBox;
    rgSelPatro: TRadioGroup;
    gbxPatro: TGroupBox;
    dblcPatro: TwwDBLookupCombo;
    lstPatro: TListBox;
    lstCodPatro: TListBox;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    rgSelDadosFunc: TRadioGroup;
    qryVara: TwwQuery;
    rgEtapa: TRadioGroup;
    qryUF: TwwQuery;
    rgSitProc: TRadioGroup;
    gbxNumPr: TGroupBox;
    Label2: TLabel;
    EdnNum1: TEditNum;
    EdnNum2: TEditNum;
    gbxTipEncer: TGroupBox;
    cbxArquiv: TCheckBox;
    cbxAcordo: TCheckBox;
    cbxDesist: TCheckBox;
    cbxSent: TCheckBox;
    rgParte: TRadioGroup;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    ednCus1: TEditNum;
    ednCus2: TEditNum;
    gbxFaixaInc: TGroupBox;
    Label15: TLabel;
    edDataInc1: TCMDateTimePicker;
    edDataInc2: TCMDateTimePicker;
    gbxFaixaAju: TGroupBox;
    Label6: TLabel;
    EdDataAju1: TCMDateTimePicker;
    EdDataAju2: TCMDateTimePicker;
    gbxFaixaData: TGroupBox;
    Label3: TLabel;
    EdDataNot1: TCMDateTimePicker;
    EdDataNot2: TCMDateTimePicker;
    gbxDataEnc: TGroupBox;
    Label5: TLabel;
    EdDataEnc1: TCMDateTimePicker;
    EdDataEnc2: TCMDateTimePicker;
    gbxTempAdm: TGroupBox;
    Label1: TLabel;
    ednAdm1: TSpinEdit;
    ednAdm2: TSpinEdit;
    rgTipoProc: TRadioGroup;
    gbxTipoProc: TGroupBox;
    dblcTipoProc: TwwDBLookupCombo;
    lstTipoProc: TListBox;
    lstCodTipoProc: TListBox;
    rgTipoAcao: TRadioGroup;
    gbxTipoAcao: TGroupBox;
    dblcTipoAcao: TwwDBLookupCombo;
    lstTipoAcao: TListBox;
    lstCodTipoAcao: TListBox;
    tbsCidadesUF: TTabSheet;
    rgUF: TRadioGroup;
    gbxUF: TGroupBox;
    dblcUF: TwwDBLookupCombo;
    lstUF: TListBox;
    lstCodUF: TListBox;
    rgCidade: TRadioGroup;
    gbxCidade: TGroupBox;
    dblcCidade: TwwDBLookupCombo;
    lstCidade: TListBox;
    lstCodCidade: TListBox;
    cbxCidadeNegativa: TCheckBox;
    qryCidade: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure rgAdv1Click(Sender: TObject);
    procedure rgAdv2Click(Sender: TObject);
    procedure rgATClick(Sender: TObject);
    procedure lstAdv1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstAdv2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstATKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure dblcAdv1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcAdv2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcATCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcTRTCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcTipoAcaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcAdvCCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcObjetoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcEtapaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcSentencaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcLotacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcEstabCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcSindiCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcUFCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure rgTRTClick(Sender: TObject);
    procedure lstTRTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdnNum1Change(Sender: TObject);
    procedure EdnNum2Change(Sender: TObject);
    procedure ednCus1Change(Sender: TObject);
    procedure ednCus2Change(Sender: TObject);
    procedure rgSitProcClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoProcClick(Sender: TObject);
    procedure lstTipoProcKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgTipoAcaoClick(Sender: TObject);
    procedure lstTipoAcaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgAdvCClick(Sender: TObject);
    procedure lstAdvCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgObjetoClick(Sender: TObject);
    procedure lstObjetoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgEtapaClick(Sender: TObject);
    procedure lstEtapaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSentencaClick(Sender: TObject);
    procedure lstSentencaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelPlanoClick(Sender: TObject);
    procedure lstPlanoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelPatroClick(Sender: TObject);
    procedure lstPatroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelCargoClick(Sender: TObject);
    procedure lstCargoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelEstabClick(Sender: TObject);
    procedure lstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelSindiClick(Sender: TObject);
    procedure lstSindiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelCargoLotClick(Sender: TObject);
    procedure rgSelDadosFuncClick(Sender: TObject);
    procedure rgUFClick(Sender: TObject);
    procedure lstUFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgCidadeClick(Sender: TObject);
    procedure dblcCidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MudouEstado;
  private
    SvItem: integer;
    sSQL: string;

    procedure LeArquivoConfig;
    procedure GravaArquivoConfig;
  public
    bSalvaOpcoes: boolean;
  end;

var
  frmSelProcesso: TfrmSelProcesso;
  recConfig: record
    TipoProc, TipoAcao, Parte, SitProc, NumAdm1, NumAdm2: integer;
    Arquiv, Acordo, Desist, Sent: boolean;
    NumProc1, NumProc2, CusProc1, CusProc2, DataInc1, DataInc2, DataAju1,
    DataAju2, DataNot1, DataNot2, DataEnc1, DataEnc2: string;
    ListaCodTipoProc, ListaTipoProc, ListaCodTipoAcao, ListaTipoAcao: array of string;
  end;

  procedure InitRecConfig;

implementation

uses uMensErro, uModulo, uFuncoesUteisRH;

var
  TituSeq: array[0..9] of string = (
    'Nome',
    'Inscrição',
    'Patrocinadora, Nome',
    'Patrocinadora, Matrícula',
    'Plano, Nome',
    'Plano, Inscrição',
    'Patrocinadora, Plano, Nome',
    'Patrocinadora, Plano, Inscrição',
    'Plano, Patrocinadora, Nome',
    'Plano, Patrocinadora, Matrícula');

  TituOrdF: array[0..9] of string = (
    'upper(Reclamantes.Nome)',
    'INSCRICAONUMERO',
    'EP.IdPessJur, upper(Reclamantes.Nome)',
    'EP.IdPessJur, Matricula',
    'IDPLANOPREV, upper(Reclamantes.Nome)',
    'IDPLANOPREV, INSCRICAONUMERO',
    'EP.IdPessJur, IDPLANOPREV, upper(Reclamantes.Nome)',
    'EP.IdPessJur, IDPLANOPREV, INSCRICAONUMERO',
    'IDPLANOPREV, EP.IdPessJur, upper(Reclamantes.Nome)',
    'IDPLANOPREV, EP.IdPessJur, Matricula');

{$R *.DFM}

procedure TfrmSelProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  // Isto é temporário. Tem que sair depois
  rgSelDadosFunc.ItemIndex := 1;
  rgSelDadosFuncClick(Self);

  //EdDataNot1.Date := (Date-365);
//  EdDataNot2.Date := Date;
  //EdDataAju1.Date := (Date-365);
//  EdDataAju2.Date := Date;
  //EdDataEnc1.Date := (Date-365);
//  EdDataEnc2.Date := Date;
  qryAdvog1.Open;
  qryAdvog2.Open;
  qryAdvCasa.Open;
  qryAT.Open;
  qryVara.Open;
  qryUF.Open;
  qryObjeto.Open;
  qryTipoProc.Open;
  qryTipoAcao.Open;
  qryEtapa.Open;
  qrySentenca.Open;

  tblProfis.Open;
  qryGrauInstr.Open;
//  qryRamo.Open;
//  tblCargo.Open;
//  tblSindic.Open;
//  tblEstab.Open;
  tblLotacao.Open;
  dblcLotacao.SelText    := '**********';
  cmbSequencia.ItemIndex := 0;
  cmbSequencia.Text      := TituSeq[0];
  PageControl1.ActivePageIndex := 0;

  if (bSalvaOpcoes) then
    LeArquivoConfig;
end;

procedure TfrmSelProcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (bSalvaOpcoes) then
    GravaArquivoConfig;
end;

procedure TfrmSelProcesso.rgAdv1Click(Sender: TObject);
begin
  if (qryAdvog1.EOF) then
    rgAdv1.ItemIndex := 0;
  gbxAdv1.Visible := (rgAdv1.ItemIndex = 1);
end;

procedure TfrmSelProcesso.rgAdv2Click(Sender: TObject);
begin
  if (qryAdvog2.EOF) then
    rgAdv2.ItemIndex := 0;
  gbxAdv2.Visible := (rgAdv2.ItemIndex = 1);
end;

procedure TfrmSelProcesso.rgATClick(Sender: TObject);
begin
  if (qryAT.EOF) then
    rgAT.ItemIndex := 0;
  gbxAT.Visible := (rgAT.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcAdv1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstAdv1.Items.Add(qryAdvog1.FieldByName('NOME').Value);
    lstCodAdv1.Items.Add(qryAdvog1.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.dblcAdv2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstAdv2.Items.Add(qryAdvog2.FieldByName('NOME').Value);
    lstCodAdv2.Items.Add(qryAdvog2.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.dblcATCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstAT.Items.Add(qryAT.FieldByName('NOME').Value);
    lstCodAT.Items.Add(qryAT.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstAdv1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstAdv1.Items.Count > 0) then
  begin
    SvItem := lstAdv1.ItemIndex;
    lstAdv1.Items.Delete(SvItem);
    lstCodAdv1.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.lstAdv2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstAdv2.Items.Count > 0) then
  begin
    SvItem := lstAdv2.ItemIndex;
    lstAdv2.Items.Delete(SvItem);
    lstCodAdv2.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.lstATKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstAT.Items.Count > 0) then
  begin
    SvItem := lstAT.ItemIndex;
    lstAT.Items.Delete(SvItem);
    lstCodAT.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.ednAdm2Change(Sender: TObject);
begin
  if (ednAdm2.Value < ednAdm1.Value) then
    ednAdm2.Value := ednAdm1.Value;
end;

procedure TfrmSelProcesso.ednAdm1Change(Sender: TObject);
begin
  if (ednAdm1.Value > ednAdm2.Value) then
    ednAdm1.Value := ednAdm2.Value;
end;

procedure TfrmSelProcesso.rgTRTClick(Sender: TObject);
begin
  if (qryVara.EOF) then
    rgTRT.ItemIndex := 0;
  gbxTRT.Visible := (rgTRT.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcTRTCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  lstTRT.Items.Add(qryVara.FieldByName('DESCRICAO').Value);
  lstCodTRT.Items.Add(qryVara.FieldByName('IDVARAJUSTICA').AsString);
end;

procedure TfrmSelProcesso.lstTRTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstTRT.Items.Count > 0) then
  begin
    SvItem := lstTRT.ItemIndex;
    lstTRT.Items.Delete(SvItem);
    lstCodTRT.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.EdnNum1Change(Sender: TObject);
begin
  try
    if StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text) then
      ednNum1.Text := ednNum2.Text;
  except
  end;
end;

procedure TfrmSelProcesso.EdnNum2Change(Sender: TObject);
begin
  try
    if StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text) then
      ednNum2.Text := ednNum1.Text;
  except
  end;
end;

procedure TfrmSelProcesso.ednCus1Change(Sender: TObject);
begin
  try
    if StrToFloat(ednCus1.Text) > StrToFloat(ednCus2.Text) then
      ednCus1.Text := ednCus2.Text;
  except
  end;
end;

procedure TfrmSelProcesso.ednCus2Change(Sender: TObject);
begin
  try
    if StrToFloat(ednCus2.Text) < StrToFloat(ednCus1.Text) then
      ednCus2.Text := ednCus1.Text;
  except
  end;
end;

procedure TfrmSelProcesso.rgTipoProcClick(Sender: TObject);
begin
  if (qryTipoProc.EOF) then
    rgTipoProc.ItemIndex := 0;
  gbxTipoProc.Visible := (rgTipoProc.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcTipoProcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  lstTipoProc.Items.Add(qryTipoProc.FieldByName('NOMETIPOPROC').Value);
  lstCodTipoProc.Items.Add(qryTipoProc.FieldByName('IDTIPOPROC').AsString);
end;

procedure TfrmSelProcesso.lstTipoProcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstTipoProc.Items.Count > 0) then
  begin
    SvItem := lstTipoProc.ItemIndex;
    lstTipoProc.Items.Delete(SvItem);
    lstCodTipoProc.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgTipoAcaoClick(Sender: TObject);
begin
  if (qryTipoAcao.EOF) then
    rgTipoAcao.ItemIndex := 0;
  gbxTipoAcao.Visible := (rgTipoAcao.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcTipoAcaoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  lstTipoAcao.Items.Add(qryTipoAcao.FieldByName('DESCRICAO').Value);
  lstCodTipoAcao.Items.Add(qryTipoAcao.FieldByName('IDTIPOACAO').AsString);
end;

procedure TfrmSelProcesso.lstTipoAcaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstTipoAcao.Items.Count > 0)  then begin
      SvItem := lstTipoAcao.ItemIndex;
      lstTipoAcao.Items.Delete(SvItem);
      lstCodTipoAcao.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgAdvCClick(Sender: TObject);
begin
  if (qryAdvCasa.EOF) then
    rgAdvC.ItemIndex := 0;
  gbxAdvC.Visible := (rgAdvC.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcAdvCCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstAdvC.Items.Add(qryAdvCasa.FieldByName('NOME').Value);
    lstCodAdvC.Items.Add(qryAdvCasa.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstAdvCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstAdvC.Items.Count > 0)  then begin
      SvItem := lstAdvC.ItemIndex;
      lstAdvC.Items.Delete(SvItem);
      lstCodAdvC.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgObjetoClick(Sender: TObject);
begin
  inherited;
  if qryObjeto.EOF  then  rgObjeto.ItemIndex := 0;
  gbxObjeto.Visible := (rgObjeto.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcObjetoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
     lstObjeto.Items.Add(qryObjeto.FieldByName('DESCRICAO').Value);
     lstCodObjeto.Items.Add(qryObjeto.FieldByName('CODTIPOOBJETO').AsString);
end;

procedure TfrmSelProcesso.lstObjetoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstObjeto.Items.Count > 0)  then begin
      SvItem := lstObjeto.ItemIndex;
      lstObjeto.Items.Delete(SvItem);
      lstCodObjeto.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgEtapaClick(Sender: TObject);
begin
  inherited;
  if qryEtapa.EOF  then  rgEtapa.ItemIndex := 0;
  gbxEtapa.Visible := (rgEtapa.ItemIndex > 0);
end;

procedure TfrmSelProcesso.dblcEtapaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
     lstEtapa.Items.Add(qryEtapa.FieldByName('DESCRICAO').Value);
     lstCodEtapa.Items.Add(qryEtapa.FieldByName('CODTIPORECURSO').AsString);
end;

procedure TfrmSelProcesso.lstEtapaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstEtapa.Items.Count > 0)  then begin
      SvItem := lstEtapa.ItemIndex;
      lstEtapa.Items.Delete(SvItem);
      lstCodEtapa.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgSentencaClick(Sender: TObject);
begin
  inherited;
  if qrySentenca.EOF  then  rgSentenca.ItemIndex := 0;
  gbxSentenca.Visible := (rgSentenca.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcSentencaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
     lstSentenca.Items.Add(qrySentenca.FieldByName('DESCRICAO').Value);
     lstCodSentenca.Items.Add(qrySentenca.FieldByName('CODTIPOSENT').AsString);
end;

procedure TfrmSelProcesso.lstSentencaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstSentenca.Items.Count > 0)  then begin
      SvItem := lstSentenca.ItemIndex;
      lstSentenca.Items.Delete(SvItem);
      lstCodSentenca.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgSelPlanoClick(Sender: TObject);
begin
  inherited;
  if  (rgSelPlano.ItemIndex = 1) and  (not qryPlano.Active)  then  qryPlano.Open;
  if  qryPlano.EOF  then  rgSelPlano.ItemIndex := 0;
  gbxPlano.Visible := (rgSelPlano.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstPlano.Items.Add(qryPlano.FieldByName('NOME').Value);
    lstCodPlano.Items.Add(qryPlano.FieldByName('IDPLANOPREV').AsString);
  end;
end;

procedure TfrmSelProcesso.lstPlanoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstPlano.Items.Count > 0) then
  begin
    SvItem := lstPlano.ItemIndex;
    lstPlano.Items.Delete(SvItem);
    lstCodPlano.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgSelPatroClick(Sender: TObject);
begin
  if (rgSelPatro.ItemIndex = 1) and  (not qryPatro.Active) then
    qryPatro.Open;
  if (qryPatro.EOF) then
    rgSelPatro.ItemIndex := 0;
  gbxPatro.Visible := (rgSelPatro.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstPatro.Items.Add(qryPatro.FieldByName('NOME').Value);
    lstCodPatro.Items.Add(qryPatro.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstPatroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstPatro.Items.Count > 0) then
  begin
    SvItem := lstPatro.ItemIndex;
    lstPatro.Items.Delete(SvItem);
    lstCodPatro.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.dblcLotacaoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) and (not tblLotacao.Eof) then
  {dblcLotacao}(Sender as TwwDBLookupCombo).Text := tblLotacao.FieldByName('CODCENTROCUSTO').Value;
end;

procedure TfrmSelProcesso.rgSelCargoClick(Sender: TObject);
begin
  if (rgSelCargo.ItemIndex = 1) and not(tblCargo.Active) then
    tblCargo.Open;
  if (tblCargo.EOF) then
    rgSelCargo.ItemIndex := 0;
  gbxCargo.Visible := (rgSelCargo.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstCargo.Items.Add(tblCargo.FieldByName('TITULO').Value);
    lstCodCargo.Items.Add(tblCargo.FieldByName('IDCARGOEXT').AsString);
  end;
end;

procedure TfrmSelProcesso.lstCargoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstCargo.Items.Count > 0) then
  begin
    SvItem := lstCargo.ItemIndex;
    lstCargo.Items.Delete(SvItem);
    lstCodCargo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgSelEstabClick(Sender: TObject);
begin
  if (rgSelEstab.ItemIndex = 1) and not(tblEstab.Active) then
    tblEstab.Open;
  if (tblEstab.EOF) then
    rgSelEstab.ItemIndex := 0;
  gbxEstab.Visible := (rgSelEstab.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcEstabCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstEstab.Items.Add(tblEstab.FieldByName('NOME').Value);
    lstCodEstab.Items.Add(tblEstab.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstEstab.Items.Count > 0) then
  begin
    SvItem := lstEstab.ItemIndex;
    lstEstab.Items.Delete(SvItem);
    lstCodEstab.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgSelSindiClick(Sender: TObject);
begin
  if (rgSelSindi.ItemIndex = 1) and not(tblSindic.Active) then
    tblSindic.Open;
  if (tblSindic.EOF) then
    rgSelSindi.ItemIndex := 0;
  gbxSindi.Visible := (rgSelSindi.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcSindiCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstSindi.Items.Add(tblSindic.FieldByName('NOME').Value);
    lstCodSindi.Items.Add(tblSindic.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstSindiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstSindi.Items.Count > 0) then
  begin
    SvItem := lstSindi.ItemIndex;
    lstSindi.Items.Delete(SvItem);
    lstCodSindi.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgSelCargoLotClick(Sender: TObject);
begin
  pnlSelCargo.Visible := (rgSelCargoLot.ItemIndex = 0);
end;

procedure TfrmSelProcesso.rgSelDadosFuncClick(Sender: TObject);
begin
  pnlSelDadosFunc.Visible := (rgSelDadosFunc.ItemIndex = 0);
  rgSelCargoLot.Enabled   := (rgSelDadosFunc.ItemIndex = 0);
  if (rgSelDadosFunc.ItemIndex = 1) then
  begin
    rgSelCargoLot.ItemIndex := 1;
    pnlSelCargo.Visible     := False;
  end;
end;

procedure TfrmSelProcesso.rgUFClick(Sender: TObject);
begin
  if (qryUF.EOF) then
    rgUF.ItemIndex := 0;
  gbxUF.Visible := (rgUF.ItemIndex = 1);
  MudouEstado;
end;

procedure TfrmSelProcesso.dblcUFCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstUF.Items.Add(qryUF.FieldByName('NOMEESTADO').AsString);
    lstCodUF.Items.Add(qryUF.FieldByName('IDESTADO').AsString);
    MudouEstado;
  end;
end;

procedure TfrmSelProcesso.lstUFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstUF.Items.Count > 0) then
  begin
    SvItem := lstUF.ItemIndex;
    lstUF.Items.Delete(SvItem);
    lstCodUF.Items.Delete(SvItem);
    MudouEstado;
  end;
end;

procedure TfrmSelProcesso.rgSitProcClick(Sender: TObject);
begin
  gbxTipEncer.Visible := (rgSitProc.ItemIndex > 0);
  gbxDataEnc.Visible  := (rgSitProc.ItemIndex > 0);
  rgSentenca.Visible  := (rgSitProc.ItemIndex > 0);
  gbxSentenca.Visible := (rgSitProc.ItemIndex > 0);
end;

procedure TfrmSelProcesso.bbtnConfirmarClick(Sender: TObject);
var
  sAdvC, sAdv1, sAdv2, sAT, sTRT, sTipoProc, sTipoAcao, sObjeto, sEtapa, sSentenca,
  sEstab, sCargo, sSindi, sPlano, sPatro, sUF, sCidade: string;
  MarcouFuncionario, MarcouParticipante: boolean;
  ValComp, CodErro, i: integer;
begin
  inherited;
  ds.Dataset.Close;

  MarcouFuncionario  := (cbxAtivos.Checked) or (cbxAfastados.Checked) or
                        (cbxDemitidos.Checked);
  MarcouParticipante := (cbxEfetivos.Checked) or (cbxAssistidos.Checked) or
                        (cbxCancelados.Checked);

  if not(MarcouParticipante) then
  begin
    MsgDlg('Assinale Ao Menos Um Tipo de Situação na Fundação',
            'Aviso', mtInformation, [mbOk,mbHelp], 0);
    PageControl1.ActivePage := tsDadosFunc;
    gbxSitPlano.SetFocus;
    exit;
  end;

  if not(MarcouFuncionario) then
  begin
    MsgDlg('Assinale Ao Menos Um Tipo de Situação na Patrocinadora',
            'Aviso', mtInformation, [mbOk,mbHelp], 0);
    PageControl1.ActivePage := tsDadosFunc;
    gbxSituacao.SetFocus;
    exit;
  end;

  if (rgSelEstab.ItemIndex > 0) then
  begin
    sEstab := '(';
    for I:=0 to (lstEstab.Items.Count-1) do
    begin
      if (lstEstab.Items[I] = '') then
        break;
      if (I > 0) then
        sEstab := sEstab + ',';
      sEstab := sEstab + lstCodEstab.Items[I];
    end;
    sEstab := sEstab + ')';
  end;

  if (rgSelCargo.ItemIndex > 0) then
  begin
    sCargo := '(';
    for I:=0 to (lstCargo.Items.Count-1) do
    begin
      if (lstCargo.Items[I] = '') then
        break;
      if (I > 0) then
        sCargo := sCargo + ',';
      sCargo := sCargo + lstCodCargo.Items[I];
    end;
    sCargo := sCargo + ')';
  end;

  if (rgSelSindi.ItemIndex > 0) then
  begin
    sSindi := '(';
    for I:=0 to (lstSindi.Items.Count-1) do
    begin
      if (lstSindi.Items[I] = '') then
        break;
      if (I > 0) then
        sSindi := sSindi + ',';
      sSindi := sSindi + lstCodSindi.Items[I];
    end;
    sSindi := sSindi + ')';
  end;

  if (rgSelPlano.ItemIndex > 0) then
  begin
    sPlano := '(';
    for I:=0 to (lstPlano.Items.Count - 1) do
    begin
      if (lstPlano.Items[I] = '') then
        break;
      if (I > 0) then
        sPlano := sPlano + ',';
      sPlano := sPlano + lstCodPlano.Items[I];
    end;
    sPlano := sPlano + ')';
  end;

  if (rgSelPatro.ItemIndex > 0) then
  begin
    sPatro := '(';
    for I:=0 to (lstPatro.Items.Count - 1) do
    begin
      if (lstPatro.Items[I] = '') then
        break;
      if (I > 0) then
        sPatro := sPatro + ',';
      sPatro := sPatro + lstCodPatro.Items[I];
    end;
    sPatro := sPatro + ')';
  end;

  if (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0) then
  begin
    sAdvC := '(';
    for I:=0 to (lstAdvC.Items.Count-1) do
    begin
      if (lstAdvC.Items[I] = '') then
        break;
      if (I > 0) then
        sAdvC := sAdvC + ',';
      sAdvC := sAdvC + lstCodAdvC.Items[I];
    end;
    sAdvC := sAdvC + ')';
  end;

  if (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0) then
  begin
    sAdv1 := '(';
    for I:=0 to (lstAdv1.Items.Count-1) do
    begin
      if (lstAdv1.Items[I] = '') then
        break;
      if (I > 0) then
        sAdv1 := sAdv1 + ',';
      sAdv1 := sAdv1 + lstCodAdv1.Items[I];
    end;
    sAdv1 := sAdv1 + ')';
  end;

  if (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0) then
  begin
    sAdv2 := '(';
    for I:=0 to (lstAdv2.Items.Count-1) do
    begin
      if (lstAdv2.Items[I] = '') then
        break;
      if (I > 0) then
        sAdv2 := sAdv2 + ',';
      sAdv2 := sAdv2 + lstCodAdv2.Items[I];
    end;
    sAdv2 := sAdv2 + ')';
  end;

  if (rgAT.ItemIndex * lstAT.Items.Count > 0) then
  begin
    sAT := '(';
    for I:=0 to (lstAT.Items.Count-1) do
    begin
      if (lstAT.Items[I] = '') then
        break;
      if (I > 0) then
        sAT := sAT + ',';
      sAT := sAT + lstCodAT.Items[I];
    end;
    sAT := sAT + ')';
  end;

  if (rgTRT.ItemIndex * lstTRT.Items.Count > 0) then
  begin
    sTRT := '(';
    for I:=0 to (lstTRT.Items.Count-1) do
    begin
      if (lstTRT.Items[I] = '') then
        break;
      if (I > 0) then
        sTRT := sTRT + ',';
      sTRT := sTRT + lstCodTRT.Items[I];
    end;
    sTRT := sTRT + ')';
  end;

  if (rgUF.ItemIndex * lstUF.Items.Count > 0) then
  begin
    sUF := '(';
    for I:=0 to (lstUF.Items.Count-1) do
    begin
      if (lstUF.Items[I] = '') then
        break;
      if (I > 0) then
        sUF := sUF + ',';
      sUF := sUF + lstCodUF.Items[I];
    end;
    sUF := sUF + ')';
  end;

  if  (rgCidade.ItemIndex * lstCidade.Items.Count > 0) then
  begin
      sCidade := '(';
      for  I := 0  to  (lstCidade.Items.Count - 1)  do
      begin
          if lstCidade.Items[I] = ''  then  break;
          if  I > 0  then  sCidade := sCidade + ',';
          sCidade := sCidade + lstCodCidade.Items[I];
      end;
      sCidade := sCidade + ')';
  end;

  if (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) then
  begin
    sTipoProc := '(';
    for I:=0 to (lstTipoProc.Items.Count-1) do
    begin
      if (lstTipoProc.Items[I] = '') then
        break;
      if (I > 0) then
        sTipoProc := sTipoProc + ',';
      sTipoProc := sTipoProc + lstCodTipoProc.Items[I];
    end;
    sTipoProc := sTipoProc + ')';
  end;

  if (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0) then
  begin
    sTipoAcao := '(';
    for I:=0 to (lstTipoAcao.Items.Count-1) do
    begin
      if (lstTipoAcao.Items[I] = '') then
        break;
      if (I > 0) then
        sTipoAcao := sTipoAcao + ',';
      sTipoAcao := sTipoAcao + lstCodTipoAcao.Items[I];
    end;
    sTipoAcao := sTipoAcao + ')';
  end;

  if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
  begin
    sObjeto := '(';
    for I:=0 to (lstObjeto.Items.Count-1) do
    begin
      if (lstObjeto.Items[I] = '') then
        break;
      if (I > 0) then
        sObjeto := sObjeto + ',';
      sObjeto := sObjeto + lstCodObjeto.Items[I];
    end;
    sObjeto := sObjeto + ')';
  end;

  if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
  begin
    sEtapa := '(';
    for I:=0 to (lstEtapa.Items.Count-1) do
    begin
      if lstEtapa.Items[I] = ''  then  break;
      if  I > 0  then  sEtapa := sEtapa + ',';
      sEtapa := sEtapa + lstCodEtapa.Items[I];
    end;
    sEtapa := sEtapa + ')';
  end;

  if (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0) then
  begin
    sSentenca := '(';
    for I:=0 to (lstSentenca.Items.Count-1) do
    begin
      if (lstSentenca.Items[I] = '') then
        break;
      if (I > 0) then
        sSentenca := sSentenca + ',';
      sSentenca := sSentenca + lstCodSentenca.Items[I];
    end;
    sSentenca := sSentenca + ')';
  end;

  with (qryProcesso.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PT.*, RECLAMANTES.*, CI.IDESTADO, VJ.DESCRICAO AS NOMEVARA');
    Add('FROM');
    Add('  PROCESSOTRAB PT, CIDADES CI, VARAJUSTICA VJ,');
    //--------------------------------------------------------------------------
    Add('  (SELECT DISTINCT');
    Add('     P.NOME, P.TIPO, P.NUMDOCUMENTO, P.IDPESSOA, PF.IDSINDICATO,');
    Add('     PF.IDFONTRECR, PF.IDGRINSTR, PF.IDPROFISS,');
    Add('     PF.DATANASC, PF.SEXO, PF.ESTCIVIL, PF.NUMDEPIRRF, PF.NUMDEPSALF,');
    Add('     PF.NUMDEPTOT, PF.FLGISENTOIRRF, PF.CORPESSOA, PF.FLGDEFICIENTE,');
    Add('     CI.NOME AS CIDADE, E.LOGRADOURO, E.CODESTADO, E.NUMERO,');
    Add('     E.COMPLEMENTO, E.BAIRRO, E.CEP,');

    if (rgSelDadosFunc.ItemIndex = 0) then
    begin
      Add('     EP.IDPESSJUR, EP.IDPESSJURORGAO, EP.SIGLA, EP.IDCARGOEXT,');
      Add('     EP.IDESTAB, EP.IDSITFUNC, EP.MATRICULA, EP.DATAADMISSAO,');
      Add('     EP.SALTOTAL, EP.PARTICIPPREVID, EP.PARTICIPASSIST,');
      Add('     EP.IDEMPRESAPROP, EP.NIVEL, EP.DATAINICIOAFAST,');
      Add('     EP.DATAFIMAFAST, EP.DATADEMISSAO, EP.TEMPOSERVANTERIOR,');
      Add('     EP.TEMPONAOCREDITADO, EP.TEMPOSERVANTREAL, EP.TEMPOSITESPECIAL,');
      Add('     EP.VALORBASE1, EP.VALORBASE2, EP.VALORBASE3, EP.TEMPOSERVTOTAL,');
      Add('     EP.TEMPOSERVPUBLANT, EP.TEMPOINSSAFAST, EP.TEMPOSERVPRIVANT,');
      Add('     EP.FLGDIRETOR, EP.CODCENTROCUSTO, ST.DESCRICAO, ST.TIPOSIT,');
      Add('     ST.FLGINTERNO, ST.CODCAGED, ST.CODMOVFGTS, ST.FLGUSO,');
      Add('     PP.IDPLANOPREV, PP.INSCRICAONUMERO, PP.INSCRICAODATA');
    end
    else
      Add('     ('' '') AS DATADEMISSAO, ('' '') AS DATAADMISSAO, 0 AS IDPESSJUR');

    Add('   FROM');
    Add('     PESSOA P, PESSOAFISICA PF, ENDPESS E, CIDADES CI, PROCESSOTRAB PT');

    if (rgSelDadosFunc.ItemIndex = 0) then
      Add('     ,ELEGPATRO EP, SITFUNC ST, SITPART SP, PARTPREVPLAN PP');

    Add('   WHERE');
    Add('     (PT.INDMATERIA     IN (2,3)) AND');
    Add('     (PT.IDRECLAMANTE    = P.IDPESSOA) AND');
    Add('     (P.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
    Add('     (E.IDCIDADES        = CI.IDCIDADES(+))  AND');
    Add('     (P.IDPESSOA         = PF.IDPESSOA(+)) AND');

    if (rgSelDadosFunc.ItemIndex = 0) then
    begin
      Add('     (EP.IDPESSOA        = P.IDPESSOA) AND');
      Add('     (EP.IDPESSJUR       = PP.IDPESSJUR) AND');
      Add('     (PP.IDPESSOA        = P.IDPESSOA) AND');
      Add('     (EP.IDSITFUNC       = ST.IDSITFUNC(+)) AND');
      Add('     (PP.IDSITPART       = SP.IDSITPART(+)) AND');

      if (not cbxAtivos.Checked) then
        Add('     (ST.TIPOSIT <> ''A'') AND');
      if (not cbxAfastados.Checked) then
        Add('     (ST.TIPOSIT <> ''F'') AND');
      if (not cbxDemitidos.Checked) then
        Add('     (ST.TIPOSIT <> ''D'') AND');
      if (not cbxEfetivos.Checked) then
        Add('     (SP.FLGINTERNO <> ''AT'') AND');
      if (not cbxMantidos.Checked) then
        Add('     (SP.FLGINTERNO <> ''MA'') AND');
      if (not cbxMantidoParc.Checked) then
        Add('     (SP.FLGINTERNO <> ''MP'') AND');
      if (not cbxAssistidos.Checked) then
        Add('     (SP.FLGINTERNO <> ''AS'') AND');
      if (not cbxManutSaldo.Checked) then
        Add('     (SP.FLGINTERNO <> ''MS'') AND');
      if (not cbxCancelados.Checked) then
        Add('     (SP.FLGINTERNO <> ''CA'') AND');
    end;

    if (rgSelCargoLot.ItemIndex = 0) and (rgSelEstab.ItemIndex > 0) then
      Add('     (EP.IDESTAB IN ' +sEstab+ ') AND');

    if (rgSelDadosFunc.ItemIndex = 0) and (rgSelPlano.ItemIndex > 0) then
      Add('     (PP.IDPLANOPREV IN ' +sPlano+ ') AND');

    if (rgSelCargoLot.ItemIndex = 0) and (dblcLotacao.Text <> '**********') then
      for I:=1 to length(trim(dblcLotacao.Text)) do
        if (copy(dblcLOTACAO.Text, I, 1) <> '*') then
          Add('     (SUBSTR(EP.CODCENTROCUSTO, ' + IntToStr(I) +
              ' , 1) = ''' + copy(dblcLOTACAO.Text, I, 1) + ''') AND');

    if (rgSelDadosFunc.ItemIndex = 0) then
    begin
      if (ednAdm1.VALUE > 0) then //Tempo de Casa
      begin
        Add('     (to_number(substr(to_char(sysdate,''dd/mm/yyyy''),7,10)) -');
        Add('      to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),7,10))) * 12 +');
        Add('      to_number(substr(to_char(sysdate,''dd/mm/yyyy''),4,2)) -');
        Add('      to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),4,2)) +');
        Add('      decode((to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) -');
        Add('      to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2))) /');
        Add('      decode(substr(to_char(sysdate,''dd/mm/yyyy''),1,2),');
        Add('      substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2),1,');
        Add('      abs(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) -');
        Add('      to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2)))),-1,-1,0)'+
            ' >= ' + IntToStr(ednAdm1.VALUE) + ' AND');
      end;

      if (ednAdm2.VALUE < 999) then //Tempo de Casa
      begin
        Add('     (to_number(substr(to_char(sysdate,''dd/mm/yyyy''),7,10)) -');
        Add('      to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),7,10))) * 12 +');
        Add('      to_number(substr(to_char(sysdate,''dd/mm/yyyy''),4,2)) -');
        Add('      to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),4,2)) +');
        Add('      decode((to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) -');
        Add('      to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2))) /');
        Add('      decode(substr(to_char(sysdate,''dd/mm/yyyy''),1,2),');
        Add('      substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2),1,');
        Add('      abs(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) -');
        Add('      to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2)))),-1,-1,0)'+
            ' <= ' + IntToStr(ednAdm2.VALUE) + ' AND');
      end;

      if (ednCar1.VALUE > 0) then //Tempo na Fundação
      begin
        Add('     (to_number(substr(to_char(sysdate,''dd/mm/yyyy''),7,10)) -');
        Add('      to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),7,10))) * 12 +');
        Add('      to_number(substr(to_char(sysdate,''dd/mm/yyyy''),4,2)) -');
        Add('      to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),4,2)) +');
        Add('      decode((to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) -');
        Add('      to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2))) /');
        Add('      decode(substr(to_char(sysdate,''dd/mm/yyyy''),1,2),');
        Add('      substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2),1,');
        Add('      abs(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) -');
        Add('      to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2)))),-1,-1,0)'+
            ' >= ' + IntToStr(ednCar1.VALUE) + ' AND');
      end;

      if (ednCar2.VALUE < 999) then //Tempo na Fundação
      begin
        Add('     (to_number(substr(to_char(sysdate,''dd/mm/yyyy''),7,10)) -');
        Add('      to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),7,10))) * 12 +');
        Add('      to_number(substr(to_char(sysdate,''dd/mm/yyyy''),4,2)) -');
        Add('      to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),4,2)) +');
        Add('      decode((to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) -');
        Add('      to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2))) /');
        Add('      decode(substr(to_char(sysdate,''dd/mm/yyyy''),1,2),');
        Add('      substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2),1,');
        Add('      abs(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) -');
        Add('      to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2)))),-1,-1,0)'+
            ' <= ' + IntToStr(ednCar2.VALUE) + ' AND');
      end;

      if (StrToInt(ednSal1.Text) > 0) then //Faixa de Salário Particip.
        Add('     (SALPARTICIPACAO >= ' +(ednSal1.Text)+ ') AND');

      if (StrToInt(ednSal2.Text) <> 999999999) then //Faixa de Salário Particip.
        Add('     (SALPARTICIPACAO <= ' +(ednSal2.Text)+ ') AND');
    end;

    if (not cbxFeminino.Checked) then
      Add('     (PF.SEXO <> ''F'') AND');
    if (not cbxMasculino.Checked) then
      Add('     (PF.SEXO <> ''M'') AND');
    if (not cbxSolt.Checked) then
      Add('     (PF.ESTCIVIL <> ''S'') AND');
    if (not cbxCas.Checked) then
      Add('     (PF.ESTCIVIL <> ''C'') AND');
    if (not cbxSep.Checked) then
      Add('     (PF.ESTCIVIL <> ''D'') AND');
    if (not cbxSepJud.Checked) then
      Add('     (PF.ESTCIVIL <> ''J'') AND');
    if (not cbxDes.Checked) then
      Add('     (PF.ESTCIVIL <> ''E'') AND');
    if (not cbxViu.Checked) then
      Add('     (PF.ESTCIVIL <> ''V'') AND');
    if (not cbxOutr.Checked) then
      Add('     (PF.ESTCIVIL <> ''O'') AND');

    if (rgSelCargoLot.ItemIndex = 0) and (rgSelCargo.ItemIndex > 0) then
      Add('     (IDCARGOEXT IN (' +sCargo+ ')) AND');

    if (rgSelCargoLot.ItemIndex = 0) and (rgSelSindi.ItemIndex > 0) then
      Add('     (IDSINDICATO IN (' +sSindi + ')) AND');

    if (ednIda1.VALUE > 0) then  //Faixa Etária
      Add('     ((SYSDATE - DATANASC)/365.25 >= ' +IntToStr(ednIda1.VALUE)+ ') AND');
    if (ednIda2.VALUE < 99) then  //Faixa Etária
      Add('     ((SYSDATE - DATANASC)/365.25 <= ' +IntToStr(ednIda2.VALUE)+ ') AND');

    if (cbxAniv.ItemIndex > 0) then // Mês do Aniversário
      Add('     (to_number(substr(to_char(DATANASC,''dd/mm/yyyy''),4,2)) = '+
          IntToStr(cbxAniv.ItemIndex) + ') AND');

    if (round(StrToInt(ednCep1.Text)) > 0) then //Faixa de CEP
      Add('     (to_number(CEP)/1000 >= ' +ednCep1.Text+ ') AND');
    if (round(StrToInt(ednCep2.Text)) < 99999) then //Faixa de CEP
      Add('     (to_number(CEP)/1000 <= ' +ednCep2.Text+ ') AND');

    if (rgSinal.ItemIndex > -1) then //Grau de Instrução
    begin
      case (rgSinal.ItemIndex) of
        0 : Add('     (IDGRINSTR <= ' +dblcGrauInstr.Text+ ') AND');
        1 : Add('     (IDGRINSTR  = ' +dblcGrauInstr.Text+ ') AND');
        2 : Add('     (IDGRINSTR >= ' +dblcGrauInstr.Text+ ') AND');
      end;
    end;

    Val(dblcProfis.Text,ValComp,CodErro); //Profissão
    if (ValComp > 0) then
      Add('     (IDPROFISS = ' +dblcProfis.Text+ ') AND');

    if (rgSinTot.ItemIndex < 2) or (speDepTot.Value > 0) then // Total Benef. ??????
    begin
      case (rgSinTot.ItemIndex) of
        0 : Add('     (NUMDEPTOT <= ' +IntToStr(speDepTot.Value)+ ') AND');
        1 : Add('     (NUMDEPTOT  = ' +IntToStr(speDepTot.Value)+ ') AND');
        2 : Add('     (NUMDEPTOT >= ' +IntToStr(speDepTot.Value)+ ') AND');
      end;
    end;

    if (rgSinIR.ItemIndex < 2) or (speDepIR.Value > 0) then // Dependentes IRRF
    begin
      case (rgSinIR.ItemIndex) of
        0 : Add('     (NUMDEPIRRF <= ' +IntToStr(speDepIR.Value)+ ') AND');
        1 : Add('     (NUMDEPIRRF  = ' +  IntToStr(speDepIR.Value) + ') AND');
        2 : Add('     (NUMDEPIRRF >= ' +  IntToStr(speDepIR.Value) + ') AND');
      end;
    end;

    sSQL := qryProcesso.SQL[Count-1];
    if (UpperCase(Copy(sSQL, Length(sSQL)-2, 3)) = 'AND') then
    begin
      sSQL := Copy(sSQL, 1, Length(sSQL)-4);
      qryProcesso.SQL[Count-1] := sSQL;
    end;

    Add('  ) RECLAMANTES');
    //--------------------------------------------------------------------------

    if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
      Add('     , (SELECT NUMPROCTRAB, COUNT(*) AS TOTALOBJ'+
          ' FROM OBJPROCTRAB WHERE CODTIPOOBJETO IN ' +sObjeto+
          ' GROUP BY NUMPROCTRAB) OBJETOS');

    if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
      if (rgEtapa.ItemIndex = 1) then
        Add('     , (SELECT NUMPROCTRAB'+
            ' FROM ETAPAPROCTRAB WHERE CODTIPORECURSO IN ' +sEtapa+
            ' AND DATAREALOCOR ='+
            ' (SELECT MAX(DATAREALOCOR) FROM ETAPAPROCTRAB E'+
            ' WHERE E.NUMPROCTRAB = ETAPAPROCTRAB.NUMPROCTRAB'+
            ' GROUP BY NUMPROCTRAB)'+
            ' AND DATAREALOCOR <= SYSDATE) ETAPAS')
      else
        Add('     , (SELECT NUMPROCTRAB, COUNT(*) AS TOTALETP'+
            ' FROM ETAPAPROCTRAB WHERE CODTIPORECURSO IN ' +sEtapa+
            ' GROUP BY NUMPROCTRAB) ETAPAS');

    Add('WHERE');
    Add('  (PT.INDMATERIA   IN (2,3)) AND');
    Add('  (PT.IDRECLAMANTE  = RECLAMANTES.IDPESSOA(+)) AND');
    Add('  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND');
    Add('  (PT.IDCIDADES     = CI.IDCIDADES(+)) AND');

    //if (rgSelDadosFunc.ItemIndex = 1) and (EdDataNot1.Text <> '') then
    //  sSql := sSql + 'RECLAMANTES.DATADEMISSAO = PROCESSOTRAB.DATANOTIF AND ';

    if (EdDataInc1.Text <> '') then
      Add('  (PT.TRGDTINCLUSAO >= to_date(''' + EdDataInc1.Text + ''',''dd/mm/yyyy'')) AND');
    if (EdDataInc2.Text <> '') then
    qryProcesso.SQL.Add('  (TO_DATE(TO_CHAR(PT.TRGDTINCLUSAO,''DD/MM/YYYY''),'+
      '''DD/MM/YYYY'') <= to_date(''' +
      EdDataInc2.Text+ ''',''dd/mm/yyyy'')) AND');

    if (EdDataAju1.Text <> '') then
      Add('  (PT.DATAJUIZO >= to_date(''' + EdDataAju1.Text + ''',''dd/mm/yyyy'')) AND');
    if (EdDataAju2.Text <> '') then
      Add('  (PT.DATAJUIZO <= to_date(''' + EdDataAju2.Text + ''',''dd/mm/yyyy'')) AND');

    if (EdDataNot1.Text <> '') then
      Add('  (PT.DATANOTIF >= to_date(''' + EdDataNot1.Text + ''',''dd/mm/yyyy'')) AND');
    if (EdDataNot2.Text <> '') then
      Add('  (PT.DATANOTIF <= to_date(''' + EdDataNot2.Text + ''',''dd/mm/yyyy'')) AND');

    if (rgSitProc.ItemIndex < 2)  then
      Add('  (FLGSITPROC = ' +IntToStr(rgSitProc.ItemIndex)+ ') AND');

    if (rgSitProc.ItemIndex > 0) and ((EdDataEnc1.Text <> '') or (EdDataEnc2.Text <> '')) then
    begin
      sSql := '  (FLGSITPROC = 0 or ';

      if (EdDataEnc1.Text <> '') then
      begin
        if (EdDataEnc2.Text <> '') then
          sSql := sSql + '(';

        sSql := sSql + '(PT.DATAEFETENC >= to_date(''' +
          EdDataEnc1.Text+ ''',''dd/mm/yyyy''))';
      end;

      if (EdDataEnc2.Text <> '') then
      begin
        if (EdDataEnc1.Text <> '') then
          sSql := sSql + ' AND ';

        sSql := sSql + '(PT.DATAEFETENC <= to_date(''' +
          EdDataEnc2.Text+ ''',''dd/mm/yyyy''))';

        if (EdDataEnc1.Text <> '') then
          sSql := sSql + ')';
      end;

      Add(sSql+ ') AND');
    end;

    if (rgSitProc.ItemIndex > 0) then
    begin
      if not(cbxArquiv.Checked) then
        Add('  (FLGSITPROC = 0 or TIPOENCER <> ''A'') AND');
      if not(cbxAcordo.Checked) then
        Add('  (FLGSITPROC = 0 or TIPOENCER <> ''C'') AND');
      if not(cbxDesist.Checked) then
        Add('  (FLGSITPROC = 0 or TIPOENCER <> ''D'') AND');
      if not(cbxSent.Checked) then
        Add('  (FLGSITPROC = 0 or TIPOENCER <> ''S'') AND');
    end;

    if (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0) then
      Add('  (IDADVOGCASA IN ' +sAdvC+ ') AND');

    if (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0) then
      Add('  (IDADVOGRECDA IN ' +sAdv1+ ') AND');

    if (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0) then
      Add('  (IDADVOGRECTE IN ' +sAdv2+ ') AND');

    if (rgAT.ItemIndex * lstAT.Items.Count > 0) then
      Add('  (IDASSISTTECN IN ' +sAT+ ') AND');

    if (rgTRT.ItemIndex * lstTRT.Items.Count > 0) then
      Add('  (PT.IDVARAJUSTICA IN ' +sTRT+ ') AND');

    if (rgUF.ItemIndex * lstUF.Items.Count > 0) then
      Add('  (IDESTADO IN ' +sUF+ ') AND');

    if  (rgCidade.ItemIndex * lstCidade.Items.Count > 0)  then
      Add('  (PT.IDCIDADES ' + iff(cbxCidadeNegativa.Checked,'NOT','') + ' IN ' + sCidade + ') AND');

    if (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) then
      Add('  (IdTipoProc IN ' + sTipoProc + ') AND');

    if (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0) then
      Add('  (IdTipoAcao IN ' + sTipoAcao + ') AND');

    if (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0) then
      Add('  (FLGSITPROC = 0 or CodTipoSent IN (' + sSentenca + ')) AND');

    if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
    begin
      Add('  (NVL(OBJETOS.TOTALOBJ,0) > 0) AND');
      Add('  (PT.NUMPROCTRAB = OBJETOS.NUMPROCTRAB(+)) AND');
    end;

    if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
      if (rgEtapa.ItemIndex = 1) then
        Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND')
      else
      begin
        Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND');
        Add('  (NVL(ETAPAS.TOTALETP,0) > 0) AND');
      end;

    if (ednAdm1.VALUE > 0) then //Tempo de Existencia
    begin
      Add('  (to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),7,10)) -');
      Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),7,10))) * 12 +');
      Add('   to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),4,2)) -');
      Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),4,2)) +');
      Add('   decode((to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) -');
      Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2))) /');
      Add('   decode(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2),');
      Add('   substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2),1,');
      Add('   abs(to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) -');
      Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2)))),-1,-1,0)'+
          ' >= ' +IntToStr(ednAdm1.VALUE)+ ' AND');
    end;

    if (ednAdm2.VALUE < 999) then //Tempo de Existencia
    begin
      Add('  (to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),7,10)) -');
      Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),7,10))) * 12 +');
      Add('   to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),4,2)) -');
      Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),4,2)) +');
      Add('   decode((to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) -');
      Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2))) /');
      Add('   decode(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2),');
      Add('   substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2),1,');
      Add('   abs(to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) -');
      Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2)))),-1,-1,0)'+
          ' <= ' +IntToStr(ednAdm2.VALUE)+ ' AND');
    end;

    if (rgInstancia.ItemIndex > 0) then
    begin
      case (rgInstancia.ItemIndex) of
        1 : Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NULL AND '+
                'PROCTSTNUM IS NULL) AND');
        2 : Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND '+
                'PROCTSTNUM IS NULL) AND');
        3 : Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND '+
                'PROCTSTNUM IS NOT NULL) AND');
      end;
    end;

    if (rgParte.ItemIndex < 2) then
    begin
      case (rgParte.ItemIndex) of
        0 : Add('  (FLGPARTEATIVA = 1) AND');
        1 : Add('  (FLGPARTEATIVA = 0) AND');
      end;
    end;

    if (StrToFloat(ednNum1.Text) > 0) then
      Add('  (NUMPROCTRAB >= ' +ednNum1.Text+ ') AND');

    if (ednNum2.Text <> '9999999999') then
      Add('  (NUMPROCTRAB <= ' +ednNum2.Text+ ') AND');

    if (StrToFloat(ednCus1.Text) > 0) then
      Add('  (CUSTOPROC >= ' +ednCus1.Text+ ') AND');

    if (ednCus2.Text <> '9999999999') then
      Add('  (CUSTOPROC <= ' +ednCus2.Text+ ') AND');

    sSQL := qryProcesso.SQL[Count-1];
    if (UpperCase(Copy(sSQL, Length(sSQL)-2, 3)) = 'AND') then
    begin
      sSQL := Copy(sSQL, 1, Length(sSQL)-4);
      qryProcesso.SQL[Count-1] := sSQL;
    end;

    if (rgSelDadosFunc.ItemIndex = 0) then
      Add('order by ' +TituOrdF[cmbSequencia.ItemIndex])
    else
      Add('order by ' +TituOrdF[0]);
  end;
  qryProcesso.Open;
end;

procedure TfrmSelProcesso.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmSelProcesso.LeArquivoConfig;
var
  c: byte;
begin
  // Recupera as últimas alterações das opções
  rgSitProc.ItemIndex := recConfig.SitProc;
  cbxArquiv.Checked   := recConfig.Arquiv;
  cbxAcordo.Checked   := recConfig.Acordo;
  cbxDesist.Checked   := recConfig.Desist;
  cbxSent.Checked     := recConfig.Sent;
  rgParte.ItemIndex   := recConfig.Parte;
  ednNum1.Text := recConfig.NumProc1;
  ednNum2.Text := recConfig.NumProc2;
  ednCus1.Text := recConfig.CusProc1;
  ednCus2.Text := recConfig.CusProc2;
  edDataInc1.Text := recConfig.DataInc1;
  edDataInc2.Text := recConfig.DataInc2;
  edDataAju1.Text := recConfig.DataAju1;
  edDataAju2.Text := recConfig.DataAju2;
  edDataNot1.Text := recConfig.DataNot1;
  edDataNot2.Text := recConfig.DataNot2;
  edDataEnc1.Text := recConfig.DataEnc1;
  edDataEnc2.Text := recConfig.DataEnc2;
  rgTipoProc.ItemIndex := recConfig.TipoProc;
  rgTipoAcao.ItemIndex := recConfig.TipoAcao;
  lstCodTipoProc.Items.Clear;
  if (High(recConfig.ListaCodTipoProc) >= 0) then
    for c:=0 to High(recConfig.ListaCodTipoProc) do
      lstCodTipoProc.Items.Add(recConfig.ListaCodTipoProc[c]);
  lstTipoProc.Items.Clear;
  if (High(recConfig.ListaTipoProc) >= 0) then
    for c:=0 to High(recConfig.ListaTipoProc) do
      lstTipoProc.Items.Add(recConfig.ListaTipoProc[c]);
  lstCodTipoAcao.Items.Clear;
  if (High(recConfig.ListaCodTipoAcao) >= 0) then
    for c:=0 to High(recConfig.ListaCodTipoAcao) do
      lstCodTipoAcao.Items.Add(recConfig.ListaCodTipoAcao[c]);
  lstTipoAcao.Items.Clear;
  if (High(recConfig.ListaTipoAcao) >= 0) then
    for c:=0 to High(recConfig.ListaTipoAcao) do
      lstTipoAcao.Items.Add(recConfig.ListaTipoAcao[c]);
  ednAdm1.Value := recConfig.NumAdm1;
  ednAdm2.Value := recConfig.NumAdm2;
end;

procedure TfrmSelProcesso.GravaArquivoConfig;
var
  c: byte;
begin
  recConfig.SitProc  := rgSitProc.ItemIndex;
  recConfig.Arquiv   := cbxArquiv.Checked;
  recConfig.Acordo   := cbxAcordo.Checked;
  recConfig.Desist   := cbxDesist.Checked;
  recConfig.Sent     := cbxSent.Checked;
  recConfig.Parte    := rgParte.ItemIndex;
  recConfig.NumProc1 := ednNum1.Text;
  recConfig.NumProc2 := ednNum2.Text;
  recConfig.CusProc1 := ednCus1.Text;
  recConfig.CusProc2 := ednCus2.Text;
  recConfig.DataInc1 := edDataInc1.Text;
  recConfig.DataInc2 := edDataInc2.Text;
  recConfig.DataAju1 := edDataAju1.Text;
  recConfig.DataAju2 := edDataAju2.Text;
  recConfig.DataNot1 := edDataNot1.Text;
  recConfig.DataNot2 := edDataNot2.Text;
  recConfig.DataEnc1 := edDataEnc1.Text;
  recConfig.DataEnc2 := edDataEnc2.Text;
  recConfig.TipoProc := rgTipoProc.ItemIndex;
  recConfig.TipoAcao := rgTipoAcao.ItemIndex;
  SetLength(recConfig.ListaCodTipoProc, lstCodTipoProc.Items.Count);
  SetLength(recConfig.ListaTipoProc, lstTipoProc.Items.Count);
  SetLength(recConfig.ListaCodTipoAcao, lstCodTipoAcao.Items.Count);
  SetLength(recConfig.ListaTipoAcao, lstTipoAcao.Items.Count);
  if (lstCodTipoProc.Items.Count > 0) then
  begin
    for c:=0 to lstCodTipoProc.Items.Count-1 do
      recConfig.ListaCodTipoProc[c] := lstCodTipoProc.Items[c];
    for c:=0 to lstTipoProc.Items.Count-1 do
      recConfig.ListaTipoProc[c] := lstTipoProc.Items[c];
  end;
  if (lstCodTipoAcao.Items.Count > 0) then
  begin
    for c:=0 to lstCodTipoAcao.Items.Count-1 do
      recConfig.ListaCodTipoAcao[c] := lstCodTipoAcao.Items[c];
    for c:=0 to lstTipoAcao.Items.Count-1 do
      recConfig.ListaTipoAcao[c] := lstTipoAcao.Items[c];
  end;
  recConfig.NumAdm1 := ednAdm1.Value;
  recConfig.NumAdm2 := ednAdm2.Value;
end;

procedure InitRecConfig;
begin
  // Pasta Dados Pessoais
  recConfig.Parte    := 2;
  recConfig.SitProc  := 2;
  recConfig.Arquiv   := true;
  recConfig.Acordo   := true;
  recConfig.Desist   := true;
  recConfig.Sent     := true;
  recConfig.NumProc1 := '0';
  recConfig.NumProc2 := '9999999999';
  recConfig.CusProc1 := '0';
  recConfig.CusProc2 := '9999999999';
  recConfig.DataInc1 := '';
  recConfig.DataInc2 := DateToStr(Date);
  recConfig.DataAju1 := '';
  recConfig.DataAju2 := DateToStr(Date);
  recConfig.DataNot1 := '';
  recConfig.DataNot2 := DateToStr(Date);
  recConfig.DataEnc1 := '';
  recConfig.DataEnc2 := DateToStr(Date);
  recConfig.TipoProc := 0;
  recConfig.TipoAcao := 0;
  SetLength(recConfig.ListaCodTipoProc, 0);
  SetLength(recConfig.ListaTipoProc, 0);
  SetLength(recConfig.ListaCodTipoAcao, 0);
  SetLength(recConfig.ListaTipoAcao, 0);
  recConfig.NumAdm1 := 0;
  recConfig.NumAdm2 := 999;
end;

procedure TfrmSelProcesso.rgCidadeClick(Sender: TObject);
begin
  inherited;
  if (qryCidade.EOF) then
    rgCidade.ItemIndex := 0;
  gbxCidade.Visible := (rgCidade.ItemIndex = 1);

end;

procedure TfrmSelProcesso.dblcCidadeCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstCidade.Items.Add(qryCidade.FieldByName('NOME').AsString);
    lstCodCidade.Items.Add(qryCidade.FieldByName('IDCIDADES').AsString);
  end;

end;

procedure TfrmSelProcesso.lstCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstCidade.Items.Count > 0) then
  begin
    SvItem := lstCidade.ItemIndex;
    lstCidade.Items.Delete(SvItem);
    lstCodCidade.Items.Delete(SvItem);
  end;

end;

procedure TfrmSelProcesso.MudouEstado;
var
  sUF: string;
  I: integer;
begin
  qryCidade.Close;

  if  (rgUF.ItemIndex * lstUF.Items.Count > 0) then
  begin
      sUF := '(';
      for  I := 0  to  (lstUF.Items.Count - 1)  do
      begin
          if lstUF.Items[I] = ''  then  break;
          if  I > 0  then  sUF := sUF + ',';
          sUF := sUF + lstCodUF.Items[I];
      end;
      sUF := sUF + ')';
      qryCidade.Sql[5] := ' C.IDESTADO IN ' + sUF;
  end
  else
      qryCidade.Sql[5] := '1 = 1';

  qryCidade.Open;
end;

end.
