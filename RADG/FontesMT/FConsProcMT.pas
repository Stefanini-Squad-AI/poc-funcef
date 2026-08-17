unit FConsProcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, Grids,
  TB97Tlbr, TB97, ExtCtrls, Wwdbigrd, Wwdbgrid, Wwdatsrc, DBTables, ComCtrls,
  DBClient, CMDBLookupCombo, uCmSqlParams, uCMClientDataSet, uCtrlTipoProcesso;

type
  TFrmConsProcMT = class(TfrmSairAjuda)
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    sqlConsulta: TCMSqlParams;
    cdsConsulta: TCMClientDataSet;
    dsConsulta: TwwDataSource;
    Grd: TwwDBGrid;
    Panel3: TPanel;
    procedure BtnSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    _TipoProcesso : TCtrlTipoProcesso;
  public
    { Public declarations }
  end;

var
  FrmConsProcMT: TFrmConsProcMT;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, dBaseDados;

procedure TFrmConsProcMT.BtnSelClick(Sender: TObject);
Begin
  inherited;
  cdsConsulta.DisableControls;
  sqlConsulta.ParamByName( 'IDUSUARIO' ).AsFloat := Sistema.IdUsuario;
  sqlConsulta.Open;
  cdsConsulta.EnableControls;
end;

procedure TFrmConsProcMT.FormCreate(Sender: TObject);
begin
  inherited;
  _TipoProcesso := TCtrlTipoProcesso.Create;
  _TipoProcesso.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil, nil, False );

  sqlConsulta.Prepare;
  sqlConsulta.ParamByName( 'IDUSUARIO' ).AsFloat := -1;
  sqlConsulta.Open;
end;

procedure TFrmConsProcMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _TipoProcesso.Free;
end;

end.
