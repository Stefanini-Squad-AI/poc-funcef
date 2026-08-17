unit fCadCategoriaImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, dBaseDados, uSistema, uMensErro,
  uMidasUtil, uCtrlCategoriaImovel, uComunsImobiliario, uVerificaPreenchimento;

type
  TfrmCadCategoriaImovelMT = class(TfrmCadastroGridMTImob)
    Label1: TLabel;
    dbedDescricao: TDBEdit;
    CdsIDCATEGORIAIMOVEL: TFloatField;
    CdsCTIDESCRICAO: TStringField;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlCategoriaImovel: TCtrlCategoriaImovel;

  public
    { Public declarations }
  end;

var
  frmCadCategoriaImovelMT: TfrmCadCategoriaImovelMT;

implementation

{$R *.DFM}

{ TfrmCadCategoriaImovelMT }

procedure TfrmCadCategoriaImovelMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlCategoriaImovel.LookupCategoriaImovel;
end;

procedure TfrmCadCategoriaImovelMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlCategoriaImovel.GravaCategoriaImovel;
end;

procedure TfrmCadCategoriaImovelMT.FormCreate(Sender: TObject);
begin
  CtrlCategoriaImovel := TCtrlCategoriaImovel.Create;
  CtrlCategoriaImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlCategoriaImovel.CdsCategoriaImovel := Cds;

  FazerRefresh ;
  inherited;
end;

procedure TfrmCadCategoriaImovelMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlCategoriaImovel.LookupCategoriaImovel(CdsIDCATEGORIAIMOVEL.AsInteger);
  inherited;
end;

procedure TfrmCadCategoriaImovelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlCategoriaImovel);
end;

end.
