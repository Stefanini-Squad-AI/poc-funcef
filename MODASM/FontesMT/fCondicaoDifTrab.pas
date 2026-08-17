unit fCondicaoDifTrab;

// Alterações:
{ --------------------------------------------------------------------------------------------------
 Autor......: Felipe A. Santos
 Data.......: 08/01/2015
 Sol........: 229873/16665
 PPM........: 570016
 Descrição..: Criação da Funcionalidade.
--------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlCondifer, Wwdotdot, Wwdbcomb,
  wwdblook, uCMTypes;

type
  TfrmCondicaoDifTrab = class(TFrmCadastroMestreDetMT)
    lblMatricula: TLabel;
    lblNome: TLabel;
    pgctrlSubDet: TPageControl;
    tbsDadosGerais: TTabSheet;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    lblTpCondicao: TLabel;
    grbFatorRisco: TGroupBox;
    lblAgenteNocivo: TLabel;
    lblUtilEPC: TLabel;
    lblUtilEPI: TLabel;
    lblDescEPI: TLabel;
    lblItenExposicao: TLabel;
    lblTecMedicao: TLabel;
    dbgrdArXCondifer: TwwDBGrid;
    btnInserirARXC: TBitBtn;
    btnExcluirARXC: TBitBtn;
    grbReqEPI: TGroupBox;
    chkReqEPI01: TCheckBox;
    chkReqEPI02: TCheckBox;
    chkReqEPI03: TCheckBox;
    chkReqEPI04: TCheckBox;
    dtpDtFim: TCMDateTimePicker;
    dtpDtInicio: TCMDateTimePicker;
    dbcmbUtilEPC: TwwDBComboBox;
    CdsCondifer: TCMClientDataSet;
    CdsTipCond: TCMClientDataSet;
    dsCondifer: TwwDataSource;
    dblkcmbTipoCond: TwwDBLookupCombo;
    dbcmbUtilEPI: TwwDBComboBox;
    dbedtMatricula: TwwDBEdit;
    dbedtNome: TwwDBEdit;
    dbedtSitFunc: TwwDBEdit;
    dbedtCargo: TwwDBEdit;
    dsArxCondifer: TwwDataSource;
    dblkcmbAgenteRisco: TwwDBLookupCombo;
    chkReqEPI05: TCheckBox;
    CdsAgenteRisco: TCMClientDataSet;
    dbedtIntenExpo: TwwDBEdit;
    dbedtDescEPI: TwwDBEdit;
    dbedtTecMedicao: TwwDBEdit;
    CdsArxCondifer: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure btnInserirARXCClick(Sender: TObject);
    procedure btnExcluirARXCClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbgrdArXCondiferCellChanged(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CdsArXCondiferAfterPost(DataSet: TDataSet);
    procedure CdsArXCondiferAfterDelete(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
  private
    dIdPessoa : Double;
    iIdCondifer : Integer;
    CtrlCondifer : TCtrlCondifer;

    function PreenchimentoOKCondifer : boolean;
    function PreenchimentoOkFatorRisco : boolean;
    procedure ClearFieldsCondifer;
    procedure CamposToCdsCondifer;
    procedure CarregarCondifer;
    procedure HabilitaReqEPI;
    { Private declarations }
  public


    { Public declarations }
  end;

var
  frmCondicaoDifTrab: TfrmCondicaoDifTrab;

implementation

uses uCtrlPadroes, uMensErro;

const
     Help = 750132;

{$R *.DFM}

procedure TfrmCondicaoDifTrab.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCondifer := TCtrlCondifer.Create;
  CtrlCondifer.InitializeAs(Padroes);
  CtrlCondifer.CdsCondifer := CdsCondifer;
  CtrlCondifer.CdsArxCondifer := CdsArXCondifer;

  CdsCondifer.Data := CtrlCondifer.ListCondifer(-1);
  CdsTipCond.Data := CtrlCondifer.ListTipCond;
  CdsAgenteRisco.Data := CtrlCondifer.ListPPRAAgenteRisco;

  //Isso é para forcar multiplas linhas no checkbox
  SetWindowLong(chkReqEPI01.Handle, GWL_STYLE,  GetWindowLong(chkReqEPI01.Handle, GWL_STYLE) OR  BS_MULTILINE);
  SetWindowLong(chkReqEPI02.Handle, GWL_STYLE,  GetWindowLong(chkReqEPI02.Handle, GWL_STYLE) OR  BS_MULTILINE);
  SetWindowLong(chkReqEPI03.Handle, GWL_STYLE,  GetWindowLong(chkReqEPI03.Handle, GWL_STYLE) OR  BS_MULTILINE);
  SetWindowLong(chkReqEPI04.Handle, GWL_STYLE,  GetWindowLong(chkReqEPI04.Handle, GWL_STYLE) OR  BS_MULTILINE);
  SetWindowLong(chkReqEPI05.Handle, GWL_STYLE,  GetWindowLong(chkReqEPI05.Handle, GWL_STYLE) OR  BS_MULTILINE);

  chkReqEPI01.Caption := 'Foi tentada a implementação de medidas de proteção coletiva, optando se '+  #10 +
                         'pelo EPI por inviabilidade?';
  chkReqEPI02.Caption := 'Foram observadas as condições de funcionamento e do uso ininterrupto do ' + #10 +
                         'EPI ao longo do tempo?';
  chkReqEPI03.Caption := 'Foi observado o prazo de validade, conforme Certificado de Aprovação - ' + #10 +
                         'CA do MTE?';
  chkReqEPI04.Caption := 'Foi observada a periodicidade de troca definida pelos programas ' + #10 +
                         'Ambientais?';
  chkReqEPI05.Caption := 'Foi observada a higienização?';
end;


procedure TfrmCondicaoDifTrab.bbtnOkDetClick(Sender: TObject);
var
   dsStateCondifer : TDataSetState;
begin
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
     if not(PreenchimentoOKCondifer) then
        Exit;

     CamposToCdsCondifer;
  end;

  dsStateCondifer := CdsCondifer.State;

  inherited;

  if dsStateCondifer = dsEdit then
     bbtnConfirmar.Enabled := True;
end;

function TfrmCondicaoDifTrab.PreenchimentoOKCondifer: boolean;
begin
  Result := False;

  if (dtpDtInicio.Date = 0) then
  begin
    MsgDlg('Preencha a Data de Início', 'Aviso', mtWarning,[mbOk, mbHelp], Help);
    dtpDtInicio.SetFocus;
  end
  else if (dtpDtInicio.Date < cds.FieldByName('DATAADMISSAO').AsDateTime) then
  begin
    MsgDlg('A Data de Início deve ser maior que a Data de Admissão do empregado', 'Aviso', mtWarning,[mbOk, mbHelp], Help);
    dtpDtInicio.SetFocus;
  end
  else if ((dtpDtFim.Date < dtpDtInicio.Date) and (dtpDtFim.Date <> 0)) then
  begin
    MsgDlg('A Data Fim deve ser maior que a Data de Início', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    dtpDtFim.SetFocus;
  end
  else if (Trim(dblkcmbTipoCond.Text) = '') then
  begin
    MsgDlg('Preencha o Tipo de Condição', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    dblkcmbTipoCond.SetFocus;
  end
  else if ((CdsTipCond.FieldByName('CODTIPCONDICAO').AsString = '03') and (CdsArXCondifer.IsEmpty)) then
  begin
     MsgDlg('Insira uma Fator de Risco', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
     dblkcmbAgenteRisco.SetFocus;
  end
  else
      Result := True;
end;

procedure TfrmCondicaoDifTrab.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    dIdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);
    Cds.Data := CtrlCondifer.ListGeral(dIdPessoa);
    CdsCondifer.Data := CtrlCondifer.ListCondifer(dIdPessoa);
    CdsArXCondifer.Data := CtrlCondifer.ListAgenteRiscoXCondifer(dIdPessoa);
  end;
end;

procedure TfrmCondicaoDifTrab.btnInserirARXCClick(Sender: TObject);
begin
  inherited;
  if PreenchimentoOkFatorRisco then
  begin
    CdsArXCondifer.Insert;
    CdsArXCondifer.FieldByName('IDAGENTERISCO').AsString := dblkcmbAgenteRisco.LookupValue;
    CdsArXCondifer.FieldByName('IDCONDIFER').AsInteger := iIdCondifer;
    CdsArXCondifer.FieldByName('DESCRICAO').AsString := dblkcmbAgenteRisco.Text;
    CdsArXCondifer.FieldByName('UTILEPC').AsString := dbcmbUtilEPC.Value;
    CdsArXCondifer.FieldByName('UTILEPI').AsString := dbcmbUtilEPI.Value;
    CdsArXCondifer.FieldByName('UTILEPC2').AsString := dbcmbUtilEPC.Text;
    CdsArXCondifer.FieldByName('UTILEPI2').AsString := dbcmbUtilEPI.Text;
    CdsArXCondifer.FieldByName('DESCEPI').AsString := dbedtDescEPI.Text;
    CdsArXCondifer.FieldByName('IEXPOSICAO').AsString := dbedtIntenExpo.Text;
    CdsArXCondifer.FieldByName('MEDICAO').AsString := dbedtTecMedicao.Text;
    CdsArXCondifer.Post;

    dblkcmbAgenteRisco.Clear;
    dbcmbUtilEPC.Clear;
    dbcmbUtilEPI.Clear;
    dbedtDescEPI.Clear;
    dbedtIntenExpo.Clear;
    dbedtTecMedicao.Clear;
  end;
end;

procedure TfrmCondicaoDifTrab.btnExcluirARXCClick(Sender: TObject);
begin
  inherited;
  if not(CdsArXCondifer.isEmpty) then
     CdsArXCondifer.Delete;
end;

procedure TfrmCondicaoDifTrab.ClearFieldsCondifer;
begin
   chkReqEPI01.Checked := False;
   chkReqEPI02.Checked := False;
   chkReqEPI03.Checked := False;
   chkReqEPI04.Checked := False;
   chkReqEPI05.Checked := False;
   dblkcmbAgenteRisco.Clear;
   dbcmbUtilEPC.Clear;
   dbcmbUtilEPI.Clear;
   dbedtDescEPI.Clear;
   dbedtIntenExpo.Clear;
   dbedtTecMedicao.Clear;
end;

function TfrmCondicaoDifTrab.PreenchimentoOkFatorRisco: boolean;
begin
   Result := False;

   if (Trim(dblkcmbAgenteRisco.Text) = '') then
   begin
      MsgDlg('Preencha o Agente Nocivo', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
      dblkcmbAgenteRisco.SetFocus;
   end
   else if (Trim(dbcmbUtilEPC.Text) = '') then
   begin
      MsgDlg('Preencha a Utilização do EPC', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
      dbcmbUtilEPC.SetFocus;
   end
   else if (Trim(dbcmbUtilEPI.Text) = '') then
   begin
      MsgDlg('Preencha a Utilização do EPI', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
      dbcmbUtilEPI.SetFocus;
   end
   else if (((dbcmbUtilEPI.Value = '1') or (dbcmbUtilEPI.Value = '2')) and (Trim(dbedtDescEPI.Text) = ''))  then
   begin
     MsgDlg('Preencha a Descrição do EPI', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
     dbedtDescEPI.SetFocus;
   end
   else if (Trim(dbedtIntenExpo.Text) = '') then
   begin
      MsgDlg('Preencha a Intensidade de Exposição', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
      dbedtIntenExpo.SetFocus;
   end
   else if (Trim(dbedtTecMedicao.Text) = '') then
   begin
      MsgDlg('Preencha a Técnica de Medição', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
      dbedtTecMedicao.SetFocus;
   end
   else
       Result := True;
end;

procedure TfrmCondicaoDifTrab.CamposToCdsCondifer;
begin
   CdsCondifer.FieldByName('IDCONDIFER').AsInteger := iIdCondifer;
   CdsCondifer.FieldByName('IDPESSOA').AsFloat := dIdPessoa;
   CdsCondifer.FieldByName('DESCRICAO').AsString := dblkcmbTipoCond.Text;

   if chkReqEPI01.Checked then
      CdsCondifer.FieldByName('FLGMOTIVIMPLEMEPI').AsString := 'S'
   else
      CdsCondifer.FieldByName('FLGMOTIVIMPLEMEPI').AsString := 'N';

   if chkReqEPI02.Checked then
      CdsCondifer.FieldByName('FLGCONDEPI').AsString := 'S'
   else
      CdsCondifer.FieldByName('FLGCONDEPI').AsString := 'N';

   if chkReqEPI03.Checked then
      CdsCondifer.FieldByName('FLGPRAZO').AsString := 'S'
   else
      CdsCondifer.FieldByName('FLGPRAZO').AsString := 'N';

   if chkReqEPI04.Checked then
      CdsCondifer.FieldByName('FLGPROGAMB').AsString := 'S'
   else
      CdsCondifer.FieldByName('FLGPROGAMB').AsString := 'N';

   if chkReqEPI05.Checked then
      CdsCondifer.FieldByName('FLGHIGI').AsString := 'S'
   else
      CdsCondifer.FieldByName('FLGHIGI').AsString := 'N';
end;

procedure TfrmCondicaoDifTrab.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
     CarregarCondifer;
  end;

  bbtnConfirmar.Enabled := False;
end;

procedure TfrmCondicaoDifTrab.CarregarCondifer;
begin
   if CdsCondifer.FieldByName('FLGMOTIVIMPLEMEPI').AsString = 'S' then
      chkReqEPI01.Checked := True
   else
      chkReqEPI01.Checked := False;

   if CdsCondifer.FieldByName('FLGCONDEPI').AsString = 'S' then
      chkReqEPI02.Checked := True
   else
      chkReqEPI02.Checked := False;

   if CdsCondifer.FieldByName('FLGPRAZO').AsString = 'S' then
      chkReqEPI03.Checked := True
   else
      chkReqEPI03.Checked := False;

   if CdsCondifer.FieldByName('FLGPROGAMB').AsString = 'S' then
      chkReqEPI04.Checked := True
   else
      chkReqEPI04.Checked := False;

   if CdsCondifer.FieldByName('FLGHIGI').AsString = 'S' then
      chkReqEPI05.Checked := True
   else
      chkReqEPI05.Checked := False;

   CdsArXCondifer.Filtered := False;
   CdsArXCondifer.Filter := 'IDCONDIFER = ' + CdsCondifer.FieldByName('IDCONDIFER').AsString;
   CdsArXCondifer.Filtered := True;
end;

procedure TfrmCondicaoDifTrab.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
     ClearFieldsCondifer;

     iIdCondifer := CtrlCondifer.GetSequenceCondifer;
     CdsArXCondifer.Filtered := False;
     CdsArXCondifer.Filter := 'IDCONDIFER = ' + IntToStr(iIdCondifer);
     CdsArXCondifer.Filtered := True;
  end;
end;

procedure TfrmCondicaoDifTrab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlCondifer);
end;

procedure TfrmCondicaoDifTrab.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCondifer.Gravar;

  if not(Accept) then
     raise Exception.Create(CtrlCondifer.MessageInfo);
  
end;

procedure TfrmCondicaoDifTrab.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
     iIdCondifer := CdsCondifer.FieldByName('IDCONDIFER').AsInteger;
     CdsArXCondifer.Filtered := False;
     CdsArXCondifer.Filter := 'IDCONDIFER = ' + CdsCondifer.FieldByName('IDCONDIFER').AsString;
     CdsArXCondifer.Filtered := True;
  end;
end;

procedure TfrmCondicaoDifTrab.dbgrdArXCondiferCellChanged(Sender: TObject);
begin
  inherited;
  grbReqEPI.Enabled := ((CdsArXCondifer.FieldByName('UTILEPI').AsString = '1') or
                        (CdsArXCondifer.FieldByName('UTILEPI').AsString = '2'));
end;

procedure TfrmCondicaoDifTrab.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Self);
end;

procedure TfrmCondicaoDifTrab.CdsArXCondiferAfterPost(DataSet: TDataSet);
begin
  inherited;
  HabilitaReqEPI;
end;

procedure TfrmCondicaoDifTrab.HabilitaReqEPI;
begin
  if CdsArXCondifer.Locate('UTILEPI', VarArrayOf([1, 2]), []) then
  begin
    grbReqEPI.Enabled := True;
  end
  else
  begin
    grbReqEPI.Enabled := False;
    chkReqEPI01.Checked := False;
    chkReqEPI02.Checked := False;
    chkReqEPI03.Checked := False;
    chkReqEPI04.Checked := False;
    chkReqEPI05.Checked := False;
  end;
end;

procedure TfrmCondicaoDifTrab.CdsArXCondiferAfterDelete(DataSet: TDataSet);
begin
  inherited;
  HabilitaReqEPI;
end;

procedure TfrmCondicaoDifTrab.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := False;
  dtpDtInicio.SetFocus;
end;

procedure TfrmCondicaoDifTrab.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCondicaoDifTrab.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;

  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCondicaoDifTrab.sbtnExcluiDetClick(Sender: TObject);
begin
  if MsgDlg('Confirma Exclusão?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Exit;
  end;

  inherited;

end;

end.
