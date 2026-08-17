{*******************************************************}
{ Analista Responsável: William M. Santos               }
{ Atualizado Em: 05/03/2010                             }
{                                                       }
{*******************************************************}

Unit uCtrlEtpDesdobramento;

Interface

Uses SysUtils, Controls, Db, DbClient, uCmDbObject, uCmControlObject, Forms,
   uCMClientDataSet, uDbEtpDesdobramento, dbtables, uDataBase, uCMTypes, Wwquery;

Type TCtrlEtpDesdobramento = Class(TCmControlObject)
   Private
      FDbEtpDesdobramento: TDbEtpDesdobramento;
      FCdsEtpDesdobramento: TCMClientDataSet;
      FIDEtpDesdobramento: Integer;
      Procedure SetDbEtpDesdobramento(Const Value: TDbEtpDesdobramento);
      Procedure SetCdsEtpDesdobramento(Const Value: TCMClientDataSet);
      Procedure SetIDEtpDesdobramento(Const Value: Integer);

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      //Renan Cristiano - INI
      Function ListDesdobramento(NumProcTrab, CodTipoRecurso, NumSeq: double): OleVariant;
      Function BuscaDescConta(idConta: integer): String;
      //Renan Cristiano - FIM

      Property DbEtpDesdobramento: TDbEtpDesdobramento Read FDbEtpDesdobramento Write SetDbEtpDesdobramento;
      Property CdsEtpDesdobramento: TCMClientDataSet Read FCdsEtpDesdobramento Write SetCdsEtpDesdobramento;
      Property IDEtpDesdobramento: Integer Read FIDEtpDesdobramento Write SetIDEtpDesdobramento;

      Function InserirEtpDesdobramento(pCds: TCMClientDataSet): Boolean;
      Function AlterarEtpDesdobramento(pIdEtpDesdobramento: Integer; pIdNumProcTrab: Integer; pCodtipoRecurso: Integer): Boolean;
      Function ApagarEtpDesdobramento(pIdEtpDesdobramento: Integer): Boolean;

      Function InicializaEtpDesdobramento: OleVariant;
      Function GravaEtpDesdobramento: Boolean;
      Function AplicaEtpDesdobramento: Boolean;
      Procedure ExcluiDesdobramento(NumProcTrab, CodTipoRecurso, NumSeq: Double);

   Protected
      Procedure DoChangeDataBase; Override;
      Procedure AfterInitialize; Override;

   End;

Implementation

//uses uCMTypes;

{ TCtrlEtpDesdobramento }

Procedure TCtrlEtpDesdobramento.AfterInitialize;
Begin
   Inherited;

End;

Function TCtrlEtpDesdobramento.AlterarEtpDesdobramento(pIdEtpDesdobramento,
   pIdNumProcTrab, pCodtipoRecurso: Integer): Boolean;
Begin
   //
End;

Function TCtrlEtpDesdobramento.ApagarEtpDesdobramento(
   pIdEtpDesdobramento: Integer): Boolean;
Begin
   //
End;

Function TCtrlEtpDesdobramento.AplicaEtpDesdobramento: Boolean;
Var
   Cds_: TCMClientDataSet;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin

         Result := Connection.AppServer.AplicaEtpDesdobramento;

         If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            //            If Not (InTransaction) Then
            //               StartTransaction;

            Result := ApplyCds(FCdsEtpDesdobramento, DbEtpDesdobramento, [], []);
            If Not Result Then Exception.Create(DbEtpDesdobramento.MessageInfo);

            IDEtpDesdobramento := DbEtpDesdobramento.Idtpdesdobramento.AsInteger;

            //   Commit;
         Except
            On E: Exception Do
               Begin
                  Result := False;
                  Rollback;
                  MessageInfo := E.Message;
               End;
         End;
      End;

End;

Function TCtrlEtpDesdobramento.BuscaDescConta(idConta: integer): String;
Var
   Qry: TwwQuery;
   sSql: String;
Begin

   sSql := 'SELECT                                             ' + #13 +
      '  PC.IDBANCO ||'' / ''||PC.IDAGENCIA||'' / ''||PC.NOCONTACORR AS DESCPORTADOR ' + #13 +
      'FROM                                           ' + #13 +
      '  PORTADORCONTA PC                             ' + #13 +
      'WHERE PC.CODPORTADOR = ' + FloatToStr(idConta) + #13;

   Qry := TwwQuery.Create(Nil);
   Qry.DatabaseName := 'BaseDados';

   With Qry Do Begin
         Close;
         SQL.Clear;
         Sql.Add(sSql);
         Open;
      End;

   If Not (Qry.IsEmpty) Then
      Result := Qry.fieldByName('DESCPORTADOR').AsString;

End;

Constructor TCtrlEtpDesdobramento.Create;
Begin
   Inherited;
   FDbEtpDesdobramento := TDbEtpDesdobramento.Create(Self);
   FCdsEtpDesdobramento := TCMClientDataSet.Create(Nil);
End;

Destructor TCtrlEtpDesdobramento.Destroy;
Begin
   Inherited;
   FDbEtpDesdobramento.Free;
   FCdsEtpDesdobramento.Free;
End;

Procedure TCtrlEtpDesdobramento.DoChangeDataBase;
Begin
   Inherited;
   FDbEtpDesdobramento.DataBaseName := DataBaseName;
End;

Function TCtrlEtpDesdobramento.GravaEtpDesdobramento: Boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravaEtpDesdobramento;
         If Not (Result) Then
            Begin
               MessageInfo := Connection.AppServer.MessageInfo;
            End;
      End
   Else
      Begin
         Try

            {            If Not InTransaction Then
                           Begin
                              StartTransaction;
                           End;}

            Result := ApplyCds(FCdsEtpDesdobramento, FDbEtpDesdobramento, [], []);
            If (Result) Then
               Begin

                  //Commit;

                  While (Not FCdsEtpDesdobramento.Eof) Do
                     Begin
                        FCdsEtpDesdobramento.Delete;
                     End;

               End
            Else
               Raise Exception.Create(FDbEtpDesdobramento.MessageInfo);
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

Function TCtrlEtpDesdobramento.InicializaEtpDesdobramento: OleVariant;
Var
   sQuery: String;
Begin
   sQuery := 'SELECT * FROM ETPDESDOBRAMENTO WHERE 1=2 ';
   Result := GetDataPacket(sQuery);
End;

Function TCtrlEtpDesdobramento.InserirEtpDesdobramento(pCds: TCMClientDataSet): Boolean;
Begin
   If (pCds.IsEmpty) Then
      Begin
         If (FCdsEtpDesdobramento.Locate('NUMPROCTRAB', pCds.FieldByName('NUMPROCTRAB').asFloat, [])) Then
            FCdsEtpDesdobramento.Edit
         Else
            FCdsEtpDesdobramento.Insert;

         FCdsEtpDesdobramento.FieldByName('NUMPROCTRAB').asFloat := pCds.FieldByName('NUMPROCTRAB').asFloat;
         FCdsEtpDesdobramento.FieldByName('CODTIPORECURSO').asFloat := pCds.FieldByName('CODTIPORECURSO').asFloat;
         FCdsEtpDesdobramento.FieldByName('DATADEPOSITO').asDateTime := pCds.FieldByName('DATADEPOSITO').asDateTime;
         FCdsEtpDesdobramento.FieldByName('CODTIPORECURSO').asFloat := pCds.FieldByName('CODTIPORECURSO').asFloat;
         FCdsEtpDesdobramento.FieldByName('TPIMPUGCALCULO').asFloat := pCds.FieldByName('TPIMPUGCALCULO').asFloat;
         FCdsEtpDesdobramento.FieldByName('IDCBANCARIA').asFloat := pCds.FieldByName('IDCBANCARIA').asFloat;
         FCdsEtpDesdobramento.FieldByName('CODPORTADOR').asFloat := pCds.FieldByName('CODPORTADOR').asFloat;
         FCdsEtpDesdobramento.FieldByName('VLRCALCCONTADORIA').asFloat := pCds.FieldByName('VLRCALCCONTADORIA').asFloat;
         FCdsEtpDesdobramento.FieldByName('DATACONTADORIA').asDateTime := pCds.FieldByName('DATACONTADORIA').asDateTime;

         FCdsEtpDesdobramento.Post;
         Result := True;
      End;
End;

Function TCtrlEtpDesdobramento.ListDesdobramento(NumProcTrab, CodTipoRecurso, NumSeq: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT                                        ' + #13 +
      '  ED.IDTPDESDOBRAMENTO,                       ' + #13 +
      '  ED.NUMPROCTRAB,                             ' + #13 +
      '  ED.CODTIPORECURSO,                          ' + #13 +
      '  ED.TPDESDOBRAMENTO,                         ' + #13 +
      '  CASE ED.TPDESDOBRAMENTO                     ' + #13 +
      '    WHEN 1 THEN ''Controverso''               ' + #13 +
      '    WHEN 2 THEN ''Incontroverso''             ' + #13 +
      '  END DESCDESDOBRAMENTO,                      ' + #13 +
      '  ED.DATADEPOSITO,                            ' + #13 +
      '  ED.VLRCREDITADO,                            ' + #13 +
      '  ED.TPIMPUGCALCULO,                          ' + #13 +
      '  CASE ED.TPIMPUGCALCULO                      ' + #13 +
      '    WHEN 1 THEN ''Interno''                   ' + #13 +
      '    WHEN 2 THEN ''Externo''                   ' + #13 +
      '  END DESCTPIMPUGCALCULO,                     ' + #13 +
      '  ED.IDCBANCARIA,                             ' + #13 +
      '  ED.CODPORTADOR,                             ' + #13 +
      '  (SELECT PC.IDBANCO ||'' / ''||PC.IDAGENCIA||'' / ''||PC.NOCONTACORR FROM PORTADORCONTA PC ' + #13 +
      '  WHERE PC.CODPORTADOR = ED.CODPORTADOR) AS DESCPORTADOR, ' + #13 +
      '  (SELECT CB.IDAGENCIA||'' / ''||CB.CONTACORRENTE FROM CONTABANCARIA CB ' + #13 +
      '  WHERE CB.IDCBANCARIA = ED.IDCBANCARIA) AS DESCBANCARIA, ' + #13 +
      '  ED.VLRCALCCONTADORIA, ED.NUMSEQ, ED.DATACONTADORIA   ' + #13 +
      'FROM                                          ' + #13 +
      '  ETPDESDOBRAMENTO ED                         ' + #13 +
      'WHERE ED.NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + #13 +
      'AND ED.CODTIPORECURSO = ' + FloatToStr(CodTipoRecurso) + #13 +
      'AND ED.NUMSEQ = ' + FloatToStr(NumSeq));
End;

Procedure TCtrlEtpDesdobramento.ExcluiDesdobramento(NumProcTrab, CodTipoRecurso, NumSeq: Double);
Var Qry: TwwQuery;
Begin
   Qry := TwwQuery.Create(Nil);
   Qry.DatabaseName := 'BaseDados';
   Qry.Close;
   Qry.SQL.Clear;
   Qry.SQL.Add('DELETE ETPDESDOBRAMENTO');
   Qry.SQL.Add('WHERE NUMPROCTRAB = ' + quotedstr(floattostr(NumProcTrab)));
   Qry.SQL.Add('      AND CODTIPORECURSO  = ' + quotedstr(floattostr(CodTipoRecurso)));
   Qry.SQL.Add('      AND NUMSEQ  = ' + quotedstr(floattostr(NumSeq)));
   Qry.execsql;

   freeandnil(Qry);
End;

Procedure TCtrlEtpDesdobramento.SetCdsEtpDesdobramento(Const Value: TCMClientDataSet);
Begin
   FCdsEtpDesdobramento := Value;
End;

Procedure TCtrlEtpDesdobramento.SetDbEtpDesdobramento(Const Value: TDbEtpDesdobramento);
Begin
   FDbEtpDesdobramento := Value;
End;

Procedure TCtrlEtpDesdobramento.SetIDEtpDesdobramento(Const Value: Integer);
Begin
   FIDEtpDesdobramento := Value;
End;

End.

