unit FCadRatAdmPlanoPatroMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, Mask, wwdbedit, DBCtrls,
  DBCtrls2, DBTables, ComCtrls, FCadastroMestreDetMT, Grids,
  Wwdbigrd, Wwdbgrid, TabControlDetalhe, wwdbdatetimepicker,
  CMDateTimePicker,uCMTypes, CMProcuraSubTipo,
  CMProcuraMask, CMDBLookupCombo, Wwdotdot, Wwdbcomb,
  uCmSqlParams, uCtrlProcessaTotalPrev,uCtrlListTerceiros;
type
  TfrmCadRatAdmPlanoPatroMT = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    lblPerc: TLabel;
    dbePercRateio: TDBRealEdit;
    lblPlanoPrev: TLabel;
    lblDescricao: TLabel;
    dbeDescricao: TwwDBEdit;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    lblPatro: TLabel;
    lblPlanoDet: TLabel;
    lblPatroDet: TLabel;
    cdsPlanoPrevDet: TCMClientDataSet;
    cdsPatroDet: TCMClientDataSet;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcPatro: TwwDBLookupCombo;
    dblcPlanoPrevDet: TwwDBLookupCombo;
    dblcPatroDet: TwwDBLookupCombo;
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
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    { Private declarations }
    ProcessaTotalPrev : TCtrlProcessaTotalPrev;
    ListTerceiros     : TCtrlListTerceiros;
    procedure SelecionaDet(idRateio : Double);
  public
    { Public declarations }
  end;

var
  frmCadRatAdmPlanoPatroMT: TfrmCadRatAdmPlanoPatroMT;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept := False;
   if trim(dbeDescricao.text) = '' then begin
      MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOk],0);
      dbeDescricao.SetFocus;
      exit;
   end;
   if trim(dblcPlanoPrev.text) = '' then begin
      MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
      dblcPlanoPrev.SetFocus;
      exit;
   end;
   if trim(dblcPatro.text) = '' then begin
      MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
      dblcPatro.SetFocus;
      exit;
   end;
   Accept := True;
end;

procedure TfrmCadRatAdmPlanoPatroMT.FormCreate(Sender: TObject);
begin
  inherited;
  ListTerceiros   := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  //
  ProcessaTotalPrev   := TCtrlProcessaTotalPrev.Create;
  ProcessaTotalPrev.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  ProcessaTotalPrev.CdsPrin := cds;
  ProcessaTotalPrev.CdsDet  := cdsDet;
  cds.Data := ProcessaTotalPrev.ProcurarRatAdm(-1);
  SelecionaDet(-1);
  //
end;

procedure TfrmCadRatAdmPlanoPatroMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ProcessaTotalPrev.Free;
  ListTerceiros.Free;
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  SelecionaDet(-1);
  dbeDescricao.SetFocus;
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := ProcessaTotalPrev.ProcurarRatAdm(StrTointDef(MontaSelect.ValoresChave[0],0));
     SelecionaDet(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ProcessaTotalPrev.AplicaOperacaoRatAdm(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario,opApagar);
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ProcessaTotalPrev.AplicaOperacaoRatAdm(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario,opAlterar);
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ProcessaTotalPrev.AplicaOperacaoRatAdm(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario,opInserir);
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if ProcessaTotalPrev.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ ProcessaTotalPrev.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadRatAdmPlanoPatroMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsPlanoPrev.Data    := ListTerceiros.ListPlanoPrev;
  cdsPatro.Data        := ListTerceiros.ListPlanoPatro;
  cdsPlanoPrevDet.Data := ListTerceiros.ListPlanoPrev;
  cdsPatroDet.Data     := ListTerceiros.ListPlanoPatro;
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  cds.Data := ProcessaTotalPrev.ProcurarRatAdm(cds.FieldByName('IDRATADMPLANPATRO').AsFloat);
  SelecionaDet(cds.FieldByName('IDRATADMPLANPATRO').AsFloat);
end;

procedure TfrmCadRatAdmPlanoPatroMT.SelecionaDet(idRateio : Double);
begin
   cdsDet.Data := ProcessaTotalPrev.ListaRatAdmDet(idRateio);
   TFloatField(cdsDet.FieldByName('PERCRATEIO')).DisplayFormat := '#,##0.00';
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage.PageIndex = 0 then begin
     dblcPlanoPrevDet.SetFocus;
  end;
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage.PageIndex = 0 then begin
     dblcPlanoPrevDet.SetFocus;
  end;
end;

procedure TfrmCadRatAdmPlanoPatroMT.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept := False;
   if (cds.State in ([dsInsert,dsEdit])) then begin
      if (pgctrlDetalhe.ActivePage.PageIndex = 0) and ((sbtnInsDet.Down) or (sbtnAltDet.Down)) then begin
         if trim(dblcPlanoPrevDet.text) = '' then begin
            MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
            dblcPlanoPrevDet.SetFocus;
            exit;
         end;
         if trim(dblcPatroDet.text) = '' then begin
            MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
            dblcPatroDet.SetFocus;
            exit;
         end;
         cdsDet.FieldByName('NOMEPLANO').AsString := dblcPlanoPrevDet.Text;
         cdsDet.FieldByName('NOMEPATRO').AsString := dblcPatroDet.Text;
      end;
   end;
   Accept := True;
end;

procedure TfrmCadRatAdmPlanoPatroMT.bbtnOkDetClick(Sender: TObject);
begin
   if (cds.State in ([dsInsert,dsEdit])) then begin
      if (pgctrlDetalhe.ActivePage.PageIndex = 0) and ((sbtnInsDet.Down) or (sbtnAltDet.Down)) then begin
         if trim(dblcPlanoPrevDet.text) = '' then begin
            MsgDlg('Obrigatório preencher o Plano Previdenciário','Erro',mtError,[mbOk],0);
            dblcPlanoPrevDet.SetFocus;
            exit;
         end;
         if trim(dblcPatroDet.text) = '' then begin
            MsgDlg('Obrigatório preencher a Patrocinadora','Erro',mtError,[mbOk],0);
            dblcPatroDet.SetFocus;
            exit;
         end;
         cdsDet.FieldByName('NOMEPLANO').AsString := dblcPlanoPrevDet.Text;
         cdsDet.FieldByName('NOMEPATRO').AsString := dblcPatroDet.Text;
      end;
   end;
   inherited;
end;

end.


