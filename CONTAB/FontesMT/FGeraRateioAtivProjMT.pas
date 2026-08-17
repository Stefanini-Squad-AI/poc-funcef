unit FGeraRateioAtivProjMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlPeriodo,uCtrlProcessaContab,uCtrlContab, FOkCancelar, ComCtrls, Db,
  DBClient, uCMClientDataSet, StdCtrls, ExtCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmGeraRateioAtivProjMT = class(TfrmOkCancelar)
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    pgbStatus: TProgressBar;
    rdgSinal: TRadioGroup;
    memLog: TRichEdit;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    Anim: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
  private
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    procedure ProcMensRAT(msg: String);
  public
    { Public declarations }
  end;

var
  frmGeraRateioAtivProjMT: TfrmGeraRateioAtivProjMT;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uString;

{$R *.DFM}

procedure TfrmGeraRateioAtivProjMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe processa contab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensRat);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);

end;

procedure TfrmGeraRateioAtivProjMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
   End;

   //=== Verifica se existe rateio para reescreve-los ===
   If CtrlProcessaContab.ExisteRateio(Sistema.IdEmpresa,cdsExercicio.FieldByName('PEREXERCICIO').asInteger,
                                      cdsPeriodo.FieldByName('PERNUMERO').asInteger) Then
   Begin
     if MsgDlg('Já existem valores de rateio para o Exercício e Período escolhidos. Deseja sobrescrevê-los?', 'Aviso',mtConfirmation,[mbYes, mbNo],0) = mrNo then
     begin
       Exit;
     end else
     begin
        If Not CtrlProcessaContab.RemoveRateioPorPeriodo(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,cdsExercicio.FieldByName('PEREXERCICIO').asInteger,
                                      cdsPeriodo.FieldByName('PERNUMERO').asInteger) Then
        begin
            MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
        end;
     end;
   End;

   memLog.Lines.Add('*********** Dados do Rateio ***********');
   memLog.Lines.Add(' ');


   //=== processa rateio por periodo ===
   If CtrlProcessaContab.GeraRateioPorPeriodo(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,CtrlContab.MoedaCotas,
                              rdgSinal.itemIndex, cdsExercicio.FieldByName('PEREXERCICIO').asInteger,
                              cdsPeriodo.FieldByName('PERNUMERO').asInteger,
                              cdsPeriodo.FieldByName('PERDATFIM').asString) Then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
     MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     memLog.Lines.Add(CtrlProcessaContab.sMensAPS_Log);
   End;

   If Anim.Active Then Anim.Active := False;


end;



procedure TfrmGeraRateioAtivProjMT.ProcMensRAT(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
      memLog.Lines.Add(msg);

    pgbStatus.Position := CtrlProcessaContab.Progresso;
    pgbStatus.Max      := CtrlProcessaContab.MaxProgresso;
    Application.ProcessMessages;
  End;

end;

procedure TfrmGeraRateioAtivProjMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text <> '' then
   begin
      cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.text),0);
   end;

end;

end.
