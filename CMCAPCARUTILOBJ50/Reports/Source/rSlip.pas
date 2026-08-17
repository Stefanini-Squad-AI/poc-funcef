{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 13/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------}
//Marcus Oliveira 31/01/2007 24363 Remoção do owner CM.


Unit rSlip;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc,
  uCmSqlParams, DBClient, uCMClientDataSet, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, uCtrlParamIntegra, TXRB;

Type
  TRptSlip = Class(TFrmCmReport)
    PpSlip: TppBDEPipeline;
    RptSlip: TppReport;
    ppReport1HeaderBand1: TppHeaderBand;
    Label1: TppLabel;
    Label2: TppLabel;
    ppReport1DetailBand1: TppDetailBand;
    DBText16: TppDBText;
    DBText15: TppDBText;
    DBText19: TppDBText;
    DBText20: TppDBText;
    DBText21: TppDBText;
    ppDBText84: TppDBText;
    ppReport1FooterBand1: TppFooterBand;
    RptSlipLine1: TppLine;
    Label3: TppLabel;
    RptSlipCalc1: TppSystemVariable;
    RptSlipCalc2: TppSystemVariable;
    ppReport1SummaryBand1: TppSummaryBand;
    ppReport1Group1: TppGroup;
    ppReport1GroupHeaderBand1: TppGroupHeaderBand;
    Label4: TppLabel;
    Label5: TppLabel;
    DBText2: TppDBText;
    Label6: TppLabel;
    DBText3: TppDBText;
    Label8: TppLabel;
    Label9: TppLabel;
    DBText6: TppDBText;
    Label10: TppLabel;
    DBText7: TppDBText;
    RptSlipLabel1: TppLabel;
    DBText8: TppDBText;
    Label13: TppLabel;
    DBText10: TppDBText;
    Label14: TppLabel;
    DBText11: TppDBText;
    Label15: TppLabel;
    Label7: TppLabel;
    DBText4: TppDBText;
    Label12: TppLabel;
    DBText9: TppDBText;
    Line4: TppLine;
    Label22: TppLabel;
    Label23: TppLabel;
    Label25: TppLabel;
    Label20: TppLabel;
    Label21: TppLabel;
    Label16: TppLabel;
    DBText12: TppDBText;
    Label17: TppLabel;
    DBText13: TppDBText;
    Label18: TppLabel;
    DBText14: TppDBText;
    LblEmpresaEmitente: TppLabel;
    LblHistoricoFinan: TppLabel;
    RptSlipLine6: TppLine;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppDBText88: TppDBText;
    ppReport1GroupFooterBand1: TppGroupFooterBand;
    Label26: TppLabel;
    Lbls1: TppLabel;
    lbls2: TppLabel;
    RptSlipLine2: TppLine;
    Line3: TppLine;
    LblUsuario: TppLabel;
    lbls3: TppLabel;
    RptSlipLine3: TppLine;
    RptSlipLine4: TppLine;
    RptSlipLine5: TppLine;
    CdsSlip: TCMClientDataSet;
    SqlSlip: TCMSqlParams;
    DsSlip: TwwDataSource;
    CdsContabPagtos: TCMClientDataSet;
    SqlContabPagtos: TCMSqlParams;
    CdsSlipAux: TCMClientDataSet;
    SqlSlipAux: TCMSqlParams;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptSlip: TRptSlip;

Implementation

Uses UModulo;

{$R *.DFM}

Procedure TRptSlip.CrmRptCMBeforePrint(Sender: TObject);
Var
  iOldCodDocumento, x: integer;
  sDebCre: String;
Begin
  Inherited;
  If Not CmpRptCM.ParamValues[0].isnull Then
  Begin
    { -----------------------------------------------------------------------------
      Otimização e implementação das colunas de Telefone Comercial do Fornecedor e
      Descrição da Conta Contábil. Fábio Barros - 27/05/2002.
     ----------------------------------------------------------------------------- }
    With SqlSlipAux.SQL Do
    Begin
      Clear;
//      Append('SELECT /*+ RULE */ DISTINCT                                       ');   //Everson TIBERO
      Append('SELECT DISTINCT                                       ');                 //Everson TIBERO
      Append('  DOC.CODDOCUMENTO,                                               ');
      Append('  PFORCLI.RAZAOSOCIAL AS FORNECEDOR,                              ');
      Append('  ''('' || TL.DDD  || '') '' || TL.NUMERO AS TELFORCLI,           ');
      Append('  DOC.NODOCUMENTO || ''/'' || DOC.COMPLDOCUMENTO AS NUMDOC,       ');
      Append('  DOC.NUMSLIP,                                                    ');
      Append('  LAN.DATALANCTO,                                                 ');
      Append('  DOC.DATAVENCTO,                                                 ');
      Append('  LAN.VALOR,                                                      ');
      Append('  PF.DESCRICAO,                                                   ');
      Append('  FRP.DESCRICAO,                                                  ');
      Append('  U.NOMEUSUARIO AS USUARIOLANC,                                   ');
      Append('  LC.LACDEBCRE,                                                   ');
      Append('  LC.PLACONTA,                                                    ');
      Append('  PC.PLANOME,                                                     ');
      Append('  LC.LACVALOR,                                                    ');
      Append('  P.PLNPLANIL,                                                    ');
      Append('  LAN.HISTORICOCOMPL,                                             ');
      Append('  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC.LACHIST5 AS HISTLANCAMENTOCONTABIL, ');
      Append('  CODDOC.DESCRICAO,                                               ');
      Append('  SALDO.SVALOR,                                                   ');
      Append('  SALDO.SVALOROUTRAMOEDA                                          ');
      Append('FROM                                                              ');
      Append('  (SELECT                                                         ');
      Append('     D.CODDOCUMENTO,                                              ');
      Append('     SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1)) AS SVALOR,  ');
      Append('     SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1)) AS SVALOROUTRAMOEDA ');
      Append('   FROM                                                           ');
      Append('     LANCTODOCUM L ,                                              ');
      Append('     DOCUMENTO D                                                  ');
      Append('   WHERE                                                          ');
      Append('     (L.CODDOCUMENTO = D.CODDOCUMENTO) AND                        ');
      Append('     (D.CODDOCUMENTO IN (' + CmpRptCM.ParamValues[0].AsString + ')) AND                     ');
      Append('     (D.RECPAG = ''P'')                                           ');
      Append('   GROUP BY                                                       ');
      Append('     D.CODDOCUMENTO) SALDO,                                       ');
      Append('   PESSOA PFORCLI,                                                ');
      Append('   DOCUMENTO DOC,                                                 ');
      Append('   LANCTODOCUM LAN,                                               ');
      Append('   PORTADORFORMA PF,                                              ');
      Append('   FORMARECPAG FRP,                                               ');
      Append('   TIPODOCRECPAG CODDOC,                                          ');
      Append('   USUARIOSISTEMA U,                                              ');
      Append('   ENDPESS EP,                                                 ');
      Append('  (SELECT T.IDENDERECO, T.NUMERO, T.DDD                           ');
      Append('   FROM (SELECT IDENDERECO,MIN(IDTELEFONE) AS IDTELEFONE          ');
      Append('         FROM TELENDPESS                                       ');
      Append('         WHERE (TIPO LIKE ''%C%'')                                ');
      Append('         GROUP BY IDENDERECO) TT, TELENDPESS T                 ');
      Append('   WHERE (TT.IDTELEFONE = T.IDTELEFONE)                           ');
      Append('     AND (TT.IDENDERECO = T.IDENDERECO)) TL,                      ');
      Append('  LANCAMENTO LC,                                                  ');
      Append('  PLANOCONTA PC,                                                  ');
      Append('  PLANILHA P                                                      ');
      Append('WHERE                                                             ');
      Append('  (DOC.CODDOCUMENTO IN (' + CmpRptCM.ParamValues[0].AsString + ' )) AND                     ');
      Append('  (DOC.RECPAG = ''P'') AND                                        ');
      Append('  (DOC.IDFORCLI = PFORCLI.IDPESSOA) AND                           ');
      Append('  (LAN.PLNCODIGO = P.PLNCODIGO(+)) AND                            ');
      Append('  (P.PLNCODIGO = LC.PLNCODIGO(+)) AND                             ');
      Append('  ((LAN.OPERACAO <> ''5'') OR (LAN.OPERACAO IS NULL)) AND         ');
      Append('  (DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND        ');
      Append('  (DOC.OPERACAO IN (''2'',''3'',''14'',''15'')) AND               ');
      Append('  (DOC.CODDOCUMENTO = LAN.CODDOCUMENTO) AND                       ');
      Append('  (DOC.CODPORTFORMA = PF.CODPORTFORMA(+)) AND                     ');
      Append('  (PF.CODFORMA = FRP.CODFORMA(+)) AND                             ');
      Append('  (DOC.CODTIPDOC = CODDOC.CODTIPDOC(+))  AND                      ');
      Append('  (SALDO.CODDOCUMENTO = DOC.CODDOCUMENTO) AND                     ');
      Append('  (PC.PLACONTA(+) = LC.PLACONTA) AND                              ');
      Append('  (PC.PLANO(+) = LC.PLANO) AND                                    ');
      Append('  (PFORCLI.IDPESSOA  = EP.IDPESSOA(+)) AND                        ');
      Append('  (PFORCLI.IDENDCOMERCIAL  = EP.IDENDERECO(+)) AND                ');
      Append('  (EP.IDENDERECO = TL.IDENDERECO(+)) AND                          ');
      Append('  (''CM'' || U.IDUSUARIO(+) = DOC.TRGUSERINCLUSAO)                ');
      Append('ORDER BY                                                          ');
      Append('  DOC.CODDOCUMENTO,                                               ');
      Append('  LAN.DATALANCTO                                                  ');
      SqlSlipAux.Open;
    End;
    { -----------------------------------------------------------------------------
      Fim
     ----------------------------------------------------------------------------- }
    SqlSlip.Open;
    If Not CdsSlipAux.IsEmpty Then
    Begin
//      SqlContabPagtos.SQL.Text := 'SELECT /*+ RULE */ D.CODDOCUMENTO, L.VALOR, P.PLNPLANIL, ' + //Everson TIBERO
      SqlContabPagtos.SQL.Text := 'SELECT D.CODDOCUMENTO, L.VALOR, P.PLNPLANIL, ' +               //Everson TIBERO
        '       (''BAIXA DOC Nº '' || D.NODOCUMENTO || '' '' || D.COMPLDOCUMENTO) AS HISTORICO, ' +
        '       DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CCLIENTE, PC.PLACONTA AS CCBANCO ' +
        ' FROM DOCUMENTO D, LANCTODOCUM L, EMPRESAFORN E, RECBTOPAGTO R, PORTADORFORMA P, PORTADORCONTA PC, PLANILHA P ' +
        ' WHERE ' +
        ' (D.CODDOCUMENTO IN (' + CmpRptCM.ParamValues[0].AsString + ')) AND ' +
        ' (L.OPERACAO = ''5'') AND ' +
        ' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
        ' (D.IDFORCLI = E.IDFORCLI) AND ' +
        ' (R.NUMLANCTO = L.NUMLANCTO) AND ' +
        ' (R.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
        ' (R.CODPORTFORMA = P.CODPORTFORMA) AND ' +
        ' (P.CODPORTADOR = PC.CODPORTADOR) AND ' +
        ' (P.PLNCODIGO = L.PLNCODIGO) ' +
        ' ORDER BY D.CODDOCUMENTO';
      SqlContabPagtos.open;
      If Not CdsContabPagtos.IsEmpty Then
      Begin
        CdsSlipAux.First;
        iOldCodDocumento := CdsSlipAux.FieldByName('CODDOCUMENTO').AsInteger;
        While Not CdsSlipAux.Eof Do
        Begin
          If iOldCodDocumento = CdsSlipAux.FieldByName('CODDOCUMENTO').AsInteger Then
          Begin
            //InserDadosDoSlip
            CdsSlip.Append;
            For X := 0 To CdsSlip.FieldCount - 1 Do
              CdsSlip.Fields[x].Value := CdsSlipAux.Fields[x].Value;
            CdsSlip.Post;
          End
          Else
          Begin
            //InseredadosDoPagamento
            CdsContabPagtos.Filter := 'CODDOCUMENTO =  ' + IntToStr(iOldCodDocumento);
            CdsContabPagtos.First;
            While Not CdsContabPagtos.Eof Do
            Begin
              If ParamIntegra.RecPag = 'R' Then
                sDebCre := 'D'
              Else
                sDebCre := 'C';
              CdsSlip.Append;
              CdsSlip.FieldByname('PLACONTA').AsString := CdsContabPagtos.FieldByname('CCLIENTE').AsString;
              CdsSlip.FieldByname('PLNPLANIL').AsString := CdsContabPagtos.FieldByname('PLNPLANIL').AsString;
              CdsSlip.FieldByname('HISTLANCAMENTOCONTABIL').AsString := CdsContabPagtos.FieldByname('HISTORICO').AsString;
              CdsSlip.FieldByname('LACVALOR').AsFloat := CdsContabPagtos.FieldByname('VALOR').AsFloat;
              CdsSlip.FieldByname('LACDEBCRE').AsString := sDebCre;
              CdsSlip.FieldByname('CODDOCUMENTO').AsInteger := CdsContabPagtos.FieldByname('CODDOCUMENTO').AsInteger;
              CdsSlip.Post;

              If ParamIntegra.RecPag = 'R' Then
                sDebCre := 'C'
              Else
                sDebCre := 'D';
              CdsSlip.Append;
              CdsSlip.FieldByname('PLACONTA').AsString := CdsContabPagtos.FieldByname('CCBANCO').AsString;
              CdsSlip.FieldByname('PLNPLANIL').AsString := CdsContabPagtos.FieldByname('PLNPLANIL').AsString;
              CdsSlip.FieldByname('HISTLANCAMENTOCONTABIL').AsString := CdsContabPagtos.FieldByname('HISTORICO').AsString;
              CdsSlip.FieldByname('LACVALOR').AsFloat := CdsContabPagtos.FieldByname('VALOR').AsFloat;
              CdsSlip.FieldByname('LACDEBCRE').AsString := sDebCre;
              CdsSlip.FieldByname('CODDOCUMENTO').AsInteger := CdsContabPagtos.FieldByname('CODDOCUMENTO').AsInteger;
              CdsSlip.Post;
              CdsContabPagtos.Next;
            End;
            //InserDadosDoSlip
            CdsSlip.Append;
            For X := 0 To CdsSlip.FieldCount - 1 Do
              CdsSlip.Fields[x].Value := CdsSlipAux.Fields[x].Value;
            CdsSlip.Post;
          End;
          iOldCodDocumento := CdsSlipAux.FieldByName('CODDOCUMENTO').AsInteger;
          CdsSlipAux.Next;
        End;
      End
      Else
      Begin
        CdsSlipAux.First;
        While Not CdsSlipAux.Eof Do
        Begin
          CdsSlip.Append;
          For X := 0 To CdsSlip.FieldCount - 1 Do
            CdsSlip.Fields[x].Value := CdsSlipAux.Fields[x].Value;
          CdsSlip.Post;
          CdsSlipAux.Next;
        End;
      End;
      CdsSlipAux.First;
    End;
  End;
  LblHistoricoFinan.Caption := Modulo.HistPadFinan;

  CdsTeste.Close;
  SqlTeste.SQL.clear;
  SqlTeste.SQL.Text := 'Select NOMEUSUARIO from USUARIOSISTEMA where IDUSUARIO  = '+ FloattoStr(CrmRptCM.idusuario);
  SqlTeste.open;
  LblUsuario.Caption := CdsTeste.FieldByName('NOMEUSUARIO').ASString;
End;

Procedure TRptSlip.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Var
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
End;

End.

