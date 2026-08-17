unit FmeConsPartAss;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, Wwquery, CmEventosCadastro, ImgList, MontaSelect,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, Wwdbigrd, Wwdbgrid, DBCtrls,
  StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TFrameConsPartAss = class(TFrame)
    pnlFundo: TPanel;
    pcBenef: TPageControl;
    tsBenef: TTabSheet;
    DBGrid1: TDBGrid;
    gbDetalhes: TGroupBox;
    Label15: TLabel;
    DBText14: TDBText;
    Label16: TLabel;
    DBText15: TDBText;
    DBText16: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    DBText17: TDBText;
    Label19: TLabel;
    DBText18: TDBText;
    Label20: TLabel;
    DBText19: TDBText;
    Label21: TLabel;
    DBText20: TDBText;
    Label34: TLabel;
    DBText33: TDBText;
    tsCancel: TTabSheet;
    DBGrid2: TDBGrid;
    gbDetalhes1: TGroupBox;
    Label8: TLabel;
    DBText9: TDBText;
    Label13: TLabel;
    DBText12: TDBText;
    DBText13: TDBText;
    Label14: TLabel;
    Label24: TLabel;
    DBText23: TDBText;
    Label25: TLabel;
    DBText24: TDBText;
    Label26: TLabel;
    DBText25: TDBText;
    Label28: TLabel;
    DBText26: TDBText;
    Label29: TLabel;
    DBText27: TDBText;
    Label30: TLabel;
    DBText28: TDBText;
    Label32: TLabel;
    DBText31: TDBText;
    TabSheet1: TTabSheet;
    gbHistPlano: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    pcPart: TPageControl;
    tsPrincipal: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    LblTitular: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label5: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    Label1: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    DBText8: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    DBText10: TDBText;
    lblData: TLabel;
    tsGeral: TTabSheet;
    Label23: TLabel;
    DBText22: TDBText;
    Label12: TLabel;
    DBText11: TDBText;
    Label27: TLabel;
    lblConta: TLabel;
    Label22: TLabel;
    DBText21: TDBText;
    lblTitular2: TLabel;
    DBText29: TDBText;
    DBText30: TDBText;
    Label31: TLabel;
    pcPlano: TPageControl;
    tsPlano: TTabSheet;
    dbgPlano: TDBGrid;
    tsInfPlano: TTabSheet;
    DbgInfPlano: TDBGrid;
    GroupBox1: TGroupBox;
    LbValor: TLabel;
    pnlDescPlano: TPanel;
    ivTradutor: TIvExtendedTranslator;
    ds: TwwDataSource;
    upd: TUpdateSQL;
    MontaSelect: TMontaSelect;
    ImlPadrao: TImageList;
    CmeCadastro: TCmEventosCadastro;
    qry: TwwQuery;
    qryCHAVE: TFloatField;
    qryMATRICULA: TStringField;
    qryINSCRICAONUMERO: TFloatField;
    qrySITUACAO: TStringField;
    qryNOME: TStringField;
    qryDATANASC: TDateTimeField;
    qryIDADE: TFloatField;
    qrySEXO: TStringField;
    qryESTCIVIL: TStringField;
    qryPATROCINADORA: TStringField;
    qryDEPENDENTE: TStringField;
    qryDEPENDENCIA: TStringField;
    qryLEGAL: TStringField;
    qryIDPLANOPREV: TFloatField;
    qryPREVIDENCIARIO: TStringField;
    qryINSCRICAODATA: TDateTimeField;
    qryNOME_FALECIDO: TStringField;
    qryENDERECO: TStringField;
    qryCONTA: TStringField;
    qryCOBDIF: TStringField;
    dsPlano: TwwDataSource;
    qryBenef: TwwQuery;
    qryBenefIDPESSOA: TFloatField;
    qryBenefNOME: TStringField;
    qryBenefDATAENTRADA: TDateTimeField;
    qryBenefDTCANCELAMENTO: TDateTimeField;
    qryBenefDATANASC: TDateTimeField;
    qryBenefIDADE: TFloatField;
    qryBenefSEXO: TStringField;
    qryBenefESTCIVIL: TStringField;
    qryBenefDEPENDENTE: TStringField;
    qryBenefDEPENDENCIA: TStringField;
    qryBenefLEGAL: TStringField;
    qryBenefCAMPODATA: TStringField;
    qryBenefOBSCANCEL: TStringField;
    dsBenef: TwwDataSource;
    pmAtalho: TPopupMenu;
    Participante1: TMenuItem;
    Planos1: TMenuItem;
    Beneficirios1: TMenuItem;
    pmAtalhoAlt: TPopupMenu;
    MenuItem2: TMenuItem;
    PlanoInscrito1: TMenuItem;
    DatadeEntrada1: TMenuItem;
    FormadePagamento1: TMenuItem;
    Contribuio1: TMenuItem;
    DatadeCancelamento1: TMenuItem;
    Cobranadiferenciada1: TMenuItem;
    MenuItem3: TMenuItem;
    DataEntrada1: TMenuItem;
    DataCancelamento1: TMenuItem;
    qryPlano: TwwQuery;
    qryPlanoIDPESSOA: TFloatField;
    qryPlanoINSCRICAONUMERO: TStringField;
    qryPlanoIDPLANASS: TFloatField;
    qryPlanoBENEFICIARIO: TStringField;
    qryPlanoPLANO: TStringField;
    qryPlanoDATAENTRADA: TDateTimeField;
    qryPlanoDATACANCELAMENTO: TDateTimeField;
    qryPlanoFORMA_PAGAMENTO: TStringField;
    qryPlanoIDCONTASS: TFloatField;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPlanoCONTRIBUICAO: TStringField;
    qryPlanoCOBDIF: TStringField;
    qryInfPlano: TwwQuery;
    qryInfPlanoIDCAPSEGASS: TFloatField;
    qryInfPlanoIDPLANASS: TFloatField;
    qryInfPlanoTIPOSEG: TStringField;
    qryInfPlanoCAPITALMN: TFloatField;
    qryInfPlanoCAPITALIP: TFloatField;
    qryInfPlanoCAPITALMA: TFloatField;
    qryInfPlanoPREMIOFXA: TFloatField;
    qryInfPlanoPREMIOFXB: TFloatField;
    qryInfPlanoPREMIOFXC: TFloatField;
    qryInfPlanoPREMIOFXD: TFloatField;
    qryInfPlanoDESCPLANO: TStringField;
    qryInfPlanoDTVIGENCIA: TDateTimeField;
    qryInfPlanoFLGVIGENCIA: TStringField;
    DsInfPlano: TwwDataSource;
    qryRegraIn: TwwQuery;
    qryIdRegra: TwwQuery;
    qryIdRegraIDREGRA: TFloatField;
    qryIdRegraIDDEPENDENTE: TFloatField;
    qryIdRegraIDTITULAR: TFloatField;
    qryIdRegraIDPESSJUR: TFloatField;
    qryIdRegraIDPLANOPREV: TFloatField;
    qryIdRegraIDPLANASS: TFloatField;
    qryHistPlano: TwwQuery;
    dsHistPlano: TwwDataSource;
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
    ValorCalculado: Double;
    bCancelPlano: Boolean;
    Function VerificaFaixa(V1,V2,V3,V4,Pr:Double): Byte;
    Procedure CalculaContribuicao;
  public
    { Public declarations }
    vIdPessoa, iIdTitular, iIdPlanAss, iIdPlanoPrev,
    iIdPessJur, iIdFilial, iMenu                     : Integer;
    sMatricula, sInscricao, sOpcao                   : String;
    sValorAtual, sLblAtual, sLblNovo                 : String;
  end;

implementation

{$R *.DFM}

procedure TFrameConsPartAss.FrameEnter(Sender: TObject);
begin
  vIdPessoa:=0;
  pcPart.ActivePage:=tsPrincipal;
  pcBenef.ActivePage:=tsBenef;
  LbValor.Caption:='';
end;

end.
