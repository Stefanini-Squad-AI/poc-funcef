unit FCadSaldoAntAtivProjMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, TREdit, Mask, wwdblook, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlListTerceiros,uCtrlPeriodo,uCtrlRateioAtivProj,uCtrlContab,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmCadSaldoAntAtivProjMT = class(TFrmCadastroMT)
    Label3: TLabel;
    dblkMoeda: TwwDBLookupCombo;
    lblMoedaReal: TLabel;
    edtNomeAtivProj: TEdit;
    mskAtivProj: TMaskEdit;
    Label7: TLabel;
    dbrValor: TDBRealEdit;
    Label1: TLabel;
    cdsMoeda: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    MontaSelectAtivProj: TMontaSelect;
    cdsAtivProj: TCMClientDataSet;
    cdsVerificaValores: TCMClientDataSet;
    btnAtivProj: TBitBtn;
    dblkExercicio: TwwDBLookupCombo;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormShow(Sender: TObject);
  private
   CtrlListTerceiros :TCtrlListTerceiros;
   CtrlRateioAtivProj :TCtrlRateioAtivProj;
   CtrlPeriodo :TCtrlPeriodo;
   CtrlContab  :TCtrlContab;
   iUnidNegoc :Integer;
   iIndice : integer;

  public
    { Public declarations }
  end;

var
  frmCadSaldoAntAtivProjMT: TfrmCadSaldoAntAtivProjMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo;

{$R *.DFM}

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
     iIndice := StrToInt(MontaSelect.ValoresChave[0]);
     Cds.Data := CtrlRateioAtivProj.ListRateioAtivProj(iIndice);

     cdsAtivProj.Data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,Cds.FieldByName('UNIDNEGOC').asInteger,'',tapAmbos,toapCodigo);

     if not cdsAtivProj.IsEmpty then
     begin
       mskAtivProj.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
       iUnidNegoc           := cdsAtivProj.FieldByName('UNIDNEGOC').asInteger;
       edtNomeAtivProj.text := cdsAtivProj.FieldByName('NOME').asString;
     end;
   end;


end;

procedure TfrmCadSaldoAntAtivProjMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal ***
  CtrlRateioAtivProj := TCtrlRateioAtivProj.Create;
  CtrlRateioAtivProj.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlRateioAtivProj.CdsRateioAtivProj := Cds;
  Cds.Data := CtrlRateioAtivProj.ListRateioAtivProj(-1);

  // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe periodo Contab ***
  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,false);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,True);

  // *** Instancia a classe Historico Contab ***
  CtrlListTerceiros := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

   cdsAtivProj.Data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,'',tapAmbos,toapCodigo);
   cdsMoeda.Data    := CtrlListTerceiros.ListCdsMoedaSaldo;

   MontaSelect.Filtro.Add('RATEIOATIVPROJ.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

   MontaSelectAtivProj.Mascaras[0] := modulo.sMascaraUnidNegoc + ';0; ';
   MontaSelect.Mascaras[1]         := modulo.sMascaraUnidNegoc + ';0; ';

   mskAtivProj.EditMask := modulo.sMascaraUnidNegoc + ';0; ';


end;

procedure TfrmCadSaldoAntAtivProjMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.free;
  CtrlRateioAtivProj.free;
  CtrlListTerceiros.free;
  CtrlContab.free;
end;

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
  Cds.Data := CtrlRateioAtivProj.ListRateioAtivProj(Cds.FieldByName('IDRATEIOATIVPROJ').AsFloat)

end;

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlRateioAtivProj.Gravar(Sistema.idEmpresa,Sistema.idModulo,Sistema.IdUsuario, cdsMoeda.FieldByName('MOECODIGO').asInteger);


end;

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlRateioAtivProj.Gravar(Sistema.idEmpresa,Sistema.idModulo,Sistema.IdUsuario,cdsMoeda.FieldByName('MOECODIGO').asInteger);

end;

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlRateioAtivProj.Gravar(Sistema.idEmpresa,Sistema.idModulo,Sistema.IdUsuario, cdsMoeda.FieldByName('MOECODIGO').asInteger);

end;

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [DsInsert] Then
  Begin
     CdsVerificaValores.Data := CtrlRateioAtivProj.ExistemValoresRateio(Sistema.idEmpresa,
                                        cdsExercicio.FieldByName('PEREXERCICIO').asInteger,
                                        iUnidNegoc);

     if not CdsVerificaValores.isEmpty then
     begin
        MsgDlg('Já existem valores de rateio para o Exercício e Atividade/Projeto escolhidos.', 'Aviso',mtWarning,[mbOk],0);
        Accept := False;
     end;
  End;

  If Cds.State in [dsEdit, DsInsert] Then
  Begin
      if (dblkExercicio.Text = '') then begin
         MsgDlg('Exercício não selecionado.','Aviso',mtWarning,[mbOk],0);
         if dblkExercicio.CanFocus then
            dblkExercicio.SetFocus;
         Accept := False;
      end;

      if (dblkMoeda.Text = '') then begin
         MsgDlg('Moeda usada para o cálculo das Cotas não selecionada.','Aviso',mtWarning,[mbOk],0);
         if dblkMoeda.CanFocus then
            dblkMoeda.SetFocus;
         Accept := False;
      end;

      if (mskAtivProj.Text = '') then begin
         MsgDlg('Atividade/Projeto não selecionada.','Aviso',mtWarning,[mbOk],0);
         if mskAtivProj.CanFocus then
            mskAtivProj.SetFocus;
         Accept := False;
      end;

      //Completa o idpessoa
      cds.FieldByName('IDPESSOA').AsFloat    := Sistema.idEmpresa;
      cds.FieldByName('UNIDNEGOC').AsInteger := iUnidNegoc;
  End;

end;

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if dblkExercicio.CanFocus then
      dblkExercicio.SetFocus;

end;

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroInsert(Sender: TObject);
begin

  //Cds.Data := CtrlRateioAtivProj.ListRateioAtivProj(-1);

  inherited;
  cds.FieldByName('IDPESSOA').asInteger := Sistema.idEmpresa;
  mskAtivProj.text     := '';
  iUnidNegoc           := 0;
  edtNomeAtivProj.text := '';
  dblkExercicio.Text   := '';
  dblkMoeda.Text       := '';

end;

procedure TfrmCadSaldoAntAtivProjMT.mskAtivProjExit(Sender: TObject);
begin
   inherited;

  If mskAtivProj.text <> '' Then
  Begin

    CdsAtivProj.Data := CtrlListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,Trim(mskAtivProj.Text),tapAmbos,toapCodigo);

    If Not CdsAtivProj.IsEmpty Then
    Begin
       If CdsAtivProj.FieldByName('UNETIPO').asString = 'S' Then
       Begin
         MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
         mskAtivProj.SetFocus;
         Exit;
       End Else
       Begin
         mskAtivProj.text     := CdsAtivProj.FieldByName('UNECODIGO').asString;
         iUnidNegoc           := CdsAtivProj.FieldByName('UNIDNEGOC').asInteger;
         edtNomeAtivProj.Text := CdsAtivProj.FieldByName('NOME').asString;
       End
    End Else
    Begin
       MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
       mskAtivProj.SetFocus;
    End;

  End;

end;

procedure TfrmCadSaldoAntAtivProjMT.btnAtivProjClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[0];
      cdsAtivProj.Data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,StrToInt(sAtivProj),'',tapAmbos,toapCodigo);

      if cdsAtivProj.FieldByName('UNETIPO').asString = 'S' then begin
         MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
         btnAtivProj.SetFocus;
         Exit;
      end else begin
         mskAtivProj.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
         iUnidNegoc           := cdsAtivProj.FieldByName('UNIDNEGOC').asInteger;
         edtNomeAtivProj.text := cdsAtivProj.FieldByName('NOME').asString;
      end;
   end else begin
      mskAtivProj.text     := '';
      iUnidNegoc           := 0;
      edtNomeAtivProj.text := '';
   end;

end;

procedure TfrmCadSaldoAntAtivProjMT.CmeCadastroAbortConfirma(
  sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlRateioAtivProj.MessageInfo  <>  '' Then
     MsgDlg(CtrlRateioAtivProj.MessageInfo, 'Erro', mtError, [mbOk], 0);

end;

procedure TfrmCadSaldoAntAtivProjMT.FormShow(Sender: TObject);
begin
  inherited;
   dblkMoeda.LookupValue := IntToStr(CtrlContab.MoedaCotas);

end;

end.
