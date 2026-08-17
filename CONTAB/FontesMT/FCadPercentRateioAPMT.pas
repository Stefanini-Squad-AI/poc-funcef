unit FCadPercentRateioAPMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlRateioApExtra,uCtrlContab,uCtrlListTerceiros, FCadastroMestreDetMT,
  StdCtrls, TREdit, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmCadPercentRateioAPMT = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbeNome: TwwDBEdit;
    Label7: TLabel;
    mskAtivProjRat: TMaskEdit;
    btnAtivProjRat: TBitBtn;
    edtAtivProjRat: TEdit;
    Label2: TLabel;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    edtAtivProj: TEdit;
    dbrPercent: TDBRealEdit;
    Label3: TLabel;
    MontaSelectAtivProj: TMontaSelect;
    cdsAtivProj: TCMClientDataSet;
    cdsAtivProjD: TCMClientDataSet;
    cdsDet: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure mskAtivProjRatExit(Sender: TObject);
    procedure btnAtivProjRatClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
  private
    CtrlListTerceiros  :TCtrlListTerceiros;
    CtrlContab         :TCtrlContab;
    CtrlRateioApExtra  :TCtrlRateioApExtra;
    iNumero :Double;
    iUnidNegocRat,iUnidNegoc :Integer;
  public
    { Public declarations }
  end;

var
  frmCadPercentRateioAPMT: TfrmCadPercentRateioAPMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uModulo;

{$R *.DFM}

procedure TfrmCadPercentRateioAPMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // *** instancia a classe geral contab ***
  CtrlRateioApExtra := TCtrlRateioApExtra.Create;
  CtrlRateioApExtra.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,false);

  CtrlRateioApExtra.cdsMestre := Cds;
  Cds.Data := CtrlRateioApExtra.ListRateioApExtra(-1,0,0);

  CtrlRateioApExtra.cdsDetalhe := CdsDet;

  // *** instancia a classe geral ListTerceiros ***
  CtrlListTerceiros := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,false);

  cdsAtivProjD.Data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,'',tapAmbos,toapNome);
  cdsAtivProj.Data  := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,'',tapAmbos,toapNome);

  MontaSelectAtivProj.Mascaras[0] := modulo.sMascaraUnidNegoc + ';0; ';
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmCadPercentRateioAPMT.mskAtivProjRatExit(Sender: TObject);
var sAtivProj : string;
begin
   inherited;

   if mskAtivProjRat.text <> '' then begin
      sAtivProj := mskAtivProjRat.text;
      cdsAtivProj.data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,sAtivProj,tapAmbos,toapNome);
      if not cdsAtivProj.isEmpty then begin
         if cdsAtivProj.FieldByName('UNETIPO').asString = 'S' then begin
            MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
            mskAtivProjRat.SetFocus;
            Exit;
         end else begin
            iUnidNegocRat := cdsAtivProj.FieldByName('UNIDNEGOC').asInteger;
            edtAtivProjRat.text  := cdsAtivProj.FieldByName('NOME').asString;
         end;
      end else begin
         MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
         mskAtivProjRat.SetFocus;
      end;
   end;

end;

procedure TfrmCadPercentRateioAPMT.btnAtivProjRatClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[0];
      cdsAtivProj.data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,sAtivProj,tapAmbos,toapNome);

      if cdsAtivProj.FieldByName('UNETIPO').asString = 'S' then begin
         MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
         btnAtivProjRat.SetFocus;
         Exit;
      end else begin
         mskAtivProjRat.text  := cdsAtivProj.FieldByName('UNECODIGO').asString;
         iUnidNegocRat        := cdsAtivProj.FieldByName('UNIDNEGOC').asInteger;
         edtAtivProjRat.text  := cdsAtivProj.FieldByName('NOME').asString;
      end;
   end;

end;

procedure TfrmCadPercentRateioAPMT.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
   inherited;

   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      cdsAtivProjD.data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,sAtivProj,tapAmbos,toapNome);
      if not cdsAtivProjD.isEmpty then begin
         if cdsAtivProjD.FieldByName('UNETIPO').asString = 'S' then begin
            MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
            mskAtivProj.SetFocus;
            Exit;
         end else begin
            iUnidNegoc        := cdsAtivProjD.FieldByName('UNIDNEGOC').asInteger;
            edtAtivProj.text  := cdsAtivProjD.FieldByName('NOME').asString;
         end;
      end else begin
         MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
         mskAtivProj.SetFocus;
      end;
   end;

end;

procedure TfrmCadPercentRateioAPMT.btnAtivProjClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;
   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[0];
      cdsAtivProjD.data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,sAtivProj,tapAmbos,toapNome);

      if cdsAtivProjD.FieldByName('UNETIPO').asString = 'S' then begin
         MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
         btnAtivProj.SetFocus;
         Exit;
      end else begin
         mskAtivProj.text  := cdsAtivProjD.FieldByName('UNECODIGO').asString;
         iUnidNegoc        := cdsAtivProjD.FieldByName('UNIDNEGOC').asInteger;
         edtAtivProj.text  := cdsAtivProjD.FieldByName('NOME').asString;
      end;
   end;

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
 // inherited;
  Cds.Data    := CtrlRateioApExtra.ListRateioApExtra(Cds.FieldByName('IDRATEIOAPEXTRA').asFloat,Cds.FieldByName('IDPESSOA').asFloat,Cds.FieldByName('UNIDNEGOC').asFloat);
  CdsDet.Data := CtrlRateioApExtra.ProcuraDetalhe(Cds.FieldByName('IDRATEIOAPEXTRA').asFloat);

  TStringField(CdsDet.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=   CtrlRateioApExtra.Apagar(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario);

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlRateioApExtra.Gravar(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario);
  Cds.EnableControls;

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlRateioApExtra.Gravar(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario);
  Cds.EnableControls;

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
var
  SomaPerc  :Double;

begin
  inherited;
  If Cds.State in [dsInsert, dsEdit] Then
  Begin

      //Faz a verificação do preenchimento dos campos

      if (dbeNome.Text = '') then begin
         MsgDlg('Nome do Rateio não informado.','Erro',mtError,[mbOk],0);
         dbeNome.SetFocus;
         Accept := False;
      end;

      if (mskAtivProjRat.text = '') then begin
         MsgDlg('Atividade/Projeto não informada.','Erro',mtError,[mbOk],0);
         mskAtivProjRat.SetFocus;
         Accept := False;
      end;

      cds.FieldByName('UNIDNEGOC').AsInteger := iUnidNegocRat;
      cds.FieldByName('IDPESSOA').AsInteger  := sistema.idEmpresa;

  End;
  cdsDet.First;
  SomaPerc := 0;
  while not cdsDet.Eof do
  begin
    SomaPerc := SomaPerc +  cdsDet.FieldByName('PERCRATEIO').AsFloat;
    cdsDet.Next;
  end;
  If SomaPerc <> 100 then
  Begin
     MsgDlg('O Somatório dos Percentuais está diferente de 100!','Aviso',mtWarning,[mbOk],0);
  End;


end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroAbortConfirma(
  sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlRateioApExtra.MessageInfo <> '' Then
     MsgDlg(CtrlRateioApExtra.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroCancel(Sender: TObject);
begin
  If Cds.State in [ dsinsert ] Then
  Begin
    Cds.Data    := CtrlRateioApExtra.ListRateioApExtra(-1,0,0);
    CdsDet.Data := CtrlRateioApExtra.ProcuraDetalhe(-1);
  End;
  mskAtivProjRat.text  := '';
  edtAtivProjRat.text  := '';
  mskAtivProj.text  := '';
  edtAtivProj.text  := '';
  inherited;


end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroDelete(Sender: TObject);
begin
   CdsDet.First;
   while Not CdsDet.Eof do
      CdsDet.Delete;

  inherited;
  mskAtivProjRat.text  := '';
  edtAtivProjRat.text  := '';

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if dbeNome.canFocus then dbeNome.SetFocus;

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  If MontaSelect.RetornouValor then
  Begin

     cds.Data := CtrlRateioApExtra.ListRateioApExtra(StrToInt(MontaSelect.ValoresChave[0]),Sistema.IdEmpresa,0);
     iNumero := cds.FieldByName('IDRATEIOAPEXTRA').AsFloat;
     cdsAtivProj.data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,cds.FieldByName('UNIDNEGOC').asFloat,'',tapAmbos,toapNome);

     If not cdsAtivProj.isEmpty then
     Begin
        mskAtivProjRat.text  := cdsAtivProj.FieldByName('UNECODIGO').asString;
        iUnidNegocRat        := cdsAtivProj.FieldByName('UNIDNEGOC').asInteger;
        edtAtivProjRat.text  := cdsAtivProj.FieldByName('NOME').asString;
     End;

     cdsDet.Data := CtrlRateioApExtra.ProcuraDetalhe(iNumero);
     TStringField(CdsDet.FieldByName('UNECODIGO')).EditMask  := modulo.sMascaraUnidNegoc + ';0; ';

  End;

end;

procedure TfrmCadPercentRateioAPMT.CmeCadastroInsert(Sender: TObject);
begin

   //Abre a query principal contendo zero registros
   Cds.Data := CtrlRateioApExtra.ListRateioApExtra(-1,0,0);

   inherited;
   CdsDet.Data := CtrlRateioApExtra.ProcuraDetalhe(-1);
   TStringField(CdsDet.FieldByName('UNECODIGO')).EditMask  := modulo.sMascaraUnidNegoc + ';0; ';

   //Limpa os Campos
   mskAtivProjRat.text  := '';
   edtAtivProjRat.text  := '';

   mskAtivProj.text  := '';
   edtAtivProj.text  := '';

   if dbeNome.canFocus then dbeNome.SetFocus;

end;

procedure TfrmCadPercentRateioAPMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlListTerceiros.free;
  CtrlContab.free;
  CtrlRateioApExtra.free;

end;

procedure TfrmCadPercentRateioAPMT.CmeDetalheAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(CtrlRateioApExtra.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadPercentRateioAPMT.CmeDetalheConfirma(Sender: TObject);
begin
  If CdsDet.State in [dsInsert, dsEdit] Then
  Begin
     if (mskAtivProj.text = '') then begin
         MsgDlg('Atividade/Projeto não informada.','Erro',mtError,[mbOk],0);
         mskAtivProj.SetFocus;
         exit;
      end;

      cdsDet.FieldByName('UNIDNEGOC').AsInteger := iUnidNegoc;

      //Atribui o campo na mão pois a query não dá refresh no join
      cdsDet.FieldByName('UNECODIGO').AsString := mskAtivProj.text;
      cdsDet.FieldByName('NOME').AsString      := edtAtivProj.text;

  End;

  inherited;

end;

procedure TfrmCadPercentRateioAPMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  cdsAtivProjD.data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,cdsDet.FieldByName('UNIDNEGOC').asFloat,'',tapAmbos,toapNome);

  if not cdsAtivProjD.isEmpty then begin
     mskAtivProj.text  := cdsAtivProjD.FieldByName('UNECODIGO').asString;
     iUnidNegoc        := cdsAtivProjD.FieldByName('UNIDNEGOC').asInteger;
     edtAtivProj.text  := cdsAtivProjD.FieldByName('NOME').asString;
  end;

   if mskAtivProj.canFocus then mskAtivProj.SetFocus;

end;

procedure TfrmCadPercentRateioAPMT.FormShow(Sender: TObject);
begin
  inherited;
   mskAtivProjRat.editMask := modulo.sMascaraUnidNegoc + ';0; ';
   mskAtivProj.editMask    := modulo.sMascaraUnidNegoc + ';0; ';

end;

procedure TfrmCadPercentRateioAPMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  mskAtivProj.text := '';
  edtAtivProj.text := '';
  cdsDet.FieldByName('IDPESSOA').AsInteger  := sistema.idEmpresa;

end;

end.
