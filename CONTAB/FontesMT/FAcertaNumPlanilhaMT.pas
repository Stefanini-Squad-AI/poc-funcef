unit FAcertaNumPlanilhaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, CMDBLookupCombo, Db,
  DBTables, Wwquery, DBClient, uCMClientDataSet,uCtrlProcessaContab,uCtrlContab,
  uCtrlPeriodo, uCMTypes;


type
  TfrmAcertaNumPlanilhaMT = class(TfrmSairAjuda)
    gbPeriodo: TGroupBox;
    dblcPeriodo: TCMDBLookupCombo;
    prgBarAtualiza: TProgressBar;
    mmComentario: TMemo;
    bbtnAtualiza: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cdsPeriodo: TCMClientDataSet;
    Anim: TAnimate;
    procedure bbtnAtualizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    procedure ProcMensNUM(msg: String);

  public
    { Public declarations }
  end;

var
  frmAcertaNumPlanilhaMT: TfrmAcertaNumPlanilhaMT;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uModulo,uFuncaoGeral;

{$R *.DFM}

procedure TfrmAcertaNumPlanilhaMT.bbtnAtualizaClick(Sender: TObject);
begin
  inherited;
  if CtrlContab.NumeracaoPlanilha = 'A' then begin
    MsgDlg('Proibido rodar esta opção para quem usa parâmetro de numeração de planilha Anual','Erro',mtError,[mbOk],0);
    dblcPeriodo.SetFocus;
    exit;
  end;
  if trim(dblcPeriodo.text) = '' then begin
    MsgDlg('Obrigatório indicar o Período Desejado','Erro',mtError,[mbOk],0);
    dblcPeriodo.SetFocus;
    exit;
  end;

   bbtnAtualiza.Enabled   := False;
   prgBarAtualiza.Visible := True;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible      := True;
     Anim.Active       := True;
   End;


   //=== processa Numeração planilha  ===
   If CtrlProcessaContab.AcertaNumPlanilha(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,
                             CtrlContab.PlanoParam,
                             cdsPeriodo.FieldByName('PEREXERCICIO').asInteger,
                             cdsPeriodo.FieldByName('PERNUMERO').asInteger,
                             CtrlContab.NumeracaoPlanilha) then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;


   If Anim.Active Then Anim.Active := False;


end;

procedure TfrmAcertaNumPlanilhaMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensNUM);

  // *** Instancia a classe periodo ***
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpSoNaoBloq,CtrlContab.ExercicioAtual,0);


end;

procedure TfrmAcertaNumPlanilhaMT.ProcMensNUM(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    prgBarAtualiza.Position := CtrlProcessaContab._Progresso;
    prgBarAtualiza.Max      := CtrlProcessaContab.MaxProgresso;

    Application.ProcessMessages;
  End;

end;

procedure TfrmAcertaNumPlanilhaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlProcessaContab.free;
  CtrlContab.free;
  CtrlPeriodo.free;
end;

end.




