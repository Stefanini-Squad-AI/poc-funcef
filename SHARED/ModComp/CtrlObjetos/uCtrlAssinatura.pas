Unit uCtrlAssinatura;

Interface

Uses
   sysutils, uCmControlObject, uCmDbObject, uDbAssinatura, DB, uDataBase, uSistema, DbClient, UctrlDocumento,
   {$IFNDEF VERSAO0505}uCMTypes{$ENDIF};

Type
   TCtrlASSINATURA = Class(TCmControlObject)

   Private
      FDbASSINATURA: TDbASSINATURA;
      FCdsASSINATURA: TClientDataSet;


   Protected

      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Procedure AfterInitialize; Override;

   Public

      Constructor Create; Override;
      Destructor Destroy; Override;


      Function GravarASSINATURA(pCdsASSINATURA : TClientDataSet; bAbreTransacao: Boolean = True): Boolean;
      Function ProcurarASSINATURA(IdASSINATURA : string): OleVariant;
      Function AssinaturaRelatorio(idPessoa : string): OleVariant;

      function PegaId(Tabela: String): LongInt;
      function AtualizaAssinatura(idAssinatura: LongInt;idPessoa : Integer; pDescricao : string): Boolean;
      function VerificaAssinatura(pIdPessoa : Integer) : Boolean;
      procedure ApagarAssinatura(pintIDAssinatura : integer);


   End;

Implementation
{ TCtrlASSINATURA }

Constructor TCtrlASSINATURA.Create;
Begin
   Inherited;

   FDbASSINATURA := TDBAssinatura.create(Self);
   FCdsASSINATURA := TClientDataSet.Create(Nil);

End;

Destructor TCtrlASSINATURA.Destroy;
Begin
   FDbASSINATURA.Free;
   If isAppServer Then
      Begin
         FCdsASSINATURA.free;

      End;

   Inherited;
End;

Procedure TCtrlASSINATURA.DoChangeDataBase;
Begin
   Inherited;
   fDbASSINATURA.DataBaseName := DataBaseName;
End;


Function TCtrlASSINATURA.GravarASSINATURA(pCdsASSINATURA : TClientDataSet; bAbreTransacao: Boolean = True): Boolean;
Var
   Msg: String;
Begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GravarASSINATURA(FCdsAssinatura.data);
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            If bAbreTransacao Then StartTransaction;
            // Pai
            Result := ApplyCds(pCdsASSINATURA, FDbASSINATURA, [], []);
            Msg := FDbASSINATURA.MessageInfo;
            If Not Result Then Raise Exception.Create(Msg);
            If bAbreTransacao Then Commit;
         Except
            On E: Exception Do
               Begin
                  If bAbreTransacao Then Rollback;
                  Result := False;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlASSINATURA.ProcurarASSINATURA(IdASSINATURA : string): OleVariant;
Var
   sSQL: String;
Begin

   sSQL := 'SELECT '+
           ' A.IDASSINATURA, ' +
           ' A.DESCRICAO, '+
           ' A.IDPESSOA, ' +
           ' P.NOME, ' +
           ' A.ASSINATURA '+
           'FROM ASSINATURA A '+
           'INNER JOIN PESSOA P ON (P.IDPESSOA = A.IDPESSOA) '+
           ' WHERE A.IDASSINATURA = ' + IdASSINATURA ;


   Result := GetDataPacket(sSQL);
End;

Procedure TCtrlASSINATURA.OnCreateAppServer;
Begin
   Inherited;
End;

Function TCtrlASSINATURA.PegaId(Tabela: String): LongInt;
Begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.PegaId(Tabela);
      End
   Else
      Result := GetSequence(Tabela);
End;



Procedure TCtrlASSINATURA.AfterInitialize;
Begin
   Inherited;
End;

Function TCtrlASSINATURA.AtualizaAssinatura(idAssinatura: LongInt; idPessoa : Integer; pDescricao : string): Boolean;
Var
   sSQL: String;
Begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.AtualizaAssinatura(idAssinatura, idPessoa, pDescricao);
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
   Begin
         Result := True;
         If idPessoa = 0 Then
            Begin
               sSQL := 'UPDATE ASSINATURA SET DESCRICAO = ' + pDescricao +
                  ' WHERE idAssinatura = ' + intTostr(idAssinatura);
               If Not ExecSQL(sSQL) Then
                  Result := False;
            End
         Else
            Begin
               sSQL := 'UPDATE ASSINATURA SET DESCRICAO = ' + pDescricao +
                    ', idpessoa = ' +  IntToStr(idPessoa) +
                  ' WHERE idAssinatura = ' + intTostr(idAssinatura);
               If Not ExecSQL(sSQL) Then
                  Result := False;
            End;
   End;
End;

function TCtrlASSINATURA.VerificaAssinatura(pIdPessoa: Integer): Boolean;
var sSql : string;
    Cds  : TClientDataSet;
begin
     sSql :=  'SELECT A.IDASSINATURA ' +
              'FROM ASSINATURA A '+
              'INNER JOIN PESSOA P ' +
              'ON (P.IDPESSOA = A.IDPESSOA) '+
              'WHERE A.IDPESSOA = ' + IntToStr(pIdPessoa);

     Cds := TClientDataSet.Create(nil);
     Cds.data :=  GetDataPacket(sSql);

     Result := Cds.IsEmpty;
end;

procedure TCtrlASSINATURA.ApagarAssinatura(pintIDAssinatura: integer);
var sSql : string;
begin
  sSql := 'Delete assinatura where idassinatura = ' + IntToStr(pintIDAssinatura);

  GetDataPacket(sSql);
end;



function TCtrlASSINATURA.AssinaturaRelatorio(idPessoa : string): OleVariant;
var sSql : string;
begin
  sSql := 'SELECT ' +
          'PESSOA.NOME AS NOME, '+
          'FUNCIONARIO.MATRICULA AS MATRICULA, '+
          'SITFUNC.DESCRICAO AS DESCRICAO, '+
          'CARGO.TITULO AS CARGO, '+
          'ASSINATURA.ASSINATURA AS ASSINATURA ' +
          'FROM ASSINATURA '+
          'INNER JOIN FUNCIONARIO ON (FUNCIONARIO.IDPESSOA = ASSINATURA.IDPESSOA) '+
          'INNER JOIN PESSOA ON (PESSOA.IDPESSOA = FUNCIONARIO.IDPESSOA) '+
          'INNER JOIN SITFUNC ON (SITFUNC.IDSITFUNC = FUNCIONARIO.IDSITFUNC) '+
          'INNER JOIN CARGO ON (CARGO.IDCARGO = FUNCIONARIO.IDCARGO) ' +
          'WHERE ASSINATURA.IDPESSOA = ' + idPessoa + ' AND ROWNUM = 1 ' +
          'ORDER BY ASSINATURA.IDASSINATURA DESC' ;

  Result := GetDataPacket(sSql);
end;

End.
