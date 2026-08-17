unit fCadLayoutDesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS,
  StdCtrls, TREdit, ExtCtrls, DBCtrls, Wwdbspin, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, Mask, wwdbedit, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, TB97,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls,
  ComCtrls;

type
  TfrmCadLayoutDesconto = class(TfrmCadastroCS)
    qryTipoDoc: TwwQuery;
    qryRubrica: TwwQuery;
    qryFavorecido: TwwQuery;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    qryDetIDLAYOUT: TFloatField;
    qryDetCOLVALOR: TFloatField;
    qryDetTAMVALOR: TFloatField;
    qryDetIDRUBRICA: TFloatField;
    qryDetIDFAVORECIDO: TFloatField;
    qryDetCOLPARCELAS: TFloatField;
    qryDetTAMPARCELAS: TFloatField;
    qryDetCOLOCORRENCIAS: TFloatField;
    qryDetTAMOCORRENCIAS: TFloatField;
    qryDetIDEMPRESA: TFloatField;
    qryDetUNIDNEGOC: TFloatField;
    qryDetCODTIPRECDES: TStringField;
    qryDetPLANO: TFloatField;
    qryDetCODCENTRORESPON: TStringField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetRECPAG: TStringField;
    qryDetTRGDTINCLUSAO: TDateTimeField;
    qryDetTRGUSERINCLUSAO: TStringField;
    qryDetCARACDECIMAL: TStringField;
    qryDetNUMDECIMAIS: TFloatField;
    dsDet: TwwDataSource;
    MontaSelectRubrica: TMontaSelect;
    pnlDecricao: TPanel;
    Label13: TLabel;
    dbedDescricao: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dbedMatriculaPos: TwwDBEdit;
    dbedMatriculaTam: TwwDBEdit;
    rgTipoIdent: TRadioGroup;
    dblcTipoDoc: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    dbedRubricaPos: TwwDBEdit;
    dbedRubricaTam: TwwDBEdit;
    gbxOcorrencias: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbedPosOcorr: TwwDBEdit;
    dbedTamOcorr: TwwDBEdit;
    gbxParcelas: TGroupBox;
    Label7: TLabel;
    Label3: TLabel;
    dbedPosParc: TwwDBEdit;
    dbedTamParc: TwwDBEdit;
    gbxValor: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbedtPosicaoValor: TwwDBEdit;
    dbedtTamValor: TwwDBEdit;
    dbedtDepDecimalValor: TwwDBEdit;
    dbedNumDecimais: TwwDBEdit;
    pnlRubrica: TPanel;
    Label6: TLabel;
    sbtnSelRubrica: TSpeedButton;
    memRubrica: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure rgTipoIdentClick(Sender: TObject);
    procedure sbtnSelRubricaClick(Sender: TObject);
    procedure dbedRubricaPosChange(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    sDescricao: string;
    IdRubrica: LongInt;

    procedure AtualizarDados(ID: string);
    procedure AtualizarRubrica;
  end;

var
  frmCadLayoutDesconto: TfrmCadLayoutDesconto;

implementation

uses {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
  uSistema, uMensErro, uDatabase;

{$R *.DFM}

procedure TfrmCadLayoutDesconto.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipoDoc.Open;
  AtualizarDados('-1');

  with (MontaSelectRubrica.Filtro) do
  begin
    Clear;
    Add('RUBRICAXPESS.IDPESSOA    = '+IntToStr(Sistema.IdEmpresa));
    Add('PROVDESC.FLGTPRUBRICA LIKE (''%F%'')');
    Add('PROVDESC.IDPROVENTO      = RUBRICAXPESS.IdRubrica');
  end;

  rgTipoIdent.ItemIndex := 0;
  rgTipoIdentClick(Sender);
end;

procedure TfrmCadLayoutDesconto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qryDet.Close;
  qryRubrica.Close;
  qryTipoDoc.Close;
  inherited;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    AtualizarDados(MontaSelect.ValoresChave[0]);
    if (qry.FieldByName('ColCodigoDep').IsNull) then
      rgTipoIdent.ItemIndex := 0
    else
      rgTipoIdent.ItemIndex := 1;      
    rgTipoIdentClick(Sender);
  end;
  rgTipoIdent.Enabled := false;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IdLayout').asInteger     := LeUltRegistro(nil,'LayoutDesconto');
  qry.FieldByName('ColCodigoDep').asInteger := 0;

  qryDet.Insert;
  qryDet.FieldByName('IdLayout').asString     := qry.FieldByName('IdLayout').asString;
  qryDet.FieldByName('IdEmpresa').asInteger   := Sistema.IdEmpresa;
  qryDet.FieldByName('NumDecimais').asInteger := 2;

  memRubrica.Text := '';
  rgTipoIdent.ItemIndex := 0;
  dbedDescricao.SetFocus;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  qryDet.Edit;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroDelete(Sender: TObject);
begin
  qryDet.Delete;
  inherited;
end;

procedure TfrmCadLayoutDesconto.CmeCadastroConfirma(Sender: TObject);
begin
  try
    if (CmeCadastro.Operacao in [opInserir, opAlterar]) then
      AplicaAlteracoes([qry, qryDet])
    else
      AplicaAlteracoes([qryDet, qry]);      
    inherited;
  except
    Screen.Cursor := crDefault;
    raise;
  end;
end;

procedure TfrmCadLayoutDesconto.dsStateChange(Sender: TObject);
begin
  inherited;
  rgTipoIdent.Enabled := (qry.State in [dsInsert, dsEdit]);
  if (rgTipoIdent.Enabled) then
    dbedDescricao.SetFocus;
end;

procedure TfrmCadLayoutDesconto.dbedRubricaPosChange(Sender: TObject);
begin
  sbtnSelRubrica.Enabled := (Trim(dbedRubricaPos.Text) = '') and
    (Trim(dbedRubricaTam.Text) = '');
  if (sbtnSelRubrica.Enabled) then
    memRubrica.Text := sDescricao;
end;

procedure TfrmCadLayoutDesconto.rgTipoIdentClick(Sender: TObject);
begin
  dblcTipoDoc.Visible := (rgTipoIdent.ItemIndex = 1);
  if (dblcTipoDoc.Visible) then
  begin
    dblcTipoDoc.LookUpValue := qry.FieldByName('ColCodigoDep').asString;
    dblcTipoDoc.UpDate;
  end;
end;

procedure TfrmCadLayoutDesconto.sbtnSelRubricaClick(Sender: TObject);
begin
  MontaSelectRubrica.Executar;
  if (MontaSelectRubrica.RetornouValor) then
  begin
    IdRubrica       := StrToIntDef(Trim(MontaSelectRubrica.ValoresChave[0]),-1);
    memRubrica.Text := Trim(MontaSelectRubrica.ValoresChave[1]);
  end;
end;

procedure TfrmCadLayoutDesconto.bbtnConfirmarClick(Sender: TObject);
begin
  // Critica os dados do Mestre
  if (Trim(dbedMatriculaPos.Text) = '') then
  begin
    ShowMessage('A posição do campo que identifica o Empregado deve ser preenchida!');
    dbedMatriculaPos.SetFocus;
    exit;
  end;
  
  if (Trim(dbedMatriculaTam.Text) = '') then
  begin
    ShowMessage('O tamanho do campo que identifica o Empregado deve ser preenchido!');
    dbedMatriculaTam.SetFocus;
    exit;
  end;

  if ((Trim(dbedRubricaPos.Text) = '')  and (Trim(dbedRubricaTam.Text) <> '')) or
     ((Trim(dbedRubricaPos.Text) <> '') and (Trim(dbedRubricaTam.Text)  = '')) then
  begin
    if (Trim(dbedRubricaPos.Text) = '') then
    begin
      ShowMessage('A posição do campo que identifica a Rubrica deve ser preenchida!');
      dbedRubricaPos.SetFocus;
    end
    else
    begin
      ShowMessage('O tamanho do campo que identifica a Rubrica deve ser preenchido!');
      dbedRubricaTam.SetFocus;
    end;
    exit;
  end;

  // Critica os dados do Detalhe
  if ((Trim(dbedRubricaPos.Text) = '') or (Trim(dbedRubricaTam.Text) = '')) then
    if (Trim(memRubrica.Text) = '') then
    begin
      ShowMessage('Uma Rubrica deve ser selecionada!');
      memRubrica.SetFocus;
      exit;
    end;

  if ((Trim(dbedPosParc.Text)  = '') and (Trim(dbedTamParc.Text) <> '')) or
     ((Trim(dbedPosParc.Text) <> '') and (Trim(dbedTamParc.Text)  = '')) then
  begin
    ShowMessage('Parcelas: Posição e Tamanho ambos preenchidos ou ambos em branco!');
    dbedPosParc.SetFocus;
    exit;
  end;

  if ((Trim(dbedPosOcorr.Text)  = '') and (Trim(dbedTamOcorr.Text) <> '')) or
     ((Trim(dbedPosOcorr.Text) <> '') and (Trim(dbedTamOcorr.Text)  = '')) then
  begin
    ShowMessage('Ocorrências: Posição e Tamanho ambos preenchidos ou ambos em branco');
    dbedPosOcorr.SetFocus;
    exit;
  end;

  if (Trim(dbedtPosicaoValor.Text) = '') then
  begin
    ShowMessage('Posição do Valor deve ser preenchida!');
    dbedtPosicaoValor.SetFocus;
    exit;
  end;

  if (Trim(dbedtTamValor.Text) = '') then
  begin
    ShowMessage('Tamanho do Valor deve ser preenchido!');
    dbedtTamValor.SetFocus;
    exit;
  end;

  if (rgTipoIdent.ItemIndex = 0) then
    qry.FieldByName('ColCodigoDep').Clear;
    
  if (IdRubrica > 0) then
    qryDet.FieldByName('IdRubrica').asString := IntToStr(IdRubrica)
  else
    qryDet.FieldByName('IdRubrica').Clear;
  qryDet.Post;
  inherited;
end;

procedure TfrmCadLayoutDesconto.AtualizarDados(ID: string);
begin
  qry.Close;
  qry.ParamByName('IdLayout').asString := ID;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdLayout').asString := ID;
  qryDet.Open;

  AtualizarRubrica;
end;

procedure TfrmCadLayoutDesconto.AtualizarRubrica;
begin
  IdRubrica := StrToIntDef(qryDet.FieldByName('IdRubrica').asString,-1);

  qryRubrica.Close;
  qryRubrica.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  qryRubrica.ParamByName('IdRubrica').asFloat   := IdRubrica;
  qryRubrica.Open;

  memRubrica.Text := Trim(qryRubrica.FieldByName('DESCRPROVDESC').asString);
end;

end.
