unit FParamAssist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, DBCtrls, ComCtrls;

type
  TFrmParamAssist = class(TfrmCadastroCS)
    pgctrlParam: TPageControl;
    tbsGeral: TTabSheet;
    pnlGerais: TPanel;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    chFLGINTCONTBASS: TDBCheckBox;
    chFLGINTCPAGAR: TDBCheckBox;
    chFLGINTCRECEBER: TDBCheckBox;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    chFLGCOBPRIMBCOASS: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    tbsMotivos: TTabSheet;
    pnlMotivos: TPanel;
    ScrollBox1: TScrollBox;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label1: TLabel;
    cmbmotivocontribass: TwwDBLookupCombo;
    wwDBLookupCombo5: TwwDBLookupCombo;
    wwDBLookupCombo6: TwwDBLookupCombo;
    cmbmotivoatrasoas: TwwDBLookupCombo;
    cmbmotivodevolas: TwwDBLookupCombo;
    cmbmotivofinancas: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    dbckFlgUsaCentCusto: TDBCheckBox;
    pnlCentroCusto: TPanel;
    GroupBox8: TGroupBox;
    dblkPrograma: TwwDBLookupCombo;
    GroupBox12: TGroupBox;
    dblkCentroCusto: TwwDBLookupCombo;
    qryTipoRegra: TwwQuery;
    qryGrupoRegra: TwwQuery;
    qryPrograma: TwwQuery;
    qryCentroCusto: TwwQuery;
    qryAux: TwwQuery;
    qryMotivo: TwwQuery;
    dbChPrePag: TDBCheckBox;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label4: TLabel;
    DBCheckBox1: TDBCheckBox;
    qrySitCancel: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamAssist: TFrmParamAssist;

implementation

uses UAdmAss, DBaseDados;

{$R *.DFM}

procedure TFrmParamAssist.FormShow(Sender: TObject);
begin
  inherited;
  // Abertura de Queries
  qryTipoRegra.Close;
  qryTipoRegra.Open;

  qryGrupoRegra.Close;
  qryGrupoRegra.Open;

  qryPrograma.Close;
  qryPrograma.Open;

  qryMotivo.Close;
  qryMotivo.Open;

  qryCentroCusto.Close;
  qryCentroCusto.Open;

  qry.Close;
  qry.Open;

  qrySitCancel.Close;
  qrySitCancel.Open;

  sbtnAlterar.Enabled := True;

  pgctrlParam.ActivePage := tbsGeral;
end;

procedure TFrmParamAssist.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  LeParam(dtmBaseDados.dbBaseDados.DatabaseName, False);
end;

end.
