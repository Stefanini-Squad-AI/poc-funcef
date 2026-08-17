{ --------------------------------------------------------------------------------------------------
Nº SOL......: 230863 e 230956
Nº PPM......: 374049 e 362016
Data........: 21/01/2014
Responsável.: Fernando Xavier
Descrição...: FDO
--------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Integração Orçamento - Inclusão das rotinas
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: AtualizaSaldo
Nº SOL......: 153584/4161
Nº KINTANA..: 1170663
Data........: 15/01/2011
Responsável.: Brunno Mattos
Descrição...: Atualizar valor do campo VLRAJUSTE apenas quando a rotina for chamada da tela de Suplementação.
---------------------------------------------------------------------------------------------------}
{
Rotina............: Destroy
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente liberados
					da memória após sua utilização.
}

//------------------------------------------------------------------------------
//   Data      : 16/087/2005
//   Autor     : Rodolpho da Silva
//   Pendência : 23084
//   Descrição : Corrigido o erro que acontecia em que ao efetuar uma reserva/compromisso para
//               um período em que não tenha dotação cadastrada (ligado o a parâmetro
//               "Saldo acumulado até o perído)
//
//------------------------------------------------------------------------------
//andré tavares - pendência 19150 - 03/01/2006 - TCtrlReservaOrcamen.Procurar.
//Coloquei a coluna VLREFET (valor efetivado da reserva que vem da subquery)

//------------------------------------------------------------------------------
//   Data      : 15/12/2005
//   Autor     : Rodolpho da Silva
//   Pendência : 16460
//   Descrição : Criado um novo método "CriaReserva"
//
//------------------------------------------------------------------------------
//******************************************************************************
//ATUALIZADO: 02/12/2003 - André Tavares - pendência 15676
//ATUALIZADO: 08/06/2004 - André Tavares - pendência 16738
//******************************************************************************

unit uCtrlReservaOrcamen;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  uCtrlResxcomp, uCtrlSaldoorcado, uCtrlDocrecxcomp, uDbReservaorcamen, uCMTypes,
  uFuncoesOrcamento, usistema;

Type
  TCtrlReservaOrcamen = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase;  Override;
      procedure OnCreateAppServer; Override;
      Procedure AfterInitialize  ; Override;
  Private
    CtrlResxcomp       : TCtrlResxcomp;
    CtrlSaldoorcado    : TCtrlSaldoorcado;
    CtrlDocrecxcomp    : TCtrlDocrecxcomp;

    _dbReservaorcamen  : TdbReservaorcamen;
    FCdsReservaorcamen : TClientDataSet;
    FCdsAltReservas    : TClientDataSet;
    FCdsdocRec         : TClientDataSet;
    FCdsTestaDocxComp  : TClientDataSet;

    Procedure SetCdsReservaOrcamen(const Value: TClientDataSet);
    Procedure SetCdsAltReservas(const Value: TClientDataSet);
    Function  TestaDocXComp( CodDocumento,
                             idReservaOrcamen : Double ) : OleVariant;
    procedure SetCdsDocRec(const Value: TClientDataSet);
    procedure SetCdsTestaDocxComp(const Value: TClientDataSet);
  Public
    Constructor Create; Override;
    Destructor  Destroy;Override;

    Procedure StartTransactionOrc;
    Procedure CommitOrc;
    Procedure RollBackOrc;

    Function AplicaOperacaoReservaOrcamen : Boolean;
    Function Procurar(idreservaorcamen:Double): OleVariant;
    Function ProximaReserva(idpessoa: Double): OleVariant;
    Function LerUltimaSequencia : Integer;

    Function EfetivaClick( pIDRESERVAORCAMEN,
                           pidEmpresa: Integer): Boolean;

    Function CancelaClick( pidEmpresa,
                           pIDRESERVAORCAMEN : Integer;
                           psFieldResOuComp  : string;
                           Datareferencia    : string): Boolean;

    Function DevolveClick( pidEmpresa        : Integer;
                           psFieldResOuComp  : string;
                           DataReferencia    : string)  : Boolean;

    Function SaldoReserva(pIdReserva: integer): double;

    Function DevCompClick( pIdEmpresa       : Integer;
                           psFieldResOuComp : string ) : Boolean;

    procedure AtualizaFLGRESERVA(flgreserva: string;
                                 idpessoa, numreserva: integer);

    procedure AtualizaValorCompromisso(valor: double; flgreserva: string;
                                       numreserva: integer);

    procedure AtualizaValorCompromissoOrcamento(valor: double; flgreserva: string; // SOL 230863 e 230956 PPM 374049 e 362016
                                       iddespesaorc: integer);


    procedure CompromissoAguardando(valor: double;
                                    numreserva, idpessoa: integer;
                                    flgefetivacompromisso: boolean);

    procedure CriaCompromisso(idcompromisso, idpessoa, exercicio, periodo,
                              idplanoorcamen, numreserva, idmodulo: integer;
                              idcontaorcamen, datareferencia, obsreserva: string;
                              vlrreserva: double);

    function CriaReservaOuCompromisso(iIdReserCompOrcamen,
                                      iIdpessoa,
                                      iExercicio,
                                      iPeriodo,
                                      iIdplanoorcamen,
                                      iNumReservComp,
                                      iIdmodulo: integer;
                                      sIdcontaorcamen,
                                      sObservacoes,
                                      sFlgReservComp: string;
                                      bAtualizarSaldo,
                                      bAtualizaSaldoPorPeriodo: boolean;
                                      rValor: double;
                                      dDatareferencia: TDateTime = 0;
                                      bCompromissoSemReserva: boolean = False): Boolean;

    function AtualizaSaldo(iIdPessoa,
                           iPlanoOrc,
                           iPeriodo,
                           iExercicio: integer;
                           sIdContaOrcamen,
                           sFlgReservaOuCompromisso: string;
                           dDataReferencia: TDateTime;
                           bAtualizaPorPeriodo,
                           bCriaCompPorReserva: boolean;
                           rValor: Double;
                           bCancelaProcesso: boolean = false;
                           bAjuste: boolean = false): Boolean;

    procedure AtualizaId(idpessoa, id, novoid: integer);
    procedure AltReservas(idpessoa, idreservaorcamen: integer);
    procedure AltCompromisso(idpessoa, idcompromisso: integer);
    procedure DevSaldo(idpessoa, idreservaorcamen: integer;
                       saldocomp: double);
    procedure DevComp(idpessoa, idreservaorcamen: integer; saldocomp: double);
    procedure CancelaReserva(idpessoa, idreservaorcamen: integer);

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    procedure CriaCompromissoFDO(Var AIDRESERVAORCAMEN : Integer;
                                     AIDPessoa,
                                     AIDPlanoOrcamen   : Integer;
                                     AIDContaOrcamen   : String;
                                     AExercicio,
                                     APeriodo          : Integer;
                                     AValorCompromisso : Double;
                                     AIDModulo         : integer;
                                     ADataReferencia   : TDateTime; 
                                     AObservacao       : String = '');
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662


    Property CdsReservaorcamen : TClientDataSet Read FCdsReservaorcamen Write SetCdsReservaorcamen;
    Property CdsAltReservas    : TClientDataSet Read FCdsAltReservas    Write SetCdsAltReservas;
    Property CdsdocRec         : TClientDataSet Read FCdsDocRec         Write SetCdsDocRec;
    Property CdsTestaDocxComp  : TClientDataSet Read FCdsTestaDocxComp  Write SetCdsTestaDocxComp;
  End;

Implementation


Procedure TCtrlReservaOrcamen.DoChangeDataBase;
Begin
  Inherited;
  _dbReservaorcamen.DatabaseName := DataBaseName;
End;
//***********************************************
Procedure TCtrlReservaOrcamen.OnCreateAppServer;
Begin
  Inherited;
  FCdsReservaorcamen := TClientDataSet.Create( Nil );
  FCdsAltReservas    := TClientDataSet.Create( Nil );
  FCdsDocRec         := TClientDataSet.Create( Nil );
End;
//***********************************************
Constructor TCtrlReservaOrcamen.Create;
Begin
  Inherited;
  CtrlResxcomp      := TCtrlResxcomp.Create;
  CtrlSaldoorcado   := TCtrlSaldoorcado.Create;
  CtrlDocrecxcomp   := TCtrlDocrecxcomp.Create;
  _dbReservaorcamen := TdbReservaorcamen.Create(Self);

  CdsTestaDocxComp := TClientDataSet.Create( Nil );
End;
//***********************************************
Destructor TCtrlReservaOrcamen.Destroy;
Begin
  // Ricardo A. SOL: 103843 KTN: 464129
  FreeAndNil( _dbReservaorcamen );
  FreeAndNil( FCdsTestaDocxComp );

  If isAppServer Then
  Begin
    FreeCds( [ FCdsReservaorcamen, FCdsAltReservas, FCdsDocRec ] );
  End;

  FreeAndNil( CtrlResxcomp );
  FreeAndNil( CtrlSaldoorcado );
  FreeAndNil( CtrlDocrecxcomp );

  Inherited;
End;
//***********************************************
Procedure TCtrlReservaOrcamen.AfterInitialize;
Begin

  CtrlResxcomp.InitializeAs( Self );
  CtrlSaldoOrcado.InitializeAs( Self );
  CtrlDocrecxcomp.InitializeAs( Self );
End;


function TCtrlReservaOrcamen.AplicaOperacaoReservaOrcamen: Boolean;
var cdsAux : TClientDataSet; 
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoReservaorcamen
                                                      (FCdsReservaorcamen.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransactionOrc;
         // Tranca uma tabela para que nenhum outro usuário pegue o mesmo número sequencial.
         // o usuário concorrente somente conseque prosseguir após o Commit ou rollback do usuário corrente
         // (liberação da tabela)
         if CdsReservaorcamen.State = dsInsert then
         begin
           GetDataPacket('SELECT * FROM PARAMORCAMENTO FOR UPDATE');
           cdsAux := TClientDataSet.Create(nil);
           // pega o número sequencial
           cdsAux.Data := ProximaReserva(sistema.IdEmpresa);
           FCdsReservaorcamen.Edit;
           FCdsReservaorcamen.fieldByName('NUMRESERVA').asInteger := cdsAux.FieldByName('PROXIMA').asInteger + 1;
           cdsAux.Free;
         end;

	 Result := ApplyCDS(FCdsReservaorcamen,_DbReservaorcamen,[],[]);
         If Not Result Then
           Begin
              MessageInfo := _DbReservaorcamen.MessageInfo;
              Abort;
           End
         Else
           begin
             CommitOrc;

             GravaLogPLANEORC('uCtrlReservaOrcamen.AplicaOperacaoReservaOrcamen: Reserva nº ' +
                               IntToStr(FCdsReservaorcamen.fieldByName('NUMRESERVA').asInteger),
                              Sistema.IdModulo,
                              Sistema.IdUsuario);
           end;
      Except
         On E:Exception Do Begin
            Result := False;
            RollBackOrc;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;

function TCtrlReservaOrcamen.Procurar(idreservaorcamen:Double): OleVariant;
begin

   Result := GetDataPacket(' SELECT                         '+
                           '      VLRRESERVA,               '+
                           '      VLRDEVOLVIDO,             '+
                           '      VLRCOMPROMISSO,           '+
                           '      PERIODO,                  '+
                           '      OBSRESERVA,               '+
                           '      NUMRESERVA,               '+
                           '      IDRESERVAORCAMEN,         '+
                           '      IDPROCESSO,               '+
                           '      IDPLANOORCAMEN,           '+
                           '      IDPESSOA,                 '+
                           '      IDMODULO,                 '+
                           '      IDCONTAORCAMEN,           '+
                           '      FLGRESERVA,               '+
                           '      FLGRESCOMP,               '+
                           '      EXERCICIO,                '+
                           '      DATAREFERENCIA,           '+
                           '      NOMEUSUARIO,              '+
                           '      VLREFET                   '+
                           ' FROM                           '+
                           '    RESERVAORCAMEN R , USUARIOSISTEMA U, '+
                           '    ( '+
                           '      SELECT RESXCOMP.IDRESERVA, SUM(RESERVAORCAMEN.VLRRESERVA) AS VLREFET '+
                           '      FROM RESXCOMP, RESERVAORCAMEN '+
                           '      WHERE RESXCOMP.IDCOMPROMISSO = RESERVAORCAMEN.IDRESERVAORCAMEN '+
                           '      GROUP BY RESXCOMP.IDRESERVA '+
                           '      UNION '+
                           '      SELECT IDRESERVAORCAMEN AS IDRESERVA, VLRRESERVA AS VLREFET '+
                           '      FROM RESERVAORCAMEN          '+
                           '      WHERE FLGRESERVA = ''E'' AND '+
                           '            FLGRESCOMP = ''R'' '+
                           '    )RXC '+
                           ' WHERE  (R.IDRESERVAORCAMEN = '+ floatToStr(idreservaorcamen) +') AND '+
                           '        (U.IDUSUARIO(+) = SUBSTR(R.TRGUSERINCLUSAO, 3, 30)) '+
                           '        AND (R.IDRESERVAORCAMEN = RXC.IDRESERVA(+)) ' ); 
end;
//************************************************
Procedure TCtrlReservaOrcamen.SetCdsReservaorcamen( Const Value: TClientDataSet);
Begin
  FCdsReservaorcamen := Value;
End;
//************************************************
Procedure TCtrlReservaOrcamen.SetCdsAltReservas( Const Value: TClientDataSet);
Begin
  FCdsAltReservas := Value;
End;
//************************************************
Procedure TCtrlReservaOrcamen.SetCdsDocRec( Const Value: TClientDataSet);
Begin
  FCdsDocRec := Value;
End;
//************************************************
Procedure TCtrlReservaOrcamen.SetCdsTestaDocxComp( Const Value: TClientDataSet);
Begin
  FCdsTestaDocxComp := Value;
End;



function TCtrlReservaOrcamen.ProximaReserva(idpessoa: Double): OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT                                        ' +
           '   MAX(NUMRESERVA) AS PROXIMA                 ' +
           'FROM                                          ' +
           '   RESERVAORCAMEN                             ' +
           'WHERE                                         ' +
           '   IDPESSOA = ' + TrocaVPP(FloatToStr(idpessoa));
   Result := GetDataPacket(sSql);
end;

procedure TCtrlReservaOrcamen.AtualizaFLGRESERVA(flgreserva: string;
  idpessoa, numreserva: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET ' +
          'FLGRESERVA = ''' + flgreserva + ''' WHERE  ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(NUMRESERVA = ' + IntToStr(numreserva) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.AtualizaValorCompromisso(valor: double;
  flgreserva: string; numreserva: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''' + flgreserva + ''', ' +
          'VLRCOMPROMISSO = VLRCOMPROMISSO + ' + TrocaVPP(FloatToStr(valor)) +
          ' WHERE NUMRESERVA = ' + IntToStr(numreserva);
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.AtualizaValorCompromissoOrcamento(valor: double;   // SOL 230863 e 230956 PPM 374049 e 362016
  flgreserva: string; iddespesaorc: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''' + flgreserva + ''', ' +
          'VLRCOMPROMISSO = VLRCOMPROMISSO + ' + TrocaVPP(FloatToStr(valor)) +
          ' WHERE IDRESERVAORCAMEN = ' + IntToStr(iddespesaorc);
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.CompromissoAguardando(valor: double; numreserva,
  idpessoa: integer; flgefetivacompromisso: boolean);
var
  sSQl, Efetiva : String;

begin
  sSql := 'UPDATE RESERVAORCAMEN SET  ' +
          'VLRCOMPROMISSO = VLRCOMPROMISSO + ' + TrocaVPP(FloatToStr(valor)) +
          ' ';
  if flgefetivacompromisso then begin
    sSql := sSql + ',FLGRESERVA = ''E'' ';
  end;
  sSql := sSql + 'WHERE (NUMRESERVA = ' + IntToStr(numreserva) + ') AND ' +
                 '(IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);

  if FlgEfetivaCompromisso then
    Efetiva := 'TRUE'
  else
    Efetiva := 'FALSE';

  GravaLogPLANEORC('uCtrlReservaOrcamen.CompromissoAguardando: Compromisso nº ' +
                   IntToStr(NumReserva) + ' - ' +
                   'Valor: ' + FloatToStr(Valor) + ' - ' +
                   'FlgEfetiva: ' + Efetiva,
                   Sistema.IdModulo,
                   Sistema.IdUsuario);

end;

procedure TCtrlReservaOrcamen.CriaCompromisso( idcompromisso,
                                               idpessoa,
                                               exercicio,
                                               periodo,
                                               idplanoorcamen,
                                               numreserva,
                                               idmodulo       : integer;
                                               idcontaorcamen,
                                               datareferencia,
                                               obsreserva     : string;
                                               vlrreserva     : double);
Var
  sSQl : String;

begin
  sSql := 'INSERT INTO RESERVAORCAMEN ' +
          '(IDRESERVAORCAMEN, ' +

          'IDOPERACAO, '  +

          'IDPESSOA, EXERCICIO, PERIODO, IDPLANOORCAMEN, ' +
          'IDCONTAORCAMEN, DATAREFERENCIA, VLRRESERVA, FLGRESERVA, ' +
          'OBSRESERVA, NUMRESERVA, FLGRESCOMP, IDMODULO, ' +
          'VLRCOMPROMISSO) VALUES ' +
          '(' + IntToStr(idcompromisso) + ', ' +

          FloatToStr(GetSequence('IDOPERACAOORC')) + ','  +

          IntToStr(idpessoa) +
          ', ' + IntToStr(exercicio) + ', ' + IntToStr(periodo) +
          ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorcamen +
          ''', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' + 
          TrocaVPP(FloatToStr(vlrreserva)) +
          ', ''A'', ''' + obsreserva + ''', ' + IntToStr(numreserva) +
          ', ''C'', ' + IntToStr(idmodulo) + ', 0)';
  ExecSQL(sSql);

  GravaLogPLANEORC('uCtrlReservaOrcamen.CriaCompromisso: Compromisso nº ' +
                   IntToStr(NumReserva),
                   Sistema.IdModulo,
                   Sistema.IdUsuario);

end;

procedure TCtrlReservaOrcamen.AtualizaId(idpessoa, id, novoid: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET IDRESERVAORCAMEN = ' + IntToStr(novoid) +
          ' WHERE (IDPESSOA = ' + IntToStr(idpessoa) +
          ') AND (IDRESERVAORCAMEN = ' + IntToStr(id) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.AltReservas(idpessoa, idreservaorcamen: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''E'', ' +
          'VLRCOMPROMISSO = (VLRRESERVA - NVL(VLRDEVOLVIDO,0)) WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDRESERVAORCAMEN = ' +
          IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.AltCompromisso(idpessoa, idcompromisso: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN  SET FLGRESERVA = ''A'' ' +
          'WHERE  IDRESERVAORCAMEN IN (SELECT RC.IDRESERVA ' +
          'FROM RESXCOMP RC  WHERE ' +
          '(RC.IDCOMPROMISSO = ' + IntToStr(idcompromisso) + ') ' +
          'AND  (RC.IDPESSOA = ' + IntToStr(idpessoa) + ')) ' +
          'AND  (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.DevSaldo(idpessoa, idreservaorcamen: integer;
  saldocomp: double);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''E'', ' +
          'VLRDEVOLVIDO = ' + TrocaVPP(FloatToStr(saldocomp)) + ' WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDRESERVAORCAMEN = ' +
          IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.DevComp(idpessoa, idreservaorcamen: integer;
  saldocomp: double);
var sSQl : String;
begin
  sSql := 'UPDATE' + #13 + #10 +
          '  RESERVAORCAMEN' + #13 + #10 +
          'SET' + #13 + #10 +
          '  VLRDEVOLVIDO   = VLRDEVOLVIDO   + ' + TrocaVPP(FloatToStr(saldocomp)) + ',' + #13 + #10 +
          '  VLRCOMPROMISSO = VLRCOMPROMISSO - ' + TrocaVPP(FloatToStr(saldocomp))       + #13 + #10 +
          'WHERE' + #13 + #10 +
          '  ( IDPESSOA         = ' + IntToStr(idpessoa) + ') AND' + #13 + #10 +
          '  ( IDRESERVAORCAMEN = ' + IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.CancelaReserva(idpessoa,
  idreservaorcamen: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''C'' WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDRESERVAORCAMEN = ' +
          IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;
//************************************************
Function TCtrlReservaOrcamen.LerUltimaSequencia : Integer;
Begin
  Result := GetSequence( 'RESERVAORCAMEN' );
End;
//************************************************
Procedure TCtrlReservaOrcamen.StartTransactionOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.StartTransactionOrc;

  End Else Begin

    StartTransaction;
  End;
End;
//************************************************
Procedure TCtrlReservaOrcamen.CommitOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.CommitOrc;

  End Else Begin

    Commit;
  End;
End;
//************************************************
Procedure TCtrlReservaOrcamen.RollBackOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.RollBackOrc;

  End Else Begin

    RollBack;
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.EfetivaClick( pIDRESERVAORCAMEN,
                                           pidEmpresa         : Integer ) : Boolean;
Begin

  Try
    //Renan Cristiano SOL 151941 Kintana 1121546

    AltReservas( pidEmpresa,
                 pIDRESERVAORCAMEN );

    //Renan Cristiano SOL 151941 Kintana 1121546

    Result := True;
  Except
    Result := False;
    //Renan Cristiano SOL 151941 Kintana 1121546
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.CancelaClick( pidEmpresa,
                                           pIDRESERVAORCAMEN : Integer;
                                           psFieldResOuComp  : string;
                                           DataReferencia    : string) : Boolean;
Var
  rValorReservas : Double;

Begin

  //Renan Cristiano SOL 151941 Kintana 1121546

  Try
    //Muda a flag da reserva/compromisso
    CancelaReserva( pidEmpresa, pIDRESERVAORCAMEN );

    //Ir na tabela de RESXCOMP
    rValorReservas := cdsAltReservas.FieldByName('TOTALRESERVA').AsFloat;


    AltCompromisso( pidEmpresa, pIDRESERVAORCAMEN );
    CtrlResxcomp.AltReservas(pidEmpresa, pIDRESERVAORCAMEN );
    //Estorna o Valor no Saldo Orçamentário
    CtrlSaldoorcado.AltSaldos( (CdsReservaOrcamen.FieldByName('VLRRESERVA').asFloat -
                                CdsReservaOrcamen.FieldByName('VLRDEVOLVIDO').asFloat),
                               rValorReservas,
                               pidEmpresa,
                               CdsReservaOrcamen.FieldByName('IDPLANOORCAMEN').asInteger,
                               DataReferencia,
                               CdsReservaOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                               psFieldResOuComp,
                               CdsReservaOrcamen.FieldByName('FLGRESCOMP').asString );
    //Renan Cristiano SOL 151941 Kintana 1121546
    Result := True;

    GravaLogPLANEORC('uCtrlReservaOrcamen.CancelaClick: ID_Reserva ' +
                     CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').asString,
                     Sistema.IdModulo,
                     Sistema.IdUsuario);

  Except
    Result := False;
    //Renan Cristiano SOL 151941 Kintana 1121546
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.DevolveClick( pidEmpresa       : Integer;
                                           psFieldResOuComp : string;
                                           DataReferencia   : string) : Boolean;
Begin
  Try
    StartTransactionOrc;
    // Atualiza a Tabela RESERVAORCAMEN
    // ---> Muda a Flag da Reserva/Compromisso para EFETIVADO
    // ---> Coloca o valor no campo VLRDEVOLVIDO
    DevSaldo( pidEmpresa,
              CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').asInteger,
              ( CdsReservaOrcamen.FieldByName('VLRRESERVA').AsFloat -
                CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat) );

    // Atualiza a Tabela SALDOORCADO
    // Estorna o Valor no Saldo Orçamentário
    CtrlSaldoorcado.EstornaSaldo( pidEmpresa,
                                  CdsReservaOrcamen.FieldByName('IDPLANOORCAMEN').asInteger,
                                  // Necessário passar o primeiro dia do período
                                  DataReferencia,
                                  CdsReservaOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                                  psFieldResOuComp,
                                  (CdsReservaOrcamen.FieldByName('VLRRESERVA').AsFloat -
                                   (CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat +
                                   CdsReservaOrcamen.FieldByName('VLRDEVOLVIDO').AsFloat)));
    CommitOrc;
    Result := True;

    GravaLogPLANEORC('uCtrlReservaOrcamen.DevolveClick: ID_Reserva nº ' +
                     CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').AsString,
                     Sistema.IdModulo,
                     Sistema.IdUsuario);

  Except
    Result := False;
    RollBackOrc;
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.DevCompClick( pIdEmpresa       : Integer;
                                           psFieldResOuComp : String ) : Boolean;
Var
  rValorRec,
  rValorInd,
  rValorDev : Double;
Begin
  Try
    StartTransactionOrc;
    rValorRec := 0;
    cdsDocRec.First;

    While ( Not cdsDocRec.EOF ) Do
      Begin
        If ( cdsDocRec.FieldByName('MARCA').AsString = 'S') and
           ( rValorRec < CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat ) Then
          Begin
            rValorRec := rValorRec + cdsDocRec.FieldByName('VALOR').AsFloat;

            If rValorRec > CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat Then
              Begin
                rValorInd := cdsDocRec.FieldByName('VALOR').AsFloat - ( rValorRec - CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat );
              End
            Else
              Begin
                rValorInd := cdsDocRec.FieldByName('VALOR').AsFloat;
              End;

            cdsTestaDocxComp.Data := TestaDocxComp( cdsDocRec.FieldByName('CODDOCUMENTO').AsFloat,
                                                CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').AsFloat );

            If cdsTestaDocXComp.IsEmpty Then
              Begin
                CtrlDocRecXComp.InsDocumentos( CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').AsFloat,
                                               cdsDocRec.FieldByName('CODDOCUMENTO').AsFloat,rValorInd );
              End
            Else
              Begin
                CtrlDocRecXComp.AltDocumentos( CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').AsFloat,
                                               cdsDocRec.FieldByName('CODDOCUMENTO').AsFloat,rValorInd );
              End;
          End;

        cdsDocRec.Next;
      End; // while
                                                                  

    If rValorRec > CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat Then
      rValorDev := CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat
    Else
      rValorDev := rValorRec;

    //Muda a flag da reserva/compromisso
    DevComp( pidEmpresa,
             CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').asInteger,
             rValorDev );

    //Estorna o Valor no Saldo Orçamentário
    CtrlSaldoorcado.EstornaSaldo( pidEmpresa,
                                  CdsReservaOrcamen.FieldByName('IDPLANOORCAMEN').asInteger,
                                  CdsReservaOrcamen.FieldByName('DATAREFERENCIA').asString,
                                  CdsReservaOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                                  psFieldResOuComp,
                                  rValorDev );

    CommitOrc;
    Result := True;

    GravaLogPLANEORC('uCtrlReservaOrcamen.DevCompClick: ID_Compromisso nº ' +
                     CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').AsString,
                     Sistema.IdModulo,
                     Sistema.IdUsuario);

  Except
    Result := False;
    RollBackOrc;
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.TestaDocXComp( CodDocumento,
                                            idReservaOrcamen: Double) : OleVariant;
Var
  sSql: string;
Begin
  sSql := 'SELECT CODDOCUMENTO FROM DOCRECXCOMP ' +
          'WHERE (CODDOCUMENTO     = ' + FloatToStr(coddocumento) +
          ') AND (IDRESERVAORCAMEN = ' + FloatToStr(idreservaorcamen) + ')';
  Result := GetDataPacket(sSql);
End;
//************************************************



function TCtrlReservaOrcamen.SaldoReserva(pIdReserva: integer): double;
var
  sSql: string;
  CdsAux: TClientDataSet;

begin
  try
    CdsAux := TClientDataSet.Create(nil);

    sSql := ' SELECT NVL(VLRRESERVA,0) - (NVL(VLRCOMPROMISSO,0) + NVL(VLRDEVOLVIDO,0)) AS SALDORESERVA ' +
            '   FROM RESERVAORCAMEN ' +
            '  WHERE IDRESERVAORCAMEN = ' + IntToStr(pIdReserva) +
            '    AND FLGRESCOMP = ''R'' ';

    CdsAux.Data := GetDataPacket(sSql);

    if CdsAux.FieldByName('SALDORESERVA').IsNull then
      Result := 0
    else
      Result := CdsAux.FieldByName('SALDORESERVA').AsFloat;

  finally
    FreeAndNil(CdsAux);
  end;
end;




function TCtrlReservaOrcamen.CriaReservaOuCompromisso(iIdReserCompOrcamen,
                                                      iIdpessoa,
                                                      iExercicio,
                                                      iPeriodo,
                                                      iIdplanoorcamen,
                                                      iNumReservComp,
                                                      iIdmodulo: integer;
                                                      sIdcontaorcamen,
                                                      sObservacoes,
                                                      sFlgReservComp: string;
                                                      bAtualizarSaldo,
                                                      bAtualizaSaldoPorPeriodo: boolean;
                                                      rValor: double;
                                                      dDatareferencia: TDateTime = 0;
                                                      bCompromissoSemReserva: boolean = False): Boolean;
Var
  sSQl : String;
  rVlrReserva,rVlrCompromisso: Double;

begin
   rVlrReserva     := 0;
   rVlrCompromisso := 0;
   rVlrReserva := rValor;    

   // Cria reserva ou compromisso orçamentário
   sSql := 'INSERT INTO RESERVAORCAMEN ' +
           '   (IDRESERVAORCAMEN, ' +
           '    IDPESSOA, ' +
           '    EXERCICIO, ' +
           '    PERIODO, ' +
           '    IDPLANOORCAMEN, ' +
           '    IDCONTAORCAMEN, ' +
           '    DATAREFERENCIA, ' +
           '    VLRRESERVA, ' +
           '    FLGRESERVA, ' +
           '    OBSRESERVA, ' +
           '    NUMRESERVA, ' +
           '    FLGRESCOMP, ' +
           '    IDMODULO, ' +
           '    VLRCOMPROMISSO) ' +
           'VALUES ' +
           '(' + IntToStr(iIdReserCompOrcamen) + ', ' +
           IntToStr(iIdpessoa) + ', ' +
           IntToStr(iExercicio) + ', ' +
           IntToStr(iPeriodo) + ', ' +
           IntToStr(iIdplanoorcamen) + ', ' +
           QuotedStr(sIdcontaorcamen) +
           ', TO_DATE(' + QuotedStr(DateToStr(dDatareferencia)) + ',''DD/MM/YYYY''), ' +
           TrocaVPP(FloatToStr(rVlrReserva)) + ', ' +
           '''A'', ''' +
           sObservacoes + ''', ' +
           IntToStr(iNumReservComp) + ', ' +
           QuotedStr(sFlgReservComp) + ', ' +
           IntToStr(iIdmodulo) + ', ' +
           TrocaVPP(FloatToStr(rVlrCompromisso)) + ') ';

   Result := ExecSQL(sSql);



   if bAtualizarSaldo then
   begin
      // Atualizando o saldo da conta orçamentária na tabela SALDOORCADO
      if Result then
      begin
         Result := AtualizaSaldo(iIdpessoa,
                                 iIdplanoorcamen,
                                 iPeriodo,
                                 iExercicio,
                                 sIdcontaorcamen,
                                 sFlgReservComp,
                                 dDatareferencia,
                                 bAtualizaSaldoPorPeriodo,
                                 (bCompromissoSemReserva and (sFlgReservComp = 'C')),
                                 rValor);
      end
      else
        Exit;
   end;

end;




function TCtrlReservaOrcamen.AtualizaSaldo(iIdPessoa, iPlanoOrc, iPeriodo,
  iExercicio: integer; sIdContaOrcamen, sFlgReservaOuCompromisso: string;
  dDataReferencia: TDateTime; bAtualizaPorPeriodo, bCriaCompPorReserva: boolean;
  rValor: Double; bCancelaProcesso: boolean = false; bAjuste: boolean = false): Boolean;
var
  sSQL: string;
  rVlrReserva,rVlrCompromisso: Double;
  iQtdTotal: integer;
  bUpdatePerido: boolean;

begin
   rVlrReserva     := 0;
   rVlrCompromisso := 0;

   // Marcar para não atualizar no período informado (default)
   bUpdatePerido := False;

   //  Se a atualização for por período, verifica a quantidade de lançamentos na tabela SALDOORCADO,
   //para poder fazer o rateio do valor corretamente para cada linha
   if bAtualizaPorPeriodo then
   begin
      _Cds.Data := GetDataPacket('SELECT DECODE(COUNT(IDPESSOA),0,1,COUNT(IDPESSOA)) AS QTDLANCSALDO ' +
                                 'FROM SALDOORCADO ' +
                                 'WHERE ' +
                                 '   (IDPESSOA       = ' + IntToStr(iIdPessoa)  + ') AND ' +
                                 '   (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)  + ') AND ' +
                                 '   (PERIODO        = ' + IntToStr(iPeriodo)   + ') AND ' +
                                 '   (EXERCICIO      = ' + IntToStr(iExercicio) + ') AND ' +
                                 '   (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen) + ') ');
      iQtdTotal := _Cds.FieldByName('QTDLANCSALDO').AsInteger;

      // Se não houver dotação para o período/exercício informado, verificar TODOS as dotações
      //efetuadas para o exercício, rateando assim, o valor do compromisso/reserva em partes
      //iguais para todas as linhas de dotações
      if iQtdTotal = 0 then
      begin
         _Cds.Data := GetDataPacket('SELECT DECODE(COUNT(IDPESSOA),0,1,COUNT(IDPESSOA)) AS QTDLANCSALDO ' +
                                    'FROM SALDOORCADO ' +
                                    'WHERE ' +
                                    '   (IDPESSOA       = ' + IntToStr(iIdPessoa)  + ') AND ' +
                                    '   (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)  + ') AND ' +
                                    '   (EXERCICIO      = ' + IntToStr(iExercicio) + ') AND ' +
                                    '   (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen) + ') ');
         iQtdTotal := _Cds.FieldByName('QTDLANCSALDO').AsInteger;
      end
      else
         // Marcar para atualizar o período informado
         bUpdatePerido := True;

      // Divide o valor do compromisso/reserva pela
      //quantidade de valor de lancamentos...
      if rValor > 0 then
         rValor := (rValor / iQtdTotal);
   end;


   // Atribui o valor à variável de referência correta
   if sFlgReservaOuCompromisso = 'C' then
      rVlrCompromisso := rValor
   else
      rVlrReserva     := rValor;


   // Se estiver criando um compromisso através de uma reserva, retirar o valor
   //solicitado da coluna VLRSERSERVA e inserir na coluna VLRCOMPROMISSO
   if ((sFlgReservaOuCompromisso = 'C') and bCriaCompPorReserva) then
      rVlrReserva := (rValor * -1);


   if bCancelaProcesso then
   begin
      // Se estiver cancelando um compromisso por reserva, retirar o valor APENAS
      //da coluna VLRCOMPROMETIDO, pois quando se efetuou o compromisso por reserva,
      //o valor da coluna VlrReservado já foi passado para a coluna VlrComprometido
      if ((sFlgReservaOuCompromisso = 'C') and bCriaCompPorReserva) then
      begin
         rVlrReserva     := 0;
         rVlrCompromisso := (rVlrCompromisso * -1);
      end
      else
      begin
         rVlrReserva     := (rVlrReserva * -1);
         rVlrCompromisso := (rVlrCompromisso * -1);
      end;
   end;


   
   sSQL := ' UPDATE ' +
           '    SALDOORCADO ' +
           ' SET ' +
           '   VLRRESERVADO    = (NVL(VLRRESERVADO,0)    + ' + TrocaVPP(FloatToStr(rVlrReserva))     + '), ' +
           '   VLRCOMPROMETIDO = (NVL(VLRCOMPROMETIDO,0) + ' + TrocaVPP(FloatToStr(rVlrCompromisso)) + ')  ';
   //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui if
   if bAjuste then
     sSql := sSql +
           ',  VLRAJUSTE        = (NVL(VLRAJUSTE,0) + ' + TrocaVPP(FloatToStr(rVlrCompromisso)) + ')  ';
   sSql := sSql +
           ' WHERE  ' +
           '   (IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
           '   (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') AND ' +
           '   (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen) + ') ';

           if bAtualizaPorPeriodo then
           begin
              if bUpdatePerido then
                 sSQl := sSQl + ' AND (PERIODO   = ' + IntToStr(iPeriodo)    + ') ';

               sSQL := sSQL + '  AND (EXERCICIO = ' + IntToStr(iExercicio) + ') ';
           end
           else
              sSQl := sSQl + ' AND (DATAREFERENCIA = TO_DATE(' + QuotedStr(DateToStr(dDatareferencia)) + ',''DD/MM/YYYY'')) ';


   Result := ExecSQL(sSQL);
end;

procedure TCtrlReservaOrcamen.CriaCompromissoFDO(Var AIDRESERVAORCAMEN : Integer;
                                                 AIDPessoa,
                                                 AIDPlanoOrcamen : Integer;
                                                 AIDContaOrcamen : String;
                                                 AExercicio,
                                                 APeriodo         : Integer;
                                                 AValorCompromisso: Double;
                                                 AIDModulo        : integer;
                                                 ADataReferencia  : TDateTime;
                                                 AObservacao      : String);
Var
  sSQl : String;
begin
  AIDRESERVAORCAMEN := Self.LerUltimaSequencia;

  sSql := 'INSERT INTO RESERVAORCAMEN '
        + ' (IDRESERVAORCAMEN,'
        + '  IDOPERACAO,'
        + '  FLGRESCOMP,'
        + '  FLGRESERVA,'
        + '  IDPESSOA,'
        + '  IDPLANOORCAMEN,'
        + '  IDCONTAORCAMEN,'
        + '  EXERCICIO,'
        + '  PERIODO,'
        + '  VLRCOMPROMISSO,'
        + '  OBSRESERVA,'
        + '  DATAREFERENCIA,'
        + '  IDMODULO)'
        + ' VALUES '
        + ' ('
        +  IntToStr(AIDRESERVAORCAMEN)              + ','
        +  FloatToStr(GetSequence('IDOPERACAOORC')) + ','
        +  QuotedStr('C')                           + ',' // C -> Compromisso
        +  QuotedStr('A')                           + ',' // A -> Autorizada
        +  IntToStr(AIDPessoa)                      + ','
        +  IntToStr(AIDPlanoOrcamen)                + ','
        +  Quotedstr(AIDContaOrcamen)               + ','
        +  IntToStr(AExercicio)                     + ','
        +  IntToStr(APeriodo)                       + ','
        +  TrocaVPP(FloatToStr(AValorCompromisso))  + ','
        +  Quotedstr(AObservacao)                   + ','
        +  ' TO_DATE(' + QuotedSTr(DateToStr(Adatareferencia)) + ',''DD/MM/YYYY''),'
        +  IntToStr(AIDModulo)
        + ' )';

  if NOT ExecSQL(sSql) Then
     RAISE Exception.Create(MessageInfo);

  GravaLogPLANEORC('uCtrlReservaOrcamen.CriaCompromissoFDO: Compromisso nº ' + IntToStr(AIDRESERVAORCAMEN)
                   + ' ' + AObservacao,
                   Sistema.IdModulo,
                   Sistema.IdUsuario);
  //
end;

End.
