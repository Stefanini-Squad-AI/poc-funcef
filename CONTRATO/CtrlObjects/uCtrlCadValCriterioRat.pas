// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : de 19/08/2003 a 28/08/2003
Autor     : André Pontes
Pendencia : 14398
Descrição : Implementação da replicação dos valores de rateio de um exercício para outro
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{Andre Tavares - pendência 14928 - 13/10/2003           }
{                                                       }
{                                                       }
{*******************************************************}
unit uCtrlCadValCriterioRat;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, Classes, sysutils, wwQuery, provider, uMidasUtil,
   uDbValorCriRatOrc, uCMTypes;


type
   TCtrlCadValCriterioRat = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private
      _dbValorCriRatOrc  : TdbValorCriRatOrc;

      FIDEmpresa         : Integer;
      FCdsValorCriRatOrc : TClientDataSet;
      FUltimoRegistro    : LongInt;

      procedure SetCdsValorCriRatOrc(const Value: TClientDataSet);


   public

      constructor Create;  override;
      destructor  Destroy; override;

      function ListaCriterio : OleVariant;
      function ListaExercicio( pIdPessoa,
                               pIdCriterio : Integer ) : OleVariant;
      function ListaPeriodo( pIdPessoa,
                             pIdCriterio,
                             pExercicio   : Integer ) : OleVariant;

      function ListaCentroDeCusto: OleVariant;

  //    function AbrePeriodo( pExercicio: integer ): Boolean;

      function Procurar(pIdValorCriRatOrc: Double ): OleVariant;

      function AplicaOperacaoValorCriRatOrc : Boolean;

      function GravarValCriterio( pIdValorCriRatOrc         : Double;
                                  pSistemaIdEmpresa         : Integer;
                                  pdblcExercicioLookUpValue,
                                  pdblcPeriodoLookUpValue   : String;
                                  pSistemaIdPessoa          : Integer;
                                  pdblcCentCustLookUpValue,
                                  pdblcCriterioLookUpValue  : String;
                                  pdbrValorBaseValue        : Double ) : Boolean;

      Procedure VerificaDados( var pMensagem                 : String;
                                   pdblcExercicioLookUpValue,
                                   pdblcPeriodoLookUpValue   : Integer;
                                   pdblcCentCustLookUpValue  : String;
                                   pdblcCriterioLookUpValue,
                                   pdbrValorBaseValue        : Double );


      property  IdEmpresa         : Integer        read FIdEmpresa         write FIdEmpresa;
      property  UltimoRegistro    : LongInt        read FUltimoRegistro    write FUltimoRegistro;
      property  CdsValorCriRatOrc : TClientDataSet read FCdsValorCriRatOrc write SetCdsValorCriRatOrc;

      // André Pontes - pendência 14398 - 28/08/2003
      function  ListaCriterioPorExercicio(const IDCriterio : Integer;
                                          const iExercicio : Integer
                                         ): OleVariant;
      function  ExcluiCriterioPorExercicio(const IDCriterio : Integer;
                                           const iExercicio : Integer
                                          ): Boolean;
      function  ReplicaCriterio(const IDCriterio    : Integer;
                                const iExercicioOri : Integer;
                                const iExercicioFim : Integer
                               ): Boolean;
      // FIM André Pontes - pendência 14398 - 28/08/2003

   end;



implementation
{ TCtrlCadValCriterioRat }



procedure TCtrlCadValCriterioRat.DoChangeDataBase;
begin
   inherited;
   _dbValorCriRatOrc.DatabaseName := DataBaseName;
end;



procedure TCtrlCadValCriterioRat.OnCreateAppServer;
begin
   inherited;
   FCdsValorCriRatOrc := TClientDataSet.Create(nil);
end;



constructor TCtrlCadValCriterioRat.Create;
begin
   inherited;
   _DbValorCriRatOrc := TDbValorCriRatOrc.Create( Self );
end;



destructor TCtrlCadValCriterioRat.Destroy;
begin
   inherited;
   _DbValorCriRatOrc.Free;

   if isAppServer then FreeCds([FCdsValorCriRatOrc]);
end;



procedure TCtrlCadValCriterioRat.SetCdsValorCriRatOrc(const Value: TClientDataSet);
begin
   FCdsValorCriRatOrc := Value;
end;



function TCtrlCadValCriterioRat.ListaCriterio : OleVariant;
var
   SqlLocal : TStringList;
begin
   SqlLocal := TStringList.Create;

   try
     SqlLocal.Add( 'SELECT DISTINCT' );
     SqlLocal.Add( '  IDCRITERIORATORC,' );
     SqlLocal.Add( '  DESCRICAO' );
     SqlLocal.Add( 'FROM' );
     SqlLocal.Add( '  CRITERIORATORC' );
     SqlLocal.Add( 'WHERE' );
     SqlLocal.Add( '  ( IDPESSOA   = ' + IntToStr( IdEmpresa ) + ' ) AND' );
     SqlLocal.Add( '  ( TIPORATEIO = ''M'')' );
     SqlLocal.Add( 'ORDER BY' );
     SqlLocal.Add( '  DESCRICAO' );

     Result := GetDataPacket( SqlLocal.Text );

   finally
      SqlLocal.Free;
   end;
end;



function TCtrlCadValCriterioRat.ListaExercicio(pIdPessoa, pIdCriterio : Integer): OleVariant;
var
  SqlLocal : TStringList;
begin
   SqlLocal := TStringList.Create;

   try
{
      SqlLocal.Add( 'SELECT DISTINCT' );
      SqlLocal.Add( '  EXERCICIO' );
      SqlLocal.Add( 'FROM' );
      SqlLocal.Add( '  CRITERIORATORC CO,' );
      SqlLocal.Add( '  PERIODOORCAMEN PO' );
      SqlLocal.Add( 'WHERE' );
      SqlLocal.Add( '  ( CO.IDPESSOA         = ' + IntToStr( pIdPessoa ) + ' ) AND' );
      SqlLocal.Add( '  ( CO.IDCRITERIORATORC = ' + IntToStr( pIdCriterio ) + ' ) AND' );
      SqlLocal.Add( '  ( PO.IDPESSOA         = PO.IDPESSOA )     AND' );
      SqlLocal.Add( '  ( PO.EXERCICIO        = CO.PEREXERCICIO ) AND' );
      SqlLocal.Add( '  ( ( PO.FLGBLOQUEADO = ''N'' ) OR ( PO.FLGBLOQUEADO IS NULL ) )' );
      SqlLocal.Add( 'ORDER BY' );
      SqlLocal.Add( '  EXERCICIO' );
}
      SqlLocal.Add( 'SELECT DISTINCT' );
      SqlLocal.Add( '  EXERCICIO' );
      SqlLocal.Add( 'FROM' );
      SqlLocal.Add( '  PERIODOORCAMEN PO' );
      SqlLocal.Add( 'WHERE' );
      SqlLocal.Add( '  ( PO.IDPESSOA       = ' + IntToStr( pIdPessoa ) + ' ) AND' );
      SqlLocal.Add( '  ( ( PO.FLGBLOQUEADO = ''N'' ) OR ( PO.FLGBLOQUEADO IS NULL ) )' );
      SqlLocal.Add( 'ORDER BY' );
      SqlLocal.Add( '  EXERCICIO' );

      Result := GetDataPacket( SqlLocal.Text );

   finally
      SqlLocal.Free;
   end;
end;






function TCtrlCadValCriterioRat.ListaCentroDeCusto : OleVariant;
var
   SqlLocal : TStringList;
begin
   SqlLocal := TStringList.Create;

   try
      SqlLocal.Add( 'SELECT' );
      SqlLocal.Add( '  CODCENTROCUSTO,' );
      SqlLocal.Add( '  NOME,' );
      SqlLocal.Add( '  IDEMPRESA' );
      SqlLocal.Add( 'FROM' );
      SqlLocal.Add( '  CENTCUST' );
      SqlLocal.Add( 'WHERE' );
      SqlLocal.Add( '  ( IDEMPRESA = ' + IntToStr( IdEmpresa ) + ' ) AND' );
      SqlLocal.Add( '  ( ATIVO     = ''S'') ' );
      SqlLocal.Add( 'ORDER BY' );
      SqlLocal.Add( '  NOME' );

      Result := GetDataPacket( SqlLocal.Text );

   finally
      SqlLocal.Free;
   end;
end;



{
function TCtrlCadValCriterioRat.AbrePeriodo( pExercicio : integer ) : Boolean;
var
  SqlLocal : TStringList;

begin

  SqlLocal := TStringList.Create;

  try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  PERIODO,' );
    SqlLocal.Add( '  DATAINIPERIODO,' );
    SqlLocal.Add( '  DATAFIMPERIODO,' );
    SqlLocal.Add( '  FLGBLOQUEADO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  PERIODOORCAMEN' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  EXERCICIO = ' + IntToStr( pExercicio ) + ' ) AND' );
    SqlLocal.Add( '  IDPESSOA  = ' + IntToStr( IdEmpresa ) + ' )' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  PERIODO' );

    Result := GetDataPacket( SqlLocal.Text );

  finally

    SqlLocal.Free;
  end;
end;
}



function TCtrlCadValCriterioRat.Procurar( pIdValorCriRatOrc : Double ) : OleVariant;
begin
   _dbValorCriRatOrc.IdValorCriRatOrc.AsFloat := pIdValorCriRatOrc;
   Result := GetDataPacket( _dbValorCriRatOrc.SSqlSelect );
end;



function TCtrlCadValCriterioRat.AplicaOperacaoValorCriRatOrc : Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoValorCriRatOrc( FCdsValorCriRatOrc.Data );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      MessageInfo := '';

      try
         StartTransaction;
         Result := ApplyCDS(FCdsValorCriRatOrc,_DbValorCriRatOrc,[],[]);

         if not(Result) then
         begin
            MessageInfo := _DbValorCriRatOrc.MessageInfo;
            Abort;
         end
         else
         begin
            Commit;
         end;

         UltimoRegistro := _DbValorCriRatOrc.Idvalorcriratorc.AsInteger;

      except
         on E:Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         end;
      end;
   end;
end;




procedure TCtrlCadValCriterioRat.VerificaDados(var pMensagem                 : String;
                                                   pdblcExercicioLookUpValue,
                                                   pdblcPeriodoLookUpValue   : Integer;
                                                   pdblcCentCustLookUpValue  : String;
                                                   pdblcCriterioLookUpValue,
                                                   pdbrValorBaseValue        : Double
                                              );
begin
   with CdsValorCriRatOrc do
   begin
      if      ( pdblcExercicioLookUpValue = 0 )         then pMensagem := 'Selecione algum EXERCÍCIO'
      else if ( pdblcPeriodoLookUpValue = 0 )           then pMensagem := 'Selecione algum PERÍODO'
      else if ( Trim( pdblcCentCustLookUpValue ) = '' ) then pMensagem := 'Selecione algum CENTRO DE CUSTO'
      else if ( pdblcCriterioLookUpValue = 0 )          then pMensagem := 'Selecione algum CRITÉRIO'
      else if ( pdbrValorBaseValue < 0.01 )             then pMensagem := 'Informe algum VALOR BASE';
   end;
end;




function  TCtrlCadValCriterioRat.GravarValCriterio(pIdValorCriRatOrc         : Double;
                                                   pSistemaIdEmpresa         : Integer;
                                                   pdblcExercicioLookUpValue,
                                                   pdblcPeriodoLookUpValue   : String;
                                                   pSistemaIdPessoa          : Integer;
                                                   pdblcCentCustLookUpValue,
                                                   pdblcCriterioLookUpValue  : String;
                                                   pdbrValorBaseValue        : Double
                                                  ): Boolean;
var
   SqlLocal : TStringList;
begin
   Result := False;

   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravarValCriterio(pIdValorCriRatOrc,
                                                       pSistemaIdEmpresa,
                                                       pdblcExercicioLookUpValue,
                                                       pdblcPeriodoLookUpValue,
                                                       pSistemaIdPessoa,
                                                       pdblcCentCustLookUpValue,
                                                       pdblcCriterioLookUpValue,
                                                       pdbrValorBaseValue
                                                      );
      MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      MessageInfo := '';
      SqlLocal := TStringList.Create;
      try
         StartTransaction;

//inicio - Andre Tavares - pendência 14928 - 13/10/2003
{         SqlLocal.Add( 'UPDATE VALORCRIRATORC' );
         SqlLocal.Add( 'SET' );
         SqlLocal.Add( '  VLRCRIRATORC      = ' + FloatToStr( pdbrValorBaseValue ) + ',' );
         SqlLocal.Add( '  IDEMPRESA         = ' + IntToStr(   pSistemaIdEmpresa  ) + ',' );
         SqlLocal.Add( '  CODCENTROCUSTO    = ' + QuotedStr( pdblcCentCustLookUpValue )  );
         SqlLocal.Add( 'WHERE' );
         SqlLocal.Add( '  IDPESSOA          = ' + IntToStr(   pSistemaIdPessoa   ) + ' AND' );
         SqlLocal.Add( '  IDCRITERIORATORC  = ' + pdblcCriterioLookUpValue         + ' AND' );
         SqlLocal.Add( '  EXERCICIO         = ' + pdblcExercicioLookUpValue        + ' AND' );
         SqlLocal.Add( '  PERIODO           = ' + pdblcPeriodoLookUpValue );
         Result := ExecSql( SqlLocal.Text, True );}
//fim - Andre Tavares - pendência 14928 - 13/10/2003


         if not(Result) then
         begin
            // Não existe o registro vamos incluir
            SqlLocal.Clear;
            SqlLocal.Add( 'INSERT INTO' );
            SqlLocal.Add( '  VALORCRIRATORC' );
            SqlLocal.Add( '  ( VLRCRIRATORC, IDEMPRESA,        CODCENTROCUSTO,' );
            SqlLocal.Add( '    IDPESSOA,     IDCRITERIORATORC, EXERCICIO,' );
            SqlLocal.Add( '    PERIODO,      IDVALORCRIRATORC )' );
            SqlLocal.Add( '  VALUES' );
            SqlLocal.Add( '  ( ' + FloatToStr( pdbrValorBaseValue ) + ',' );
            SqlLocal.Add( '    ' + IntToStr(   pSistemaIdEmpresa  ) + ',' );
            SqlLocal.Add( '    ' + QuotedStr( pdblcCentCustLookUpValue ) + ',' );
            SqlLocal.Add( '    ' + IntToStr(   pSistemaIdPessoa   ) + ',' );
            SqlLocal.Add( '    ' + pdblcCriterioLookUpValue         + ',' );
            SqlLocal.Add( '    ' + pdblcExercicioLookUpValue        + ',' );
            SqlLocal.Add( '    ' + pdblcPeriodoLookUpValue          + ',' );
            SqlLocal.Add( '    ' + FloatToStr( GetSequence( 'VALORCRIRATORC' ) ) + ' )');
            Result := ExecSql( SqlLocal.Text, True );
          end;
          Commit;
          MessageInfo := 'Dados gravados';
      except
         on E: Exception do
         begin
            RollBack;
            MessageInfo := E.Message;
         end;
      end;
      SqlLocal.Free;
   end;
end;




function TCtrlCadValCriterioRat.ListaPeriodo(pIdPessoa, pIdCriterio, pExercicio: Integer): OleVariant;
var
   SqlLocal : TStringList;
begin
   SqlLocal := TStringList.Create;

   try
      SqlLocal.Add( 'SELECT DISTINCT' );
      SqlLocal.Add( '  PO.PERIODO,' );
      SqlLocal.Add( '  PO.DATAINIPERIODO,' );
      SqlLocal.Add( '  PO.DATAFIMPERIODO,' );
      SqlLocal.Add( '  PO.NOMEPERIODO' );
      SqlLocal.Add( 'FROM' );
      SqlLocal.Add( '  PERIODOORCAMEN PO' );
      SqlLocal.Add( 'WHERE' );
      SqlLocal.Add( '  ( PO.IDPESSOA      = ' + IntToStr( pIdPessoa ) + ' )  AND' );
      SqlLocal.Add( '  ( PO.EXERCICIO     = ' + IntToStr( pExercicio ) + ' ) AND' );
      SqlLocal.Add( '  ( (PO.FLGBLOQUEADO = ''N'') OR ( PO.FLGBLOQUEADO IS NULL ) )' );
      SqlLocal.Add( 'ORDER BY' );
      SqlLocal.Add( '  PO.PERIODO' );

      Result := GetDataPacket( SqlLocal.Text );

   finally
      SqlLocal.Free;
   end;
end;




function TCtrlCadValCriterioRat.ListaCriterioPorExercicio(const IDCriterio : Integer;
                                                          const iExercicio : Integer
                                                         ): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                + #13 +
   '  IDVALORCRIRATORC, '                                   + #13 +
   '  IDPESSOA, '                                           + #13 +
   '  EXERCICIO, '                                          + #13 +
   '  PERIODO, '                                            + #13 +
   '  IDEMPRESA, '                                          + #13 +
   '  CODCENTROCUSTO, '                                     + #13 +
   '  IDCRITERIORATORC, '                                   + #13 +
   '  VLRCRIRATORC '                                        + #13 +
   'FROM '                                                  + #13 +
   '   VALORCRIRATORC VLR '                                 + #13 +
   'WHERE '                                                 + #13 +
   '       VLR.IDCRITERIORATORC = ' + IntToStr(IDCriterio)  + #13 +
   '   AND VLR.EXERCICIO        = ' + IntToStr(iExercicio);

   Result := GetDataPacket(sSQL);
end;



function TCtrlCadValCriterioRat.ExcluiCriterioPorExercicio(const IDCriterio : Integer;
                                                           const iExercicio : Integer
                                                          ): Boolean;
var
   sSQL : String;
begin
   Result := True;

   sSQL :=
   'DELETE '                                                + #13 +
   'FROM '                                                  + #13 +
   '   VALORCRIRATORC VLR '                                 + #13 +
   'WHERE '                                                 + #13 +
   '       VLR.IDCRITERIORATORC = ' + IntToStr(IDCriterio)  + #13 +
   '   AND VLR.EXERCICIO        = ' + IntToStr(iExercicio);

   try
      ExecSQL(sSQL);
   except
      Result := False;
   end;
end;



function TCtrlCadValCriterioRat.ReplicaCriterio(const IDCriterio    : Integer;
                                                const iExercicioOri : Integer;
                                                const iExercicioFim : Integer
                                               ): Boolean;
var
   sSQL : String;
begin
   Result := True;

   sSQL :=
   'INSERT INTO VALORCRIRATORC '             + #13 +
   '  ( '                                    + #13 +
   '  IDVALORCRIRATORC, '                    + #13 +
   '  IDPESSOA, '                            + #13 +
   '  EXERCICIO, '                           + #13 +
   '  PERIODO, '                             + #13 +
   '  IDEMPRESA, '                           + #13 +
   '  CODCENTROCUSTO, '                      + #13 +
   '  IDCRITERIORATORC, '                    + #13 +
   '  VLRCRIRATORC '                         + #13 +
   '  ) '                                    + #13 +
   '  ( '                                    + #13 +
   '  SELECT '                               + #13 +
   '     SEQVALORCRIRATORC.NEXTVAL, '        + #13 +
   '     IDPESSOA, '                         + #13 +
   '     ' + IntToStr(iExercicioFim) + ', '  + #13 +
   '     PERIODO, '                          + #13 +
   '     IDEMPRESA, '                        + #13 +
   '     CODCENTROCUSTO, '                   + #13 +
   '     IDCRITERIORATORC, '                 + #13 +
   '     VLRCRIRATORC '                      + #13 +
   '   FROM '                                + #13 +
   '      VALORCRIRATORC VLR '               + #13 +
   '   WHERE '                               + #13 +
   '          VLR.IDCRITERIORATORC = '       + IntToStr(IDCriterio)     + #13 +
   '      AND VLR.EXERCICIO        = '       + IntToStr(iExercicioOri)  + #13 +
   '   ) ';

   try
      ExecSQL(sSQL);
   except
      Result := False;
   end;
end;



end.
