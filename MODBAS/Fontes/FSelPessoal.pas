unit FSelPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwtable, Wwdatsrc, ExtCtrls, wwdblook, Spin,
  StdCtrls, TEdNum, MAHlpBtn, Buttons, Wwquery, ComCtrls, uAutorizacao, TB97,
  TB97Tlbr, IvDictio, IvMulti, wwdbdatetimepicker, CMDateTimePicker,
  IvEMulti;

type
  TfrmSelPessoal = class(TfrmOkCancelar)
    ds: TwwDataSource;
    tblCargo: TwwQuery;
    tblSindic: TwwQuery;
    tblProfis: TwwQuery;
    tblPessoal: TwwQuery;
    bbtnOutraVez: TBitBtn;
    tblEstab: TwwQuery;
    tblLotacao: TwwQuery;
    qryGrauInstr: TwwQuery;
    qryRamo: TwwQuery;
    qryMotivo: TwwQuery;
    qryParamRH: TwwQuery;
    pnSelecao: TPanel;
    pnResult: TPanel;
    PageControl1: TPageControl;
    tsDadosFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxCandidatos: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxAutonomos: TCheckBox;
    cbxProprietarios: TCheckBox;
    cbxEspeciais: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    gbxTipoSal: TGroupBox;
    cbxMensalistas: TCheckBox;
    cbxDiaristas: TCheckBox;
    cbxHoristas: TCheckBox;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    ednSal1: TEditNum;
    ednSal2: TEditNum;
    gbxTempAdm: TGroupBox;
    Label1: TLabel;
    ednAdm1: TSpinEdit;
    ednAdm2: TSpinEdit;
    gbxTempLot: TGroupBox;
    Label2: TLabel;
    ednLot1: TSpinEdit;
    ednLot2: TSpinEdit;
    gbxTempCar: TGroupBox;
    Label3: TLabel;
    ednCar1: TSpinEdit;
    ednCar2: TSpinEdit;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    tsDadosPess: TTabSheet;
    gbxIdade: TGroupBox;
    Label5: TLabel;
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
    Label6: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    gbxAniv: TGroupBox;
    cbxAniv: TComboBox;
    GroupBox1: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    rgSinTot: TRadioGroup;
    speDepTot: TSpinEdit;
    speDepIR: TSpinEdit;
    speDepSF: TSpinEdit;
    rgSinIR: TRadioGroup;
    rgSinSF: TRadioGroup;
    gbxEstCivil: TGroupBox;
    cbxSolt: TCheckBox;
    cbxCas: TCheckBox;
    cbxSep: TCheckBox;
    cbxViu: TCheckBox;
    cbxOutr: TCheckBox;
    cbxSepJud: TCheckBox;
    cbxDes: TCheckBox;
    tsDadosOutros: TTabSheet;
    rgSelEstab: TRadioGroup;
    gbxEstab: TGroupBox;
    dblcEstab: TwwDBLookupCombo;
    lstEstab: TListBox;
    cbxSubEstab: TCheckBox;
    lstCodEstab: TListBox;
    rgSelSindi: TRadioGroup;
    gbxSindi: TGroupBox;
    dblcSindi: TwwDBLookupCombo;
    lstSindi: TListBox;
    lstCodSindi: TListBox;
    gbxLotacao: TGroupBox;
    dblcLotacao: TwwDBLookupCombo;
    rgSelCargo: TRadioGroup;
    gbxCargo: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    lstCargo: TListBox;
    lstCodCargo: TListBox;
    rgSelRamo: TRadioGroup;
    gbxRamo: TGroupBox;
    dblcRamo: TwwDBLookupCombo;
    lstRamo: TListBox;
    lstCodRamo: TListBox;
    tbsDemit: TTabSheet;
    gbxDemitidos: TGroupBox;
    LabelDeData: TLabel;
    LabelAdata: TLabel;
    Label711: TLabel;
    EdDataDem1: TCMDateTimePicker;
    EdDataDem2: TCMDateTimePicker;
    rgSelMotivo: TRadioGroup;
    gbxMotivos: TGroupBox;
    dblcMotivos: TwwDBLookupCombo;
    lstMotivos: TListBox;
    lstCodMotivos: TListBox;
    gbxAdmissao: TGroupBox;
    Label7: TLabel;
    EdDataAdm1: TCMDateTimePicker;
    Label8: TLabel;
    EdDataAdm2: TCMDateTimePicker;
    cbxCargoAltern: TCheckBox;
    procedure dblcProfisCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcGrauInstrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rgSelEstabClick(Sender: TObject);
    procedure rgSelCargoClick(Sender: TObject);
    procedure rgSelSindiClick(Sender: TObject);
    procedure dblcEstabCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcSindiCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstEstabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstCargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstSindiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcLotacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure ednLot1Change(Sender: TObject);
    procedure ednCar1Change(Sender: TObject);
    procedure ednIda1Change(Sender: TObject);
    procedure ednLot2Change(Sender: TObject);
    procedure ednCar2Change(Sender: TObject);
    procedure ednIda2Change(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure cbxEfetivosClick(Sender: TObject);
    procedure cbxTemporariosClick(Sender: TObject);
    procedure cbxEstagiariosClick(Sender: TObject);
    procedure cbxTerceirosClick(Sender: TObject);
    procedure cbxProprietariosClick(Sender: TObject);
    procedure cbxAutonomosClick(Sender: TObject);
    procedure cbxCandidatosClick(Sender: TObject);
    procedure rgSelRamoClick(Sender: TObject);
    procedure lstRamoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcRamoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure MudaSeq;
    procedure rgSelMotivoClick(Sender: TObject);
    procedure dblcMotivosCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstMotivosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxDemitidosClick(Sender: TObject);
    procedure cbxEspeciaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    MarcouFuncionario, MarcouCandidato: boolean;
  end;

var
  frmSelPessoal: TfrmSelPessoal;
  SvItem: integer;
  J, VAL1, VAL2: integer;
  sSql: string;
  VALOR: double;
  TituSeq: array[0..15] of string =
    ('Nome','Matrícula','Cargo,Nome','Cargo,Matrícula',
     'Centro de Custo,Nome',
     'Centro de Custo,Matrícula',
     'Lotação,Nome',
     'Lotação,Matrícula',
     'Segmento,Lotação,Nome',
     'Segmento,Lotação,Matrícula',
     'C.Custo,Cargo,Nome',
     'C.Custo,Cargo,Matrícula',
     'Lotação,Cargo,Nome',
     'Lotação,Cargo,Matrícula',
     'Segmento,Lotação,Cargo,Nome',
     'Segmento,Lotação,Cargo,Matrícula');

  TituOrdF: array[0..15] of string =
    ('upper(Pessoa.Nome)',
     'Matricula',
     'Funcionario.IdCargo,upper(Pessoa.Nome)',
     'Funcionario.IdCargo,Matricula',
     'Funcionario.IdEmpresa,Funcionario.CodCentroCusto,upper(Pessoa.Nome)',
     'Funcionario.IdEmpresa,Funcionario.CodCentroCusto,Matricula',
     'Funcionario.IdEmpresa,Funcionario.IdEstab,Funcionario.CodCentroCusto,upper(Pessoa.Nome)',
     'Funcionario.IdEmpresa,Funcionario.IdEstab,Funcionario.CodCentroCusto,Matricula',
     'FilialPessoa.IdRamoFornecedor,Funcionario.IdEmpresa,Funcionario.IdEstab,Funcionario.CodCentroCusto,upper(Pessoa.Nome)',
     'FilialPessoa.IdRamoFornecedor,Funcionario.IdEmpresa,Funcionario.IdEstab,Funcionario.CodCentroCusto,Matricula',
     'Funcionario.IdEmpresa,Funcionario.CodCentroCusto,Funcionario.IdCargo,upper(Pessoa.Nome)',
     'Funcionario.IdEmpresa,Funcionario.CodCentroCusto,Funcionario.IdCargo,Matricula',
     'Funcionario.IdEmpresa,Funcionario.IdEstab,Funcionario.CodCentroCusto,Funcionario.IdCargo,upper(Pessoa.Nome)',
     'Funcionario.IdEmpresa,Funcionario.IdEstab,Funcionario.CodCentroCusto,Funcionario.IdCargo,Matricula',
     'FilialPessoa.IdRamoFornecedor,Funcionario.IdEmpresa,Funcionario.IdEstab,Funcionario.CodCentroCusto,Funcionario.IdCargo,upper(Pessoa.Nome)',
     'FilialPessoa.IdRamoFornecedor,Funcionario.IdEmpresa,Funcionario.IdEstab,Funcionario.CodCentroCusto,Funcionario.IdCargo,Matricula');

  TituOrdC: array[0..3] of string =
    ('upper(Pessoa.Nome)',
     'Candidat.IdPessoa',
     'Candidat.IdCargo,upper(Pessoa.Nome)',
     'Candidat.IdCargo,Candidat.IdPessoa');

implementation

uses uSistema, uMensErro, UsoGeralRH;

{$R *.DFM}

procedure TfrmSelPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  qryParamRH.Open;
  cbxCargoAltern.Visible := (qryParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);
  cbxCargoAltern.Checked := (qryParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);

  tblEstab.Close;
  tblEstab.Sql.Clear;
  tblEstab.Sql.Add('Select IDPESSOA, NOME from PESSOA ');
  tblEstab.Sql.Add('where ((IDGRUPO = :IdEmpresaProp )');
  tblEstab.Sql.Add(' OR    (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
  tblEstab.Sql.Add('                    WHERE IDGRUPO = :IdEmpresaProp ))');
  tblEstab.Sql.Add(' OR   (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
  tblEstab.Sql.Add('          WHERE IDGRUPO  IN (SELECT IDPESSOA FROM PESSOA');
  tblEstab.Sql.Add('                             WHERE IDGRUPO = :IdEmpresaProp )))');
  tblEstab.Sql.Add(' OR   (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
  tblEstab.Sql.Add('          WHERE IDGRUPO  IN (SELECT IDPESSOA FROM PESSOA');
  tblEstab.Sql.Add('                             WHERE IDGRUPO IN');
  tblEstab.Sql.Add('                              (SELECT IDPESSOA FROM PESSOA');
  tblEstab.Sql.Add('                               WHERE IDGRUPO = :IdEmpresaProp )))) )');

  if (sUsuXfilial <> '') then
    tblEstab.Sql.Add(' and IDPESSOA IN ' + sUsuXfilial);

  tblEstab.Sql.Add(' order by NOME');

  tblEstab.ParamByName('IdEmpresaProp').asInteger := Sistema.IdEmpresa;

  tblLotacao.Close;
  tblLotacao.Sql.Clear;
  tblLotacao.Sql.Add('Select CODCENTROCUSTO, NOME from CENTCUST');
  tblLotacao.Sql.Add(' where IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
  if (sUsuXccusto <> '') then
    tblLotacao.Sql.Add(' and CODCENTROCUSTO IN ' + sUsuXccusto);

  tblLotacao.Sql.Add(' order by NOME');
  tblLotacao.Open;
  dblcLotacao.SelText := '**********';

  ds.Dataset.Filtered := false;
  tblProfis.Open;
  qryGrauInstr.Open;
//  qryRamo.Open;
//  tblCargo.Open;
//  tblSindic.Open;
//  tblEstab.Open;

  cmbSequencia.ItemIndex  := 0;
  cmbSequencia.Text       := TituSeq[0];
  EdDataAdm2.Date         := Date;
  EdDataDem2.Date         := Date;
  EdDataDem1.Date         := Date - (365*5 + 1);
  gbxDemitidos.Visible    := cbxDemitidos.Checked;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmSelPessoal.dblcProfisCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    (Sender as TwwDBLookupCombo).Text := Trim(tblProfis.FieldByName('IDPROFISS').asString);
end;

procedure TfrmSelPessoal.dblcGrauInstrCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    (Sender as TwwDBLookupCombo).Text := Trim(qryGrauInstr.FieldByName('IDGRINSTR').asString);
end;

procedure TfrmSelPessoal.rgSelEstabClick(Sender: TObject);
begin
  inherited;
  if (rgSelEstab.ItemIndex = 1) and not(tblEstab.Active) then
    tblEstab.Open;

  if (tblEstab.EOF) then
    rgSelEstab.ItemIndex := 0;

  gbxEstab.Visible := (rgSelEstab.ItemIndex = 1);
end;

procedure TfrmSelPessoal.rgSelCargoClick(Sender: TObject);
begin
  inherited;
  if (rgSelCargo.ItemIndex = 1) and not(tblCargo.Active) then
    tblCargo.Open;

  if (tblCargo.EOF) then
    rgSelCargo.ItemIndex := 0;

  gbxCargo.Visible := (rgSelCargo.ItemIndex = 1);
end;

procedure TfrmSelPessoal.rgSelSindiClick(Sender: TObject);
begin
  inherited;
  if (rgSelSindi.ItemIndex = 1) and not(tblSindic.Active) then
    tblSindic.Open;

  if (tblSindic.EOF) then
    rgSelSindi.ItemIndex := 0;

  gbxSindi.Visible := (rgSelSindi.ItemIndex = 1);
end;

procedure TfrmSelPessoal.dblcEstabCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstEstab.Items.Add(tblEstab.FieldByName('NOME').asString);
    lstCodEstab.Items.Add(tblEstab.FieldByName('IDPESSOA').asString);
  end;
end;

procedure TfrmSelPessoal.dblcCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstCargo.Items.Add(tblCargo.FieldByName('TITULO').asString);
    lstCodCargo.Items.Add(tblCargo.FieldByName('IDCARGO').asString);
  end;
end;

procedure TfrmSelPessoal.dblcSindiCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstSindi.Items.Add(tblSindic.FieldByName('NOME').asString);
    lstCodSindi.Items.Add(tblSindic.FieldByName('IDPESSOA').asString);
  end;
end;

procedure TfrmSelPessoal.lstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstEstab.Items.Count > 0) then
  begin
    SvItem := lstEstab.ItemIndex;
    lstEstab.Items.Delete(SvItem);
    lstCodEstab.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.lstCargoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstCargo.Items.Count > 0) then
  begin
    SvItem := lstCargo.ItemIndex;
    lstCargo.Items.Delete(SvItem);
    lstCodCargo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.lstSindiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstSindi.Items.Count > 0) then
  begin
    SvItem := lstSindi.ItemIndex;
    lstSindi.Items.Delete(SvItem);
    lstCodSindi.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.dblcLotacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  inherited;
  if (modified) and not(tblLotacao.EOF) then
    (Sender as TwwDBLookupCombo).Text := tblLotacao.FieldByName('CODCENTROCUSTO').asString;
end;

procedure TfrmSelPessoal.ednAdm2Change(Sender: TObject);
begin
  inherited;
  if (ednAdm2.Value < ednAdm1.Value) then
    ednAdm2.Value := ednAdm1.Value;
end;

procedure TfrmSelPessoal.ednAdm1Change(Sender: TObject);
begin
  inherited;
  if (ednAdm1.Value > ednAdm2.Value) then
    ednAdm1.Value := ednAdm2.Value;
end;

procedure TfrmSelPessoal.ednLot1Change(Sender: TObject);
begin
  inherited;
  if (ednLot1.Value > ednLot2.Value) then
    ednLot1.Value := ednLot2.Value;
end;

procedure TfrmSelPessoal.ednCar1Change(Sender: TObject);
begin
  inherited;
  if (ednCar1.Value > ednCar2.Value) then
    ednCar1.Value := ednCar2.Value;
end;

procedure TfrmSelPessoal.ednIda1Change(Sender: TObject);
begin
  inherited;
  if (ednIda1.Value > ednIda2.Value) then
    ednIda1.Value := ednIda2.Value;
end;

procedure TfrmSelPessoal.ednLot2Change(Sender: TObject);
begin
  inherited;
  if (ednLot2.Value < ednLot1.Value) then
    ednLot2.Value := ednLot1.Value;
end;

procedure TfrmSelPessoal.ednCar2Change(Sender: TObject);
begin
  inherited;
  if (ednCar2.Value < ednCar1.Value) then
    ednCar2.Value := ednCar1.Value;
end;

procedure TfrmSelPessoal.ednIda2Change(Sender: TObject);
begin
  inherited;
  if (ednIda2.Value < ednIda1.Value) then
    ednIda2.Value := ednIda1.Value;
end;

procedure TfrmSelPessoal.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ds.Dataset.Filtered  := false;
  bbtnOutraVez.Visible := false;
  //bbtnCancelar.Caption := '&Cancelar';
  //rgSequencia.Visible := true;
  pnResult.Visible     := false;
  pnResult.SendToBack;

  //gbxLotacao.Visible := true;
  bbtnConfirmar.Visible := true;
  if (tblEstab.Active) and (cbxSubEstab.checked) then
  begin
    tblEstab.Close;
    tblEstab.ParamByName('IdEmpresaProp').asFloat := Sistema.IdEmpresa;
    tblEstab.Open;
  end;
end;

procedure TfrmSelPessoal.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ds.Dataset.Filtered := false;
end;

procedure TfrmSelPessoal.cbxEfetivosClick(Sender: TObject);
begin
  inherited;
  MudaSeq;
end;

procedure TfrmSelPessoal.cbxEspeciaisClick(Sender: TObject);
begin
  inherited;
  MudaSeq;
end;

procedure TfrmSelPessoal.cbxTemporariosClick(Sender: TObject);
begin
  inherited;
  if (cbxTemporarios.Checked) then
    cbxCandidatos.Checked := false;
  MudaSeq;
end;

procedure TfrmSelPessoal.cbxEstagiariosClick(Sender: TObject);
begin
  inherited;
  if (cbxEstagiarios.Checked) then
    cbxCandidatos.Checked := false;
  MudaSeq;
end;

procedure TfrmSelPessoal.cbxTerceirosClick(Sender: TObject);
begin
  inherited;
  if (cbxTerceiros.Checked) then
    cbxCandidatos.Checked := false;
  MudaSeq;
end;

procedure TfrmSelPessoal.cbxProprietariosClick(Sender: TObject);
begin
  inherited;
  if (cbxProprietarios.Checked) then
    cbxCandidatos.Checked := false;
  MudaSeq;
end;

procedure TfrmSelPessoal.cbxAutonomosClick(Sender: TObject);
begin
  inherited;
  if (cbxAutonomos.Checked) then
    cbxCandidatos.Checked := false;
  MudaSeq;
end;

procedure TfrmSelPessoal.cbxCandidatosClick(Sender: TObject);
begin
  inherited;
  if (cbxCandidatos.Checked) then
  begin
    cbxEfetivos.Checked      := false;
    cbxEspeciais.Checked     := false;
    cbxTemporarios.Checked   := false;
    cbxEstagiarios.Checked   := false;
    cbxTerceiros.Checked     := false;
    cbxProprietarios.Checked := false;
    cbxAutonomos.Checked     := false;
  end;
  MudaSeq;
end;

procedure TfrmSelPessoal.rgSelRamoClick(Sender: TObject);
begin
  inherited;
  if (rgSelRamo.ItemIndex = 1) and not(qryRamo.Active) then
    qryRamo.Open;
  if (qryRamo.EOF) then
    rgSelRamo.ItemIndex := 0;
  gbxRamo.Visible := (rgSelRamo.ItemIndex = 1);
end;

procedure TfrmSelPessoal.lstRamoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstRamo.Items.Count > 0) then
  begin
    SvItem := lstRamo.ItemIndex;
    lstRamo.Items.Delete(SvItem);
    lstCodRamo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.dblcRamoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstRamo.Items.Add(qryRamo.FieldByName('DESCRAMOFORNECEDOR').asString);
    lstCodRamo.Items.Add(qryRamo.FieldByName('IDRAMOFORNECEDOR').asString);
  end;
end;

procedure TfrmSelPessoal.MudaSeq;
var
  Ind, Lim, Guarda: integer;
begin
  inherited;
  if (rgSequencia.Visible) then
  begin
    Guarda := cmbSequencia.ItemIndex;
    Lim    := 15;
    if (cbxCandidatos.Checked) then
    begin
      Lim := 3;
      if (Guarda > 3) then
        Guarda := 0;
    end;
    cmbSequencia.Items.Clear;
    for Ind:=0 to Lim do
      cmbSequencia.Items.Add(TituSeq[Ind]);
    cmbSequencia.ItemIndex := Guarda;
    cmbSequencia.Text      := TituSeq[Guarda];
  end;
end;

procedure TfrmSelPessoal.rgSelMotivoClick(Sender: TObject);
begin
  inherited;
  if (rgSelMotivo.ItemIndex = 1) and not(qryMotivo.Active) then
    qryMotivo.Open;
  if (qryMotivo.EOF) then
    rgSelMotivo.ItemIndex := 0;
  gbxMotivos.Visible := (rgSelMotivo.ItemIndex = 1);
end;

procedure TfrmSelPessoal.dblcMotivosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstMotivos.Items.Add(qryMotivo.FieldByName('DESCRICAO').asString);
    lstCodMotivos.Items.Add(qryMotivo.FieldByName('IDMOTIVO').asString);
  end;
end;

procedure TfrmSelPessoal.lstMotivosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstMotivos.Items.Count > 0) then
  begin
    SvItem := lstMotivos.ItemIndex;
    lstMotivos.Items.Delete(SvItem);
    lstCodMotivos.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.cbxDemitidosClick(Sender: TObject);
begin
  inherited;
  gbxDemitidos.Visible := cbxDemitidos.Checked;
end;

procedure TfrmSelPessoal.bbtnConfirmarClick(Sender: TObject);
var
  I: integer;
  sEstab, sCargo, sSindi, sRamo, sMotivo: string;
begin
  inherited;
  MarcouFuncionario := (cbxEfetivos.Checked)    or (cbxEspeciais.Checked)     or
                       (cbxTemporarios.Checked) or (cbxEstagiarios.Checked)   or
                       (cbxTerceiros.Checked)   or (cbxProprietarios.Checked) or
                       (cbxAutonomos.Checked);
  MarcouCandidato   := (cbxCandidatos.Checked);

  if not(MarcouFuncionario) and not(MarcouCandidato) then
  begin
    MsgDlg('Assinale Ao Menos Um Tipo de Contrato', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    PageControl1.ActivePage := tsDadosFunc;
    gbxTipContra.SetFocus;
    exit;
  end;

  if not(cbxAtivos.Checked)    and not(cbxAfastados.Checked)  and
     not(cbxDemitidos.Checked) and not(cbxCandidatos.Checked) then
  begin
    MsgDlg('Assinale Ao Menos Um Tipo de Situação Funcional', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    PageControl1.ActivePage := tsDadosFunc;
    gbxSituacao.SetFocus;
    exit;
  end;

  if not(cbxMensalistas.Checked) and not(cbxDiaristas.Checked) and not(cbxHoristas.Checked) then
  begin
    MsgDlg('Assinale Ao Menos Um Tipo de Salário', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    PageControl1.ActivePage := tsDadosFunc;
    gbxTipoSal.SetFocus;
    exit;
  end;

  if (rgSelEstab.ItemIndex > 0) then
  begin
    sEstab := '(';
    for I:=0 to (lstEstab.Items.Count - 1) do
    begin
      if (lstEstab.Items[I] = '') then
        break;

      if (I > 0) then
        sEstab := sEstab + ',';

      sEstab := sEstab + lstCodEstab.Items[I];

      if (cbxSubEstab.checked) then
      begin
        tblEstab.Close;
        tblEstab.ParamByName('IdEmpresaProp').Value := StrToInt(lstCodEstab.Items[I]);
        tblEstab.Open;
        while not(tblEstab.Eof) do
        begin
          sEstab := sEstab + ',';
          sEstab := sEstab + tblEstab.FieldByName('IdPessoa').asString;
          tblEstab.Next;
        end;
      end;
    end;
    sEstab := sEstab + ')';
  end;

  if (rgSelCargo.ItemIndex > 0) then
  begin
    sCargo := '(';
    for I:=0 to (lstCargo.Items.Count - 1) do
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
    for I:=0 to (lstSindi.Items.Count - 1) do
    begin
      if (lstSindi.Items[I] = '') then
        break;
      if (I > 0) then
        sSindi := sSindi + ',';
      sSindi := sSindi + lstCodSindi.Items[I];
    end;
    sSindi := sSindi + ')';
  end;

  if (rgSelRamo.ItemIndex > 0) then
  begin
    sRamo := '(';
    for I:=0 to (lstRamo.Items.Count - 1) do
    begin
      if (lstRamo.Items[I] = '') then
        break;
      if (I > 0) then
        sRamo := sRamo + ',';
      sRamo := sRamo + lstCodRamo.Items[I];
    end;
    sRamo := sRamo + ')';
  end;

  if (rgSelMotivo.ItemIndex > 0) and (cbxDemitidos.Checked) then
  begin
    sMotivo := '(';
    for I:=0 to lstMotivos.Items.Count-1 do
    begin
      if (lstMotivos.Items[I] = '') then
        break;
      if (I > 0) then
        sMotivo := sMotivo + ',';
      sMotivo := sMotivo + lstCodMotivos.Items[I];
    end;
    sMotivo := sMotivo + ')';
  end;

  tblPessoal.SQL.Clear;
  sSql := 'SELECT PESSOA.NOME, PESSOA.RAZAOSOCIAL, PESSOA.TIPO, PESSOA.NUMDOCUMENTO, ';
  sSql := sSql + 'PESSOAFISICA.*, CIDADES.NOME AS CIDADE, ';
  sSql := sSql + 'ENDPESS.LOGRADOURO, ';
  sSql := sSql + 'ENDPESS.CODESTADO, ';
  sSql := sSql + 'ENDPESS.NUMERO, ';
  sSql := sSql + 'ENDPESS.COMPLEMENTO, ';
  sSql := sSql + 'ENDPESS.BAIRRO, ';
  sSql := sSql + 'ENDPESS.CEP, ';
  sSql := sSql + 'CARGO.TITULO, ';

  if (MarcouFuncionario) then
    sSql := sSql + ' FUNCIONARIO.*, SITFUNC.*, HORATRAB.JORNADAMENSAL, ' +
                   ' FILIALPESSOA.IDRAMOFORNECEDOR, CC.NOME AS CENTROCUSTO ';
  if (MarcouCandidato) then
    sSql := sSql + ' CANDIDAT.*, '''' AS MATRICULA,''Candidato a'' as DESCRICAO, '' '' AS CENTROCUSTO ';

  sSql := sSql + 'FROM PESSOA, PESSOAFISICA, ENDPESS, CIDADES, CARGO, ';

  if (MarcouFuncionario) then
    sSql := sSql + ' FUNCIONARIO, SITFUNC, HORATRAB, FILIALPESSOA, CENTCUST CC ';

  if (MarcouCandidato) then
    sSql := sSql + ' CANDIDAT ';

  sSql := sSql + 'WHERE PESSOA.IDPESSOA   = PESSOAFISICA.IDPESSOA  AND ';
  sSql := sSql + 'PESSOA.IDENDRESIDENCIAL =  ENDPESS.IDENDERECO(+) AND ';
  sSql := sSql + 'ENDPESS.IDCIDADES       =  CIDADES.IDCIDADES(+)  AND ';

  if (MarcouFuncionario) then
  begin
    sSql := sSql + 'FUNCIONARIO.IDPESSOA    = PESSOA.IDPESSOA       AND ';
    sSql := sSql + 'FUNCIONARIO.IDSITFUNC   = SITFUNC.IDSITFUNC(+)  AND ';
    sSql := sSql + 'FUNCIONARIO.IDHORARIO   = HORATRAB.IDHORARIO(+) AND ';
    if (cbxCargoAltern.Checked) then
      sSql := sSql + 'DECODE(FUNCIONARIO.IDFUNCAO,NULL,FUNCIONARIO.IDCARGO,FUNCIONARIO.IDFUNCAO) = CARGO.IDCARGO(+)  AND '
    else
      sSql := sSql + 'FUNCIONARIO.IDCARGO     = CARGO.IDCARGO(+)      AND ';

    sSql := sSql + 'FUNCIONARIO.IDEMPRESA   = CC.IDEMPRESA(+)       AND ';
    sSql := sSql + 'FUNCIONARIO.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)  AND ';

    if (sUsuXccusto <> '') then
      sSql := sSql + 'FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto + ' AND ';

    if (sUsuXfilial <> '') then
      sSql := sSql + 'FUNCIONARIO.IDESTAB IN ' + sUsuXfilial + ' AND ';

    if (sUsoGeralIdPessoa <> '') then
      sSql := sSql + 'FUNCIONARIO.IDPESSOA = ' + sUsoGeralIdPessoa + ' AND ';

    if (EdDataAdm1.Text <> '') then
      sSql := sSql + 'FUNCIONARIO.DATAADMISSAO >= TO_DATE(' +
                      QuotedStr(EdDataAdm1.Text) + ',''dd/mm/yyyy'') AND ';

    if (EdDataAdm2.Text <> '') then
      sSql := sSql + 'FUNCIONARIO.DATAADMISSAO <= TO_DATE(' +
                      QuotedStr(EdDataAdm2.Text) + ',''dd/mm/yyyy'') AND ';

    if (not cbxAtivos.Checked)  then
      sSql := sSql + ' SITFUNC.TIPOSIT <> ''A'' AND ';
    if  (not cbxAfastados.Checked)  then
      sSql := sSql + ' SITFUNC.TIPOSIT <> ''F'' AND ';
    if  (not cbxDemitidos.Checked)  then
      sSql := sSql + ' SITFUNC.TIPOSIT <> ''D'' AND ';

    if (cbxDemitidos.Checked) then
    begin
      if (rgSelMotivo.ItemIndex > 0) then
        sSql := sSql + ' (SITFUNC.TIPOSIT <> ''D'' OR ' +
                       'FUNCIONARIO.IDMOTIVODESLIGRAIS IN ' + sMotivo + ') AND ';
        sSql := sSql + ' (SITFUNC.TIPOSIT <> ''D'' OR ' +
                       'FUNCIONARIO.DATADESLIGAMENTO IS NULL OR ' +
                       'FUNCIONARIO.DATADESLIGAMENTO BETWEEN ' +
                       'TO_DATE(' + QuotedStr(EdDataDem1.Text) + ',''dd/mm/yyyy'') AND ' +
                       'TO_DATE(' + QuotedStr(EdDataDem2.Text) + ',''dd/mm/yyyy'')' +
                       ') AND ';
    end;

    if not(cbxEfetivos.Checked) then
      sSql := sSql + ' FUNCIONARIO.TIPOCONTRATO <> ''E'' AND ';
    if not(cbxEspeciais.Checked) then
      sSql := sSql + ' FUNCIONARIO.TIPOCONTRATO <> ''S'' AND ';
      if  (not cbxTemporarios.Checked)  then
          sSql := sSql + ' FUNCIONARIO.TIPOCONTRATO <> ''T'' AND ';
      if  (not cbxTerceiros.Checked)  then
          sSql := sSql + ' FUNCIONARIO.TIPOCONTRATO <> ''3'' AND ';
      if  (not cbxProprietarios.Checked)  then
          sSql := sSql + ' FUNCIONARIO.TIPOCONTRATO <> ''P'' AND ';
      if  (not cbxAutonomos.Checked)  then
          sSql := sSql + ' FUNCIONARIO.TIPOCONTRATO <> ''A'' AND ';
      if  (not cbxEstagiarios.Checked)  then
          sSql := sSql + ' FUNCIONARIO.TIPOCONTRATO <> ''G'' AND ';

      if  (rgSelEstab.ItemIndex > 0)  then
          sSql := sSql + ' FUNCIONARIO.IDESTAB IN ' + sEstab + ' AND ';

      sSql := sSql + ' FUNCIONARIO.IDESTAB = FILIALPESSOA.IDFILIALPESSOA(+) AND ';
      if  (rgSelRamo.ItemIndex > 0)  then
          sSql := sSql + ' FILIALPESSOA.IDRAMOFORNECEDOR IN ' + sRamo + ' AND ';

      if  (dblcLotacao.Text <> '**********') then
           for  I := 1  to  length(trim(dblcLotacao.Text))  do
                if  (copy(dblcLOTACAO.Text, I, 1) <> '*')  then
                    sSql := sSql + ' SUBSTR(FUNCIONARIO.CODCENTROCUSTO, ' + IntToStr(I) +
                                   ' , 1) = ''' + copy(dblcLOTACAO.Text, I, 1) + ''' AND ';

      if  (ednAdm1.VALUE > 0)   then  begin //Tempo de Casa
         sSql := sSql + '(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),7,10)) -';
         sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),7,10))) * 12 +';
         sSql := sSql + ' to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),4,2)) -';
         sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),4,2)) + ';
         sSql := sSql + ' decode((to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2))) / ';
         sSql := sSql + ' decode(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2), ';
         sSql := sSql + ' substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2),1, ';
         sSql := sSql + ' abs(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
         sSql := sSql + ' >= ' + IntToStr(ednAdm1.VALUE) + ' AND ';
      end;
      if  (ednAdm2.VALUE < 999)  then  begin //Tempo de Casa
         sSql := sSql + '(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),7,10)) -';
         sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),7,10))) * 12 +';
         sSql := sSql + ' to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),4,2)) -';
         sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),4,2)) + ';
         sSql := sSql + ' decode((to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2))) / ';
         sSql := sSql + ' decode(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2), ';
         sSql := sSql + ' substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2),1, ';
         sSql := sSql + ' abs(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
         sSql := sSql + ' <= ' + IntToStr(ednAdm2.VALUE) + ' AND ';
      end;

      if  (ednLot1.VALUE > 0)   then  begin //Tempo na Lotação
         sSql := sSql + '(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),7,10)) -';
         sSql := sSql + ' to_number(substr(to_char(datalotacao,''dd/mm/yyyy''),7,10))) * 12 +';
         sSql := sSql + ' to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),4,2)) -';
         sSql := sSql + ' to_number(substr(to_char(datalotacao,''dd/mm/yyyy''),4,2)) + ';
         sSql := sSql + ' decode((to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(datalotacao,''dd/mm/yyyy''),1,2))) / ';
         sSql := sSql + ' decode(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2), ';
         sSql := sSql + ' substr(to_char(datalotacao,''dd/mm/yyyy''),1,2),1, ';
         sSql := sSql + ' abs(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(datalotacao,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
         sSql := sSql + ' >= ' + IntToStr(ednLot1.VALUE) + ' AND ';
      end;
      if  (ednLot2.VALUE < 999)  then  begin //Tempo na Lotação
         sSql := sSql + '(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),7,10)) -';
         sSql := sSql + ' to_number(substr(to_char(datalotacao,''dd/mm/yyyy''),7,10))) * 12 +';
         sSql := sSql + ' to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),4,2)) -';
         sSql := sSql + ' to_number(substr(to_char(datalotacao,''dd/mm/yyyy''),4,2)) + ';
         sSql := sSql + ' decode((to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(datalotacao,''dd/mm/yyyy''),1,2))) / ';
         sSql := sSql + ' decode(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2), ';
         sSql := sSql + ' substr(to_char(datalotacao,''dd/mm/yyyy''),1,2),1, ';
         sSql := sSql + ' abs(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(datalotacao,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
         sSql := sSql + ' <= ' + IntToStr(ednLot2.VALUE) + ' AND ';
      end;

      if  (ednCar1.VALUE > 0)   then  begin //Tempo no Cargo
         sSql := sSql + '(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),7,10)) -';
         sSql := sSql + ' to_number(substr(to_char(datacargo,''dd/mm/yyyy''),7,10))) * 12 +';
         sSql := sSql + ' to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),4,2)) -';
         sSql := sSql + ' to_number(substr(to_char(datacargo,''dd/mm/yyyy''),4,2)) + ';
         sSql := sSql + ' decode((to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(datacargo,''dd/mm/yyyy''),1,2))) / ';
         sSql := sSql + ' decode(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2), ';
         sSql := sSql + ' substr(to_char(datacargo,''dd/mm/yyyy''),1,2),1, ';
         sSql := sSql + ' abs(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(datacargo,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
         sSql := sSql + ' >= ' + IntToStr(ednCar1.VALUE) + ' AND ';
      end;
      if  (ednCar2.VALUE < 999)  then  begin //Tempo no Cargo
         sSql := sSql + '(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),7,10)) -';
         sSql := sSql + ' to_number(substr(to_char(datacargo,''dd/mm/yyyy''),7,10))) * 12 +';
         sSql := sSql + ' to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),4,2)) -';
         sSql := sSql + ' to_number(substr(to_char(datacargo,''dd/mm/yyyy''),4,2)) + ';
         sSql := sSql + ' decode((to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(datacargo,''dd/mm/yyyy''),1,2))) / ';
         sSql := sSql + ' decode(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2), ';
         sSql := sSql + ' substr(to_char(datacargo,''dd/mm/yyyy''),1,2),1, ';
         sSql := sSql + ' abs(to_number(substr(to_char(decode(TIPOSIT,''D'',DATADESLIGAMENTO,sysdate),''dd/mm/yyyy''),1,2)) - ';
         sSql := sSql + ' to_number(substr(to_char(datacargo,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
         sSql := sSql + ' <= ' + IntToStr(ednCar2.VALUE) + ' AND ';
      end;

      if  (StrToInt(ednSal1.Text) > 0)  then  begin //Faixa de Salário
         sSql := sSql + 'SALARIOATUAL * decode(TIPOPAGAMENTO,''M'', 1, ';
         sSql := sSql + 'decode(TIPOPAGAMENTO,''H'', JORNADAMENSAL, 30))';
         sSql := sSql + ' >= ' +  (ednSal1.Text) + ' AND ';
      end;
      if  (StrToInt(ednSal2.Text) < 99999999)  then  begin //Faixa de Salário
         sSql := sSql + 'SALARIOATUAL * decode(TIPOPAGAMENTO,''M'', 1, ';
         sSql := sSql + 'decode(TIPOPAGAMENTO,''H'', JORNADAMENSAL, 30))';
         sSql := sSql + ' <= ' +  (ednSal2.Text) + ' AND ';
      end;
  end;

  if  MarcouCandidato  then
  begin
      sSql := sSql + 'CANDIDAT.IDPESSOA = PESSOA.IDPESSOA  AND ';
      sSql := sSql + 'CANDIDAT.IDCARGO  = CARGO.IDCARGO(+) AND ';

      if  (StrToInt(ednSal1.Text) > 0)  then
      begin //Faixa de Salário
         sSql := sSql + 'SALARIO * decode(TIPOPAGAMENTO,''M'', 1, ';
         sSql := sSql + 'decode(TIPOPAGAMENTO,''H'', 220, 30))';
         sSql := sSql + ' >= ' +  (ednSal1.Text) + ' AND ';
      end;
      if  (StrToInt(ednSal2.Text) < 99999999)  then  begin //Faixa de Salário
         sSql := sSql + 'SALARIO * decode(TIPOPAGAMENTO,''M'', 1, ';
         sSql := sSql + 'decode(TIPOPAGAMENTO,''H'', 220, 30))';
         sSql := sSql + ' <= ' +  (ednSal2.Text) + ' AND ';
      end;
  end;

  if  (not cbxFeminino.Checked)  then
      sSql := sSql + 'PESSOAFISICA.SEXO <> ''F'' AND ';
  if  (not cbxMasculino.Checked)  then
      sSql := sSql + 'PESSOAFISICA.SEXO <> ''M'' AND ';

  if  (not cbxSolt.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''S'' AND ';
  if  (not cbxCas.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''C'' AND ';
  if  (not cbxSep.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''D'' AND ';
  if  (not cbxSepJud.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''J'' AND ';
  if  (not cbxDes.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''E'' AND ';
  if  (not cbxViu.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''V'' AND ';
  if  (not cbxOutr.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''O'' AND ';

  if  (not cbxMensalistas.Checked)  then
      sSql := sSql + 'TIPOPAGAMENTO <> ''M'' AND ';
  if  (not cbxDiaristas.Checked)  then
      sSql := sSql + 'TIPOPAGAMENTO <> ''D'' AND ';
  if  (not cbxHoristas.Checked)  then
      sSql := sSql + 'TIPOPAGAMENTO <> ''H'' AND ';

  if  (rgSelCargo.ItemIndex > 0)  then
      if  MarcouFuncionario  then
      begin
          if cbxCargoAltern.Checked then
            sSql := sSql + ' DECODE(FUNCIONARIO.IDFUNCAO,NULL,FUNCIONARIO.IDCARGO,FUNCIONARIO.IDFUNCAO) IN ' + sCargo + ' AND '
          else
            sSql := sSql + ' FUNCIONARIO.IDCARGO IN ' + sCargo + ' AND ';
      end
      else
          sSql := sSql + ' CANDIDAT.IDCARGO IN ' + sCargo + ' AND ';

  if (rgSelSindi.ItemIndex > 0) then
    sSql := sSql + ' PESSOAFISICA.IDSINDICATO IN ' + sSindi + ' AND ';

  if (ednIda1.VALUE > 0) then  //Faixa Etária
    sSql := sSql + 'TRUNC((SYSDATE - 1 - DATANASC)/365.25) >= ' + IntToStr(ednIda1.VALUE) + ' AND ';

  if (ednIda2.VALUE < 99) then  //Faixa Etária
    sSql := sSql + 'TRUNC((SYSDATE - 1 - DATANASC)/365.25) <= ' + IntToStr(ednIda2.VALUE) + ' AND ';

  if (cbxAniv.ItemIndex > 0) then
  begin  // Mês do Aniversário
    sSql := sSql + 'to_number(substr(to_char(DATANASC,''dd/mm/yyyy''),4,2)) = ';
    sSql := sSql + IntToStr(cbxAniv.ItemIndex) + ' AND ';
  end;

  if (round(StrToInt(ednCep1.Text)) > 0) then   //Faixa de CEP
    sSql := sSql + 'to_number(CEP)/1000 >= ' + ednCep1.Text + ' AND ';

  if (round(StrToInt(ednCep2.Text)) < 99999) then   //Faixa de CEP
    sSql := sSql + 'to_number(CEP)/1000 <= ' + ednCep2.Text + ' AND ';

  if (Trim(dblcGrauInstr.Text) <> '') then
  begin
    sSql := sSql + 'IDGRINSTR ';  //Grau de Instrução
    case (rgSinal.ItemIndex) of
      0 : sSql := sSql + ' <= ';
      1 : sSql := sSql + ' = ';
      2 : sSql := sSql + ' >= ';
    end;  
    sSql := sSql + dblcGrauInstr.Text + ' AND ';
  end;

  Val(dblcProfis.Text,VAL1,J);  //Profissão
  if (VAL1 > 0) then
    sSql := sSql + 'IDPROFISS = ' +  dblcProfis.Text + ' AND ';

  if (rgSinTot.ItemIndex < 2) or (speDepTot.Value > 0) then // Total Dependentes
    case (rgSinTot.ItemIndex) of
      0 : sSql := sSql + 'NUMDEPTOT <= ' +  IntToStr(speDepTot.Value) + ' AND ';
      1 : sSql := sSql + 'NUMDEPTOT  = ' +  IntToStr(speDepTot.Value) + ' AND ';
      2 : sSql := sSql + 'NUMDEPTOT >= ' +  IntToStr(speDepTot.Value) + ' AND ';
    end;

  if (rgSinIR.ItemIndex < 2) or (speDepIR.Value > 0) then // Dependentes IRRF
    case (rgSinIR.ItemIndex) of
      0 : sSql := sSql + 'NUMDEPIRRF <= ' +  IntToStr(speDepIR.Value) + ' AND ';
      1 : sSql := sSql + 'NUMDEPIRRF  = ' +  IntToStr(speDepIR.Value) + ' AND ';
      2 : sSql := sSql + 'NUMDEPIRRF >= ' +  IntToStr(speDepIR.Value) + ' AND ';
    end;

  if (rgSinSF.ItemIndex < 2) or (speDepSF.Value > 0) then // Dependentes Sal. Fam.
    case (rgSinSF.ItemIndex) of
      0 : sSql := sSql + 'NUMDEPSALF <= ' +  IntToStr(speDepSF.Value) + ' AND ';
      1 : sSql := sSql + 'NUMDEPSALF  = ' +  IntToStr(speDepSF.Value) + ' AND ';
      2 : sSql := sSql + 'NUMDEPSALF >= ' +  IntToStr(speDepSF.Value) + ' AND ';
    end;

  if (UpperCase(Copy(sSQL, Length(sSQL)- 3, 3)) = 'AND') then
    sSQL := Copy(sSQL, 1, Length(sSQL)-4);

  if (MarcouFuncionario) then
    sSql := sSql + ' order by ' + TituOrdF[cmbSequencia.ItemIndex]
  else
    sSql := sSql + ' order by ' + TituOrdC[cmbSequencia.ItemIndex];

  tblPessoal.SQL.Add(sSql);

  tblPessoal.Open;
  bbtnOutraVez.Visible  := true;
  bbtnConfirmar.Visible := false;
  //bbtnCancelar.Caption := '&Sair';
  pnResult.BringToFront;
  pnResult.Visible := true;
  //rgSequencia.Visible := false;
  //gbxLotacao.Visible := false;
  ModalResult := mrOk;
end;

end.
