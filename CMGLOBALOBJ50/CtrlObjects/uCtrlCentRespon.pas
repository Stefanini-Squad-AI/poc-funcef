// Alterações:
{
--------------------------------------------------------------------------------
 Responsável: Everson Cunha
 Data.......: 10/05/2021
 SIG........: 134236
 Descrição..: Histórico mov. Centro Respon (Desmembramento, unificação..)
              DE/PARA
--------------------------------------------------------------------------------
Rotinas............: GetCentResponPadrao
N. SIG..........   : 115594
Data da Alteração: : 28/04/2021
Responsável:       : Edilaine
Descrição.......   : Integração com FDO Digital para rateio de lançamentos
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Adicionar campo AVALIAFORNECEDOR
--------------------------------------------------------------------------------
Rotina    : ListaCentRespon, ListaCentResponAtrib_Usu
Data      : 28/06/2004
Pendencia : 15367
Descrição : Ajustando de/para. Criando parâmetros para listar apenas ativos
--------------------------------------------------------------------------------
Rotina    : ListaCentRespon, ListaCentResponAtrib_Usu
Data      : 20/05/2004
Pendencia : 15365
Descrição : Adaptação das queries com o IDPlanCRespon.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 29/10/2003
Pendencia : 14802
Descrição : IDPLANCRESPON
--------------------------------------------------------------------------------
Rotina    : -
Data      : 31/07/2003
Pendencia : 14560
Descrição :
--------------------------------------------------------------------------------
Rotina    : Várias
Data      : 27/05/2004 (término)
Pendencia : 15166
Descrição : Implementação do cadastro de responsáveis por centros de custo e de
            responsabilida e suas respectivas vigências.
--------------------------------------------------------------------------------}

unit uCtrlCentRespon;

interface

uses
   DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
   uDbCentRespon, ucmClientDataSet,
   // Pendência 15166
   uDbRespCentRespon;

type
// tcrSoSintetica => Somente Sinteticos
// tcrSoAnalitica    => Somente Analiticos
// tcrcAmbos => Todos
   TTipoCentRespon = (tcrSoSintetica,tcrSoAnalitica,tcrAmbos);

// tocrCodigo  => Ordernar  por codigo
// tocrNome    => Ordernar  por nome
   TTipoOrdemCentRespon  = (tocrCodigo, tocrNome);

   TCtrlCentRespon = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; Override;

   private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _DbCentRespon: TDbCentRespon;

      // - Pendência 15166
      _DbRespCentRespon : TDbRespCentRespon;

      Fcds: TClientDataSet;
      FcdsRespCentRespon: TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsRespCentRespon(const Value: TClientDataSet);

   public

      property cds: TClientDataSet read Fcds write Setcds;

      // Pendência 15166
      property cdsRespCentRespon: TClientDataSet read FcdsRespCentRespon write SetcdsRespCentRespon;


      //-------------------------------------------------------------------------
      // Métodos
      //-------------------------------------------------------------------------
      constructor Create;  override;
      destructor  Destroy; override;

      //-------------------------------------------------------------------------
      // Metodos da Regra de Negócio
      //-------------------------------------------------------------------------

      // Início  31/07/2003 - resolução da pendência 14560
      // este método lista os centros de responsabilidade atribuídos ao usuário
      function ListaCentResponAtrib_Usu(idUsuario, idEmpresa  : Double;
                                                  TipoCentRespon        : TTipoCentRespon = tcrAmbos;
                                                  IDPlanCRespon         : Extended = 0 //  pendência 15365 - 20/05/2004
                                                  ): OleVariant;
      // Fim  31/07/2003 - resolução da pendência 14560


      function  ListaCentRespon(IdPessoa        : Extended = 0;
                                IdCentRespon    : String   = '';
                                iOrdem          : Integer  = 0;
                                sSintetAnalit   : String   = '';
                                //  pendência 14802 - 29/10/2003
                                IDPlanCRespon   : Extended = 0;
                                // FIM  pendência 14802 - 29/10/2003
                                //inicio - pendência 15366
                                bListaCRpadrao  : Boolean = true;
                                //inicio - pendência 15366
                                //  28/06/04 15367
                                bSoAtivos       : Boolean = false
                               ): OleVariant;

      function  ListaCentResponXUsu(idUsuario, idEmpresa : Double;
                                    TipoCentRespon       : TTipoCentRespon;
                                    TipoOrdemCentRespon  : TTipoOrdemCentRespon
                                   ): OleVariant;

      // pendência 15365 - 20/05/2004
      function GetCentResponPadrao(idEmpresa, idPlanCRespon: Extended): Olevariant; overload;     //edilaine SIG115594

      function GetCentResponPadrao(idEmpresa : Extended): Olevariant; overload;                   //edilaine SIG115594

      function  Excluir: Boolean;
      function  Gravar: Boolean;
      // P 21368    03/02/06
      Function CentResponExclui(pCodCentRespon: Integer; IDEmpresa : Double) : Boolean;
      function RecuperaRespPorCentRespon( iIdEmpresa : integer; sCodCentroRespon: string ) : OLEVariant;
      function ListaCentroResponOrigem(CodCentroRespon : String): OleVariant;

   end;



implementation
{$IFNDEF VERSAO0505}
uses
   uCmTypes;
{$ENDIF}



function TCtrlCentRespon.Gravar: Boolean;
var
   msg: String;
   _CdsRespCentRespon: TClientDataset;
begin
   if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.GravarCentRespon(Fcds.Data);

     if Not Result then
        MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

      _CdsRespCentRespon := TClientDataset.Create(nil);
     Try

         _CdsRespCentRespon.Data := FCdsRespCentRespon.Data;

        StartTransaction;
        Result := ApplyCds(fcds, _DbCentRespon, [], []);
        Msg    := _DbCentRespon.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);

         Result := ApplyCds(_CdsRespCentRespon, _DbRespCentRespon, [_DbCentRespon.IdEmpresa, _DbCentRespon.CodCentroRespon],
                             [_DbRespCentRespon.IdEmpresa, _DbRespCentRespon.CodCentroRespon]);
         Msg    := _DbRespCentRespon.MessageInfo;

         if Not Result then
            Raise Exception.Create(Msg);

        Commit;
     Except
        On E:Exception Do
        begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        end;
     end;
      _CdsRespCentRespon.Free;
  end;
end;



constructor TCtrlCentRespon.Create;
begin
   inherited;

   _DbCentRespon := TDbCentRespon.Create(Self);
   FCds := TClientDataSet.Create(nil);

   // Pendência 15166
  _DbRespCentRespon := TDbRespCentRespon.Create( Self );
end;



destructor TCtrlCentRespon.Destroy;
begin
   if Fcds.Active then Fcds.Close;

   Fcds := nil;
   Fcds.Free;

   _DbCentRespon.Free;

   // Pendência 15166
   _DbRespCentRespon.Free;

   inherited;
end;



procedure TCtrlCentRespon.DoChangeDataBase;
begin
   inherited;
   _DbCentRespon.DataBaseName := DatabaseName;

   // Pendência 15166
   _DbRespCentRespon.DataBaseName := DatabaseName;
end;



function TCtrlCentRespon.ListaCentRespon(IdPessoa        : Extended = 0;
                                         IdCentRespon    : String   = '';
                                         iOrdem          : Integer  = 0;
                                         sSintetAnalit   : String   = '';
                                         //  pendência 14802 - 29/10/2003
                                         IDPlanCRespon   : Extended = 0;
                                         // FIM  pendência 14802 - 29/10/2003
                                         //inicio  pendência 15366
                                         bListaCRpadrao  : Boolean = true;
                                         //inicio  pendência 15366
                                         // 28/06/04 15367
                                         bSoAtivos       : Boolean = false
                                        ): OleVariant;
var
   sSQL: String;
begin
   sSQL :=
   'SELECT '                           + #13 +
   '   C.IDPLANCRESPON, '              + #13 +
   '   C.CODCENTRORESPON, '            + #13 +
   '   C.CODEXTERNO, '                 + #13 +
   '   C.IDEMPRESA, '                  + #13 +
   '   C.CODCENTROCUSTO, '             + #13 +
   '   C.IDPESSOA, '                   + #13 +
   '   C.RESPONSAVEL, '                + #13 +
   '   C.NOME, '                       + #13 +
   '   C.IDUSUARIOINCLUSAO, '          + #13 +
   '   C.IDUSUARIO, '                  + #13 +
   '   C.ATIVO, '                      + #13 +
   '   C.ANALITICOSINTET, '            + #13 +

   '   PCR.DESCPLANCRESPON, '          + #13 +
   '   P.NOME AS NOMEPESSOA, '         + #13 +
   '   U.NOMEUSUARIO, '                + #13 +
   '   E.NOMEEMPRESA, '                + #13 +
   '   T.NOME AS NOMECENTROCUSTO, '     + #13 +
   '   C.AVALIAFORNECEDOR '            + #13 +
   'FROM '                             + #13 +
   '   PESSOA         P, '             + #13 +
   '   PESSOA         Q, '             + #13 +
   '   CENTRESPON     C, '             + #13 +
   '   CENTCUST       T, '             + #13 +
   '   USUARIOSISTEMA U, '             + #13 +
   '   PLANCENTRESPON PCR, '           + #13 +
   '   EMPRESAPROP    E '              + #13 +
   'WHERE '                            + #13;

   if idPessoa <> 0 then sSQL := sSQL +
   '   C.IDPESSOA          = ' + FloatToStr(IdPessoa)                + ' AND ' + #13;

   if IDPlanCRespon <> 0 then sSQL := sSQL +
   '   C.IDPLANCRESPON     = ' + FormatFloat('#0', IDPlanCRespon)    + ' AND ' + #13;

   if sSintetAnalit <> '' then sSQL := sSQL +
   '   C.ANALITICOSINTET   = ' + QuotedStr(UpperCase(sSintetAnalit)) + ' AND ' + #13;

   if idCentRespon <> '' then sSQL := sSQL +
   '   C.CODCENTRORESPON   = ' + QuotedStr(IdCentRespon)             + ' AND ' + #13;
   if not bListaCRpadrao then
     sSQL := sSQL +  '   C.CODCENTRORESPON  <> ''9999999999'' AND ' + #13;

   // somente lista os ativos de/para
   if bSoAtivos then
     sSQL := sSQL +  '   C.ATIVO = ''S''  AND ' + #13;

   sSQL := sSQL +
   '   C.IDPESSOA          = E.IDPESSOA(+) AND '         + #13 +
   '   C.IDPLANCRESPON     = PCR.IDPLANCRESPON(+) AND '  + #13 +
   '   C.IDUSUARIOINCLUSAO = P.IDPESSOA(+) AND '         + #13 +
   '   C.IDUSUARIO         = U.IDUSUARIO(+) AND '        + #13 +
   '   C.IDEMPRESA         = Q.IDPESSOA(+) AND '         + #13 +
   '   C.IDEMPRESA         = T.IDEMPRESA(+) AND '        + #13 +
   '   C.CODCENTROCUSTO    = T.CODCENTROCUSTO(+) '       + #13;

   case iOrdem Of
        0: sSQL := sSQL + 'ORDER BY ' + #13 + '   C.NOME';

        1: sSQL := sSQL + 'ORDER BY ' + #13 + '   C.CODEXTERNO';

   end;

   Result := GetDataPacket(sSQL);
end;



//Início  31/07/2003 - resolução da pendência 14560
// este método lista os centros de responsabilidade atribuídos ao usuário
function TCtrlCentRespon.ListaCentResponAtrib_Usu(idUsuario, idEmpresa  : Double;
                                                  TipoCentRespon        : TTipoCentRespon = tcrAmbos;
                                                  IDPlanCRespon         : Extended = 0 // pendência 15365 - 20/05/2004
                                                  ): OleVariant;
var
   sSQl : String;
begin
  sSql := ' SELECT                                            '+
          '   C.CODCENTRORESPON,                              '+
          '   C.NOME,                                         '+
          '   C.ANALITICOSINTET,                              '+
          '   C.IDPESSOA,                                     '+
          '   C.ATIVO,                                        '+
          '   C.CODEXTERNO,                                   '+
          '   C.IDPLANCRESPON,                                '+
          // 28/06/04 15367 de/para
          '   C.CODCENTROCUSTO                                '+
          ' FROM CENTRESPON C, PESSOAXCRESP X                 '+
          ' WHERE (C.IDPESSOA = + ' + FloatToStr(IdEmpresa) + ') '+
          '   AND (C.ATIVO = ''S'')                         ';

   case TipoCentRespon of
      tcrSoSintetica: sSql := sSql + ' AND (C.ANALITICOSINTET = ''S'') ';
      tcrSoAnalitica: sSql := sSql + ' AND (C.ANALITICOSINTET = ''A'') ';
   end;

// início pendência 15365 - 20/05/2004
   if IDPlanCRespon <> 0 then sSQL := sSQL +
     ' AND C.IDPLANCRESPON     = ' + FormatFloat('#0', IDPlanCRespon)  + #13;
// fim - pendência 15365 - 20/05/2004

   sSql := sSql + '   AND (X.IDPESSOAACESSO = '  + FloatToStr(IdUsuario) + ') '+
                  '   AND (C.IDPESSOA = X.IDPESSOA)                 '+
                  '   AND (C.CODCENTRORESPON = X.CODCENTRORESPON)   '+
                  ' ORDER BY NOME                                     ';

   Result := GetDataPacket(sSql);
end;
//Fim  31/07/2003 - resolução da pendência 14560




function TCtrlCentRespon.ListaCentResponXUsu(idUsuario, idEmpresa: Double;
               TipoCentRespon: TTipoCentRespon;
               TipoOrdemCentRespon: TTipoOrdemCentRespon): OleVariant;

var
   sSQl : String;
begin
   //  P:22534 - 06/06/2006
   sSql := 'SELECT U.CODCENTRORESPON,  U.CODEXTERNO, U.NOME, U.ANALITICOSINTET ' +

             // P:22534 - 06/06/2006
             'FROM (SELECT  C.CODCENTRORESPON, C.CODEXTERNO, C.NOME, C.ANALITICOSINTET ' +

                      'FROM CENTRESPON C ' +
                     'WHERE (C.IDPESSOA = ' + FloatToStr(IdEmpresa) + ') ' +
                       'AND (C.ATIVO = ''S'') ';

   case TipoCentRespon of
      tcrSoSintetica: sSql := sSql + 'AND (C.ANALITICOSINTET = ''S'') ';
      tcrSoAnalitica: sSql := sSql + 'AND (C.ANALITICOSINTET = ''A'') ';
   end;

   sSql := sSql + 'AND (NOT EXISTS (SELECT X.IDPESSOAACESSO FROM PESSOAXCRESP X ' +
                                      'WHERE (X.CODCENTRORESPON = C.CODCENTRORESPON) ' +
                                        'AND (X.IDPESSOA = C.IDPESSOA) ' +
                                        'AND (X.IDPESSOAACESSO = ' + FloatToStr(IdUsuario) + '))) ' +
           'UNION ALL ' +

           //  P:22534 - 06/06/2006
           'SELECT DISTINCT C.CODCENTRORESPON, C.CODEXTERNO, C.NOME, C.ANALITICOSINTET ' +

             'FROM CENTRESPON C, PESSOAXCRESP X ' +
            'WHERE (C.IDPESSOA = ' + FloatToStr(IdEmpresa) + ') ' +
              'AND (C.ATIVO = ''S'') ';

   case TipoCentRespon of
      tcrSoSintetica: sSql := sSql + 'AND (C.ANALITICOSINTET = ''S'') ';
      tcrSoAnalitica: sSql := sSql + 'AND (C.ANALITICOSINTET = ''A'') ';
   end;

   sSql := sSql + 'AND (X.IDPESSOAACESSO = ' + FloatToStr(IdUsuario) + ') ' +
                  'AND (C.IDPESSOA = X.IDPESSOA) ' +
                  'AND (C.CODCENTRORESPON = X.CODCENTRORESPON) ' +
                  ') U ';

   case TipoOrdemCentRespon of
      tocrCodigo: sSql := sSql + 'ORDER BY U.CODCENTRORESPON';
      tocrNome  : sSql := sSql + 'ORDER BY U.NOME';
   end;
   Result := GetDataPacket(sSql);
end;



procedure TCtrlCentRespon.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;


// início - pendência 15365 - 20/05/2004
function TCtrlCentRespon.GetCentResponPadrao(idEmpresa, idPlanCRespon: Extended): Olevariant;
begin
  result := getDataPacket(' SELECT                 '+
                          '   CRE.CODCENTRORESPON, '+
                          '   CRE.NOME,            '+
                          '   CRE.ANALITICOSINTET, '+
                          '   CRE.CODCENTROCUSTO,  '+
                          '   CRE.IDPESSOA,        '+
                          '   CRE.ATIVO,           '+
                          '   CRE.CODEXTERNO,      '+
                          '   CRE.IDPLANCRESPON    '+
                          ' FROM CENTRESPON CRE    '+
                          ' WHERE CRE.IDPESSOA        = '+ FormatFloat('#0', idEmpresa)+
                          '   AND CRE.ATIVO           = ''S'' '+
                          '   AND CRE.IDPLANCRESPON   = '+ FormatFloat('#0', idPlanCRespon)+
                          '   AND CRE.CODCENTRORESPON = ''9999999999'' '+
                          ' ORDER BY CRE.CODEXTERNO, CRE.NOME ');
end;

// fim pendência 15365 - 20/05/2004

//edilaine SIG115594 : inicio
function TCtrlCentRespon.GetCentResponPadrao(idEmpresa : Extended): Olevariant;
begin
  result := getDataPacket(' SELECT                 '+
                          '   CRE.CODCENTRORESPON, '+
                          '   CRE.NOME,            '+
                          '   CRE.ANALITICOSINTET, '+
                          '   CRE.CODCENTROCUSTO,  '+
                          '   CRE.IDPESSOA,        '+
                          '   CRE.ATIVO,           '+
                          '   CRE.CODEXTERNO,      '+
                          '   CRE.IDPLANCRESPON    '+
                          ' FROM CENTRESPON CRE    '+
                          ' WHERE CRE.IDPESSOA        = '+ FormatFloat('#0', idEmpresa)+
                          '   AND CRE.ATIVO           = ''S'' '+
                          '   AND CRE.ANALITICOSINTET = ''A'' '+ 
                          ' ORDER BY CRE.CODEXTERNO, CRE.NOME ');
end;
//edilaine SIG115594 : fim



function TCtrlCentRespon.RecuperaRespPorCentRespon(iIdEmpresa: integer; sCodCentroRespon: string): OLEVariant;
var
  sSQL : string;
begin
  sSQL := ' select R.IDRESPCENTRESPON,             ' +
          '        R.IDPESSOA,                     ' +
          '        R.IDEMPRESA,                    ' +
          '        R.CODCENTRORESPON,              ' +
          '        R.DTINICIOVIG,                  ' +
          '        R.DTFIMVIG,                     ' +
          '        P.NOME                          ' +
          ' from   RESPCENTRESPON R,               ' +
          '        PESSOA         P                ' +
          ' where  R.IDPESSOA        = P.IDPESSOA  ' +
          '   and  R.IDEMPRESA       = ' + IntToStr( iIdEmpresa       ) +
          '   and  R.CODCENTRORESPON = ' + QuotedStr( sCodCentroRespon );
  Result := GetDataPacket( sSQL );
end;

procedure TCtrlCentRespon.SetcdsRespCentRespon(
  const Value: TClientDataSet);
begin
  FcdsRespCentRespon := Value;
end;

function TCtrlCentRespon.Excluir: Boolean;
var
  Msg: String;
begin
  if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.ExcluirCentroRespon(Fcds.Data, FcdsRespCentRespon.Data);

     if Not Result then
        MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
     Try
        StartTransaction;

        Result := ApplyCds(FcdsRespCentRespon, _DbRespCentRespon, [], []);
        Msg    := _DbRespCentRespon.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);

        Result := ApplyCds(fcds, _DbCentRespon, [], []);
        Msg    := _DbCentRespon.MessageInfo;

        if Not Result then
           Raise Exception.Create(Msg);

        Commit;
     except
        On E:Exception Do
        begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        end;
     end;
  end;
end;


// P 21368    03/02/06
Function TCtrlCentRespon.CentResponExclui(pCodCentRespon: Integer; IDEmpresa : Double) : Boolean;
Var
  sSqlLocal : string;
Begin

  If (ConnectionSide = cnsClient) Then
  Begin
    Result := Connection.AppServer.CentResponExclui(pCodCentRespon);
    If (Not Result) Then
    Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End
  Else
  Begin
      sSqlLocal := 'DELETE FROM CENTRESPON  ' +
                   'WHERE CODCENTRORESPON = ' + InttoStr(pCODCENTRESPON)  +
                   ' AND IDEMPRESA = ' +  FloatToStr(IdEmpresa);
      Result := ExecSql(sSqlLocal, True);
  End;
end;

function TCtrlCentRespon.ListaCentroResponOrigem(CodCentroRespon: String): OleVariant;
var
  sSQL : string;
begin
  sSQL := ' select origem.codexterno codigo_ext, origem.nome desc_cc_origem, ' +
          '        h.* ' +
          '   from cm.hstcentrespon h ' +
          '   join cm.centrespon origem on trim(origem.codcentrorespon) = trim(h.codcentrorespon_origem) ' +
          '  where trim(h.codcentrorespon) =  ' + QuotedStr(CodCentroRespon);

  Result := GetDataPacket(sSQL);
end;

end.
