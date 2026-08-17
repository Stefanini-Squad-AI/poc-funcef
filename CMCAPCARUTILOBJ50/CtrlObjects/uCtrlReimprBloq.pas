{*******************************************************************************
-------------------------------------------------------------------------------
Nº SIG......: 29271
Data........: 03/02/2017
Responsável.: William Santana
Descrição...: Modernização Layout
--------------------------------------------------------------------------------
*******************************************************************************}
{
 ATUALIZADO POR: andre tavares - pendência 17441 - 25/08/2004
                 atualiza o STATUS = 0 na tabela documento no momento da liberação
                 da reimpressão. Não foi necessário limpar o CODGRUPOCNAB.

}
unit uCtrlReimprBloq;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
     DbClient, Classes, uCmTypes, uCtrlEventoDocum, uSistema;

type

  TCtrlReimprBloq = class(TCmControlObject)
  protected
    procedure AfterInitialize; Override;
  private
    _Cds: TClientDataSet;
    CtrlEventoDocum : TCtrlEventoDocum;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;
    function ListTipoDoc(pRecPag : String; pIDUsuario : Integer) : OLEVariant;
     function ListDocumentos(pRecPag : String; pIDUsuario : Integer; pIDPessoa : Integer;
    pIDCliente, pIDModulo, pTipoDocumento, pEmissaoInicial, pEmissaoFinal, pNossoNumero,
    //pPortadorForma, pTipoCliente : String) : OLEVariant; //William Santana - SIG 29271
    pPortadorForma, pIdUsuarioLanc : String) : OLEVariant; //William Santana - SIG 29271
    function GravarReimprBloq(ovDados : OleVariant; pLimpaNossoNumero : Boolean) : Boolean;
 end;


implementation

{ TCtrlReimprBloq }

function TCtrlReimprBloq.GravarReimprBloq(
  ovDados: OleVariant; pLimpaNossoNumero : Boolean): Boolean;
var sSQL : String;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.GravarReimprBloq(ovDados, pLimpaNossoNumero);
     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := True;
    if _Cds.Active then _Cds.Close;
    _Cds.Data := ovDados;
    StartTransaction;
    try
      _Cds.First;
      while not _Cds.Eof do
      begin
        if _Cds.FieldByName('EMISBLOQ').AsString = 'N' then
        begin
          // inicio - andre tavares - pendência 17441 - 25/08/2004
          sSQL := 'UPDATE DOCUMENTO SET EMISBLOQ = ''N'', CONTROLEREMESSA = NULL, STATUS = 0 ';
          sSQL := sSQL + ', FLGREGISTRADO = ''N'' ';  //William Santana - SIG 29271
          // fim - andre tavares - pendência 17441 - 25/08/2004
          if _Cds.FieldByName('EMISBLOQ').AsString = 'N' then
          begin

            if pLimpaNossoNumero then
               sSQL := sSQL + ', NOSSONUMERO = NULL ';

           if not ExecSQL(sSQL + ' WHERE CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString) then
           begin
             Raise Exception.Create(MessageInfo);
             exit;
           end;

           if not CtrlEventoDocum.GravaLogEvento( -1, Sistema.IdUsuario, _Cds.FieldByName('CODDOCUMENTO').AsFloat, 'Nosso número anterior: ' + _Cds.FieldByName('NOSSONUMERO').AsString ) then
           begin
             Raise Exception.Create(CtrlEventoDocum.MessageInfo);
             exit;
           end;

          end;
        end;
        _Cds.Next;
      end;
      Commit;
    except
      On E:Exception Do
      begin
        Result := False;
        MessageInfo := E.Message;
        Rollback;
      end;
    end;
  end;
end;

constructor TCtrlReimprBloq.Create;
begin
  inherited;
  _Cds := TClientDataSet.Create(nil);
  CtrlEventoDocum := TCtrlEventoDocum.Create;
end;

destructor TCtrlReimprBloq.Destroy;
begin
  _Cds.Free;
  CtrlEventoDocum.Free;
  inherited;
end;

function TCtrlReimprBloq.ListDocumentos(pRecPag: String; pIDUsuario,
  pIDPessoa : Integer; pIDCliente, pIDModulo, pTipoDocumento, pEmissaoInicial,
  //pEmissaoFinal, pNossoNumero, pPortadorForma, pTipoCliente: String): OLEVariant;  //William Santana - SIG 29271
  pEmissaoFinal, pNossoNumero, pPortadorForma, pIdUsuarioLanc : String) : OLEVariant; //William Santana - SIG 29271          
var sListSQL : TStrings;
begin
  sListSQL := TStringList.Create;
  with sListSQL do
  begin
    Append('SELECT');
    Append('  D.CODDOCUMENTO,'                                                );
    Append('  D.NODOCUMENTO,'                                                 );
    Append('  D.COMPLDOCUMENTO,'                                              );
    Append('  D.DATAEMISSAO,'                                                 );
    Append('  D.DATAVENCTO,'                                                  );
    Append('  D.DATAPROGRAMADA,'                                              );
    Append('  D.EMISBLOQ,'                                                    );
    Append('  D.NOSSONUMERO,'                                                 );
    Append('  D.CONTROLEREMESSA,'                                             );
    Append('  L.VALOR,'                                                       );
    Append('  P.RAZAOSOCIAL,'                                                 );
    Append('  TD.DESCRICAO AS DESCRDOCTO,'                                    );
    Append('  PF.DESCRICAO,'                                                  );
   // Append('  TC.DESCRICAO AS DESCRTIPOCLI,'                                  ); //William Santana - SIG 29271
    Append('  U.NOMEUSUARIO,'                                                 );   //William Santana - SIG 29271
    Append('  M.NOMEMODULO'                                                   );
    Append('FROM'                                                             );
    Append('  DOCUMENTO D, '                                                  );
    Append('  LANCTODOCUM L, '                                                );
    Append('  TIPODOCRECPAG TD, '                                             );
    Append('  PESSOA P, '                                                     );
    Append('  PORTADORFORMA PF, '                                             );
    Append('  CLIENTEPESS CP, '                                               );
   // Append('  TIPOCLIENTE TC, '                                               ); //William Santana - SIG 29271
    Append('  USUARIOSISTEMA U, '                                             );   //William Santana - SIG 29271
    Append('  MODULO M '                                                      );
    Append('WHERE '                                                           );
    Append('  D.RECPAG = ''R'' AND '                                          );
    Append('  D.EMISBLOQ = ''S'' AND '                                        );
    Append('  D.IDFORCLI = P.IDPESSOA AND '                                   );
    Append('  D.CODDOCUMENTO = L.CODDOCUMENTO AND '                           );
    Append('  D.OPERACAO = L.OPERACAO AND '                                   );
    Append('  D.CODTIPDOC = TD.CODTIPDOC AND '                                );
    Append('  D.CODPORTFORMA = PF.CODPORTFORMA AND '                          );
    Append('  L.ESTORNO IS NULL AND '                                         );
    Append('  D.CODTIPDOC in '                                                );
    Append(' (SELECT '                                                        );
    Append('    CODTIPDOC '                                                   );
    Append('  FROM '                                                          );
    Append('    TIPODOCRECPAG TD '                                            );
    Append('  WHERE '                                                         );
    Append('    TD.RECPAG = ' + QuotedStr(pRecPag) + ' AND '                  );
    Append('    not Exists '                                                  );
    Append('    (select 1 '                                                   );
    Append('     from '                                                       );
    Append('       UsuarioxTpdocto b '                                        );
    Append('     where '                                                      );
    Append('       recpag = '+ QuotedStr(pRecPag) + ' AND '                   );
    Append('       b.idusuario = ' + inttostr(pIdUsuario) + ')'               );
    Append('  UNION '                                                         );
    Append('  SELECT '                                                        );
    Append('    CODTIPDOC '                                                   );
    Append('  FROM '                                                          );
    Append('    TIPODOCRECPAG TD '                                            );
    Append('  WHERE '                                                         );
    Append('    TD.RECPAG = ' + QuotedStr(pRecPag) + ' AND '                  );
    Append('    Exists '                                                      );
    Append('    (select 1'                                                    );
    Append('     from '                                                       );
    Append('       UsuarioxTpdocto b '                                        );
    Append('     where '                                                      );
    Append('       recpag = '+ QuotedStr(pRecPag) + ' AND '                   );
    Append('       TD.codtipdoc = b.codtipdoc AND '                           );
    Append('       b.idusuario = ' + inttostr(pIDUsuario)+ ')) '              );
    Append(' AND D.IDPESSOA = ' + IntToStr(pIDPessoa)                         );
    Append(' AND D.STATUS <> 2'                                               );
    Append(' AND D.IDUSUARIOINCLUSAO = U.IDUSUARIO '                          );   //William Santana - SIG 29271
    Append(' AND M.IDMODULO = D.IDMODULO'                                     );
    if pIDCliente <> '0'  then
      Append(' AND D.IDFORCLI = ' + pIDCliente                                );

    if pTipoDocumento <> '' then
      Append(' AND D.CODTIPDOC = ' + pTipoDocumento                           );

    if trim(pEmissaoInicial) <> '' then
      Append(' AND (D.DATAEMISSAO >= TO_Date('+ QuotedStr(pEmissaoInicial) + ',''dd/mm/yyyy''))');

    if trim(pEmissaoFinal) <> '' then
      Append(' AND (D.DATAEMISSAO <= TO_DATE('+ QuotedStr(pEmissaoFinal) + ',''dd/mm/yyyy''))');

    if trim(pNossoNumero) <> '' then
      Append(' AND D.NOSSONUMERO = '+ QuotedStr(pNossoNumero)                 );

    if pPortadorForma <> '' then
      Append(' AND D.CODPORTFORMA = ' + pPortadorForma                        );

    if pIDModulo <> '' then
      Append(' AND D.IDMODULO = ' + pIDModulo                                 );
    //Início - William Santana - SIG 29271
    //if pTipoCliente <> '' then
//    begin
//      Append(' AND CP.IDPESSOA = D.IDFORCLI AND '                             );
//      Append(' CP.IDTIPOCLIENTE = ' + pTipoCliente                            );
//      Append(' AND CP.IDTIPOCLIENTE = TC.IDTIPOCLIENTE(+)'                    );
//    end
//    else
//    begin
//      Append(' AND CP.IDPESSOA = D.IDFORCLI  ');
//      Append(' AND CP.IDTIPOCLIENTE = TC.IDTIPOCLIENTE(+)');
//    end;
     Append(' AND CP.IDPESSOA = D.IDFORCLI  ');

     if pIdUsuarioLanc <> '' then
     Append(' AND D.IDUSUARIOINCLUSAO = ' + pIdUsuarioLanc);
   //Término - William Santana - SIG 29271
   
    Append(' ORDER BY RAZAOSOCIAL, DESCRDOCTO, NODOCUMENTO, DATAEMISSAO, DATAVENCTO');
  end;
  Result := GetDataPacket(sListSQL);
  sListSQL.Free;
end;

function TCtrlReimprBloq.ListTipoDoc(pRecPag: String; pIDUsuario : Integer): OLEVariant;
var sListSQL : TStrings;
begin
  sListSQL := TStringList.Create;
  with sListSQL do
  begin
    Append('SELECT');
    Append('  CODTIPDOC,');
    Append('  DESCRICAO');
    Append('FROM');
    Append('  TIPODOCRECPAG T');
    Append('WHERE');
    Append('  T.RECPAG = ' + QuotedStr(pRECPAG) + ' AND');
    Append('  not Exists (SELECT 1 FROM USUARIOxTPDOCTO U');
    Append('              WHERE U.IDUSUARIO = ' + IntToStr(pIDUsuario) + ' AND');
    Append('                    U.RECPAG = ' + QuotedStr(pRECPAG) + ')');
    Append('              union');
    Append('              SELECT CODTIPDOC, DESCRICAO');
    Append('              FROM TIPODOCRECPAG T');
    Append('              WHERE T.RECPAG = ' + QuotedStr(pRECPAG) + ' AND');
    Append('              EXISTS (SELECT 1 FROM USUARIOxTPDOCTO U');
    Append('                      WHERE T.CODTIPDOC = U.CODTIPDOC AND');
    Append('                            U.IDUSUARIO = ' + IntToStr(pIDUsuario) + ' AND');
    Append('                            U.RECPAG = ' + QuotedStr(pRECPAG) + ')');
    Append('ORDER BY DESCRICAO');
 end;
 Result := GetDataPacket(sListSQL);
 sListSQL.Free;
end;

procedure TCtrlReimprBloq.AfterInitialize;
begin
  inherited;
  CtrlEventoDocum.InitializeAs( Self );
end;

end.
