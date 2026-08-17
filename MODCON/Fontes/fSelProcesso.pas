unit fSelProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  Db, DBTables, Wwtable, Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn,
  Buttons, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, checklst, Wwquery,
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
    qryTipoProc: TwwQuery;
    tbshObjetos: TTabSheet;
    qryObjeto: TwwQuery;
    rgObjeto: TRadioGroup;
    gbxObjeto: TGroupBox;
    dblcObjeto: TwwDBLookupCombo;
    lstObjeto: TListBox;
    lstCodObjeto: TListBox;
    rgEtapa: TRadioGroup;
    gbxEtapa: TGroupBox;
    dblcEtapa: TwwDBLookupCombo;
    lstEtapa: TListBox;
    lstCodEtapa: TListBox;
    qryEtapa: TwwQuery;
    rgInstancia: TRadioGroup;
    qrySentenca: TwwQuery;
    rgSentenca: TRadioGroup;
    gbxSentenca: TGroupBox;
    dblcSentenca: TwwDBLookupCombo;
    lstSentenca: TListBox;
    lstCodSentenca: TListBox;
    tbshReclamante: TTabSheet;
    PageControl2: TPageControl;
    tsDadosFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxAutonomos: TCheckBox;
    cbxProprietarios: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    gbxTipoSal: TGroupBox;
    cbxMensalistas: TCheckBox;
    cbxDiaristas: TCheckBox;
    cbxHoristas: TCheckBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    ednSal1: TEditNum;
    ednSal2: TEditNum;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    ednAdm1: TSpinEdit;
    ednAdm2: TSpinEdit;
    gbxTempLot: TGroupBox;
    Label8: TLabel;
    ednLot1: TSpinEdit;
    ednLot2: TSpinEdit;
    gbxTempCar: TGroupBox;
    Label9: TLabel;
    ednCar1: TSpinEdit;
    ednCar2: TSpinEdit;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    tsDadosPess: TTabSheet;
    gbxIdade: TGroupBox;
    Label10: TLabel;
    ednIda1: TSpinEdit;
    ednIda2: TSpinEdit;
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
    GroupBox3: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    rgSinTot: TRadioGroup;
    speDepTot: TSpinEdit;
    speDepIR: TSpinEdit;
    speDepSF: TSpinEdit;
    rgSinIR: TRadioGroup;
    rgSinSF: TRadioGroup;
    tsDadosOutros: TTabSheet;
    rgSelEstab: TRadioGroup;
    gbxEstab: TGroupBox;
    cbxSubEstab: TCheckBox;
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
    Label12: TLabel;
    Label13: TLabel;
    EdDataDem1: TCMDateTimePicker;
    EdDataDem2: TCMDateTimePicker;
    rgSelMotivo: TRadioGroup;
    gbxMotivos: TGroupBox;
    dblcMotivos: TwwDBLookupCombo;
    lstMotivos: TListBox;
    lstCodMotivos: TListBox;
    qryMotivo: TwwQuery;
    qryGrauInstr: TwwQuery;
    tblCargo: TwwQuery;
    tblProfis: TwwQuery;
    qryRamo: TwwQuery;
    tblEstab: TwwQuery;
    tblLotacao: TwwQuery;
    tblSindic: TwwQuery;
    cbxAniv: TComboBox;
    chklstEstab: TCheckListBox;
    lstCodEstab: TListBox;
    bbtnSelEstab: TBitBtn;
    bbtnInvEstab: TBitBtn;
    qryTipoAcao: TwwQuery;
    qryAdvCasa: TwwQuery;
    rgAdv1: TRadioGroup;
    rgAdvC: TRadioGroup;
    rgAdv2: TRadioGroup;
    gbxAdv1: TGroupBox;
    dblcAdv1: TwwDBLookupCombo;
    lstAdv1: TListBox;
    lstCodAdv1: TListBox;
    gbxAdvC: TGroupBox;
    dblcAdvC: TwwDBLookupCombo;
    lstAdvC: TListBox;
    lstCodAdvC: TListBox;
    gbxAdv2: TGroupBox;
    dblcAdv2: TwwDBLookupCombo;
    lstAdv2: TListBox;
    lstCodAdv2: TListBox;
    rgAT: TRadioGroup;
    gbxAT: TGroupBox;
    dblcAT: TwwDBLookupCombo;
    lstAT: TListBox;
    lstCodAT: TListBox;
    rgTRT: TRadioGroup;
    gbxTRT: TGroupBox;
    dblcTRT: TwwDBLookupCombo;
    lstTRT: TListBox;
    lstCodTRT: TListBox;
    cbxEspeciais: TCheckBox;
    gbxSexo: TGroupBox;
    cbxFeminino: TCheckBox;
    cbxMasculino: TCheckBox;
    gbxEstCivil: TGroupBox;
    cbxSolt: TCheckBox;
    cbxCas: TCheckBox;
    cbxSep: TCheckBox;
    cbxViu: TCheckBox;
    cbxOutr: TCheckBox;
    cbxSepJud: TCheckBox;
    cbxDes: TCheckBox;
    qryEstab: TwwQuery;
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
    gbxSalario: TGroupBox;
    Label4: TLabel;
    ednCus1: TEditNum;
    ednCus2: TEditNum;
    gbxFaixaInc: TGroupBox;
    Label15: TLabel;
    edDataInc1: TCMDateTimePicker;
    edDataInc2: TCMDateTimePicker;
    gbxFaixaAju: TGroupBox;
    Label1: TLabel;
    edDataAju1: TCMDateTimePicker;
    edDataAju2: TCMDateTimePicker;
    gbxFaixaData: TGroupBox;
    Label3: TLabel;
    edDataNot1: TCMDateTimePicker;
    edDataNot2: TCMDateTimePicker;
    gbxDataEnc: TGroupBox;
    Label5: TLabel;
    edDataEnc1: TCMDateTimePicker;
    edDataEnc2: TCMDateTimePicker;
    gbxTempAdm: TGroupBox;
    Label14: TLabel;
    ednAbe1: TSpinEdit;
    ednAbe2: TSpinEdit;
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
    procedure dblcAdv1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblcAdv2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblcATCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstAdv1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstAdv2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstATKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ednAbe2Change(Sender: TObject);
    procedure ednAbe1Change(Sender: TObject);
    procedure rgTRTClick(Sender: TObject);
    procedure dblcTRTCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstTRTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdnNum1Change(Sender: TObject);
    procedure EdnNum2Change(Sender: TObject);
    procedure ednCus1Change(Sender: TObject);
    procedure ednCus2Change(Sender: TObject);
    procedure rgSitProcClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoProcClick(Sender: TObject);
    procedure dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstTipoProcKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgObjetoClick(Sender: TObject);
    procedure dblcObjetoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstObjetoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgEtapaClick(Sender: TObject);
    procedure dblcEtapaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstEtapaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSentencaClick(Sender: TObject);
    procedure dblcSentencaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstSentencaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblcProfisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblcGrauInstrCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure rgSelEstabClick(Sender: TObject);
    procedure rgSelCargoClick(Sender: TObject);
    procedure rgSelSindiClick(Sender: TObject);
    procedure dblcCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblcSindiCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstCargoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblcSindiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblcLotacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure ednLot1Change(Sender: TObject);
    procedure ednCar1Change(Sender: TObject);
    procedure ednIda1Change(Sender: TObject);
    procedure ednLot2Change(Sender: TObject);
    procedure ednCar2Change(Sender: TObject);
    procedure ednIda2Change(Sender: TObject);
    procedure rgSelRamoClick(Sender: TObject);
    procedure lstRamoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblcRamoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure rgSelMotivoClick(Sender: TObject);
    procedure dblcMotivosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstMotivosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxDemitidosClick(Sender: TObject);
    procedure lstSindiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelEstabClick(Sender: TObject);
    procedure bbtnInvEstabClick(Sender: TObject);
    procedure rgTipoAcaoClick(Sender: TObject);
    procedure dblcTipoAcaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstTipoAcaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgAdvCClick(Sender: TObject);
    procedure dblcAdvCCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstAdvCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgUFClick(Sender: TObject);
    procedure dblcUFCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgCidadeClick(Sender: TObject);
    procedure dblcCidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MudouEstado;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelProcesso: TfrmSelProcesso;
  SvItem : Integer;
  I , J, VAL1, VAL2 : Integer;
  ANO1, MES1, DIA1, ANO2, MES2, DIA2 : Word;
  sSql : String;
  VALOR : Double;
  FezEstab: Boolean;    
  TituSeq : Array[0..15] of string = ('Nome','Matrícula','Cargo,Nome','Cargo,Matrícula',
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

  TituOrdF : Array[0..15] of string =
           ('upper(Reclamantes.Nome)',
            'Reclamantes.Matricula',
            'Reclamantes.IdCargo,upper(Reclamantes.Nome)',
            'Reclamantes.IdCargo,Reclamantes.Matricula',
            'Reclamantes.IdEmpresa,Reclamantes.CodCentroCusto,upper(Reclamantes.Nome)',
            'Reclamantes.IdEmpresa,Reclamantes.CodCentroCusto,Reclamantes.Matricula',
            'Reclamantes.IdEmpresa,Reclamantes.IdEstab,Reclamantes.CodCentroCusto,upper(Reclamantes.Nome)',
            'Reclamantes.IdEmpresa,Reclamantes.IdEstab,Reclamantes.CodCentroCusto,Reclamantes.Matricula',
            'Reclamantes.IdRamoFornecedor,Reclamantes.IdEmpresa,Reclamantes.IdEstab,Reclamantes.CodCentroCusto,upper(Reclamantes.Nome)',
            'Reclamantes.IdRamoFornecedor,Reclamantes.IdEmpresa,Reclamantes.IdEstab,Reclamantes.CodCentroCusto,Reclamantes.Matricula',
            'Reclamantes.IdEmpresa,Reclamantes.CodCentroCusto,Reclamantes.IdCargo,upper(Reclamantes.Nome)',
            'Reclamantes.IdEmpresa,Reclamantes.CodCentroCusto,Reclamantes.IdCargo,Reclamantes.Matricula',
            'Reclamantes.IdEmpresa,Reclamantes.IdEstab,Reclamantes.CodCentroCusto,Reclamantes.IdCargo,upper(Reclamantes.Nome)',
            'Reclamantes.IdEmpresa,Reclamantes.IdEstab,Reclamantes.CodCentroCusto,Reclamantes.IdCargo,Reclamantes.Matricula',
            'Reclamantes.IdRamoFornecedor,Reclamantes.IdEmpresa,Reclamantes.IdEstab,Reclamantes.CodCentroCusto,Reclamantes.IdCargo,upper(Reclamantes.Nome)',
            'Reclamantes.IdRamoFornecedor,Reclamantes.IdEmpresa,Reclamantes.IdEstab,Reclamantes.CodCentroCusto,Reclamantes.IdCargo,Reclamantes.Matricula');
  
implementation

uses uSistema, uMensErro, UsoGeralRH, fAguarde, uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmSelProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  //EdDataInc2.Date := Date;
  //EdDataAju2.Date := Date;
  //EdDataNot2.Date := Date;
  //EdDataEnc2.Date := Date;
  qryAdvog1.Open;
  qryAdvog2.Open;
  qryAdvCasa.Open;
  qryAT.Open;
  qryTRT.Open;
  qryUF.Open;
  qryCidade.Open;
  qryObjeto.Open;
  qryEtapa.Open;
  qryTipoProc.Open;
  qryTipoAcao.Open;
  qrySentenca.Open;

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
  if sUsuXfilial <> '' then
     tblEstab.Sql.Add(' and IDPESSOA IN ' + sUsuXfilial);
  tblEstab.Sql.Add(' order by upper(NOME)');

  tblEstab.ParamByName('IdEmpresaProp').Value :=
     Sistema.IdEmpresa;

  tblLotacao.Close;
  tblLotacao.Sql.Clear;
  tblLotacao.Sql.Add('Select CODCENTROCUSTO, NOME from CENTCUST');
  tblLotacao.Sql.Add(' where IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
  if sUsuXccusto <> '' then
     tblLotacao.Sql.Add(' and CODCENTROCUSTO IN ' + sUsuXccusto);
  tblLotacao.Sql.Add(' order by upper(NOME)');

  tblProfis.Open;
  qryGrauInstr.Open;
//  qryRamo.Open;
//  tblCargo.Open;
//  tblSindic.Open;
//  tblEstab.Open;
  tblLotacao.Open;
  dblcLotacao.SelText := '**********';
  cmbSequencia.ItemIndex := 0;
  cmbSequencia.Text := TituSeq[0];
  EdDataDem2.Date := Date;
  EdDataDem1.Date := Date - Round(365.25*50 + 1);
  gbxDemitidos.Visible := cbxDemitidos.Checked;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmSelProcesso.rgAdv1Click(Sender: TObject);
begin
  inherited;
  if qryAdvog1.EOF  then  rgAdv1.ItemIndex := 0;
  gbxAdv1.Visible := (rgAdv1.ItemIndex = 1);
end;

procedure TfrmSelProcesso.rgAdv2Click(Sender: TObject);
begin
  inherited;
  if qryAdvog2.EOF  then  rgAdv2.ItemIndex := 0;
  gbxAdv2.Visible := (rgAdv2.ItemIndex = 1);
end;

procedure TfrmSelProcesso.rgATClick(Sender: TObject);
begin
  inherited;
  if qryAT.EOF  then  rgAT.ItemIndex := 0;
  gbxAT.Visible := (rgAT.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcAdv1CloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstAdv1.Items.Add(qryAdvog1.FieldByName('NOME').Value);
     lstCodAdv1.Items.Add(qryAdvog1.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.dblcAdv2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  Modified: Boolean);
begin
  inherited;
  if (Modified) then
  begin
    lstAdv2.Items.Add(qryAdvog2.FieldByName('NOME').Value);
    lstCodAdv2.Items.Add(qryAdvog2.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.dblcATCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  Modified: Boolean);
begin
  inherited;
  if (Modified) then
  begin
    lstAT.Items.Add(qryAT.FieldByName('NOME').Value);
    lstCodAT.Items.Add(qryAT.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstAdv1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstAdv1.Items.Count > 0)  then begin
      SvItem := lstAdv1.ItemIndex;
      lstAdv1.Items.Delete(SvItem);
      lstCodAdv1.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.lstAdv2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstAdv2.Items.Count > 0) then
  begin
    SvItem := lstAdv2.ItemIndex;

    lstAdv2.Items.Delete(SvItem);
    lstCodAdv2.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.lstATKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstAT.Items.Count > 0) then
  begin
    SvItem := lstAT.ItemIndex;

    lstAT.Items.Delete(SvItem);
    lstCodAT.Items.Delete(SvItem);
  end;
end;


procedure TfrmSelProcesso.ednAbe2Change(Sender: TObject);
begin
  inherited;
  if (ednAbe2.Value < ednAbe1.Value) then
    ednAbe2.Value := ednAbe1.Value;
end;

procedure TfrmSelProcesso.ednAbe1Change(Sender: TObject);
begin
  inherited;
  if (ednAbe1.Value > ednAbe2.Value) then
    ednAbe1.Value := ednAbe2.Value;
end;

procedure TfrmSelProcesso.rgTRTClick(Sender: TObject);
begin
  inherited;
  if (qryTRT.EOF) then
    rgTRT.ItemIndex := 0;
  gbxTRT.Visible := (rgTRT.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcTRTCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  Modified: Boolean);
begin
  inherited;
  lstTRT.Items.Add(qryTRT.FieldByName('DESCRICAO').Value);
  lstCodTRT.Items.Add(qryTRT.FieldByName('CODIGOTRT').AsString);
end;

procedure TfrmSelProcesso.lstTRTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstTRT.Items.Count > 0) then
  begin
    SvItem := lstTRT.ItemIndex;
    
    lstTRT.Items.Delete(SvItem);
    lstCodTRT.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.EdnNum1Change(Sender: TObject);
begin
  inherited;
  if StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text) then
    ednNum1.Text := ednNum2.Text;
end;

procedure TfrmSelProcesso.EdnNum2Change(Sender: TObject);
begin
  inherited;
  if StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text) then
    ednNum2.Text := ednNum1.Text;
end;

procedure TfrmSelProcesso.ednCus1Change(Sender: TObject);
begin
  inherited;
  if StrToFloat(ednCus1.Text) > StrToFloat(ednCus2.Text) then
     ednCus1.Text := ednCus2.Text;
end;

procedure TfrmSelProcesso.ednCus2Change(Sender: TObject);
begin
  inherited;
  if StrToFloat(ednCus2.Text) < StrToFloat(ednCus1.Text) then
     ednCus2.Text := ednCus1.Text;
end;

procedure TfrmSelProcesso.rgSitProcClick(Sender: TObject);
begin
  inherited;
  gbxTipEncer.Visible := (rgSitProc.ItemIndex > 0);
  gbxDataEnc.Visible  := (rgSitProc.ItemIndex > 0);
  rgSentenca.Visible  := (rgSitProc.ItemIndex > 0);
  gbxSentenca.Visible := (rgSitProc.ItemIndex > 0) and (rgSentenca.ItemIndex > 0);
end;

procedure TfrmSelProcesso.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmSelProcesso.bbtnConfirmarClick(Sender: TObject);
var
  sAdvC, sAdv1, sAdv2, sAT, sTRT, sTipoProc, sTipoAcao, sObjeto, sEtapa, sSentenca : String;
  MarcouFuncionario : Boolean;
  sEstab, sCargo, sSindi, sRamo, sMotivo, sUF, sCidade : String;
begin
  inherited;
  ds.Dataset.Close;
  MarcouFuncionario := (cbxEfetivos.Checked)    or (cbxEspeciais.Checked)     or
                       (cbxTemporarios.Checked) or (cbxEstagiarios.Checked)   or
                       (cbxTerceiros.Checked)   or (cbxProprietarios.Checked) or
                       (cbxAutonomos.Checked);

  if  (not MarcouFuncionario) then begin
      MsgDlg('Assinale Ao Menos Um Tipo de Contrato',
              'Aviso', mtInformation, [mbOk,mbHelp], 0);
      PageControl2.ActivePage := tsDadosFunc;
      gbxTipContra.SetFocus;
      exit;
  end;

  if  (not cbxAtivos.Checked)    and (not cbxAfastados.Checked)  and
      (not cbxDemitidos.Checked) then
  begin
      MsgDlg('Assinale Ao Menos Um Tipo de Situação Funcional',
              'Aviso', mtInformation, [mbOk,mbHelp], 0);
      PageControl2.ActivePage := tsDadosFunc;
      gbxSituacao.SetFocus;
      exit;
  end;

  if  (not cbxMensalistas.Checked) and (not cbxDiaristas.Checked) and
      (not cbxHoristas.Checked) then
  begin
      MsgDlg('Assinale Ao Menos Um Tipo de Salário',
              'Aviso', mtInformation, [mbOk,mbHelp], 0);
      PageControl2.ActivePage := tsDadosFunc;
      gbxTipoSal.SetFocus;
      exit;
  end;

  if  (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0) then begin
      sAdvC := '(';
      for  I := 0  to  (lstAdvC.Items.Count - 1)  do begin
          if lstAdvC.Items[I] = ''  then  break;
          if  I > 0  then  sAdvC := sAdvC + ',';
          sAdvC := sAdvC + lstCodAdvC.Items[I];
      end;
      sAdvC := sAdvC + ')';
  end;

  if  (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0) then begin
      sAdv1 := '(';
      for  I := 0  to  (lstAdv1.Items.Count - 1)  do begin
          if lstAdv1.Items[I] = ''  then  break;
          if  I > 0  then  sAdv1 := sAdv1 + ',';
          sAdv1 := sAdv1 + lstCodAdv1.Items[I];
      end;
      sAdv1 := sAdv1 + ')';
  end;

  if  (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0) then begin
      sAdv2 := '(';
      for  I := 0  to  (lstAdv2.Items.Count - 1)  do begin
          if lstAdv2.Items[I] = ''  then  break;
          if  I > 0  then  sAdv2 := sAdv2 + ',';
          sAdv2 := sAdv2 + lstCodAdv2.Items[I];
      end;
      sAdv2 := sAdv2 + ')';
  end;

  if  (rgAT.ItemIndex * lstAT.Items.Count > 0) then begin
      sAT := '(';
      for  I := 0  to  (lstAT.Items.Count - 1)  do begin
          if lstAT.Items[I] = ''  then  break;
          if  I > 0  then  sAT := sAT + ',';
          sAT := sAT + lstCodAT.Items[I];
      end;
      sAT := sAT + ')';
  end;

  if  (rgTRT.ItemIndex * lstTRT.Items.Count > 0) then begin
      sTRT := '(';
      for  I := 0  to  (lstTRT.Items.Count - 1)  do begin
          if lstTRT.Items[I] = ''  then  break;
          if  I > 0  then  sTRT := sTRT + ',';
          sTRT := sTRT + lstCodTRT.Items[I];
      end;
      sTRT := sTRT + ')';
  end;

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

  if  (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) then begin
      sTipoProc := '(';
      for  I := 0  to  (lstTipoProc.Items.Count - 1)  do begin
          if lstTipoProc.Items[I] = ''  then  break;
          if  I > 0  then  sTipoProc := sTipoProc + ',';
          sTipoProc := sTipoProc + lstCodTipoProc.Items[I];
      end;
      sTipoProc := sTipoProc + ')';
  end;

  if  (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0) then begin
      sTipoAcao := '(';
      for  I := 0  to  (lstTipoAcao.Items.Count - 1)  do begin
          if lstTipoAcao.Items[I] = ''  then  break;
          if  I > 0  then  sTipoAcao := sTipoAcao + ',';
          sTipoAcao := sTipoAcao + lstCodTipoAcao.Items[I];
      end;
      sTipoAcao := sTipoAcao + ')';
  end;

  if  (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then begin
      sObjeto := '(';
      for  I := 0  to  (lstObjeto.Items.Count - 1)  do begin
          if lstObjeto.Items[I] = ''  then  break;
          if  I > 0  then  sObjeto := sObjeto + ',';
          sObjeto := sObjeto + lstCodObjeto.Items[I];
      end;
      sObjeto := sObjeto + ')';
  end;

  if  (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then begin
      sEtapa := '(';
      for  I := 0  to  (lstEtapa.Items.Count - 1)  do begin
          if lstEtapa.Items[I] = ''  then  break;
          if  I > 0  then  sEtapa := sEtapa + ',';
          sEtapa := sEtapa + lstCodEtapa.Items[I];
      end;
      sEtapa := sEtapa + ')';
  end;

  if  (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0) then begin
      sSentenca := '(';
      for  I := 0  to  (lstSentenca.Items.Count - 1)  do begin
          if lstSentenca.Items[I] = ''  then  break;
          if  I > 0  then  sSentenca := sSentenca + ',';
          sSentenca := sSentenca + lstCodSentenca.Items[I];
      end;
      sSentenca := sSentenca + ')';
  end;

  FezEstab := False;
  if  (rgSelEstab.ItemIndex > 0) then begin
      for  I := 0  to  (chklstEstab.Items.Count - 1)  do begin
          if chklstEstab.checked[i] then begin
             if  not FezEstab  then  sEstab := '('
             else  sEstab := sEstab + ',';
             sEstab := sEstab + lstCodEstab.Items[I]; //ListaEstab[I];
             FezEstab := True;

             if  (cbxSubEstab.checked)  then  begin
                 qryEstab.Close;
                 qryEstab.ParamByName('IdEmpresaProp').Value := StrToInt(lstCodEstab.Items[I]);//StrToInt(ListaEstab[I]);
                 qryEstab.Open;
                 while  not  qryEstab.Eof  do begin
                    sEstab := sEstab + ',';
                    sEstab := sEstab + qryEstab.FieldByName('IdPessoa').AsString;
                    qryEstab.Next;
                 end;
                 qryEstab.First;
             end;
          end;
      end;
      if  FezEstab  then  sEstab := sEstab + ')';
  end;

  if  (rgSelCargo.ItemIndex > 0) then begin
      sCargo := '(';
      for  I := 0  to  (lstCargo.Items.Count - 1)  do begin
          if lstCargo.Items[I] = ''  then  break;
          if  I > 0  then  sCargo := sCargo + ',';
          sCargo := sCargo + lstCodCargo.Items[I];
      end;
      sCargo := sCargo + ')';
  end;

  if  (rgSelSindi.ItemIndex > 0) then begin
      sSindi := '(';
      for  I := 0  to  (lstSindi.Items.Count - 1)  do begin
          if lstSindi.Items[I] = ''  then  break;
          if  I > 0  then  sSindi := sSindi + ',';
          sSindi := sSindi + lstCodSindi.Items[I];
      end;
      sSindi := sSindi + ')';
  end;

  if  (rgSelRamo.ItemIndex > 0) then begin
      sRamo := '(';
      for  I := 0  to  (lstRamo.Items.Count - 1)  do begin
          if lstRamo.Items[I] = ''  then  break;
          if  I > 0  then  sRamo := sRamo + ',';
          sRamo := sRamo + lstCodRamo.Items[I];
      end;
      sRamo := sRamo + ')';
  end;

  if  (rgSelMotivo.ItemIndex > 0) and (cbxDemitidos.Checked) then begin
      sMotivo := '(';
      for  I := 0  to  (lstMotivos.Items.Count - 1)  do begin
          if lstMotivos.Items[I] = ''  then  break;
          if  I > 0  then  sMotivo := sMotivo + ',';
          sMotivo := sMotivo + lstCodMotivos.Items[I];
      end;
      sMotivo := sMotivo + ')';
  end;

  qryProcesso.SQL.Clear;
  sSql := 'SELECT DISTINCT PROCESSOTRAB.*, RECLAMANTES.*, CIDADES.IDESTADO, ';
  sSql := sSql + 'VARAJUSTICA.DESCRICAO AS NOMEVARA ';
  sSql := sSql + 'FROM PROCESSOTRAB, CIDADES, VARAJUSTICA, ';

//***** sub-select reclamantes *******************************************************
  sSql := sSql + '( SELECT PESSOA.NOME, PESSOA.RAZAOSOCIAL, PESSOA.TIPO, PESSOA.NUMDOCUMENTO, ';
  sSql := sSql + 'PF.IDSINDICATO,PF.IDGRINSTR,PF.IDPROFISS,PF.DATAMORTE,PF.DATANASC, ';
  sSql := sSql + 'PF.SEXO,PF.TIPOSANG,PF.ESTCIVIL,PF.NUMDEPIRRF,PF.NUMDEPSALF,PF.NUMDEPTOT, ';
  sSql := sSql + 'CIDADES.NOME AS CIDADE, ';
  sSql := sSql + 'ENDPESS.LOGRADOURO, ';
  sSql := sSql + 'ENDPESS.CODESTADO, ';
  sSql := sSql + 'ENDPESS.NUMERO, ';
  sSql := sSql + 'ENDPESS.COMPLEMENTO, ';
  sSql := sSql + 'ENDPESS.BAIRRO, ';
  sSql := sSql + 'ENDPESS.CEP, ';

  if  MarcouFuncionario  then
      sSql := sSql + ' FUNCIONARIO.*, SITFUNC.TIPOSIT, SITFUNC.DESCRICAO, ' +
                     ' HORATRAB.JORNADAMENSAL, ' +
                     ' FILIALPESSOA.IDRAMOFORNECEDOR, CARGO.TITULO ';

  sSql := sSql + 'FROM PESSOA, PESSOAFISICA PF, ENDPESS, CIDADES, ';

  if  MarcouFuncionario  then
      sSql := sSql + ' FUNCIONARIO, SITFUNC, HORATRAB, FILIALPESSOA, CARGO ';

  sSql := sSql + 'WHERE PESSOA.IDPESSOA   = PF.IDPESSOA            AND ';
  sSql := sSql + 'PESSOA.IDENDRESIDENCIAL =  ENDPESS.IDENDERECO(+) AND ';
  sSql := sSql + 'ENDPESS.IDCIDADES       =  CIDADES.IDCIDADES(+)  AND ';

  sSql := sSql + 'FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+) AND ';

  if  MarcouFuncionario  then begin
      sSql := sSql + 'FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA AND ';
      sSql := sSql + 'FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC(+)  AND ';
      sSql := sSql + 'FUNCIONARIO.IDHORARIO = HORATRAB.IDHORARIO(+) AND ';

      if sUsuXccusto <> '' then
         sSql := sSql + 'FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto + ' AND ';

      if sUsuXfilial <> '' then
         sSql := sSql + 'FUNCIONARIO.IDESTAB IN ' + sUsuXfilial + ' AND ';

      if  (not cbxAtivos.Checked)  then
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
                       'FUNCIONARIO.DATADESLIGAMENTO BETWEEN ' +
                       'TO_DATE(' + QuotedStr(EdDataDem1.Text) + ',''dd/mm/yyyy'') AND ' +
                       'TO_DATE(' + QuotedStr(EdDataDem2.Text) + ',''dd/mm/yyyy'')' +
                       ') AND ';
      end;

      if  (not cbxEfetivos.Checked)  then
          sSql := sSql + ' FUNCIONARIO.TIPOCONTRATO <> ''E'' AND ';
      if  (not cbxEspeciais.Checked)  then
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

      if  (rgSelEstab.ItemIndex > 0) and (FezEstab)   then
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

  if  (not cbxFeminino.Checked)  then
      sSql := sSql + 'PF.SEXO <> ''F'' AND ';
  if  (not cbxMasculino.Checked)  then
      sSql := sSql + 'PF.SEXO <> ''M'' AND ';

  if  (not cbxSolt.Checked)  then
      sSql := sSql + 'PF.ESTCIVIL <> ''S'' AND ';
  if  (not cbxCas.Checked)  then
      sSql := sSql + 'PF.ESTCIVIL <> ''C'' AND ';
  if  (not cbxSep.Checked)  then
      sSql := sSql + 'PF.ESTCIVIL <> ''D'' AND ';
  if  (not cbxSepJud.Checked)  then
      sSql := sSql + 'PF.ESTCIVIL <> ''J'' AND ';
  if  (not cbxDes.Checked)  then
      sSql := sSql + 'PF.ESTCIVIL <> ''E'' AND ';
  if  (not cbxViu.Checked)  then
      sSql := sSql + 'PF.ESTCIVIL <> ''V'' AND ';
  if  (not cbxOutr.Checked)  then
      sSql := sSql + 'PF.ESTCIVIL <> ''O'' AND ';

  if  (not cbxMensalistas.Checked)  then
      sSql := sSql + 'TIPOPAGAMENTO <> ''M'' AND ';
  if  (not cbxDiaristas.Checked)  then
      sSql := sSql + 'TIPOPAGAMENTO <> ''D'' AND ';
  if  (not cbxHoristas.Checked)  then
      sSql := sSql + 'TIPOPAGAMENTO <> ''H'' AND ';

  if  (rgSelCargo.ItemIndex > 0)  then
      sSql := sSql + ' FUNCIONARIO.IDCARGO IN ' + sCargo + ' AND ';

  if  (rgSelSindi.ItemIndex > 0)  then
      sSql := sSql + ' PF.IDSINDICATO IN ' + sSindi + ' AND ';

  if  (ednIda1.VALUE > 0)  then  //Faixa Etária
      sSql := sSql + 'TRUNC((SYSDATE - 1 - DATANASC)/365.25) >= ' + IntToStr(ednIda1.VALUE) + ' AND ';
  if  (ednIda2.VALUE < 99) then  //Faixa Etária
      sSql := sSql + 'TRUNC((SYSDATE - 1 - DATANASC)/365.25) <= ' + IntToStr(ednIda2.VALUE) + ' AND ';

  if  cbxAniv.ItemIndex > 0  then  begin  // Mês do Aniversário
      sSql := sSql + 'to_number(substr(to_char(DATANASC,''dd/mm/yyyy''),4,2)) = ';
      sSql := sSql + IntToStr(cbxAniv.ItemIndex) + ' AND ';
  end;

  if  (round(StrToInt(ednCep1.Text)) > 0)      then   //Faixa de CEP
      sSql := sSql + 'to_number(CEP)/1000 >= ' + ednCep1.Text + ' AND ';
  if  (round(StrToInt(ednCep2.Text)) < 99999)  then   //Faixa de CEP
      sSql := sSql + 'to_number(CEP)/1000 <= ' + ednCep2.Text + ' AND ';

  if  rgSinal.ItemIndex > -1  then begin
      sSql := sSql + 'IDGRINSTR ';  //Grau de Instrução
      if  rgSinal.ItemIndex = 0  then  sSql := sSql + ' <= ';
      if  rgSinal.ItemIndex = 1  then  sSql := sSql + ' = ';
      if  rgSinal.ItemIndex = 2  then  sSql := sSql + ' >= ';
      sSql := sSql + dblcGrauInstr.Text + ' AND ';
  end;

  val(dblcProfis.Text,VAL1,J);  //Profissão
  if  VAL1 > 0  then
      sSql := sSql + 'IDPROFISS = ' +  dblcProfis.Text + ' AND ';

  if (rgSinTot.ItemIndex < 2)  or  (speDepTot.Value > 0)  then begin // Total Dependentes
      if (rgSinTot.ItemIndex = 0)  then
          sSql := sSql + 'NUMDEPTOT <= ' +  IntToStr(speDepTot.Value) + ' AND ';
      if (rgSinTot.ItemIndex = 1)  then
          sSql := sSql + 'NUMDEPTOT  = ' +  IntToStr(speDepTot.Value) + ' AND ';
      if (rgSinTot.ItemIndex = 2)  then
          sSql := sSql + 'NUMDEPTOT >= ' +  IntToStr(speDepTot.Value) + ' AND ';
  end;

  if  (rgSinIR.ItemIndex < 2)  or  (speDepIR.Value > 0)  then begin // Dependentes IRRF
      if (rgSinIR.ItemIndex = 0)  then
          sSql := sSql + 'NUMDEPIRRF <= ' +  IntToStr(speDepIR.Value) + ' AND ';
      if (rgSinIR.ItemIndex = 1)  then
          sSql := sSql + 'NUMDEPIRRF  = ' +  IntToStr(speDepIR.Value) + ' AND ';
      if (rgSinIR.ItemIndex = 2)  then
          sSql := sSql + 'NUMDEPIRRF >= ' +  IntToStr(speDepIR.Value) + ' AND ';
  end;

  if  (rgSinSF.ItemIndex < 2)  or  (speDepSF.Value > 0)  then begin // Dependentes Sal.Fam.
      if (rgSinSF.ItemIndex = 0)  then
          sSql := sSql + 'NUMDEPSALF <= ' +  IntToStr(speDepSF.Value) + ' AND ';
      if (rgSinSF.ItemIndex = 1)  then
          sSql := sSql + 'NUMDEPSALF  = ' +  IntToStr(speDepSF.Value) + ' AND ';
      if (rgSinSF.ItemIndex = 2)  then
          sSql := sSql + 'NUMDEPSALF >= ' +  IntToStr(speDepSF.Value) + ' AND ';
  end;

  if  uppercase(Copy(sSQL, Length(sSQL)- 3, 3)) = 'AND' then
      sSQL := Copy(sSQL, 1, Length(sSQL)-4);

  sSql := sSql + ') RECLAMANTES ';
//**************************************************************************************




  if  (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0)  then
      sSql := sSql + ', (SELECT NUMPROCTRAB, COUNT(*) AS TOTALOBJ  '+
           'FROM OBJPROCTRAB WHERE CODTIPOOBJETO IN ' + sObjeto +
           ' GROUP BY NUMPROCTRAB) OBJETOS ';

  if  (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0)  then
      if (rgEtapa.ItemIndex = 1) then
         sSql := sSql + ', (SELECT NUMPROCTRAB ' +
                        'FROM ETAPAPROCTRAB WHERE CODTIPORECURSO IN ' + sEtapa +
                        'AND DATAREALOCOR = ' +
                        '    (SELECT MAX(DATAREALOCOR) FROM ETAPAPROCTRAB E ' +
                        '     WHERE E.NUMPROCTRAB = ETAPAPROCTRAB.NUMPROCTRAB ' +
                        '     GROUP BY NUMPROCTRAB) ' +
                        'AND DATAREALOCOR <= SYSDATE) ETAPAS '
      else
         sSql := sSql + ', (SELECT NUMPROCTRAB, COUNT(*) AS TOTALETP  '+
              'FROM ETAPAPROCTRAB WHERE CODTIPORECURSO IN ' + sEtapa +
              ' GROUP BY NUMPROCTRAB) ETAPAS ';

  sSql := sSql + 'WHERE RECLAMANTES.IDPESSOA = PROCESSOTRAB.IDRECLAMANTE AND ';
  sSql := sSql + 'PROCESSOTRAB.INDMATERIA = 1 AND ';
  sSql := sSql + 'PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+) AND ';
  sSql := sSql + 'PROCESSOTRAB.IDCIDADES  = CIDADES.IDCIDADES(+) AND ';

  if (EdDataInc1.Text <> '') then
    sSql := sSql +
      'PROCESSOTRAB.TRGDTINCLUSAO >= to_date(''' + EdDataInc1.Text + ''',''dd/mm/yyyy'') AND ';
  if (EdDataInc2.Text <> '') then
    sSql := sSql +
     '  (TO_DATE(TO_CHAR(PROCESSOTRAB.TRGDTINCLUSAO,''DD/MM/YYYY''),'+
      '''DD/MM/YYYY'') <= to_date(''' +
      EdDataInc2.Text+ ''',''dd/mm/yyyy'')) AND ';

  if (EdDataAju1.Text <> '') then
    sSql := sSql +
      'PROCESSOTRAB.DATAJUIZO >= to_date(''' + EdDataAju1.Text + ''',''dd/mm/yyyy'') AND ';
  if (EdDataAju2.Text <> '') then
    sSql := sSql +
      'PROCESSOTRAB.DATAJUIZO <= to_date(''' + EdDataAju2.Text + ''',''dd/mm/yyyy'') AND ';

  if (EdDataNot1.Text <> '') then
    sSql := sSql +
      'PROCESSOTRAB.DATANOTIF >= to_date(''' + EdDataNot1.Text + ''',''dd/mm/yyyy'') AND ';
  if (EdDataNot2.Text <> '') then
    sSql := sSql +
      'PROCESSOTRAB.DATANOTIF <= to_date(''' + EdDataNot2.Text + ''',''dd/mm/yyyy'') AND ';

  if (rgSitProc.ItemIndex < 2) then
      sSql := sSql + 'FLGSITPROC = ' + IntToStr(rgSitProc.ItemIndex) + ' AND ';

  if (rgSitProc.ItemIndex > 0) and ((EdDataEnc1.Text <> '') or (EdDataEnc2.Text <> '')) then
  begin
    sSql := sSql + '(FLGSITPROC = 0 or ';

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

    sSql := sSql + ') AND ';
  end;

  if (rgSitProc.ItemIndex > 0) then
  begin
      if  (not cbxArquiv.Checked)  then
          sSql := sSql + '(FLGSITPROC = 0 or TIPOENCER <> ''A'') AND ';
      if  (not cbxAcordo.Checked)  then
          sSql := sSql + '(FLGSITPROC = 0 or TIPOENCER <> ''C'') AND ';
      if  (not cbxDesist.Checked)  then
          sSql := sSql + '(FLGSITPROC = 0 or TIPOENCER <> ''D'') AND ';
      if  (not cbxSent.Checked)  then
          sSql := sSql + '(FLGSITPROC = 0 or TIPOENCER <> ''S'') AND ';
  end;

  if  (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0)  then
      sSql := sSql + ' IDADVOGCASA IN ' + sAdvC + ' AND ';

  if  (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0)  then
      sSql := sSql + ' IDADVOGRECDA IN ' + sAdv1 + ' AND ';

  if  (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0)  then
      sSql := sSql + ' IDADVOGRECTE IN ' + sAdv2 + ' AND ';

  if  (rgAT.ItemIndex * lstAT.Items.Count > 0)  then
      sSql := sSql + ' IDASSISTTECN IN ' + sAT + ' AND ';

  if  (rgTRT.ItemIndex * lstTRT.Items.Count > 0)  then
      sSql := sSql + ' CODIGOTRT IN ' + sTRT + ' AND ';

  if  (rgUF.ItemIndex * lstUF.Items.Count > 0)  then
      sSql := sSql + ' IDESTADO IN ' + sUF + ' AND ';

  if  (rgCidade.ItemIndex * lstCidade.Items.Count > 0)  then
      sSql := sSql + ' PT.IDCIDADES ' + iff(cbxCidadeNegativa.Checked,'NOT','') + ' IN ' + sCidade + ' AND ';

  if  (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0)  then
      sSql := sSql + ' IdTipoProc IN ' + sTipoProc + ' AND ';

  if  (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0)  then
      sSql := sSql + ' IdTipoAcao IN ' + sTipoAcao + ' AND ';

  if  (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0)  then
      sSql := sSql + ' (FLGSITPROC = 0 or CodTipoSent IN ' + sSentenca + ') AND ';

  if  (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0)  then
      sSql := sSql + ' PROCESSOTRAB.NUMPROCTRAB = OBJETOS.NUMPROCTRAB AND '+
                     ' NVL(OBJETOS.TOTALOBJ,0) > 0 AND ';

  if  (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0)  then
      if (rgEtapa.ItemIndex = 1) then
         sSql := sSql + ' PROCESSOTRAB.NUMPROCTRAB = ETAPAS.NUMPROCTRAB AND '
      else
         sSql := sSql + ' PROCESSOTRAB.NUMPROCTRAB = ETAPAS.NUMPROCTRAB AND '+
                        ' NVL(ETAPAS.TOTALETP,0) > 0 AND ';

  if  (ednAbe1.VALUE > 0)   then  begin //Tempo de Existencia
       sSql := sSql + '(to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),7,10)) -';
       sSql := sSql + ' to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),7,10))) * 12 +';
       sSql := sSql + ' to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),4,2)) -';
       sSql := sSql + ' to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),4,2)) + ';
       sSql := sSql + ' decode((to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) - ';
       sSql := sSql + ' to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2))) / ';
       sSql := sSql + ' decode(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2), ';
       sSql := sSql + ' substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2),1, ';
       sSql := sSql + ' abs(to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) - ';
       sSql := sSql + ' to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
       sSql := sSql + ' >= ' + IntToStr(ednAbe1.VALUE) + ' AND ';
  end;
  if  (ednAbe2.VALUE < 999)   then  begin //Tempo de Existencia
       sSql := sSql + '(to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),7,10)) -';
       sSql := sSql + ' to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),7,10))) * 12 +';
       sSql := sSql + ' to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),4,2)) -';
       sSql := sSql + ' to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),4,2)) + ';
       sSql := sSql + ' decode((to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) - ';
       sSql := sSql + ' to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2))) / ';
       sSql := sSql + ' decode(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2), ';
       sSql := sSql + ' substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2),1, ';
       sSql := sSql + ' abs(to_number(substr(to_char(decode(FLGSITPROC, 1, DATAEFETENC, sysdate),''dd/mm/yyyy''),1,2)) - ';
       sSql := sSql + ' to_number(substr(to_char(DATANOTIF,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
       sSql := sSql + ' <= ' + IntToStr(ednAbe2.VALUE) + ' AND ';
  end;

  if  rgInstancia.ItemIndex > 0  then begin
      if  rgInstancia.ItemIndex = 1  then
          sSql := sSql + 'PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NULL ' +
                          'AND PROCTSTNUM IS NULL AND ';
      if  rgInstancia.ItemIndex = 2  then
          sSql := sSql + 'PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL ' +
                          'AND PROCTSTNUM IS NULL AND ';
      if  rgInstancia.ItemIndex = 3  then
          sSql := sSql + 'PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL ' +
                          'AND PROCTSTNUM IS NOT NULL AND ';
  end;

  if  (StrToFloat(ednNum1.Text) > 0)  then
      sSql := sSql + 'NUMPROCTRAB >= ' + ednNum1.Text + ' AND ';
  if  (ednNum2.Text <> '9999999999')  then
      sSql := sSql + 'NUMPROCTRAB <= ' + ednNum2.Text + ' AND ';

  if  (StrToFloat(ednCus1.Text) > 0)  then
      sSql := sSql + 'CUSTOPROC >= ' + ednCus1.Text + ' AND ';
  if  (ednCus2.Text <> '9999999999')  then
      sSql := sSql + 'CUSTOPROC <= ' + ednCus2.Text + ' AND ';


  if  uppercase(Copy(sSQL, Length(sSQL)- 3, 3)) = 'AND' then
      sSQL := Copy(sSQL, 1, Length(sSQL)-4);

  sSql := sSql + ' order by ' + TituOrdF[cmbSequencia.ItemIndex];

  qryProcesso.SQL.Add(sSql);
  qryProcesso.Open;

  ModalResult := mrOk;

end;

procedure TfrmSelProcesso.rgTipoProcClick(Sender: TObject);
begin
  inherited;
  if qryTipoProc.EOF  then  rgTipoProc.ItemIndex := 0;
  gbxTipoProc.Visible := (rgTipoProc.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcTipoProcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
     lstTipoProc.Items.Add(qryTipoProc.FieldByName('NOMETIPOPROC').Value);
     lstCodTipoProc.Items.Add(qryTipoProc.FieldByName('IDTIPOPROC').AsString);
end;

procedure TfrmSelProcesso.lstTipoProcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstTipoProc.Items.Count > 0)  then begin
      SvItem := lstTipoProc.ItemIndex;
      lstTipoProc.Items.Delete(SvItem);
      lstCodTipoProc.Items.Delete(SvItem);
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

procedure TfrmSelProcesso.dblcProfisCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  {dblcProfis}(Sender as TwwDBLookupCombo).Text :=
           trim(tblProfis.FieldByName('IDPROFISS').AsString);
end;

procedure TfrmSelProcesso.dblcGrauInstrCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  {dblcGrauInstr}(Sender as TwwDBLookupCombo).Text :=
            trim(qryGrauInstr.FieldByName('IDGRINSTR').AsString);
end;

procedure TfrmSelProcesso.rgSelEstabClick(Sender: TObject);
begin
  inherited;
  if  (rgSelEstab.ItemIndex = 1) and  (not tblEstab.Active)  then  begin
       // Preenche ChkList dos Estabelecimentos
       frmAguarde.Mostra ('Selecionando Estabelecimentos...');
       tblEstab.Open;
       chklstEstab.Items.Clear;
       //ListaEstab := TStringList.Create;
       with tblEstab do
       begin
         while not eof do
         begin
           chklstEstab.Items.Add(FieldByName('Nome').AsString);
           //ListaEstab.Add(FieldByName('IdPessoa').AsString);
           lstCodEstab.Items.Add(tblEstab.FieldByName('IDPESSOA').AsString);
           Next;
         end;
         First;
       end;
       frmAguarde.Apaga;
  end;
  if tblEstab.EOF  then  rgSelEstab.ItemIndex := 0;
  gbxEstab.Visible := (rgSelEstab.ItemIndex = 1);
end;

procedure TfrmSelProcesso.rgSelCargoClick(Sender: TObject);
begin
  inherited;
  if  (rgSelCargo.ItemIndex = 1) and  (not tblCargo.Active)  then  tblCargo.Open;
  if tblCargo.EOF  then  rgSelCargo.ItemIndex := 0;
  gbxCargo.Visible := (rgSelCargo.ItemIndex = 1);
end;

procedure TfrmSelProcesso.rgSelSindiClick(Sender: TObject);
begin
  inherited;
  if  (rgSelSindi.ItemIndex = 1) and  (not tblSindic.Active)  then  tblSindic.Open;
  if tblSindic.EOF  then  rgSelSindi.ItemIndex := 0;
  gbxSindi.Visible := (rgSelSindi.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcCargoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstCargo.Items.Add(tblCargo.FieldByName('TITULO').Value);
     lstCodCargo.Items.Add(tblCargo.FieldByName('IDCARGO').AsString);
  end;
end;

procedure TfrmSelProcesso.dblcSindiCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstSindi.Items.Add(tblSindic.FieldByName('NOME').Value);
     lstCodSindi.Items.Add(tblSindic.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelProcesso.lstCargoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstCargo.Items.Count > 0)  then begin
      SvItem := lstCargo.ItemIndex;
      lstCargo.Items.Delete(SvItem);
      lstCodCargo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.dblcSindiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstSindi.Items.Count > 0)  then begin
      SvItem := lstSindi.ItemIndex;
      lstSindi.Items.Delete(SvItem);
      lstCodSindi.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.dblcLotacaoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) and (not tblLotacao.Eof) then
  {dblcLotacao}(Sender as TwwDBLookupCombo).Text :=
      tblLotacao.FieldByName('CODCENTROCUSTO').Value;
end;

procedure TfrmSelProcesso.ednAdm2Change(Sender: TObject);
begin
  inherited;
  if ednAdm2.Value < ednAdm1.Value then ednAdm2.Value := ednAdm1.Value;
end;

procedure TfrmSelProcesso.ednAdm1Change(Sender: TObject);
begin
  inherited;
  if ednAdm1.Value > ednAdm2.Value then ednAdm1.Value := ednAdm2.Value;
end;

procedure TfrmSelProcesso.ednLot1Change(Sender: TObject);
begin
  inherited;
  if ednLot1.Value > ednLot2.Value then ednLot1.Value := ednLot2.Value;
end;

procedure TfrmSelProcesso.ednCar1Change(Sender: TObject);
begin
  inherited;
  if ednCar1.Value > ednCar2.Value then ednCar1.Value := ednCar2.Value;
end;

procedure TfrmSelProcesso.ednIda1Change(Sender: TObject);
begin
  inherited;
  if ednIda1.Value > ednIda2.Value then ednIda1.Value := ednIda2.Value;
end;

procedure TfrmSelProcesso.ednLot2Change(Sender: TObject);
begin
  inherited;
  if ednLot2.Value < ednLot1.Value then ednLot2.Value := ednLot1.Value;
end;

procedure TfrmSelProcesso.ednCar2Change(Sender: TObject);
begin
  inherited;
  if ednCar2.Value < ednCar1.Value then ednCar2.Value := ednCar1.Value;
end;

procedure TfrmSelProcesso.ednIda2Change(Sender: TObject);
begin
  inherited;
  if ednIda2.Value < ednIda1.Value then ednIda2.Value := ednIda1.Value;
end;

procedure TfrmSelProcesso.rgSelRamoClick(Sender: TObject);
begin
  inherited;
  if  (rgSelRamo.ItemIndex = 1) and  (not qryRamo.Active)  then  qryRamo.Open;
  if  qryRamo.EOF  then  rgSelRamo.ItemIndex := 0;
  gbxRamo.Visible := (rgSelRamo.ItemIndex = 1);
end;

procedure TfrmSelProcesso.lstRamoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstRamo.Items.Count > 0)  then begin
      SvItem := lstRamo.ItemIndex;
      lstRamo.Items.Delete(SvItem);
      lstCodRamo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.dblcRamoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstRamo.Items.Add(qryRamo.FieldByName('DESCRAMOFORNECEDOR').Value);
     lstCodRamo.Items.Add(qryRamo.FieldByName('IDRAMOFORNECEDOR').AsString);
  end;
end;

procedure TfrmSelProcesso.rgSelMotivoClick(Sender: TObject);
begin
  inherited;
  if  (rgSelMotivo.ItemIndex = 1) and  (not qryMotivo.Active)  then  qryMotivo.Open;
  if qryMotivo.EOF  then  rgSelMotivo.ItemIndex := 0;
  gbxMotivos.Visible := (rgSelMotivo.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcMotivosCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstMotivos.Items.Add(qryMotivo.FieldByName('DESCRICAO').Value);
     lstCodMotivos.Items.Add(qryMotivo.FieldByName('IDMOTIVO').AsString);
  end;
end;

procedure TfrmSelProcesso.lstMotivosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstMotivos.Items.Count > 0)  then begin
      SvItem := lstMotivos.ItemIndex;
      lstMotivos.Items.Delete(SvItem);
      lstCodMotivos.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.cbxDemitidosClick(Sender: TObject);
begin
  inherited;
  gbxDemitidos.Visible := cbxDemitidos.Checked;
end;

procedure TfrmSelProcesso.lstSindiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstSindi.Items.Count > 0)  then begin
      SvItem := lstSindi.ItemIndex;
      lstSindi.Items.Delete(SvItem);
      lstCodSindi.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelProcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblEstab.Close;
//  tblEstab.Unprepare;
  //ListaEstab.Free;
end;

procedure TfrmSelProcesso.bbtnSelEstabClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  for i := 0 to chklstEstab.Items.Count - 1 do
      chklstEstab.checked[i] := True;

end;

procedure TfrmSelProcesso.bbtnInvEstabClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  for i := 0 to chklstEstab.Items.Count - 1 do
      chklstEstab.checked[i] := not chklstEstab.checked[i];

end;

procedure TfrmSelProcesso.rgTipoAcaoClick(Sender: TObject);
begin
  inherited;
  if qryTipoAcao.EOF  then  rgTipoAcao.ItemIndex := 0;
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
  inherited;
  if qryAdvCasa.EOF  then  rgAdvC.ItemIndex := 0;
  gbxAdvC.Visible := (rgAdvC.ItemIndex = 1);
end;

procedure TfrmSelProcesso.dblcAdvCCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
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

procedure TfrmSelProcesso.rgUFClick(Sender: TObject);
begin
  inherited;
  if (qryUF.EOF) then
    rgUF.ItemIndex := 0;
  gbxUF.Visible := (rgUF.ItemIndex = 1);
  MudouEstado;
end;

procedure TfrmSelProcesso.dblcUFCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
    lstUF.Items.Add(qryUF.FieldByName('NOMEESTADO').AsString);
    lstCodUF.Items.Add(qryUF.FieldByName('IDESTADO').AsString);
    MudouEstado;
  end;

end;

procedure TfrmSelProcesso.lstUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = vk_Delete) and (lstUF.Items.Count > 0) then
  begin
    SvItem := lstUF.ItemIndex;
    lstUF.Items.Delete(SvItem);
    lstCodUF.Items.Delete(SvItem);
    MudouEstado;
  end;
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
