unit fCadCargo;

interface
                            
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBCtrls, wwdblook, Mask, ImgList,
  CmEventosCadastro;

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
    Label7: TLabel;
    dblcFaixa: TwwDBLookupCombo;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    qryFaixa: TwwQuery;
    qryGrupoFunc: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure dblcCBOChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    procedure AtualizaDados(ID: string);
  end;

var
  frmCadCargo: TfrmCadCargo;

implementation

{$R *.DFM}

procedure TfrmCadCargo.FormCreate(Sender: TObject);
begin
  inherited;
  AtualizaDados('-1');
  qryCBO.Open;
  qryFaixa.Open;
  qryGrupoFunc.Open;
end;

procedure TfrmCadCargo.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    AtualizaDados(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadCargo.dblcCBOChange(Sender: TObject);
begin
  if (qry.State in [dsInsert,dsEdit]) then
    qry.FieldByName('NOMECBO').asString := qryCBO.FieldByName('DESCRICAO').asString;
end;

procedure TfrmCadCargo.AtualizaDados(ID: string);
begin
  qry.Close;
  qry.ParamByName('IDCARGO').asString := ID;
  qry.Open;
end;

end.
