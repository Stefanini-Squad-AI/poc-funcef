unit URelatoriosAtuariais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppProd, ppClass, ppReport, ppComm, ppCache, ppDB, ppTxPipe, ppBands,
  ppPrnabl, ppCtrls, Db, Wwdatsrc, DBTables, Wwquery, ppDBBDE, ppStrtch,
  ppSubRpt, ppEndUsr, ppVar, ppDBPipe, ppRelatv;

type
  TDmRelatoriosAtuariais = class(TDataModule)
    ppHistorico: TppReport;
    pplSimulacoes: TppBDEPipeline;
    pplHipoteses: TppBDEPipeline;
    RQrySimulacoes: TwwQuery;
    RQryHipoteses: TwwQuery;
    DsSimulacoes: TwwDataSource;
    DsHipoteses: TwwDataSource;
    ppHistoricoDBText1: TppDBText;
    ppHistoricoDBText2: TppDBText;
    RQryRegras: TwwQuery;
    DsRegras: TwwDataSource;
    pplRegras: TppBDEPipeline;
    ppHistoricoSubReport1: TppSubReport;
    ppHistoricoChildReport1TitleBand1: TppTitleBand;
    ppHistoricoChildReport1DetailBand1: TppDetailBand;
    ppHistoricoChildReport1DBText1: TppDBText;
    ppHistoricoChildReport1DBText2: TppDBText;
    ppHistoricoChildReport1DBText3: TppDBText;
    ppHistoricoDBText3: TppDBText;
    ppHistoricoDBText4: TppDBText;
    ppHistoricoDBText5: TppDBText;
    ppHistoricoDBText6: TppDBText;
    ppHistoricoDBText7: TppDBText;
    ppHistoricoDBText8: TppDBText;
    ppHistoricoDBText9: TppDBText;
    ppHistoricoDBText10: TppDBText;
    ppHistoricoDBText11: TppDBText;
    ppHistoricoDBText12: TppDBText;
    ppHistoricoLabel1: TppLabel;
    ppHistoricoLabel2: TppLabel;
    ppHistoricoDBText13: TppDBText;
    ppHistoricoLabel3: TppLabel;
    ppHistoricoLabel4: TppLabel;
    ppHistoricoLabel5: TppLabel;
    ppHistoricoLabel6: TppLabel;
    ppHistoricoLabel7: TppLabel;
    ppHistoricoLabel8: TppLabel;
    ppHistoricoLabel9: TppLabel;
    ppHistoricoShape1: TppShape;
    ppHistoricoShape2: TppShape;
    ppHistoricoLine1: TppLine;
    ppHistoricoLabel10: TppLabel;
    ppHistoricoLabel11: TppLabel;
    ppHistoricoLabel12: TppLabel;
    ppHistoricoChildReport1Label1: TppLabel;
    ppHistoricoChildReport1Label2: TppLabel;
    ppHistoricoChildReport1Label3: TppLabel;
    ppHistoricoChildReport1Label4: TppLabel;
    ppHistoricoChildReport1Line1: TppLine;
    ppHistoricoChildReport1Line2: TppLine;
    ppHistoricoChildReport1Line3: TppLine;
    RLNome: TppLabel;
    ppHistoricoChildReport1Shape1: TppShape;
    ppHistoricoShape3: TppShape;
    ppHistoricoLabel13: TppLabel;
    ppHistoricoDBText14: TppDBText;
    TabelaTXT: TTable;
    DSTabTXT: TDataSource;
    BDRelat: TppBDEPipeline;
    RelTXT: TppReport;
    RelTXTHeaderBand1: TppHeaderBand;
    RelTXTDetailBand1: TppDetailBand;
    RelTXTFooterBand1: TppFooterBand;
    Design: TppDesigner;
    ppHistoricoChildReport1Calc2: TppSystemVariable;
    ppHistoricoChildReport1Calc1: TppSystemVariable;
    ppHistoricoChildReport1Calc3: TppSystemVariable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatoriosAtuariais: TDmRelatoriosAtuariais;wSomaF1,wSomaF2:Extended;

implementation

Uses UBibliotecaAtuarial;
{$R *.DFM}
//-------------------------------------------------------------
// Soma Totais

//--------------------------------------------------------------
// Imprime Totais





end.
