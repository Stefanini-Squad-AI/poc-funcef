unit dRelEntSaiFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppClass, ppReport, ppStrtch, ppSubRpt, ppVar,
  ppPrnabl, ppCache, ppProd, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  TdtmRelEntSaiFolha = class(TdtmReports)
    ppRelaEntSaiFolha: TppBDEPipeline;
    dsRelaEntSaiFolha: TwwDataSource;
    qryEntrada: TwwQuery;
    qryFundacao: TwwQuery;
    qryFundacaoNOME: TStringField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    qryFundacaoLOGRADOURO: TStringField;
    qryFundacaoNUMERO: TStringField;
    qryFundacaoCOMPLEMENTO: TStringField;
    qryFundacaoBAIRRO: TStringField;
    qryFundacaoCIDADE: TStringField;
    qryFundacaoCODESTADO: TStringField;
    qryFundacaoCEP: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoENDERECO: TStringField;
    qryFundacaoBARCIDUF: TStringField;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    qrySaida: TwwQuery;
    ppSaida: TppBDEPipeline;
    dsSaida: TwwDataSource;
    rpRelaEntSaiFolha: TppReport;
    ppHeaderBand11: TppHeaderBand;
    rpRelaEntSaiFolhaDBText1: TppDBText;
    rpRelaEntSaiFolhaDBText7: TppDBText;
    rpRelaEntSaiFolhaDBText8: TppDBText;
    rpRelaEntSaiFolhaDBText9: TppDBText;
    rpRelaEntSaiFolhaDBText10: TppDBText;
    ppLabel21: TppLabel;
    ppDetailBand12: TppDetailBand;
    rpRelaEntSaiFolhaDBText4: TppDBText;
    rpRelaEntSaiFolhaDBText6: TppDBText;
    ppDBText18: TppDBText;
    ppDBText22: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppFooterBand11: TppFooterBand;
    rpRelaEntSaiFolhaLabel2: TppLabel;
    rpRelaEntSaiFolhaLine2: TppLine;
    rpRelaEntSaiFolhaCalc1: TppSystemVariable;
    rpRelaEntSaiFolhaCalc2: TppSystemVariable;
    rpRelaEntSaiFolhaSummaryBand1: TppSummaryBand;
    rpRelaEntSaiFolhaSubReport1: TppSubReport;
    rpRelaEntSaiFolhaChildReport1: TppChildReport;
    rpRelaEntSaiFolhaChildReport1TitleBand1: TppTitleBand;
    rpRelaEntSaiFolhaChildReport1DetailBand1: TppDetailBand;
    rpRelaEntSaiFolhaChildReport1DBText2: TppDBText;
    rpRelaEntSaiFolhaChildReport1DBText3: TppDBText;
    ppDBText27: TppDBText;
    ppDBText36: TppDBText;
    rpRelaEntSaiFolhaChildReport1SummaryBand1: TppSummaryBand;
    rpRelaEntSaiFolhaChildReport1Group2: TppGroup;
    rpRelaEntSaiFolhaChildReport1GroupHeaderBand2: TppGroupHeaderBand;
    rpRelaEntSaiFolhaChildReport1Label1: TppLabel;
    rpRelaEntSaiFolhaChildReport1Line1: TppLine;
    rpRelaEntSaiFolhaChildReport1Label2: TppLabel;
    rpRelaEntSaiFolhaChildReport1Label3: TppLabel;
    rpRelaEntSaiFolhaChildReport1DBText1: TppDBText;
    rpRelaEntSaiFolhaChildReport1Line4: TppLine;
    ppLabel51: TppLabel;
    ppLabel93: TppLabel;
    rpRelaEntSaiFolhaChildReport1GroupFooterBand2: TppGroupFooterBand;
    pplblMesVersaoEnt: TppLabel;
    rpRelaEntSaiFolhaGroup2: TppGroup;
    rpRelaEntSaiFolhaGroupHeaderBand2: TppGroupHeaderBand;
    ppLine24: TppLine;
    rpRelaEntSaiFolhaLabel4: TppLabel;
    rpRelaEntSaiFolhaDBText5: TppDBText;
    rpRelaEntSaiFolhaLabel3: TppLabel;
    Valor: TppLabel;
    rpRelaEntSaiFolhaLine1: TppLine;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel165: TppLabel;
    ppLabel172: TppLabel;
    rpRelaEntSaiFolhaGroupFooterBand2: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBImage7: TppDBImage;
    pplblMostraMesVersaoEnt: TppLabel;
    pplblMesVersaoSai: TppLabel;
    pplblMostraMesVersaoSai: TppLabel;
    pplblEntrada: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    rpRelaEntSaiFolhaLabel5: TppLabel;
    ppdbQuantEntrada: TppDBCalc;
    rpRelaEntSaiFolhaDBCalc1: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    rpRelaEntSaiFolhaLine4: TppLine;
    rpRelaEntSaiFolhaChildReport1Label6: TppLabel;
    rpRelaEntSaiFolhaChildReport1Label7: TppLabel;
    rpRelaEntSaiFolhaChildReport1Line3: TppLine;
    ppdbQuantSaida: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    rpRelaEntSaiFolhaChildReport1DBCalc2: TppDBCalc;
    shpDetPrincipal: TppShape;
    shpDetSubRel: TppShape;
    pplblMostraZeroEntrada: TppLabel;
    pplblMostraZeroSaida: TppLabel;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    lblNomePlano: TppLabel;
    ppDBText7: TppDBText;
    lblPlanoSaida: TppLabel;
    ppDBText8: TppDBText;
    function MostraParam(Form: string): boolean; override;
    procedure pAbreFundacao;
    procedure rpRelaEntSaiFolhaBeforePrint(Sender: TObject);
    procedure shpDetPrincipalPrint(Sender: TObject);
    procedure rpRelaEntSaiFolhaStartPage(Sender: TObject);
  private
    { Private declarations }
    cMudaCor : TColor;
    MudaCor  : TColor;
    procedure SetColor(Cor: TColor);

  public
    { Public declarations }
    procedure pFechaFundacao;

  published
    property CorZebra: TColor read cMudacor write SetColor;

  end;

var
  dtmRelEntSaiFolha: TdtmRelEntSaiFolha;

implementation

Uses uAdmPrevFB, FAguarde, FPRelEntSaiFolha;

{$R *.DFM}

{ TdtmRelEntSaiFolha }

function TdtmRelEntSaiFolha.MostraParam(Form: string): boolean;
Var
  frm : TForm;

begin
  If UPPERCASE(Form) = 'FRMPRELENTSAIFOLHA' Then frm := TfrmPRelEntSaiFolha.Create(Application);
  If frm = Nil Then Result := True
  Else
  Begin
    With frm Do
    Begin
      Result := (ShowModal = mrOk);
      Free;
    End;
  End;
end;

procedure TdtmRelEntSaiFolha.pAbreFundacao;
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelEntSaiFolha.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelEntSaiFolha.rpRelaEntSaiFolhaBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelEntSaiFolha.shpDetPrincipalPrint(Sender: TObject);
begin
  inherited;
  if MudaCor = CorZebra Then
    MudaCor := clWhite
  else
    MudaCor := CorZebra;
  TppShape(Sender).Brush.Color := MudaCor;
end;

procedure TdtmRelEntSaiFolha.rpRelaEntSaiFolhaStartPage(Sender: TObject);
begin
  inherited;
  MudaCor := CorZebra;
  shpDetPrincipal.Brush.Color := clWhite;
  shpDetSubRel.Brush.Color    := clWhite;
end;

procedure TdtmRelEntSaiFolha.SetColor(Cor: TColor);
begin
  cMudaCor := Cor;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: DRELENTSAIFOLHA                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULO PARA O RELATÓRIO DE ENTRADA E SAÍDA DE BENEFÍCIOS              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/08/2003 A 11/08/2003                         |
| PENDÊNCIA: 14762                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR DATA FINAL PREVISTA NO RELATÓRIO DE ENTRADAS E SAÍDAS.             |
|                                                                              |
|------------------------------------------------------------------------------}

