{
//******************************************************************************
//N. Sol..........: SOL 206751
//N. Kintana......: ktn 1999210
//Data............: 13/05/2013
//Responsável.....: Thiago Melo
//Descrição.......: Não grava alterações inclusoes de linhas de relatorio
//******************************************************************************

*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 28/08/2011                             }
{*******************************************************}
Unit uCtrlNaturezaLinha;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbNaturezaLinha, DB,
   uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF};

Type
   TCtrlNaturezaLinha = Class(TCmControlObject)

   Private
      FDbNaturezaLinha: TDbNaturezaLinha;

      FCdsNaturezaLinha: TClientDataSet;

      Procedure SetDbNaturezaLinha(Const Value: TDbNaturezaLinha);
      Procedure SetCdsNaturezaLinha(Const Value: TClientDataSet);

   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsNaturezaLinha: TClientDataSet Read FCdsNaturezaLinha Write SetCdsNaturezaLinha;
      Property DbNaturezaLinha: TDbNaturezaLinha Read FDbNaturezaLinha Write setDbNaturezaLinha;

      Function GravarNaturezaLinha: Boolean;
      Function ProcurarNaturezaLinha(iIdNatureza: Integer): OleVariant;
      Function ProcurarNaturezaLinhaByDescricao(pDescricao: String): Integer;
      Function ProcurarCatedoriaByDescricao(pDescricao: String): Integer;      
      Function ListNaturezaLinha: OleVariant;
      Function ListTipoCategoria: OleVariant;
   Protected

   End;

Implementation

Constructor TCtrlNaturezaLinha.Create;
Begin
   Inherited;
   FDbNaturezaLinha := TDbNaturezaLinha.Create(self);
End;

Destructor TCtrlNaturezaLinha.Destroy;
Begin
   FDbNaturezaLinha.Free;
   If isAppServer Then
      Begin
         FCdsNaturezaLinha.free;
      End;
   Inherited;
End;

Procedure TCtrlNaturezaLinha.DoChangeDataBase;
Begin
   Inherited;
   DbNaturezaLinha.DataBaseName := DataBaseName;
End;

Procedure TCtrlNaturezaLinha.SetCdsNaturezaLinha(Const Value: TClientDataSet);
Begin
   FCdsNaturezaLinha := Value;
End;

Procedure TCtrlNaturezaLinha.SetDbNaturezaLinha(Const Value: TDbNaturezaLinha);
Begin
   FDbNaturezaLinha := Value;
End;

Function TCtrlNaturezaLinha.GravarNaturezaLinha: Boolean;
Var
   Msg: String;
Begin
   Try
      StartTransaction;
      // Pai
      Result := ApplyCds(FCdsNaturezaLinha, FDbNaturezaLinha, [], []);
      Msg := FDbNaturezaLinha.MessageInfo;
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

Function TCtrlNaturezaLinha.ProcurarNaturezaLinha(iIdNatureza: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      '  FROM Natureza_Linha ' + #13#10 +
      ' WHERE IDNatureza = ' + IntToStr(iIdNatureza);
   Result := GetDataPacket(sSql);
End;

Procedure TCtrlNaturezaLinha.OnCreateAppServer;
Begin
   Inherited;
   FcdsNaturezaLinha := TClientDataSet.Create(Nil);
End;

Function TCtrlNaturezaLinha.ProcurarCatedoriaByDescricao(pDescricao: String): Integer;
Var
  sSql: String;
  oCds: TClientDataSet;
Begin
  oCds := TClientDataSet.Create(Nil);
  // Thiago Melo SOL 206751 ktn 1999210
  //  sSql := 'SELECT IDTIPODECATEGORIA AS IDCATEGORIA, DESCRICAOCATEGORIA AS CATEGORIA FROM  TIPODECATEGORIA';
  sSql := 'SELECT IDTIPODECATEGORIA, DESCRICAOCATEGORIA AS CATEGORIA FROM  TIPODECATEGORIA';
  // Thiago Melo SOL 206751 ktn 1999210
  sSql := sSql + ' WHERE DESCRICAOCATEGORIA = ' + QuotedStr(pDescricao);
  oCds.Data := GetDataPacket(sSql);
  Result := oCds.FieldByName('IDTIPODECATEGORIA').asInteger;
  oCds.Close;
  FreeAndNil(oCds);
End;



Function TCtrlNaturezaLinha.ListNaturezaLinha: OleVariant;
Var
   sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      '  FROM Natureza_Linha ' + #13#10 +
      ' ORDER BY IdNatureza';
   Result := GetDataPacket(sSql);
End;

Function TCtrlNaturezaLinha.ListTipoCategoria: OleVariant;
Var
  sSql: String;
Begin
  sSql := 'SELECT IDTIPODECATEGORIA AS ID, DESCRICAOCATEGORIA AS CATEGORIA ';
  sSql := sSql + 'FROM  TIPODECATEGORIA ORDER BY IDTIPODECATEGORIA';
  Result := GetDataPacket(sSql);
End;


Function TCtrlNaturezaLinha.ProcurarNaturezaLinhaByDescricao(pDescricao: String): Integer;
Var sSql: String;
   oCds: TClientDataSet;
Begin
   oCds := TClientDataSet.Create(Nil);
   sSql := 'SELECT IdNatureza,Descricao ' + #13#10 +
      '  FROM Natureza_Linha ' + #13#10 +
      ' WHERE Descricao = ' + QuotedStr(pDescricao);
   oCds.Data := GetDataPacket(sSql);
   Result := oCds.FieldByName('IdNatureza').asInteger;
   oCds.Close;
   FreeAndNil(oCds);
End;

End.
