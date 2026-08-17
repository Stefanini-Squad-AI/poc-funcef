{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fMTReconstroiSaldoCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fMTReconstroiSaldo, MontaSelect, uCmSqlParams, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
  StdCtrls, Gauges, Buttons, ExtCtrls, wwdblook;

type
  TfrmMTReconstroiSaldoCAF = class(TfrmMTReconstroiSaldo)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMTReconstroiSaldoCAF: TfrmMTReconstroiSaldoCAF;

implementation

{$R *.DFM}

end.
