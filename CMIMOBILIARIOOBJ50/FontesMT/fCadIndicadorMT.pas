{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26236
Responsável : Daniel Simões
Data        : 13/09/2007
Descrição   : Implementado tipo interno de Indicador de Seguros...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadIndicadorMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, DBCtrls, Mask, dBaseDados, uSistema, uMensErro,
  uMidasUtil, wwdbedit, uCtrlIndicadorImovel, uComunsImobiliario, uVerificaPreenchimento,
  wwdblook;

type
  TfrmCadIndicadorMT = class(TfrmCadastroGridMTImob)
    Label1: TLabel;
    DBrdgTipo: TDBRadioGroup;
    DBRdgRECPAG: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    CdsINMDESCRICAO: TStringField;
    CdsIDINDICADORIMOVEL: TFloatField;
    CdsFLGTIPOVALOR: TStringField;
    CdsRECPAG: TStringField;
    CdsFLGUNIDAUT: TFloatField;
    dbedDescricao: TwwDBEdit;
    CdsCODINTERNO: TFloatField;
    Label2: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    cdsInfo: TCMClientDataSet;
    cdsInfoCODINTERNO: TIntegerField;
    cdsInfoDESCCODINTERNO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlIndicadorImovel: TCtrlIndicadorImovel;

  public
    { Public declarations }
  end;

var
  frmCadIndicadorMT: TfrmCadIndicadorMT;

implementation

{$R *.DFM}

{ TfrmCadIndicadorMT }

procedure TfrmCadIndicadorMT.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlIndicadorImovel.LookupIndicadorImovel;
end;

procedure TfrmCadIndicadorMT.FormCreate(Sender: TObject);

  procedure IncluiCodInterno( iCod : integer; sDesc : string );
  begin
    cdsInfo.Append;
    cdsInfoCODINTERNO.AsInteger    := iCod;
    cdsInfoDESCCODINTERNO.AsString := sDesc;
    cdsInfo.Post;
  end;

begin
  CtrlIndicadorImovel := TCtrlIndicadorImovel.Create( Sistema.IdEmpresa,
                                                      Sistema.IdModulo,
                                                      Sistema.IdUsuario,
                                                      Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro );
  CtrlIndicadorImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlIndicadorImovel.CdsIndicadorImovel := Cds;

  FazerRefresh ;

  cdsInfo.CreateDataSet;

  IncluiCodInterno( 1, 'Quantidade total de documentos de locação'     );
  IncluiCodInterno( 2, 'Quantidade de inadimplências de locação'       );
  IncluiCodInterno( 3, 'Valor total de documentos de locação'          );
  IncluiCodInterno( 4, 'Valor de inadimplências de locação'            );
  IncluiCodInterno( 5, 'Quantidade total de documentos de alienação'   );
  IncluiCodInterno( 6, 'Quantidade de inadimplências de alienação'     );
  IncluiCodInterno( 7, 'Valor total de documentos de alienação'        );
  IncluiCodInterno( 8, 'Valor de inadimplências de alienação'          );
  IncluiCodInterno( 9, 'Valor total do documento do seguro de locação' ); // Daniel - 26236

  cdsInfo.First;

  inherited;
end;

procedure TfrmCadIndicadorMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlIndicadorImovel);
end;

procedure TfrmCadIndicadorMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlIndicadorImovel.GravaIndicadorImovel;
end;

procedure TfrmCadIndicadorMT.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlIndicadorImovel.LookupIndicadorImovel('', CdsIDINDICADORIMOVEL.AsInteger);
  inherited;
end;

end.
