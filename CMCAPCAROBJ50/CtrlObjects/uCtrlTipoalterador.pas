Unit uCtrlTipoalterador;

//***************************************************************************************
//Rotina.............: ListTipoalterador
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de campo para definição de valor de base de tributos.
//***************************************************************************************
//Rotina.............: ListTipoalterador
//N. SIG.............: 88813
//Data da Alteração..: 17/07/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na recuperação de tipos de alteradores
//***************************************************************************************
{ --------------------------------------------------------------------------------------------------
Analista.: Helen V. Bianchi
Data.....: 09/10/2011
SOL/Kintana: 136341 / 815095
Descrição: Criar rotina ListTipoImovel_AcDes Utilizado no Imobiliario
-----------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Integração Orçamento - Inclusão da flag FLGOBRIGARESERVA 
-------------------------------------------------------------------------------------------------- }

{-----------------------------------------------------------------------------------------
Analista.: Rodolpho da Silva
Data.....: 21/06/2006
Pendência: 22670
Descrição: Criar rotina de validação caso um alterador tenha sensibilizado no IRRF
-----------------------------------------------------------------------------------------
Analista.: Antonio Marcos Fernandes de Souza (amf)
Data.....: 27.01.2006
Pendência: 18886 - Criar campo observação para ser utilizado na tela de lançamento.
Descrição: Alteração na SQL da function ListTipoAlterador: inclusão no select do campo
           Observação.
------------------------------------------------------------------------------------------
}


Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipoalterador, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type

  TCtrlTipoalterador = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbTipoalterador: TDbTipoalterador;
    Fcds: TClientDataSet;
    _Padroes: TCtrlPadroes;
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListTipoalterador(idpessoa: double = 0; RECPAG: String = ''; codalterador: double = 0; AcresDecres: String = ''): OleVariant;
    Function ListTipoAlteradorImpXAgreg(idpessoa: double = 0; RECPAG: String = ''; PACRESDECRES: String = ''): OleVariant;
    Function GravarTipoalterador(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
    //Helen - SOL: 136341 Kintana : 815095  - Inicio
     Function ListTipoImovel_AcDes(ACR_DES: String = ''; CODTIPIMOVEL: String = ''): OleVariant;
	

    // Rodolpho da Silva - 21/06/2006
    function ExisteLancIRRF(iCodDocumento: integer): Boolean;
  End;

Implementation

{ TCtrlTipoalterador }

Constructor TCtrlTipoalterador.Create;
Begin
  Inherited;
  _DbTipoalterador := TDbTipoalterador.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlTipoalterador.Destroy;
Begin
  _DbTipoalterador.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlTipoalterador.DoChangeDataBase;
Begin
  Inherited;
  _DbTipoalterador.DataBaseName := DataBaseName;
End;

Function TCtrlTipoalterador.ListTipoalterador(idpessoa: double = 0;
  RECPAG: String = '';
  codalterador: double = 0;
  AcresDecres: String = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                   ' +
    '  CODALTERADOR,          ' +
    '  IDPESSOA ,             ' +
    '  CODSUBCONTA,           ' +
    '  IDEMPRESA ,            ' +
    '  PLANO   ,              ' +
    '  CODCENTROCUSTO ,       ' +
    '  PLACONTA    ,          ' +
    '  RECPAG    ,            ' +
    '  DESCRICAO  ,           ' +
    '  ACRESDECRES ,          ' +
    '  CONVERTE  ,            ' +
    '  IDUSUARIOINCLUSAO  ,   ' +
    '  FLGCALCULAIMPOSTO ,    ' +
    '  FLGAGREGABAIXA  ,      ' +
    '  FLGAGREGASALDO ,       ' +
    '  CODNATUREZA,           ' +
    '  CODCORRESP,            ' +
    '  FLGCONTABNABAIXA,      ' +
    '  FLGUSACCUSTODOC,       ' +
    '  FLGINCIDEIRRF,         ' + //Bruno Bastos - Pend. 14392 - 11/08/2003
    '  CODTIPRECDES           ' + //Bruno Bastos - Pend. 19025 - 11/05/2005
    '  ,OBSERVACAO            ' + //amf p:18886 - 27.01.2006: Inclusão de campo na tabela
    '  ,FLGOBRIGARESERVA      ' + // VANDER - SOL 172384/9603 - KINTANA 1661662
    '  ,FLGLANCANFS           ' + //Cássio Rovaroto - SIG nº 88813
    '  ,FLGVALORBASE          ' + //Cássio Rovaroto - SIG nº 115585  
    'FROM                     ' +
    '       Tipoalterador T  where (1=1) ';
  If idpessoa <> 0 Then
    ssql := ssql + ' and iDPESSOA = ' + floattostr(IDPESSOA);
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' and RECPAG = ' + quotedstr(RECPAG);
  If codalterador <> 0 Then
    ssql := ssql + ' and codalterador = ' + floattostr(codalterador);
  If AcresDecres <> '' Then
    ssql := ssql + ' and AcresDecres = ' + quotedstr(AcresDecres);
  ssql := ssql + ' ORDER BY DESCRICAO  ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTipoalterador.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlTipoalterador.GravarTipoalterador(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTipoalterador(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbTipoalterador, [], []);
      Msg := _DbTipoalterador.MessageInfo;
      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Tipo de Alterador'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Tipo de Alterador'
      Else
        sDscLog := 'Alteracao de Tipo de Alterador';

      If Not Result Then
        Raise Exception.create(Msg);
      If Not _Padroes.GravaLogOperacoes(IdPessoa, IdModulo, IdUsuario, sDscLog, False) Then
        Raise Exception.Create(_Padroes.MessageInfo);
      Commit;
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

Function TCtrlTipoalterador.ListTipoAlteradorImpXAgreg(idpessoa: double = 0;
  RECPAG: String = '';
  PACRESDECRES: String = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT CODALTERADOR,DESCRICAO,ACRESDECRES ' +
    '  FROM TIPOALTERADOR                      ' +
    ' WHERE (RECPAG = ''' + RECPAG + ''') AND ' +
    '   (IDPESSOA = ' + Floattostr(IDPESSOA) + ') AND            ' +
    '   (ACRESDECRES = ''' + PACRESDECRES + ''') AND      ' +
    ' ((FLGCALCULAIMPOSTO = ''N'') OR (FLGCALCULAIMPOSTO IS NULL))';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTipoalterador.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlTipoalterador.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

function TCtrlTipoalterador.ExisteLancIRRF(iCodDocumento: integer): Boolean;
begin
   _Cds.Data := GetDataPacket('SELECT CODDOCINSS FROM LANCTODOCUM ' +
                              'WHERE CODDOCINSS IS NOT NULL AND  CODDOCUMENTO = '+ inttostr(iCodDocumento));
   Result := not (_Cds.IsEmpty);
end;

//Helen - SOL: 136341 Kintana : 815095  - Inicio
Function TCtrlTipoalterador.ListTipoImovel_AcDes(ACR_DES: String = ''; CODTIPIMOVEL: String = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql := ' SELECT A.DESCRICAO , A.CODALTERADOR ' +
          ' FROM ALTERADORXTIPOIMO AT, TIPOALTERADOR A, TIPOIMOVEL T   ' +
          ' WHERE (AT.CODALTERADOR = A.CODALTERADOR)   ' +
          '   AND (AT.CODTIPIMOVEL = T.CODTIPIMOVEL)   ' +
          '   AND (AT.CODTIPIMOVEL = ''' + CODTIPIMOVEL + ''') ' +
          '   AND (A.RECPAG = ''R'' ) '  +
          '   AND (A.ACRESDECRES =  '''  + ACR_DES + ''') ' +
          ' ORDER BY  A.DESCRICAO   ' ;

  Result := GetDataPacket(ssql);
End;
//Helen - SOL: 136341 Kintana : 815095  - Fim

End.

