unit FCadSaldoCotasPlanPatroMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, Mask, wwdbedit,uCMTypes,
  uCtrlListTerceiros,uCtrlPeriodo,uCtrlProcessaTotalPrev, DBTables, Wwquery;

type
  TfrmCadSaldoCotasPlanPatroMT = class(TFrmCadastroMT)
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
    cdsPlanoPrev: TClientDataSet;
    cdsPatro: TClientDataSet;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    lblPlanoPrev: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    lblPatro: TLabel;
    dblcPatro: TwwDBLookupCombo;
    dbreQtdeCotas: TDBRealEdit;
    Label1: TLabel;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Periodo           : TCtrlPeriodo;
    ProcessaTotalPrev : TCtrlProcessaTotalPrev;
    ListTerceiros     : TCtrlListTerceiros;
  public
    { Public declarations }
  end;

var
  frmCadSaldoCotasPlanPatroMT: TfrmCadSaldoCotasPlanPatroMT;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if trim(dblcPlanoPrev.Text)='' then begin
     MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
     dblcPlanoPrev.SetFocus;
     exit;
  end;
  if trim(dblcPatro.Text)='' then begin
     MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
     dblcPatro.SetFocus;
     exit;
  end;
  if trim(dblkExercicio.Text)='' then begin
     MsgDlg('Obrigatório preencher o Exercício','Erro',mtError,[mbOk],0);
     dblkExercicio.SetFocus;
     exit;
  end;
  cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  Accept := True;
end;

procedure TfrmCadSaldoCotasPlanPatroMT.FormCreate(Sender: TObject);
begin
  inherited;
  //
  MontaSelect.Filtro.Add('RATEIOPLANPATRO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  //
  Periodo        := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  ListTerceiros   := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  //
  ProcessaTotalPrev   := TCtrlProcessaTotalPrev.Create;
  ProcessaTotalPrev.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  ProcessaTotalPrev.CdsPrin := cds;
  //
  cds.Data := ProcessaTotalPrev.ProcurarSaldoCotas(-1);
  //
end;

procedure TfrmCadSaldoCotasPlanPatroMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  ProcessaTotalPrev.Free;
  ListTerceiros.Free;
end;

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dblcPlanoPrev.Enabled := True;
  dblcPatro.Enabled     := True;
  dblkExercicio.Enabled := True;
  dblkPeriodo.Enabled   := True;
  dblcPlanoPrev.SetFocus;
end;

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcPlanoPrev.Enabled := False;
  dblcPatro.Enabled     := False;
  dblkExercicio.Enabled := False;
  dblkPeriodo.Enabled   := False;
  dbreQtdeCotas.SetFocus;
end;

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := ProcessaTotalPrev.ProcurarSaldoCotas(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;

end;

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ProcessaTotalPrev.AplicaOperacaoSaldoCotas(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario);
end;

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ProcessaTotalPrev.AplicaOperacaoSaldoCotas(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario);
end;

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ProcessaTotalPrev.AplicaOperacaoSaldoCotas(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario);
end;

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if ProcessaTotalPrev.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ ProcessaTotalPrev.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadSaldoCotasPlanPatroMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  cds.Data := ProcessaTotalPrev.ProcurarSaldoCotas(cds.FieldByName('IDRATEIOPLANPATRO').AsFloat);
end;

procedure TfrmCadSaldoCotasPlanPatroMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;
  cdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  cdsExercicio.Data := Periodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.idEmpresa,tbpSoNaoBloq,0,0);
end;

end.
