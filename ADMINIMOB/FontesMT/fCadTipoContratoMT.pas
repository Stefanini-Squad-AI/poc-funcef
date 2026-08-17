{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadTipoContratoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, uCmSqlParams, uCtrlTipoContrato,
  dBaseDados, uSistema, uComunsImobiliario;

type
  TfrmCadTipoContratoMT = class(TfrmCadastroGridMTImob)
    CdsIDTIPOCONTRIMOB: TFloatField;
    CdsSIGLA: TStringField;
    CdsNOME: TStringField;
    edtSigla: TwwDBEdit;
    edtNome: TwwDBEdit;
    lblSigla: TLabel;
    lblNome: TLabel;
    CMSqlParams1: TCMSqlParams;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
  protected
    procedure FazerRefresh; override;
  private
    { Private declarations }
    ctrlTipoContrato: tCtrlTipoContrato;
  public
    { Public declarations }
  end;

var
  frmCadTipoContratoMT: TfrmCadTipoContratoMT;

implementation

{$R *.DFM}

procedure TfrmCadTipoContratoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoContrato.GravaTipoContrato;
end;

procedure TfrmCadTipoContratoMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlTipoContrato.LookupTipoContrato;
end;

procedure TfrmCadTipoContratoMT.FormCreate(Sender: TObject);
begin
  inherited;
  ctrlTipoContrato := tCtrlTipoContrato.Create;
  ctrlTipoContrato.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                               ComunsImobiliario.MensErroMT);
  ctrlTipoContrato.CdsTipoContrato := Cds;

  FazerRefresh;
end;

procedure TfrmCadTipoContratoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ctrlTipoContrato);
end;

procedure TfrmCadTipoContratoMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlTipoContrato.LookupTipoContrato(CdsIDTIPOCONTRIMOB.AsString);
  inherited;
end;

end.
