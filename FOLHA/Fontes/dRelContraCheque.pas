// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qrydemonstpag filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit dRelContraCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppDB, Db, ppModule, raCodMod, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, uSistema;

type
  TdtmRelContraCheque = class(TdtmReports)
    dsdemonstpag: TwwDataSource;
    qrydemonstpag: TwwQuery;
    ppdemonstpag: TppBDEPipeline;
    rpdemonstpag: TppReport;
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
    qryDataInicio: TwwQuery;
    ppHeaderBandRel: TppHeaderBand;
    ppShape1: TppShape;
    pplTituloRelat: TppLabel;
    ppdbNomeFundacao: TppDBText;
    ppdbCepFund: TppDBText;
    ppdbRazaoSocial: TppDBText;
    ppdbImagem: TppDBImage;
    ppdbEnderecoFund: TppDBText;
    ppdbBarIDUF: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDetailBand22: TppDetailBand;
    ppRectRubricas: TppShape;
    ppdbDescricaoRub: TppDBText;
    ppdbValorRubrica: TppDBText;
    ppdbCodigoRub: TppDBText;
    ppdbMesRub: TppDBText;
    ppLabelDataInicio: TppLabel;
    VarResiduo: TppVariable;
    ppFooterBand: TppFooterBand;
    ppLine38: TppLine;
    ppLabelSistema: TppLabel;
    ppCalc33: TppSystemVariable;
    ppCalc34: TppSystemVariable;
    rpdemonstpagSummaryBand1: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppRectDados: TppShape;
    pplNome: TppLabel;
    pplDataNasc: TppLabel;
    pplMatricula: TppLabel;
    pplEndereco: TppLabel;
    pplInscricao: TppLabel;
    ppdbNome: TppDBText;
    ppdbLogra: TppDBText;
    ppDBText44: TppDBText;
    pplBairro: TppLabel;
    ppdbBairro: TppDBText;
    pplCidade: TppLabel;
    pplNumDep: TppLabel;
    ppdbCidade: TppDBText;
    ppdbDatanasc: TppDBText;
    ppdbNumDep: TppDBText;
    pplEstado: TppLabel;
    ppdbEstado: TppDBText;
    pplCEP: TppLabel;
    ppdbCep: TppDBText;
    ppDBText52: TppDBText;
    ppdbmespag: TppDBText;
    pplMesPagto: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppGroupFooterBandTotal: TppGroupFooterBand;
    ppRectTotal: TppShape;
    pplTotalProvento: TppLabel;
    pplTotalDesconto: TppLabel;
    pplLiquido: TppLabel;
    pplBanco: TppLabel;
    pplAgencia: TppLabel;
    pplContaCorrente: TppLabel;
    ppdbProvento: TppDBCalc;
    ppdbDesconto: TppDBCalc;
    ppdbBanco: TppDBText;
    ppdbAgencia: TppDBText;
    ppdbContaCorrente: TppDBText;
    pplValorLiquido: TppLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLbTotalResiduo: TppLabel;
    ppDBCalcTotalResiduo: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppRectCabecRubricas: TppShape;
    ppDbTextPD: TppDBText;
    pplCodigoRub: TppLabel;
    pplDescricaoRub: TppLabel;
    pplValorRubrica: TppLabel;
    pplMesRub: TppLabel;
    ppLbDataInicio: TppLabel;
    ppLabelResiduo: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    procedure NomePatroPrint(Sender: TObject);
    procedure LblEmpresaPrint(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    function MostraParam(Form: string): boolean; override;
    procedure qrydemonstpagBeforeOpen(DataSet: TDataSet);
    procedure qrydemonstpagBeforeClose(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure rpdemonstpagSummaryBand1AfterPrint(Sender: TObject);
    procedure pplValorLiquidoPrint(Sender: TObject);
    procedure ppLabelDataInicioPrint(Sender: TObject);
    procedure ppLbDataInicioGetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
    pIdFundacao: integer;
    procedure Procura;

  public
    { Public declarations }
    procedure pAbreFundacao;
    procedure pFechaFundacao;
  end;

var
  dtmRelContraCheque: TdtmRelContraCheque;

implementation

Uses FPRelContraCheque, fAguarde;

{$R *.DFM}

{ TdtmRelContraCheque }

procedure TdtmRelContraCheque.FormCreate(Sender: TObject);
begin
  pIdFundacao         := Sistema.IdEmpresa;
  ppLabelSistema.Text := Sistema.NomeAplicativo;
end;

procedure TdtmRelContraCheque.LblEmpresaPrint(Sender: TObject);
begin
  //Impressão do Nome da Empresa No Cabeçalho do Relatório
  (Sender as TppLabel).Caption := Sistema.NomeEmpresa;
end;

procedure TdtmRelContraCheque.LblSistemaPrint(Sender: TObject);
begin
  //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
  (Sender as TppLabel).Caption:= Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

function TdtmRelContraCheque.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  If UpperCase(Form) = 'FRMPRELCONTRACHEQUE' Then
    Frm := TfrmPRelContraCheque.Create(Application)
  Else
    Frm := Nil;

  If Frm = Nil Then
    Result := True
  Else Begin
    With Frm Do Begin
      Result := (ShowModal = mrOk);
      Free;
    End;
  End;
end;

procedure TdtmRelContraCheque.NomePatroPrint(Sender: TObject);
begin
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelContraCheque.pAbreFundacao;
begin
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger:= pIdFundacao;
  qryFundacao.Open;
end;

procedure TdtmRelContraCheque.pFechaFundacao;
begin
  qryFundacao.Close;
end;

procedure TdtmRelContraCheque.ppLabelDataInicioPrint(Sender: TObject);
begin
  Procura;
end;

procedure TdtmRelContraCheque.ppLbDataInicioGetText(Sender: TObject;
  var Text: String);
begin
  If ppDbTextPD.Text = 'DESCONTO' Then Text := ''
  Else Text := 'Data Início';
end;

procedure TdtmRelContraCheque.pplValorLiquidoPrint(Sender: TObject);
begin
  pplValorLiquido.Caption := FormatFloat('#,##0.00', ppdbProvento.Value - ppdbDesconto.Value);
end;

procedure TdtmRelContraCheque.Procura;
begin
  If ppDemonstPag['FLGDESCONTO'] = '0' then
  begin
    qryDataInicio.Close;
    qryDataInicio.ParamByName('IDRUBRICA').AsInteger     := StrToIntDef(ppDemonstPag['IDPROVENTO'],0);
    qryDataInicio.ParamByName('IDPLANOPREV').AsInteger   := StrToIntDef(ppDemonstPag['IDPLANOPREV'],0);
    qryDataInicio.ParamByName('IDRESPONSAVEL').AsInteger := StrToIntDef(ppDemonstPag['IDRESPONSAVEL'],0);
    qryDataInicio.ParamByName('IDPESSJUR').AsInteger     := StrToIntDef(ppDemonstPag['IDPESSJUR'],0);
    qryDataInicio.Open;
    ppLbDataInicio.Caption                               := 'Data Início';
    ppLabelDataInicio.Caption                            := qryDataInicio.FieldByName('DATAINICIO').AsString;
  End Else ppLabelDataInicio.Caption                     := '';
end;

procedure TdtmRelContraCheque.qrydemonstpagBeforeClose(DataSet: TDataSet);
begin
  pFechaFundacao;
end;

procedure TdtmRelContraCheque.qrydemonstpagBeforeOpen(DataSet: TDataSet);
begin
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRelContraCheque.rpdemonstpagSummaryBand1AfterPrint(
  Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
