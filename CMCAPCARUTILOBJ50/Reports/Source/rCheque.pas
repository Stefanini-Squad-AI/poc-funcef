{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------
 N. Chamado....: WO33342
 Dt Alteração..: 25/02/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Ajustando o padrão da mascara atual do CNPJ para
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'..
--------------------------------------------------------------------------------
}

unit rCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, TXRB, StdCtrls, Mask;

type
  TRptCheque = class(TFrmCmReport)
    SqlCheque: TCMSqlParams;
    CdsCheque: TCMClientDataSet;
    PpCheque: TppBDEPipeline;
    DsCheque: TwwDataSource;
    RptCheque: TppReport;
    ppDetailBand10: TppDetailBand;
    RptChequeDBText7: TppDBText;
    RptChequeDBText8: TppDBText;
    DbeJuros2: TppDBText;
    DbeVencto: TppDBText;
    RptChequeDBText11: TppDBText;
    RptChequeDBText12: TppDBText;
    DbDataProg: TppDBText;
    ppFooterBand10: TppFooterBand;
    RptChequeLine3: TppLine;
    RptChequeLabel18: TppLabel;
    RptChequeShape1: TppShape;
    LblChq1: TppLabel;
    RptChequeShape2: TppShape;
    RptChequeShape3: TppShape;
    LblChq2: TppLabel;
    LblChq3: TppLabel;
    RptChequeLine4: TppLine;
    RptChequeShape4: TppShape;
    LblChq4: TppLabel;
    RptChequeCalc1: TppSystemVariable;
    RptChequeCalc2: TppSystemVariable;
    RptChequeGroup1: TppGroup;
    RptChequeGroupHeaderBand1: TppGroupHeaderBand;
    RptChequeLabel3: TppLabel;
    RptChequeLabel4: TppLabel;
    RptChequeLabel5: TppLabel;
    LblJuros2: TppLabel;
    LblVencProg: TppLabel;
    RptChequeLabel8: TppLabel;
    RptChequeLabel9: TppLabel;
    RptChequeDBText1: TppDBText;
    RptChequeDBText2: TppDBText;
    RptChequeDBText3: TppDBText;
    RptChequeDBText4: TppDBText;
    RptChequeLabel10: TppLabel;
    RptChequeLabel11: TppLabel;
    RptChequeLabel12: TppLabel;
    RptChequeLabel13: TppLabel;
    RptChequeDBText5: TppDBText;
    RptChequeLabel14: TppLabel;
    LblVisto: TppLabel;
    LineVisto: TppLine;
    RptChequeLabel16: TppLabel;
    RptChequeDBText6: TppDBText;
    RptChequeLabel17: TppLabel;
    RptChequeLabel1: TppLabel;
    RptChequeDBText13: TppDBText;
    RptChequeDBText14: TppDBText;
    RptChequeDBText15: TppDBText;
    RptChequeDBText16: TppDBText;
    ppLabel149: TppLabel;
    ppDBText79: TppDBText;
    RptChequeGroupFooterBand1: TppGroupFooterBand;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    dbEdtCPFCNPJ: TppDBText;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure mudaLabel;
    procedure dbEdtCPFCNPJPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCheque: TRptCheque;

implementation

{$R *.DFM}

procedure TRptCheque.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  if not CmpRptCM.ParamValues[0].isnull then
  begin
    with SqlCheque do
    begin
      Close;

//      Sql.Text := 'SELECT  /*+ RULE */ LP.DATAEMISSAO, ' +  //Everson TIBERO
      Sql.Text := 'SELECT LP.DATAEMISSAO, ' + //Everson TIBERO
        //Marcus Oliveira 19/01/2007 24249 INICIO
        '  LP.DATAEMISSAO,  LC.DATALANCTO, DOC. NUMAPGR, AB.NUMAGENCIA, PFOR.NUMDOCUMENTO, ' +
        '  LP.NUMCHQBORDERO, LP.FAVORECIDO, LD.VALOR, LC.PLNCODIGO,PC.NOCONTACORR, DOC.CODDOCUMENTO,      ' +
        '  RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || ''-'' || DOC.COMPLDOCUMENTO AS NUMDOC,                        ' +
        '  DOC.DATAVENCTO, DOC.DATAPROGRAMADA, DOC.VALORJUROS,  PFOR.RAZAOSOCIAL FORNECEDOR,              ' +
        '  LP.OBSERVACAO, VL.VALORLOTE, LC.HISTORICOCOMPL,PBANCO.RAZAOSOCIAL,                             ' +
        '  PF.CODARQUIVOREMESSA, PF.IDTEMPLCHEQUE,  PFOR.NOME,                                            ' +
        '  DECODE(PF.CODARQUIVOREMESSA, NULL,''Cheque'',''Lote'')  TIPODOCUMENTO,                         ' +
        '  DECODE(PF.CODARQUIVOREMESSA, NULL,''Cópia de Cheque'',''Remessa Eletrônica'')  TITULO,         ' +
        '  DET.DESCTIPOCONTA, DET.BANCO, DET.AGENCIACONTA, DET.TIPO ' +

        'FROM ' +
        '  LOTEPAGTO LP, ' +
        '  PORTADORFORMA PF, ' +
        '  PORTADORCONTA PC, ' +
        '  PESSOA PBANCO, ' +
        //Marcus Oliveira 19/01/2007 24249 INICIO
        '  PESSOA PBANCOFAV, ' +
        '  AGENCIABANCARIA ABFOR, ' +
        '  PORTADORCONTA PCFAV,  ' +
        '  AGENCIABANCARIA AB, ' +
        '  CONTABANCARIA CB, ' +
        //Marcus Oliveira 19/01/2007 24249 FIM
        '  LOTEXDOCUM LD, ' +
        '  DOCUMENTO DOC, ' +
        '  PESSOA PFOR, ' +
        '(SELECT                                                        '                 +
        '   DECODE(C.TIPOCONTA, ''1'', ''Conta Corrente'',              '                 +
        '   DECODE(C.TIPOCONTA, ''2'', ''Cartão Salário'',              '                 +
        '   DECODE(C.TIPOCONTA, ''3'', ''Conta Poupança'',''''))) AS DESCTIPOCONTA,      '+
        '  (B.NUMBANCO || '' - '' || PB.RAZAOSOCIAL   ) BANCO, (TRIM(A.NUMAGENCIA) ||    '+
        '                 '' - '' ||  C.CONTACORRENTE ) AgenciaConta,                    '+
        '   P.TIPO, D.CODDOCUMENTO, P.NUMDOCUMENTO                                       ' +
        ' FROM                                                                           ' +
        '   DOCUMENTO D,                                                                 ' +
        '   PESSOA P,                                                                    ' +
        '   PESSOA PB,                                                                   ' +
        '   CONTABANCARIA C,                                                             ' +
        '   AGENCIABANCARIA A,                                                           ' +
        '   BANCO B                                                                      ' +
        'WHERE                                                                           ' +
        '  (PB.IDPESSOA = B.IDPESSOA) AND                                                ' +
        '  (P.IDPESSOA = D.IDFORCLI) AND                                                 ' +
        '  (C.IDAGENCIA = A.IDPESSOA(+))  AND                                            ' +
        '  (A.IDBANCO   = B.IDPESSOA(+)) AND                                             ' +
        '  (D.IDCBANCARIA = C.IDCBANCARIA(+))                                            ' +
        ')DET,                                                                           ' +

        '  (SELECT NUMLOTE, SUM(VALOR) AS VALORLOTE FROM LOTEXDOCUM GROUP BY NUMLOTE) VL, ' +
        '  LANCTODOCUM LC ' +
        ',(SELECT COUNT(*) AS TOTDOCUM , NUMLOTE FROM LOTEXDOCUM LD , DOCUMENTO D WHERE ' +
        '        D.RECPAG         = ''' + PARAMINTEGRA.RECPAG + '''  AND ' +
        '         LD.CODDOCUMENTO = D.CODDOCUMENTO GROUP BY NUMLOTE  ) TOTDOCUM ' +
        ',(SELECT COUNT(*) AS TOTDOCUM , NUMLOTE FROM LOTEXDOCUM LD , DOCUMENTO D WHERE ' +
        '        D.RECPAG         = ''' + PARAMINTEGRA.RECPAG + '''  AND ' +
        '         LD.CODDOCUMENTO = D.CODDOCUMENTO  AND ' +
        '         D.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG =  ''' + PARAMINTEGRA.RECPAG + '''' +
        ' AND NOT EXISTS  (SELECT 1 FROM USUARIOXTPDOCTO B WHERE RECPAG=''' + PARAMINTEGRA.RECPAG + ''' AND B.IDUSUARIO=' +
        '              :IDUSUARIO) UNION  SELECT CODTIPDOC  FROM TIPODOCRECPAG A WHERE A.RECPAG =   ''' + PARAMINTEGRA.RECPAG + '''' +
        '  AND EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B WHERE RECPAG=''P'' AND A.CODTIPDOC=B.CODTIPDOC AND B.IDUSUARIO=' +
        ':IDUSUARIO)) GROUP BY NUMLOTE  ) TOTLOTE ' +
        'WHERE ' +
        '  (LP.NUMLOTE IN (' + CMPRPTCM.PARAMVALUES[0].ASSTRING + ')) AND ' +
        '  (PF.CODPORTADOR = PC.CODPORTADOR) AND ' +
        '  (PC.IDBANCO = PBANCO.IDPESSOA) AND ' +
        '  (LD.NUMLOTE = LP.NUMLOTE) AND ' +
        '  (LD.CODDOCUMENTO = DOC.CODDOCUMENTO) AND ' +
        //Marcus Oliveira 19/01/2007 24249 INICIO
        '  (PBANCOFAV.IDPESSOA = PCFAV.IDBANCO) AND     ' +
        '  (PFOR.IDPESSOA = DOC.IDFORCLI) AND           ' +
        '  (ABFOR.IDPESSOA = PCFAV.IDAGENCIA) AND       ' +
        '  (PCFAV.CODPORTADOR = PF.CODPORTADOR) AND     ' +
        '  (DOC.IDCBANCARIA = CB.IDCBANCARIA(+)) AND    ' +
        '  (DET.CODDOCUMENTO(+) = DOC.CODDOCUMENTO) AND '+
        '  (PC.IDAGENCIA = AB.IDPESSOA ) AND ' +
        //Marcus Oliveira 19/01/2007 24249 Fim
        '  (LC.OPERACAO = DOC.OPERACAO) AND ' +
        '  (TOTLOTE.TOTDOCUM=TOTDOCUM.TOTDOCUM) AND ' +
        '  (TOTLOTE.NUMLOTE=TOTDOCUM.NUMLOTE) AND ' +
        '  (TOTLOTE.NUMLOTE=  LP.NUMLOTE)  AND ' +
        '  (DOC.IDFORCLI = PFOR.IDPESSOA) AND ' +
        '  (LP.NUMLOTE = VL.NUMLOTE) AND ' +
        '  (LC.CODDOCUMENTO = DOC.CODDOCUMENTO) AND ' +
        '  (LP.CODPORTFORMA = PF.CODPORTFORMA) ' +
        'ORDER BY LP.NUMCHQBORDERO, PFOR.NOME ';
      Prepare;
      params[0].asinteger := CrmRptCM.idusuario;
    end;
    sqlCheque.Open;
  end;
  mudaLabel;
end;

procedure TRptCheque.mudaLabel;
var
  LblRelats: TppLabel;
Begin
  Inherited;
  SqlTeste.SQL.Text := 'SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '
    + FloatToStr(CrmRptCM.IdModulo) + ') AND (IDPESSOA = '
    + FloatToStr(CrmRptCM.idEmpresa) + ')';
  SqlTeste.Open;
  CdsTeste.First;
  While Not CdsTeste.Eof Do
  Begin
    Try
      LblRelats := (FindComponent(CdsTeste.FieldByName('NOMECOMPO').AsString) As TppLabel);
      If LblRelats = Nil Then
        LblRelats := (FindComponent(Cdsteste.FieldByName('NOMECOMPO').AsString) As TppLabel);

      If LblRelats <> Nil Then
        LblRelats.Caption := CdsTeste.FieldByName('VALOR').AsString;
    Finally
      CdsTeste.Next;
    End;
  End;
end;

procedure TRptCheque.dbEdtCPFCNPJPrint(Sender: TObject);
begin
  inherited;
  if CdsCheque.FieldByName('tipo').AsString = 'J' then
 //    dbEdtCPFCNPJ.DisplayFormat := '99.999.999/9999-99;0;'
     dbEdtCPFCNPJ.DisplayFormat := 'AA.AAA.AAA/AAAA-99;0;'       // Paulo Nobre - WO33342
  else
     dbEdtCPFCNPJ.DisplayFormat := '999.999.999-99;0;';
end;

end.

