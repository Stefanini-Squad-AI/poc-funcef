unit CRelProtocolo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mContratoEmptmo;

type
  TcfgRelProtocolo = class(TcfgRel)
    molContratoEmptmo: TmolContratoEmptmo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelProtocolo: TcfgRelProtocolo;

implementation

{$R *.DFM}

end.
