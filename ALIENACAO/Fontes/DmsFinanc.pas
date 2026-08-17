unit DmsFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect;

type
  TdtmMS = class(TDataModule)
    MS_Comprador: TMontaSelect;
    MS_Proposta: TMontaSelect;
    MS_Imovel: TMontaSelect;
    MS_Contrato: TMontaSelect;
    MS_PropostaContrato: TMontaSelect;
    MS_Responsavel: TMontaSelect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMS: TdtmMS;

implementation

{$R *.DFM}

end.
