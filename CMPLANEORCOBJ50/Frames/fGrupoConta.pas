unit fGrupoConta;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CMProcuraMask, MontaSelect, Db, DBClient, uCMClientDataSet,
  uCmSqlParams, ExtCtrls, CMProcura;

type
  TGrupoConta = class(TFrame)
    MontaSelectGrupo: TMontaSelect;
    gbGrupoConta: TGroupBox;
    lblGrupoConta: TLabel;
    cmpGrupoConta: TCMProcura;
  private
  public
  end;

implementation

{$R *.DFM}

{ TGrupoConta }

end.
