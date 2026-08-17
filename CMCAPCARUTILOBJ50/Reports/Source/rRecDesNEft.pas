{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------}

unit rRecDesNEft;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp, CmParamReport,
  uCtrlParamIntegra;

type
  TRptRecDesNEft = class(TFrmCmReport)
    DsRecDesNEfet: TwwDataSource;
    PpRecDesNEfet: TppBDEPipeline;
    RptRecDesNEft: TppReport;
    ppHeaderBand13: TppHeaderBand;
    LblSaldoap: TppLabel;
    ppLine19: TppLine;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel31: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppDBText1: TppDBText;
    LblCodSaldo: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine20: TppLine;
    ppLabel32: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    SqlRecDesNEfet: TCMSqlParams;
    CdsRecDesNEfet: TCMClientDataSet;
    procedure RptRecDesNEftBeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptRecDesNEft: TRptRecDesNEft;

implementation

{$R *.DFM}

procedure TRptRecDesNEft.RptRecDesNEftBeforePrint(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'R' then
    LblCodSaldo.DisplayFormat := ParamIntegra.MascaraReceb + ';0; '
  else
    LblCodSaldo.DisplayFormat := ParamIntegra.MascaraDesemb + ';0; ';

end;

procedure TRptRecDesNEft.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with SqlRecDesNEfet do
  begin
    Close;
    if ParamIntegra.RecPag = 'P' then
      Sql.Text :=
//        'SELECT /*+ RULE */ RD.CODTIPRECDES, TR.DESCRICAO, ' +  //Everson TIBERO
        'SELECT RD.CODTIPRECDES, TR.DESCRICAO, ' + //Everson TIBERO
        'SUM(SALDO.SVALOR) * -1 AS VALOR ' +
        'FROM ' +
        'DOCUMENTO DOC, RATEIODOCUM RD, TIPORECEBDESEMB TR, ' +
        '(SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR FROM ' +
        '(SELECT DECODE(L.DEBCRE,''C'',L.VALOR*-1,L.VALOR) AS VREAL, ' +
        'L.CODDOCUMENTO FROM LANCTODOCUM L ,DOCUMENTO D ' +
        'WHERE L.CODDOCUMENTO = D.CODDOCUMENTO AND D.RECPAG = ''' +
          ParamIntegra.RecPag + ''') S ' +
        'GROUP BY S.CODDOCUMENTO) SALDO ' +
        'WHERE ' +
        'DOC.RECPAG = ''' + ParamIntegra.RecPag + ''' AND ' +
        'DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ' AND ' +
        'RD.CODDOCUMENTO = SALDO.CODDOCUMENTO AND ' +
        'RD.CODDOCUMENTO = DOC.CODDOCUMENTO AND ' +
        'RD.CODTIPRECDES = TR.CODTIPRECDES AND ' +
        'TR.RECPAG = ''' + ParamIntegra.RecPag + ''' AND ' +
        'TR.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ' ' +
        'GROUP BY TR.DESCRICAO, RD.CODTIPRECDES ' +
        'ORDER BY VALOR '
    else
      Sql.Text :=
//        'SELECT /*+ RULE */ RD.CODTIPRECDES, TR.DESCRICAO, ' +  //Everson TIBERO
        'SELECT RD.CODTIPRECDES, TR.DESCRICAO, ' +                //Everson TIBERO
        'SUM(SALDO.SVALOR) * -1 AS VALOR ' +
        'FROM ' +
        'DOCUMENTO DOC, RATEIODOCUM RD, TIPORECEBDESEMB TR, ' +
        '(SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR FROM ' +
        '(SELECT DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR) AS VREAL, ' +
        'L.CODDOCUMENTO FROM LANCTODOCUM L ,DOCUMENTO D ' +
        'WHERE L.CODDOCUMENTO = D.CODDOCUMENTO AND D.RECPAG = ''' +
          ParamIntegra.RecPag + ''') S ' +
        'GROUP BY S.CODDOCUMENTO) SALDO ' +
        'WHERE ' +
        'DOC.RECPAG = ''' + ParamIntegra.RecPag + ''' AND ' +
        'DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ' AND ' +
        'RD.CODDOCUMENTO = SALDO.CODDOCUMENTO AND ' +
        'RD.CODDOCUMENTO = DOC.CODDOCUMENTO AND ' +
        'RD.CODTIPRECDES = TR.CODTIPRECDES AND ' +
        'TR.RECPAG = ''' + ParamIntegra.RecPag + ''' AND ' +
        'TR.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ' ' +
        'GROUP BY TR.DESCRICAO, RD.CODTIPRECDES ' +
        'ORDER BY VALOR ';
    Open;
  end;
end;

procedure TRptRecDesNEft.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ExibeFormParams := False;
end;

procedure TRptRecDesNEft.FormCreate(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'R' then
    LblSaldoap.Caption := 'Saldo a Receber X Tipo de Recebimento'
  else
    LblSaldoap.Caption := 'Saldo a Pagar X Tipo de Desembolso';
end;

end.

