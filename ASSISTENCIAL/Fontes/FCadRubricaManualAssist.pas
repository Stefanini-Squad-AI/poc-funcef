unit FCadRubricaManualAssist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Spin, Mask, wwdbedit, wwdblook, IvDictio, IvMulti, IvEMulti;

type
  TfrmCadRubricaManualAssist = class(TfrmCadastroCS)
    MontaSelectPart: TMontaSelect;
    pnlDados: TPanel;
    pnlTitular: TPanel;
    Label2: TLabel;
    Label13: TLabel;
    lblPatro: TLabel;
    Label3: TLabel;
    edTitular: TEdit;
    edPatro: TEdit;
    edPlano: TEdit;
    bbtnProcurar: TBitBtn;
    edMatricula: TEdit;
    pnlEdicao: TPanel;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    GroupBox1: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    Panel1: TPanel;
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    sbtnFiltra: TSpeedButton;
    Label1: TLabel;
    dblkpcmbRubrica: TwwDBLookupCombo;
    Label4: TLabel;
    dbedValor: TwwDBEdit;
    qryProvDesc: TwwQuery;
    qryHistorico: TwwQuery;
    dsHistorico: TwwDataSource;
    dbgrdHistorico: TwwDBGrid;
    qryauxrubrica: TwwQuery;
    SpeedButton1: TSpeedButton;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryProvDescAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRubricaManualAssist: TfrmCadRubricaManualAssist;

implementation

uses UAdmAss, UMensErro;

{$R *.DFM}
procedure TfrmCadRubricaManualAssist.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
     qry.Close;
     qry.ParamByName('IdPessoa').Value := StrToInt(MontaSelect.ValoresChave[0]);
     qry.ParamByName('IdPessJur').Value := StrToInt(MontaSelect.ValoresChave[1]);
     qry.ParamByName('IdRubrica').Value := StrToInt(MontaSelect.ValoresChave[10]);
     qry.ParamByName('Mes').Value := MontaSelect.ValoresChave[8];
     qry.ParamByName('MesCobranca').Value   := MontaSelect.ValoresChave[9];
     qry.Open;
     qryProvDesc.Close;
     qryProvDesc.ParamByName('IdPessoa').Value := StrToInt(MontaSelectPart.ValoresChave[1]);
     qryProvDesc.Open;
  end;
end;

procedure TfrmCadRubricaManualAssist.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled:=True;
  bbtnProcurar.SetFocus;
end;

procedure TfrmCadRubricaManualAssist.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled:=True;
  cmbMesRef.SetFocus;
end;

procedure TfrmCadRubricaManualAssist.bbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  MontaSelectPart.Executar;
  if (MontaSelectPart.RetornouValor) then
  begin
     qryProvDesc.Close;
     qryProvDesc.ParamByName('IdPessoa').Value := StrToInt(MontaSelectPart.ValoresChave[1]);
     qryProvDesc.Open;
     qryHistorico.Close;
     qryHistorico.ParamByName('IdPessoa').Value := StrToInt(MontaSelectPart.ValoresChave[0]);
     qryHistorico.ParamByName('IdPessJur').Value := StrToInt(MontaSelectPart.ValoresChave[1]);
     qryHistorico.Open;
     edTitular.Text := MontaSelectPart.ValoresChave[3];
     edPatro.Text   := MontaSelectPart.ValoresChave[4];
     edPlano.Text   := MontaSelectPart.ValoresChave[5];
     edMatricula.Text := MontaSelectPart.ValoresChave[7];
     cmbMesRef.SetFocus;
  end
  else
  begin
     edTitular.Text := MontaSelectPart.ValoresChave[3];
     edPatro.Text   := MontaSelectPart.ValoresChave[4];
     edPlano.Text   := MontaSelectPart.ValoresChave[5];
     edMatricula.Text := MontaSelectPart.ValoresChave[7];
     qryHistorico.Close;
  end;
end;

procedure TfrmCadRubricaManualAssist.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESSOA').Value := 0;
  qry.ParamByName('IDPESSJUR').Value := 0;
  qry.ParamByName('IDRUBRICA').Value := 0;
  qry.ParamByName('MES').Value := '0000/00';
  qry.ParamByName('MESCOBRANCA').Value := '0000/00';
  qry.Open;

  qryProvDesc.Close;
  qryProvDesc.ParamByName('IDPESSOA').Value := 0;
  qryProvDesc.Open;
  qryHistorico.Close;
end;

procedure TfrmCadRubricaManualAssist.qryBeforePost(DataSet: TDataSet);
var sAnoMesReferencia,sAnoReferencia,sMesReferencia,
    sAnoMesCobranca,sAnoCobranca,sMesCobranca : string;
begin

  sAnoReferencia := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8 then
    sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else
    sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMesReferencia   := sAnoReferencia+'/'+sMesReferencia;

  sAnoCobranca := Trim(spedAnoCob.Text);
  if cmbMesCob.ItemIndex <= 8 then
    sMesCobranca := '0'+IntToStr(cmbMesCob.ItemIndex+1)
  else
    sMesCobranca := IntToStr(cmbMesCob.ItemIndex+1);
  sAnoMesCobranca   := sAnoCobranca+'/'+sMesCobranca;

  if qry.State = dsInsert then
  begin
     qry.FieldByName('IDPESSOA').AsInteger := StrToInt(MontaSelectPart.ValoresChave[0]);
     qry.FieldByName('IDPESSJUR').AsInteger := StrToInt(MontaSelectPart.ValoresChave[1]);
     qry.FieldByName('IDMOTIVO').AsInteger := prmIdMotivoContrib;
  end;
  qry.FieldByName('MES').AsString                := sAnoMesReferencia;
  qry.FieldByName('MESCOBRANCA').AsString        := sAnoMesCobranca;
  qry.FieldByName('CODPROVDESC').AsString        := qryProvDesc.FieldByName('CODPROVDESC').AsString;
  qry.FieldByName('FLGCOMPOESALPART').AsInteger  := qryProvDesc.FieldByName('FLGCOMPOESALPART').AsInteger;
  qry.FieldByName('FLGCOMPOESALBENEF').AsInteger := qryProvDesc.FieldByName('FLGCOMPOESALBENEF').AsInteger;
  qry.FieldByName('FLGIRRF').AsInteger           := qryProvDesc.FieldByName('flgIRRF').AsInteger;
  qry.FieldByName('REFERENCIA').AsString         := '***';
  qry.FieldByName('SEQRUBRICA').AsInteger        := 1;
  inherited;
end;

procedure TfrmCadRubricaManualAssist.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmCadRubricaManualAssist.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12) then
  begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
  end;
  spedAnoRef.Text   := IntToStr(AYear);

  cmbMesCob.Text  := cmbMesRef.Text;
  cmbMesCob.ItemIndex := cmbMesRef.ItemIndex;
  spedAnoCob.Text := spedAnoRef.Text;
end;

procedure TfrmCadRubricaManualAssist.dsStateChange(Sender: TObject);
begin
  inherited;
  bbtnProcurar.Enabled := (ds.DataSet.State = dsInsert);
end;

procedure TfrmCadRubricaManualAssist.qryAfterPost(DataSet: TDataSet);
begin
  inherited;
  if qry.State = dsInsert then
  begin
     qryHistorico.Close;
     qryHistorico.ParamByName('IDPESSOA').Value := StrToInt(MontaSelectPart.ValoresChave[0]);
     qryHistorico.ParamByName('IDPESSJUR').Value := StrToInt(MontaSelectPart.ValoresChave[1]);
     qryHistorico.Open;
  end
  else begin
     qryHistorico.Close;
     qryHistorico.ParamByName('IDPESSOA').Value  := qry.FieldByName('IDPESSOA').asinteger;
     qryHistorico.ParamByName('IDPESSJUR').Value := qry.FieldByName('IDPESSJUR').asinteger;
     qryHistorico.Open;
  end;

end;

procedure TfrmCadRubricaManualAssist.bbtnConfirmarClick(Sender: TObject);
begin
  if qry.state = dsinsert then
  begin
     if trim(dblkpcmbRubrica.text) = '' then
     begin
       MsgDlg('Rubrica não informada !','Atenção',mterror,[mbOK],0);
       exit;
     end;

     if  (trim(dbedValor.Text) = '') or  (strtofloat(dbedValor.Text) = 0 )then
     begin
       MsgDlg('Valor inválido !','Atenção',mterror,[mbOK],0);
       exit;
     end;

     if prmIdMotivoContrib <= 0 then
     begin
       MsgDlg('O Parâmetro -> Motivo Padrão de Contribuição deve ser cadastrado !','Atenção',mterror,[mbOK],0);
       exit;
     end;
  end;

  inherited;
end;

procedure TfrmCadRubricaManualAssist.qryProvDescAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qry.state = dsinsert then
  begin
    qryauxrubrica.close;
    qryauxrubrica.parambyname('IDPESSJUR').AsString := MontaSelectPart.ValoresChave[1];
    qryauxrubrica.open;

    if qryauxrubrica.fieldbyname('IDRUBSALPARTICIP').AsString <> '' then
    qryprovdesc.Locate('IDRUBRICA',qryauxrubrica.fieldbyname('IDRUBSALPARTICIP').AsInteger,[locaseinsensitive]);

    dblkpcmbRubrica.text :=  qryprovdesc.fieldbyname('DESCRPROVDESC').AsString;

  end;//if

end;

procedure TfrmCadRubricaManualAssist.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin

     qry.Close;
     qry.ParamByName('IDPESSOA').Value := StrToInt(MontaSelect.ValoresChave[0]);
     qry.ParamByName('IDPESSJUR').Value := StrToInt(MontaSelect.ValoresChave[1]);
     qry.ParamByName('IDRUBRICA').Value := StrToInt(MontaSelect.ValoresChave[10]);
     qry.ParamByName('MES').AsString := MontaSelect.ValoresChave[8];
     qry.ParamByName('MESCOBRANCA').AsString := MontaSelect.ValoresChave[9];
     qry.Open;

     qryProvDesc.Close;
     qryProvDesc.ParamByName('IDPESSOA').Value := StrToInt(MontaSelect.ValoresChave[1]);
     qryProvDesc.Open;

     qryHistorico.Close;
     qryHistorico.ParamByName('IDPESSOA').Value := StrToInt(MontaSelect.ValoresChave[0]);
     qryHistorico.ParamByName('IDPESSJUR').Value := StrToInt(MontaSelect.ValoresChave[1]);
     qryHistorico.Open;

     edTitular.Text := MontaSelect.ValoresChave[3];
     edPatro.Text   := MontaSelect.ValoresChave[4];
     edPlano.Text   := MontaSelect.ValoresChave[5];
     edMatricula.Text := MontaSelect.ValoresChave[7];
  end;
  sbtnProcurar.Down := false;
  sbtnApagar.enabled := true;
  sbtnAlterar.enabled := true;

end;

procedure TfrmCadRubricaManualAssist.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  qryHistorico.Close;
  qryHistorico.Open;
end;

end.
