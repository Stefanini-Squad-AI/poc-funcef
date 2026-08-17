{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        CADASTRO DE SITUAÇÃO CONTRATUAL  ( MT )

        Módulo          :  Comuns Imobiliário
	Autor           :  Vinícius Meyer Lana
	Data de Início  :  24/05/2002
	Data de Término :  24/05/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadSitContImobMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Provider, DBTables, Mask, wwdbedit, uCtrlSitContImob;

type
  TfrmCadSitContImobMT = class(TfrmCadastroGridMTImob)
    CdsIDSITCONTIMOB: TFloatField;
    CdsDESCRICAO: TStringField;
    Label1: TLabel;
    dbedtDesc: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlSitContImob : TCtrlSitContImob;
  public
    { Public declarations }
  protected
    procedure FazerRefresh; override;
  end;

var
  frmCadSitContImobMT: TfrmCadSitContImobMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

{ TfrmCadSitContImob }


procedure TfrmCadSitContImobMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto Lojas
  CtrlSitContImob := TCtrlSitContImob.Create;
  CtrlSitContImob.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                             ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlSitContImob.CdsSitContImob := Cds;

  FazerRefresh;
end;

procedure TfrmCadSitContImobMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlSitContImob.LookupSitContImob;
end;


procedure TfrmCadSitContImobMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if dbedtDesc.CanFocus then dbedtDesc.SetFocus;
end;

procedure TfrmCadSitContImobMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlSitContImob.GravaSitContImob;
end;

procedure TfrmCadSitContImobMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlSitContImob.GravaSitContImob;
end;


procedure TfrmCadSitContImobMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlSitContImob.LookupSitContImob( CdsIDSITCONTIMOB.AsInteger );
  inherited;
  if dbedtDesc.CanFocus then dbedtDesc.SetFocus;
end;


end.
