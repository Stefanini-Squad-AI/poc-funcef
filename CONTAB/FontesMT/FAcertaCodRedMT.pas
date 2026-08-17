unit FAcertaCodRedMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls,
  uCtrlProcessaContab,uCtrlContab, uCMTypes;

type
  TfrmAcertaCodRedMT = class(TfrmOkCancelar)
    mmComentario: TMemo;
    rgRenumera: TRadioGroup;
    pbProgresso: TProgressBar;
    Anim: TAnimate;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlProcessaContab : TCtrlProcessaContab;
    CtrlContab         : TCtrlContab;
    procedure ProcMensCR(msg: String);

  public
    { Public declarations }
  end;

var
  frmAcertaCodRedMT: TfrmAcertaCodRedMT;

implementation

Uses uMensErro, dBaseDados, uDataBase, uSistema, uString, uModulo;
{$R *.DFM}

procedure TfrmAcertaCodRedMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible      := True;
     Anim.Active       := True;
   End;


   //=== processa codigo reduzido  ===
   If CtrlProcessaContab.AtuCodigoReduzido(Sistema.idEmpresa,Sistema.IdModulo,Sistema.idUsuario,CtrlContab.PlanoParam,rgRenumera.ItemIndex) Then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;


   If Anim.Active Then Anim.Active := False;

end;



procedure TfrmAcertaCodRedMT.ProcMensCR(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    pbProgresso.Position := CtrlProcessaContab._Progresso;
    pbProgresso.Max      := CtrlProcessaContab.MaxProgresso;

    Application.ProcessMessages;
  End;

end;

procedure TfrmAcertaCodRedMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensCR);

end;

procedure TfrmAcertaCodRedMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlProcessaContab.free;
  CtrlContab.free;

end;

end.
