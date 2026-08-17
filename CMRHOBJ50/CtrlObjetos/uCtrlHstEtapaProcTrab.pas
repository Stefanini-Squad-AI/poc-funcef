//Rotina..........:
//N. Sol..........: 124767
//N. Kintana......: 637517
//Data............: 24/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementado ajuste para corrigir o problema de desfazer correção monetária,
//                    pois não estava gravando valor das custas na hstetapaproctrab.
//************************************************************************************************
//Rotina..........:
//N. Sol..........: 122631
//N. Kintana......: 604039
//Data............: 14/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para trazer as etapas referentes ao processo selecionado RM JUR-2009.08.
//********************************************************************************************************
//Rotina..........: InserirHstetapaproctrab
//N. Sol..........: 133388
//N. Kintana......: 527285
//Data............: 11/09/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: implementação de atualização de custas na tela de atualização e
//                  correção monetária dos recursos.
//************************************************************************************************
//Rotina..........: btnVerHistoricoEtapasClick
//N. Sol..........: 122630
//N. Kintana......: 604044
//Data............: 04/08/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Implementação para criação do histórico para custas lançadas na etapa de
//                  Recurso de Revista e Recurso Ordinário.
//*****************************************************************************************
//Rotina..........: TfrmCorrecaoMonet.bbtnConfirmarClick
//N. Sol..........: 116516
//N. Kintana......: 546989
//Data............: 09/06/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Ajuste para corrigir o problema:
//                  Depósito Recursal - atualização e montagem do
//                  histórico 4 ? Crítica do sistema informando que a atualização/correção
//                  deverá ser realizada contínuo-mensalmente, ou seja, mês a mês;
//******************************************************************************************
Unit uCtrlHstetapaproctrab;

Interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
   uCmTypes, uDbHstetapaproctrab, dbtables, Wwquery;

Type
   TCtrlHstetapaproctrab = Class(TCmControlObject)
   Private
      FCdsHstetapaproctrab: TCMClientDataSet;
      FDbHstetapaproctrab: TDbHstetapaproctrab;
      Procedure SetCdsHstetapaproctrab(Const Value: TCMClientDataSet);
      Procedure SetDbHstetapaproctrab(Const Value: TDbHstetapaproctrab);

   Protected
      Procedure DoChangeDataBase; Override;
      Procedure AfterInitialize; Override;

   Public

      Constructor Create; Override;
      Destructor Destroy; Override;

      Property DbHstetapaproctrab: TDbHstetapaproctrab Read FDbHstetapaproctrab Write SetDbHstetapaproctrab;
      Property CdsHstetapaproctrab: TCMClientDataSet Read FCdsHstetapaproctrab Write SetCdsHstetapaproctrab;

      Function InserirHstetapaproctrab(_CdsParam: TCMClientDataSet): Boolean;
      Function AlterarHstetapaproctrab: Boolean; // Opcional
      Function ExcluirHstetapaproctrab(Idhistetapaproc: Integer): Boolean; // Opcional

      Function SelecionaHstetapaproctrab(NumProcTrab, NumSeq, CodTipoRecurso: Double): OleVariant;
      Function InicialisaHstetapaproctrab: OleVariant;
      Function GravaHstetapaproctrab: boolean;
      Function PodeInserirHstEtapaProcTrab(_CdsParam: TCMClientDataSet): Boolean;
      Function BuscaHistoricoUltimo(dNumProcTrab: Double; sSeq: String): OleVariant;
      // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
      Function DeletaHistorico(sNumProcTrab, sSeq, sData: String): Boolean;
      //
      Function AchouCotacao(iCodMoeda: Integer; sDataCotacao: String): Boolean;
      Procedure SetCorrecao(bOk: Boolean);
      Function GetCorrecao: Boolean;

   Published
   End;

Implementation

Var
   bCorrecao: Boolean;

   { TCtrlHstetapaproctrab }

Procedure TCtrlHstetapaproctrab.AfterInitialize;
Begin
   Inherited;

End;

Function TCtrlHstetapaproctrab.AlterarHstetapaproctrab: Boolean;
Begin

End;

Constructor TCtrlHstetapaproctrab.Create;
Begin
   Inherited;

   FDbHstetapaproctrab := TDbHstetapaproctrab.Create(Self);
   FCdsHstetapaproctrab := TCMClientDataSet.Create(Nil);

End;

Destructor TCtrlHstetapaproctrab.Destroy;
Begin
   Inherited;

   FDbHstetapaproctrab.Free;
   FCdsHstetapaproctrab.Free;

End;

Procedure TCtrlHstetapaproctrab.DoChangeDataBase;
Begin
   Inherited;
   FDbHstetapaproctrab.DataBaseName := DataBaseName;

End;

Function TCtrlHstetapaproctrab.ExcluirHstetapaproctrab(Idhistetapaproc: Integer): Boolean;
Begin

End;

Function TCtrlHstetapaproctrab.GravaHstetapaproctrab: boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarHstObjProcTrab;
         If Not (Result) Then
            Begin
               MessageInfo := Connection.AppServer.MessageInfo;
            End;
      End
   Else
      Begin
         Try

            If Not InTransaction Then
               Begin
                  StartTransaction;
               End;

            Result := ApplyCds(FCdsHstetapaproctrab, FDbHstetapaproctrab, [], []);
            If (Result) Then
               Begin

                  Commit;

                  While (Not FCdsHstetapaproctrab.Eof) Do
                     Begin
                        FCdsHstetapaproctrab.Delete;
                     End;

               End
            Else
               Raise Exception.Create(FDbHstetapaproctrab.MessageInfo);
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlHstetapaproctrab.InserirHstetapaproctrab(_CdsParam: TCMClientDataSet): Boolean;
Var
   qryAux2: Twwquery;
Begin
   qryAux2 := Twwquery.Create(Nil);

   // Inserir a Etapa no Histórico
   qryAux2.DataBaseName := 'BaseDados';
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add('INSERT INTO HSTETAPAPROCTRAB (                      ');
   qryAux2.SQL.Add('idhistetapaproc, numproctrab, numseq, dataatu,      ');
   qryAux2.SQL.Add('valoratu, assunto, codtiporecurso, valoratucustas ) ');
   qryAux2.Sql.Add('VALUES (CM.SEQHSTETAPAPROCTRAB.NEXTVAL, :p2, :p3, :p4, :p5, :p6, :p7, :p8 ) ');
   qryAux2.Parambyname('p2').asFloat := _CdsParam.FieldByName('NUMPROCTRAB').asFloat;
   qryAux2.Parambyname('p3').asFloat := _CdsParam.FieldByName('NUMSEQ').asFloat;
   If _CdsParam.FieldByName('DATAPREVOCORR').AsDateTime = 0 Then
      qryAux2.Parambyname('p4').AsDateTime := _CdsParam.FieldByName('DATAREALOCOR').AsDateTime
   Else
      qryAux2.Parambyname('p4').AsDateTime := _CdsParam.FieldByName('DATAPREVOCORR').AsDateTime;
   qryAux2.Parambyname('p5').asFloat := _CdsParam.FieldByName('VALORREC').asFloat;
   qryAux2.Parambyname('p6').asString := _CdsParam.FieldByName('ASSUNTO').AsString;
   qryAux2.Parambyname('p7').AsFloat := _CdsParam.FieldByName('CODTIPORECURSO').AsFloat;
   qryAux2.Parambyname('p8').AsFloat := _CdsParam.FieldByName('VALORCUSTAS').asFloat;
   qryAux2.execSQL;

   qryAux2.Free;
End;

Function TCtrlHstetapaproctrab.SelecionaHstetapaproctrab(NumProcTrab, NumSeq, CodTipoRecurso: Double): OleVariant;
Var
   sQuery: String;
Begin
   sQuery := 'SELECT H.NUMPROCTRAB, H.NUMSEQ, T.CODTIPORECURSO, T.MOECODIGO, H.DATAATU,  ' + #13 +
      ' TO_CHAR(H.DATAATU, ' + QuotedStr('DD/MM/YYYY') + ') AS DATA_ULTIMA_ATUALIZACAO,' + #13 +
      ' H.VALORATU ULTIMO_VALOR_ATUALIZADO, ' + #13 +
      ' H.VALORATUCUSTAS ULTIMA_CUSTAS_ATUALIZADA, ' + #13 +
      ' M.MOEDESC || ' + QuotedStr(' - ') + '  || TO_CHAR(T.INDJUROS) || ' + QuotedStr('%') + ' || ' + QuotedStr(' ') + ' || DECODE (T.INDJUROS, 0, ' + QuotedStr('Mensal') + ', 1, ' + #13 +
      QuotedStr('Trimestral') + ', 2, ' + QuotedStr('Semestral') + ', 3, ' + QuotedStr('Anual') + ') TIPO_AJUSTE, ' + #13 +
      ' H.TRGDTINCLUSAO, ' + #13 +
      ' H.TRGUSERINCLUSAO ' + #13 +
      ' FROM ' + #13 +
      ' HSTETAPAPROCTRAB H, ' + #13 +
      ' TIPORECTRAB T, ' + #13 +
      ' ETAPAPROCTRAB E, ' + #13 +
      ' MOEDA M ' + #13 +
      ' WHERE H.NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + '  AND ' + #13 +
      ' H.NUMSEQ         = ' + FloatToStr(NumSeq) + '  AND ' + #13 +
      ' H.CODTIPORECURSO = ' + FloatToStr(CodTipoRecurso) + '  AND ' + #13 +
      ' H.NUMPROCTRAB    = E.NUMPROCTRAB     AND ' + #13 +
      ' H.NUMSEQ         = E.NUMSEQ          AND ' + #13 +
      ' T.CODTIPORECURSO = H.CODTIPORECURSO  AND ' + #13 +
      ' T.MOECODIGO      = M.MOECODIGO         ' + #13 +
      ' ORDER BY H.DATAATU DESC';

   Result := GetDataPacket(sQuery);

End;

Procedure TCtrlHstetapaproctrab.SetCdsHstetapaproctrab(Const Value: TCMClientDataSet);
Begin
   FCdsHstetapaproctrab := Value;
End;

Procedure TCtrlHstetapaproctrab.SetDbHstetapaproctrab(Const Value: TDbHstetapaproctrab);
Begin
   FDbHstetapaproctrab := Value;
End;

Function TCtrlHstetapaproctrab.InicialisaHstetapaproctrab: OleVariant;
Var
   sQuery: String;
Begin

   sQuery := 'SELECT * FROM HSTETAPAPROCTRAB WHERE 1=2 ';
   Result := GetDataPacket(sQuery);

End;

Function TCtrlHstetapaproctrab.PodeInserirHstEtapaProcTrab(_CdsParam: TCMClientDataSet): Boolean;
Var
   _CdsAuxi: TCMClientDataSet;
   sQuery: String;
Begin

   Result := false;

   _CdsAuxi := TCMClientDataSet.Create(Nil);

   sQuery := ' SELECT NUMPROCTRAB, NUMSEQ, DATAATU FROM HSTETAPAPROCTRAB WHERE ' + #13 +
      ' NUMPROCTRAB = ' + QuotedStr(FloatToStr(_CdsParam.FieldByName('NUMPROCTRAB').asFloat)) + ' AND ' + #13 +
      ' NUMSEQ      = ' + QuotedStr(FloatToStr(_CdsParam.FieldByName('NUMSEQ').asFloat)) + ' AND ' + #13;

   If _CdsParam.FieldByName('DATAPREVOCORR').AsDateTime = 0 Then
      Begin
         sQuery := sQuery + ' DATAATU  = TO_DATE(' + QuotedStr(DateToStr(_CdsParam.FieldByName('DATAREALOCOR').AsDateTime)) + ',''DD/MM/YYYY'')';
      End
   Else
      Begin
         sQuery := sQuery + ' DATAATU  = TO_DATE(' + QuotedStr(DateToStr(_CdsParam.FieldByName('DATAPREVOCORR').AsDateTime)) + ',''DD/MM/YYYY'')';
      End;

   _CdsAuxi.Data := GetDataPacket(sQuery);

   If _CdsAuxi.RecordCount = 0 Then //--caso nao encontre é sinal q pode inserir--//
      Result := True;

   _CdsAuxi.Free;
End;

Function TCtrlHstetapaproctrab.BuscaHistoricoUltimo(dNumProcTrab: Double; sSeq: String): OleVariant;
Var
   _CdsAuxi: TCMClientDataSet;
   sQuery: String;
Begin
   _CdsAuxi := TCMClientDataSet.Create(Nil);

   sQuery := ' SELECT h1.NUMPROCTRAB, h1.NUMSEQ, h1.VALORATU, h1.DATAATU, h1.VALORATUCUSTAS FROM HSTETAPAPROCTRAB h1 WHERE ' + #13 +
      ' h1.NUMPROCTRAB = ' + QuotedStr(FloatToStr(dNumProcTrab)) + ' and ' + #13 +
      ' h1.NUMSEQ = ' + QuotedStr(sSeq) + ' and ' + #13 +
      ' h1.dataatu = (select max(h2.dataatu) from hstetapaproctrab h2 where h2.NUMPROCTRAB = ' + QuotedStr(FloatToStr(dNumProcTrab)) + ' and ' + #13 +
      ' h2.NUMSEQ = ' + QuotedStr(sSeq) + ' )';

   _CdsAuxi.Data := GetDataPacket(sQuery);

   Result := _CdsAuxi.Data;

   _CdsAuxi.Free;
End;

Function TCtrlHstetapaproctrab.DeletaHistorico(sNumProcTrab, sSeq, sData: String): Boolean;
Var
   sQuery: String;
Begin
   Result := False; // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
   sQuery := ' DELETE FROM HSTETAPAPROCTRAB WHERE NUMPROCTRAB = ' + QuotedStr(sNumProcTrab) + ' AND ' + #13 +
      ' NUMSEQ = ' + QuotedStr(sSeq) + ' AND ' + #13 +
      ' DATAATU >= TO_DATE(' + QuotedStr(sData) + ',''DD/MM/YYYY'')';
   Try
      If Not InTransaction Then StartTransaction;
      ExecSQL(sQuery);
      Commit;
      Result := True;
   Except
      On E: Exception Do
         Begin
            Rollback;
            MessageInfo := E.Message;
         End;
   End;
End;

Function TCtrlHstetapaproctrab.AchouCotacao(iCodMoeda: Integer; sDataCotacao: String): Boolean;
Var
   _CdsAuxi: TCMClientDataSet;
   sQuery: String;
   Year, Month, Day: Word;
Begin

   DecodeDate(StrToDate(sDataCotacao), Year, Month, Day);

   sDataCotacao := FormatFloat('00', Month) + IntToStr(Year);

   _CdsAuxi := TCMClientDataSet.Create(Nil);

   sQuery := 'SELECT * FROM COTACAOMOEDA WHERE ' + #13 +
      ' MOECODIGO = ' + QuotedStr(IntToStr(iCodMoeda)) + ' AND ' + #13 +
      ' COTMESREF = ' + QuotedStr(sDataCotacao);

   _CdsAuxi.Data := GetDataPacket(sQuery);

   If _CdsAuxi.Eof Then
      Begin
         SetCorrecao(False);
         Result := False;
      End
   Else
      Begin
         SetCorrecao(True);
         Result := True;
      End;

   _CdsAuxi.Free;

End;

Function TCtrlHstetapaproctrab.GetCorrecao: Boolean;
Begin
   Result := bCorrecao;
End;

Procedure TCtrlHstetapaproctrab.SetCorrecao(bOk: Boolean);
Begin
   bCorrecao := bOk;
End;

End.

