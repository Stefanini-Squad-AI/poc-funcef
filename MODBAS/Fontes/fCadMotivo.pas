unit fCadMotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbedit, DBCtrls, Mask,
  CmEventosCadastro, ImgList;

type
  TfrmCadMotivo = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgGrupo: TDBRadioGroup;
    Label3: TLabel;
    dbedCodRais: TDBEdit;
    Label4: TLabel;
    dbedCodFgts: TDBEdit;
    Label5: TLabel;
    dbedObs: TwwDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadMotivo: TfrmCadMotivo;

implementation

{$R *.DFM}

procedure TfrmCadMotivo.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDMOTIVO', MontaSelect.ValoresChave[0], []);
end;

end.
