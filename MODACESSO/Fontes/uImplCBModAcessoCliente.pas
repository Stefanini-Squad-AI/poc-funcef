unit uImplCBModAcessoCliente;

interface

uses
  ComObj, ActiveX,  StdVcl;

type
  TLancamentoColetivoHorasTrab_CB = procedure (NumRegistros: integer) of object;

  TImplCBModAcessoCliente = class(TAutoIntfObject)
  private
   FLancamentoColetivoHorasTrab_CB: TLancamentoColetivoHorasTrab_CB;
  protected
    procedure LancamentoColetivoHorasTrab_CB(NumRegistros: integer); safecall;
  public
    constructor Create(Metodo: TLancamentoColetivoHorasTrab_CB); overload;
  end;

implementation

{ TImplCBModAcessoCliente }

constructor TImplCBModAcessoCliente.Create(Metodo: TLancamentoColetivoHorasTrab_CB);
var
  ifTypeLib: ITypeLib;
begin

       //*	 OleCheck(LoadRegTypeLib(LIBID_CmModAcessoSrvr70, 1, 0, 0, ifTypeLib));
	//* inherited Create (ifTypeLib, CBModAcessoCliente);
       //*	 FLancamentoColetivoHorasTrab_CB := Metodo;
end;

procedure TImplCBModAcessoCliente.LancamentoColetivoHorasTrab_CB(NumRegistros: integer);
begin
  FLancamentoColetivoHorasTrab_CB(NumRegistros);
end;

end.
