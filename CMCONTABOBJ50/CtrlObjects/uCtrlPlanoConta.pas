{
=========================================================================================
Analista.....: Cássio Rovaroto
SIG..........: 123574
Data.........: 04/03/2022
Rotina.......: ListCdsPlanoContas
Descrição....: Inclusão do campo para tratamento de rubrica Extracontábil.            
===============================================================================
Analista.....: André Imakawa
SIG..........: 111721
Data.........: 09/12/2020
Rotina.......: _ExecutaParte5DePar
Descrição....: Criação da função ContaAtiva            
===============================================================================
  Autor.....: Marcelo Cardoso Santos Filho
 SIG.......: 26555
 Data      : 16/02/2017
 Descrição : Inclusão do grupo Patrimônio Social e inclusão do campo Conta para
             Aglutinação.
=========================================================================================
{
 Autor.....: Arnaldo Vicente Scarin
 SOL.......: 122624
 Kintana...: 603582
 Data      : 24/08/2009
 Descrição : Criação dos campos solicitados de acordo com o SOL, para implementacao
             CGPC 28.
=========================================================================================}
{
Rotina..........: ApagarSaldo, Apagar
N. Sol..........: 112861
N. Kintana......: 523260
Data............: 06/04/2009
Responsável.....: Marilza Colpani
Descrição.......: Implementação de uma funcionalidade de exclusão de saldo,
                  desvinculação da conta segregada.
*******************************************************************************}
{
  Âutor     : Marcus Oliveira
  Data      : 05/09/2007
  Pendência : 26282
  Descrição : Carregando apenas os centro de custo ativo.  
//=========================================================================
  Âutor     : Rodolpho da Silva
  Data      : 09/03/2005
  Pendência : 18634
  Descrição : Inserir um novo campo (IDPROGRAMA) na qry que busca na tabela PLANOCONTA
//=========================================================================

// Atualizado em : 08/12/2003 - Alex Pereira - Pend 14451 - Nova segregação
// 20/10 - Alex - correção pendência 14842 - retirado FLGCONTARETIF
// Atualizado em : 05/08/2003 - André Tavares - pendência 14616
// Atualizado em : 02/09/2003 - André Tavares - pendência 14842

}
unit uCtrlPlanoConta;

interface

Uses DB, uDataBase, uDbPlanoConta, uCmControlObject, uCmDbObject,dbclient, sysutils,
     Provider,ComCtrls,CMProcuraMask, CMProcura,DBTables, uCtrlContab, uCMSqlParams,
     uDbContasxSubc, uDbContasxcc, uDbParamContab, uDbCentroCusto,uCMClientDataSet,
      {$IFNDEF VERSAO0505} uCMTypes, Wwquery {$ENDIF};

  Type

    TCtrlPlanoConta = Class(TCmControlObject)

    private
      FNumRegistro    : Double;
      FTipoConta      : string;
      FGrupo          : string;
      FContasFilho    : string; // Marilza Colpani 06/04/2009 N.Sol 112861/N.Kintana 523260
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
      _dbParamContab  : TdbParamContab;
      _dbContasxsc    : TdbContasxsubc;
      _dbContasxcc    : TdbContasxcc;
      _dbPlanoConta   : TDbPlanoConta;
      _dbCentroCusto  : TDbCentroCusto;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
      FCdsPlanoConta  : TCMClientDataSet;
      FCdsContasxCC   : TCMClientDataSet;
      FCdsContasxSC   : TCMClientDataSet;

      Contab           : TCtrlContab;
      FTipoEmpresa     : string;
      procedure SetcdsPlanoConta(const Value: TCMClientDataSet);
      procedure SetcdsContasxCC(const Value: TCMClientDataSet);
      procedure SetcdsContasxSC(const Value: TCMClientDataSet);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsPlanoConta : TCMClientDataSet Read FcdsPlanoConta Write SetcdsPlanoConta;
      property cdsContasxCC  : TCMClientDataSet Read FcdsContasxCC Write SetcdsContasxCC;
      property cdsContasxSC  : TCMClientDataSet Read FcdsContasxSC Write SetcdsContasxSC;

      property NumRegistro  : double         Read FNumRegistro   Write FNumRegistro;
      property TipoEmpresa  : string         Read FTipoEmpresa   Write FTipoEmpresa;
      property TipoConta    : string         Read FTipoConta     Write FTipoConta;
      property Grupo        : string         Read FGrupo         Write FGrupo;
      property ContasFilho : string          Read FContasFilho   Write FContasFilho;

      {Esta função verifica se a conta existe}
      function ContaExiste(iPlano :Double;sPlaConta:string):Boolean;

      // Andre Imakawa - SIG 111721 - Inicio
      {Esta função verifica se a conta esta ativa}
      function ContaAtiva(iPlano :Double;sPlaConta:string):Boolean;
      // Andre Imakawa - SIG 111721 - Fim

      {Esta função retorna os centros de custo do grid}
      function ListCCustoCadContas(iIdEmpresa,iPlano :Integer;sPlaconta:string):OleVariant;

      {Esta função retorna as subcontas do grid}
      function ListSubContaCadContas(dIdEmpresa, dPlano:Double; sPlaConta:string) :OleVariant;

      {Esta função tem com obojetivo verificar o tipo de empresa}
      function VerificaTipoEmpresa(iIdEmpresa :integer):Boolean;

      {Esta função tem como objetivo retorna um filtro para o plano de contas}
      function RetornaFiltroPlanoContas(DadosAux :OleVariant):string;

      {Esta função tem como objetivo criar o codigo reduzido no cad. de contas}
      function CriaCodReduz(iIdEmpresa:integer;sGrupo:string) :Integer;

      {Esta função tem como objetivo editar um registro em paramcontab}
      function GravaCodReduz(dEmpresa:Double;sGrupo:string):Boolean;

      {Esta função verifica se a conta tem saldo, antes de 'deleta-la}
      function ContaTemSaldo(IdEmpresa,iPlano:Integer;sConta:string):Boolean;

      {Esta função verifica se a conta tem lançamentos antes de apaga-la}
      function ContaTemLancamento(idEmpresa,iPlano:integer;sConta:string):Boolean;

      {Esta função verifica se a conta tem outros filhos, antes de apaga-la}
      function ContaTemOutrosFilhos(iPlano:integer;sConta:string):Boolean;

      // Marilza Colpani 06/04/2009 N.Sol 112861/N.Kintana 523260
      {Esta função deleta o saldo das contas que estiverem com valor = 0}
      Function ApagarSaldo(sPlano:integer;sPlanoConta:string) :Boolean;

      {Esta função deleta conta com seus filhos}
      function Apagar :Boolean;

      {Esta função é usada para carregar o cds principal do cad. plano de contas}
      function ListCdsPlanoContas(iPlano:integer;sConta:string):OleVariant;

      {Esta função grava as aslteracoes feitas no cad. de contas}
      function Gravar :Boolean;
    End;


implementation

{ TCtrlEventoSRH }

constructor TCtrlPlanoConta.Create;
begin
  inherited;
  Contab         := TCtrlContab.Create;
  _dbParamContab := TDbParamContab.Create(Self);
  _dbContasxsc   := TDbContasxsubc.Create(Self);
  _dbContasxcc   := TDbContasxcc.Create(Self);
  _dbPlanoConta  := TDbPlanoConta.Create(Self);
  _dbCentroCusto := TDbCentroCusto.Create(Self);
end;

procedure TCtrlPlanoConta.OnCreateAppServer;
begin
  inherited;
  FcdsPlanoConta  := TCMClientDataSet.Create(nil);
  FcdsContasxCC   := TCMClientDataSet.Create(nil);
  FcdsContasxSC   := TCMClientDataSet.Create(nil);

end;

destructor TCtrlPlanoConta.Destroy;
begin
  Contab.Free;
  _dbPlanoConta.Free;
  _dbParamContab.Free;
  _dbContasxsc.Free;
  _dbContasxcc.Free;
  _dbCentroCusto.Free;

  If IsAppServer Then
  Begin
    FcdsPlanoConta.free;
    FcdsContasxCC.free;
    FcdsContasxSC.free;
  End;
  inherited;
end;

function TCtrlPlanoConta.Gravar :Boolean;
var
   Msg  : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarContasContabeis(FcdsPlanoConta.Data,FcdsContasxCC.Data,FcdsContasxSC.Data);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
     Try
         StartTransaction;

         //grava contas
         Result := ApplyCds(FcdsPlanoConta,_dbPlanoConta,[],[] );
         Msg    := _dbPlanoConta.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

         //grava subcontas
         Result := ApplyCds(FcdsContasxSC,_dbContasxSC,[],[] );
         Msg    := _dbContasxSC.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

         //grava centro de custo
         Result := ApplyCds(FcdsContasxCC,_dbContasxCC,[],[]);
         Msg    := _dbContasxCC.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

         Commit;

     except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
   End;
end;

//nova função
Function TCtrlPlanoConta.ApagarSaldo(sPlano:integer;sPlanoConta:string) :Boolean;
var
   sSql: String;
   _QryAtualizaSaldo: TwwQuery;

begin

       _QryAtualizaSaldo := TwwQuery.Create(nil);
       _QryAtualizaSaldo.DatabaseName := DataBaseName;
       sSql := 'DELETE FROM PLANOSALDO WHERE PLACONTA = ' + sPlanoConta + ' AND PLANO = ' + IntToStr(sPlano);
       _QryAtualizaSaldo.SQL.Text := sSQL;
       _QryAtualizaSaldo.ExecSQL;
       _QryAtualizaSaldo.Destroy;

end;


function TCtrlPlanoConta.Apagar :Boolean;
var
   Msg, sPlano, sPlanoConta, sSql: String;
   _QryAtualiza: TwwQuery;

begin
 
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.DeletarContasContabeis(FcdsContasxSC.Data,FcdsContasxCC.Data,FcdsPlanoConta.Data);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
     Try
         StartTransaction;

         //deleta subcontas
         Result := ApplyCds(FcdsContasxSC,_dbContasxSC,[],[] );
         Msg    := _dbContasxSC.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

         //deleta centro de custo
         Result := ApplyCds(FcdsContasxCC,_dbContasxCC,[],[] );
         Msg    := _dbContasxCC.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

          if not FcdsPlanoConta.IsEmpty then
             begin
               _QryAtualiza := TwwQuery.Create(nil);
               _QryAtualiza.DatabaseName := DataBaseName;
                 sPlanoConta := FcdsPlanoConta.fieldvalues ['PLACONTA'];
                   sPlano := FcdsPlanoConta.fieldvalues ['PLANO'];

                   sSql := 'UPDATE PLANOCONTA SET PLACONTASEGREG = '''' WHERE PLACONTASEGREG = ' + sPlanoConta + ' AND PLANO = ' + sPlano;

                   _QryAtualiza.SQL.Text := sSQL;
                   _QryAtualiza.ExecSQL;
                   _QryAtualiza.Destroy;
             end;

         //deleta contas
         Result := ApplyCds(FcdsPlanoConta,_dbPlanoConta,[],[] );
         Msg    := _dbPlanoConta.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

         Commit;

     except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
   End;
end;


function TCtrlPlanoConta.RetornaFiltroPlanoContas(DadosAux :OleVariant):string;
var
  sSql :string;

begin
      result := '';

      _cds.Data := DadosAux;
      _cds.First;
      sSql:='';
      While not _cds.Eof do
      Begin
         if sSql <> '' then sSql := sSql + ' OR ';
         sSql := sSql + 'PLANOCONTA.PLANO = ' + _cds.FieldByName('PLANO').AsString;
         _cds.Next;
      End;
      Result := sSql;

end;
function TCtrlPlanoConta.GravaCodReduz(dEmpresa :Double;sGrupo:string):Boolean;
var
   sMens  : String;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravaCodReduz(dEmpresa,sGrupo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      Try
         StartTransaction;

         _dbParamContab.Idpessoa.AsFloat  := dEmpresa;
         _dbParamContab.LoadFromDb;

         Case sGrupo[1] of
            'A' : _dbParamContab.PACREDUZA.asInteger := _dbParamContab.PACREDUZA.asInteger + 1;
            'P' : _dbParamContab.PACREDUZP.asInteger := _dbParamContab.PACREDUZP.asInteger + 1;
            'R' : _dbParamContab.PACREDUZR.asInteger := _dbParamContab.PACREDUZR.asInteger + 1;
            'D' : _dbParamContab.PACREDUZD.asInteger := _dbParamContab.PACREDUZD.asInteger + 1;
            'C' : _dbParamContab.PACREDUZC.asInteger := _dbParamContab.PACREDUZC.asInteger + 1;
            'E' : _dbParamContab.PACREDUZE.asInteger := _dbParamContab.PACREDUZE.asInteger + 1;
            'O' : _dbParamContab.PACREDUZO.asInteger := _dbParamContab.PACREDUZO.asInteger + 1;
         End;

         Result := _dbParamContab.Update;
         If not Result Then
         Begin
            sMens := _dbParamContab.MessageInfo;
            Raise Exception.Create(sMens);
         End;

         Commit;
     Except
         On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
     End;
   End;
end;


function TCtrlPlanoConta.CriaCodReduz(iIdEmpresa:integer;sGrupo:string):Integer;
var
    _sqlParam :TCMSqlParams;
    _cdsParam :TClientDataSet;

begin
   result := 0;

  _sqlParam := TCMSqlParams.Create(nil);
  _sqlParam.ControlObject := Self;
  _cdsParam  := TClientDataSet.Create(nil);

   with _sqlParam do begin
      SQL.Clear;
      SQL.Add('SELECT PACREDUZA, PACREDUZP, PACREDUZR, PACREDUZD, ');
      SQL.Add('       PACREDUZC, PACREDUZE, PACREDUZO,            ');
      SQL.Add('       PACREDUAF, PACREDUPF, PACREDURF, PACREDUDF, ');
      SQL.Add('       PACREDUCF, PACREDUEF, PACREDUOF             ');
      SQL.Add('FROM PARAMCONTAB                                   ');
      SQL.Add('WHERE IDPESSOA =:IDPESSOA                          ');
      Prepare;
      ParamByName('IDPESSOA').asInteger := iIdEmpresa;
      _cdsParam.Data := Data;
   end;

    case sGrupo[1] of
      'A' : result := _cdsParam.FieldByName('PACREDUZA').asInteger + 1;
      'P' : result := _cdsParam.FieldByName('PACREDUZP').asInteger + 1;
      'R' : result := _cdsParam.FieldByName('PACREDUZR').asInteger + 1;
      'D' : result := _cdsParam.FieldByName('PACREDUZD').asInteger + 1;
      'C' : result := _cdsParam.FieldByName('PACREDUZC').asInteger + 1;
      'E' : result := _cdsParam.FieldByName('PACREDUZE').asInteger + 1;
      'O' : result := _cdsParam.FieldByName('PACREDUZO').asInteger + 1;
      'S' : result := _cdsParam.FieldByName('PACREDUZP').asInteger + 1;  //MARCELO ° - SIG26555
   end;
   _sqlParam.free;
   _cdsParam.free;

end;

function TCtrlPlanoConta.VerificaTipoEmpresa(iIdEmpresa:integer):Boolean;
var
  sSql :string;
begin
      sSql := 'SELECT TIPOEMPRESA ' +
              'FROM  EMPRESAPROP  ' +
              'WHERE (IDPESSOA  = '+ FloatToStr(iIdEmpresa)+')';

     _cds.Data := GetDataPacket(sSql);

     If Not _cds.isEmpty Then
     Begin
        Result := True;
        FTipoEmpresa  := _cds.FieldByName('TIPOEMPRESA').asString;
     End Else
     Begin
        Result        := False;
        FTipoEmpresa  := '';
     End;

end;


function TCtrlPlanoConta.ListCdsPlanoContas(iPlano:integer;sConta:string) :OleVariant;
var
  ssql, sfiltro :string;
begin
     sSql := 'SELECT                  ' +
             '  C.PLANO             , ' +
             '  C.PLACONTA          , ' +
             '  C.IDUSUARIOINCLUSAO , ' +
             '  C.PLATIPO           , ' +
             '  C.PLAGRUPO          , ' +
             '  C.PLAGRAU           , ' +
             '  C.PLANOME           , ' +
             '  C.PLANOMEOUTLING    , ' +
             '  C.PLASUBGR1         , ' +
             '  C.PLASUBGR2         , ' +
             '  C.PLASUBGR3         , ' +
             '  C.PLASUBGR4         , ' +
             '  C.PLAREDUZ          , ' +
             '  C.PLACCUST          , ' +
             '  C.PLAORDALF         , ' +
             '  C.PLATIPCONVGER     , ' +
             '  C.PLATIPCONVGEREN1  , ' +
             '  C.PLATIPCONVGEREN2  , ' +
             '  C.PLATIPCONVOFICIAL , ' +
             '  C.PLAALTERA         , ' +
             '  C.PLAINATIVA        , ' +
             '  C.PLANATUREZA       , ' +
             '  C.PLASUMARIZA       , ' +
             '  C.PLASECRETARIA     , ' +
             '  C.PLAMOEDAHISTORICA , ' +
             '  C.IDRATADMPLANPATRO , ' +
             '  C.PLASUBCONTA       , ' +
             '  C.PLAMUTACOES       , ' +
             '  C.PLACONCILIA       , ' +
             '  C.PLABLOQUE         , ' +
             '  C.PLABLOQUEDATA     , ' +
             '  C.PLACONCORRESP     , ' +
             '  C.PLARATEIOAP       , ' +
             '  C.IDRATEIOAPEXTRA   , ' +
             '  P.MASCARA           , ' +
             '  C.PLACONTRAPARTIDA  , ' +
             '  C.PLATXJUROS        , ' +
             '  C.PLACONTRAPTXJUROS , ' +
             '  C.PLAIMPRELATEVOL   , ' +
             '  C.FLGESTATCOMLANC   , ' +
             '  C.PLACONTASEGREG    , ' +


             // Início - Rodolpho da Silva - P: 18688 - 09/03/2005
             '  C.IDPROGRAMA        , ' +
             // Fim    - Rodolpho da Silva - P: 18688 - 09/03/2005


// Início - 05/08/2003 - André Tavares - pendência 14616
             '  C.OBSERVACAO        , ' +
// Fim - 05/08/2003 - André Tavares - pendência 14616
// Início - 08/12/2003 - Alex Pereira - pendência 14451 - Nova segregação
             '  C.IDSEGREGACRITER    ,' +
// Fim - 08/12/2003 - Alex Pereira - pendência 14451 - Nova segregação

             // Alterado por Arnaldo V. Scarin em 24/08/2009
             // SOL: 122624 Kintana: 603582
             '  C.FLGUSOEXCPGA       ,' +
             '  C.SEGFDOADMDebito    ,' +
             '  C.SEGFDOADMCredito   ,' +
             '  C.PLAAGLUTINACAO      ' + //MARCELO CARDOSO - SIG26555
             ' , C.PLAEXTRACONTABIL   ' + //Cássio Rovaroto - SIG nº 123574
             'FROM                    ' +
             '  PLANOCONTA C, PLANO P ';
     //----------------------------------------------------------
      sfiltro := '';
      If (iPlano <> 0) Then
         sfiltro :=  ' WHERE (C.PLANO = '+FloatToStr(iPlano)+ ') ';
     //----------------------------------------------------------
     If (Trim(sConta) <> '') Then
     Begin
        If sfiltro = '' Then
           sfiltro :=  ' WHERE (RTRIM(C.PLACONTA) = '''+ Trim(sConta) + ''') '
        Else
           sfiltro := sfiltro +  ' AND (RTRIM(C.PLACONTA) = '''+ Trim(sConta) + ''') ';
     End;
     //----------------------------------------------------------
     sfiltro := sfiltro + ' AND (P.PLANO = C.PLANO) ';

     sSql := sSql + sfiltro;

     Result := GetDataPacket(sSql);
end;

function TCtrlPlanoConta.ListSubContaCadContas(dIdEmpresa, dPlano :Double; sPlaConta:string) :OleVariant;
var
  ssql, sOrdena :string;
begin
      ssql := 'SELECT  ' +
              '   S.NOMESUBCONTA, ' +
              '   S.CODSUBCONTA  ' +
              'FROM '+
              '   SUBCONTA S '+
              'WHERE '+
              '(S.IDPESSOA = ' + FloatToStr(dIdEmpresa) + ') AND ' +
              '(NOT EXISTS (SELECT SX.CODSUBCONTA '+
              '             FROM CONTASXSUBC SX  '+
              '             WHERE (SX.IDPESSOA = ' + FloatToStr(dIdEmpresa) + ') AND ' +
              '                   (SX.PLANO = ' + FloatToStr(dPlano) + ') AND ' +
              '                   (SX.PLACONTA = '''+ sPlaconta + ''') AND ' +
              '                   (SX.CODSUBCONTA = S.CODSUBCONTA) AND ' +
              '                   (SX.IDPESSOA = S.IDPESSOA))) ' +
              ' ORDER BY  S.CODSUBCONTA  ';


     sSql := sSql + sOrdena;

     Result := GetDataPacket(sSql);

end;

function TCtrlPlanoConta.ListCCustoCadContas(iIdEmpresa,iPlano :Integer;sPlaconta:string):OleVariant;
var
  ssql, sOrdena :string;
begin

      ssql := 'SELECT                ' +

              //  Rodolpho da Silva - P:20048 - 26/08/2005
              '   C.CODEXTERNO,      ' +
              
              '   C.CODCENTROCUSTO,  ' +
              '   C.NOME,            ' +
              '   C.STATUSGRUPOCDC   ' +
              'FROM  CENTCUST C      ' +
              'WHERE (C.IDEMPRESA =  ' + FloatToStr(iIdEmpresa)+ ') AND ' +
              'NOT EXISTS (SELECT CC.CODCENTROCUSTO '+
              '            FROM CONTASXCC CC '+
              '            WHERE (CC.CODCENTROCUSTO = C.CODCENTROCUSTO) ' +
              '              AND (CC.IDEMPRESA = C.IDEMPRESA) ' +
              '              AND (CC.PLANO = ' + FloatToStr(iPlano) + ') ' +
              '              AND (RTRIM(CC.PLACONTA) = ''' + sPlaConta + ''')) ' +

              //Marcus Oliveira P.26282 05/09/2007
              'AND (C.ATIVO = ''S'') ';

     sOrdena := 'ORDER BY  CODEXTERNO ';

     sSql := sSql + sOrdena;

     Result := GetDataPacket(sSql);

end;


procedure TCtrlPlanoConta.DoChangeDataBase;
begin
  inherited;
  _dbParamContab.DataBaseName := DataBaseName;
  _dbContasxsc.DataBaseName   := DataBaseName;
  _dbContasxcc.DataBaseName   := DataBaseName;
  _dbPlanoConta.DataBaseName  := DataBaseName;
  _dbCentroCusto.DataBaseName := DataBaseName;

end;

procedure TCtrlPlanoConta.SetcdsPlanoConta(const Value: TCMClientDataSet);
begin
   FcdsPlanoConta := Value;
end;

procedure TCtrlPlanoConta.SetcdsContasxSC(const Value: TCMClientDataSet);
begin
  FcdsContasxSC := Value;
end;

procedure TCtrlPlanoConta.SetcdsContasxCC(const Value: TCMClientDataSet);
begin
  FcdsContasxCC := Value;
end;


function TCtrlPlanoConta.ContaExiste(iPlano :Double;sPlaConta:string):Boolean;
var sSql :string;
begin
      sSql := 'SELECT  PLACONTA, PLATIPO, PLAGRUPO  '+
              'FROM PLANOCONTA ' +
              'WHERE (PLANO  = '+ FloatToStr(iPlano)+') ';

      If SPlaConta <> '' Then
        sSql := sSql + 'AND (RTRIM(PLACONTA)  = '''+ Trim(sPlaConta)+''')';

      _cds.Data := GetDataPacket(sSql);

     If _cds.isEmpty Then
     Begin
        Fgrupo     := '';
        FTipoConta := '';
        Result     := False;
     End Else Begin
        Result     := True;
        FTipoConta := _cds.FieldByName('PLATIPO').AsString;
        FGrupo     := _cds.FieldByName('PLAGRUPO').AsString;
     End;
end;

function TCtrlPlanoConta.ContaTemSaldo(idEmpresa,iPlano :Integer;sConta:string):Boolean;
var sSql :string;
begin
      sSql := 'SELECT   PLACONTA ' +
              'FROM  PLANOSALDO  ' +
              'WHERE (IDPESSOA        = '+ IntToStr(idEmpresa) + ') ' +
              '  AND (PLANO           = '+ IntToStr(iPlano) + ') ' +
              '  AND (RTRIM(PLACONTA) = ''' + Trim(sConta) + ''')';

     _cds.Data := GetDataPacket(sSql);

     If _cds.isEmpty Then Begin
        Result := False;
     End Else Begin
        Result      := True;
     End;
end;

function TCtrlPlanoConta.ContaTemLancamento(idEmpresa,iPlano :Integer;sConta:string):Boolean;
var sSql :string;
begin
       sSql := 'SELECT  PLACONTA ' +
               'FROM  LANCAMENTO ' +
               'WHERE (IDPESSOA        = '+ IntToStr(idEmpresa) + ') ' +
               '  AND (PLANO           = '+ IntToStr(iPlano) + ') ' +
               '  AND (RTRIM(PLACONTA) = ''' + Trim(sConta) + ''')';


     _cds.Data := GetDataPacket(sSql);

     If _cds.isEmpty Then Begin
        Result := False;
     End Else Begin
        Result      := True;
     End;
end;

function TCtrlPlanoConta.ContaTemOutrosFilhos(iPlano :Integer;sConta:string):Boolean;
var sSql :string;
begin
       // Marilza Colpani 06/04/2009 N.Sol 112861/N.Kintana 523260
       // Substituído o campo PLACONTA pelo campo PLACONTASEGREG
       sSql := 'SELECT PLACONTA  ' +
               'FROM   PLANOCONTA  ' +
               'WHERE (PLANO          = '+ IntToStr(iPlano) + ') ' +
               '  AND (RTRIM(PLACONTASEGREG) = ''' + Trim(sConta) + ''')';

     _cds.Data := GetDataPacket(sSql);

     If _cds.isEmpty Then Begin
        Result := False;
     End Else Begin
        Result      := True;
        NumRegistro := _cds.RecordCount;
        ContasFilho := '';
          while not _cds.Eof do
          begin
             if ContasFilho = '' then
                ContasFilho := _Cds.fieldbyname ('PLACONTA').AsString
             else
                ContasFilho :=  ContasFilho+ ',' +  _Cds.fieldbyname ('PLACONTA').AsString ;

            _Cds.Next;
          end;
     End;
end;

// Andre Imakawa - SIG 111721 - Inicio
function TCtrlPlanoConta.ContaAtiva(iPlano :Double;sPlaConta:string):Boolean;
var sSql :string;
begin
  Result := False;
  sSql := 'SELECT  PLACONTA, PLATIPO, PLAGRUPO  '+
          'FROM PLANOCONTA ' +
          'WHERE (PLANO  = '+ FloatToStr(iPlano)+') '+
          '  AND ((PLAINATIVA = ''A'') OR (PLAINATIVA IS NULL))' ;

  If SPlaConta <> '' Then
    sSql := sSql + 'AND (RTRIM(PLACONTA)  = '''+ Trim(sPlaConta)+''')';

  _cds.Data := GetDataPacket(sSql);

  If not(_cds.isEmpty) Then
    Result := True;
end;
// Andre Imakawa - SIG 111721 - Fim

procedure TCtrlPlanoConta.AfterInitialize;
begin
  inherited;
   Contab.initializeas(self);
end;

end.
