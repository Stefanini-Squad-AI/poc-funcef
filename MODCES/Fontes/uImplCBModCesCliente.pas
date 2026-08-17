unit uImplCBModCesCliente;

interface

uses
  ComObj, ActiveX, CmModCesSrvr70_TLB, StdVcl;

type
  TProcessarGravarSolicitacoes_CB = procedure of object;
  TExecProgresso_CB = procedure (const Progresso: WideString; NumRegistros: Integer;
    ProxRegistro: WordBool) of object;

  TImplCBModCesCliente = class(TAutoIntfObject, ICBModCesCliente)
  private
    FProcessarGravarSolicitacoes_CB: TProcessarGravarSolicitacoes_CB;
    FExecProgresso_CB: TExecProgresso_CB;
  protected
    procedure ProcessarGravarSolicitacoes_CB; safecall;
    procedure ExecProgresso_CB(const Progresso: WideString; NumRegistros: Integer;
      ProxRegistro: WordBool); safecall;
  public
    constructor Create(Metodo: TProcessarGravarSolicitacoes_CB); overload;
    constructor Create(Metodo: TExecProgresso_CB); overload;
  end;

implementation

{ TImplCBProjetoPadrao }

constructor TImplCBModCesCliente.Create(Metodo: TProcessarGravarSolicitacoes_CB);
var
  ifTypeLib: ITypeLib;
begin
	 OleCheck(LoadRegTypeLib(LIBID_CmModCesSrvr70, 1, 0, 0, ifTypeLib));
	 inherited Create (ifTypeLib, CBModCesCliente);
	 FProcessarGravarSolicitacoes_CB := Metodo;
end;

constructor TImplCBModCesCliente.Create(Metodo: TExecProgresso_CB);
var
  ifTypeLib: ITypeLib;
begin
	 OleCheck(LoadRegTypeLib(LIBID_CmModCesSrvr70, 1, 0, 0, ifTypeLib));
	 inherited Create (ifTypeLib, CBModCesCliente);
  FExecProgresso_CB := Metodo;
end;

procedure TImplCBModCesCliente.ProcessarGravarSolicitacoes_CB;
begin
  FProcessarGravarSolicitacoes_CB;
end;

procedure TImplCBModCesCliente.ExecProgresso_CB(const Progresso: WideString;
  NumRegistros: Integer; ProxRegistro: WordBool);
begin
  FExecProgresso_CB(Progresso, NumRegistros, ProxRegistro);
end;

end.
