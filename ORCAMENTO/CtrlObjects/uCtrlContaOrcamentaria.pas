unit uCtrlContaOrcamentaria;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  Classes, uDbContasOrcamen,  uCMTypes, uFuncoesOrcamento;

Type
  TCtrlContaOrcamentaria = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
      _dbContasorcamen: TdbContasorcamen;
      FCdsContasorcamen: TClientDataSet;
      procedure SetCdsContasorcamen(const Value: TClientDataSet);

  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      function AplicaOperacaoContaOrcamentaria : Boolean;
      function Procurar(idcontaorcamen: String): OleVariant;
      Function ListaContaOrcamentaria(idplanoorcamen: double;
        idcontaorcamen: String): OleVariant;
      function Contas(idplanoorcamen: integer) : OleVariant;
      Function  SelecionaContas( pcCalcOR,
                                    pcTipoCalculo,
                                    pedConteudo1Text  : String;
                                    psePosIni1Value,
                                    psePosFim1Value   : Double;
                                    pModuloiPlanoOrc  : Integer ) : OleVariant;

      Procedure StartTransactionOrc;
      Procedure CommitOrc;
      Procedure RollBackOrc;

      procedure AltFlgcalcorcadoN(idplanoorcamen: integer; conteudo1: string);
      procedure AltFlgcalcorcadoS(idplanoorcamen: integer; conteudo1: string);
      procedure AltFlgcalcrealN(idplanoorcamen: integer; conteudo1: string);
      procedure AltFlgcalcrealS(idplanoorcamen: integer; conteudo1: string);
      procedure AltFlgGD(idplanoorcamen: integer; idcontaorcamen, flag,
        vlrflag: string);

      property CdsContasorcamen: TClientDataSet read FCdsContasorcamen write SetCdsContasorcamen;

  end;

implementation


procedure TCtrlContaOrcamentaria.DoChangeDataBase;
begin
  inherited;
  _dbContasorcamen.DatabaseName := DataBaseName;
end;

procedure TCtrlContaOrcamentaria.OnCreateAppServer;
begin
  inherited;
  FCdsContasorcamen := TClientDataSet.Create(nil);
end;

constructor TCtrlContaOrcamentaria.Create;
begin
  inherited;
  _dbContasorcamen := TdbContasorcamen.Create(Self);
end;

destructor TCtrlContaOrcamentaria.Destroy;
begin
  inherited;
  _dbContasorcamen.Free;
  if isAppServer then begin
    FreeCds([FCdsContasorcamen]);
  end;
end;

function TCtrlContaOrcamentaria.AplicaOperacaoContaOrcamentaria: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoContaOrcamentaria
                                                       (FCdsContasorcamen.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsContasorcamen,_DbContasorcamen,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbContasorcamen.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;

function TCtrlContaOrcamentaria.Procurar(idcontaorcamen: String): OleVariant;
begin
   _DbContasorcamen.Idcontaorcamen.AsString := idcontaorcamen;
   Result := GetDataPacket(_DbContasorcamen.SSqlSelect);
end;

procedure TCtrlContaOrcamentaria.SetCdsContasorcamen(
  const Value: TClientDataSet);
begin
  FCdsContasorcamen := Value;
end;


function TCtrlContaOrcamentaria.ListaContaOrcamentaria(idplanoorcamen: double; idcontaorcamen : String) : OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT                                        '+
           '   NOMECONTAORCAMEN                           '+
           'FROM                                          '+
           '   CONTASORCAMEN                              '+
           'WHERE                                         '+
           '   (IDPLANOORCAMEN = ' + TrocaVPP(FloatToStr(idplanoorcamen)) + 
           ') AND' + '   (IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
   Result := GetDataPacket(sSql);
end;

function TCtrlContaOrcamentaria.Contas(idplanoorcamen: integer) : OleVariant;
var sSQl : String;
begin
  sSql := 'SELECT ' +
          'IDCONTAORCAMEN, NOMECONTAORCAMEN ' +
          'FROM ' +
          'CONTASORCAMEN ' +
          'WHERE ' +
          '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(FLGTRANSFSALDO = ''S'')';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlContaOrcamentaria.AltFlgcalcorcadoN(idplanoorcamen: integer;
  conteudo1: string);
var sSQl : String;
begin
  sSql := 'UPDATE CONTASORCAMEN SET FLGCALCORCADO = ''N'' WHERE ' +
          '(TIPOCALCORCADO <> ''V'') AND (TIPOCALCORCADO <> ''T'') AND ' +
          '((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ' + conteudo1 +
          '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlContaOrcamentaria.AltFlgcalcorcadoS(idplanoorcamen: integer;
  conteudo1: string);
var sSQl : String;
begin
  sSql := 'UPDATE CONTASORCAMEN SET FLGCALCORCADO = ''S'' WHERE ' +
          '((TIPOCALCORCADO = ''V'') OR (FLGATIVA = ''I'') OR ' + conteudo1 +
          '(TIPOCALCORCADO = ''T'')) AND (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlContaOrcamentaria.AltFlgcalcrealN(idplanoorcamen: integer;
  conteudo1: string);
var sSQl : String;
begin
  sSql := 'UPDATE CONTASORCAMEN SET FLGCALCREAL = ''N'' WHERE ' +
          '(TIPOCALCORCADO <> ''V'') AND (TIPOCALCORCADO <> ''T'') AND ' +
          '((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ' + conteudo1 +
          '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlContaOrcamentaria.AltFlgcalcrealS(idplanoorcamen: integer;
  conteudo1: string);
var sSQl : String;
begin
  sSql := 'UPDATE CONTASORCAMEN SET FLGCALCREAL = ''S'' WHERE ' +
          '((TIPOCALCORCADO = ''V'') OR (FLGATIVA = ''I'') OR ' + conteudo1 +
          '(TIPOCALCORCADO = ''T'')) AND (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlContaOrcamentaria.AltFlgGD(idplanoorcamen: integer;
  idcontaorcamen, flag, vlrflag: string);
var sSQl : String;
begin
  sSql := 'UPDATE CONTASORCAMEN SET ' + flag + ' = ''' + vlrflag +
          ''' WHERE (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) +
          ') AND (IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;
//************************************************
Function  TCtrlContaOrcamentaria.SelecionaContas( pcCalcOR,
                                                  pcTipoCalculo,
                                                  pedConteudo1Text : String;
                                                  psePosIni1Value,
                                                  psePosFim1Value  : Double;
                                                  pModuloiPlanoOrc : Integer ) : OleVariant;
Var
  SqlLocal   : TStringList;
  sCondicoes : String;

Begin

  SqlLocal   := TStringList.Create;

  If ( pcCalcOR = 'O' ) Then Begin

    sCondicoes := '(TIPOCALCORCADO = ' + QuotedStr( pcTipoCalculo ) + ') AND (FLGCALCORCADO = ''N'')';
  End Else Begin

    sCondicoes := '(TIPOCALCREALIZADO = ' + QuotedStr( pcTipoCalculo ) + ') AND (FLGCALCORCADO = ''N'')';
  End;

  sCondicoes := sCondicoes + ' AND ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) ';

  If ( Trim( pedConteudo1Text ) <> '' ) Then Begin

    sCondicoes := sCondicoes + ' AND ( SUBSTR( IDCONTAORCAMEN,' +
                  FloatToStr( psePosIni1Value) + ',' +
                  FloatToStr( psePosFim1Value) + ') = (''' +
                  Trim( pedConteudo1Text) + ''')) ';
  End;

  sCondicoes := sCondicoes + ' AND (IDPLANOORCAMEN = ' + IntToStr( pModuloiPlanoOrc) + ')';

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  IDPLANOORCAMEN, IDCONTAORCAMEN, FLGSINALCONTA,' );
    SqlLocal.Add( '  FLGINFDIAMES,   FORMULAORCADO,  FORMULAREALIZADO,' );
    SqlLocal.Add( '  IDDATAVIEW,     ORIGEMCMDV,     FLGACUMULADO,     FLGATIVA' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  CONTASORCAMEN' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( sCondicoes );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  IDPLANOORCAMEN, IDCONTAORCAMEN' );

    Result := GetDataPacket( SqlLocal.Text );
  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Procedure TCtrlContaOrcamentaria.StartTransactionOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.StartTransactionOrc;

  End Else Begin

    StartTransaction;
  End;
End;
//************************************************
Procedure TCtrlContaOrcamentaria.CommitOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.CommitOrc;

  End Else Begin

    Commit;
  End;
End;
//************************************************
Procedure TCtrlContaOrcamentaria.RollBackOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.RollBackOrc;

  End Else Begin

    RollBack;
  End;
End;
//************************************************
end.

