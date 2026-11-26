unit fProcessoPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, fFrameProgresso, ComCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, dbasedados;

type
  TfrmProcessoPadrao = class(TfrmSairAjuda)
    bbtnProcessar: TBitBtn;
    bbtnProcessarOutro: TBitBtn;
    pnlOpcoes: TPanel;
    pgctrlInformacoes: TPageControl;
    tbsResultado: TTabSheet;
    frameProgresso: TfrmFrameProgresso;
    Splitter1: TSplitter;
    procedure ChecaValidacao(Sender: TObject);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcessarOutroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FControleCommit: boolean;
    FProcessamentoOK: boolean;
    procedure SetControleCommit(const Value: boolean);
    procedure SetProcessamentoOK(const Value: boolean);
    function ProcessaConfirmacao: boolean;
  public
    { Public declarations }
    property ControleCommit: boolean read FControleCommit write SetControleCommit;
    {-indica que a tela irá controlar o commit ao final do processo}
    property ProcessamentoOK: boolean read FProcessamentoOK write SetProcessamentoOK;
    function ValidaProcessar: boolean; dynamic;
    function Inicializa: boolean; dynamic;
    procedure Processa; dynamic;
    procedure Terminar; dynamic;
    function ProcessaCommit(asmsg: string): boolean; dynamic;
    function ProcessaRollback(asmsg: string): boolean; dynamic;
    function ObtemPermissaoConfirmar: boolean; dynamic;
    procedure InicializaAmbiente; dynamic;
    procedure LimpaAmbiente; dynamic;
    procedure FinalizaAmbiente; dynamic;
    procedure MostraTela; dynamic;
  end;

implementation

{$R *.DFM}

procedure TfrmProcessoPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  ControleCommit:=false;
  ProcessamentoOK:=false;
  InicializaAmbiente;
  LimpaAmbiente;
end;

procedure TfrmProcessoPadrao.FormShow(Sender: TObject);
begin
  inherited;
  MostraTela;
  WindowState := wsMaximized;
end;

procedure TfrmProcessoPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FinalizaAmbiente;
end;

procedure TfrmProcessoPadrao.ChecaValidacao(Sender: TObject);
begin
  inherited;
  bbtnProcessar.enabled:=ValidaProcessar;
end;

function TfrmProcessoPadrao.ValidaProcessar: boolean;
begin
  result:=false;
end;

function TfrmProcessoPadrao.Inicializa: boolean;
begin
  result:=false;
end;

procedure TfrmProcessoPadrao.Processa;
begin
  enabled:=false;
  ProcessamentoOK:=false;
end;

procedure TfrmProcessoPadrao.Terminar;
begin
  enabled:=true;
end;

procedure TfrmProcessoPadrao.bbtnProcessarClick(Sender: TObject);
begin
  inherited;
  pgctrlInformacoes.activepage:=tbsResultado;
  if Inicializa then
  begin
    bbtnProcessar.visible:=false;
    bbtnProcessarOutro.visible:=false;
    Processa;
    Terminar;
    bbtnProcessarOutro.visible:=ProcessaConfirmacao;
  end;
end;

function TfrmProcessoPadrao.ProcessaCommit(asmsg: string): boolean;
begin
  if asmsg <> '' then
    frameprogresso.ExibeMensagem(asmsg);
  if dtmBaseDados.dbBaseDados.intransaction then
    dtmBaseDados.dbBaseDados.commit;
  result:=true;
end;

function TfrmProcessoPadrao.ProcessaRollback(asmsg: string): boolean;
begin
  if asmsg <> '' then
    frameprogresso.ExibeMensagem(asmsg);
  if dtmBaseDados.dbBaseDados.intransaction then
    dtmBaseDados.dbBaseDados.rollback;
  result:=true;
end;

function TfrmProcessoPadrao.ProcessaConfirmacao: boolean;
begin
  if ControleCommit then
  begin
    if dtmBaseDados.dbBaseDados.intransaction then
    begin
      if ObtemPermissaoConfirmar then
      begin
        if ProcessamentoOK then
          result:=ProcessaCommit('  Confirmação de gravação pelo usuário.')
        else
          result:=ProcessaRollback('  Confirmação de cancelamento de gravação pelo usuário.');
      end
      else
        result:=ProcessaRollback('  Cancelamento de gravação por erro no processo.');
    end
    else
      result:=true;
  end
  else
    result:=true;
end;

procedure TfrmProcessoPadrao.bbtnProcessarOutroClick(Sender: TObject);
begin
  inherited;
  LimpaAmbiente;
  bbtnProcessar.visible:=true;
  bbtnProcessarOutro.visible:=false;
end;

procedure TfrmProcessoPadrao.LimpaAmbiente;
begin
  ChecaValidacao(self);
end;

function TfrmProcessoPadrao.ObtemPermissaoConfirmar: boolean;
begin

end;

procedure TfrmProcessoPadrao.InicializaAmbiente;
begin

end;

procedure TfrmProcessoPadrao.FinalizaAmbiente;
begin

end;

procedure TfrmProcessoPadrao.MostraTela;
begin

end;

procedure TfrmProcessoPadrao.SetControleCommit(const Value: boolean);
begin
  FControleCommit := Value;
end;

procedure TfrmProcessoPadrao.SetProcessamentoOK(const Value: boolean);
begin
  FProcessamentoOK := Value;
end;

procedure TfrmProcessoPadrao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  ProcessaConfirmacao;
  Canclose:=true;
end;

end.
