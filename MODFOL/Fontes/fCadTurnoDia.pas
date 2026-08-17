unit fCadTurnoDia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TfrmCadTurnoDia = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedInicioExped: TDBEdit;
    Label3: TLabel;
    dbedInicioAlm: TDBEdit;
    Label4: TLabel;
    dbedFinalAlm: TDBEdit;
    Label5: TLabel;
    dbedFimExped: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTurnoDia: TfrmCadTurnoDia;

implementation

{$R *.DFM}

end.
