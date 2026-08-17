unit FCadContasporPeriodoMT;
(*==============================================================================
Analista : Alex Pereira
Data     : 09/02/04
Pendência: Solicitação Darcy
Solução  : Trocar label de: " Passagem de Analítica para Sintética "
                      para: " Desmembramento - Criação da conta analítica "
==============================================================================*)



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit, Mask,uCtrlPlanoContaPer,
  wwdbedit, IvDictio, IvMulti, IvEMulti, wwdblook, DBCtrls, CMProcuraMask,
  CmEventosCadastro, ImgList, uCtrlPeriodo, uCtrlContab, uCtrlContaContabil,
  FCadastroMT, DBClient, uCMClientDataSet,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


type
  TfrmCadContasporPeriodoMT = class(TFrmCadastroMT)
    gbAS: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edComplContaAnalitica: TEdit;
    edNomeContaAnalitica: TEdit;
    dbedNomeConta: TwwDBEdit;
    lblNome: TLabel;
    dbrgTipo: TDBRadioGroup;
    dblkPeriodo: TwwDBLookupCombo;
    lblPeriodo: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    lblExercicio: TLabel;
    cmConta: TCMProcuraMaskContabil;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    cdsPlanoConta: TCMClientDataSet;
    dbckInativa: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure cmContaExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
  private
    CtrlPlanoContaPer :TCtrlPlanoContaPer;
    CtrlPeriodo       :TCtrlPeriodo;
    CtrlContab        :TCtrlContab;
    CtrlContaContabil :TCtrlContaContabil;
  public
    { Public declarations }
  end;

var
  frmCadContasporPeriodoMT: TfrmCadContasporPeriodoMT;

implementation

Uses uSistema, uMensErro, dBaseDados,uModulo;

{$R *.DFM}

procedure TfrmCadContasporPeriodoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPlanoContaPer.free;
  CtrlContab.free;
  CtrlPeriodo.free;
  CtrlContaContabil.free;
end;

procedure TfrmCadContasporPeriodoMT.FormCreate(Sender: TObject);
begin
  inherited;
   // *** Instancia a classe geral Ctrlcontab ****
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // *** cria a classe principal ***
  CtrlPlanoContaPer := TCtrlPlanoContaPer.Create;
  CtrlPlanoContaPer.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlPlanoContaPer.CdsPlanoContaPer := Cds;

  Cds.Data := CtrlPlanoContaPer.ListPlanoContaPer(-1);

  CtrlContaContabil        := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.Idempresa,True);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.Idempresa ,tbpTodos,0,0);

  cmConta.Plano       := CtrlContab.PlanoParam;
  cmConta.Mascara     := CtrlContab.MascaraContaParam;

  MontaSelect.Filtro.Add('PLANOCONTAPER.IDPESSOA = '+IntToStr(Sistema.idEmpresa));

end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
//  inherited;
   Cds.Data := CtrlPlanoContaPer.ListPlanoContaPer(Cds.FieldByName('IDPLANOCONTAPER').asInteger);

end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroAbortConfirma(
  sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
//  If CtrlPlanoContaPer.MessageInfo  <>  '' Then
//     MsgDlg(CtrlPlanoContaPer.MessageInfo, 'Erro', mtError, [mbOk], 0);

end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     //Se houve busca, abre a query principal apenas com o registro buscado
     Cds.Data := CtrlPlanoContaPer.ListPlanoContaPer(StrToFloat(MontaSelect.ValoresChave[0]));

     cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,cds.FieldByName('PEREXERCICIO').AsInteger,0);

     edNomeContaAnalitica.Text  := '';
     edComplContaAnalitica.Text := '';

  End;

end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsInsert, dsEdit]  Then
  Begin

     if trim(dblkExercicio.Text) = '' then begin
        MsgDlg('Obrigatório Informar o Exercício','Erro',mtError,[mbOk],0);
        dblkExercicio.SetFocus;
        Accept := False;
     end;
     if trim(dblkPeriodo.Text) = '' then begin
        MsgDlg('Obrigatório Informar o Período','Erro',mtError,[mbOk],0);
        dblkPeriodo.SetFocus;
        Accept := False;
     end;
     if cmConta.Valida <> VcOK then begin
        cmConta.SetFocus;
        Accept := False;
     end;
     if trim(dbedNomeConta.Text) = '' then begin
        MsgDlg('Obrigatório Informar o Nome da Conta','Erro',mtError,[mbOk],0);
        dbedNomeConta.SetFocus;
        Accept := False;
     end;

  End;

end;

procedure TfrmCadContasporPeriodoMT.cmContaExit(Sender: TObject);
begin
  inherited;
  if cds.State = dsInsert then
  begin
     cdsPlanoConta.Data := CtrlContaContabil.ListContas(CtrlContab.PlanoParam,tcAmbasC,True,cmConta.Conta.Numero);

     cds.FieldByName('PLATIPO').AsString := cdsPlanoConta.FieldByName('PLATIPO').AsString;
     cds.FieldByName('PLANOME').AsString := cdsPlanoConta.FieldByName('PLANOME').AsString;
  end;


end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldbyName('IDPESSOA').AsInteger  := sistema.idEmpresa;
  Cds.FieldbyName('PLANO').AsInteger     := CtrlContab.PlanoParam;
  cds.FieldByName('PLAINATIVA').AsString := 'A';
  edNomeContaAnalitica.Text  := '';
  edComplContaAnalitica.Text := '';
  dblkExercicio.Enabled      := True;
  dblkPeriodo.Enabled        := True;
  cmConta.Enabled  := True;
  dblkExercicio.SetFocus;

end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblkExercicio.Enabled     := False;
  dblkPeriodo.Enabled       := False;
  cmConta.Enabled           := False;
  dbrgTipo.SetFocus;

end;

procedure TfrmCadContasporPeriodoMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.Idempresa ,tbpTodos,StrToIntDef(dblkExercicio.LookupValue,0),0);

end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if CtrlPlanoContaPer.Gravar(Sistema.idEmpresa,Sistema.idModulo,Sistema.idUsuario,
               CtrlContab.PlanoParam,StrToIntDef(dblkPeriodo.LooKupValue,0),edNomeContaAnalitica.Text,
               edComplContaAnalitica.Text,cmConta.Conta.Numero,CtrlContab.MascaraContaParam,cdsPeriodo.FieldByName('PERDATINI').asString,
               Sistema.UsaPlanoPatro) then
    MsgDlg(CtrlPlanoContaPer.MessageInfo, 'Aviso', mtWarning, [mbOk], 0)
  Else
    MsgDlg(CtrlPlanoContaPer.MessageInfo, 'Erro', mtError, [mbOk], 0);

end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if CtrlPlanoContaPer.Gravar(Sistema.idEmpresa,Sistema.idModulo,Sistema.idUsuario,
               CtrlContab.PlanoParam,StrToIntDef(dblkPeriodo.LooKupValue,0),edNomeContaAnalitica.Text,
               edComplContaAnalitica.Text,cmConta.Conta.Numero,CtrlContab.MascaraContaParam,cdsPeriodo.FieldByName('PERDATINI').asString,
               Sistema.UsaPlanoPatro) then
     MsgDlg(CtrlPlanoContaPer.MessageInfo, 'Aviso', mtWarning, [mbOk], 0)
  Else
    MsgDlg(CtrlPlanoContaPer.MessageInfo, 'Erro', mtError, [mbOk], 0);

end;

procedure TfrmCadContasporPeriodoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPlanoContaPer.Apagar;
end;

end.
