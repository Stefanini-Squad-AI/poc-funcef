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

Unit rCartaCob;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient, StdCtrls,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, Wwdatsrc, uCtrlParamIntegra, uCtrlDocumento, TXRB;

Type
  TRptCartaCob = Class(TFrmCmReport)
    DsCarta: TwwDataSource;
    ppDados: TppBDEPipeline;
    RptCarta: TppReport;
    RptCartaHeaderBand1: TppHeaderBand;
    ppDetailBand14: TppDetailBand;
    RptCartaDBText6: TppDBText;
    RptCartaDBText7: TppDBText;
    RptCartaDBText8: TppDBText;
    RptCartaDBText9: TppDBText;
    RptCartaDBText10: TppDBText;
    RptCartaDBText13: TppDBText;
    RptCartaDBText12: TppDBText;
    RptCartaDBText11: TppDBText;
    RptCartaDBText14: TppDBText;
    RptCartaDBText15: TppDBText;
    RptCartaFooterBand1: TppFooterBand;
    RptCartaCalc2: TppSystemVariable;
    RptCartaGroup1: TppGroup;
    RptCartaGroupHeaderBand1: TppGroupHeaderBand;
    RptCartaLabel2: TppLabel;
    RptCartaDBText2: TppDBText;
    RptCartaLabel7: TppLabel;
    RptCartaLabel8: TppLabel;
    RptCartaLabel9: TppLabel;
    RptCartaLabel10: TppLabel;
    RptCartaLabel11: TppLabel;
    RptCartaLabel12: TppLabel;
    RptCartaLabel13: TppLabel;
    RptCartaLabel14: TppLabel;
    RptCartaLabel15: TppLabel;
    RptCartaLabel4: TppLabel;
    RptCartaDBText3: TppDBText;
    RptCartaDBText4: TppDBText;
    RptCartaDBText5: TppDBText;
    RptCartaDBText1: TppDBText;
    RptCartaLabel1: TppLabel;
    RptCartaGroupFooterBand1: TppGroupFooterBand;
    RptCartaLabel5: TppLabel;
    RptCartaLabel6: TppLabel;
    RptCartaDBCalc4: TppDBCalc;
    RptCartaDBCalc3: TppDBCalc;
    RptCartaDBCalc2: TppDBCalc;
    RptCartaDBCalc1: TppDBCalc;
    RptCartaDBCalc5: TppDBCalc;
    SqlCarta: TCMSqlParams;
    CdsCarta: TCMClientDataSet;
    SqlTel: TCMSqlParams;
    CdsTel: TCMClientDataSet;
    CdsReports: TCMClientDataSet;
    SqlReports: TCMSqlParams;
    MemReports: TMemo;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Documento: TCtrlDocumento;
  public
    { Public declarations }
  End;

Var
  RptCartaCob: TRptCartaCob;

Implementation

Uses uModeloRelatCM, uSistema;

{$R *.DFM}

Procedure TRptCartaCob.CrmRptCMBeforePrint(Sender: TObject);
Var
  sInicio, sLimite, sSql: String;
  iAtraso, iFinal: Integer;
  rCorrecao, rIndiceCorrecao, rIndiceCorrecaoHoje, rValorJuros : Real;
Begin
  Inherited;

//  sSql := 'SELECT /*+ RULE */ 0 as valorprincipal,' +   #13+    //Everson TIBERO
  sSql := 'SELECT 0 as valorprincipal,' +   #13+                  //Everson TIBERO
    ' P.RAZAOSOCIAL, ' +  #13+
    ' DOCUMENTO.CODDOCUMENTO, ' +  #13+
    ' RTRIM(TO_CHAR(DOCUMENTO.NODOCUMENTO)) || ''' + ' ' +
    ''' || DOCUMENTO.COMPLDOCUMENTO AS NUMDOC, ' + #13+
    ' DOCUMENTO.DATAVENCTO, ' + #13+
    ' DOCUMENTO.DATAPROGRAMADA, ' + #13+
    ' DOCUMENTO.DATAEMISSAO, ' + #13+
    ' DOCUMENTO.INDICECORRECAO, ' + #13+
    ' DOCUMENTO.VLRMULTA, ' + #13+
    ' DOCUMENTO.VALORJUROS, ' + #13+
    ' P.IDPESSOA,        ' + #13+
    ' SUM(DECODE(DOCUMENTO.RECPAG,''P'',DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR),DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR,LANCTODOCUM.VALOR*-1))) AS VALORLIQUIDO, ' +  #13+
    ' SUM(DECODE(DOCUMENTO.RECPAG,''P'',DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR),DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOR,LANCTODOCUM.VALOR*-1))) AS SALDO, ' +  #13+
    ' SUM(DECODE(DOCUMENTO.RECPAG,''P'',DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOROUTRAMOEDA*-1,LANCTODOCUM.VALOROUTRAMOEDA),DECODE(LANCTODOCUM.DEBCRE,''D'',LANCTODOCUM.VALOROUTRAMOEDA,LANCTODOCUM.VALOROUTRAMOEDA*-1))) AS SALDOOM, ' +  #13+
    ' E.Logradouro || '','' || E.Numero || ''/'' || E.Complemento || '' '' || E.BAIRRO AS ENDERECLI1, ' + #13+
    ' E.CEP ||  '' - '' || C.NOME || '' - '' || ES.CODESTADO AS ENDERECLI2 ,e.idendereco,' +  #13+
    ' ''(''|| ''     '' || ''' + ') ' +
    ''' || ''                    '' AS TELCLI,' +
    ' ''(''|| ''     '' || ''' + ') ' +
    ''' || ''                    '' AS TELfax' +
    ' FROM ' +  #13+
    ' DOCUMENTO, LANCTODOCUM, PESSOA P, ' +  #13+
    ' ENDPESS E, CIDADES C, ESTADO ES ' +  #13+
    'WHERE ' +  #13+
    ' documento.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 + ' and b.idusuario=' +
    Floattostr(CrmRptCM.IdUsuario) +  #13+
    ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +  ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +  ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
    Floattostr(CrmRptCM.idusuario) + ')) and ' +  #13+
    ' (DOCUMENTO.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ' + #13+
    ' ((RTRIM(DOCUMENTO.STATUS) <> ''2'') OR (DOCUMENTO.STATUS IS NULL))'+  #13;

  If (Not CmpRptCM.ParamValues[5].isnull) Then
    sSql := sSql + ' AND (DOCUMENTO.DATAEMISSAO = To_Date(''' +  CmpRptCM.ParamValues[5].AsString + ''',''dd/mm/yyyy'')) ' + #13;
  sSql := sSql + ' AND (DOCUMENTO.RECPAG =  ''' + ParamIntegra.RecPag + ''' ) ' + #13;

  If (Not CmpRptCM.ParamValues[1].isnull) Then
    sSql := sSql + ' AND (DOCUMENTO.CODPORTFORMA =  ' + CmpRptCM.ParamValues[1].AsString + ') ' + #13; //maria 08/2000

  If Not CmpRptCM.ParamValues[2].isnull Then
    sSql := sSql + ' AND (DOCUMENTO.IDFORCLI = ' + CmpRptCM.ParamValues[2].Value + ') '+  #13 ;

  If ((Not CmpRptCM.ParamValues[3].isnull) Or (Not
    CmpRptCM.ParamValues[4].isnull)) Then
  Begin
    iAtraso := CmpRptCM.ParamValues[3].value;
    iFinal := CmpRptCM.ParamValues[4].value;
    sInicio := DateToStr(Now - iAtraso);
    sLimite := DateToStr(Now - iFinal);
    sSql := sSql + ' AND (DOCUMENTO.DATAPROGRAMADA BETWEEN TO_DATE(''' + sLimite + ''',''DD/MM/YYYY'')' +  ' AND TO_DATE(''' + sinicio + ''',''DD/MM/YYYY''))';
  End;

  //Filtra pelo número do documento
  If ((Not CmpRptCM.ParamValues[6].isnull) Or (Not
    CmpRptCM.ParamValues[6].isnull)) Then
    sSql := sSql + ' AND ( DOCUMENTO.NODOCUMENTO BETWEEN ' + CmpRptCM.ParamValues[6].asstring + ' AND  ' + CmpRptCM.ParamValues[7].asstring + ' ) ';

  sSql := sSql +
    ' AND ((DOCUMENTO.OPERACAO = ''1'' AND (RTRIM(DOCUMENTO.STATUS) <> ''2'') or (documento.status is null)) OR DOCUMENTO.OPERACAO = ''2'' OR DOCUMENTO.OPERACAO = ''3'') ' +  #13+
    ' AND (LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO) ' +  #13+
    ' AND (DOCUMENTO.IDFORCLI = P.IDPESSOA) ' +  #13+
    ' AND (P.IDPESSOA = E.IDPESSOA(+)) and (lanctodocum.estorno is null )' +  #13+
    ' AND (E.IDCIDADES = C.IDCIDADES(+)) ' +  #13+
    ' AND (DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO) ' +  #13+
    ' AND (ES.IDESTADO(+) = C.IDESTADO)  ';

  Case CmpRptCM.ParamValues[8].AsInteger Of
    0: sSql := sSql + ' AND (E.IDENDERECO(+) = P.IDENDCOMERCIAL) ';
    1: sSql := sSql + ' AND (E.IDENDERECO(+) = P.IDENDCOBRANCA) ';
  End;

  sSql := sSql +
    'GROUP BY ' +
    ' P.RAZAOSOCIAL, ' +
    ' DOCUMENTO.CODDOCUMENTO, ' +
    ' RTRIM(TO_CHAR(DOCUMENTO.NODOCUMENTO)) || ''' + ' ' +
    ''' || DOCUMENTO.COMPLDOCUMENTO, ' +
    ' DOCUMENTO.DATAVENCTO, ' +
    ' DOCUMENTO.DATAPROGRAMADA, ' +
    ' DOCUMENTO.DATAEMISSAO, ' +
    ' DOCUMENTO.INDICECORRECAO, ' +
    ' DOCUMENTO.VLRMULTA, ' +
    ' DOCUMENTO.VALORJUROS, ' +
    ' P.IDPESSOA,        ' +
    ' E.Logradouro || '','' || E.Numero || ''/'' || E.Complemento || '' '' || E.BAIRRO, ' +
    ' E.CEP ||  '' - '' || C.NOME || '' - '' || ES.CODESTADO, e.idendereco ' +
    ' ORDER BY P.RAZAOSOCIAL, P.IDPESSOA, DOCUMENTO.DATAPROGRAMADA';

  sqlCarta.sql.Text := sSql;
  sqlCarta.prepare;
  sqlCarta.open;
  //Calcula Juros e Correção
  If Not CdsCarta.IsEmpty Then
  Begin
    CdsCarta.First;
    While Not CdsCarta.Eof Do
    Begin
      CdsCarta.Edit;
      CdsCarta.FieldByName('valorprincipal').AsFloat :=
        CdsCarta.FieldByName('SALDO').AsFloat;
      Documento.Saldo.CalculaSaldo(CdsCarta.FieldByName('coddocumento').Asinteger);
      CdsCarta.FieldByName('SALDO').AsFloat := Documento.Saldo.Valor;
      CdsCarta.FieldByName('VALORLIQUIDO').AsFloat := Documento.Saldo.Valor;
      CdsCarta.FieldByName('SALDOom').AsFloat := Documento.Saldo.ValorOM;
      CdsCarta.post;
      If ((Not CdsCarta.FieldByName('INDICECORRECAO').IsNull) And
        (CdsCarta.FieldByName('INDICECORRECAO').value <> 0)) Or ((Not CdsCarta.FieldByName('VLRMULTA').IsNull) And
        (CdsCarta.FieldByName('VLRMULTA').value <> 0)) Or ((Not CdsCarta.FieldByName('VALORJUROS').IsNull) And
        (CdsCarta.FieldByName('VALORJUROS').value <> 0)) Then
      Begin
        rCorrecao := 0;
        If Not CdsCarta.FieldByName('INDICECORRECAO').IsNull Then
        Begin
          rIndiceCorrecao := FuncaoGeral.TestaCotacaoMoeda(CdsCarta.FieldByName('INDICECORRECAO').AsInteger,
            CdsCarta.FieldByName('DataVencto').AsString, 'N');
          rIndiceCorrecaoHoje := FuncaoGeral.TestaCotacaoMoeda(CdsCarta.FieldByName('INDICECORRECAO').AsInteger,
            DateToStr(Date), 'N');
          If (rIndiceCorrecaoHoje <> 0) And (rIndiceCorrecao <> 0) Then
            rCorrecao := (CdsCarta.FieldByName('SALDO').AsFloat * rIndiceCorrecaoHoje / rIndiceCorrecao) -
              CdsCarta.FieldByName('SALDO').AsFloat;
        End;
        rValorJuros := CdsCarta.FieldByName('VLRMULTA').AsFloat + rCorrecao +
          (CdsCarta.FieldByName('VALORJUROS').AsFloat * (Date - CdsCarta.FieldByName('DataVencto').AsDateTime));

        CdsCarta.edit;
        CdsCarta.FieldByName('SALDO').AsFloat := CdsCarta.FieldByName('SALDO').AsFloat + rValorJuros;
        CdsCarta.post;
      End
      Else
      Begin
        If CmpRptCM.ParamValues[9].AsBoolean Then
        Begin
          CdsCarta.Edit;
          CdsCarta.FieldByName('VALORJUROS').AsFloat := ((CdsCarta.FieldByName('SALDO').AsFloat *
            CmpRptCM.ParamValues[10].AsFloat) / 100) * (Date - CdsCarta.FieldByName('DataVencto').AsDateTime);
          CdsCarta.FieldByName('SALDO').AsFloat := CdsCarta.FieldByName('SALDO').AsFloat + CdsCarta.FieldByName('VALORJUROS').AsFloat;
          CdsCarta.post;
        End
      End;
      If CdsCarta.State = DsEdit Then
        CdsCarta.Post;
      Cdstel.close;
      sqlTel.prepare;
      Sqltel.params[0].AsInteger :=
        CdsCarta.FieldByName('idendereco').Asinteger;
      sqlTel.open;
      If Not CdsTel.isempty Then
      Begin
        CdsCarta.edit;
        CdsCarta.FieldByName('telcli').Asstring := '(' +
          copy(Cdstel.fieldbyname('DDD').asstring + '     ', 1, 5) + ') ' +
          Cdstel.fieldbyname('NUMERO').asstring;
        While Not Cdstel.eof Do
        Begin
          If pos('F', Cdstel.fieldbyname('tipo').asstring) > 0 Then
            CdsCarta.FieldByName('telfax').Asstring :=
              '(' + copy(Cdstel.fieldbyname('DDD').asstring + '     ', 1, 5) +
              ') ' + Cdstel.fieldbyname('NUMERO').asstring;
          Cdstel.next;
        End;
        CdsCarta.post;
      End;
      CdsCarta.Next;
    End;
  End;

  SqlReports.Prepare;
  SqlReports.Params[0].AsInteger := CmpRptCM.ParamValues[11].AsInteger;
  SqlReports.Params[1].AsInteger := CmpRptCM.ParamValues[12].AsInteger;
  SqlReports.Open;

  MemReports.Lines.Clear;
  MemReports.Lines.Text := CdsReports.FieldByName('TEMPLATE').AsString;

   ModeloRelatCM.SetaDataPipeline('RptCarta', 'PpCarta', 'FrmCartaCobrMT', 'ppConsulta', MemReports);

  MemReports.Lines.SaveToFile(Sistema.TempDir + ArqCmCartaCob);
  RptCarta.Template.FileName := Sistema.TempDir + ArqCmCartaCob;
  RptCarta.Template.LoadFromFile;

End;

Procedure TRptCartaCob.FormCreate(Sender: TObject);
Begin
  Inherited;
  Documento := TCtrlDocumento.Create;
  Documento.InitializeAs(ParamIntegra);
End;

End.

