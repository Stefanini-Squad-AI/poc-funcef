unit fCadCargo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBCtrls, wwdblook, Mask, ImgList,
  CmEventosCadastro;

type
  TfrmCadCargo = class(TfrmCadastroCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedTitulo: TDBEdit;
    Label4: TLabel;
    dbedCBO: TDBEdit;
    dblcCBO: TwwDBLookupCombo;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    qryCBO: TwwQuery;
    qryFaixa: TwwQuery;
    Label7: TLabel;
    dblcFaixa: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblcCBOChange(Sender: TObject);
  end;

var
  frmCadCargo: TfrmCadCargo;

implementation

{$R *.DFM}

procedure TfrmCadCargo.FormCreate(Sender: TObject);
begin
  qry.Open;
  qryCBO.Open;
  qryFaixa.Open;
  inherited;
end;

procedure TfrmCadCargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qryCBO.Close;
  qryFaixa.Close;
  inherited;
end;

procedure TfrmCadCargo.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDCARGO', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadCargo.dblcCBOChange(Sender: TObject);
begin
  if (qry.State in [dsInsert, dsEdit]) then
    qry.FieldByName('DESCRICAO').asString := qryCBO.FieldByName('DESCRICAO').asString;
end;

end.
