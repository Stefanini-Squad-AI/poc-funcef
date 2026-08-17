{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
{*******************************************************************************
  Pendência : 14449 - Correção
  Data      : 19/12/2003
  Metodo    : Correções: ListaUsuariosNotInCR e ListaUsuariosInCR
              Criação:   AplicaOperacaoCresponXPessoa
  Descrição : Cento de Responsabilidade é um campo do tipo string e não integer
              se passar como inteiro o código '0101' = '101' após reconversão
              para string
*******************************************************************************}

//Atualizado em : 03/11/2003 - pendência 15151 - INCLUI O NOME COMPLETO DO USUÁRIO
//                27/02/2004 - pendência 14933 - Não seleciona o
// centro de responsabilidade padrão se a fundação utilisa a estrutura de centro de responsabilidade.


Unit uCtrlCadUsuxCResp;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, Classes, wwQuery, provider, uDbCentRespon,
  uDbPessoaXCResp, uCMTypes, uCMClientDataSet, usistema;

Type
  TCtrlCadUsuxCResp = Class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase;  Override;
    procedure OnCreateAppServer; Override;

  Private

    _dbSelecionados  : TdbPessoaXCresp;
    _dbDisponiveis   : TdbCentRespon;

    FCdsSelecionados : TClientDataSet;
    FCdsDisponiveis  : TClientDataSet;
    FIdEmpresa,
    FiIdUsuario,
    FIdUsuario       : Integer;

    Procedure SetCdsSelecionados( Const Value : TClientDataSet );
    Procedure SetCdsDisponiveis( Const Value : TClientDataSet );
    Procedure PreparaGravacao;
  Public

    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function AplicaOperacaoPessoaXCresp: Boolean;
    Function ProcuraCentResponXPessoa( pIDUSUARIO,
                                       pIDPESSOA   : Integer{; IdPlanCentRespon : Extended = 0 }) : OleVariant;
    Function ProcuraDisponiveis( pIDUSUARIO,
                                 pIDPESSOA  : Integer) : OleVariant;
    Function ProcuraSelecionados( pIDUSUARIO,
                                  pIDPESSOA  : Integer) : OleVariant;
    Procedure ExcluiPESSOAXCRESP( pIDPESSOAACESSO,
                                  pCODCENTRORESPON,
                                  pIDPESSOA         : String );
    Procedure IncluiPESSOAXCRESP( pIDPESSOAACESSO,
                                  pCODCENTRORESPON,
                                  pIDPESSOA         : String );

    // 19/12/03
    Function AplicaOperacaoCresponXPessoa: Boolean;
   //Lista os usuários que não estão no centro de responsbilidade passado como parâmetro
    Function ListaUsuariosNotInCR(const pCODCENTRORESPON: string; const pIdEmpresa : integer): OleVariant;
   //Lista os usuários que estão no centro de responsbilidade passado como parâmetro
    Function ListaUsuariosInCR(const pCODCENTRORESPON: string; const pIdEmpresa : integer): OleVariant;

    Property IdEmpresa       : Integer        Read FIdEmpresa       Write FIdEmpresa;
    Property IdUsuario       : Integer        Read FIdUsuario       Write FIdUsuario;
    Property iIdUsuario      : Integer        Read FiIdUsuario      Write FiIdUsuario;
    Property CdsSelecionados : TClientDataSet Read FCdsSelecionados Write SetCdsSelecionados;
    Property CdsDisponiveis  : TClientDataSet Read FCdsDisponiveis  Write SetCdsDisponiveis;
  End;

Implementation
//************************************************
procedure TCtrlCadUsuxCResp.OnCreateAppServer;
begin
  Inherited;

  FCdsSelecionados := TClientDataSet.Create( Nil );
  FCdsDisponiveis  := TClientDataSet.Create( Nil );
End;
//************************************************
Procedure TCtrlCadUsuxCResp.DoChangeDataBase;
Begin
  Inherited;

  _dbDisponiveis.DatabaseName  := DataBaseName;
  _dbSelecionados.DatabaseName := DataBaseName;
End;
//************************************************
Constructor TCtrlCadUsuxCResp.Create;
Begin
  Inherited;

  _dbSelecionados := TdbPessoaXCresp.Create( Self );
  _dbDisponiveis  := TdbCentRespon.Create( Self );
End;
//************************************************
Destructor TCtrlCadUsuxCResp.Destroy;
Begin
  _dbSelecionados.Free;
  _dbDisponiveis.Free;

  If ( isAppServer ) Then Begin

    CdsSelecionados.Free;
    CdsDisponiveis.Free;
  End;
  Inherited;

End;
//************************************************
Function TCtrlCadUsuxCResp.AplicaOperacaoPessoaXCresp: Boolean;
Begin
  If ( ConnectionSide = cnsClient ) Then Begin
     Result := False;

     Try
        Result := Connection.AppServer.AplicaOperacaoPessoaXCresp( FCdsSelecionados.Data );
     Finally
        If ( Not Result ) Then Begin
           MessageInfo := Connection.AppServer.MessageInfo;
        End;
     End;
  End Else Begin
     MessageInfo := '';

     Try
        PreparaGravacao;
        StartTransaction;
        Result := ApplyCDS( FCdsSelecionados, _DbSelecionados, [], [] );

        If ( Result ) Then Begin
           Commit;
        End Else Begin
          MessageInfo := _DbSelecionados.MessageInfo;
          Abort;
        End;
     Except
        On E:Exception Do Begin
           Result := False;
           Rollback;
           MessageInfo := MessageInfo + E.Message;
        End;
     End;
  End;
End;
//************************************************
Procedure TCtrlCadUsuxCResp.SetCdsSelecionados( Const Value: TClientDataSet);
Begin

  FCdsSelecionados := Value;
End;
//************************************************
Procedure TCtrlCadUsuxCResp.SetCdsDisponiveis( Const Value: TClientDataSet);
Begin

  FCdsDisponiveis := Value;
End;
//************************************************
Function TCtrlCadUsuxCResp.ProcuraCentResponXPessoa( pIDUSUARIO,
                                                     pIDPESSOA   : Integer ) : OleVariant;
Var
  SqlLocal : TStringList;
  cdsAux : TcmClientDataSet; //  27/02/2004 - pendência 14933
Begin

  SqlLocal   := TStringList.Create;
  iIdUsuario := pIDUSUARIO;

  cdsAux  := TcmClientDataset.Create(nil); //  27/02/2004 - pendência 14933
  Try
    // 27/02/2004 - pendência 14933
    cdsAux.data := GetDataPacket(' SELECT USACRESPON FROM PARAMGLOBAL WHERE IDPESSOA = '+ intToStr(sistema.idempresa));

    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  CR.CODCENTRORESPON,' );
    SqlLocal.Add( '  CR.NOME,' );
    SqlLocal.Add( '  CR.CODEXTERNO,' );
    SqlLocal.Add( '  PC.IDPESSOAACESSO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  CENTRESPON   CR,' );
    SqlLocal.Add( '  PESSOAXCRESP PC' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( CR.IDPESSOA           =  ' + IntToStr( pIDPESSOA ) + ' ) AND' );
    SqlLocal.Add( '  ( CR.ATIVO              = ''S'' )              AND' );
    SqlLocal.Add( '  ( PC.IDPESSOAACESSO (+) = ' + IntToStr( pIDUSUARIO ) + ') AND' );
    SqlLocal.Add( '  ( PC.CODCENTRORESPON(+) = CR.CODCENTRORESPON ) AND' );
    SqlLocal.Add( '  ( PC.IDPESSOA       (+) = CR.IDPESSOA)' );

    // 27/02/2004 - pendência 14933
    // se a fundacao usa a estrutura de centro de responsabilidade,
    // então não deve exibir o centro de resposabilidade padrão
    if trim(CdsAux.FieldByName('USACRESPON').asString) = 'S' then
      SqlLocal.Add( ' AND (CR.CODCENTRORESPON <> ''9999999999'') ');

    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  CODEXTERNO' );
    Result := GetDataPacket( SqlLocal.Text );

  Finally
    SqlLocal.Free; // 27/02/2004 - pendência 14933
    cdsAux.Free;
  End;
End;
//************************************************
Function TCtrlCadUsuxCResp.ProcuraDisponiveis( pIDUSUARIO,
                                               pIDPESSOA   : Integer ) : OleVariant;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal   := TStringList.Create;
  iIdUsuario := pIDUSUARIO;

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '     CODEXTERNO,' );
    SqlLocal.Add( '     CODCENTRORESPON,' );
    SqlLocal.Add( '     NOME' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '     CENTRESPON' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '     (IDPESSOA =  ' + IntToStr( pIDPESSOA ) + ')' );
    SqlLocal.Add( ' AND (ATIVO = ''S'')' );
    SqlLocal.Add( ' AND (CODCENTRORESPON NOT IN ( SELECT CODCENTRORESPON FROM PESSOAXCRESP' );
    SqlLocal.Add( '                               WHERE (IDPESSOAACESSO = ' + IntToStr( pIDUSUARIO ) + ')' );
    SqlLocal.Add( '                                 AND (IDPESSOA =  ' + IntToStr( pIDPESSOA ) + ') ) )' );
    SqlLocal.Add( 'ORDER BY' );
    // P:21368 - 31/01/2006
    SqlLocal.Add( '  CODEXTERNO' );

    Result := GetDataPacket( SqlLocal.Text );
  Finally

   SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlCadUsuxCResp.ProcuraSelecionados( pIDUSUARIO,
                                                pIDPESSOA   : Integer ) : OleVariant;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal   := TStringList.Create;
  iIdUsuario := pIDUSUARIO;

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '     UXA.IDPESSOAACESSO,' );
    SqlLocal.Add( '     UXA.CODCENTRORESPON,' );
    // P:21368 - 31/01/2006
    SqlLocal.Add( '     ALM.CODEXTERNO,' );
    SqlLocal.Add( '     UXA.IDPESSOA,' );
    SqlLocal.Add( '     ALM.NOME' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '     CENTRESPON ALM,' );
    SqlLocal.Add( '     PESSOAXCRESP UXA' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '       (UXA.IDPESSOAACESSO = ' + IntToStr( pIDUSUARIO ) + ')' );
    SqlLocal.Add( '   AND (UXA.IDPESSOA  = ' + IntToStr( pIDPESSOA ) + ')' );
    SqlLocal.Add( '   AND (UXA.CODCENTRORESPON = ALM.CODCENTRORESPON)' );
    SqlLocal.Add( '   AND (UXA.IDPESSOA = ALM.IDPESSOA)' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  ALM.CODCENTRORESPON' );

    Result := GetDataPacket( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadUsuxCResp.PreparaGravacao;
Var
  SqlLocal : TStringList;

  CdsLocal : TClientDataSet;
Begin

  SqlLocal   := TStringList.Create;
  CdsLocal   := TClientDataSet.Create( Nil );

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  IDPESSOAACESSO,' );
    SqlLocal.Add( '  CODCENTRORESPON,' );
    SqlLocal.Add( '  IDPESSOA' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '     PESSOAXCRESP' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDPESSOAACESSO = ' + IntToStr( iIdUsuario ) + ' ) AND' );
    SqlLocal.Add( '  ( IDPESSOA       = ' + IntToStr( IdEmpresa ) + ' )' );

    CdsLocal.Data := GetDataPacket( SqlLocal.Text );

    While ( Not CdsLocal.EOF ) Do Begin

      CdsLocal.Delete;
    End;

    CdsSelecionados.First;
    While ( Not CdsSelecionados.EOF ) Do Begin

      CdsLocal.Append;
      CdsLocal.FieldByName('IDPESSOAACESSO').asInteger := CdsSelecionados.FieldByName('IDPESSOAACESSO').asInteger;
      CdsLocal.FieldByName('IDPESSOA').asInteger       := CdsSelecionados.FieldByName('IDPESSOA').asInteger;
      CdsLocal.FieldByName('CODCENTRORESPON').asString := CdsSelecionados.FieldByName('CODCENTRORESPON').asString;
      CdsLocal.Post;

      CdsSelecionados.Delete;
    End;

    CdsSelecionados.Data := CdsLocal.Data;

  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadUsuxCResp.ExcluiPESSOAXCRESP( pIDPESSOAACESSO,
                                                pCODCENTRORESPON,
                                                pIDPESSOA         : String );
Var
  SqlLocal : TStringList;

Begin

  SqlLocal   := TStringList.Create;
  Try
    SqlLocal   := TStringList.Create;
    SqlLocal.Add( 'DELETE FROM' );
    SqlLocal.Add( '  PESSOAXCRESP' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  IDPESSOAACESSO  = ' + pIDPESSOAACESSO  + ' AND' );
    SqlLocal.Add( '  CODCENTRORESPON = ' + QuotedStr( pCODCENTRORESPON ) + ' AND' );
    SqlLocal.Add( '  IDPESSOA        = ' + pIDPESSOA );

    ExecSQL( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlCadUsuxCResp.IncluiPESSOAXCRESP( pIDPESSOAACESSO,
                                                pCODCENTRORESPON,
                                                pIDPESSOA         : String );
Var
  SqlLocal : TStringList;

Begin

  SqlLocal   := TStringList.Create;
  Try
    SqlLocal   := TStringList.Create;
    SqlLocal.Add( 'INSERT INTO' );
    SqlLocal.Add( '  PESSOAXCRESP' );
    SqlLocal.Add( '  ( IDPESSOAACESSO, CODCENTRORESPON, IDPESSOA )' );
    SqlLocal.Add( 'VALUES' );
    SqlLocal.Add( '  ( ' + pIDPESSOAACESSO + ', ' + QuotedStr( pCODCENTRORESPON ) + ', ' + pIDPESSOA + ' )' );

    ExecSQL( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************

// início  pendência 14449
//Lista os usuários que não estao no centro de responsabilidade passado como parâmetro
function TCtrlCadUsuxCResp.ListaUsuariosNotInCR(const pCODCENTRORESPON: string; const pIdEmpresa : integer): OleVariant;
begin
// pendência 15151 - INCLUI O NOME COMPLETO DO USUÁRIO
  result := GetDataPacket(' SELECT '+
                          '   U.IDUSUARIO, U.NOMEUSUARIO, P.NOME '+
                          ' FROM USUARIOSISTEMA U, PESSOA P  '+
                          ' WHERE U.IDUSUARIO NOT IN   '+
                          ' (SELECT IDPESSOAACESSO FROM PESSOAXCRESP WHERE CODCENTRORESPON = ' +  QuotedStr(pCODCENTRORESPON)+
                          '  AND IDPESSOA  = ' + IntToStr(pIdEmpresa)  + ')'+
                          '  AND  U.IDUSUARIO = P.IDPESSOA '+
                          ' ORDER BY NOMEUSUARIO ');
end;

//Lista os usuários que estão no centro de responsabilidade passado como parâmetro
function TCtrlCadUsuxCResp.ListaUsuariosInCR(const pCODCENTRORESPON: string; const pIdEmpresa : integer): OleVariant;
begin
// pendência 15151 - INCLUI O NOME COMPLETO DO USUÁRIO
  result := GetDataPacket(' SELECT '+
                          '   U.IDUSUARIO, U.NOMEUSUARIO, P.IDPESSOAACESSO, P.CODCENTRORESPON, P.IDPESSOA, PES.NOME '+
                          ' FROM USUARIOSISTEMA U, PESSOAXCRESP P, PESSOA PES '+
                          ' WHERE U.IDUSUARIO = P.IDPESSOAACESSO AND P.CODCENTRORESPON = '+ QuotedStr(pCODCENTRORESPON)+
                          '       AND P.IDPESSOA  = ' + IntToStr(pIdEmpresa) +
                          '       AND PES.IDPESSOA = U.IDUSUARIO  '+
                          ' ORDER BY U.NOMEUSUARIO ');
end;


// Fim pendência 14449

function TCtrlCadUsuxCResp.AplicaOperacaoCresponXPessoa: Boolean;
begin
  If ( ConnectionSide = cnsClient ) Then Begin
     Result := False;

     Try
        Result := Connection.AppServer.AplicaOperacaoCResponXPessoa( FCdsSelecionados.Data );
     Finally
        If ( Not Result ) Then Begin
           MessageInfo := Connection.AppServer.MessageInfo;
        End;
     End;
  End Else Begin
     MessageInfo := '';

     Try
        StartTransaction;
        Result := ApplyCDS( CdsDisponiveis, _DbSelecionados, [], [] );

        If ( Result ) Then Begin
           Commit;
        End Else Begin
          MessageInfo := _DbSelecionados.MessageInfo;
          Abort;
        End;
     Except
        On E:Exception Do Begin
           Result := False;
           Rollback;
           MessageInfo := MessageInfo + E.Message;
        End;
     End;
  End;
end;

End.



