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
    qryTRT: TwwQuery;
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
    qryObjeto: TwwQuery;
    rgObjeto: TRadioGroup;
    gbxObjeto: TGroupBox;
    dblcObjeto: TwwDBLookupCombo;
    lstObjeto: TListBox;
    lstCodObjeto: TListBox;
    qrySentenca: TwwQuery;
    qryEtapa: TwwQuery;
    rgSentenca: TRadioGroup;
    gbxSentenca: TGroupBox;
    dblcSentenca: TwwDBLookupCombo;
    lstSentenca: TListBox;
    lstCodSentenca: TListBox;
    gbxEtapa: TGroupBox;
    dblcEtapa: TwwDBLookupCombo;
    lstEtapa: TListBox;
    lstCodEtapa: TListBox;
    rgInstancia: TRadioGroup;
    tbsContraParte: TTabSheet;
    qryEstado: TwwQuery;
    qryCidade: TwwQuery;
    qryRecl: TwwQuery;
    tblPessoal: TwwQuery;
    gbxTipo: TGroupBox;
    cbxJuridica: TCheckBox;
    cbxFisica: TCheckBox;
    gbxCep: TGroupBox;
    Label7: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    rgEstado: TRadioGroup;
    gbxEstado: TGroupBox;
    dblcEstado: TwwDBLookupCombo;
    lstEstado: TListBox;
    lstCodEstado: TListBox;
    rgCidade: TRadioGroup;
    gbxCidade: TGroupBox;
    dblcCidade: TwwDBLookupCombo;
    lstCidade: TListBox;
    lstCodCidade: TListBox;
    rgRecl: TRadioGroup;
    gbxRecl: TGroupBox;
    dblcRecl: TwwDBLookupCombo;
    lstRecl: TListBox;
    lstCodRecl: TListBox;
    rgEtapa: TRadioGroup;
    qryUF: TwwQuery;
    rgUF: TRadioGroup;
    gbxUF: TGroupBox;
    dblcUF: TwwDBLookupCombo;
    lstUF: TListBox;
    lstCodUF: TListBox;
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
    procedure FormCreate(Sender: TObject);
    procedure rgAdv1Click(Sender: TObject);
    procedure rgAdv2Click(Sender: TObject);
    procedure rgATClick(Sender: TObject);
    procedure dblcAdv1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcAdv2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcATCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstAdv1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstAdv2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstATKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure rgTRTClick(Sender: TObject);
    procedure dblcTRTCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstTRTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdnNum1Change(Sender: TObject);
    procedure EdnNum2Change(Sender: TObject);
    procedure ednCus1Change(Sender: TObject);
    procedure ednCus2Change(Sender: TObject);
    procedure rgSitProcClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoProcClick(Sender: TObject);
    procedure dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstTipoProcKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgTipoAcaoClick(Sender: TObject);
    procedure dblcTipoAcaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstTipoAcaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgAdvCClick(Sender: TObject);
    procedure dblcAdvCCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstAdvCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgObjetoClick(Sender: TObject);
    procedure dblcObjetoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstObjetoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgEtapaClick(Sender: TObject);
    procedure dblcEtapaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstEtapaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSentencaClick(Sender: TObject);
    procedure dblcSentencaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstSentencaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgEstadoClick(Sender: TObject);
    procedure dblcEstadoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstEstadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgCidadeClick(Sender: TObject);
    procedure dblcCidadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstCidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgReclClick(Sender: TObject);
    procedure dblcReclCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstReclKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgUFClick(Sender: TObject);
    procedure dblcUFCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstUFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MudouEstado;
  end;

var
  frmSelProcesso: TfrmSelProcesso;
  SvItem: integer;
  TituSeq: array[0..5] of string = (
    'Nome',
    'Estado, Cidade, Nome',
    'Cidade, Nome',
    'Tipo de Pessoa, Nome',
    'Estado, Cidade, Tipo de Pessoa, Nome',
    'Cidade, Tipo de Pessoa, Nome');

  TituOrdF: array[0..5] of string = (
    'UPPER(RECLAMANTES.NOME)',
    'UPPER(ENDRECLAMANTES.NOMEESTADO), UPPER(ENDRECLAMANTES.CIDADE), UPPER(RECLAMANTES.NOME)',
    'UPPER(ENDRECLAMANTES.CIDADE), UPPER(RECLAMANTES.NOME)',
    'RECLAMANTES.TIPO, UPPER(RECLAMANTES.NOME)',
    'UPPER(ENDRECLAMANTES.NOMEESTADO), UPPER(ENDRECLAMANTES.CIDADE), RECLAMANTES.TIPO, UPPER(RECLAMANTES.NOME)',
    'UPPER(ENDRECLAMANTES.CIDADE), RECLAMANTES.TIPO, UPPER(RECLAMANTES.NOME)');

implementation

uses uMensErro;

{$R *.DFM}

procedure TfrmSelProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  EdDataInc2.Date := Date+1;
  EdDataNot2.Date := Date;
  EdDataAju2.Date := Date;
  EdDataEnc2.Date := Date;
  qryAdvog1.Open;
  qryAdvog2.Open;
  qryAdvCasa.Open;
  qryAT.Open;
  qryTRT.Open;
  qryTipoProc.Open;
  qryTipoAcao.Open;
  qryObjeto.Open;
  qryEtapa.Open;
  qrySentenca.Open;
  qryEstado.Open;
  qryUF.Open;
  qryCidade.Open;
  qryRecl.Open;

  cmbSequencia.ItemIndex := 0;
  cmbSequencia.Text := TituSeq[0];
  PageControl1.ActivePageIndex := 0;  
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
  if (qryTRT.EOF) then
    rgTRT.ItemIndex := 0;
  gbxTRT.Visible := (rgTRT.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcTRTCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  lstTRT.Items.Add(qryTRT.FieldByName('DESCRICAO').Value);
  lstCodTRT.Items.Add(qryTRT.FieldByName('IDVARAJUSTICA').AsString);
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
  if StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text) then
    ednNum1.Text := ednNum2.Text;
end;

procedure TfrmSelProcesso.EdnNum2Change(Sender: TObject);
begin
  if StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text) then
    ednNum2.Text := ednNum1.Text;
end;

procedure TfrmSelProcesso.ednCus1Change(Sender: TObject);
begin
  if StrToFloat(ednCus1.Text) > StrToFloat(ednCus2.Text) then
    ednCus1.Text := ednCus2.Text;
end;

procedure TfrmSelProcesso.ednCus2Change(Sender: TObject);
begin
  if StrToFloat(ednCus2.Text) < StrToFloat(ednCus1.Text) then
    ednCus2.Text := ednCus1.Text;
end;

procedure TfrmSelProcesso.rgSitProcClick(Sender: TObject);
begin
  gbxTipEncer.Visible := (rgSitProc.ItemIndex > 0);
  gbxDataEnc.Visible  := (rgSitProc.ItemIndex > 0);
end;

procedure TfrmSelProcesso.rgTipoProcClick(Sender: TObject);
begin
  inherited;
  if (qryTipoProc.EOF) then
    rgTipoProc.ItemIndex := 0;
  gbxTipoProc.Visible := (rgTipoProc.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  lstTipoProc.Items.Add(qryTipoProc.FieldByName('NOMETIPOPROC').Value);
  lstCodTipoProc.Items.Add(qryTipoProc.FieldByName('IDTIPOPROC').AsString);
end;

procedure TfrmSelProcesso.lstTipoProcKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
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

procedure TfrmSelProcesso.dblcTipoAcaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  lstTipoAcao.Items.Add(qryTipoAcao.FieldByName('DESCRICAO').Value);
  lstCodTipoAcao.Items.Add(qryTipoAcao.FieldByName('IDTIPOACAO').AsString);
end;

procedure TfrmSelProcesso.lstTipoAcaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstTipoAcao.Items.Count > 0) then
  begin
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

procedure TfrmSelProcesso.dblcAdvCCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstAdvC.Items.Add(qryAdvCasa.FieldByName('NOME').Value);
    lstCodAdvC.Items.Add(qryAdvCasa.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstAdvCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstAdvC.Items.Count > 0) then
  begin
    SvItem := lstAdvC.ItemIndex;
    lstAdvC.Items.Delete(SvItem);
    lstCodAdvC.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgObjetoClick(Sender: TObject);
begin
  if (qryObjeto.EOF) then
    rgObjeto.ItemIndex := 0;
  gbxObjeto.Visible := (rgObjeto.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcObjetoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  lstObjeto.Items.Add(qryObjeto.FieldByName('DESCRICAO').Value);
  lstCodObjeto.Items.Add(qryObjeto.FieldByName('CODTIPOOBJETO').AsString);
end;

procedure TfrmSelProcesso.lstObjetoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstObjeto.Items.Count > 0) then
  begin
    SvItem := lstObjeto.ItemIndex;
    lstObjeto.Items.Delete(SvItem);
    lstCodObjeto.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgEtapaClick(Sender: TObject);
begin
  if (qryEtapa.EOF) then
    rgEtapa.ItemIndex := 0;
  gbxEtapa.Visible := (rgEtapa.ItemIndex > 0);
end;

procedure TfrmSelProcesso.dblcEtapaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  lstEtapa.Items.Add(qryEtapa.FieldByName('DESCRICAO').Value);
  lstCodEtapa.Items.Add(qryEtapa.FieldByName('CODTIPORECURSO').AsString);
end;

procedure TfrmSelProcesso.lstEtapaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstEtapa.Items.Count > 0) then
  begin
    SvItem := lstEtapa.ItemIndex;
    lstEtapa.Items.Delete(SvItem);
    lstCodEtapa.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgSentencaClick(Sender: TObject);
begin
  if (qrySentenca.EOF) then
    rgSentenca.ItemIndex := 0;
  gbxSentenca.Visible := (rgSentenca.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcSentencaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  lstSentenca.Items.Add(qrySentenca.FieldByName('DESCRICAO').Value);
  lstCodSentenca.Items.Add(qrySentenca.FieldByName('CODTIPOSENT').AsString);
end;

procedure TfrmSelProcesso.lstSentencaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstSentenca.Items.Count > 0) then
  begin
    SvItem := lstSentenca.ItemIndex;
    lstSentenca.Items.Delete(SvItem);
    lstCodSentenca.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgEstadoClick(Sender: TObject);
begin
  if (rgEstado.ItemIndex = 1) and not(qryEstado.Active) then
    qryEstado.Open;
  if (qryEstado.EOF) then
    rgEstado.ItemIndex := 0;
  gbxEstado.Visible := (rgEstado.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcEstadoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstEstado.Items.Add(qryEstado.FieldByName('NOMEESTADO').Value);
    lstCodEstado.Items.Add(qryEstado.FieldByName('IDESTADO').AsString);
  end;
end;

procedure TfrmSelProcesso.lstEstadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstEstado.Items.Count > 0) then
  begin
    SvItem := lstEstado.ItemIndex;
    lstEstado.Items.Delete(SvItem);
    lstCodEstado.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgCidadeClick(Sender: TObject);
begin
  if (rgCidade.ItemIndex = 1) and not(qryCidade.Active) then
    qryCidade.Open;
  if (qryCidade.EOF) then
    rgCidade.ItemIndex := 0;
  gbxCidade.Visible := (rgCidade.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcCidadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstCidade.Items.Add(qryCidade.FieldByName('NOME').Value);
    lstCodCidade.Items.Add(qryCidade.FieldByName('IDCIDADES').AsString);
  end;
end;

procedure TfrmSelProcesso.lstCidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstCidade.Items.Count > 0) then
  begin
    SvItem := lstCidade.ItemIndex;
    lstCidade.Items.Delete(SvItem);
    lstCodCidade.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.rgReclClick(Sender: TObject);
begin
  if (rgRecl.ItemIndex = 1) and not(qryRecl.Active) then
    qryRecl.Open;
  if (qryRecl.EOF) then
    rgRecl.ItemIndex := 0;
  gbxRecl.Visible := (rgRecl.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcReclCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (modified) then
  begin
    lstRecl.Items.Add(qryRecl.FieldByName('NOME').Value);
    lstCodRecl.Items.Add(qryRecl.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstReclKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Delete) and (lstRecl.Items.Count > 0) then
  begin
    SvItem := lstRecl.ItemIndex;
    lstRecl.Items.Delete(SvItem);
    lstCodRecl.Items.Delete(SvItem);
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

procedure TfrmSelProcesso.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmSelProcesso.bbtnConfirmarClick(Sender: TObject);
var
  I: integer;
  sAdvC, sAdv1, sAdv2, sAT, sTRT, sTipoProc, sTipoAcao, sObjeto, sEtapa, sSentenca,
  sSql, sEstado, sCidade, sRecl, sUF: string;
  MarcouJuridica, MarcouFisica: boolean;
begin
  inherited;
  ds.Dataset.Close;

  MarcouJuridica := (cbxJuridica.Checked);
  MarcouFisica   := (cbxFisica.Checked);

  if not(MarcouJuridica) and not(MarcouFisica) then
  begin
    MsgDlg('Assinale Ao Menos Um Tipo de Pessoa', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    gbxTipo.SetFocus;
    exit;
  end;

  if (rgEstado.ItemIndex > 0) then
  begin
    sEstado := '(';
    for I:=0 to (lstEstado.Items.Count-1) do
    begin
      if (lstEstado.Items[I] = '') then
        break;
      if (I > 0) then
        sEstado := sEstado + ',';
      sEstado := sEstado + lstCodEstado.Items[I];
    end;
    sEstado := sEstado + ')';
  end;

  if (rgCidade.ItemIndex > 0) then
  begin
    sCidade := '(';
    for I:=0 to (lstCidade.Items.Count-1) do
    begin
      if (lstCidade.Items[I] = '') then
        break;
      if (I > 0) then
        sCidade := sCidade + ',';
      sCidade := sCidade + lstCodCidade.Items[I];
    end;
    sCidade := sCidade + ')';
  end;

  if (rgRecl.ItemIndex > 0) then
  begin
    sRecl := '(';
    for I:=0 to (lstRecl.Items.Count-1) do
    begin
      if (lstRecl.Items[I] = '') then
        break;
      if (I > 0) then
        sRecl := sRecl + ',';
      sRecl := sRecl + lstCodRecl.Items[I];
    end;
    sRecl := sRecl + ')';
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
    for  I:=0 to (lstUF.Items.Count-1) do
    begin
      if (lstUF.Items[I] = '') then
        break;
      if (I > 0) then
        sUF := sUF + ',';
      sUF := sUF + lstCodUF.Items[I];
    end;
    sUF := sUF + ')';
  end;

  if (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) then
  begin
    sTipoProc := '(';
    for I:=0 to (lstTipoProc.Items.Count - 1) do
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
      if (lstEtapa.Items[I] = '') then
        break;
      if (I > 0) then
        sEtapa := sEtapa + ',';
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

  qryProcesso.SQL.Clear;
  qryProcesso.SQL.Add('SELECT DISTINCT');
  qryProcesso.SQL.Add('  PROCESSOTRAB.*, RECLAMANTES.*, ENDRECLAMANTES.*, CIDADES.IDESTADO,');
  qryProcesso.SQL.Add('  VARAJUSTICA.DESCRICAO AS NOMEVARA');
  qryProcesso.SQL.Add('FROM');
  qryProcesso.SQL.Add('  PROCESSOTRAB, CIDADES, VARAJUSTICA,');
  //--------------------------------------------------------------------------------------
  // Sub Select de reclamantes
  qryProcesso.SQL.Add('  (SELECT');
  qryProcesso.SQL.Add('     PESSOA.IDPESSOA, PESSOA.TIPO, PESSOA.NUMDOCUMENTO,');
  qryProcesso.SQL.Add('     DECODE(PESSOA.TIPO,''F'',PESSOA.NOME,PESSOA.RAZAOSOCIAL) AS NOME');
  qryProcesso.SQL.Add('   FROM');
  qryProcesso.SQL.Add('     PESSOA, PROCESSOTRAB');
  qryProcesso.SQL.Add('   WHERE');
  qryProcesso.SQL.Add('     (PROCESSOTRAB.INDMATERIA   > 3) AND');

  if (rgRecl.ItemIndex > 0) then
    qryProcesso.SQL.Add('     (PESSOA.IDPESSOA IN ' +sRecl+ ') AND');

  if not(MarcouJuridica) then
    qryProcesso.SQL.Add('     (PESSOA.TIPO <> ''J'') AND');
  if not(MarcouFisica) then
    qryProcesso.SQL.Add('     (PESSOA.TIPO <> ''F'') AND');

  qryProcesso.SQL.Add('     (PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA)');
  qryProcesso.SQL.Add('  ) RECLAMANTES,');
  //--------------------------------------------------------------------------------------
  // Sub Select de Endereço dos reclamantes
  qryProcesso.SQL.Add('  (SELECT');
  qryProcesso.SQL.Add('     PESSOA.IDPESSOA, CIDADES.NOME AS CIDADE, ENDPESS.LOGRADOURO,');
  qryProcesso.SQL.Add('     ENDPESS.CODESTADO, ENDPESS.NUMERO, ENDPESS.COMPLEMENTO,');
  qryProcesso.SQL.Add('     ENDPESS.BAIRRO, ENDPESS.CEP, ESTADO.NOMEESTADO');
  qryProcesso.SQL.Add('   FROM');
  qryProcesso.SQL.Add('     PESSOA, ENDPESS, CIDADES, ESTADO, PROCESSOTRAB');
  qryProcesso.SQL.Add('   WHERE');
  qryProcesso.SQL.Add('     (PROCESSOTRAB.INDMATERIA   > 3) AND');

  if (rgRecl.ItemIndex > 0) then
    qryProcesso.SQL.Add('     (PESSOA.IDPESSOA IN ' +sRecl+ ') AND');

  if not(MarcouJuridica) then
    qryProcesso.SQL.Add('     (PESSOA.TIPO <> ''J'') AND');
  if not(MarcouFisica) then
    qryProcesso.SQL.Add('     (PESSOA.TIPO <> ''F'') AND');

  if (rgEstado.ItemIndex > 0) then
    qryProcesso.SQL.Add('     (ESTADO.IDESTADO IN ' + sEstado + ') AND');
  if (rgCidade.ItemIndex > 0) then
    qryProcesso.SQL.Add('     (CIDADES.IDCIDADES IN ' + sCidade + ') AND');

  if (Round(StrToInt(ednCep1.Text)) > 0) then     //Faixa de CEP
    qryProcesso.SQL.Add('     (to_number(CEP)/1000 >= ' +ednCep1.Text+ ') AND');
  if (Round(StrToInt(ednCep2.Text)) < 99999) then //Faixa de CEP
    qryProcesso.SQL.Add('     (to_number(CEP)/1000 <= ' + ednCep2.Text+ ') AND');

  qryProcesso.SQL.Add('     (PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) AND');
  qryProcesso.SQL.Add('     (((PESSOA.TIPO = ''F'') AND');
  qryProcesso.SQL.Add('       (PESSOA.IDENDRESIDENCIAL = ENDPESS.IDENDERECO)) OR');
  qryProcesso.SQL.Add('      ((PESSOA.TIPO = ''J'') AND');
  qryProcesso.SQL.Add('       (PESSOA.IDENDCOMERCIAL = ENDPESS.IDENDERECO))) AND');
  qryProcesso.SQL.Add('     (ENDPESS.IDCIDADES = CIDADES.IDCIDADES(+)) AND');
  qryProcesso.SQL.Add('     (CIDADES.IDESTADO = ESTADO.IDESTADO(+))');
  qryProcesso.SQL.Add('  ) ENDRECLAMANTES');
  //------------------------------------------------------------------------------
  if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
  begin
    qryProcesso.SQL.Add(', (SELECT');
    qryProcesso.SQL.Add('     NUMPROCTRAB, COUNT(*) AS TOTALOBJ');
    qryProcesso.SQL.Add('   FROM');
    qryProcesso.SQL.Add('     OBJPROCTRAB');
    qryProcesso.SQL.Add('   WHERE');
    qryProcesso.SQL.Add('     (CODTIPOOBJETO IN ' +sObjeto+ ')');
    qryProcesso.SQL.Add('   GROUP BY NUMPROCTRAB');
    qryProcesso.SQL.Add('  ) OBJETOS');
  end;

  if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
    if (rgEtapa.ItemIndex = 1) then
    begin
      qryProcesso.SQL.Add(', (SELECT');
      qryProcesso.SQL.Add('     NUMPROCTRAB');
      qryProcesso.SQL.Add('   FROM');
      qryProcesso.SQL.Add('     ETAPAPROCTRAB');
      qryProcesso.SQL.Add('   WHERE');
      qryProcesso.SQL.Add('     (CODTIPORECURSO IN ' +sEtapa+ ') AND');
      qryProcesso.SQL.Add('     (DATAREALOCOR = (SELECT MAX(DATAREALOCOR)');
      qryProcesso.SQL.Add('                      FROM   ETAPAPROCTRAB E');
      qryProcesso.SQL.Add('                      WHERE  (ETAPAPROCTRAB.NUMPROCTRAB = E.NUMPROCTRAB)');
      qryProcesso.SQL.Add('                      GROUP BY NUMPROCTRAB)) AND');
      qryProcesso.SQL.Add('     (DATAREALOCOR <= SYSDATE)');
      qryProcesso.SQL.Add('   ) ETAPAS');
    end  
    else
    begin
      qryProcesso.SQL.Add(', (SELECT');
      qryProcesso.SQL.Add('     NUMPROCTRAB, COUNT(*) AS TOTALETP');
      qryProcesso.SQL.Add('   FROM');
      qryProcesso.SQL.Add('     ETAPAPROCTRAB');
      qryProcesso.SQL.Add('   WHERE');
      qryProcesso.SQL.Add('     (CODTIPORECURSO IN ' +sEtapa+ ')');
      qryProcesso.SQL.Add('   GROUP BY NUMPROCTRAB');
      qryProcesso.SQL.Add('  ) ETAPAS');
    end;

  qryProcesso.SQL.Add('WHERE');
  qryProcesso.SQL.Add('  (PROCESSOTRAB.INDMATERIA > 3) AND');

  if (EdDataInc1.Text <> '') then
    qryProcesso.SQL.Add('  (PROCESSOTRAB.TRGDTINCLUSAO >= to_date(''' +
      EdDataInc1.Text+ ''',''dd/mm/yyyy'')) AND');
  if (EdDataInc2.Text <> '') then
    qryProcesso.SQL.Add('  (PROCESSOTRAB.TRGDTINCLUSAO <= to_date(''' +
      EdDataInc2.Text+ ''',''dd/mm/yyyy'')) AND');

  if (EdDataAju1.Text <> '') then
    qryProcesso.SQL.Add('  (PROCESSOTRAB.DATAJUIZO >= to_date(''' +
      EdDataAju1.Text+ ''',''dd/mm/yyyy'')) AND');
  if (EdDataAju2.Text <> '') then
    qryProcesso.SQL.Add('  (PROCESSOTRAB.DATAJUIZO <= to_date(''' +
      EdDataAju2.Text+ ''',''dd/mm/yyyy'')) AND');

  if (EdDataNot1.Text <> '') then
    qryProcesso.SQL.Add('  (PROCESSOTRAB.DATANOTIF >= to_date(''' +
      EdDataNot1.Text+ ''',''dd/mm/yyyy'')) AND');
  if (EdDataNot2.Text <> '') then
    qryProcesso.SQL.Add('  (PROCESSOTRAB.DATANOTIF <= to_date(''' +
      EdDataNot2.Text+ ''',''dd/mm/yyyy'')) AND');

  if (rgSitProc.ItemIndex < 2) then
    qryProcesso.SQL.Add('  (FLGSITPROC = ' +IntToStr(rgSitProc.ItemIndex)+ ') AND');

  if (rgSitProc.ItemIndex > 0) and ((EdDataEnc1.Text <> '') or (EdDataEnc2.Text <> '')) then
  begin
    sSql := '  (FLGSITPROC = 0 or ';

    if (EdDataEnc1.Text <> '') then
    begin
      if (EdDataEnc2.Text <> '') then
        sSql := sSql + '(';

      sSql := sSql + '(PROCESSOTRAB.DATAEFETENC >= to_date(''' +
                      EdDataEnc1.Text+ ''',''dd/mm/yyyy''))';
    end;

    if (EdDataEnc2.Text <> '') then
    begin
      if (EdDataEnc1.Text <> '') then
        sSql := sSql + ' AND ';

      sSql := sSql + '(PROCESSOTRAB.DATAEFETENC <= to_date(''' +
                      EdDataEnc2.Text+ ''',''dd/mm/yyyy''))';

      if (EdDataEnc1.Text <> '') then
        sSql := sSql + ')';
    end;
    qryProcesso.SQL.Add(sSql+ ') AND');
  end;

  if (rgSitProc.ItemIndex > 0) then
  begin
    if not(cbxArquiv.Checked) then
      qryProcesso.SQL.Add('  (FLGSITPROC = 0 or TIPOENCER <> ''A'') AND');
    if not(cbxAcordo.Checked) then
      qryProcesso.SQL.Add('  (FLGSITPROC = 0 or TIPOENCER <> ''C'') AND');
    if not(cbxDesist.Checked) then
      qryProcesso.SQL.Add('  (FLGSITPROC = 0 or TIPOENCER <> ''D'') AND');
    if not(cbxSent.Checked) then
      qryProcesso.SQL.Add('  (FLGSITPROC = 0 or TIPOENCER <> ''S'') AND');
  end;

  if (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0) then
    qryProcesso.SQL.Add('  (IDADVOGCASA IN ' +sAdvC+ ') AND');
  if (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0) then
    qryProcesso.SQL.Add('  (IDADVOGRECDA IN ' +sAdv1+ ') AND');
  if (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0) then
    qryProcesso.SQL.Add('  (IDADVOGRECTE IN ' +sAdv2+ ') AND');
  if (rgAT.ItemIndex * lstAT.Items.Count > 0) then
    qryProcesso.SQL.Add('  (IDASSISTTECN IN ' +sAT+ ') AND');
  if (rgTRT.ItemIndex * lstTRT.Items.Count > 0) then
    qryProcesso.SQL.Add('  (PROCESSOTRAB.IDVARAJUSTICA IN ' +sTRT+ ') AND');
  if (rgUF.ItemIndex * lstUF.Items.Count > 0) then
    qryProcesso.SQL.Add('  (IDESTADO IN ' +sUF+ ') AND');
  if (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) then
    qryProcesso.SQL.Add('  (IdTipoProc IN ' +sTipoProc+ ') AND');
  if (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0) then
    qryProcesso.SQL.Add('  (IdTipoAcao IN ' +sTipoAcao+ ') AND');
  if (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0) then
    qryProcesso.SQL.Add('  (FLGSITPROC = 0 or CodTipoSent IN ' +sSentenca+ ') AND');
  if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
  begin
    qryProcesso.SQL.Add('  (NVL(OBJETOS.TOTALOBJ,0) > 0) AND');
    qryProcesso.SQL.Add('  (PROCESSOTRAB.NUMPROCTRAB = OBJETOS.NUMPROCTRAB(+)) AND');
  end;

  if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
    if (rgEtapa.ItemIndex = 1) then
      qryProcesso.SQL.Add('  (PROCESSOTRAB.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND')
    else
    begin
      qryProcesso.SQL.Add('  (NVL(ETAPAS.TOTALETP,0) > 0) AND');
      qryProcesso.SQL.Add('  (PROCESSOTRAB.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND');
    end;

  if (ednAdm1.Value > 0) then //Tempo de Existencia
  begin
    qryProcesso.SQL.Add('  (to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),7,10)) -');
    qryProcesso.SQL.Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),7,10))) * 12 +');
    qryProcesso.SQL.Add('   to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),4,2)) -');
    qryProcesso.SQL.Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),4,2)) + ');
    qryProcesso.SQL.Add('   decode((to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) - ');
    qryProcesso.SQL.Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2))) / ');
    qryProcesso.SQL.Add('   decode(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2), ');
    qryProcesso.SQL.Add('   substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2),1, ');
    qryProcesso.SQL.Add('   abs(to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) - ');
    qryProcesso.SQL.Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2)))),-1,-1,0) '+
                        ' >= ' +IntToStr(ednAdm1.Value)+ ' AND');
  end;
  if (ednAdm2.Value < 999) then //Tempo de Existencia
  begin
    qryProcesso.SQL.Add('  (to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),7,10)) -');
    qryProcesso.SQL.Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),7,10))) * 12 +');
    qryProcesso.SQL.Add('   to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),4,2)) -');
    qryProcesso.SQL.Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),4,2)) + ');
    qryProcesso.SQL.Add('   decode((to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) - ');
    qryProcesso.SQL.Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2))) / ');
    qryProcesso.SQL.Add('   decode(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2), ');
    qryProcesso.SQL.Add('   substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2),1, ');
    qryProcesso.SQL.Add('   abs(to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) - ');
    qryProcesso.SQL.Add('   to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2)))),-1,-1,0) '+
                        ' <= ' +IntToStr(ednAdm2.Value)+ ' AND');
  end;

  if (rgInstancia.ItemIndex > 0) then
  begin
    if (rgInstancia.ItemIndex = 1) then
      qryProcesso.SQL.Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NULL AND '+
        'PROCTSTNUM IS NULL) AND');
    if (rgInstancia.ItemIndex = 2) then
      qryProcesso.SQL.Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND '+
        'PROCTSTNUM IS NULL) AND');
    if (rgInstancia.ItemIndex = 3) then
      qryProcesso.SQL.Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND '+
        'PROCTSTNUM IS NOT NULL) AND');
  end;

  if (rgParte.ItemIndex < 2) then
  begin
    if (rgParte.ItemIndex = 0) then
      qryProcesso.SQL.Add('  (FLGPARTEATIVA = 1) AND');
    if (rgParte.ItemIndex = 1) then
      qryProcesso.SQL.Add('  (FLGPARTEATIVA = 0) AND');
  end;

  if (StrToFloat(ednNum1.Text) > 0) then
    qryProcesso.SQL.Add('  (NUMPROCTRAB >= ' +ednNum1.Text+ ') AND');
  if (ednNum2.Text <> '9999999999')  then
    qryProcesso.SQL.Add('  (NUMPROCTRAB <= ' +ednNum2.Text+ ') AND');

  if (StrToFloat(ednCus1.Text) > 0) then
    qryProcesso.SQL.Add('  (CUSTOPROC >= ' +ednCus1.Text+ ') AND');
  if  (ednCus2.Text <> '9999999999')  then
    qryProcesso.SQL.Add('  (CUSTOPROC <= ' +ednCus2.Text+ ') AND');

  qryProcesso.SQL.Add('  (PROCESSOTRAB.IDRECLAMANTE = RECLAMANTES.IDPESSOA) AND');
  qryProcesso.SQL.Add('  (PROCESSOTRAB.IDRECLAMANTE = ENDRECLAMANTES.IDPESSOA(+)) AND');
  qryProcesso.SQL.Add('  (PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)) AND');
  qryProcesso.SQL.Add('  (PROCESSOTRAB.IDCIDADES = CIDADES.IDCIDADES(+))');
  qryProcesso.SQL.Add('ORDER BY');
  qryProcesso.SQL.Add('  '+TituOrdF[cmbSequencia.ItemIndex]);
  qryProcesso.Open;
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
