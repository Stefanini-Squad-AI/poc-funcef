{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 19/09/2011                             }
{*******************************************************}
Unit uCtrlTipoRelatorio;

{*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 26/08/2013
Kintana..: 1235889
Sol......: 155850
Descrição: Inclusão da Funcionalidade SPED
*******************************************************************************}


Interface

Uses SysUtils, uCmControlObject, uCmDbObject, UDbTipoRelatorio, DB,
   uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF},
   uCmClientDataSet;

Type
   TCtrlTipoRelatorio = Class(TCmControlObject)
   Private
      FDbTipoRelatorio: TDbTipoRelatorio;
      FCdsTipoRelatorio: TCMClientDataSet;
      Procedure SetDbTipoRelatorio(Const Value: TDbTipoRelatorio);
      Procedure SetCdsTipoRelatorio(Const Value: TCMClientDataSet);
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsTipoRelatorio: TCMClientDataSet Read FCdsTipoRelatorio Write SetCdsTipoRelatorio;
      Property DbTipoRelatorio: TDbTipoRelatorio Read FDbTipoRelatorio Write setDbTipoRelatorio;

      Function GravarTipoRelatorio: Boolean;
      Function ProcurarTipoRelatorio(iIdLinha: Integer): OleVariant;
      Function ListTipoRelatorio(sTipo : string = ''): OleVariant;       // Edilaine - SOL 155850 / KTN 1235889
   End;

Implementation

{ TCtrlNatuRendimento }

Constructor TCtrlTipoRelatorio.Create;
Begin
   Inherited;
   FDbTipoRelatorio := TDbTipoRelatorio.create(self);
End;

Destructor TCtrlTipoRelatorio.Destroy;
Begin
   FDbTipoRelatorio.Free;
   If isAppServer Then
      Begin
         FCdsTipoRelatorio.free;
      End;
   Inherited;
End;

Procedure TCtrlTipoRelatorio.DoChangeDataBase;
Begin
   Inherited;
   DbTipoRelatorio.DataBaseName := DataBaseName;
End;

Procedure TCtrlTipoRelatorio.SetCdsTipoRelatorio(Const Value: TCMClientDataSet);
Begin
   FCdsTipoRelatorio := Value;
End;

Procedure TCtrlTipoRelatorio.SetDbTipoRelatorio(Const Value: TDbTipoRelatorio);
Begin
   FDbTipoRelatorio := Value;
End;

Function TCtrlTipoRelatorio.GravarTipoRelatorio: Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      // Pai
      Result := ApplyCds(FCdsTipoRelatorio, FDbTipoRelatorio, [], []);
      Msg := FDbTipoRelatorio.MessageInfo;
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

Function TCtrlTipoRelatorio.ProcurarTipoRelatorio(iIdLinha: Integer): OleVariant;
Var sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      'FROM Tipo_Relatorio' + #13#10 +
      'WHERE IDLinha = ' + IntToStr(iIdLinha);
   Result := GetDataPacket(sSql);
End;

Procedure TCtrlTipoRelatorio.OnCreateAppServer;
Begin
   Inherited;
   FcdsTipoRelatorio := TCMClientDataSet.Create(Nil);
End;

Function TCtrlTipoRelatorio.ListTipoRelatorio(sTipo : string): OleVariant;
Var sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      'FROM Tipo_Relatorio';

   // Edilaine - SOL 155850 / KTN 1235889
   if sTipo <> '' then
      sSql := sSql + ' WHERE TIPO = '+Quotedstr(sTipo);

   Result := GetDataPacket(sSql);
End;

End.
