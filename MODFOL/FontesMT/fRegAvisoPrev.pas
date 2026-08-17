{*******************************************************************************
Nº SIG...........: 38475/84907
Data da Alteração: 16/04/2019
Responsável......: Everson Cunha
Descrição........: Atualizações para adequação ao leaite s-2250.
                   Versão atual 2.5.01
********************************************************************************
Nº SOL...........: 229881/16649
Nº PPM...........: 566000
Data da Alteração: 26/02/2015
Responsável......: Felipe A. Santos
Descrição........: Criação da funcionalidade Registro de Aviso Prévio.
********************************************************************************}


unit fRegAvisoPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker, DBCtrls, Wwdotdot, Wwdbcomb,
  uCtrlRegAvisoPrev;

type
  TfrmRegAvisoPrev = class(TFrmCadastroMestreDetMT)
    lblMat: TLabel;
    lblNome: TLabel;
    dbedtMATRICULA: TwwDBEdit;
    dbedtNOME: TwwDBEdit;
    lblSituacao: TLabel;
    lblDtAviso: TLabel;
    lblTipoAviso: TLabel;
    lblDtCancelamento: TLabel;
    lblMotivCancelamento: TLabel;
    lblObs: TLabel;
    lblDtDesligamento: TLabel;
    dtpDtAviso: TCMDateTimePicker;
    dtpDtDesligamento: TCMDateTimePicker;
    dtpDtCancelamento: TCMDateTimePicker;
    dbmmoObs: TDBMemo;
    dbcmbMotivCancelamento: TwwDBComboBox;
    dbcmbTipoAviso: TwwDBComboBox;
    dbrgrpSituacao: TDBRadioGroup;
    CdsAvisoPrev: TCMClientDataSet;
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dbrgrpSituacaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbgrdDetRowChanged(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
  private

    CtrlRegAvisoPrev : TCtrlRegAvisoPrev;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegAvisoPrev: TfrmRegAvisoPrev;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmRegAvisoPrev.CmeDetalheBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    Accept := False;

    if (dtpDtAviso.Date = 0) then
    begin
       MsgDlg('Preencha a Data do Aviso', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
       dtpDtAviso.SetFocus;
    end
    else if (dtpDtDesligamento.Date = 0) then
    begin
       MsgDlg('Preencha a Data do Desligamento', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
       dtpDtDesligamento.SetFocus;
    end
    else if (Trim(dbcmbTipoAviso.Text) = '') then
    begin
       MsgDlg('Preencha o Tipo de Aviso', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
       dbcmbTipoAviso.SetFocus;
       dbcmbTipoAviso.DropDown; //Everson Cunha - SIG38475-84907
    end
    else if (dtpDtCancelamento.Date = 0) and (dbrgrpSituacao.ItemIndex = 1) then
    begin
       MsgDlg('Preencha a Data do Cancelamento', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
       dtpDtCancelamento.SetFocus;
    end
    else if (Trim(dbcmbMotivCancelamento.Text) = '') and (dbrgrpSituacao.ItemIndex = 1) then
    begin
       MsgDlg('Preencha o Motivo do Cancelamento', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
       dbcmbMotivCancelamento.SetFocus;
       dbcmbMotivCancelamento.DropDown; //Everson Cunha - SIG38475-84907
    end
    else if (CdsAvisoPrev.FieldByName('DATACANCEL').AsDateTime < Cds.FieldByName('DATAAVISO').AsDateTime) and (dbrgrpSituacao.ItemIndex = 1) then
    begin
       MsgDlg('A Data do Cancelamento deve ser maior que a Data de Aviso Prévio', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
       dtpDtCancelamento.SetFocus;
    end
    else if (Cds.FieldByName('DATAAVISO').AsDateTime < Cds.FieldByName('DATAADMISSAO').AsDateTime) then
    begin
       MsgDlg('A Data do Aviso deve ser maior que a Data de Admissão', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
       dtpDtAviso.SetFocus;
    end
    else if (CdsAvisoPrev.FieldByName('DTPREVDESLIG').AsDateTime < Cds.FieldByName('DATAAVISO').AsDateTime) then
    begin
       MsgDlg('A Data Prevista do Desligamento deve ser maior que a Data de Aviso Prévio', 'Aviso', mtWarning, [mbOk, mbHelp], HelpContext);
       dtpDtDesligamento.SetFocus;
    end
    else
        Accept := True;
  end;

  inherited;
end;

procedure TfrmRegAvisoPrev.dbrgrpSituacaoChange(Sender: TObject);
begin
  inherited;
  //Everson Cunha - SIG38475-84907 - Início
  {lblDtCancelamento.Visible := (dbrgrpSituacao.ItemIndex = 1);
  dtpDtCancelamento.Visible := (dbrgrpSituacao.ItemIndex = 1);
  lblMotivCancelamento.Visible := (dbrgrpSituacao.ItemIndex = 1);
  dbcmbMotivCancelamento.Visible := (dbrgrpSituacao.ItemIndex = 1);}

  if dbrgrpSituacao.ItemIndex = 1 then
  begin
    dtpDtCancelamento.Enabled := True;
    dtpDtCancelamento.Color := clWhite;
    dbcmbMotivCancelamento.Enabled := True;
    dbcmbMotivCancelamento.Color := clWhite;
  end
  else
  begin
    dtpDtCancelamento.Enabled := False;
    dtpDtCancelamento.Color := clSilver;
    dtpDtCancelamento.Text := '';
    dbcmbMotivCancelamento.Enabled := False;
    dbcmbMotivCancelamento.Color := clLtGray;
    dbcmbMotivCancelamento.Text := '';
  end;
  //Everson Cunha - SIG38475-84907 - Fim
end;

procedure TfrmRegAvisoPrev.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegAvisoPrev := TCtrlRegAvisoPrev.Create;
  CtrlRegAvisoPrev.InitializeAs(Padroes);
  CtrlRegAvisoPrev.CdsAvisoPrev := CdsAvisoPrev;
  CtrlRegAvisoPrev.CdsFuncionario := Cds;

  Cds.Data := CtrlRegAvisoPrev.ListFuncionarios('-1');
  CdsAvisoPrev.Data := CtrlRegAvisoPrev.ListAvisoPrev('-1');
end;

procedure TfrmRegAvisoPrev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlRegAvisoPrev);
  inherited;

end;

procedure TfrmRegAvisoPrev.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Cds.Data := CtrlRegAvisoPrev.ListFuncionarios(MontaSelect.ValoresChave[0]);
    CdsAvisoPrev.Data := CtrlRegAvisoPrev.ListAvisoPrev(MontaSelect.ValoresChave[0]);

    lblSituacao.Visible := (CdsAvisoPrev.FieldByName('FLGSITUACAO').AsInteger = 2);
  end;
end;

procedure TfrmRegAvisoPrev.dbgrdDetRowChanged(Sender: TObject);
begin
  inherited;
  lblSituacao.Visible := (CdsAvisoPrev.FieldByName('FLGSITUACAO').AsInteger = 2);
end;

procedure TfrmRegAvisoPrev.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
     dtpDtAviso.SetFocus;
end;

procedure TfrmRegAvisoPrev.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then
     dtpDtAviso.SetFocus;
end;

procedure TfrmRegAvisoPrev.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Self);
end;

procedure TfrmRegAvisoPrev.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRegAvisoPrev.Gravar;

  if not(Accept) then
  begin
    MsgDlg(CtrlRegAvisoPrev.MessageInfo, 'Erro', mtError, [mbOK], 0);
  end;
end;

procedure TfrmRegAvisoPrev.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
     CdsAvisoPrev.FieldByName('TIPOAVISO2').AsString := dbcmbTipoAviso.Text;
     CdsAvisoPrev.FieldByName('MOTIVOCANCEL2').AsString := dbcmbMotivCancelamento.Text;

     if dbrgrpSituacao.ItemIndex = 0 then
     begin
        CdsAvisoPrev.FieldByName('SITUACAO').AsString := 'Aberto';
        CdsAvisoPrev.FieldByName('DATACANCEL').AsString := '';
        CdsAvisoPrev.FieldByName('MOTIVOCANCEL').AsInteger := 0;
        CdsAvisoPrev.FieldByName('MOTIVOCANCEL2').AsString := '';
     end
     else if dbrgrpSituacao.ItemIndex = 1 then
        CdsAvisoPrev.FieldByName('SITUACAO').AsString := 'Cancelado';

     CdsAvisoPrev.FieldByName('DATAAVISO').AsDateTime := dtpDtAviso.Date;
  end;

  inherited;

  dbgrdDetRowChanged(Self);

end;

end.
