unit FParamAutorizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCANCELAR, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, uCmSqlParams, Grids, Wwdbigrd, Wwdbgrid, uCtrlPadroes;

type
  TfrmParamAutoriza = class(TfrmOkCancelar)
    cboTabela: TwwDBLookupCombo;
    Label1: TLabel;
    wwDBGridBackAutoriza: TwwDBGrid;
    sqlBack: TCMSqlParams;
    cmcdsBack: TCMClientDataSet;
    dsBack: TwwDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Padroes: TCtrlPadroes;
    cdsUsuario: TClientDataSet;
    function ObterIdEspAcesso(sNomeUsuario: string): OleVariant;
    function ListaUsuarios: OleVariant;
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  frmParamAutoriza: TfrmParamAutoriza;

implementation

{$R *.DFM}

{ TfrmParamAutoriza }

function TfrmParamAutoriza.ObterIdEspAcesso(sNomeUsuario: string): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT IDESPACESSO,                                                   '+
    'FROM USUARIOSISTEMA U                                                 '+
    'WHERE U.NOMEUSUARIO = ' + sNomeUsuario                                 +
    'UNION                                                                 '+
    'SELECT IDESPACESSO                                                    '+
    'FROM USUARIOSISTEMA U, GRUPOUSU G                                     '+
    'WHERE U.IDUSUARIO = G.IDUSUARIO                                       '+
    'AND U.NOMEUSUARIO = ' + sNomeUsuario;
  Result := Padroes.GetDataPacket(sSQL);
end;

function TfrmParamAutoriza.ListaUsuarios: OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT NOMEUSUARIO,                                                   '+
    'FROM USUARIOSISTEMA                                                   ';
  Result := Padroes.GetDataPacket(sSQL);
end;

destructor TfrmParamAutoriza.Destroy;
begin
  inherited;
  FreeAndNil(Padroes);
end;

procedure TfrmParamAutoriza.FormCreate(Sender: TObject);
begin
  inherited;
  Padroes := TCtrlPadroes.Create;
  cdsUsuario := TClientDataSet.Create(Self);
end;

end.
