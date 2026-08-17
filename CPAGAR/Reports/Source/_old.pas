unit RPosicaoLotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  uCmSqlParams, DBClient, uCMClientDataSet, uCmRptManager, TXComp, TXRB,
  CmParamReport;

type
  TRptPosicaoLotes = class(TFrmCmReport)
    CdsPosLotes: TCMClientDataSet;
    SqlPosLotes: TCMSqlParams;
    DsPosLotes: TwwDataSource;
    PpPosLotes: TppBDEPipeline;
    RptPosLotes: TppReport;
    ppHeaderBand21: TppHeaderBand;
    LblDocsPagReceb: TppLabel;
    ppLine40: TppLine;
    ppLabel65: TppLabel;
    ppDetailBand22: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText21: TppDBText;
    RptDocPagosDBText1: TppDBText;
    RptDocPagosDBText2: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLine41: TppLine;
    ppLabel66: TppLabel;
    ppCalc37: TppSystemVariable;
    ppCalc38: TppSystemVariable;
    ppSummaryBand4: TppSummaryBand;
    ppLabel77: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLabel82: TppLabel;
    ppDBText28: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel90: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine42: TppLine;
    RptDocPagosGroup1: TppGroup;
    RptDocPagosGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText16: TppDBText;
    LblClientes: TppLabel;
    RptDocPagosLabel1: TppLabel;
    RptDocPagosLabel2: TppLabel;
    ppLabel85: TppLabel;
    RptDocPagosGroupFooterBand1: TppGroupFooterBand;
    RptDocPagosLabel3: TppLabel;
    RptDocPagosDBCalc1: TppDBCalc;
    sqlFormaRecPag: TCMSqlParams;
    cdsFormaRecPag: TCMClientDataSet;
    PpPosLotesppField10: TppField;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptPosicaoLotes: TRptPosicaoLotes;

implementation

{$R *.DFM}

procedure TRptPosicaoLotes.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  //CmpRptCM.ParamValues[0].TextDefault := DateToStr(date);
  //CmpRptCM.ParamValues[1].TextDefault := DateToStr(date);
end;

procedure TRptPosicaoLotes.FormCreate(Sender: TObject);
begin
  inherited;
  SqlPosLotes.Open;
end;

procedure TRptPosicaoLotes.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql: String;
Begin
  inherited;
sSql := 'SELECT  '+
        'LD.NUMLOTE, R.IDPLANOPREV, LP.DATAEMISSAO, LP.NUMCHQBORDERO, P.DESCRICAO, LP.FAVORECIDO, '+
        'DECODE(LP.FLAGCANCEL,NULL,''E'',LP.FLAGCANCEL) AS FLAGCANCEL, PL.NOME, '+
        'SUM(LD.VALOR / L.VALOR * R.VALOR) AS VLRBASE '+
        'FROM  '+
        'DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,  '+
        'LOTEXDOCUM LD, LOTEPAGTO LP, PORTADORFORMA P, '+
        'PLANPREVCONTABIL PL '+
        'WHERE '+
        'D.CODDOCUMENTO = L.CODDOCUMENTO '+
        'AND (D.OPERACAO <> 3 AND D.OPERACAO <> 1) '+
        'AND D.OPERACAO = L.OPERACAO '+
        'AND D.CODDOCUMENTO = R.CODDOCUMENTO '+
        'AND D.CODDOCUMENTO = LD.CODDOCUMENTO '+
        'AND LD.NUMLOTE = LP.NUMLOTE '+
        'AND LP.CODPORTFORMA = P.CODPORTFORMA  '+
        'AND R.IDPLANOPREV = PL.IDPLANOPREV '+
        'GROUP BY '+
        'LD.NUMLOTE, R.IDPLANOPREV, '+
        'LP.DATAEMISSAO, LP.NUMCHQBORDERO, P.DESCRICAO, LP.FAVORECIDO,  '+
        'DECODE(LP.FLAGCANCEL,NULL,''E'',LP.FLAGCANCEL), '+
        'PL.NOME    '+
        'UNION '+
        'SELECT  '+
        'LD.NUMLOTE, EFETIVO.IDPLANOPREV,  '+
        'LP.DATAEMISSAO, LP.NUMCHQBORDERO, P.DESCRICAO, LP.FAVORECIDO, '+
        'DECODE(LP.FLAGCANCEL,NULL,''E'',LP.FLAGCANCEL) AS FLAGCANCEL, '+
        'PL.NOME, SUM(LD.VALOR / EFETIVO.LANCTO * EFETIVO.RATEIO) AS VLRBASE '+
        'FROM   '+
        ' DOCUMENTO D, LANCTODOCUM L,  LOTEXDOCUM LD,  '+
        ' LOTEPAGTO LP, PORTADORFORMA P, PLANPREVCONTABIL PL,  '+
        ' (    '+
        '   SELECT RAT.NUMFATURA, RAT.IDPLANOPREV, RAT.RATEIO, LANCTO.LANCTO  '+
        '   FROM    '+
        ' ( SELECT  '+
        '      DOC.NUMFATURA, RT.IDPLANOPREV, '+
        '      SUM(RT.VALOR) AS RATEIO   '+
        '   FROM   '+
        '      DOCUMENTO DOC, RATEIODOCUM RT  '+
        '   WHERE '+
        '      DOC.OPERACAO = 1      '+
        '      AND DOC.CODDOCUMENTO = RT.CODDOCUMENTO '+
        '   GROUP BY  '+
        '      DOC.NUMFATURA, RT.IDPLANOPREV '+
        ') RAT, '+
        '( SELECT   '+
        '      DOC.NUMFATURA, SUM(LD.VALOR) AS LANCTO '+
        '   FROM   '+
        '      DOCUMENTO DOC, LANCTODOCUM LD  '+
        '   WHERE  '+
        '      DOC.OPERACAO = 1  '+
        '      AND DOC.CODDOCUMENTO = LD.CODDOCUMENTO  '+
        '      AND DOC.OPERACAO = LD.OPERACAO '+
        '   GROUP BY   '+
        '      DOC.NUMFATURA   '+
        ' ) LANCTO   '+
        ' WHERE        '+
        ' RAT.NUMFATURA = LANCTO.NUMFATURA  '+
        ' ) EFETIVO  '+
        ' WHERE   '+
        'D.OPERACAO = 3  '+
        'AND D.CODDOCUMENTO = L.CODDOCUMENTO '+
        'AND D.OPERACAO = L.OPERACAO  '+
        'AND D.CODDOCUMENTO = LD.CODDOCUMENTO  '+
        'AND LD.NUMLOTE = LP.NUMLOTE   '+
        'AND LP.CODPORTFORMA = P.CODPORTFORMA  '+
        'AND D.NUMFATURA = EFETIVO.NUMFATURA '+
        'AND EFETIVO.IDPLANOPREV = PL.IDPLANOPREV  '+
        'GROUP BY '+
        'LD.NUMLOTE, EFETIVO.IDPLANOPREV, LP.DATAEMISSAO, LP.NUMCHQBORDERO, P.DESCRICAO, LP.FAVORECIDO,  '+
        'DECODE(LP.FLAGCANCEL,NULL,''E'',LP.FLAGCANCEL), PL.NOME ';
        
  SqlPosLotes.sql.text := sSql;
  SqlPosLotes.open;

end;

end.
