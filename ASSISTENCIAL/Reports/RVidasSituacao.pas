unit RVidasSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Provider,
  DBTables, Wwquery, Db, DBClient, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppPrnabl,
  JclStrings,
  Grids, DBGrids, ppVar;

type
  TRptVidasSituacao = class(TFrmCmReport)
    Report: TppReport;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    Query: TwwQuery;
    Provider: TDataSetProvider;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage19: TppDBImage;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppLabel113: TppLabel;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText193: TppDBText;
    ppDBText194: TppDBText;
    ppLine34: TppLine;
    ppDBText1: TppDBText;
    ClientDataSetMATRICULA: TStringField;
    ClientDataSetNOME: TStringField;
    ClientDataSetNUMDOCUMENTO: TStringField;
    ClientDataSetDATANASC: TDateTimeField;
    ClientDataSetDESCRICAO: TStringField;
    ClientDataSetNOMEPATRO: TStringField;
    ClientDataSetNOMEVALORBASE1: TStringField;
    ClientDataSetNOMEVALORBASE2: TStringField;
    ClientDataSetNOMEVALORBASE3: TStringField;
    ClientDataSetNOMEVALORBASE4: TStringField;
    ClientDataSetNOMEVALORBASE5: TStringField;
    ClientDataSetNOMEVALORBASE6: TStringField;
    ClientDataSetNOMEVALORBASE7: TStringField;
    ClientDataSetNOMEVALORBASE8: TStringField;
    ClientDataSetMES: TStringField;
    ClientDataSetMESCOBRANCA: TStringField;
    ClientDataSetVALORBASE1: TFloatField;
    ClientDataSetVALORBASE2: TFloatField;
    ClientDataSetVALORBASE3: TFloatField;
    ClientDataSetVALORBASE4: TFloatField;
    ClientDataSetVALORBASE5: TFloatField;
    ClientDataSetVALORBASE6: TFloatField;
    ClientDataSetVALORBASE7: TFloatField;
    ClientDataSetVALORBASE8: TFloatField;
    Pipeline: TppBDEPipeline;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText11: TppDBText;
    ppLine1: TppLine;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLabelSistema: TppLabel;
    ppCalc39: TppSystemVariable;
    ppCalc40: TppSystemVariable;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  RptVidasSituacao: TRptVidasSituacao;

implementation

{$R *.DFM}

procedure TRptVidasSituacao.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSQL, sSQLFiltro  : String;
begin
  inherited;

  sSQL := 'SELECT '+
          '  ELG.MATRICULA, '+
          '  PES.NOME, PES.NUMDOCUMENTO, '+
          '  PSF.DATANASC, '+
          '  STP.DESCRICAO, '+
          '  PESPTR.NOME AS NOMEPATRO, '+
          '  PLS.NOMEVALORBASE1, PLS.NOMEVALORBASE2, PLS.NOMEVALORBASE3, PLS.NOMEVALORBASE4, '+
          '  PLS.NOMEVALORBASE5, PLS.NOMEVALORBASE6, PLS.NOMEVALORBASE7, PLS.NOMEVALORBASE8, '+

          '  HST.MES, 	    HST.MESCOBRANCA, '+
          '  HST.VALORBASE1, HST.VALORBASE2, HST.VALORBASE3, HST.VALORBASE4, '+
          '  HST.VALORBASE5, HST.VALORBASE6, HST.VALORBASE7, HST.VALORBASE8 '+

          'FROM '+
          '  ELEGPATRO ELG, PARTPREVPLAN PPP, PESSOA PES, PESSOAFISICA PSF, '+
          '  PATRO PTR,     PESSOA PESPTR,    SITPART STP, PLANPREV PLN, '+
          '  PARTASS PTS,   PLANASS PLS,      HSTCONTRIBASS HST '+
          'WHERE ';


  sSQLFiltro := '';

  If ( Trim( CmpRptCM.ParamValues[0].AsString ) <> '-1' )
  Then sSQLFiltro := sSQLFiltro + ' HST.MES = ' + QuotedStr( Trim( CmpRptCM.ParamValues[1].AsString ) + '/'+
                                                             StrPadLeft( IntToStr( CmpRptCM.ParamValues[0].AsInteger + 1 ), 2, '0' ) ) + ' AND ';

  If ( Trim( CmpRptCM.ParamValues[2].AsString ) <> '-1' )
  Then sSQLFiltro := sSQLFiltro + ' HST.MESCOBRANCA = ' + QuotedStr( Trim( CmpRptCM.ParamValues[3].AsString )   + '/'+
                                                             StrPadLeft( IntToStr( CmpRptCM.ParamValues[2].AsInteger + 1 ), 2, '0' ) ) + ' AND ';

  If ( Trim( CmpRptCM.ParamValues[4].AsString ) <> '' )
  Then sSQLFiltro := sSQLFiltro + ' ELG.MATRICULA = ' + QuotedStr( Trim( CmpRptCM.ParamValues[4].AsString ) ) + ' AND ';

  If ( Trim( CmpRptCM.ParamValues[5].AsString ) <> '' )
  Then sSQLFiltro := sSQLFiltro + ' ELG.IDPESSJUR = ' + Trim( CmpRptCM.ParamValues[5].AsString ) + ' AND ';

  If ( Trim( CmpRptCM.ParamValues[6].AsString ) <> '' )
  Then sSQLFiltro := sSQLFiltro + ' STP.IDSITPART = ' + Trim( CmpRptCM.ParamValues[6].AsString ) + ' AND ';


  sSQL := sSQL + sSQLFiltro +

          '      ( NVL( PTS.FLGINSCRICAOCANC, 0) = 0 ) '+

          '  AND ( ELG.IDPESSOA  = PPP.IDPESSOA ) '+
          '  AND ( ELG.IDPESSJUR = PPP.IDPESSJUR ) '+

          '  AND ( ELG.IDPESSOA  = PES.IDPESSOA ) '+

          '  AND ( PES.IDPESSOA  = PSF.IDPESSOA ) '+

          '  AND ( ELG.IDPESSJUR = PTR.IDPESSOA ) '+

          '  AND ( PTR.IDPESSOA  = PESPTR.IDPESSOA ) '+

          '  AND ( PPP.IDPLANOPREV = PLN.IDPLANOPREV ) '+
          '  AND ( PPP.IDSITPART   = STP.IDSITPART ) '+

          '  AND ( ELG.IDPESSOA    = PTS.IDPESSOA ) '+
          '  AND ( ELG.IDPESSJUR   = PTS.IDPESSJUR ) '+
          '  AND ( PPP.IDPLANOPREV = PTS.IDPLANOPREV ) '+
          '  AND ( PPP.SEQPROPOSTA = PTS.SEQPROPOSTA ) '+

          '  AND ( PTS.IDPLANASS   = PLS.IDPLANASS ) '+

          '  AND ( PTS.IDPESSOA    = HST.IDDEPENDENTE) '+
          '  AND ( PTS.IDPESSJUR   = HST.IDPESSJUR ) '+
          '  AND ( PTS.IDPLANOPREV = HST.IDPLANOPREV ) '+
          '  AND ( PTS.SEQPROPOSTA = HST.SEQPROPOSTA ) '+
          '  AND ( PTS.IDPLANASS   = HST.IDPLANASS ) ';

  ClientDataSet.Close;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add( sSQL );

  ClientDataSet.Open;


end;

end.
