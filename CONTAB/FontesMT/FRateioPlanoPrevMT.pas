unit FRateioPlanoPrevMT;

//------------------------------------------------------------------------------
// Rotinas   : Diversas
// Data      : 14/03/2005
// Autor     : Alex Pereira
// Pendência : 18814
// Descrição : Implementação do filtro por plano e patro (seleção de planilhas)
//             na execução do processo
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, Db, DBClient, uCMClientDataSet, ExtCtrls, StdCtrls,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  uCtrlPeriodo, uCtrlContab,uCtrlListTerceiros,
  uCMTypes, uCtrlPrePlanilhaRPP, uCmSqlParams;

type
  TfrmRateioPlanoPrevMT = class(TfrmSairAjuda)
    edDataGera: TCMDateTimePicker;
    Label5: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    Label2: TLabel;
    lblRateio: TLabel;
    lblConta: TLabel;
    pgbStatus: TProgressBar;
    mmLog: TRichEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    cdsTipoOper: TCMClientDataSet;
    Anim: TAnimate;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cdsPlanilha: TCMClientDataSet;
    dblkPlanilha: TwwDBLookupCombo;
    Label6: TLabel;
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlContab : TCtrlContab;
    CtrlPreplanilhaRPP :TCtrlPrePlanilhaRPP;
    CtrlPeriodo        :TCtrlPeriodo;
    CtrlListTerceiros  :TCtrlListTerceiros;
    procedure ProcMensPP(msg: String);
  public
    { Public declarations }
  end;

var
  frmRateioPlanoPrevMT: TfrmRateioPlanoPrevMT;

implementation

uses  UMensErro, uDatabase, DBaseDados,
      uSistema, uModulo, uFuncaoGeral, uData;

{$R *.DFM}

procedure TfrmRateioPlanoPrevMT.dblkExercicioCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.LookupValue),0);

end;

procedure TfrmRateioPlanoPrevMT.ProcMensPP(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
    begin
       lblRateio.Caption := CtrlPreplanilhaRPP.NomeRateio;
       lblConta.Caption  := CtrlPreplanilhaRPP.NomeCampo;
       mmLog.Lines.Add(Msg);
    end;
    pgbStatus.Position := CtrlPreplanilhaRPP.Progresso;
    pgbStatus.Max      := CtrlPreplanilhaRPP.MaxProgresso;

    Application.ProcessMessages;
  End;

end;

procedure TfrmRateioPlanoPrevMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe processa contab ***
  CtrlPreplanilhaRPP := TCtrlPrePlanilhaRPP.Create;
  CtrlPreplanilhaRPP.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensPP);
  cdsPlanilha.Data := CtrlPreplanilhaRPP.ListPrePlanilha(0, Sistema.IdEmpresa, 'T');

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);

  //Criação da Classe de terceiros
  CtrlListTerceiros        := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsTipoOPer.Data  := CtrlListTerceiros.ListTipoOper(False);

end;

procedure TfrmRateioPlanoPrevMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlPreplanilhaRPP.free;
  CtrlPeriodo.free;
  CtrlListTerceiros.free;

end;

procedure TfrmRateioPlanoPrevMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if CtrlContab.TipoFechamento = 'D' then begin
      if trim(edDataGera.Text) = '' then begin
         MsgDlg('Obrigatório preencher a data de geração','Aviso',mtWarning,[mbOk],0);
         edDataGera.SetFocus;
         Exit;
      end;
   end else begin
      if dblkExercicio.text = '' then begin
         MsgDlg('Exercício não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkExercicio.SetFocus;
         Exit;
      end;
      if dblkPeriodo.text = '' then begin
         MsgDlg('Período não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkPeriodo.SetFocus;
         Exit;
      end;
      edDataGera.Text := cdsPeriodo.FieldByName('PERDATFIM').AsString;
      edDataGera.Date := cdsPeriodo.FieldByName('PERDATFIM').AsDateTime;
   end;

   If Not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa,edDataGera.Text) Then
   Begin
      If CtrlContab.TipoFechamento = 'D' then
         edDataGera.SetFocus
      Else
         dblkPeriodo.SetFocus;
      Exit;
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
   End;

   mmLog.Lines.Add(' ');
   mmLog.Lines.Add('****** Rateio por Plano e Patrocinadora ******');
   mmLog.Lines.Add(' ');

   If CtrlPreplanilhaRPP.GeraRateioPorPPrevePatro(Sistema.IdEmpresa,Sistema.idUsuario,
                                  CtrlContab.PlanoParam,StrToInt(dblkExercicio.LookupValue),
                                  StrToInt(dblkPeriodo.LookupValue),dblkTipoOper.LookupValue,
                                  cdsPeriodo.FieldByName('PERDATFIM').asString,CtrlContab.TipoFechamento,
                                  Sistema.UsaPlanoPatro,
                                  StrToInt64Def(dblkPlanilha.LookupValue, 0)) then
   begin
      MsgDlg(CtrlPreplanilhaRPP.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
     MsgDlg(CtrlPreplanilhaRPP.MessageInfo,'Erro',mtError,[mbOk],0);
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlPreplanilhaRPP.sMensAPS_Log);
   End;

   If Anim.Active Then Anim.Active := False;


end;

end.
