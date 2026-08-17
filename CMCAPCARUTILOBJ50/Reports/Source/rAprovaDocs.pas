{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
 -------------------------------------------------------------------------------}

Unit rAprovaDocs;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, DBTables, ppBands, ppReport, ppStrtch, ppSubRpt, ppClass,
  ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, Db, Wwquery, Wwdatsrc, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, ppModule,
  raCodMod, uCtrlDocumento, TXRB;

Type
  TRptAprovaDocs = Class(TFrmCmReport)
    PpAprovaDoc: TppBDEPipeline;
    DsAprovaDoc: TwwDataSource;
    SqlContLanc: TCMSqlParams;
    SqlContabParc: TCMSqlParams;
    SqlContabBaixa: TCMSqlParams;
    CdsContLanc: TCMClientDataSet;
    CdsContabParc: TCMClientDataSet;
    CdsContabBaixa: TCMClientDataSet;
    SqlContabPagtos: TCMSqlParams;
    CdsContabPagtos: TCMClientDataSet;
    dsAuxAprovaDoc: TwwDataSource;
    ppAuxAprovaDoc: TppBDEPipeline;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    QryAprovaDoc: TwwQuery;
    UpdAprovaDoc: TUpdateSQL;
    QryAuxAprovaDoc: TwwQuery;
    RptAprovaDoc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel48: TppLabel;
    LblAprovaDoc: TppLabel;
    RptAprovaDocLabel2: TppLabel;
    RptAprovaDocDBText2: TppDBText;
    RptAprovaDocDBText3: TppDBText;
    RptAprovaDocLabel1: TppLabel;
    RptAprovaDocDBText1: TppDBText;
    ppLabel67: TppLabel;
    ppDBText23: TppDBText;
    RptAprovaDocLabel4: TppLabel;
    RptAprovaDocDBText4: TppDBText;
    RptAprovaDocLabel5: TppLabel;
    RptAprovaDocLabel6: TppLabel;
    RptAprovaDocDBText5: TppDBText;
    LblStatus: TppLabel;
    ppLine37: TppLine;
    ppLabel62: TppLabel;
    ppLabel81: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel80: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    RptAprovaDocLine1: TppLine;
    RptAprovaDocLabel7: TppLabel;
    LblTotLote: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    RptAprovaDocLine4: TppLine;
    RptAprovaDocLine2: TppLine;
    RptAprovaDocDBText6: TppDBText;
    RptAprovaDocDBText7: TppDBText;
    RptAprovaDocDBText8: TppDBText;
    RptAprovaDocDBText9: TppDBText;
    RptAprovaDocDBText10: TppDBText;
    ppLabel50: TppLabel;
    RptAprovaDocShape4: TppShape;
    RptAprovaDocShape3: TppShape;
    RptAprovaDocShape2: TppShape;
    RptAprovaDocShape1: TppShape;
    ppLine34: TppLine;
    Lbla2: TppLabel;
    Lbla3: TppLabel;
    Lbla1: TppLabel;
    ppLabel55: TppLabel;
    RptAprovaDocLine3: TppLine;
    lbla4: TppLabel;
    ppCalc33: TppSystemVariable;
    ppCalc34: TppSystemVariable;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure LblTotLotePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure LblStatusPrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
  private
    { Private declarations }
    CtrlDocumento: TCtrlDocumento;
  public
    { Public declarations }
  End;

Var
  RptAprovaDocs: TRptAprovaDocs;

Implementation

Uses dBaseDados, usistema;

{$R *.DFM}

Procedure TRptAprovaDocs.CrmRptCMBeforePrint(Sender: TObject);
Var
  Edita: Boolean;

  procedure InsereDados;
  begin
    With QryAprovaDoc Do
    Begin
        FieldByname('CODDOCUMENTO').asinteger := CdsContabPagtos.FieldByname('CODDOCUMENTO').asinteger;
        FieldByname('NUMLOTE').asinteger := CdsContabPagtos.FieldByname('NUMLOTE').asinteger;
        FieldByname('DATAEMISSAO').asstring := CdsContabPagtos.FieldByname('DATAEMISSAO').asstring;
        FieldByname('CODDOCUMENTO').asinteger := CdsContabPagtos.FieldByname('CODDOCUMENTO').asinteger;
        FieldByname('FORNECEDOR').asstring := CdsContabPagtos.FieldByname('FORNECEDOR').asstring;
        FieldByname('NUMDOC').asstring := CdsContabPagtos.FieldByname('NUMDOC').asstring;
        FieldByname('NUMSLIP').asstring := CdsContabPagtos.FieldByname('NUMSLIP').asstring;
        FieldByname('DATALANCTO').asstring := CdsContabPagtos.FieldByname('DATALANCTO').asstring;
        FieldByname('DATAVENCTO').asstring := CdsContabPagtos.FieldByname('DATAVENCTO').asstring;
        FieldByname('VALOR').asstring := CdsContabPagtos.FieldByname('VALOR').asstring;
        FieldByname('DESCRICAO_1').asstring := CdsContabPagtos.FieldByname('DESCRICAO_1').asstring;
        FieldByname('DESCRICAO_2').asstring := CdsContabPagtos.FieldByname('DESCRICAO_2').asstring;
        FieldByname('DESCRICAO').asstring := CdsContabPagtos.FieldByname('DESCRICAO').asstring;
        FieldByname('LACDEBCRE').asstring := CdsContabPagtos.FieldByname('LACDEBCRE').asstring;
        FieldByname('PLACONTA').asstring := CdsContabPagtos.FieldByname('PLACONTA').asstring;
        FieldByname('LACVALOR').asfloat := CdsContabPagtos.FieldByname('LACVALOR').asfloat;
        FieldByname('PLNPLANIL').asstring := CdsContabPagtos.FieldByname('PLNPLANIL').asstring;
        FieldByname('HISTORICOCOMPL').asstring := CdsContabPagtos.FieldByname('HISTORICOCOMPL').asstring;
        FieldByname('HISTLANCAMENTOCONTABIL').asstring := CdsContabPagtos.FieldByname('HISTLANCAMENTOCONTABIL').asstring;
        FieldByname('SVALOR').asfloat := CdsContabPagtos.FieldByname('SVALOR').asfloat;
        FieldByname('SVALOROUTRAMOEDA').asfloat := CdsContabPagtos.FieldByname('SVALOROUTRAMOEDA').asfloat;
        FieldByname('NUMCHQBORDERO').asstring := CdsContabPagtos.FieldByname('NUMCHQBORDERO').asstring;
        FieldByname('NOMEBANCO').asstring := CdsContabPagtos.FieldByname('NOMEBANCO').asstring;
        FieldByname('NUMBANCO').asstring := CdsContabPagtos.FieldByname('NUMBANCO').asstring;
        FieldByname('NOCONTACORR').asstring := CdsContabPagtos.FieldByname('NOCONTACORR').asstring;
        FieldByname('FLAGEMISSAO').asstring := CdsContabPagtos.FieldByname('FLAGEMISSAO').asstring;
        FieldByname('FLAGCANCEL').asstring := CdsContabPagtos.FieldByname('FLAGCANCEL').asstring;
    end;
  end;
Begin
  If ( Trim( CmpRptCM.ParamValues[0].AsString ) = '' ) Then Begin
    Exit;
  End;

  Inherited;
  LblAprovaDoc.Caption := 'Aprovação de Documentos';
  With SqlContabPagtos Do
  Begin
    SQL.Clear;
//    SQL.Append('SELECT  /*+ RULE */ ');   //Everson TIBERO
    SQL.Append('SELECT  ');                 //Everson TIBERO
    SQL.Append('  PFORCLI.RAZAOSOCIAL, ');
    SQL.Append('  LP.NUMLOTE,');
    SQL.Append('  LP.DATAEMISSAO,');
    SQL.Append('  DOC.CODDOCUMENTO,');
    SQL.Append('  PFORCLI.RAZAOSOCIAL AS FORNECEDOR,');
    SQL.Append('  DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, ');
    SQL.Append('  DOC.NODOCUMENTO || ''/'' || DOC.COMPLDOCUMENTO AS NUMDOC,');
    SQL.Append('  DOC.NUMSLIP,');
    SQL.Append('  LAN.DATALANCTO, DOC.DATAVENCTO,');
    SQL.Append('  LAN.VALOR,');
    SQL.Append('  PF.DESCRICAO,');
    SQL.Append('  FRP.DESCRICAO,');
    SQL.Append('  '' '' as LACDEBCRE,');
    SQL.Append('  lpad('' '',18) as PLACONTA,');
    SQL.Append('  0 as LACVALOR,');
    SQL.Append('  0 as PLNPLANIL,');
    SQL.Append('  LAN.HISTORICOCOMPL,');
    SQL.Append('  lpad('' '',200) as HISTLANCAMENTOCONTABIL,');
    SQL.Append('  CODDOC.DESCRICAO,');
    SQL.Append('  SALDO.SVALOR,');
    SQL.Append('  SALDO.SVALOROUTRAMOEDA,');
    SQL.Append('  LP.NUMCHQBORDERO,');
    SQL.Append('  B.NUMBANCO,');
    SQL.Append('  PB.RAZAOSOCIAL AS NOMEBANCO,');
    SQL.Append('  PC.NOCONTACORR,');
    SQL.Append('  LP.FLAGEMISSAO,');
    SQL.Append('  LP.FLAGCANCEL ');
    SQL.Append('FROM');
    SQL.Append('  (SELECT');
    SQL.Append('     D.CODDOCUMENTO,');
    SQL.Append('     SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR * -1)) AS SVALOR,');
    SQL.Append('     SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA * -1)) AS SVALOROUTRAMOEDA');
    SQL.Append('   FROM');
    SQL.Append('     DOCUMENTO D, LANCTODOCUM L');
    SQL.Append('   WHERE ');
    SQL.Append('     L.CODDOCUMENTO = D.CODDOCUMENTO');
    SQL.Append('     AND D.RECPAG = ''' + ParamIntegra.RecPag + '''  ');
    SQL.Append('    GROUP BY ');
    SQL.Append('      D.CODDOCUMENTO) SALDO ,');
    SQL.Append('  PESSOA PB,');
    SQL.Append('  PESSOA PFORCLI,');
    SQL.Append('  DOCUMENTO DOC,');
    SQL.Append('  LANCTODOCUM LAN,');
    SQL.Append('  LOTEXDOCUM LX,');
    SQL.Append('  LOTEPAGTO LP,');
    SQL.Append('  PORTADORFORMA PF,');
    SQL.Append('  FORMARECPAG FRP,');
    SQL.Append('  PORTADORCONTA PC,');
    SQL.Append('  BANCO B,');
    SQL.Append('  TIPODOCRECPAG CODDOC');
    SQL.Append('WHERE');
    SQL.Append('  (DOC.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND  ');
    SQL.Append('  (SALDO.CODDOCUMENTO = DOC.CODDOCUMENTO) AND');
    SQL.Append('  (DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') AND');
    SQL.Append('  (DOC.OPERACAO IN (''2'',''3'',''14'',''15'')) AND');
    SQL.Append('  (LP.NUMLOTE IN (' + CmpRptCM.ParamValues[0].AsString + ')) AND  ');
    SQL.Append('  (PB.IDPESSOA = B.IDPESSOA) AND (doc.operacao=lan.operacao) and  ');
    SQL.Append('  (LP.NUMLOTE = LX.NUMLOTE) AND  ');
    SQL.Append('  (DOC.CODDOCUMENTO = LX.CODDOCUMENTO) AND  ');
    SQL.Append('  (DOC.IDFORCLI = PFORCLI.IDPESSOA) AND  ');
    SQL.Append('  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) AND  ');
    SQL.Append('  (LAN.OPERACAO <> ''5'') AND  lan.estorno is null and ');
    SQL.Append('  (LP.CODPORTFORMA = PF.CODPORTFORMA(+)) AND  ');
    SQL.Append('  (PF.CODFORMA = FRP.CODFORMA(+)) AND  ');
    SQL.Append('  (DOC.CODTIPDOC = CODDOC.CODTIPDOC(+))  AND  ');
    SQL.Append('  (PF.CODPORTADOR = PC.CODPORTADOR(+)) AND  ');
    SQL.Append('  (B.IDPESSOA(+) = PC.IDBANCO)  ');
    SQL.Append(' ORDER BY LP.DATAEMISSAO, LP.NUMCHQBORDERO, ');
    SQL.Append('  PFORCLI.RAZAOSOCIAL,  ');
    SQL.Append('  DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO,  ');
    SQL.Append('  DOC.CODDOCUMENTO, ');
    SQL.Append('  DOC.NUMSLIP,  DOC.DATAVENCTO,  ');
    SQL.Append('  LAN.VALOR,  PF.DESCRICAO,  FRP.DESCRICAO, LAN.HISTORICOCOMPL');
    Open;
  End;
  
  If Not CdsContabPagtos.IsEmpty Then
  Begin
    QryAprovaDoc.Open;
    With QryAprovaDoc Do
    Begin
      CdsContabPagtos.First;
      While Not CdsContabPagtos.EOF Do
      Begin
        CdsContabBaixa.Close;
        SqlContabBaixa.Prepare;
        SqlContabBaixa.params[0].asinteger := CdsContabPagtos.fieldbyname('coddocumento').asinteger;
        SqlContabBaixa.open;

        CdsContabParc.Close;
        SqlContabParc.Prepare;
        SqlContabParc.params[0].asinteger := CdsContabPagtos.fieldbyname('coddocumento').asinteger;
        SqlContabParc.open;

        CdsContLanc.Close;
        SqlContLanc.Prepare;
        SqlContLanc.params[0].asinteger := CdsContabPagtos.fieldbyname('coddocumento').asinteger;
        SqlContLanc.open;

        Append;
        InsereDados;
        Post;

        Edita := True;

        While Not CdsContLanc.eof Do
        Begin
          If Edita Then
          Begin
            Edit;
            Edita := False;
          End
          Else
            Append;

          InsereDados;
          FieldByname('PLACONTA').AsString := CdsContLanc.FieldByname('PLACONTA').AsString;
          FieldByname('PLNPLANIL').AsString := CdsContLanc.FieldByname('PLNPLANIL').AsString;
          FieldByname('HISTLANCAMENTOCONTABIL').AsString := CdsContLanc.FieldByname('HISTLANCAMENTOCONTABIL').AsString;
          FieldByname('LACVALOR').AsFloat := CdsContLanc.FieldByname('LACVALOR').AsFloat;
          FieldByname('LACDEBCRE').AsString := CdsContLanc.FieldByname('LACDEBCRE').AsString;
          Post;
          CdsContLanc.Next;
        End;

        While Not CdsContabParc.EOF Do
        Begin
          If Edita Then
          Begin
            Edit;
            Edita := False;
          End
          Else
            Append;

          InsereDados;
          FieldByname('PLACONTA').AsString := CdsContabParc.FieldByname('PLACONTA').AsString;
          FieldByname('PLNPLANIL').AsString := CdsContabParc.FieldByname('PLNPLANIL').AsString;
          FieldByname('HISTLANCAMENTOCONTABIL').AsString := CdsContabParc.FieldByname('HISTLANCAMENTOCONTABIL').AsString;
          FieldByname('LACVALOR').AsFloat := CdsContabParc.FieldByname('VALOR').AsFloat;
          FieldByname('LACDEBCRE').AsString := CdsContabParc.FieldByname('LACDEBCRE').AsString;
          Post;

          CdsContabParc.Next;
        End;

        While Not CdsContabBaixa.eof Do
        Begin
          If Edita Then
          Begin
            Edit;
            Edita := False;
          End
          Else
            Append;

          InsereDados;
          FieldByname('PLACONTA').AsString := CdsContabBaixa.FieldByname('CONTACONTABIL').AsString;
          FieldByname('PLNPLANIL').AsString := CdsContabBaixa.FieldByname('PLNPLANIL').AsString;
          FieldByname('HISTLANCAMENTOCONTABIL').AsString := CdsContabBaixa.FieldByname('HISTORICO').AsString;
          FieldByname('LACVALOR').AsFloat := CdsContabBaixa.FieldByname('VALOR').AsFloat;
          FieldByname('LACDEBCRE').AsString := CdsContabBaixa.FieldByname('DEBCRE').AsString;
          Post;
          CdsContabBaixa.Next;
        End;

        CdsContabPagtos.Next;
      End;
      First;
    End;

    QryAuxAprovaDoc.Open;
  End;
End;

Procedure TRptAprovaDocs.LblTotLotePrint(Sender: TObject);
Begin
  Inherited;
  CtrlDocumento.Lote.CalculaSaldo(QryAprovaDoc.FieldByName('NUMLOTE').AsInteger);
  LblTotLote.Text := FloatToStrF(CtrlDocumento.Lote.Valor, ffNumber, 14, 2);
End;

Procedure TRptAprovaDocs.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
End;

Procedure TRptAprovaDocs.LblStatusPrint(Sender: TObject);
Begin
  Inherited;
  If (QryAprovaDoc.FieldByName('FLAGCANCEL').AsString = 'C') Then
    LblStatus.Text := 'Cancelado'
  Else If (QryAprovaDoc.FieldByName('FLAGEMISSAO').IsNull) Then
    LblStatus.Text := 'Em Aberto - Não Emitido'
  Else If (Not QryAprovaDoc.FieldByName('FLAGEMISSAO').IsNull) And
    (QryAprovaDoc.FieldByName('FLAGCANCEL').AsString <> 'B') Then
    LblStatus.Text := 'Em Aberto - Emitido'
  Else If (Not QryAprovaDoc.FieldByName('FLAGEMISSAO').IsNull) And
    (QryAprovaDoc.FieldByName('FLAGCANCEL').AsString = 'B') Then
    LblStatus.Text := 'Baixado';
End;

Procedure TRptAprovaDocs.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
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
    CanExecute := True;
End;

End.

