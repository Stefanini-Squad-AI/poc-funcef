unit rCadSolPrePronta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  uCmRptManager, TXComp, CmParamReport, DBClient, uCMClientDataSet,
  uCmSqlParams;

type
  TRptCadSolPrePronta = class(TFrmCmReport)
    dsCadSolPrePronta: TwwDataSource;
    bdeCadSolPrePronta: TppBDEPipeline;
    RptCadSolPrePronta: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel27: TppLabel;
    ppLine22: TppLine;
    LblEmpresa: TppLabel;
    RptCadPreProntaDBText1: TppDBText;
    RptCadPreProntaLine1: TppLine;
    RptCadPreProntaLabel1: TppLabel;
    RptCadPreProntaLabel2: TppLabel;
    RptCadPreProntaLabel3: TppLabel;
    RptCadPreProntaLabel4: TppLabel;
    ppDetailBand12: TppDetailBand;
    RptCadPreProntaDBText2: TppDBText;
    RptCadPreProntaDBText3: TppDBText;
    RptCadPreProntaDBText4: TppDBText;
    RptCadPreProntaDBText6: TppDBText;
    RptCadPreProntaDBText5: TppDBText;
    RptCadPreProntaDBText7: TppDBText;
    RptCadPreProntaLine3: TppLine;
    ppFooterBand12: TppFooterBand;
    ppLine24: TppLine;
    LblSistema: TppLabel;
    ppCalc22: TppSystemVariable;
    ppCalc23: TppSystemVariable;
    RptCadPreProntaGroup2: TppGroup;
    RptCadPreProntaGroupHeaderBand2: TppGroupHeaderBand;
    RptCadPreProntaGroupFooterBand2: TppGroupFooterBand;
    RptCadSolPreProntaGroup1: TppGroup;
    RptCadSolPreProntaGroupHeaderBand1: TppGroupHeaderBand;
    RptCadPreProntaLine2: TppLine;
    RptCadPreProntaDBText8: TppDBText;
    RptCadPreProntaDBText9: TppDBText;
    RptCadPreProntaLine4: TppLine;
    RptCadSolPreProntaGroupFooterBand1: TppGroupFooterBand;
    SqlCadSolPrePronta: TCMSqlParams;
    CdsCadSolPrePronta: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCadSolPrePronta: TRptCadSolPrePronta;

implementation

{$R *.DFM}

procedure TRptCadSolPrePronta.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  With SqlCadSolPrePronta Do Begin
       Close;
       Sql.Text := 'SELECT I.IDSCPREPRONTA, ' +
                          'S.DESCSCPREPRONTA, ' +
                          'G.CODGRUPOPROD, ' +
                          'G.DESCGRUPOPROD, ' +
                          'I.CODARTIGO, ' +
                          '( P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO ) AS DESCRICAO, ' +
                          'SA.SALDOQTDE, ' +
                          'I.QTDEPESSOA, ' +
                          'I.CODMEDIDA, ' +
                          'P.CODMEDCUSTO AS UNIDSALDO ' +
                     'FROM SCPREPRONTA S, ' +
                          'ITEMSCPREPRONTA I, ' +
                          'ARTIGO A, ' +
                          'PRODUTO P, ' +
                          'GRUPPROD G, ' +
                          'SALDO SA ' +
                    'WHERE ( S.IDSCPREPRONTA = I.IDSCPREPRONTA ) ';

       If Not CmpRptCM.ParamValues[ 0 ].IsNull Then 
          Sql.Add('   AND ( I.IDSCPREPRONTA = ' + CmpRptCM.ParamValues[ 0 ].AsString + ' ) ');

       Sql.Add(  'AND ( I.CODARTIGO = A.CODARTIGO ) ' +
                 'AND ( A.CODPRODUTO = P.CODPRODUTO ) ' +
                 'AND ( P.CODGRUPOPROD = G.CODGRUPOPROD ) ' +
                 'AND ( S.IDPESSOA = SA.IDPESSOA ) ' +
                 'AND ( S.CODALMOXARIFADO = SA.CODALMOXARIFADO ) ' +
                 'AND ( A.CODARTIGO = SA.CODARTIGO ) ' +
               'ORDER BY I.IDSCPREPRONTA, G.CODGRUPOPROD, DESCRICAO');
      Open;
  End;
end;

end.
