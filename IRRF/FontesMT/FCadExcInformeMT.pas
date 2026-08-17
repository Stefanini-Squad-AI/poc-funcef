unit FCadExcInformeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, Mask, wwdbedit, StdCtrls, wwdblook, CMDBLookupCombo,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, ExtCtrls, uCtrlRubricaxInforme,
  {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF};

type
  TfrmCadExcInformeMT = class(TFrmCadastroMT)
    dblcRubPrinc: TCMDBLookupCombo;
    lblRubPrin: TLabel;
    Label1: TLabel;
    dblcRubrica: TCMDBLookupCombo;
    Label2: TLabel;
    dblcLinhaInforme: TwwDBLookupCombo;
    lblPrioridade: TLabel;
    dbedPrioridade: TwwDBEdit;
    cdsRubrica: TCMClientDataSet;
    cdsLinhaInforme: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    RubricaxInforme : TCtrlRubricaxInforme;
  public
    { Public declarations }
  end;

var
  frmCadExcInformeMT: TfrmCadExcInformeMT;

implementation


{$R *.DFM}
Uses uMensErro, DBaseDados, uSistema;

procedure TfrmCadExcInformeMT.bbtnConfirmarClick(Sender: TObject);
begin
    if trim(dblcRubPrinc.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Rubrica Principal','Aviso',mtWarning,[mbOK],0);
     dblcRubPrinc.SetFocus;
     exit;
  end;
  if trim(dblcRubrica.Text) = '' then begin
     MsgDlg('Obrigatório escolher uma Rubrica','Aviso',mtWarning,[mbOK],0);
     dblcRubrica.SetFocus;
     exit;
  end;
  if trim(dblcLinhaInforme.Text) = '' then begin
     MsgDlg('Obrigatório escolher uma linha para o Informe','Aviso',mtWarning,[mbOK],0);
     dblcLinhaInforme.SetFocus;
     exit;
  end;
  if trim(dbedPrioridade.Text) = '' then begin
     MsgDlg('Obrigatório escolher uma prioridade','Aviso',mtWarning,[mbOK],0);
     dbedPrioridade.SetFocus;
     exit;
  end;
  inherited;
end;

procedure TfrmCadExcInformeMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcRubPrinc.Enabled :=False;
  dblcRubrica.Enabled  :=False;
  dblcLinhaInforme.SetFocus;
end;

procedure TfrmCadExcInformeMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
     Begin
       cds.data := RubricaxInforme.ProcurarRubricaxInforme(StrToIntDef(MontaSelect.ValoresChave[0], 0), StrToIntDef(MontaSelect.ValoresChave[1], 0));
       RubricaxInforme.CdsRubricaxInforme := cds;
     end;
end;

procedure TfrmCadExcInformeMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dblcRubPrinc.Enabled :=True;
  dblcRubrica.Enabled  :=True;
  dblcRubPrinc.SetFocus;
end;

procedure TfrmCadExcInformeMT.FormCreate(Sender: TObject);
begin
  inherited;
  RubricaxInforme := TCtrlRubricaxInforme.Create;
  RubricaxInforme.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  cds.data := RubricaxInforme.ProcurarRubricaxInforme(-1, -1);
  RubricaxInforme.CdsRubricaxInforme := cds;

  cdsRubrica.data      := RubricaxInforme.ListRubricaPrincipal;
  cdsLinhaInforme.data := RubricaxInforme.ListLinhasParaInforme;

end;

procedure TfrmCadExcInformeMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadExcInformeMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  RubricaxInforme.GravarRubricaxInforme;
end;

procedure TfrmCadExcInformeMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  RubricaxInforme.GravarRubricaxInforme;
end;

procedure TfrmCadExcInformeMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  RubricaxInforme.GravarRubricaxInforme;
end;

procedure TfrmCadExcInformeMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If OrigemAbortConfirma in [ OaApplyInsert, OaApplyDelete, OaApplyEdit ] Then
     MsgDlg(RubricaxInforme.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;

procedure TfrmCadExcInformeMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  RubricaxInforme.free;
end;

end.
