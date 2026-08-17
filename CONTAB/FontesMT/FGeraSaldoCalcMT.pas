unit FGeraSaldoCalcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient,
  uCMClientDataSet,uCtrlContab,uCtrlProcessaContab,uCtrlPeriodo,
  uCMTypes;

type
  TfrmGeraSaldoCalcMT = class(TfrmOkCancelar)
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    cbGeraSubConta: TCheckBox;
    cbGeraCCusto: TCheckBox;
    lblConta: TLabel;
    pgbStatus: TProgressBar;
    Anim: TAnimate;
    cdsPeriodo: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    procedure ProcMensC(msg: String);
  public
    { Public declarations }
  end;

var
  frmGeraSaldoCalcMT: TfrmGeraSaldoCalcMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uData, uModulo;

{$R *.DFM}

procedure TfrmGeraSaldoCalcMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensC);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);

end;

procedure TfrmGeraSaldoCalcMT.ProcMensC(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
    begin
       lblConta.Caption  := CtrlProcessaContab.NomeCampo;
    end;
    pgbStatus.Position := CtrlProcessaContab._Progresso;
    pgbStatus.Max      := CtrlProcessaContab.MaxProgresso;

    Application.ProcessMessages;
  End;

end;

procedure TfrmGeraSaldoCalcMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtWarning,[mbOk],0);
      Exit;
   end;

   if dblkPeriodo.text = '' then begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtWarning,[mbOk],0);
      Exit;
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
   End;

   If CtrlProcessaContab.GeraSaldoCalculado(Sistema.idEmpresa,Sistema.IdModulo,Sistema.idUsuario,StrToInt(dblkExercicio.LookupValue),
                                   StrToInt(dblkPeriodo.LookupValue),modulo.sMascaraContas,
                                   cbGeraSubConta.Checked,cbGeraCCusto.Checked) Then

   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
     MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;

   If Anim.Active Then Anim.Active := False;


end;

procedure TfrmGeraSaldoCalcMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.LookupValue),0);

end;

end.
