unit uCtrlCustomRH;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCtrlPessoa,
  uCtrlFuncoesRH, uCMClientDataSet;

type
  TTipoLog = (tlArquivo, tlMonitor);

  TLog = class
  protected
    FTipo: TTipoLog;
    FArq: TextFile;
    FNomeArq: string;
  public
    procedure Init(const Tipo: TTipoLog; const NomeArq: string = '');
    procedure Finish;
    procedure Inserir(const Linha: string);
    end;

  TCtrlCustomRH = class(TCtrlFuncoesRH)
  protected
    FLog: TLog; // Objeto de Log
    // TipoRetorno especifica se a função retorna um Aviso (RETORNO_AVISO) ou um
    // Erro (RETORNO_ERRO) quando seu Result for falso. Caso Result seja verdadeiro,
    // será indicado o valor de retorno normal (RETORNO_NORMAL).
    FTipoRetorno: integer;
    // Variáveis para os parâmetros padrões do sistema
    FUsuXFilial: string;
    FUsuXCCusto: string;
    FIdUsuarioGeral: string;
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); virtual;

    property TipoRetorno: integer read FTipoRetorno;
  end;

  TCtrlCustomPessoaRH = class(TCtrlPessoa)
  protected
    FLog: TLog; // Objeto de Log
    // Variáveis para os parâmetros padrões do sistema
    FUsuXFilial: string;
    FUsuXCCusto: string;
    FIdUsuarioGeral: string;
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); virtual;
  end;

var
  CtrlCustomRH: TCtrlCustomRH;

implementation

uses Windows;

const
  MSG_INI_LOG = 'Início em: :1 hs';

{ TLog }
procedure TLog.Init(const Tipo: TTipoLog; const NomeArq: string);
begin
  FTipo := Tipo;
  FNomeArq := NomeArq;
  if (FTipo = tlArquivo) then
  begin
    Assign(FArq, FNomeArq);
    Rewrite(FArq);
    WriteLn(FArq, fu.CMTranslateMsg(MSG_INI_LOG, [FormatDateTime('DD/MM/YYYY - HH:NN:SS', Now)]));
  end
  else
    SendNotifyMessage(HWND_BROADCAST, WM_INI_LOG_MONITOR, 0, 0);
end;

procedure TLog.Finish;
begin
  if (FTipo = tlArquivo) then
    CloseFile(FArq);
end;

procedure TLog.Inserir(const Linha: string);
var
  iAtomSend: integer;
  iTipoLinha: integer;
  sLinha: string;
  sLinhaAtual: string;
begin
  if (FTipo = tlArquivo) then
    WriteLn(FArq, FormatDateTime('[hh:nn:ss:zzz] - ', Time) + Linha)
  else
  begin
    try
      sLinha := FormatDateTime('[hh:nn:ss:zzz] - ', Time) + Linha;
      while (sLinha <> '') do
      begin
        sLinhaAtual := Copy(sLinha, 1, 255);

        // Toda a linha tem menos de 255 caracteres
        if (sLinhaAtual = Linha) then
          iTipoLinha := 0
        else
        // Quebrar a Linha com mais de 255 caracteres
        if (Length(sLinhaAtual) = 255) then
          iTipoLinha := 1
        else
        // Finalizar a linha com mais de 255 caracteres
          iTipoLinha := 2;

        iAtomSend := GlobalAddAtom(PChar(sLinhaAtual));

        SendNotifyMessage(HWND_BROADCAST, WM_ADD_LOG_MONITOR, iAtomSend, iTipoLinha);

        Delete(sLinha, 1, 255);
      end;
    finally
    end;
  end;
end;

{ TCtrlCustomRH }
constructor TCtrlCustomRH.Create;
begin
  inherited;
  FLog := TLog.Create;
end;

destructor TCtrlCustomRH.Destroy;
begin
  FLog.Free;
  inherited;
end;

procedure TCtrlCustomRH.SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FUsuXFilial := UsuXFilial;
  FUsuXCCusto := UsuXCCusto;
  FIdUsuarioGeral := IdUsuarioGeral;
end;

{ TCtrlCustomPessoaRH }
constructor TCtrlCustomPessoaRH.Create;
begin
  inherited;
  FLog := TLog.Create;
end;

destructor TCtrlCustomPessoaRH.Destroy;
begin
  FLog.Free;
  inherited;
end;

procedure TCtrlCustomPessoaRH.SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FUsuXFilial := UsuXFilial;
  FUsuXCCusto := UsuXCCusto;
  FIdUsuarioGeral := IdUsuarioGeral;
end;

end.
