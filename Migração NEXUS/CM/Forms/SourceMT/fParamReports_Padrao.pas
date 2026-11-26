unit fParamReports_Padrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CmParamReport;

type
  TfrmParamReports_Padrao = class(TfrmOkCancelar)
    Cmp_Padrao: TCmParamReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamReports_Padrao: TfrmParamReports_Padrao;

implementation

{$R *.DFM}

end.
