unit fCadCargo;

interface
                            
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, wwdblook, Mask, CmEventosCadastro, ImgList;

type
  TfrmCadCargo = class(TfrmCadastroCS)
    qryCBO: TwwQuery;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedTitulo: TDBEdit;
    Label4: TLabel;
    dbedCBO: TDBEdit;
    dblcCBO: TwwDBLookupCombo;
    Label6: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    Label3: TLabel;
    dbmemDescr: TDBMemo;
    qryGrupoFunc: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure dblcCBOChange(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadCargo: TfrmCadCargo;

implementation

{$R *.DFM}

procedure TfrmCadCargo.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Open;
  qryCBO.Open;
  qryGrupoFunc.Open;
end;

procedure TfrmCadCargo.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDCARGO', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadCargo.dblcCBOChange(Sender: TObject);
begin
  inherited;
  if (qry.State in [dsInsert,dsEdit]) then
    qry.FieldByName('NOMECBO').asString := qryCBO.FieldByName('DESCRICAO').asString;
end;

end.
