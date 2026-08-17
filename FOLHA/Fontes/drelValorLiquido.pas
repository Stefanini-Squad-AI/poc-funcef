{*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 230780 PPM 394759
SOL......: 230780
PPM......: 394759
Data.....: 14/07/2014
Descrição: Ajuste na emissão do relatório.
{*******************************************************************************
}
unit drelValorLiquido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppModule, raCodMod, StdCtrls;

type
  TDtmRelValorLiquido = class(TdtmReports)
    qryRelValorLiquido: TwwQuery;
    rpRelValorLiquido: TppReport;
    plRelValorLiquido: TppBDEPipeline;
    dsRelValorLiquido: TwwDataSource;
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
    ppHeaderBand27: TppHeaderBand;
    ppLabelTitulo: TppLabel;
    ppDbTextEmpresa: TppDBText;
    ppDbTextCep: TppDBText;
    ppDbTextRSocial: TppDBText;
    ppDbImageEmpresa: TppDBImage;
    ppDbTextEndereco: TppDBText;
    ppDbTextBairro: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabelVersao: TppLabel;
    ppLabelMatricula: TppLabel;
    ppLabelInsc: TppLabel;
    ppLabelRecebedor: TppLabel;
    ppLabelValorProvento: TppLabel;
    ppLabelValorRecebido: TppLabel;
    ppLabelVlLiquido: TppLabel;
    ppDetalhe: TppDetailBand;
    ppFooterBand27: TppFooterBand;
    ppLine62: TppLine;
    ppLabelNomeSistema: TppLabel;
    ppCalcPagina: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabelQuant: TppLabel;
    ppLabelTotais: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppdbQuantidade: TppDBCalc;
    ppDbTextMatricula: TppDBText;
    ppDBTextInsc: TppDBText;
    ppDbTextRecebedor: TppDBText;
    ppdbProvento: TppDBText;
    ppdbDesconto: TppDBText;
    ppdbliquido: TppDBText;
    ppShapeDetalhe: TppShape;
    procedure qryRelValorLiquidoAfterClose(DataSet: TDataSet);
    procedure qryRelValorLiquidoAfterOpen(DataSet: TDataSet);
    procedure qryRelValorLiquidoBeforeOpen(DataSet: TDataSet);
    procedure rpRelValorLiquidoBeforePrint(Sender: TObject);
    procedure ppShapeCorPrint(Sender: TObject);
    procedure rpRelValorLiquidoStartPage(Sender: TObject);
  private
    { Private declarations }
    cMudaCor : TColor;
    MudaCor  : TColor;
    procedure SetColor(Cor: TColor);
  public
    { Public declarations }
    dFaixaInicial,
    dFaixaFinal: Double;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    function MostraParam(Form: string): boolean; override;

  published
    property CorZebra: TColor read cMudaCor write SetColor;

  end;


var
  DtmRelValorLiquido: TDtmRelValorLiquido;

implementation

Uses
  uAdmPrev, uMensErro, fAguarde, FPRelValorLiquido;

{$R *.DFM}
function TDtmRelValorLiquido.MostraParam(Form: string): boolean;
 Var frm: TForm;
begin
  frm:=Nil;
  if UPPERCASE(Form) = 'FRMPRELVALORLIQUIDO' then
    frm := TFrmPRelValorLiquido.Create(Application);
  if frm = nil then Result := true
  else
  begin
    with frm do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TDtmRelValorLiquido.SetColor(Cor: TColor);
begin
  cMudaCor := Cor;
end;

procedure TDtmRelValorLiquido.pAbreFundacao;
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TDtmRelValorLiquido.pFechaFundacao;
begin
  inherited;
  qryFundacao.Close;
end;

procedure TDtmRelValorLiquido.qryRelValorLiquidoAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TDtmRelValorLiquido.qryRelValorLiquidoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TDtmRelValorLiquido.qryRelValorLiquidoBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TDtmRelValorLiquido.rpRelValorLiquidoBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

procedure TDtmRelValorLiquido.ppShapeCorPrint(Sender: TObject);
begin
  inherited;
  If MudaCor = CorZebra Then
    MudaCor := clWhite
  else
    MudaCor := CorZebra;
  TppShape(Sender).Brush.Color := MudaCor;
end;

procedure TDtmRelValorLiquido.rpRelValorLiquidoStartPage(Sender: TObject);
begin
  inherited;
  MudaCor := CorZebra;
  ppShapeDetalhe.Brush.Color := clWhite;  
end;

end.

{==============================================================================|
| UNIT: dRelValorLiquido                                                       |
| DESCRIÇÃO FUNCIONAL: Relatório de valores liquidos em uma determinada faixa. |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/11/2002 A 12/11/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Criação da Unit.                                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/01/2005 A 06/01/2005                         |
| PENDÊNCIA: 18283                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - RETIRAMOS O GRUPO DO IDRESPONSAVEL, POIS ESTAVA OMITINDO REGISTROS QUE     |
| ERAM SOMADOS NO TOTALIZADOR FINAL                                            |
|                                                                              |
|------------------------------------------------------------------------------}

