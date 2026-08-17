unit FCadGrupoRendimentoREINF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCtrlIRRFPF, DBaseDados,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, uMensErro,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit, uSistema,
  wwdbdatetimepicker,  CMDateTimePicker,
  {$IFDEF VERSAO0505} uComum, {$ELSE} uCMTypes {$ENDIF};

type
  TfrmCadGrupoRendimentoREINF = class(TFrmCadastroMT)
    lblFaixaIni: TLabel;
    dbrFaixaIni: TDBRealEdit;
    lblAliq: TLabel;
    dbrAliqIRRF: TDBRealEdit;
    lblParcDeduz: TLabel;
    dbrParcDeduz: TDBRealEdit;
    lblDtIniVid: TLabel;
    dbedDtIniVig: TCMDateTimePicker;
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    IRRF : TCtrlIRRFPF;
  public
    { Public declarations }
  end;

var
  frmCadGrupoRendimentoREINF: TfrmCadGrupoRendimentoREINF;

implementation


{$R *.DFM}

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbrFaixaIni.SetFocus;
end;

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbrFaixaIni.SetFocus;
end;

procedure TfrmCadGrupoRendimentoREINF.bbtnConfirmarClick(Sender: TObject);
begin
  if dbrFaixaIni.Value = 0 then
  Begin
    MsgDlg('Obrigatório Preencher a Faixa Inicial','Erro',mtError,[mbOK],0);
    dbrFaixaIni.SetFocus;
    exit;
  end;


  If Trim(dbedDtIniVig.Text) = '' Then
  Begin
    MsgDlg('Obrigatório Preencher a Data Início de Vigência', 'Erro', mtError, [mbOk], 0);
    dbedDtIniVig.SetFocus;
    Exit;
  End;

  inherited;

end;

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
   Begin
     cds.data :=  IRRF.ProcurarIRRFPF(StrToInt(MontaSelect.ValoresChave[1]));
     IRRF.CdsIRRFPF := Cds;
   end;
end;

procedure TfrmCadGrupoRendimentoREINF.FormCreate(Sender: TObject);
begin
  inherited;
  //Inicializa o objeto
  IRRF := TCtrlIRRFPF.Create;
  IRRF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  Cds.data := IRRF.ProcurarIRRFPF(-1);
  IRRF.CdsIRRFPF := Cds;
end;

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  IRRF.GravarIRRFPF;
end;

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  IRRF.GravarIRRFPF;
end;

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  IRRF.GravarIRRFPF;
end;

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  cds.data :=  IRRF.ProcurarIRRFPF(-1);
end;

procedure TfrmCadGrupoRendimentoREINF.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If OrigemAbortConfirma in [ OaApplyInsert, OaApplyDelete, OaApplyEdit ] Then
     MsgDlg(IRRF.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;

procedure TfrmCadGrupoRendimentoREINF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IRRF.Free;
end;

end.
