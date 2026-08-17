// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RVara;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TRptVara = class(TFrmCmReport)
    rpVara: TppReport;
    rpVaraHdrBnd: TppHeaderBand;
    rpVaraLbl1: TppLabel;
    rpVaraLbl2: TppLabel;
    rpVaraLbl3: TppLabel;
    rpVaraLbl4: TppLabel;
    rpVaraLbl5: TppLabel;
    rpVaraLine1: TppLine;
    rpVaraDBTxt1: TppDBText;
    rpVaraSysVar1: TppSystemVariable;
    rpVaraSysVar2: TppSystemVariable;
    rpVaraDtlBnd: TppDetailBand;
    rpVaraDBTxt3: TppDBText;
    rpVaraDBTxt2: TppDBText;
    rpVaraFootBnd: TppFooterBand;
    rpVaraSmryBnd: TppSummaryBand;
    rpVaraGrp1: TppGroup;
    rpVaraGrpHdrBnd: TppGroupHeaderBand;
    rpVaraGrpFootBnd: TppGroupFooterBand;
    rpVaraLbl6: TppLabel;
    rpVaraDBCalc1: TppDBCalc;
    ppVara: TppBDEPipeline;
    dsVara: TwwDataSource;
    sqlVara: TCMSqlParams;
    CdsVara: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpVaraSmryBndBeforePrint(Sender: TObject);
  end;

var
  RptVara: TRptVara;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptVara.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlVara.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDVARAJUSTICA, DESCRICAO, CODESTADO AS UF, NOMEESTADO');
    Add('FROM');
    Add('  VARAJUSTICA, ESTADO');
    Add('WHERE');
    Add('  VARAJUSTICA.IDESTADO = ESTADO.IDESTADO(+)');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDVARAJUSTICA');
      1 : Add('  DESCRICAO');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlVara.Open;

  frmAguarde.Mostra('Listagem dos Órgãos Jurisdicionais (Varas)');
  frmAguarde.Pos := 0;
end;

procedure TRptVara.rpVaraSmryBndBeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

end.
