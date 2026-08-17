unit rRecebimento;

{-------------------------------------------------------------------------------
 Data       : 23.07.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 24854
 Descrição  : Corrige o total de recebimento. Não estava considerando o fornecedor
              mesmo que estive selecionado.
---------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppCtrls, ppClass, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uCmSqlParams, uCmRptManager, TXComp,
  CmParamReport, DBTables, Wwquery, MontaSelect, TXRB;

type
  TRptRecebimento = class(TFrmCmReport)
    SqlParRecebimento: TCMSqlParams;
    CdsRecebimento: TCMClientDataSet;
    dsRecebimento: TwwDataSource;
    pplRecebimento: TppBDEPipeline;
    rpRecebimento: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    LblEmpresa: TppLabel;
    LbPeriodo: TppLabel;
    rpRecebimentoLabel1: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppReport1DBText3: TppDBText;
    ppReport1DBText4: TppDBText;
    ppReport1DBText5: TppDBText;
    ppReport1DBText6: TppDBText;
    rpRecebimentoDBText1: TppDBText;
    rpRecebimentoDBText2: TppDBText;
    rpRecebimentoDBText3: TppDBText;
    rpRecebimentoDBText7: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    LbSistema: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    rpRecebimentoLine2: TppLine;
    rpRecebimentoLine3: TppLine;
    rpRecebimentoLabel10: TppLabel;
    rpRecebimentoDBText5: TppDBText;
    rpRecebimentoLabel3: TppLabel;
    rpRecebimentoDBCalc1: TppDBCalc;
    rpRecebimentoDBCalc5: TppDBCalc;
    rpRecebimentoDBCalc7: TppDBCalc;
    ppReport1Group1: TppGroup;
    ppReport1GroupHeaderBand1: TppGroupHeaderBand;
    rpRecebimentoShape1: TppShape;
    ppReport1Label1: TppLabel;
    ppReport1DBText1: TppDBText;
    ppReport1GroupFooterBand1: TppGroupFooterBand;
    ppReport1Group2: TppGroup;
    ppReport1GroupHeaderBand2: TppGroupHeaderBand;
    ppReport1DBText2: TppDBText;
    ppReport1Label2: TppLabel;
    ppReport1Label3: TppLabel;
    ppReport1Label4: TppLabel;
    ppReport1Label6: TppLabel;
    rpRecebimentoLabel5: TppLabel;
    rpRecebimentoLabel6: TppLabel;
    rpRecebimentoLabel8: TppLabel;
    rpRecebimentoLabel9: TppLabel;
    rpRecebimentoLabel7: TppLabel;
    rpRecebimentoDBText4: TppDBText;
    rpRecebimentoLabel2: TppLabel;
    rpRecebimentoDBText6: TppDBText;
    rpRecebimentoLabel11: TppLabel;
    rpRecebimentoLabel12: TppLabel;
    rpRecebimentoDBText8: TppDBText;
    ppReport1GroupFooterBand2: TppGroupFooterBand;
    rpRecebimentoLabel4: TppLabel;
    rpRecebimentoDBCalc2: TppDBCalc;
    rpRecebimentoDBCalc3: TppDBCalc;
    rpRecebimentoDBCalc4: TppDBCalc;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    msForn: TMontaSelect;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure SqlParRecebimentoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptRecebimento: TRptRecebimento;
  sDestino: String;

implementation

{$R *.DFM}

Uses uSistema;

procedure TRptRecebimento.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlParRecebimento Do Begin
       Prepare;

       If CmpRptCM.ParamValues[ 5 ].AsBoolean Then
          sDestino := QuotedStr( 'E' ) + ','
       Else
          sDestino := '';

       If CmpRptCM.ParamValues[ 6 ].AsBoolean Then
          sDestino := sDestino + QuotedStr( 'A' ) + ',';

       If CmpRptCM.ParamValues[ 7 ].AsBoolean Then
          sDestino := sDestino + QuotedStr( 'C' ) + ',';

       If sDestino <> '' Then
          sDestino := Copy( sDestino, 1, Length( sDestino ) - 1 )
       Else
          ParamByName( 'Destino' ).ClearLine;

       If CmpRptCM.ParamValues[ 2 ].IsNull Then
          ParamByName( 'Almox' ).ClearLine;


       // insere no subselect da sqlParRecebimento o fornecedor selecionado.
       If CmpRptCM.ParamValues[ 3 ].IsNull Then
          ParamByName( 'Fornecedor' ).ClearLine
       else
          SqlParRecebimento.SQL.Insert(31, 'AND (IDFORCLI = ' + CmpRptCM.ParamValues[ 3 ].AsString + ')');

       If Not CmpRptCM.ParamValues[ 8 ].AsBoolean Then
          ParamByName( 'Estoque' ).ClearLine;

       ParamByName( 'DataIni' ).AsDate    := CmpRptCM.ParamValues[ 0 ].AsDateTime;
       ParamByName( 'DataFim' ).AsDate    := CmpRptCM.ParamValues[ 1 ].AsDateTime;
       ParamByName( 'IdEmpresa' ).AsFloat := CrmRptCM.IdEmpresa;

       If Not CmpRptCM.ParamValues[ 2 ].IsNull Then
          ParamByName( 'Almox' ).AsString := CmpRptCM.ParamValues[ 2 ].AsString;

       If Not CmpRptCM.ParamValues[ 3 ].IsNull Then
          ParamByName( 'Fornecedor' ).AsString := CmpRptCM.ParamValues[ 3 ].AsString;

       If CmpRptCM.ParamValues[ 8 ].AsBoolean Then
          ParamByName( 'Estoque' ).AsString  := 'S';

       Open;
  End;

  lbPeriodo.Caption := 'De ' + CmpRptCM.ParamValues[ 0 ].AsString + ' a ' + CmpRptCM.ParamValues[ 1 ].AsString;
end;

procedure TRptRecebimento.SqlParRecebimentoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  If UpperCase( sParamName ) = 'TIPO1' Then
     Case CmpRptCM.ParamValues[ 4 ].AsInteger of
          0: sNewValue := 'DECODE( NF.CODDOCUMENTO, NULL, ''NÃO INTEGRADA'', TD.DESCRICAO )';
          1: sNewValue := 'TD.DESCRICAO';
          2: sNewValue := '( ''NÃO INTEGRADA'' )';
     End
  Else
  If UpperCase( sParamName ) = 'TIPO2' Then Begin
     if CmpRptCM.ParamValues[ 4 ].AsInteger  < 2 then
        sNewValue := 'DOCUMENTO D,TIPODOCRECPAG TD'
     else
        sNewValue := 'DOCUMENTO D';
  End Else
  If UpperCase( sParamName ) = 'TIPO3' Then
     Case CmpRptCM.ParamValues[ 4 ].AsInteger of
          0: sNewValue := 'AND ( D.CODTIPDOC = TD.CODTIPDOC(+) ) ';
          1: sNewValue := 'AND ( D.CODTIPDOC = TD.CODTIPDOC ) AND ( NF.CODDOCUMENTO IS NOT NULL ) ';
          2: sNewValue := 'AND ( NF.CODDOCUMENTO IS NULL )';
     End
  Else
  If UpperCase( sParamName ) = 'DESTINO' Then
     sNewValue := sDestino
  Else
  If UpperCase( sParamName ) = 'ORDEM' Then
     Case CmpRptCM.ParamValues[ 9 ].AsInteger of
          0: sNewValue := 'DATAEMISNF, FORNECEDOR, NF.NUMNF, IT.IDITENSRECDEV';
          1: sNewValue := 'DATAEMISNF, NF.NUMNF, FORNECEDOR, IT.IDITENSRECDEV';
          2: sNewValue := 'DATAEMISNF, DATAPROGRAMADA,FORNECEDOR,NF.NUMNF, IT.IDITENSRECDEV';
     End;
end;

procedure TRptRecebimento.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  msForn.Filtro.Add('EMPRESAFORN.IDPESSOA = '+FloatToStr( CrmRptCM.idEmpresa ));
  CmpRptCM.ParamByName('ALMOXARIFADO').LookupSettings.SQL.Text := 'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE IDPESSOA = ' + FloatToStr( CrmRptCM.idEmpresa ) + ' ORDER BY 2';
  CmpRptCM.ParamByName('DATAINICIAL').TextDefault := DateToStr( Date );
  CmpRptCM.ParamByName('DATAFINAL').TextDefault   := DateToStr( Date );
end;

end.

