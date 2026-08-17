unit fCadPaisAlex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, uCmSqlParams, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, uCtrlPaisAlex, dBaseDados, uSistema;

type
  TFrmCadPaisAlex = class(TFrmCadastroMestreDetMT)
    CdsIDPAIS: TFloatField;
    CdsNOMEPAIS: TStringField;
    CdsNOMENACIONALIDADE: TStringField;
    CdsCODRECEITAFEDERAL: TFloatField;
    CdsCODINTERNACIONAL: TStringField;
    CdsMASCARACPOSTAL: TStringField;
    CdsTRGDTINCLUSAO: TDateTimeField;
    CdsTRGUSERINCLUSAO: TStringField;
    CdsCODREGIAO: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    dbGrdEstado: TwwDBGrid;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    cdsEstado: TCMClientDataSet;
    cdsEstadoCODESTADO: TStringField;
    cdsEstadoIDPAIS: TFloatField;
    cdsEstadoNOMEESTADO: TStringField;
    cdsEstadoIDESTADO: TFloatField;
    cdsEstadoTRGDTINCLUSAO: TDateTimeField;
    cdsEstadoTRGUSERINCLUSAO: TStringField;
    cdsEstadoCODJURISDICAO: TStringField;
    cdsEstadoCODFISCAL: TStringField;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DataSource1: TDataSource;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlPaisAlex: TCtrlPaisAlex;

    procedure Mensagem ( SMessageInfo: String);
    procedure AbrirQuery ( const iIdpais: Integer);

  public
    { Public declarations }
  end;

var
  FrmCadPaisAlex: TFrmCadPaisAlex;

implementation

{$R *.DFM}

{ TFrmCadPaisAlex }


procedure TFrmCadPaisAlex.AbrirQuery(const iIdpais: Integer);
begin
  Cds.Data       := CtrlPaisAlex.Seleciona (iIdpais);
  cdsEstado.Data := CtrlPaisAlex.SelecionaEstado (iIdpais);
end;

procedure TFrmCadPaisAlex.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPaisAlex := TCtrlPaisAlex.Create;

//  CtrlEstadoAlex.InitializeAs (Padroes);
  CtrlPaisAlex.Initialize (DtmBaseDados.DbBaseDados,
                             True, Sistema.ConnectionType, Sistema.ConnectionSide,
                             Sistema.AppRemoteServer, true, Mensagem );


  CtrlPaisAlex.CdsPaisAlex := Cds;
  CtrlPaisAlex.CdsEstadoAlex := cdsEstado;
  abrirquery (-1);

end;

procedure TFrmCadPaisAlex.Mensagem(SMessageInfo: String);
begin
   ShowMessage (SMessageInfo);

end;

procedure TFrmCadPaisAlex.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    AbrirQuery (StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadPaisAlex.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil (CtrlPaisAlex);

end;

procedure TFrmCadPaisAlex.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPaisAlex.Gravar;

end;

procedure TFrmCadPaisAlex.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  AbrirQuery (-1);
end;

procedure TFrmCadPaisAlex.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPaisAlex.Excluir;
end;

end.
