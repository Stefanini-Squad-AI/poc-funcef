unit uCtrlCustomRH;

interface

uses SysUtils, uCmDbObject, uCmControlObject, uCtrlPessoa, uCtrlFuncoesRH, uCMClientDataSet;

type
  TCtrlCustomRH = class(TCtrlFuncoesRH)
  protected
    FUsuXFilial: string;
    FUsuXCCusto: string;
    FIdUsuarioGeral: string;
  public
    procedure SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); virtual;
  end;

  TCtrlCustomPessoaRH = class(TCtrlPessoa)
  protected
    FUsuXFilial: string;
    FUsuXCCusto: string;
    FIdUsuarioGeral: string;
  public
    procedure SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); virtual;
  end;

var
  CtrlCustomRH: TCtrlCustomRH;

implementation

procedure TCtrlCustomRH.SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FUsuXFilial := UsuXFilial;
  FUsuXCCusto := UsuXCCusto;
  FIdUsuarioGeral := IdUsuarioGeral;
end;

procedure TCtrlCustomPessoaRH.SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FUsuXFilial := UsuXFilial;
  FUsuXCCusto := UsuXCCusto;
  FIdUsuarioGeral := IdUsuarioGeral;
end;

end.
