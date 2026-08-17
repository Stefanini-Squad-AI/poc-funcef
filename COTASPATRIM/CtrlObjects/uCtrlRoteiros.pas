unit uCtrlRoteiros;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCMClientDataSet, UCMTypes, Dialogs, uCtrlPadroes, udbCpRoteiro,
     udbCprTpMovim, udbCprTpEntrada;

type
   TCtrlRoteiro = Class(TCmControlObject)
   private

    _DbCproteiro:  TDbCproteiro;
    _DbCprtpmovim: TDbCprtpmovim;
    _DbCprtpentrada: TDbCprtpentrada;

   public
   _CdsPrin       : TCMClientDataSet;
   _CdsDet        : TCMClientDataSet;
   _CdsDetEnt     : TCMClientDataSet;

   _CdsDetMov     : TCMClientDataSet;
   _CdsCarrega    : TCMClientDataSet;

      Function CarregaRoteiro(iIDCPROTEIRO: Integer): OleVariant;
      Function CarregaCpEntrada: OleVariant;
      Function CarregaCpREntrada(iIDCPROTEIRO:Integer): OleVariant;
      Function CarregaCpRTpMovim(iIDCPROTEIRO:Integer): OleVariant;
      Function VerificaRoteiro( iIdCpRoteito : integer; sNome : string ) : Boolean;
      Function CarregaDesembolso( sRecPag : String = ''; sAnalitSint : string = '' ): OleVariant;
      Function GravaDados: Boolean;
      Function ExcluiDados: Boolean;
      Function CarregaMovimento: OleVariant;
      Function CarregaConta( iIdCpAtivo : integer ): OleVariant;
      Function CarregaRegra: OleVariant;
      Function CarregaAlterador : OLEVariant;

      Function DesembObrigaCotas( sCODTIPRECDES : string ): boolean;

      function DescDesembReceb( sCod, sRecPag : string ) : string;

      function LookupRoteiros : OLEVariant;

      Constructor Create; override;
      Destructor Destroy; override;
      Procedure OnCreateAppServer; override;
   protected
      Procedure DoChangeDataBase; override;
   end;


implementation

constructor TCtrlRoteiro.Create;
begin
  inherited;
  _DbCproteiro   := TDbCproteiro.Create(Self);
  _DbCprtpmovim  := TDbCprtpmovim.Create(Self);
  _DbCprtpentrada:= TDbCprtpentrada.Create(Self);
  _CdsPrin       := TCMClientDataSet.Create(nil);
  _CdsDet        := TCMClientDataSet.Create(nil);
  _CdsDetEnt     := TCMClientDataSet.Create(nil);
  _CdsDetMov     := TCMClientDataSet.Create(nil);
  _CdsCarrega    := TCMClientDataSet.Create(nil);

end;

destructor TCtrlRoteiro.Destroy;
begin
   _DbCproteiro.Free;
   _DbCprtpentrada.Free;
   _DbCprtpmovim.Free;
   _CdsCarrega.Free;

  if IsAppServer then
  Begin
     _CdsPrin.Free;
     _CdsDet.Free;
     _CdsDetEnt.Free;
     _CdsDetMov.Free;
     
  End;
  inherited;
end;

procedure TCtrlRoteiro.DoChangeDataBase;
begin
  inherited;
  _DbCproteiro.DataBaseName := databasename;
  _DbCprtpentrada.DataBaseName := databasename;
  _DbCprtpmovim.DataBaseName := databasename;

end;

procedure TCtrlRoteiro.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlRoteiro.GravaDados: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GravaDados;
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(_CdsPrin, _DbCproteiro, [],[]);
          if not Result then Raise Exception.Create( _DbCproteiro.MessageInfo );

          Result:=ApplyCds(_CdsDetEnt, _DbCprtpentrada, [_DbCproteiro.Idcproteiro], [_DbCprtpentrada.Idcproteiro] );
          if not Result then Raise Exception.Create( _DbCprtpentrada.MessageInfo );

          Result:=ApplyCds(_CdsDetMov, _DbCprtpmovim, [_DbCproteiro.Idcproteiro], [_DbCprtpmovim.Idcproteiro] );
          if not Result then Raise Exception.Create( _DbCprtpmovim.MessageInfo );

           Commit;
           Result:= True;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;


function TCtrlRoteiro.CarregaRoteiro(iIDCPROTEIRO: Integer): OleVariant;
begin
  Result:=GetDataPacket('SELECT * FROM CPROTEIRO WHERE IDCPROTEIRO = ' + IntToStr( iIDCPROTEIRO ) );
end;

function TCtrlRoteiro.VerificaRoteiro( iIdCpRoteito : integer; sNome : string ) : Boolean;
begin
  _CdsCarrega.Data := GetDataPacket('SELECT * FROM ' +
                                   '   CPROTEIRO WHERE UPPER( NOME ) = '+QuotedStr(UpperCase(sNome) ) +
                                   '   AND IDCPROTEIRO <> ' + IntToStr( iIdCpRoteito ) );
  Result:= _CdsCarrega.IsEmpty;
end;


function TCtrlRoteiro.CarregaDesembolso( sRecPag : String = '' ; sAnalitSint : string = '' ): OleVariant;
var
  sSQL: string;
begin
  sSQL := ' SELECT t.IDPESSOA        ,                                                     ' +
          '        t.CODTIPRECDES    ,                                                     ' +
          '        t.RECPAG          ,                                                     ' +
          '        t.ANASINT         ,                                                     ' +
          '        t.DESCRICAO       ,                                                     ' +
          '        trim( t.CODTIPRECDES ) || '' - '' || trim( t.DESCRICAO ) as DESCEXIBE , ' +
          '        T.FLGOBRQTDECOTAS ,                                                     ' +
          '        DECODE( T.FLGOBRQTDECOTAS, ''S'', ''Sim'', ''Não'' ) as OBRQTDECOTAS    ' +
          ' FROM   TIPORECEBDESEMB t                                                       ' +
          ' WHERE  t.ATIVO   = ''S''                                                       ' ;

  if Trim( sAnalitSint ) <> '' then
    sSQL := sSQL + ' AND ANASINT = ' + QuotedStr( trim( sAnalitSint ) );

  if Trim( sRecPag ) <> '' then
    sSQL := sSQL + ' AND RECPAG = ' + QuotedStr( trim( sRecPag ) );

  sSQL := sSQL + ' ORDER BY t.CODTIPRECDES, t.RECPAG, t.DESCRICAO ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlRoteiro.CarregaConta( iIdCpAtivo : integer ): OleVariant;
begin
  Result := GetDataPacket('SELECT IDCPCONTA, NOME FROM CPCONTA ' + 
   ' WHERE IDCPATIVO = ' + IntToStr( iIdCpAtivo ) + ' ORDER BY NOME' );
end;

function TCtrlRoteiro.CarregaMovimento: OleVariant;
begin
  Result := GetDataPacket( ' SELECT * FROM CPTIPOMOVIM ORDER BY NOME ');
end;

function TCtrlRoteiro.CarregaRegra: OleVariant;
begin
  Result:= GetDataPacket('SELECT                                                   '+
                         '   R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA,                '+
                         '   P.IDGRUPOREGRA                                        '+
                         'FROM                                                     '+
                         '   REGRA R,  TIPOREGRA  T,                               '+
                         '   GRUPOREGRA GR, PARAMCOTAPATRIM P                      '+
                         'WHERE                                                    '+
                         '   (R.IDTIPOREGRA = T.IDTIPOREGRA) AND                   '+
                         '   (GR.IDGRUPOREGRA = T.IDGRUPOREGRA) AND                '+
                         '   (GR.IDGRUPOREGRA = P.IDGRUPOREGRA)' );
end;

function TCtrlRoteiro.CarregaCpREntrada(iIDCPROTEIRO: integer): OleVariant;
begin
  Result := GetDataPacket('SELECT DISTINCT                                            ' +
                          '   decode( trim( D.CODTIPRECDES ), '''', '''', trim( D.CODTIPRECDES ) || '' ('' || trim( D.RECPAG ) || '') - '' || trim( D.DESCRICAO ) ) as DESCEXIBE, ' + 
                          '   C.IDCPRTPENTRADA, C.IDCPTPENTRADA, C.IDPESSOA,          ' +
                          '   C.IDPESSOA, C.RECPAG, C.CODTIPRECDES, C.IDCPROTEIRO,    ' +
                          '   C.CODALTERADOR, A.DESCRICAO AS NOME_ALTERADOR,          ' +
                          '   T.IDCPTPENTRADA, T.NOME NOME_ENTRADA, D.CODTIPRECDES,   ' +
                          '   D.DESCRICAO NOME_RECEB, C.FLGORIGEM, T.TIPOUNIDADE,     ' +
                          '   DECODE( C.FLGORIGEM, ''R'', ''Desembolso/Recebimento'', ' +
                          '    ''V'', ''Valor Líquido da Operação'', ''Q'',           ' +
                          '    ''Quantidade de Cotas'', ''A'', ''Alterador'',         ' + 
                          '    ''Manual'' ) as ORIGEM        ' +
                          'FROM                                                       ' +
                          '   TIPORECEBDESEMB D,                                      ' +
                          '   TIPOALTERADOR A,                                        ' +
                          '   CPTPENTRADA T,                                          ' +
                          '   CPRTPENTRADA C,                                         ' +
                          '   CPROTEIRO R                                             ' +
                          'WHERE                                                      ' +
                          '   (C.IDCPTPENTRADA = T.IDCPTPENTRADA(+)) AND              ' +
                          '   (C.CODTIPRECDES  = D.CODTIPRECDES(+)) AND               ' +
                          '   (C.RECPAG        = D.RECPAG(+)) AND                     ' +
                          '   (C.CODALTERADOR  = A.CODALTERADOR(+)) AND               ' +                          
                          '   ((D.RECPAG       = R.RECPAG) OR (D.RECPAG is null)) AND ' +
                          '   (C.IDCPROTEIRO   = ' + IntToStr( iIDCPROTEIRO ) + ')    ' );
end;

function TCtrlRoteiro.CarregaCpRTpMovim(iIDCPROTEIRO: Integer): OleVariant;
begin
  Result := GetDataPacket('SELECT                                                                ' +
                          '  CT.NOME, R.NOMEREGRA NOME_REGRA, R.IDREGRA,                         ' +
                          '  CE.NOME NOME_ENTRADA,                                               ' +
                          '  C.IDCPCONTA, C.NOME NOME_CONTA, CT.IDCPTIPOMOVIM,                   ' +
                          '  T.IDCPRTPMOVIM, T.IDCPTIPOMOVIM, CT.FLGTPMOVIM,                     ' +
                          '  T.IDCPCONTA, T.IDREGRA, T.FLGORIGEM,                                ' +
                          '  DECODE( T.FLGORIGEM, ''E'', ''Entrada'', ''Regra'' ) as ORIGEM,     ' +
                          '  CT.FLGENTSAI, T.IDCPTPENTRADA, T.IDCPROTEIRO, CT.TIPOUNIDADE,       ' +
                          '  DECODE( CT.TIPOUNIDADE, ''Q'', ''Quantidade de cotas'', ''Valor'' ) as DESCTIPOUNIDADE, ' +
                          '  DECODE( CT.FLGENTSAI, ''E'', ''Entrada'', ''Saída'' ) as FLGENTSAI  ' +
                          'FROM                                                                  ' +
                          '  CPCONTA C,                                                          ' +
                          '  CPRTPMOVIM T,                                                       ' +
                          '  CPTIPOMOVIM CT,                                                     ' +
                          '  REGRA R,                                                            ' +
                          '  CPTPENTRADA CE,                                                     ' +
                          '  CPROTEIRO CR                                                        ' +
                          'WHERE                                                                 ' +
                          '  (T.IDCPTPENTRADA = CE.IDCPTPENTRADA(+)) AND                         ' +
                          '  (T.IDREGRA = R.IDREGRA(+)) AND                                      ' +
                          '  (CT.IDCPTIPOMOVIM = T.IDCPTIPOMOVIM) AND                            ' +
                          '  (T.IDCPCONTA = C.IDCPCONTA (+) ) AND                                     ' +
                          '  (CR.IDCPROTEIRO = T.IDCPROTEIRO) AND                                ' +
                          '  (T.IDCPROTEIRO = '+IntToStr(iIDCPROTEIRO)+')                        ' +
                          'ORDER BY                                                              ' +
                          '   CT.NOME                                                            ' );
end;

function TCtrlRoteiro.CarregaCpEntrada: OleVariant;
begin
  Result := GetDataPacket( ' SELECT IDCPTPENTRADA, NOME, DESCRICAO, TIPOUNIDADE, ' +
                           ' DECODE( TIPOUNIDADE, ''V'', ''Valor financeiro'',   ' +
                           '    ''Quantidade de cotas'') AS DESCTIPOUNIDADE      ' +
                           'FROM CPTPENTRADA ORDER BY NOME ' );
end;

function TCtrlRoteiro.ExcluiDados: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiDados( _CdsdetEnt.Data, _CdsDetMov.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
    StartTransaction;

      //Exclui as entradas
      Result := ApplyCds( _CdsDetEnt, _DbCprtpentrada, [], [] );
      if not Result then raise Exception.Create( _DbCprtpentrada.MessageInfo );

      //Exclui as movimentações
      Result := ApplyCds( _CdsDetMov, _DbCprtpmovim, [], [] );
      if not Result then raise Exception.Create( _DbCprtpmovim.MessageInfo );

      //Exclui o roteiro
      Result := ApplyCds( _CdsPrin, _DbCproteiro, [], [] );
      if not Result then raise Exception.Create( _DbCproteiro.MessageInfo );

      Commit;

    except
      on E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlRoteiro.LookupRoteiros: OLEVariant;
begin
  Result := GetDataPacket( ' select * from CPROTEIRO order by DESCRICAO ' );
end;

function TCtrlRoteiro.DesembObrigaCotas( sCODTIPRECDES : string ) : boolean;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( ' select FLGOBRQTDECOTAS from TIPORECEBDESEMB ' +
     ' where CODTIPRECDES = ' + QuotedStr( sCODTIPRECDES ) );

    Result := ( cdsLocal.FieldByName('FLGOBRQTDECOTAS').AsString = 'S' );
  finally
    cdsLocal.Free;
  end;
end;


function TCtrlRoteiro.CarregaAlterador: OLEVariant;
begin
  Result:= GetDataPacket( ' select CODALTERADOR, DESCRICAO from TIPOALTERADOR order by 2 ' );
end;

function TCtrlRoteiro.DescDesembReceb( sCod, sRecPag : string ) : string;
begin
  _Cds.Data := GetDataPacket(
   ' select DESCRICAO from TIPORECEBDESEMB ' +
   ' where CODTIPRECDES = ' + QuotedStr( trim( sCod ) ) +
   ' and RECPAG = ' + QuotedStr( trim( sRecPag ) ) );
  Result := _Cds.FieldByName('DESCRICAO').AsString; 
end;

end.
