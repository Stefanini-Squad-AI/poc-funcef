// Alterações:
{ --------------------------------------------------------------------------------------------------
Autor.........: Ricardo de Freitas Araújo Silva
Data..........: 18/08/2011
Nº SOL........: 159240
Nº KINTANA....: 1337878
Rotina........: PesquisaCriterio
Descrição.....: Adicionado parâmetros de Programa de Tipo de Despesa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 150140
Nº KINTANA..: 1087554
Data........: 12/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do Plano e Patro no Critério de Rateio
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Data      : 26.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Descrição : Alteradas as funções PesquisaCriterio e CriterioEncontrado devido a criação
            do field EXERCICIOFIM.
------------------------------------------------------------------------------------------
Rotina    : PesquisaCriterio, GravaCriterio e CriterioEncontrado
Data      : 25.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendencia : (???)
Descrição : Implementado segundo o padrão devido a mudança de interface da tela de rateio.
-----------------------------------------------------------------------------------------
Rotina    : ListaCentroDeCusto
Data      : 09.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendencia : 20921
Descrição : Seleção de Centro de Custos Analíticos e 'De/Para'. Acrescentei o CODEXTERNO.
{--------------------------------------------------------------------------------------------------
Rotina    : ListaCentroDeCusto
Data      : 31/10/2005
Autor     : Rodolpho da Silva
Pendencia : 18002
Descrição : Permitir inserções somente de centro de custos Analíticos
---------------------------------------------------------------------------------------------------}
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
   uDbValorCriRatOrc, uCMTypes, CmEventosCadastro, CMDBLookupCombo, Forms, Controls;


type                                                 //Ricardo SOL 159240 KTN 1337878
   TListaX = (lxCentroDeCusto, lxPlanoPrev, lxPatro, lxPrograma, lxTipoDespesa, lxAtividadeProjeto);

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
      function ListaExercicio(pIdPessoa: Integer; pExercicioIni: Integer = -1) : OleVariant;

      function ListaPeriodo(pIdPessoa, pIdCriterio, pExercicio: Integer) : OleVariant;

      // Alterado por FHBS - SOL: 150140 KTN: 1087554
      function ListaCentroDeCusto(pIdCentroCusto: String = '';
                                  pIdCriterio: integer = -1;
                                  pExercicioIni: integer = -1;
                                  pExercicioFim: integer = -1;
                                  pPeriodoIni: integer = -1;
                                  pPeriodoFim: integer = -1): OleVariant;
      // Alterado por FHBS - SOL: 150140 KTN: 1087554
      function ListaPlanoPrev(pIdPlanoPrev: Integer = -1;
                              pIdCriterio: integer = -1;
                              pExercicioIni: integer = -1;
                              pExercicioFim: integer = -1;
                              pPeriodoIni: integer = -1;
                              pPeriodoFim: integer = -1): OleVariant;
      // Alterado por FHBS - SOL: 150140 KTN: 1087554
      function ListaPatro(pIdPatro: Integer = -1;
                          pIdCriterio: integer = -1;
                          pExercicioIni: integer = -1;
                          pExercicioFim: integer = -1;
                          pPeriodoIni: integer = -1;
                          pPeriodoFim: integer = -1): OleVariant;

      //Ricardo SOL 159240 KTN 1337878
      function ListaPrograma(pIdPrograma: Integer = -1;
                             pIdCriterio: integer = -1;
                             pExercicioIni: integer = -1;
                             pExercicioFim: integer = -1;
                             pPeriodoIni: integer = -1;
                             pPeriodoFim: integer = -1): OleVariant;

      //Ricardo SOL 159240 KTN 1337878
      function ListaTipoDespesa(pIdTipoDespesa: Integer = -1;
                                pIdCriterio: integer = -1;
                                pExercicioIni: integer = -1;
                                pExercicioFim: integer = -1;
                                pPeriodoIni: integer = -1;
                                pPeriodoFim: integer = -1): OleVariant;

       //Ricardo SOL 159240 KTN 1337878
      function ListaAtivProj(pUnidNegoc : Integer = -1;
                             pIdPessoa : Integer = -1;
                             pIdCriterio: integer = -1;
                             pExercicioIni: integer = -1;
                             pExercicioFim: integer = -1;
                             pPeriodoIni: integer = -1;
                             pPeriodoFim: integer = -1): OleVariant;




      // Alterado por FHBS - SOL: 150140 KTN: 1087554
      function AdionaDadosListaX(ovDados: OleVariant;
                                 TipoX: TListaX;
                                 var pDBLookupCombo;
                                 pIdCriterio: integer;
                                 pExercicioIni: integer;
                                 pExercicioFim: integer;
                                 pPeriodoIni: integer;
                                 pPeriodoFim: integer): OleVariant;

      function Procurar(pIdValorCriRatOrc: Double ): OleVariant;

      function PesquisaCriterio(const pIdCriterio  : integer = -1;
                                const pExercicioIni: integer = -1;
                                const pExercicioFim: integer = -1;
                                const pPeriodoIni  : integer = -1;
                                const pPeriodoFim  : integer = -1      ): OleVariant;

      function GravarCriterio(ovDadosAplicar: OleVariant;
                              oOperacao: TOperacao;
                              iPerIni: integer;
                              iPerFim: integer;
                              iExeIni: integer;
                              iExeFim: integer;
                              iIdEmpresa: integer;
                              iIdCriteRat: integer): boolean;

      function DeletaCriteriosRateio: boolean;

      function TestaCriterio(iIdCritRateio,iPerIni,iPerFim,iExeIni,iExeFim: integer): string;

      function CriterioEncontrado(const pCriterio: integer;
                                  const pExercicioIni: integer;
                                  const pExercicioFim: integer;
                                  const pPeriodoIni: integer;
                                  const pPeriodoFim: integer;
                                  const pCodExterno: string): boolean;

      function ListaCCustoParaCrit(oOperacao: TOperacao; iIdPessoa, iPerIni, iPerFim, iExeIni, iExeFim, iIdCritRat: integer): OleVariant;

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

   end;



implementation

uses uFuncoesOrcamento;


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

function TCtrlCadValCriterioRat.ListaExercicio(pIdPessoa, pExercicioIni: Integer): OleVariant;
var
  sSQL: String;
begin
  sSQL := 'select distinct EXERCICIO' + CR_LF +
          '  from PERIODOORCAMEN' + CR_LF +
          ' where ( IDPESSOA = ' + IntToStr( pIdPessoa ) + ' ) ' + CR_LF +
          '   and ( ( FLGBLOQUEADO = ''N'' ) or ( FLGBLOQUEADO IS NULL ) )' + CR_LF;

  if pExercicioIni <> -1 then
  sSQL := sSQL +
          '   and ( EXERCICIO >= ' + IntToStr(pExercicioIni) + ' )' + CR_LF;

  sSQL := sSQL +
          ' order by EXERCICIO' + CR_LF;


  Result := GetDataPacket( sSQL );
end;


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
                                                const iExercicioFim : Integer): Boolean;
var
   sSQL : String;
begin
   Result := True;

{
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
}
   //pendência 27759 - 16/06/2008
   _cds.data := getDataPacket(' SELECT PERIODO, PERIODOFIM FROM VALORCRIRATORC WHERE IDCRITERIORATORC = '+ IntToStr(IDCriterio)+
                              ' AND EXERCICIO = '+ IntToStr(iExercicioOri) );

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
   '  VLRCRIRATORC, '                        + #13 +
   '  EXERCICIOFIM, '                        + #13 +
   '  PERIODOFIM '                           + #13 +
   '  ) '                                    + #13 +
   '  ( '+#13+
      '  SELECT '                               + #13 +
      '     SEQVALORCRIRATORC.NEXTVAL, '        + #13 +
      '     IDPESSOA, '                         + #13 +
      '     ' + IntToStr(iExercicioFim) + ', '  + #13 +
      '     ' + _cds.fieldByName('PERIODO').asString + ' AS PERIODO, '    + #13 +
      '     IDEMPRESA, '                        + #13 +
      '     CODCENTROCUSTO, '                   + #13 +
      '     IDCRITERIORATORC, '                 + #13 +
      '     VLRCRIRATORC, '                     + #13 +
      '     ' + IntToStr(iExercicioFim) + ', '  + #13 +
      '     ' + _cds.fieldByName('PERIODOFIM').asString + ' AS PERIODOFIM ' + #13 +
      '   FROM '                                + #13 +
      '      VALORCRIRATORC VLR '               + #13 +
      '   WHERE '                               + #13 +
      '          VLR.IDCRITERIORATORC = '       + IntToStr(IDCriterio) + #13 +
      '      AND VLR.EXERCICIO        = '       + IntToStr(iExercicioOri)+ #13+
      ' ) ';

   _cds.Close;
   try
      ExecSQL(sSQL);
   except
     _cds.Close;
     Result := False;
   end;
end;




function TCtrlCadValCriterioRat.PesquisaCriterio(const pIdCriterio: integer;
  const pExercicioIni: integer; const pExercicioFim: integer;
  const pPeriodoIni: integer; const pPeriodoFim: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'select VR.IDVALORCRIRATORC,' + CR_LF +
          '       VR.IDPESSOA,' + CR_LF +
          '       VR.IDEMPRESA,' + CR_LF +
          '       VR.IDCRITERIORATORC,' + CR_LF +
          '       VR.EXERCICIO,' + CR_LF +
          '       VR.EXERCICIOFIM,' + CR_LF +
          '       VR.PERIODO,' + CR_LF +
          '       VR.PERIODOFIM,' + CR_LF +
          '       VR.CODCENTROCUSTO,' + CR_LF +
          '       trim(CC.CODEXTERNO) as CODEXTERNO,' + CR_LF +
          '       CC.NOME,' + CR_LF +
          '       VR.IDPLANOPREV,' + CR_LF +
          '       PP.NOME as PLANO,' + CR_LF +
          '       VR.IDPATRO,' + CR_LF +
          '       PT.NOME as PATRO,' + CR_LF +
          '       nvl(VR.VLRCRIRATORC, 0) as VLRCRIRATORC,' + CR_LF +

          //Ricardo SOL 159240 KTN 1337878
          '       PR.IDPROGRAMAORCAMEN, ' + CR_LF +
          '       PR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' + CR_LF +
          '       TD.IDTIPO_DEPESAORCAMEN, ' + CR_LF +
          '       TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA, ' + CR_LF +
          '   UN.UNIDNEGOC,UN.IDPESSOA,UN.NOME AS ATIVIDADEPROJETO ' + CR_LF +
          //Ricardo SOL 159240 KTN 1337878 - fim

          '  from VALORCRIRATORC VR, CENTCUST CC, PLANPREVCONTABIL PP, PESSOA PT, ' + CR_LF +

          //Ricardo SOL 159240 KTN 1337878
          '  CM.PROGRAMAORCAMEN PR, CM.TIPO_DESPESAORCAMEN TD, UNIDNEGOCIO UN ' + CR_LF +
          //Ricardo SOL 159240 KTN 1337878 - fim

          ' where VR.IDCRITERIORATORC = ' + IntToStr(pIdCriterio) + CR_LF +
          '   and CC.CODCENTROCUSTO(+) = VR.CODCENTROCUSTO' + CR_LF +
          '   and CC.IDEMPRESA(+) = VR.IDEMPRESA' + CR_LF +
          '   and PP.IDPLANOPREV(+) = VR.IDPLANOPREV' + CR_LF +
          '   and PT.IDPESSOA(+) = VR.IDPATRO' + CR_LF +

          //Ricardo SOL 159240 KTN 1337878
          '   and PR.IDPROGRAMAORCAMEN(+) = VR.IDPROGRAMAORCAMEN' + CR_LF +
          '   and TD.IDTIPO_DEPESAORCAMEN(+) = VR.IDTIPO_DEPESAORCAMEN' + CR_LF +
          '   and UN.IDPESSOA(+) = VR.IDPESSOA ' + CR_LF +
          '   and UN.UNIDNEGOC(+) = VR.UNIDNEGOC ' + CR_LF +
          //Ricardo SOL 159240 KTN 1337878 - fim
          ' ';

  if pExercicioIni <> -1 then
     sSQL := sSQL + '   and VR.EXERCICIO >= ' + IntToStr(pExercicioIni) + CR_LF;

  if pExercicioFim <> -1 then
     sSQL := sSQL + '   and VR.EXERCICIOFIM <= ' + IntToStr(pExercicioFim) + CR_LF;

  if pPeriodoIni <> -1 then
     sSQL := sSQL + '   and VR.PERIODO >= ' + IntToStr(pPeriodoIni) + CR_LF;

  if pPeriodoFim <> -1 then
     sSQL := sSQL + '   and VR.PERIODOFIM <= ' + IntToStr(pPeriodoFim) + CR_LF;

  sSQL := sSQL +
          ' order by CC.NOME, PP.NOME, PT.NOME';
          
  Result := GetDataPacket(sSQL);
end;




function TCtrlCadValCriterioRat.GravarCriterio(ovDadosAplicar: OleVariant;
                                               oOperacao: TOperacao;
                                               iPerIni: integer;
                                               iPerFim: integer;
                                               iExeIni: integer;
                                               iExeFim: integer;
                                               iIdEmpresa: integer;
                                               iIdCriteRat: integer): boolean;
var
  iPerido: integer;
  sFiltro: string;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravarCriterio(ovDadosAplicar,oOperacao,iPerIni,iPerFim,iExeIni,iExeFim,iIdEmpresa,iIdCriteRat);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
     try
     try

       Screen.Cursor := crHourGlass;
       Application.ProcessMessages;

       StartTransaction;

       _Cds.Data := ovDadosAplicar;
       if not _Cds.IsEmpty then
       begin
          _Cds.First;

          while not _Cds.Eof do
          begin

             if CdsValorCriRatOrc.State in [dsEdit, dsInsert] then
                CdsValorCriRatOrc.Cancel;

             // Alterado por FHBS - SOL: 150140 KTN: 1087554
             if _Cds.FieldByName('IDVALORCRIRATORC').AsInteger > 0 then
             begin
               CdsValorCriRatOrc.Filter   := 'IDVALORCRIRATORC = ' + _Cds.FieldByName('IDVALORCRIRATORC').AsString;
               CdsValorCriRatOrc.Filtered := True;
               CdsValorCriRatOrc.Edit;
             end
             else
             begin
               CdsValorCriRatOrc.Append;
               CdsValorCriRatOrc.FieldByName('IDCRITERIORATORC').AsInteger := iIdCriteRat;
               CdsValorCriRatOrc.FieldByName('IDPESSOA').AsInteger         := iIdEmpresa;
               CdsValorCriRatOrc.FieldByName('IDEMPRESA').AsInteger        := iIdEmpresa;
             end;

             CdsValorCriRatOrc.FieldByName('EXERCICIO').AsInteger        := iExeIni;
             CdsValorCriRatOrc.FieldByName('EXERCICIOFIM').AsInteger     := iExeFim;
             CdsValorCriRatOrc.FieldByName('PERIODO').AsInteger          := iPerIni;
             CdsValorCriRatOrc.FieldByName('PERIODOFIM').AsInteger       := iPerFim;
             CdsValorCriRatOrc.FieldByName('CODCENTROCUSTO').Value       := _Cds.FieldByName('CODCENTROCUSTO').AsString;
             CdsValorCriRatOrc.FieldByName('CODEXTERNO').Value           := _Cds.FieldByName('CODEXTERNO').AsString;
             CdsValorCriRatOrc.FieldByName('NOME').Value                 := _Cds.FieldByName('CENTCUST').AsString;
             CdsValorCriRatOrc.FieldByName('IDPlanoPrev').Value          := _Cds.FieldByName('IDPlanoPrev').Value; // Alterado por FHBS - SOL: 150140 KTN: 1087554
             CdsValorCriRatOrc.FieldByName('PLANO').Value                := _Cds.FieldByName('PLANO').Value; // Alterado por FHBS - SOL: 150140 KTN: 1087554
             CdsValorCriRatOrc.FieldByName('IDPatro').Value              := _Cds.FieldByName('IDPatro').Value; // Alterado por FHBS - SOL: 150140 KTN: 1087554
             CdsValorCriRatOrc.FieldByName('PATRO').Value                := _Cds.FieldByName('PATRO').Value; // Alterado por FHBS - SOL: 150140 KTN: 1087554
             CdsValorCriRatOrc.FieldByName('VLRCRIRATORC').AsFloat       := _Cds.FieldByName('VALOR').AsFloat;

             //Ricardo SOL 159240 KTN 1337878
             CdsValorCriRatOrc.FieldByName('IDPROGRAMAORCAMEN').Value    := _Cds.FieldByName('IDPROGRAMAORCAMEN').Value;
             CdsValorCriRatOrc.FieldByName('PROGRAMA').Value             := _Cds.FieldByName('CODCENTROCUSTO').AsString;
             CdsValorCriRatOrc.FieldByName('IDTIPO_DEPESAORCAMEN').Value := _Cds.FieldByName('IDTIPO_DEPESAORCAMEN').Value;
             CdsValorCriRatOrc.FieldByName('TIPODESPESA').Value          := _Cds.FieldByName('CODCENTROCUSTO').AsString;

             CdsValorCriRatOrc.FieldByName('IDPESSOA').Value             := _Cds.FieldByName('IDPESSOA').Value;
             CdsValorCriRatOrc.FieldByName('UNIDNEGOC').Value            := _Cds.FieldByName('UNIDNEGOC').Value;
             CdsValorCriRatOrc.FieldByName('ATIVIDADEPROJETO').Value     := _Cds.FieldByName('ATIVIDADEPROJETO').AsString;
             //Ricardo SOL 159240 KTN 1337878 - fim


             CdsValorCriRatOrc.Post;

             if CdsValorCriRatOrc.Filtered then
               CdsValorCriRatOrc.Filtered := False;

// Alterado por FHBS - SOL: 150140 KTN: 1087554
//             case oOperacao of
//
//                opInserir: begin
//                              // Se o usuário estiver inserindo um valor base novo...
//                              //if (_Cds.FieldByName('VALOR').AsFloat <> _Cds.FieldByName('VLREFET').AsFloat) then
//                              //pendência 27759 - 28/05/2008
//                              if ( Format('%17.2f',[_Cds.FieldByName('VALOR').AsFloat]) <> Format('%17.2f',[_Cds.FieldByName('VLREFET').AsFloat]) ) then
//                              begin
//                                 CdsValorCriRatOrc.Append;
//                                 CdsValorCriRatOrc.FieldByName('IDCRITERIORATORC').AsInteger := iIdCriteRat;
//                                 CdsValorCriRatOrc.FieldByName('EXERCICIO').AsInteger        := iExeIni;
//                                 CdsValorCriRatOrc.FieldByName('EXERCICIOFIM').AsInteger     := iExeFim;
//                                 CdsValorCriRatOrc.FieldByName('PERIODO').AsInteger          := iPerIni;
//                                 CdsValorCriRatOrc.FieldByName('PERIODOFIM').AsInteger       := iPerFim;
//                                 CdsValorCriRatOrc.FieldByName('CODCENTROCUSTO').AsString    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
//                                 CdsValorCriRatOrc.FieldByName('CODEXTERNO').AsString        := _Cds.FieldByName('CODEXTERNO').AsString;
//                                 CdsValorCriRatOrc.FieldByName('NOME').AsString              := _Cds.FieldByName('CENTCUST').AsString;
//                                 CdsValorCriRatOrc.FieldByName('VLRCRIRATORC').AsFloat       := _Cds.FieldByName('VALOR').AsFloat;
//                                 CdsValorCriRatOrc.FieldByName('IDPESSOA').AsInteger         := iIdEmpresa;
//                                 CdsValorCriRatOrc.FieldByName('IDEMPRESA').AsInteger        := iIdEmpresa;
//                                 CdsValorCriRatOrc.Post;
//                              end;
//                           end;
//
//                opAlterar: begin
//                              // Filtra somente os C.Custos
//                              CdsValorCriRatOrc.Filter   := 'CODCENTROCUSTO = ' + QuotedStr(_Cds.FieldByName('CODCENTROCUSTO').AsString);
//                              CdsValorCriRatOrc.Filtered := True;
//
//                              CdsValorCriRatOrc.First;
//                              while not CdsValorCriRatOrc.Eof do
//                              begin
//                                 CdsValorCriRatOrc.Edit;
//                                 CdsValorCriRatOrc.FieldByName('EXERCICIO').AsInteger        := iExeIni;
//                                 CdsValorCriRatOrc.FieldByName('EXERCICIOFIM').AsInteger     := iExeFim;
//                                 CdsValorCriRatOrc.FieldByName('PERIODO').AsInteger          := iPerIni;
//                                 CdsValorCriRatOrc.FieldByName('PERIODOFIM').AsInteger       := iPerFim;
//                                 CdsValorCriRatOrc.FieldByName('VLRCRIRATORC').AsFloat       := _Cds.FieldByName('VALOR').AsFloat;
//                                 CdsValorCriRatOrc.Post;
//
//                                 CdsValorCriRatOrc.Next;
//                              end;
//
//                              CdsValorCriRatOrc.Filtered := False;
//                           end;
//             end;


             _Cds.Next;
             Screen.Cursor := crHourGlass;
             Application.ProcessMessages;
          end;

       end;

       Application.ProcessMessages;
       Result := ApplyCds(CdsValorCriRatOrc, _dbValorCriRatOrc,  [], []);
       Application.ProcessMessages;
       
       if not Result then
          raise Exception.Create(_dbValorCriRatOrc.MessageInfo);

       Commit;

     except
       On E: Exception do
       begin
         Result := False;
         RollBack;
         MessageInfo := E.Message;
       end;
     end;
     finally
       Screen.Cursor := crDefault;
       Application.ProcessMessages;
     end;
   end;
end;




function TCtrlCadValCriterioRat.CriterioEncontrado(const pCriterio: integer;
const pExercicioIni: integer; const pExercicioFim: integer;
const pPeriodoIni: integer; const pPeriodoFim: integer;
const pCodExterno: string): boolean;
var
   sSQL: string;
   cdsAux: TClientDataSet;
begin
   try
      sSQL := 'SELECT COUNT(*) AS REGCOUNT FROM VALORCRIRATORC VR, CENTCUST CC     ' + #13 +
              'WHERE                                                               ' + #13 +
                 'VR.CODCENTROCUSTO = CC.CODCENTROCUSTO AND                        ' + #13 +
                 'VR.IDEMPRESA      = CC.IDEMPRESA                                 ' + #13 +
                 'AND IDCRITERIORATORC = ' + IntToStr(pCriterio)    +  '           ' + #13 +
                 'AND EXERCICIO        = ' + IntToStr(pExercicioIni)+  '           ' + #13 +
                 'AND EXERCICIOFIM     = ' + IntToStr(pExercicioFim)+  '           ' + #13 +
                 'AND PERIODO          = ' + IntToStr(pPeriodoIni)  +  '           ' + #13 +
                 'AND PERIODOFIM       = ' + IntToStr(pPeriodoFim)  +  '           ' + #13 +
                 'AND CODEXTERNO       = ' + QuotedStr(pCodExterno) +  '           ';

      cdsAux := TClientDataSet.Create(nil);
      cdsAux.Data := GetDataPacket(sSQL);
      result := cdsAux.FieldByName('REGCOUNT').Value > 0;
   finally
      FreeAndNil(cdsAux);
   end;
end;




function TCtrlCadValCriterioRat.ListaCCustoParaCrit(oOperacao: TOperacao;
  iIdPessoa,iPerIni,iPerFim,iExeIni,iExeFim,iIdCritRat: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL :=  'select rownum, ' + CR_LF;

   case oOperacao of
      opInserir: sSQL := sSQL +
            '       decode(VR.IDCRITERIORATORC, null, ''S'', ''N'') as VALIDAR, ' + CR_LF;
      opAlterar: sSQL := sSQL +
            '       ''S'' as VALIDAR, ' + CR_LF;
   end;

   sSQL := sSQL +
            '       nvl(VR.IDVALORCRIRATORC, -1) as IDVALORCRIRATORC, ' + CR_LF +
            '       VR.IDCRITERIORATORC, ' + CR_LF +
            '       trim(CC.CODEXTERNO) as CODEXTERNO, ' + CR_LF +
            '       CC.CODCENTROCUSTO, ' + CR_LF +
            '       CC.NOME  as CENTCUST, ' + CR_LF +
            '       VR.IDPLANOPREV, ' + CR_LF +
            '       PPV.NOME as PLANO, ' + CR_LF +
            '       VR.IDPATRO, ' + CR_LF +
            '       PT.NOME  as PATRO, ' + CR_LF +
            '       VR.PERIODO as PERINI, ' + CR_LF +
            '       VR.PERIODOFIM as PERFIM, ' + CR_LF +
            '       VR.EXERCICIO as EXEINI, ' + CR_LF +
            '       VR.EXERCICIOFIM as EXEFIM, ' + CR_LF +
            '       nvl(VR.VLRCRIRATORC, 0) as VALOR, ' + CR_LF +
            '       nvl(VR.VLRCRIRATORC, 0) as VLREFET, ' + CR_LF +

            //Ricardo SOL 159240 KTN 1337878
            '       PR.IDPROGRAMAORCAMEN, ' + CR_LF +
            '       PR.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA, ' + CR_LF +
            '       TD.IDTIPO_DEPESAORCAMEN, ' + CR_LF +
            '       TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA, ' + CR_LF +
            '       UN.UNIDNEGOC,UN.IDPESSOA,UN.NOME AS ATIVIDADEPROJETO ' + CR_LF +

            //Ricardo SOL 159240 KTN 1337878 - fim


            '  from VALORCRIRATORC VR, ' + CR_LF +
            '       CENTCUST CC, ' + CR_LF +
            '       PLANPREVCONTABIL PPV, ' + CR_LF +
            '       PESSOA PT, ' + CR_LF +

            //Ricardo SOL 159240 KTN 1337878
            '  CM.PROGRAMAORCAMEN PR, CM.TIPO_DESPESAORCAMEN TD, UNIDNEGOCIO UN  ' + CR_LF +
            //Ricardo SOL 159240 KTN 1337878 - fim


            ' where VR.IDCRITERIORATORC = ' + IntToStr(iIdCritRat) + CR_LF +
            '   and VR.EXERCICIO >= ' + IntToStr(iExeIni) + CR_LF +
            '   and VR.EXERCICIOFIM <= ' + IntToStr(iExeFim) + CR_LF +
            '   and VR.PERIODO >= ' + IntToStr(iPerIni) + CR_LF +
            '   and VR.PERIODOFIM <= ' + IntToStr(iPerFim) + CR_LF +

            '   and CC.IDEMPRESA(+) = VR.IDEMPRESA ' + CR_LF +
            '   and CC.CODCENTROCUSTO(+) = VR.CODCENTROCUSTO ' + CR_LF +
            '   and CC.ATIVO(+) = ''S'' ' + CR_LF +
            '   and CC.STATUSGRUPOCDC(+) = ''A'' ' + CR_LF +

            '   and PPV.IDPLANOPREV(+) = VR.IDPLANOPREV ' + CR_LF +
            '   and PT.IDPESSOA(+) = VR.IDPATRO ' + CR_LF +

            //Ricardo SOL 159240 KTN 1337878
            '   and PR.IDPROGRAMAORCAMEN(+) = VR.IDPROGRAMAORCAMEN' + CR_LF +
            '   and TD.IDTIPO_DEPESAORCAMEN(+) = VR.IDTIPO_DEPESAORCAMEN' + CR_LF +
            '   and UN.IDPESSOA(+) = VR.IDPESSOA ' + CR_LF +
            '   and UN.UNIDNEGOC(+) = VR.UNIDNEGOC ' + CR_LF +
            //Ricardo SOL 159240 KTN 1337878 - fim


            'order by CENTCUST, PLANO, PATRO ';

   Result := GetDataPacket(sSQL);
end;




function TCtrlCadValCriterioRat.DeletaCriteriosRateio: boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravarCriterio(CdsValorCriRatOrc.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
     try
       StartTransaction;

       Result := ApplyCds(CdsValorCriRatOrc, _dbValorCriRatOrc,  [], []);

       if not Result then
          raise Exception.Create(_dbValorCriRatOrc.MessageInfo);
          
       Commit;

     except
       On E: Exception do
       begin
         Result := False;
         RollBack;
         MessageInfo := E.Message;
       end;
     end;
   end;
end;




function TCtrlCadValCriterioRat.TestaCriterio(iIdCritRateio, iPerIni,
  iPerFim, iExeIni, iExeFim: integer): string;
var
   sPeriodos: string;
begin
   // Testa o período FINAL
   _Cds.Data := GetDataPacket('SELECT DISTINCT PERIODO, EXERCICIO, PERIODO || ''-'' || EXERCICIO || ''  à  '' || PERIODOFIM || ''-'' || EXERCICIOFIM AS FAIXA ' +
                              'FROM VALORCRIRATORC ' +
                              'WHERE (IDCRITERIORATORC = ' + IntToStr(iIdCritRateio) + ') AND ' +
                              '     ((' + IntToStr(iPerIni) + ' BETWEEN PERIODO AND PERIODOFIM ) OR ' +
                              '      (' + IntToStr(iPerFim) + ' BETWEEN PERIODO AND PERIODOFIM )) AND ' +
                              '      (EXERCICIO     >= '  + IntToStr(iExeIni) + ') AND ' +
                              '      (EXERCICIOFIM  <= '  + IntToStr(iExeFim) + ') ' +
                              'ORDER BY ' +
                              '  EXERCICIO, PERIODO'); 

   if not _Cds.IsEmpty then
   begin
      while not _Cds.Eof do
      begin
          if Trim(sPeriodos) <> '' then
             sPeriodos:= sPeriodos + ', ' + _Cds.FieldByName('FAIXA').AsString
          else
             sPeriodos:= _Cds.FieldByName('FAIXA').AsString;

         _Cds.Next;
      end;

      if Trim(sPeriodos) <> '' then
         Result := 'Não foi possível inserir novos valores/centro de custos. ' + #13 +
                   'Motivo: Já existe uma faixa cadastrada para este critério.' + #13 +
                   'Período(s): ' + sPeriodos;
   end;
end;

function TCtrlCadValCriterioRat.ListaCentroDeCusto(pIdCentroCusto: String;
                                                   pIdCriterio  : integer;
                                                   pExercicioIni: integer;
                                                   pExercicioFim: integer;
                                                   pPeriodoIni: integer;
                                                   pPeriodoFim: integer): OleVariant;
var
  sSQL: String;
begin
  sSQL := '';

  if Trim(pIdCentroCusto) <> '' then
    sSQL := sSQL + '  and CODCENTROCUSTO = ' + QuotedStr(pIdCentroCusto) + CR_LF;

  if (pIdCriterio <> -1) and (pExercicioIni <> -1) and (pExercicioFim <> -1) and (pPeriodoIni <> -1) and (pPeriodoFim <> -1) then
    sSQL := sSQL + '  and CODCENTROCUSTO not in (select distinct CODCENTROCUSTO from VALORCRIRATORC' + CR_LF +
                   '                              where IDCRITERIORATORC = ' + IntToStr(pIdCriterio) + CR_LF +
                   '                                and CODCENTROCUSTO is not null' + CR_LF +
                   '                                and EXERCICIO >= ' + IntToStr(pExercicioIni) + CR_LF +
                   '                                and EXERCICIOFIM <= ' + IntToStr(pExercicioFim) + CR_LF +
                   '                                and PERIODO >= ' + IntToStr(pPeriodoIni) + CR_LF +
                   '                                and PERIODOFIM <= ' + IntToStr(pPeriodoFim) + ')' + CR_LF;


  Result := GetDataPacket('select CODCENTROCUSTO, NOME, IDEMPRESA, CODEXTERNO ' + CR_LF +
                          '  from CENTCUST' + CR_LF +
                          ' where IDEMPRESA = ' + IntToStr( IdEmpresa ) + CR_LF +
                          '   and ATIVO = ''S''' + CR_LF +
                          '   and STATUSGRUPOCDC = ''A''' + CR_LF + sSQL +
                          ' order by NOME');
end;

function TCtrlCadValCriterioRat.ListaPlanoPrev(pIdPlanoPrev: Integer;
                                               pIdCriterio  : integer;
                                               pExercicioIni: integer;
                                               pExercicioFim: integer;
                                               pPeriodoIni: integer;
                                               pPeriodoFim: integer): OleVariant;
var
  sSQL: String;
begin
  sSQL := '';

  if pIdPlanoPrev <> -1 then
    sSQL := '  and IDPLANOPREV = ' + IntToStr(pIdPlanoPrev) + CR_LF;

  if (pIdCriterio <> -1) and (pExercicioIni <> -1) and (pExercicioFim <> -1) and (pPeriodoIni <> -1) and (pPeriodoFim <> -1) then
    sSQL := sSQL + '  and IDPLANOPREV not in (select distinct IDPLANOPREV from VALORCRIRATORC' + CR_LF +
                   '                           where IDCRITERIORATORC = ' + IntToStr(pIdCriterio) + CR_LF +
                   '                             and IDPLANOPREV is not null' + CR_LF +
                   '                             and EXERCICIO >= ' + IntToStr(pExercicioIni) + CR_LF +
                   '                             and EXERCICIOFIM <= ' + IntToStr(pExercicioFim) + CR_LF +
                   '                             and PERIODO >= ' + IntToStr(pPeriodoIni) + CR_LF +
                   '                             and PERIODOFIM <= ' + IntToStr(pPeriodoFim) + ')' + CR_LF;

  Result := GetDataPacket('select IDPLANOPREV, NOME' + CR_LF +
                          '  from PLANPREVCONTABIL' + CR_LF +
                          ' where ATIVO = ''S''' + CR_LF + sSQL +
                          ' order by CODORCAMENTO');
end;

function TCtrlCadValCriterioRat.ListaPatro(pIdPatro: Integer;
                                           pIdCriterio  : integer;
                                           pExercicioIni: integer;
                                           pExercicioFim: integer;
                                           pPeriodoIni: integer;
                                           pPeriodoFim: integer): OleVariant;
var
  sSQL: String;
begin
  sSQL := '';

  if pIdPatro <> -1 then
    sSQL := '  and P.IDPESSOA = ' + IntToStr(pIdPatro) + CR_LF;

  if (pIdCriterio <> -1) and (pExercicioIni <> -1) and (pExercicioFim <> -1) and (pPeriodoIni <> -1) and (pPeriodoFim <> -1) then
    sSQL := sSQL + '  and P.IDPESSOA not in (select distinct IDPATRO from VALORCRIRATORC' + CR_LF +
                   '                          where IDCRITERIORATORC = ' + IntToStr(pIdCriterio) + CR_LF +
                   '                            and IDPATRO is not null' + CR_LF +
                   '                            and EXERCICIO >= ' + IntToStr(pExercicioIni) + CR_LF +
                   '                            and EXERCICIOFIM <= ' + IntToStr(pExercicioFim) + CR_LF +
                   '                            and PERIODO >= ' + IntToStr(pPeriodoIni) + CR_LF +
                   '                            and PERIODOFIM <= ' + IntToStr(pPeriodoFim) + ')' + CR_LF;

  Result := GetDataPacket('select P.IDPESSOA, P.NOME' + CR_LF +
                          '  from PATRO PT, PESSOA P' + CR_LF +
                          ' where P.IDPESSOA = PT.IDPESSOA' + CR_LF + sSQL +
                          ' order by PT.CODORCAMENTO');
end;

function TCtrlCadValCriterioRat.AdionaDadosListaX(ovDados: OleVariant;
                                                  TipoX: TListaX;
                                                  var pDBLookupCombo;
                                                  pIdCriterio: integer;
                                                  pExercicioIni: integer;
                                                  pExercicioFim: integer;
                                                  pPeriodoIni: integer;
                                                  pPeriodoFim: integer): OleVariant;
var
  Combo: TCMDBLookupCombo;
  CdsCombo, CdsAdd, CdsAux: TClientDataSet;
  iCont: Integer;
  bAdicionar: Boolean;
  vFieldValue: String;
  sOldIndex: String;

  procedure AtualizaFieldsTipoX;
  begin
    _Cds.FieldByName('IDCRITERIORATORC').AsInteger := pIdCriterio;
    _Cds.FieldByName('EXEINI').AsInteger := pExercicioIni;
    _Cds.FieldByName('EXEFIM').AsInteger := pExercicioFim;
    _Cds.FieldByName('PERINI').AsInteger := pPeriodoIni;
    _Cds.FieldByName('PERFIM').AsInteger := pPeriodoFim;

    if (TipoX = lxCentroDeCusto) then
    begin
      _Cds.FieldByName('CODCENTROCUSTO').Value := CdsCombo.FieldByName('CODCENTROCUSTO').Value;
      _Cds.FieldByName('CENTCUST').Value       := CdsCombo.FieldByName('NOME').Value;
      _Cds.FieldByName('CODEXTERNO').Value     := CdsCombo.FieldByName('CODEXTERNO').Value;
    end;

    if (TipoX = lxPlanoPrev) then
    begin
      _Cds.FieldByName('IDPLANOPREV').Value := CdsCombo.FieldByName('IDPLANOPREV').Value;
      _Cds.FieldByName('PLANO').Value := CdsCombo.FieldByName('NOME').Value;
    end;

    if (TipoX = lxPatro) then
    begin
      _Cds.FieldByName('IDPATRO').Value := CdsCombo.FieldByName('IDPESSOA').Value;
      _Cds.FieldByName('PATRO').Value := CdsCombo.FieldByName('NOME').Value;
    end;

    //Ricardo SOL 159240 KTN 1337878
    if (TipoX = lxPrograma) then
    begin
      _Cds.FieldByName('IDPROGRAMAORCAMEN').Value := CdsCombo.FieldByName('IDPROGRAMAORCAMEN').Value;
      _Cds.FieldByName('PROGRAMA').Value := CdsCombo.FieldByName('PROGRAMA').Value;
    end;

    if (TipoX = lxTipoDespesa) then
    begin
      _Cds.FieldByName('IDTIPO_DEPESAORCAMEN').Value := CdsCombo.FieldByName('IDTIPO_DEPESAORCAMEN').Value;
      _Cds.FieldByName('TIPODESPESA').Value := CdsCombo.FieldByName('TIPODESPESA').Value;
    end;

    if (TipoX = lxAtividadeProjeto) then
    begin
      _Cds.FieldByName('IDPESSOA').Value          := CdsCombo.FieldByName('IDPESSOA').Value;
      _Cds.FieldByName('UNIDNEGOC').Value         := CdsCombo.FieldByName('UNIDNEGOC').Value;
      _Cds.FieldByName('ATIVIDADEPROJETO').Value    := CdsCombo.FieldByName('ATIVIDADEPROJETO').Value;
    end;


    //Ricardo SOL 159240 KTN 1337878 - fim

  end;

begin

  CdsAdd := TClientDataSet.Create(nil);
  CdsAux := TClientDataSet.Create(nil);

  try
    Combo := TCMDBLookupCombo(pDBLookupCombo);
    CdsCombo := TClientDataSet(Combo.LookupTable);

    if (Trim(Combo.Text) = '') and (Combo.LookupValue = '') then
      Combo.LookupValue := '';

    if CdsCombo.RecordCount = 0 then
      Result := ovDados
    else
    begin
      _Cds.Data := ovDados;


      if (Combo.LookupValue = '') then
        CdsCombo.First;

      //---------------------------------------
      // Obtendo os dados para inclusão
      //---------------------------------------
      CdsAdd.Data := ovDados;

      case TipoX of
        lxCentroDeCusto: CdsAdd.IndexFieldNames := 'CODCENTROCUSTO';
        lxPlanoPrev:     CdsAdd.IndexFieldNames := 'IDPLANOPREV';
        lxPatro:         CdsAdd.IndexFieldNames := 'IDPATRO';

        //Ricardo SOL 159240 KTN 1337878
        lxPrograma:         CdsAdd.IndexFieldNames := 'IDPROGRAMAORCAMEN';
        lxTipoDespesa:      CdsAdd.IndexFieldNames := 'IDTIPO_DEPESAORCAMEN';
        lxAtividadeProjeto: CdsAdd.IndexFieldNames := 'UNIDNEGOC';
        //Ricardo SOL 159240 KTN 1337878 - fim
      end;

      if CdsAdd.RecordCount > 0 then
      begin
        CdsAdd.First;
        vFieldValue := CdsAdd.FieldByName(CdsAdd.IndexFieldNames).AsString;
        while not(CdsAdd.Eof) do
        begin
          if (vFieldValue <> CdsAdd.FieldByName(CdsAdd.IndexFieldNames).AsString) then
            CdsAdd.Delete
          else
            CdsAdd.Next;
        end;
      end
      else
      begin
        CdsAdd.Append;
        CdsAdd.Post;
      end;
      CdsAdd.IndexFieldNames := '';
      //---------------------------------------


      _Cds.First;
      bAdicionar := (_Cds.RecordCount = 0);

      while not(CdsCombo.Eof) do
      begin

        // Se o campos não estive com dados o sistema ira apenas
        // alterar o grid e não incluir novos registros.
        _Cds.First;
        while not(bAdicionar) and not(_Cds.Eof) do
        begin

          if ((TipoX = lxCentroDeCusto) and (Trim(_Cds.FieldByName('CODCENTROCUSTO').AsString) <> '')      ) or
             ((TipoX = lxPlanoPrev)     and (Trim(_Cds.FieldByName('IDPLANOPREV').AsString) <> '')         ) or
             ((TipoX = lxPatro)         and (Trim(_Cds.FieldByName('IDPATRO').AsString) <> '')             ) or
             //Ricardo SOL 159240 KTN 1337878
             ((TipoX = lxPrograma)      and (Trim(_Cds.FieldByName('IDPROGRAMAORCAMEN').AsString) <> '')   ) or
             ((TipoX = lxTipoDespesa)   and (Trim(_Cds.FieldByName('IDTIPO_DEPESAORCAMEN').AsString) <> '')) or
             ((TipoX = lxAtividadeprojeto)   and ((Trim(_Cds.FieldByName('UNIDNEGOC').AsString) <> ''))
             and (Trim(_Cds.FieldByName('IDPESSOA').AsString) <> '')) then
             //Ricardo SOL 159240 KTN 1337878 - fim

          begin
            bAdicionar := True;
            Break;
          end;

          _Cds.Next;
        end;

        if bAdicionar then
        begin

          CdsAdd.First;
          while not(CdsAdd.Eof) do
          begin
            _Cds.Append;

            for iCont := 0 to CdsAdd.FieldCount-1 do
              _Cds.Fields[iCont].Value := CdsAdd.Fields[iCont].Value;

            _Cds.FieldByName('VALIDAR').AsString := 'S';
            _Cds.FieldByName('IDVALORCRIRATORC').AsInteger := -1;
            _Cds.FieldByName('VALOR').Clear;
            _Cds.FieldByName('VLREFET').Clear;

            AtualizaFieldsTipoX;

            _Cds.Post;

            CdsAdd.Next;
          end;

        end
        else
        begin
          sOldIndex := _Cds.IndexFieldNames;
          _Cds.IndexFieldNames := 'rownum';
          _Cds.First;
          while not(_Cds.Eof) do
          begin
            _Cds.Edit;

            AtualizaFieldsTipoX;
            
            _Cds.Post;

            _Cds.Next;
          end;
          _Cds.IndexFieldNames := sOldIndex;
        end;

        // Apagando o Item selecionado
        if (Combo.LookupValue <> '') then
        begin
          CdsCombo.Delete;
          Break;
        end
        else
        begin
          CdsCombo.Next;
        end;

      end;

      // Se não foi selecinado nenhum, então todos foram incluidos.
      if (Combo.LookupValue = '') then
        CdsCombo.EmptyDataSet;

      Combo.LookupValue := '';
      Combo.Clear;

      Result := _Cds.Data;
      _Cds.Close;

    end;

  finally
    if CdsAdd.Active then CdsAdd.Close;
    FreeAndNil(CdsAdd);
    if CdsAux.Active then CdsAux.Close;
    FreeAndNil(CdsAux);
  end;

end;

function TCtrlCadValCriterioRat.ListaPrograma(pIdPrograma, pIdCriterio,
  pExercicioIni, pExercicioFim, pPeriodoIni,
  pPeriodoFim: integer): OleVariant;
var
  sSQL: String;
begin
  sSQL := '';

  if pIdPrograma <> -1 then
    sSQL := '  and P.IDPROGRAMAORCAMEN = ' + IntToStr(pIdPrograma) + CR_LF;

  if (pIdCriterio <> -1) and (pExercicioIni <> -1) and (pExercicioFim <> -1) and (pPeriodoIni <> -1) and (pPeriodoFim <> -1) then
    sSQL := sSQL + '  and P.IDPROGRAMAORCAMEN not in (select distinct NVL(IDPROGRAMAORCAMEN,0) from VALORCRIRATORC' + CR_LF +
                   '                          where IDCRITERIORATORC = ' + IntToStr(pIdCriterio) + CR_LF +
                   '                            and EXERCICIO >= ' + IntToStr(pExercicioIni) + CR_LF +
                   '                            and EXERCICIOFIM <= ' + IntToStr(pExercicioFim) + CR_LF +
                   '                            and PERIODO >= ' + IntToStr(pPeriodoIni) + CR_LF +
                   '                            and PERIODOFIM <= ' + IntToStr(pPeriodoFim) + ')' + CR_LF;

  Result := GetDataPacket('select P.IDPROGRAMAORCAMEN, P.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA' + CR_LF +
                          '  from CM.PROGRAMAORCAMEN P ' + CR_LF +
                          ' where 1 = 1 ' + CR_LF + sSQL +
                          ' order by P.IDPROGRAMAORCAMEN');
end;

function TCtrlCadValCriterioRat.ListaTipoDespesa(pIdTipoDespesa, pIdCriterio,
  pExercicioIni, pExercicioFim, pPeriodoIni,
  pPeriodoFim: integer): OleVariant;
var
  sSQL: String;
begin
  sSQL := '';

  if pIdTipoDespesa <> -1 then
    sSQL := '  and TD.IDTIPO_DEPESAORCAMEN = ' + IntToStr(pIdTipoDespesa) + CR_LF;

  if (pIdCriterio <> -1) and (pExercicioIni <> -1) and (pExercicioFim <> -1) and (pPeriodoIni <> -1) and (pPeriodoFim <> -1) then
    sSQL := sSQL + '  and TD.IDTIPO_DEPESAORCAMEN not in (select distinct NVL(IDTIPO_DEPESAORCAMEN,0) from VALORCRIRATORC' + CR_LF +
                   '                          where IDCRITERIORATORC = ' + IntToStr(pIdCriterio) + CR_LF +
                   '                            and EXERCICIO >= ' + IntToStr(pExercicioIni) + CR_LF +
                   '                            and EXERCICIOFIM <= ' + IntToStr(pExercicioFim) + CR_LF +
                   '                            and PERIODO >= ' + IntToStr(pPeriodoIni) + CR_LF +
                   '                            and PERIODOFIM <= ' + IntToStr(pPeriodoFim) + ')' + CR_LF;

  Result := GetDataPacket('select TD.IDTIPO_DEPESAORCAMEN, TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA' + CR_LF +
                          ' from CM.TIPO_DESPESAORCAMEN TD ' + CR_LF +
                          ' where 1 = 1 ' + CR_LF + sSQL +
                          ' order by TD.IDTIPO_DEPESAORCAMEN');
end;

function TCtrlCadValCriterioRat.ListaAtivProj(pUnidNegoc, pIdPessoa,
  pIdCriterio, pExercicioIni, pExercicioFim, pPeriodoIni,
  pPeriodoFim: integer): OleVariant;
var
  sSQL: String;
begin
    sSQL := '';

  if (pUnidNegoc <> -1) and (pIdPessoa <> -1) then
    sSQL := '  and U.UNIDNEGOC = ' + IntToStr(pUnidNegoc) +  ' and U.IDPESSOA = ' +  IntToStr(pIdPessoa) +  CR_LF;

  if (pIdCriterio <> -1) and (pExercicioIni <> -1) and (pExercicioFim <> -1) and (pPeriodoIni <> -1) and (pPeriodoFim <> -1) then
    sSQL := sSQL + '  and U.UNIDNEGOC not in (select distinct NVL(UNIDNEGOC,0) from VALORCRIRATORC' + CR_LF +
                   '                          where IDCRITERIORATORC = ' + IntToStr(pIdCriterio) + CR_LF +
                   '                            and EXERCICIO >= ' + IntToStr(pExercicioIni) + CR_LF +
                   '                            and EXERCICIOFIM <= ' + IntToStr(pExercicioFim) + CR_LF +
                   '                            and PERIODO >= ' + IntToStr(pPeriodoIni) + CR_LF +
                   '                            and PERIODOFIM <= ' + IntToStr(pPeriodoFim) + ')' + CR_LF;

  Result := GetDataPacket('SELECT U.NOME AS ATIVIDADEPROJETO, U.UNIDNEGOC, U.UNETIPO, U.CODORCAMEN AS UNECODIGO , U.IDPESSOA '  + #13 +
                          ' from UNIDNEGOCIO U ' + CR_LF +
                          ' where 1 = 1 ' + CR_LF + sSQL +
                          ' order by U.UNIDNEGOC');
end;

end.
