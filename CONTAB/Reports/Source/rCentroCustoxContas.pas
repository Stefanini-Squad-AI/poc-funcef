{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit rCentroCustoxContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBClient, Provider, Db, ADODB, uCmRptManager, TXComp,
  CmParamReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc,
  DBTables, USistema, RRelatWeb, FCmReport, uCmSqlParams;

type
  TrptCentroCustoxContas = class(TFrmCmReport)
    dsCCConta: TwwDataSource;
    pplCCConta: TppBDEPipeline;
    rptCCConta: TppReport;
    ppHeaderBand5: TppHeaderBand;
    pplblTituloCCConta: TppLabel;
    ppLine1: TppLine;
    pplblEmpresa: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLabel13: TppLabel;
    pplblFiltros: TppLabel;
    rptCCContaLabel1: TppLabel;
    rptCCContaLabel2: TppLabel;
    rptCCContaLabel3: TppLabel;
    rptCCContaLabel4: TppLabel;
    ppDetailBand5: TppDetailBand;
    dbtxtCCConta: TppDBText;
    ppDBText21: TppDBText;
    rptCCContaDBText1: TppDBText;
    rptCCContaDBText2: TppDBText;
    rptCCContaDBText4: TppDBText;
    rptCCContaDBText5: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine58: TppLine;
    ppLabel15: TppLabel;
    rptCCContaLabel5: TppLabel;
    lblContCCCo: TppLabel;
    ppCalc4: TppSystemVariable;
    lblCalcCCCo: TppSystemVariable;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLabel51: TppLabel;
    dbtxtCCCCusto: TppDBText;
    ppDBText46: TppDBText;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppGroupFooterBand10: TppGroupFooterBand;
    CdsCCConta: TClientDataSet;
    sqlCConta: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand5BeforePrint(Sender: TObject);
    procedure ppFooterBand4BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand10BeforePrint(Sender: TObject);
  private
    { Private declarations }
    iPagIni,iPlano : integer;
    sMascara       : String;
    sMascaraCCusto : String;
  public
    { Public declarations }
  end;

implementation

uses uModulo,uFuncaoGeral;
{$R *.DFM}

procedure TrptCentroCustoxContas.CrmRptCMBeforePrint(Sender: TObject);
var
   sTitulo : String;
begin
  inherited;
  iPlano  := Modulo.iPlano;

   sTitulo := '';
   iPagIni := CmpRptCm.ParamValues[6].AsInteger;

   if trim(CmpRptCm.ParamValues[0].AsString) <> '' then
      sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + CmpRptCm.ParamValues[0].AsString;
   if trim(CmpRptCm.ParamValues[1].AsString) <> '' then
      sTitulo := sTitulo +  '     Centro de Custo Final : ' + CmpRptCm.ParamValues[1].AsString;
   pplblFiltros.caption := sTitulo;

   //Configura a quebra de página
   if CmpRptCm.ParamValues[5].AsBoolean then
      rptCCConta.Groups[0].NewPage := True
   else
      rptCCConta.Groups[0].NewPage := False;

   With sqlCConta.Sql Do
   Begin
     Clear;
     Add('SELECT                                                 ');
     Add('   C.PLACONTA, CC.CODEXTERNO AS CODCENTROCUSTO, C.PLANOME,           ');
     Add('   C.PLAGRAU, CC.NOME, C.PLAINATIVA, C.PLAINATIVA AS ATIVA, C.PLATIPO,        ');
     Add('   C.PLAREDUZ, C.PLANATUREZA, C.PLACONCORRESP          ');
     Add('FROM                                                   ');
     Add('   PLANOCONTA C, CONTASXCC CX, CENTCUST CC             ');
     Add('WHERE                                                  ');
     Add('    ((C.PLANO = CX.PLANO) AND (C.PLACONTA = CX.PLACONTA))');
     Add('    AND ((CX.CODCENTROCUSTO = CC.CODCENTROCUSTO)       ');
     Add('    AND (CX.IDEMPRESA = CC.IDEMPRESA))                 ');

      //Bruno Bastos - Pend. 15346 - 14/12/2004 - Início
      Add(' AND ((CC.ATIVO           = ''S'') OR            ');
      Add('     (CC.ATIVO          IS NULL)) AND            ');
      Add('     (C.PLACCUST         = ''S'')                ');
      //Bruno Bastos - Pend. 15346 - 14/12/2004 - Fim

     Add('    AND (C.PLANO = ' + IntToStr(iPlano) + ')'             );
     Add('    AND (CX.IDEMPRESA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ')');
     if not CmpRptCm.ParamValues[0].IsNull then
        Add(' AND (RTRIM(CX.CODCENTROCUSTO) >= ' + QuotedStr(Trim(CmpRptCm.ParamValues[0].AsString)) + ')');
     if not CmpRptCm.ParamValues[1].IsNull then
        Add(' AND (RTRIM(CX.CODCENTROCUSTO) <= ' + QuotedStr(Trim(CmpRptCm.ParamValues[1].AsString)) + ')');
     if not CmpRptCm.ParamValues[2].IsNull then
        Add(' AND  (RTRIM(C.PLACONTA) >= ' + QuotedStr(Trim(CmpRptCm.ParamValues[2].AsString)) + ')');
     if not CmpRptCm.ParamValues[3].IsNull then
        Add(' AND  (RTRIM(C.PLACONTA) <= ' + QuotedStr(Trim(CmpRptCm.ParamValues[3].AsString)) + ')');
     Add('ORDER BY                                          ');
     Add('    CODCENTROCUSTO, C.PLACONTA                 ');

     { Verifica o tipo de conexão e atribui o TStrings a respectiva Query }

     If CdsCCConta.Active Then CdsCCConta.Close;
     sqlCConta.Open;
   end;

   sMascara       := '';
   sMascaraCCusto := '';

   if CmpRptCm.ParamValues[4].AsBoolean then
   begin
      sMascara       := modulo.sMascaraContas;
      sMascaraCCusto := modulo.sMascaraCCusto;
   end;
end;

procedure TrptCentroCustoxContas.ppDetailBand5BeforePrint(Sender: TObject);
begin
  inherited;
   if sMascara <> '' then begin
      sMascara := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas, CdsCCConta.FieldByName('PLAGRAU').asInteger);
      dbtxtCCConta.DisplayFormat := sMascara + ';0; ';
   end;
end;

procedure TrptCentroCustoxContas.ppFooterBand4BeforePrint(Sender: TObject);
begin
  inherited;
  lblContCCCo.Caption := IntToStr((iPagIni + StrToInt(lblCalcCCCo.text)) - 1);
end;

procedure TrptCentroCustoxContas.ppGroupHeaderBand10BeforePrint(
  Sender: TObject);
begin
  inherited;
  //Configura a máscara das contas contábeis
  if sMascaraCCusto <> '' then begin
     sMascaraCCusto := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraCCusto, FuncaoGeral.CalcGrau(sMascaraCCusto, CdsCCConta.FieldByName('CODCENTROCUSTO').asString));
     dbtxtCCCCusto.DisplayFormat := sMascaraCCusto + ';0; ';
  end;
end;

end.
