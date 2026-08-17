unit testeDivida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Db, Mask, DBTables, Wwquery;

type
  Tteste = class(TfrmOkCancelar)
    qry: TwwQuery;
    mes: TDBEdit;
    mesCobranca: TDBEdit;
    idMotivo: TDBEdit;
    idPlanAss: TDBEdit;
    idPlanoPrev: TDBEdit;
    idPessJur: TDBEdit;
    idTitular: TDBEdit;
    idDependente: TDBEdit;
    idContAss: TDBEdit;
    Label1: TLabel;
    ds: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBNavigator1: TDBNavigator;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  teste: Tteste;

implementation

uses UDividaAssist;

{$R *.DFM}

procedure Tteste.bbtnConfirmarClick(Sender: TObject);
begin
  MudaCobrancaDividaAssist(mes.text,
                           mesCobranca.text,
                           strToInt(idMotivo.text),
                           strToInt(idPlanAss.text),
                           strToInt(idPlanoPrev.text),
                           strToInt(idPessJur.text),
                           strToInt(idTitular.text),
                           strToInt(idDependente.text),
                           strToInt(idContAss.text));
end;

procedure Tteste.FormCreate(Sender: TObject);
begin
  inherited;
  qry.open;
end;

end.
