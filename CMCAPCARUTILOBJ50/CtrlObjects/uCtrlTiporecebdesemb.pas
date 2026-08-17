// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------

//   Autor     : Rodolpho da Silva
//   Pendência : 19624
//   Data      : 18/07/2005
//   Descrição : Incluído mais um parâmetro no método CtrlTiporecebdesemb.ListparamCap,
//               param: sRecPag



// Rotinas   : ListTiporecebdesemb, ListRamoTiporecebDesenbNaoAssoc,
//             ListTiporecebDesenbNaoAssoc
// Data      : 01/09/2003
// Autor     : David Ayrolla
// Descrição : Filtragem dos tipos de desembolso pelo campo ATIVO
// Pendência : 14458
// -----------------------------------------------------------------------------

Unit uCtrlTiporecebdesemb;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTiporecebdesemb,
  DB, DbClient, uCMTypes, uCtrlPadroes;



Type
  TCtrlTiporecebdesemb = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbTiporecebdesemb: TDbTiporecebdesemb;
    Fcds: TClientDataSet;
    _Padroes: TCtrlPadroes;
    Procedure Setcds(Const Value: TClientDataSet);
  public



    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListTiporecebdesemb(RECPAG: String;
      IDPESSOA: integer;
      ANASINT: String = '';
      FLGCALCULAIMPOSTO: String = '';
      CODTIPRECDES: String = '';
      ATIVO : String = ''): OleVariant;
    Function ListTipoRecebDesembxTipoCli(RECPAG: String = '';
      IDPESSOA: integer = 0;
      IDTIPOCLIENTE: integer = 0): OleVariant;
    Function ListTiporecebDesenbNaoAssoc(RECPAG: String = '';
      IDPESSOA: integer = 0;
      IDTIPOCLIENTE: integer = 0;
      ATIVO : string = '' ): OleVariant;
    Function ListRamoTiporecebDesenbNaoAssoc(RECPAG: String = '';
      IDPESSOA: integer = 0;
      IDRAMOFORNECEDOR: integer = 0;
      ATIVO : string = '' ): OleVariant;
    Function ListTipoRecebDesembxRamoForn(RECPAG: String = '';
      IDPESSOA: integer = 0;
      IDRAMOFORNECEDOR: integer = 0): OleVariant;
    Function ListTiporecebDesenbxFornxdesenb(RECPAG: String;
      IDPESSOA,
      IDPESSOAforn: double;
      ANASINT: String): OleVariant;
    Function ListTiporecebDesenbxRAMOXDESEMB(RECPAG: String;
      IDPESSOA,
      IDPESSOAFORNXRAMO: double;
      ANASINT: String): OleVariant;
    Function ListTiporecebDesenbxCLIXRECEB(RECPAG: String;
      IDPESSOA,
      IDPESSOACLIXRECEB: double;
      ANASINT: String): OleVariant;
    Function ListTiporecebDesenbxCLIXTIPOCLI(RECPAG: String;
      IDPESSOA,
      IDPESSOACLIXTIPOCLI: double;
      ANASINT: String): OleVariant;

    Function GravarTipoRecebDesemb(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
    Function ListParamCap(idpessoa: double; sRecPag: string): OleVariant;
  End;

Implementation

{ TCtrlTiporecebdesemb }




Function TCtrlTiporecebdesemb.GravarTipoRecebDesemb(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTipoRecebDesemb(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbTiporecebdesemb, [], []);
      Msg := _DbTiporecebdesemb.MessageInfo;
      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Tipo de Rec/Des'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Tipo de Rec/Des'
      Else
        sDscLog := 'Alteracao de Tipo de Rec/Des';

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




Constructor TCtrlTiporecebdesemb.Create;
Begin
  Inherited;
  _DbTiporecebdesemb := TDbTiporecebdesemb.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;




Destructor TCtrlTiporecebdesemb.Destroy;
Begin
  _DbTiporecebdesemb.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;




Procedure TCtrlTiporecebdesemb.DoChangeDataBase;
Begin
  Inherited;
  _DbTiporecebdesemb.DataBaseName := DataBaseName;
End;




Function TCtrlTiporecebdesemb.ListTiporecebdesemb(RECPAG: String; IDPESSOA: integer;
  ANASINT, FLGCALCULAIMPOSTO, CODTIPRECDES: String; ATIVO : String ): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT ' +
    'CODTIPRECDES, ' +
    'RECPAG, ' +
    'IDPESSOA, ' +
    'PLACONTACREDITO, ' +
    'PLANO, ' +
    'PLACONTA, ' +
    'IDUSUARIOINCLUSAO, ' +
    'DESCRICAO, ' +
    'ANASINT, ' +
    'FLGOBRIGARESERVA, ' +
    'FLGCALCULAIMPOSTO, ' +
    'IDTIPOAVALIACAO, ' +
    'FLGINDICARECDES, ' +
    'HITCODHIST, ' +
    'CODCORRESP, ' +
    'CODSUBCONTA, ' +
    'CODSUBCONTACRE, ' +
    'ATIVO ' +    
    '  FROM                               ' +
    '    TIPORECEBDESEMB                  ' +
    '  WHERE (IDPESSOA = ' + floattostr(IDPESSOA) + ') ' +
    '    and (RECPAG   = ' + quotedstr(RECPAG) + ') ';
  If trim(ANASINT) <> '' Then
    ssql := ssql + '    And (ANASINT  = ''' + trim(ANASINT) + ''')             ';
  If trim(FLGCALCULAIMPOSTO) <> '' Then
    ssql := ssql + '    and (FLGCALCULAIMPOSTO = ''' + trim(FLGCALCULAIMPOSTO) + ''')        ';
  If trim(CODTIPRECDES) <> '' Then
    ssql := ssql + '   and  RTRIM(CODTIPRECDES) = ''' + trim(CODTIPRECDES) + '''        ';
    
  { DAVID - 01/09/2003 - Pendência 14458
    Filtragem dos tipos de desembolso pelo campo ATIVO }
  If trim(ATIVO) <> '' Then
    ssql := ssql + '   and  RTRIM(ATIVO) = ''' + trim(ATIVO) + '''        ';

  ssql := ssql + '    ORDER BY                           ' +
    '    DESCRICAO';
  Result := GetDataPacket(ssql);
End;




Procedure TCtrlTiporecebdesemb.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;




Function TCtrlTiporecebdesemb.ListTipoRecebDesembxTipoCli(RECPAG: String;
  IDPESSOA: integer; IDTIPOCLIENTE: integer): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT ' +
    '    TX.CODTIPRECDES,TX.RECPAG,TX.IDPESSOA,TR.DESCRICAO,TR.ANASINT, ' +
    '    TX.IDTIPOCLIXRECEB, TX.IDTIPOCLIENTE ' +
    'FROM ' +
    '    TIPORECEBDESEMB TR, ' +
    '    TIPOCLIXRECEB  TX ' +
    'WHERE ' +
    '    TR.RECPAG = ''' + RECPAG + ''' AND ' +
    '    TR.IDPESSOA = ' + inttostr(IDPESSOA) + ' AND ';
  If IDTIPOCLIENTE <> 0 Then
    Ssql := ssql + '    TX.IDTIPOCLIENTE = ' + inttostr(IDTIPOCLIENTE) + '  AND ';
  Ssql := ssql + '    TR.CODTIPRECDES = TX.CODTIPRECDES AND ' +
    '    TR.RECPAG       = TX.RECPAG AND ' +
    '    TR.IDPESSOA     = TX.IDPESSOA ' +
    'ORDER BY ' +
    '    TR.CODTIPRECDES, TR.ANASINT ';
  Result := GetDataPacket(ssql);
End;




Function TCtrlTiporecebdesemb.ListTiporecebDesenbNaoAssoc(RECPAG: String;
  IDPESSOA, IDTIPOCLIENTE: integer; ATIVO : string ): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT CODTIPRECDES,RECPAG,IDPESSOA,DESCRICAO,ANASINT ' +
    'FROM TIPORECEBDESEMB ' +
    'WHERE (RECPAG = ''' + RECPAG + ''') AND ' +
    '      (IDPESSOA = ' + inttostr(IDPESSOA) + ') AND ' +
    '      (CODTIPRECDES NOT IN ' +
    '        (SELECT CODTIPRECDES ' +
    '           FROM TIPOCLIXRECEB ' +
    '           WHERE IDTIPOCLIENTE = ' + inttostr(IDTIPOCLIENTE) + ')) ' ;

  { DAVID - 01/09/2003 - Pendência 14458
    Filtragem dos tipos de desembolso pelo campo ATIVO }
  if trim( ATIVO ) <> '' then
    sSql := sSql + ' and ATIVO = ' + QuotedStr( ATIVO );

  sSql := sSql + 'ORDER BY CODTIPRECDES, ANASINT ';
  Result := GetDataPacket(ssql);
End;




Function TCtrlTiporecebdesemb.ListParamCap(idpessoa: double; sRecPag: string): OleVariant;
Begin
  Result := GetDataPacket('SELECT ' +
                          'P.FLGTRDXCCXCONTA, ' +
                          'P.FLGTRDXIMPOSTOS ' +
                          'FROM ' +
                          'PARAMCAP P ' +
                          'WHERE ' +

                          //  Rodolpho da Silva - P: 19624 - 18/07/2005
                          ' P.RECPAG = ' + QuotedStr(sRecPag) + ' AND ' + 

                          'P.IDPESSOA = ' + FloatToStr(IdPessoa));
End;




Function TCtrlTiporecebdesemb.ListTiporecebDesenbxFornxdesenb(RECPAG: String;
  IDPESSOA,
  IDPESSOAforn: double;
  ANASINT: String): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
    '   T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO,  ' +
    '   T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  ' +
    ' FROM TIPORECEBDESEMB T, FORNXDESEMB F ' +
    ' WHERE (T.ANASINT       = ''' + ANASINT + ''') AND ' +
    '       (T.RECPAG        = ''' + RecPag + ''') AND  ' +
    '       (T.IDPESSOA      = ' + FloattoStr(idpessoa) + ') AND ' +
    '       (F.IDPESSOA      = ' + FloatToStr(IdpessoaForn) + ') AND ' +
    '       (F.RECPAG        = T.RECPAG) AND  ' +
    '       (F.IDEMPRESAPROP = T.IDPESSOA) AND ' +
    '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
    ' ORDER BY T.DESCRICAO';
  Result := GetDataPacket(ssql);
End;




Function TCtrlTiporecebdesemb.ListTiporecebDesenbxRAMOXDESEMB(RECPAG: String;
  IDPESSOA,
  IDPESSOAFORNXRAMO: double;
  ANASINT: String): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
    '  T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, ' +
    '  T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO ' +
    ' FROM TIPORECEBDESEMB T, RAMOXDESEMB R ' +
    ' WHERE (T.ANASINT          = ''' + ANASINT + ''') AND ' +
    '       (T.RECPAG           = ''' + RecPag + ''') AND  ' +
    '       (T.IDPESSOA         = ' + Floattostr(idPESSOA) + ') AND ' +
    '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR  ' +
    '                                FROM FORNXRAMO WHERE IDPESSOA = ' + FloatToStr(IDPESSOAFORNXRAMO) + ')) AND ' +
    '       (R.RECPAG           = T.RECPAG)   AND ' +
    '       (R.IDPESSOA         = T.IDPESSOA) AND ' +
    '       (R.CODTIPRECDES     = T.CODTIPRECDES) ' +
    ' ORDER BY T.DESCRICAO';
  Result := GetDataPacket(ssql);
End;




Function TCtrlTiporecebdesemb.ListTiporecebDesenbxCLIXRECEB(RECPAG: String;
  IDPESSOA,
  IDPESSOACLIXRECEB: double;
  ANASINT: String): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
    '   T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, ' +
    '   T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  ' +
    ' FROM TIPORECEBDESEMB T, CLIXRECEB F ' +
    ' WHERE (T.ANASINT       = ''' + ANASINT + ''') AND ' +
    '       (T.RECPAG        = ''' + RecPag + ''') AND  ' +
    '       (T.IDPESSOA      = ' + FloattoStr(idpessoa) + ') AND ' +
    '       (F.IDPESSOA      = ' + FloatToStr(IdpessoaCLIXRECEB) + ') AND ' +
    '       (F.RECPAG        = T.RECPAG) AND  ' +
    '       (F.IDEMPRESA     = T.IDPESSOA) AND ' +
    '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
    ' ORDER BY T.DESCRICAO';
  Result := GetDataPacket(ssql);
End;




Function TCtrlTiporecebdesemb.ListTiporecebDesenbxCLIXTIPOCLI(RECPAG: String;
  IDPESSOA,
  IDPESSOACLIXTIPOCLI: double;
  ANASINT: String): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, ' +
    '  T.PLANO, T.PLACONTA, T.IDUSUARIOINCLUSAO, T.DESCRICAO, ' +
    '  T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO ' +
    '  FROM TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
    ' WHERE (T.ANASINT     = ''' + ANASINT + ''') AND ' +
    '  (T.RECPAG           = ''' + RecPag + ''') AND  ' +
    '  (T.IDPESSOA         = ' + FloattoStr(IdPessoa) + ') AND ' +
    '  (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE  ' +
    '                          FROM CLIXTIPOCLI WHERE IDPESSOA = ' + FloatToStr(IDPESSOACLIXTIPOCLI) + ')) AND ' +
    '       (TR.RECPAG           = T.RECPAG)   AND ' +
    '       (TR.IDPESSOA         = T.IDPESSOA) AND ' +
    '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ' +
    ' ORDER BY T.DESCRICAO';
  Result := GetDataPacket(ssql);
End;




Procedure TCtrlTiporecebdesemb.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;




Function TCtrlTiporecebdesemb.ListRamoTiporecebDesenbNaoAssoc(
  RECPAG: String; IDPESSOA, IDRAMOFORNECEDOR: integer; ATIVO : string ): OleVariant;
Var
  sSql: String;
Begin
  sSql := 'SELECT CODTIPRECDES,RECPAG,IDPESSOA,DESCRICAO,ANASINT ' +
    'FROM TIPORECEBDESEMB ' +
    'WHERE (RECPAG = ''' + RECPAG + ''') AND ' +
    '      (IDPESSOA = ' + inttostr(IDPESSOA) + ') AND ' +
    '      (CODTIPRECDES NOT IN ' +
    '        (SELECT CODTIPRECDES ' +
    '           FROM RAMOXDESEMB ' +
    '           WHERE IDRAMOFORNECEDOR = ' + inttostr(IDRAMOFORNECEDOR) + ')) ' ;

  { DAVID - 01/09/2003 - Pendência 14458
    Filtragem dos tipos de desembolso pelo campo ATIVO }
  if trim( ATIVO ) <> '' then
    sSql := sSql + ' and ATIVO = ' + QuotedStr( ATIVO );

  sSql := sSql + ' ORDER BY CODTIPRECDES, ANASINT ';
  Result := GetDataPacket(sSql);
End;




Function TCtrlTiporecebdesemb.ListTipoRecebDesembxRamoForn(RECPAG: String;
  IDPESSOA, IDRAMOFORNECEDOR: integer): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT RX.CODTIPRECDES,RX.RECPAG,RX.IDPESSOA,TR.DESCRICAO,TR.ANASINT, ' +
    '  RX.IDRAMOXDESEMB, RX.IDRAMOFORNECEDOR ' +
    ' FROM TIPORECEBDESEMB TR, RAMOXDESEMB RX ' +
    ' WHERE TR.RECPAG = ''' + RECPAG + ''' AND ' +
    '       TR.IDPESSOA = ' + inttostr(IDPESSOA) + ' AND ';
  If IDRAMOFORNECEDOR <> 0 Then
    Ssql := ssql + '    RX.IDRAMOFORNECEDOR = ' + inttostr(IDRAMOFORNECEDOR) + ' AND ';
  Ssql := ssql + '    TR.CODTIPRECDES = RX.CODTIPRECDES AND ' +
    '    TR.RECPAG       = RX.RECPAG AND ' +
    '    TR.IDPESSOA     = RX.IDPESSOA ' +
    ' ORDER BY  TR.CODTIPRECDES, TR.ANASINT ';
  Result := GetDataPacket(ssql);
End;




Procedure TCtrlTiporecebdesemb.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

