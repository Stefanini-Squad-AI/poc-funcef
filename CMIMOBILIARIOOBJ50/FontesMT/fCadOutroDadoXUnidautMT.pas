unit fCadOutroDadoXUnidautMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, wwdblook, uCtrlOutroDado,
  uMensErro, dBaseDados, uSistema, uCMTypes, mUnidAutonoma, uComunsImobiliario, uVerificaPreenchimento;


type
  TfrmCadOutroDadoXUnidautMT = class(TfrmCadastroGridMTImob)
    Panel1: TPanel;
    Label2: TLabel;
    dbCboOutroDado: TwwDBLookupCombo;
    Label4: TLabel;
    DBedtValor: TDBEdit;
    CdsOutroDado: TCMClientDataSet;
    CdsOutroDadoODODESCRICAO: TStringField;
    CdsOutroDadoIDOUTRODADO: TFloatField;
    molUnidAutonoma1: TmolUnidAutonoma;
    CdsIDOUTRODADO: TFloatField;
    CdsIDUNIDAUT: TFloatField;
    CdsODUVALOR: TStringField;
    CdsODODESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure molUnidAutonoma1btnBuscaUnidautClick(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlOutroDado : TCtrlOutroDado;

  public
    { Public declarations }
  end;

var
  frmCadOutroDadoXUnidautMT: TfrmCadOutroDadoXUnidautMT;

implementation

{$R *.DFM}

procedure TfrmCadOutroDadoXUnidautMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlOutroDado := TCtrlOutroDado.Create;
  CtrlOutroDado.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlOutroDado.CdsOutroDadoXUnidaut := Cds;
  // ZERAR CONTEÚDOS DO MOL
  molUnidAutonoma1.btnLimpaUnidautClick( self );
  molUnidAutonoma1.iUnidaut := -2;
  FazerRefresh;

  CdsOutroDado.Data  := CtrlOutroDado.LookupOutroDado;
end;

procedure TfrmCadOutroDadoXUnidautMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlOutroDado );
end;

procedure TfrmCadOutroDadoXUnidautMT.FazerRefresh;
begin
  Cds.Data := CtrlOutroDado.LookupOutroDadoXUnidaut(molUnidAutonoma1.iUnidaut);

  // quando é alteração estes botões estão desabilidados
  molUnidAutonoma1.btnBuscaUnidaut.Enabled := true;
  dbCboOutroDado.Enabled := true;
  inherited;  
end;

procedure TfrmCadOutroDadoXUnidautMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsIDUNIDAUT.AsInteger := molUnidAutonoma1.iUnidaut;
  Accept := CtrlOutroDado.GravaOutroDadoXUnidaut;
end;

procedure TfrmCadOutroDadoXUnidautMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Accept := CtrlOutroDado.GravaOutroDadoXUnidaut;
  inherited;
end;

procedure TfrmCadOutroDadoXUnidautMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlOutroDado.LookupOutroDadoXUnidaut(CdsIDUNIDAUT.AsInteger, CdsIDOUTRODADO.AsInteger);
  inherited;
  molUnidAutonoma1.btnBuscaUnidaut.Enabled := false;
  dbCboOutroDado.Enabled := false;
end;

procedure TfrmCadOutroDadoXUnidautMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molUnidAutonoma1.iUnidaut := StrToInt(MontaSelect.ValoresChave[0]);
    molUnidAutonoma1.edtImovel.Text   := MontaSelect.ValoresChave[2] + ' - ' + MontaSelect.ValoresChave[3];
    molUnidAutonoma1.edtUnidaut.Text  := MontaSelect.ValoresChave[4];

    FazerRefresh;
  end;
end;

procedure TfrmCadOutroDadoXUnidautMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // quando é alteração estes botões estão desabilidados
  molUnidAutonoma1.btnBuscaUnidaut.Enabled := true;
  dbCboOutroDado.Enabled := true;
end;

procedure TfrmCadOutroDadoXUnidautMT.molUnidAutonoma1btnBuscaUnidautClick(
  Sender: TObject);
begin
  inherited;
  molUnidAutonoma1.btnBuscaUnidautClick(Sender);
  if (CmeCadastro.Operacao = opIdle) or (CmeCadastro.Operacao = opVazio) then
   FazerRefresh;
end;

end.
