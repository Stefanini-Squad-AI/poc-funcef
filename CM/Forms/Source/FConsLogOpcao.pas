unit FConsLogOpcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc;

type
  TfrmConsLogOpcao = class(TfrmSairAjuda)
    qryLogOpcao: TwwQuery;
    dsLogOpcao: TwwDataSource;
    dbgrLogOpcao: TwwDBGrid;
    Label4: TLabel;
    dteDataIni: TCMDateTimePicker;
    lblDataIni: TLabel;
    dteDataFim: TCMDateTimePicker;
    dblcUsuario: TCMDBLookupCombo;
    qryUsuario: TwwQuery;
    lblUsuario: TLabel;
    qryLogOpcaoIDLOGOPCAO: TFloatField;
    qryLogOpcaoUSUARIO: TStringField;
    qryLogOpcaoNOMEOPCAO: TStringField;
    qryLogOpcaoDATALOG: TDateTimeField;
    btnBusca: TBitBtn;
    dbgrLogOpcaoIButton: TwwIButton;
    procedure FormActivate(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsLogOpcao: TfrmConsLogOpcao;

implementation

Uses uSistema;

{$R *.DFM}

procedure TfrmConsLogOpcao.FormActivate(Sender: TObject);
begin
  inherited;
  qryLogOpcao.Close;
  qryLogOpcao.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryLogOpcao.ParamByName('IDMODULO').AsInteger := Sistema.idModulo;
  qryLogOpcao.Open;
  //
  qryUsuario.Close;
  qryUsuario.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryUsuario.ParamByName('IDMODULO').AsInteger := Sistema.idModulo;
  qryUsuario.Open;
  //

end;

procedure TfrmConsLogOpcao.btnBuscaClick(Sender: TObject);
begin
  inherited;
  qryLogOpcao.Close;
  qryLogOpcao.SQL.Delete(6);
  if dteDataIni.Text <> '' then begin
     qryLogOpcao.SQL.Insert(6,' AND (L.DATALOG >= TO_DATE('''+dteDataIni.Text+''',''DD/MM/YYYY''))');
  end else begin
     qryLogOpcao.SQL.Insert(6,' AND (1 = 1)');
  end;
  qryLogOpcao.SQL.Delete(7);
  if dteDataFim.Text <> '' then begin
     qryLogOpcao.SQL.Insert(7,' AND (L.DATALOG <= TO_DATE('''+dteDataFim.Text+''',''DD/MM/YYYY''))');
  end else begin
     qryLogOpcao.SQL.Insert(7,' AND (1 = 1)');
  end;
  qryLogOpcao.SQL.Delete(8);
  if dblcUsuario.Text <> '' then begin
     qryLogOpcao.SQL.Insert(8,' AND (L.IDUSUARIO = '+dblcUsuario.LookupValue+')');
  end else begin
     qryLogOpcao.SQL.Insert(8,' AND (1 = 1)');
  end;
  qryLogOpcao.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryLogOpcao.ParamByName('IDMODULO').AsInteger := Sistema.idModulo;
  qryLogOpcao.Open;
end;

end.
