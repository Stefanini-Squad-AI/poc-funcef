{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 28/08/2011                             }
{*******************************************************}

//******************************************************************************
//Rotina.............: getMascaraContaPlanoVigente
//N. SIG.............: 114455
//Data da Alteração..: 16/03/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de função para recuperação de máscara de contas
//                     contábeis.
//******************************************************************************

Unit uCtrlParametrosRelatorio;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbParametrosRelatorio, DB,
   uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF};

Type
   TCtrlParametrosRelatorio = Class(TCmControlObject)

   Private
      FDbParametrosRelatorio: TDbParametrosRelatorio;

      FCdsParametrosRelatorio: TClientDataSet;

      Procedure SetDbParametrosRelatorio(Const Value: TDbParametrosRelatorio);
      Procedure SetCdsParametrosRelatorio(Const Value: TClientDataSet);

   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsParametrosRelatorio: TClientDataSet Read FCdsParametrosRelatorio Write SetCdsParametrosRelatorio;
      Property DbParametrosRelatorio: TDbParametrosRelatorio Read FDbParametrosRelatorio Write setDbParametrosRelatorio;

      Function GravarParametrosRelatorio: Boolean;
      Function ProcurarParametrosRelatorio(iIdRelParam: Integer): OleVariant;
      Function ListParametrosRelatorio: OleVariant;
      function getMascaraContaPlanoVigente(pPeriodo: Integer = -1; pExercicio: integer = -1): string; //Cássio Rovaroto - SIG nº 114455
   Protected

   End;

Implementation

{ TCtrlNatuRendimento }

Constructor TCtrlParametrosRelatorio.Create;
Begin
   Inherited;
   FDbParametrosRelatorio := TDbParametrosRelatorio.create(self);
End;

Destructor TCtrlParametrosRelatorio.Destroy;
Begin
   FDbParametrosRelatorio.Free;
   If isAppServer Then
      Begin
         FCdsParametrosRelatorio.free;
      End;
   Inherited;
End;

Procedure TCtrlParametrosRelatorio.DoChangeDataBase;
Begin
   Inherited;
   DbParametrosRelatorio.DataBaseName := DataBaseName;
End;

Procedure TCtrlParametrosRelatorio.SetCdsParametrosRelatorio(Const Value: TClientDataSet);
Begin
   FCdsParametrosRelatorio := Value;
End;

Procedure TCtrlParametrosRelatorio.SetDbParametrosRelatorio(Const Value: TDbParametrosRelatorio);
Begin
   FDbParametrosRelatorio := Value;
End;

Function TCtrlParametrosRelatorio.GravarParametrosRelatorio: Boolean;
Var
   Msg: String;
Begin
   Try
      StartTransaction;
      // Pai
      Result := ApplyCds(FCdsParametrosRelatorio, FDbParametrosRelatorio, [], []);
      Msg := FDbParametrosRelatorio.MessageInfo;
      If Not Result Then
         Raise Exception.Create(Msg);
      Commit;
   Except
      On E: Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
End;

Function TCtrlParametrosRelatorio.ProcurarParametrosRelatorio(iIdRelParam: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      '  FROM PARAMETROS_RELATORIO ' + #13#10 +
      ' WHERE IDRelParam = ' + IntToStr(iIdRelParam);
   Result := GetDataPacket(sSql);
End;

Procedure TCtrlParametrosRelatorio.OnCreateAppServer;
Begin
   Inherited;
   FcdsParametrosRelatorio := TClientDataSet.Create(Nil);
End;

Function TCtrlParametrosRelatorio.ListParametrosRelatorio: OleVariant;
Var
   sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      '  FROM PARAMETROS_RELATORIO ' + #13#10 +
      ' ORDER BY IdRelParam';
   Result := GetDataPacket(sSql);
End;

function TCtrlParametrosRelatorio.getMascaraContaPlanoVigente(pPeriodo: integer = -1; pExercicio: integer = -1): string;
(*
Esta função retornará a máscara de contas contábeis de um plano de contas.
Existem dois parâmetros não obrigatórios de preenchimento; datas inicial e final
de vigência do plano de contas; se não for passado nenhuma data, trará a máscara
do plano de contas vigente.
*)
var sSQL: string;
    cds: TClientDataSet;
    sData: string;
begin
  Result := EmptyStr;
  cds := TClientDataSet.Create(nil);
  if (pPeriodo > 0) and (pExercicio > 0 ) then
    sData := '01/' + StringOfChar('0', 2 - Length(IntToStr(pPeriodo))) + IntToStr(pPeriodo) + '/' + IntToStr(pExercicio);

  try
    sSQL := 'SELECT P.MASCARA                                 ' + #13#10+
            '  FROM CM.PLANO P                                ' + #13#10+
            '  JOIN CM.PLANODATA PD ON PD.PLANO = P.PLANO     ' + #13#10;

    if not (sData = EmptyStr) then
      sSQL := sSQL + ' WHERE PD.DATAINICIO <= TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'')' +  #13#10+
                     '   AND PD.DATAFIM >= TO_DATE(' + QuotedStr(sData) + ', ''DD/MM/YYYY'')' +  #13#10
    else
      sSQL := sSQL + '  JOIN CM.PARAMCONTAB  PC ON PC.PLANO  = P.PLANO ' + #13#10;


    cds.Data := GetDataPacket(sSQL);
    Result := cds.FieldByName('MASCARA').AsString;
  finally
    FreeAndNil(cds);
  end;
end;

End.
