// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaSaldoConfirmaClick
Data      : 19/09/2003
Autor     : André Pontes
Pendencia : 15033
Descrição : Pendência ainda incompleta

      - nova:

     function AcertaSaldoConfirmaClick(const pIdEmpresa          : Integer;
                                       const pedtCodigoContaText : String;
                                       const iExercicio          : Integer;
                                       const iPeriodoIni         : Integer;
                                       const iPeriodoFim         : Integer
                                      ) : Boolean;

      - antiga:

     function AcertaSaldoConfirmaClick(pIdEmpresa          : Integer;
                                       pedtCodigoContaText,
                                       edtCodigoContaText  : String) : Boolean;

---------------------------------------------------------------------------------------------------}

unit uCtrlSaldoOrcado;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider, StdCtrls,
   ComCtrls, uDbSaldoorcado, uCMTypes, uString, uFuncoesOrcamento, uDtmBuscaContabil,
   uCtrlSaldoorcadoant, uCtrlParamorcamento, uCtrlValorescenario, Classes, udtmAcertaSaldo,
   Controls;

type
   TCtrlSaldoOrcado = class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;


   private

     CtrlValorescenario: TCtrlValoresCenario;
     CtrlSaldoorcadoant: TCtrlSaldoorcadoant;
     CtrlParamorcamento: TCtrlParamorcamento;
     DtmBuscaContabil  : TDtmBuscaContabil;
     DtmAcertaSaldo    : TDtmAcertaSaldo;

     FedtLegenda    : TEdit;
     FedtPosicao    : TEdit;
     FpbAguarde     : TProgressBar;
     FIdEmpresa     : Integer;
      FPlanoOrc      : Integer;

      _dbSaldoorcado    : TdbSaldoorcado;
      FCdsSaldoOrcado   : TClientDataSet;
      FCdsCenario       : TClientDataSet;
      FCdsSaldos        : TClientDataSet;
      FCdsContasOrcamen : TClientDataSet;
      FCdsComposicao    : TClientDataSet;
      FCdsPeriodo       : TClientDataSet;
      FCdsContabilidade : TClientDataSet;
      FCdsAux           : TClientDataSet;

      procedure SetCdsSaldoorcado  (const Value: TClientDataSet);
      procedure SetCdsCenario      (const Value: TClientDataSet);
      procedure SetCdsSaldos       (const Value: TClientDataSet);
      procedure SetCdsContasOrcamen(const Value: TClientDataSet);
      procedure SetCdsComposicao   (const Value: TClientDataSet);
      procedure SetCdsPeriodo      (const Value: TClientDataSet);
      procedure SetCdsContabilidade(const Value: TClientDataSet);
      procedure SetCdsAux          (const Value: TClientDataSet);


   public

     Constructor Create; override;
     Destructor  Destroy;override;

     function AplicaOperacaoSaldoOrcado : Boolean;

     function Procurar(IDPessoa        : Double;
                       IDPlanoorcamen  : Double;
                       IDContaorcamen  : String;
                       DataReferencia  : TDateTime
                      ): OleVariant;

     function AbreCenario : OleVariant;

     function AcertaSaldoConfirmaClick(const pIdEmpresa          : Integer;
                                       const pedtCodigoContaText : String;
                                       const iExercicio          : Integer;
                                       const iPeriodoIni         : Integer;
                                       const iPeriodoFim         : Integer
                                      ) : Boolean;

     function  EfetivaClick(pedtCodigoContaText,
                            PedtCodigoContaDeText,
                            pedtCodigoContaParaText,
                            PdblcPeriodoIniText,
                            pEdConteudo1Text,
                            pEdConteudo2Text,
                            pEdConteudo3Text,
                            pEdConteudo4Text : String;
                            psePosIni1Value,
                            psePosIni2Value,
                            psePosIni3Value,
                            psePosIni4Value,
                            psePosFim1Value,
                            psePosFim2Value,
                            psePosFim3Value,
                            psePosFim4Value,
                            pspnedExercicioValue: Double;
                            pdblcPeriodoIniLookupValue,
                            pdblcPeriodoFimLookupValue : String;
                            pcbCenariosChecked,
                            pcbBuscaSaldoAnteriorChecked : Boolean;
                            pdblcPeriodoLimiteText,
                            pdblcPeriodoLimiteLookUpValue : String) : Boolean;

      function IncluirOrcamentoRH(IdEmpresa           : Integer;
                                  IdPlanoOrcamentario : Double;
                                  ContaOrcamentaria   : String;
                                  DataRef             : TDate;
                                  Valor               : Double) : Boolean;
     procedure StartTransactionOrc;
     procedure CommitOrc;
     procedure RollBackOrc;

     procedure AtualizaSaldo(idplanoorcamen, idpessoa: integer; idcontaorcamen,
       datareferencia: string; valor: double);

     procedure InsereSaldo(exercicio, periodo : Integer; idplanoorcamen,
       idpessoa : Double; idcontaorcamen, datareferencia: string; vlrorcado,
       vlrrealizado, vlrreservado, vlrcomprometido, vlrorcacum,
       vlrrealacum: double);
     procedure TrocaSaldoReservadopCompromissado(pValorRes,
       pValorCom: double; idpessoa, idplanoorcamen: integer; datareferencia,
       idcontaorcamen: string);
     procedure RetiraValor(valorreserva: double; idpessoa,
       idplanoorcamen: integer; datareferencia, idcontaorcamen,
       flgvalor: string);
     procedure AltSaldos(valor, valorreserva: double; idpessoa,
       idplanoorcamen: integer; datareferencia, idcontaorcamen, sfield,
       flgrescomp: string);
     procedure EstornaSaldo(idpessoa, idplanoorcamen: integer; datareferencia,
       idcontaorcamen, sfield: string; valor: double);
     procedure AltSaldos2(valorrealizado, valororcado: double; idpessoa,
       idplanoorcamen: integer; datareferencia, idcontaorcamen: string);
     procedure InsereEspecial(idcriterioratorc, idplanoorcamen, exercicio,
       periodo, idpessoa: integer; idcontaorcamen, datareferencia: string;
       vlrrealizado, vlrorcado, vlrrateioori, vlrrealacum, vlrorcacum,
       percutilrateio: double);
     procedure AltEspecial(idcriterioratorc, idplanoorcamen, idpessoa: integer;
       idcontaorcamen, datareferencia: string; vlrorcado, vlrrateioori,
       vlrorcacum, percutilrateio: double);
     procedure ZeraSaldo(idpessoa: integer; idcontaorcamen: string);
     procedure AcertaValor(idpessoa, idplanoorcamen: integer; idcontaorcamen,
       datareferencia, campo: string; valor: double);
     procedure InsereValor(idpessoa, idplanoorcamen, exercicio,
       periodo: integer; idcontaorcamen,datareferencia, campo: string;
       valor: double);
     procedure AltSaldos3(idpessoa, exercicio, periodoini, periodofim: integer;
       vlrorcado, vlrorcacum: double);
     procedure AltSaldos4(idpessoa, idplanoorcamen: Double; idcontaorcamen,
       datareferencia: string; vlrorcado, vlrorcacum: double);
     procedure AltVlrorcado(idpessoa, exercicio, periodoini,
       periodofim: integer; conteudo1, conteudo2, conteudo3, conteudo4: string;
       vlrorcado: double);
     function  AltSaldos5(idpessoa, idplanoorcamen: integer; idcontaorcamen,
       datareferencia: string; vlrorcado, vlrorcacum: double) : Boolean;
     procedure AltValoresGD(idplanoorcamen, exercicio, idpessoa: integer;
       dataini, datafim, conteudo1: string; vlrorcado, vlrorcacum: double);
     procedure AltValoresRealGD(idplanoorcamen, exercicio, idpessoa: integer;
       dataini, datafim, conteudo1: string; vlrrealizado, vlrrealacum: double);
     procedure AtualizaVlrReservado(idplanoorcamen, idpessoa: integer;
       idcontaorcamen, datareferencia: string; valor: double);
     procedure AltSaldos6(idpessoa, idplanoorcamen: integer; idcontaorcamen,
       datareferencia: string; vlrrealizado, vlrrealacum: double);

     procedure GravaOrc  (rValor                  : Double;
                           dDataCorrente           : TDateTime;
                           iPeriodo,
                           iExercicio              : Integer;
                           bGeraResult             : Boolean;
                           pcbCenariosChecked      : Boolean;
                           pedtCodigoContaDeText,
                           pedtCodigoContaParaText,
                           pedtCodigoContaText     : String);

     procedure CmeCadastroDelete(var pMensagem            : String;
                                      pdbeContaOrigemtext,
                                      pdbeContaDestinoText,
                                      psDataOri,
                                      psDataRef            : String;
                                      prValorTransf        : Real);

      property edtLegenda        : TEdit           read FedtLegenda        write FedtLegenda;
      property edtPosicao        : TEdit           read FedtPosicao        write FedtPosicao;
      property pbAguarde         : TProgressBar    read FpbAguarde         write FpbAguarde;
      property IdEmpresa         : Integer         read FIdEmpresa         write FIdEmpresa;
      property PlanoOrc          : Integer         read FPlanoOrc          write FPlanoOrc;

      property CdsSaldoorcado    : TClientDataSet  read FCdsSaldoorcado    write SetCdsSaldoorcado;
      property CdsCenario        : TClientDataSet  read FCdsCenario        write SetCdsCenario;
      property CdsSaldos         : TClientDataSet  read FCdsSaldos         write SetCdsSaldos;
      property CdsContasOrcamen  : TClientDataSet  read FCdsContasOrcamen  write SetCdsContasOrcamen;
      property CdsComposicao     : TClientDataSet  read FCdsComposicao     write SetCdsComposicao;
      property CdsPeriodo        : TClientDataSet  read FCdsPeriodo        write SetCdsPeriodo;
      property CdsContabilidade  : TClientDataSet  read FCdsContabilidade  write SetCdsContabilidade;
      property CdsAux            : TClientDataSet  read FCdsAux            write SetCdsAux;

   end;



implementation


procedure TCtrlSaldoOrcado.DoChangeDataBase;
begin
   inherited;
   _dbSaldoorcado.DatabaseName := DataBaseName;
end;



procedure TCtrlSaldoOrcado.OnCreateAppServer;
begin
  inherited;

  edtLegenda        := TEdit.Create(nil);
  edtPosicao        := TEdit.Create(nil);
  pbAguarde         := TProgressBar.Create(nil);

  FCdsCenario       := TClientDataSet.Create(nil);
  FCdsSaldos        := TClientDataSet.Create(nil);
  FCdsContasOrcamen := TClientDataSet.Create(nil);
  FCdsComposicao    := TClientDataSet.Create(nil);
  FCdsPeriodo       := TClientDataSet.Create(nil);
  FCdsContabilidade := TClientDataSet.Create(nil);
  FCdsAux           := TClientDataSet.Create(nil);
end;

Constructor TCtrlSaldoOrcado.Create;
begin
  inherited;

  DtmBuscaContabil   := TDtmBuscaContabil.Create(nil);
  DtmAcertaSaldo     := TDtmAcertaSaldo.Create(nil);

  CtrlValorescenario := TCtrlValorescenario.Create;
  CtrlSaldoorcadoant := TCtrlSaldoorcadoant.Create;
  CtrlParamOrcamento := TCtrlParamOrcamento.Create;

  FCdsSaldoorcado   := TClientDataSet.Create(nil);
  _dbSaldoorcado    := TdbSaldoorcado.Create(Self);

end;

Destructor TCtrlSaldoOrcado.Destroy;
begin
  inherited;
  _dbSaldoorcado.Free;

  DtmBuscaContabil.Free;
  DtmAcertaSaldo.Free;
  CtrlValorescenario.Free;
  CtrlSaldoorcadoant.Free;

  if isAppServer then begin

    edtLegenda.Free;
    edtPosicao.Free;
    pbAguarde.Free;

    FreeCds([FCdsSaldoorcado, FCdsCenario,       FCdsSaldos, FCdsContasOrcamen, FCdsComposicao,
               FCdsPeriodo,     FCdsContabilidade, FCdsAux]);
  end;
end;



procedure TCtrlSaldoOrcado.AfterInitialize;
begin
   inherited;

   CtrlValorescenario.InitializeAs(Self);
   CtrlSaldoorcadoant.InitializeAs(Self);
   CtrlParamOrcamento.InitializeAs(Self);
end;



function TCtrlSaldoOrcado.AplicaOperacaoSaldoOrcado: Boolean;
begin
   if ConnectionSide = cnsClient then begin
      Result :=
           Connection.AppServer.AplicaOperacaoSaldoorcado(FCdsSaldoorcado.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      MessageInfo := '';
      try
         StartTransaction;
         Result := ApplyCDS(FCdsSaldoorcado,_DbSaldoorcado,[],[]);
         if not Result then begin
            MessageInfo := _DbSaldoorcado.MessageInfo;
            Abort;
         end else
            Commit;
      except
         On E:exception do begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         end;
      end;
   end;
end;



function TCtrlSaldoOrcado.Procurar(IDPessoa        : Double;
                                   IDPlanoorcamen  : Double;
                                   IDContaorcamen  : String;
                                   DataReferencia  : TDateTime
                                  ): OleVariant;
begin
   _DbSaldoorcado.Idpessoa.AsFloat          := idpessoa;
   _DbSaldoorcado.Idplanoorcamen.AsFloat    := idplanoorcamen;
   _DbSaldoorcado.Idcontaorcamen.AsString   := idcontaorcamen;
   _DbSaldoorcado.Datareferencia.AsDateTime := datareferencia;

   Result := GetDataPacket(_DbSaldoorcado.SSqlSelect);
end;




procedure TCtrlSaldoOrcado.AtualizaSaldo(idplanoorcamen, idpessoa: integer;
  idcontaorcamen, datareferencia: string; valor: double);
var sSQl : String;
begin
   sSql := 'UPDATE ' +
           '   SALDOORCADO ' +
           'SET ' +
           '   VLRORCADO = NVL(VLRORCADO,0) + ' + TrocaVPP(FloatToStr(valor)) +
           ' WHERE ' +
           '   (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
           '   (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
           '   (IDCONTAORCAMEN = ''' + idcontaorcamen + ''') AND ' +
           '   (DATAREFERENCIA = TO_DATE(''' + datareferencia +
           ''', ''DD/MM/YYYY''))';
   ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.InsereSaldo(exercicio, periodo : Integer; idplanoorcamen,
  idpessoa: Double; idcontaorcamen, datareferencia: string; vlrorcado,
  vlrrealizado, vlrreservado, vlrcomprometido, vlrorcacum, vlrrealacum: double);
var sSQl : String;
begin
   sSql := 'INSERT INTO ' +
           '   SALDOORCADO ' +
           '   (IDCONTAORCAMEN, IDPESSOA, IDPLANOORCAMEN, DATAREFERENCIA,' +
           '    EXERCICIO, PERIODO, VLRREALIZADO, VLRORCADO, VLRRESERVADO,' +
           '    VLRCOMPROMETIDO, VLRORCACUM, VLRREALACUM) ' +
           'VALUES ' +
           '   (' + idcontaorcamen + ', ' + FloatToStr(idpessoa) + ', ' +
           FloatToStr(idplanoorcamen) + ', TO_DATE(''' + datareferencia + ''', ''DD/MM/YYYY''), ' +
           IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' +
           TrocaVPP(FloatToStr(vlrrealizado)) + ', ' +
           TrocaVPP(FloatToStr(vlrorcado)) + ', ' +
           TrocaVPP(FloatToStr(vlrreservado)) + ', ' +
           TrocaVPP(FloatToStr(vlrcomprometido)) + ', ' +
           TrocaVPP(FloatToStr(vlrorcacum)) + ', ' +
           TrocaVPP(FloatToStr(vlrrealacum)) + ')';
   ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.TrocaSaldoReservadopCompromissado(pValorRes,
  pValorCom: double; idpessoa, idplanoorcamen: integer; datareferencia,
  idcontaorcamen: string);
var sSQl : String;
begin
  sSql := 'UPDATE SALDOORCADO SET ' +
          '  VLRRESERVADO    = (NVL(VLRRESERVADO,0) - ' +    TrocaVPP(FloatToStr(pValorRes)) + '), ' +
          '  VLRCOMPROMETIDO = (NVL(VLRCOMPROMETIDO,0) + ' + TrocaVPP(FloatToStr(pValorCom)) + ') ' +
          'WHERE  ' +
          '  (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '  (DATAREFERENCIA = TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY'')) AND ' +
          '  (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '  (IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.RetiraValor(valorreserva: double; idpessoa,
  idplanoorcamen: integer; datareferencia, idcontaorcamen, flgvalor: string);
var sSQl, vfield: String;
begin
  Case flgvalor[1] of
    'C' : vfield := 'VLRCOMPROMETIDO';
    'R' : vfield := 'VLRRESERVADO';
  end;
  sSql := 'UPDATE SALDOORCADO SET ' +
          vfield + ' = (NVL(' + vfield + ',0) - ' +
          TrocaVPP(FloatToStr(valorreserva)) + ') WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(DATAREFERENCIA = TO_DATE(''' + datareferencia +
          ''',''DD/MM/YYYY'')) AND ' +
          '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.EstornaSaldo(idpessoa,
                                         idplanoorcamen : Integer;
                                         datareferencia,
                                         idcontaorcamen,
                                         sfield         : String;
                                         valor          : Double);
var
  sSQl : String;
begin
  sSql := 'UPDATE'                                                                       + #13 + #10 +
          '  SALDOORCADO'                                                                + #13 + #10 +
          'SET'                                                                          + #13 + #10 +
          '  ' + sfield + ' = ' + '(NVL(' + sfield + ',0) - ' + TrocaVPP(FloatToStr(valor)) + ')' + #13 + #10 +
          'WHERE'                                                                        + #13 + #10 +
          '  (IDPESSOA       = ' + IntToStr(idpessoa) + ') AND '                         + #13 + #10 +
          '  (DATAREFERENCIA = TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY'')) AND ' + #13 + #10 +
          '  (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND '                   + #13 + #10 +
          '  (IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AltSaldos(valor,
                                      valorreserva    : Double;
                                      idpessoa,
                                      idplanoorcamen  : Integer;
                                      datareferencia,
                                      idcontaorcamen,
                                      sfield,
                                      flgrescomp      : String);
var sSQl: String;
begin
  sSql := 'UPDATE'                + #13 + #10 +
          '  SALDOORCADO'         + #13 + #10 +
          'SET '+ #13 + #10 +
          '  ' +  sfield + ' = ' + '(NVL(' + sfield + ',0) - '  + TrocaVPP(FloatToStr(valor)) + ') '+ #13 + #10;

  if flgrescomp = 'C' then begin
    sSql := sSql + ', VLRRESERVADO = (NVL(VLRRESERVADO,0) + ' + TrocaVPP(FloatToStr(valorreserva)) + ') '+ #13 + #10;
  end;

  sSql := sSql + 'WHERE'           + #13 + #10 +
                 '  (IDPESSOA       = ' + IntToStr(idpessoa) + ') AND'+ #13 + #10 +
                 '  (DATAREFERENCIA = TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY'')) AND '+ #13 + #10 +
                 '  (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND '+ #13 + #10 +
                 '  (IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AltSaldos2(valorrealizado,
                                       valororcado     : Double;
                                       idpessoa,
                                       idplanoorcamen  : Integer;
                                       datareferencia,
                                       idcontaorcamen  : String);
var
  sSQl : String;

begin
  sSql := 'UPDATE'        + #13 + #10 +
          '  SALDOORCADO' + #13 + #10 +
          'SET'           + #13 + #10 +
          '  VLRREALIZADO = ' + TrocaVPP(FloatToStr(valorrealizado)) + ','+ #13 + #10 +
          '  VLRORCADO    = ' + TrocaVPP(FloatToStr(valororcado))    + #13 + #10 +
          'WHERE'         + #13 + #10 +
          '  (IDCONTAORCAMEN  = ' + QuotedStr(idcontaorcamen) + ') AND' + #13 + #10 +
          '  (IDPESSOA        = ' + IntToStr(idpessoa)          + ') AND' + #13 + #10 +
          '  (IDPLANOORCAMEN  = ' + IntToStr(idplanoorcamen)    + ') AND' + #13 + #10 +
          '  (DATAREFERENCIA  = TO_DATE(' + QuotedStr(datareferencia) + ',''DD/MM/YYYY''))';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AltSaldos3(idpessoa, exercicio, periodoini,
  periodofim: integer; vlrorcado, vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ') AND (PERIODO >= ' + IntToStr(periodoini) +
          ') AND (PERIODO <= ' + IntToStr(periodofim) + ') AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AltSaldos4(idpessoa, idplanoorcamen: Double;
  idcontaorcamen, datareferencia: string; vlrorcado, vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = NVL(VLRORCADO,0) + ' +
          TrocaVPP(FloatToStr(vlrorcado)) +
          ', VLRORCACUM = NVL(VLRORCACUM,0) + ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          FloatToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          FloatToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

function TCtrlSaldoOrcado.AltSaldos5(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia: string; vlrorcado, vlrorcacum: double) : Boolean;
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  Result := ExecSQL(sSql, True);
end;

procedure TCtrlSaldoOrcado.AltSaldos6(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia: string; vlrrealizado, vlrrealacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(vlrrealizado)) + ', VLRREALACUM = ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.InsereEspecial(idcriterioratorc, idplanoorcamen,
  exercicio, periodo, idpessoa: integer; idcontaorcamen, datareferencia: string;
  vlrrealizado, vlrorcado, vlrrateioori, vlrrealacum, vlrorcacum,
  percutilrateio: double);

var
  sSQl,
  pCriterioLocal : String;
begin

  if (idcriterioratorc = 0) then begin

    pCriterioLocal := ' NULL ';
  end else begin

    pCriterioLocal := FloatToStr(idcriterioratorc);
  end;

  sSql := 'INSERT INTO SALDOORCADO (IDCRITERIORATORC, IDCONTAORCAMEN, ' +
          'IDPLANOORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO, IDPESSOA, ' +
          'VLRREALIZADO, VLRORCADO, VLRRATEIOORI, VLRREALACUM, VLRORCACUM, ' +
          'PERCUTILRATEIO) VALUES (' + pCriterioLocal + ', ''' +
          Trim(idcontaorcamen) + ''', ' + FloatToStr(idplanoorcamen) +
          ', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
          IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' +
          IntToStr(idpessoa) + ', ' + TrocaVPP(FloatToStr(vlrrealizado)) +
          ', ' + TrocaVPP(FloatToStr(vlrorcado)) + ', ' +
          TrocaVPP(FloatToStr(vlrrateioori)) + ', ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ', ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ', ' +
          TrocaVPP(FloatToStr(percutilrateio)) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AltEspecial(idcriterioratorc, idplanoorcamen,
  idpessoa: integer; idcontaorcamen, datareferencia: string; vlrorcado,
  vlrrateioori, vlrorcacum, percutilrateio: double);
var
  sSQl,
  pCriterioLocal : String;
begin

  if (idcriterioratorc = 0) then begin

    pCriterioLocal := ' NULL ';
  end else begin

    pCriterioLocal := FloatToStr(idcriterioratorc);
  end;

  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRRATEIOORI = ' +
          TrocaVPP(FloatToStr(vlrrateioori)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ', PERCUTILRATEIO = ' +
          TrocaVPP(FloatToStr(percutilrateio)) + ', IDCRITERIORATORC = ' +
          pCriterioLocal + ' WHERE (IDPLANOORCAMEN = ' +
          FloatToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          Trim(idcontaorcamen) + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          Trim(datareferencia) + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.ZeraSaldo(idpessoa: integer; idcontaorcamen: string);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRRESERVADO = 0, VLRCOMPROMETIDO = 0 ' +
          'WHERE (IDPESSOA = ' + IntToStr(idpessoa) + idcontaorcamen;
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AcertaValor(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia, campo: string; valor: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET ' + campo + ' = NVL(' + campo + ',0) + ' +
          TrocaVPP(FloatToStr(valor)) + ' WHERE (IDPESSOA = ' +
          IntToStr(idpessoa) +  ') AND (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY''))';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.InsereValor(idpessoa, idplanoorcamen, exercicio,
  periodo: integer; idcontaorcamen, datareferencia, campo: string;
  valor: double);
var sSQl: String;
begin
  sSql := 'INSERT INTO SALDOORCADO(' + campo + ', IDPESSOA, IDPLANOORCAMEN, ' +
          'IDCONTAORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO) VALUES(' +
          TrocaVPP(FloatToStr(valor)) + ', ' + IntToStr(idpessoa) +
          ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorcamen +
          ''', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
          IntToStr(exercicio) + ', ' + IntToStr(periodo) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AltVlrorcado(idpessoa, exercicio, periodoini,
  periodofim: integer; conteudo1, conteudo2, conteudo3, conteudo4: string;
  vlrorcado: double);
var sSql: string;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ')' + conteudo1 + conteudo2 + conteudo3 +
          conteudo4 + ' AND (PERIODO >= ' + IntToStr(periodoini) +
          ') AND (PERIODO <= ' + IntToStr(periodofim) + ') AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AltValoresGD(idplanoorcamen, exercicio,
  idpessoa: integer; dataini, datafim, conteudo1: string; vlrorcado,
  vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO S SET S.VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + '0, VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (EXISTS (SELECT ' +
          'C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
          '(S.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(S.DATAREFERENCIA >= TO_DATE(''' + dataini +
          ''',''DD/MM/YYYY'')) AND (S.DATAREFERENCIA <= TO_DATE(''' + datafim +
          ''',''DD/MM/YYYY'')) AND ' + conteudo1 + '(S.IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AltValoresRealGD(idplanoorcamen, exercicio,
  idpessoa: integer; dataini, datafim, conteudo1: string; vlrrealizado,
  vlrrealacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO S SET S.VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(vlrrealizado)) + ' , VLRREALACUM = ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ' WHERE (EXISTS (SELECT ' +
          'C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
          '(S.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(S.DATAREFERENCIA >= TO_DATE(''' + dataini +
          ''',''DD/MM/YYYY'')) AND (S.DATAREFERENCIA <= TO_DATE(''' + datafim +
          ''',''DD/MM/YYYY'')) AND ' + conteudo1 + '(S.IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.AtualizaVlrReservado(idplanoorcamen,
  idpessoa: integer; idcontaorcamen, datareferencia: string; valor: double);
var sSQl : String;
begin
   sSql := 'UPDATE ' +
           '   SALDOORCADO ' +
           'SET ' +
           '   VLRRESERVADO = NVL(VLRRESERVADO,0) + ' +
           TrocaVPP(FloatToStr(valor)) + ' ' +
           'WHERE ' +
           '   (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
           '   (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
           '   (IDCONTAORCAMEN = ''' + idcontaorcamen + ''') AND ' +
           '   (DATAREFERENCIA = TO_DATE(''' + datareferencia +
           ''', ''DD/MM/YYYY''))';
   ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcado.GravaOrc(rValor                  : Double;
                                     dDataCorrente           : TDateTime;
                                     iPeriodo,
                                     iExercicio              : Integer;
                                     bGeraResult             : Boolean;
                                     pcbCenariosChecked      : Boolean;
                                     pedtCodigoContaDeText,
                                     pedtCodigoContaParaText,
                                     pedtCodigoContaText     : String);
var
  rValResult   : Double;
  sContaResult,
  Condicoes    : String;

begin
  if pcbCenariosChecked then begin

    cdsCenario.First;

    while (not cdsCenario.EOF) And
          (edtLegenda.Tag <> -1)     do begin

      rValResult := 0;
      cdsSaldos.Close;
      condicoes := '  (IDPLANOORCAMEN = '   + IntToStr(PlanoOrc) + ') AND '                                      + #13 + #10 +
                   '  (IDCONTAORCAMEN = ''' + cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString + ''') AND '       + #13 + #10 +
                   '  (IDCENARIOORCAMEN = ' + IntToStr(cdsCenario.FieldByName ('IDCENARIOORCAMEN').AsInteger) + ') AND ' + #13 + #10;

      if iPeriodo = 0 then begin
        condicoes := condicoes + '  (PERIODO IS NULL) AND ' + #13 + #10;
      end else begin
        condicoes := condicoes + '  (PERIODO = ' + IntToStr(iPeriodo) + ') AND ' + #13 + #10;
      end;
      condicoes := condicoes + '  (EXERCICIO = ' + IntToStr(iExercicio) + ') AND' + #13 + #10 +
                               '  (IDPESSOA = ' + IntToStr(IdEmpresa) + ')' + #13 + #10;
      {  Original
      CdsSaldos.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        ParamByName('CAMPOS').AsString    := 'IDVALORESCENARIO, VLRORCCENARIO';
        ParamByName('TABELAS').AsString   := 'VALORESCENARIO';
        ParamByName('CONDICOES').Asstring := condicoes;
        CdsSaldos.Data := Data;
      end;

      if cdsSaldos.IsEmpty then begin
        //Se não existir insere o novo registro
        CtrlValorescenario.InsereValor(CtrlValorescenario.LerSequencia,
                    cdsCenario.FieldByName('IDCENARIOORCAMEN').AsInteger,
                    PlanoOrc, iExercicio, iPeriodo, IdEmpresa,
                    cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                    rValor);
      end else begin
        //Caso exista, dá update
        CtrlValorescenario.AltValor
                           (cdsSaldos.FieldByName('IDVALORESCENARIO').AsInteger,
                           cdsSaldos.FieldByName('VLRORCCENARIO').AsFloat);
      end;
      }
      CdsSaldos.Close;
      CtrlValorescenario.CdsValorescenario.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        ParamByName('CAMPOS').AsString    := 'IDVALORESCENARIO, IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ' +
                                             'PERIODO,          IDPESSOA,       VLRORCCENARIO,  IDCENARIOORCAMEN';
        ParamByName('TABELAS').AsString   := 'VALORESCENARIO';
        ParamByName('CONDICOES').Asstring := condicoes;
        CtrlValorescenario.CdsValorescenario.Data := Data;
      end;

      with CtrlValorescenario.CdsValorescenario do begin

        if (IsEmpty) then begin
          //Se não existir insere o novo registro

          Insert;
          //FieldByName('IDVALORESCENARIO').AsFloat := CtrlValorescenario.LerSequencia;
          FieldByName('IDCONTAORCAMEN').AsString  := cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString;
          FieldByName('IDPLANOORCAMEN').AsInteger := PlanoOrc;
          FieldByName('EXERCICIO').AsInteger      := iExercicio;
          FieldByName('IDPESSOA').AsInteger       := IdEmpresa;
          FieldByName('VLRORCCENARIO').AsFloat    := rValor;
          FieldByName('IDCENARIOORCAMEN').AsFloat := cdsCenario.FieldByName('IDCENARIOORCAMEN').AsInteger;
          FieldByName('PERIODO').AsInteger        := iPeriodo;

        end else begin

          //Caso exista, dá update
          Edit;
          FieldByName('VLRORCCENARIO').AsFloat    := rValor
        end;
        Post;
      end;
      CtrlValorescenario.AplicaOperacaoValoresCenario;

      if (bGeraResult) and (rValResult <> 0) then begin
        if cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString = pedtCodigoContaDeText then
          sContaResult := pedtCodigoContaParaText
        else
          sContaResult := pedtCodigoContaText;

        { Original
        cdsSaldos.Close;
        with dtmBuscaContabil.sqlSaldos do begin
          Prepare;
          ParamByName('CAMPOS').AsString := 'IDVALORESCENARIO';
          ParamByName('TABELAS').AsString := 'VALORESCENARIO';
          ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    sContaResult + ''') AND (IDCENARIOORCAMEN = ' +
                    IntToStr(cdsCenario.FieldByName
                    ('IDCENARIOORCAMEN').AsInteger) +
                    ') AND (PERIODO IS NULL) AND (EXERCICIO = ' +
                    IntToStr(iExercicio) + ') AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
          CdsSaldos.Data := Data;
        end;
        if cdsSaldos.IsEmpty then begin
          //Se não existir insere o novo registro
          if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P' then
             begin
            CtrlValorescenario.InsereValor(CtrlValorescenario.LerSequencia,
                         cdsCenario.FieldByName('IDCENARIOORCAMEN').AsInteger,
                         PlanoOrc, iExercicio, 0, IdEmpresa,
                         sContaResult, rValResult);
          end else begin
            CtrlValorescenario.InsereValor(CtrlValorescenario.LerSequencia,
                         cdsCenario.FieldByName('IDCENARIOORCAMEN').AsInteger,
                         PlanoOrc, iExercicio, 0, IdEmpresa,
                         sContaResult, rValResult*-1);
          end;
        end else begin
          //Caso exista, dá update
          if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P' then
             begin
            CtrlValorescenario.AltValorSoma
                          (cdsSaldos.FieldByName('IDVALORESCENARIO').AsInteger,
                          rValResult);
          end else begin
            CtrlValorescenario.AltValorSoma
                          (cdsSaldos.FieldByName('IDVALORESCENARIO').AsInteger,
                          rValResult*-1);
          end;
        end;
        }
        cdsSaldos.Close;
        CtrlValorescenario.CdsValorescenario.Close;
        with dtmBuscaContabil.sqlSaldos do begin
          Prepare;
          ParamByName('CAMPOS').AsString := 'IDVALORESCENARIO';
          ParamByName('TABELAS').AsString := 'VALORESCENARIO';
          ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    sContaResult + ''') AND (IDCENARIOORCAMEN = ' +
                    IntToStr(cdsCenario.FieldByName
                    ('IDCENARIOORCAMEN').AsInteger) +
                    ') AND (PERIODO IS NULL) AND (EXERCICIO = ' +
                    IntToStr(iExercicio) + ') AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
          CtrlValorescenario.CdsValorescenario.Data := Data;
        end;

        with CtrlValorescenario.CdsValorescenario do begin

          if (IsEmpty) then begin
            //Se não existir insere o novo registro

            Insert;
            //FieldByName('IDVALORESCENARIO').AsFloat := CtrlValorescenario.LerSequencia;
            FieldByName('IDCONTAORCAMEN').AsString  := sContaResult;
            FieldByName('IDPLANOORCAMEN').AsInteger := PlanoOrc;
            FieldByName('EXERCICIO').AsInteger      := iExercicio;
            FieldByName('IDPESSOA').AsInteger       := IdEmpresa;
            FieldByName('IDCENARIOORCAMEN').AsFloat := cdsCenario.FieldByName('IDCENARIOORCAMEN').AsInteger;
            FieldByName('PERIODO').AsInteger        := 0;

            if (cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P') then begin

              FieldByName('VLRORCCENARIO').AsFloat    := rValResult;
            end else begin

              FieldByName('VLRORCCENARIO').AsFloat    := rValResult*-1;
            end;
          end else begin

            Edit;
            if (cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P') then begin

              FieldByName('VLRORCCENARIO').AsFloat    := rValResult;
            end else begin

              FieldByName('VLRORCCENARIO').AsFloat    := rValResult*-1;
            end;
          end;
          Post;
        end;
        CtrlValorescenario.AplicaOperacaoValoresCenario;
      end;
      cdsCenario.Next;

      if (edtLegenda.Tag = -1) then abort;
    end;
  end else begin
    if iPeriodo = 0 then begin
      rValResult := 0;
      {  original
      cdsSaldos.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        ParamByName('CAMPOS').AsString := 'IDCONTAORCAMEN, VLRORCADO';
        ParamByName('TABELAS').AsString := 'SALDOORCADOANT';
        ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString +
                    ''') AND (EXERCICIO = ' + IntToStr(iExercicio) +
                    ') AND (IDPESSOA = ' + IntToStr(idEmpresa) + ')';
        CdsSaldos.Data := Data;
      end;
      if cdsSaldos.IsEmpty then begin
        //Se não existir insere o novo registro
        CtrlSaldoorcadoant.InsereSaldoAnt(PlanoOrc, iExercicio,
                        IdEmpresa,
                        cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                        0, rValor);
      end else begin
        //Caso exista, dá update
        CtrlSaldoorcadoant.AltVlrorcado2(PlanoOrc, iExercicio,
                        idEmpresa,
                        cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                        rValor);
      end;
      }

      { Primeira alteração
      if not (CtrlSaldoorcadoant.AltVlrorcado2(PlanoOrc, iExercicio,
                                                 idEmpresa,
                                                 cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                                                 rValor)) then begin

        //Se não atualizou nenhum registro insere um novo
        CtrlSaldoorcadoant.InsereSaldoAnt(PlanoOrc, iExercicio,
                        IdEmpresa,
                        cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                        0, rValor);
      end;
      }
      CdsSaldos.Close;
      CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        ParamByName('CAMPOS').AsString := 'IDPLANOORCAMEN, IDCONTAORCAMEN, EXERCICIO, IDPESSOA, VLRORCADO, VLRREALIZADO';
        ParamByName('TABELAS').AsString := 'SALDOORCADOANT';
        ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString +
                    ''') AND (EXERCICIO = ' + IntToStr(iExercicio) +
                    ') AND (IDPESSOA = ' + IntToStr(idEmpresa) + ')';
        CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Data := Data;
      end;

      with CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt do begin

        if IsEmpty then begin
          //Se não existir insere o novo registro
          Insert;
          FieldByName('IDPLANOORCAMEN').AsInteger := PlanoOrc;
          FieldByName('IDCONTAORCAMEN').AsString  := cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString;
          FieldByName('EXERCICIO').AsInteger      := iExercicio;
          FieldByName('IDPESSOA').AsInteger       := IdEmpresa;
          FieldByName('VLRORCADO').AsFloat        := rValor;
          FieldByName('VLRREALIZADO').AsFloat     := 0;
        end else begin

          //Caso exista, dá update
          Edit;
          FieldByName('VLRORCADO').AsFloat        := rValor;
        end;
        Post;
      end;
      CtrlSaldoOrcadoAnt.AplicaOperacaoSaldoOrcadoAnt;

      if (bGeraResult) and (rValResult <> 0) then begin
        if cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString = pedtCodigoContaDeText then
          sContaResult := pedtCodigoContaParaText
        else
          sContaResult := pedtCodigoContaText;
        {
        cdsSaldos.Close;
        with dtmBuscaContabil.sqlSaldos do begin
          Prepare;
          //Busca na tabela de Saldos se o registro existe
          ParamByName('CAMPOS').AsString := 'IDCONTAORCAMEN';
          ParamByName('TABELAS').AsString := 'SALDOORCADOANT';
          ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    sContaResult + ''') AND (EXERCICIO = ' +
                    IntToStr(iExercicio) + ') AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
          CdsSaldos.Data := Data;
        end;
        if cdsSaldos.IsEmpty then begin
          //Se não existir insere o novo registro
          if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P' then begin
            CtrlSaldoorcadoant.InsereSaldoAnt(PlanoOrc, iExercicio,
                                IdEmpresa, sContaResult, 0, rValResult);
          end else begin
            CtrlSaldoorcadoant.InsereSaldoAnt(PlanoOrc, iExercicio,
                             IdEmpresa, sContaResult, 0, rValResult*-1);
          end;
        end else begin
          //Caso exista, dá update
          if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P' then
             begin
            CtrlSaldoorcadoant.AltVlrorcadoSoma(PlanoOrc, iExercicio,
                                   idEmpresa, sContaResult, rValResult);
          end else begin
            CtrlSaldoorcadoant.AltVlrorcadoSoma(PlanoOrc, iExercicio,
                                idEmpresa, sContaResult, rValResult*-1);
          end;
        end;
        }
        {  Primeira Alteração
        if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P' then begin

          if not (CtrlSaldoorcadoant.AltVlrorcadoSoma(PlanoOrc, iExercicio,
                                                        idEmpresa, sContaResult, rValResult)) then begin

            //Se não atualizou nenhum registro insere um novo
            CtrlSaldoorcadoant.InsereSaldoAnt(PlanoOrc, iExercicio, IdEmpresa, sContaResult, 0, rValResult);
          end;
        end else begin
          if not (CtrlSaldoorcadoant.AltVlrorcadoSoma(PlanoOrc, iExercicio,
                                                        idEmpresa, sContaResult, rValResult*-1)) then begin

            //Se não atualizou nenhum registro insere um novo
            CtrlSaldoorcadoant.InsereSaldoAnt(PlanoOrc, iExercicio, IdEmpresa, sContaResult, 0, rValResult*-1);
          end;
        end;
        }
        cdsSaldos.Close;
        CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Close;
        with dtmBuscaContabil.sqlSaldos do begin
          Prepare;
          //Busca na tabela de Saldos se o registro existe
          ParamByName('CAMPOS').AsString := 'IDPLANOORCAMEN, IDCONTAORCAMEN, EXERCICIO, IDPESSOA, VLRORCADO, VLRREALIZADO';
          ParamByName('TABELAS').AsString := 'SALDOORCADOANT';
          ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    sContaResult + ''') AND (EXERCICIO = ' +
                    IntToStr(iExercicio) + ') AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
          CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt.Data := Data;
        end;

        with CtrlSaldoOrcadoAnt.CdsSaldoOrcadoAnt do begin

          if IsEmpty then begin
            //Se não existir insere o novo registro
            Insert;
            FieldByName('IDPLANOORCAMEN').AsInteger := PlanoOrc;
            FieldByName('IDCONTAORCAMEN').AsString  := sContaResult;
            FieldByName('EXERCICIO').AsInteger      := iExercicio;
            FieldByName('IDPESSOA').AsInteger       := IdEmpresa;
            FieldByName('VLRREALIZADO').AsFloat     := 0;

            if (cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P') then begin

              FieldByName('VLRORCADO').AsFloat        := rValResult;
            end else begin

              FieldByName('VLRORCADO').AsFloat        := rValResult*-1;
            end;
          end else begin

            //Caso exista, dá update
            Edit;
            if (cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'P') then begin

              FieldByName('VLRORCADO').AsFloat        := rValResult;
            end else begin

              FieldByName('VLRORCADO').AsFloat        := rValResult*-1;
            end;
          end;
          Post;
        end;
        CtrlSaldoOrcadoAnt.AplicaOperacaoSaldoOrcadoAnt;
      end;
    end else begin
      {
      cdsSaldos.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        //Busca na tabela de Saldos se o registro existe
        ParamByName('CAMPOS').AsString := 'IDCONTAORCAMEN, DATAREFERENCIA';
        ParamByName('TABELAS').AsString := 'SALDOORCADO';
        ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString +
                    ''') AND (DATAREFERENCIA = TO_DATE(''' +
                    FormatDateTime('dd/mm/yyyy',dDataCorrente) +
                    ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
        CdsSaldos.Data := Data;
      end;
      if cdsSaldos.IsEmpty then begin
        //Se não existir insere o novo registro
        InsereSaldo(iExercicio, iPeriodo, PlanoOrc, IdEmpresa,
                     cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                     FormatDateTime('dd/mm/yyyy',dDataCorrente), rValor,
                     0, 0, 0, rValor, 0);
      end else begin
        //Caso exista, dá update
        AltSaldos5(idEmpresa, PlanoOrc,
                    cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                    FormatDateTime('dd/mm/yyyy',dDataCorrente), rValor, rValor);
      end;
      }
      { Primeira Alteração
      if not (AltSaldos5(idEmpresa, PlanoOrc,
                           cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                           FormatDateTime('dd/mm/yyyy',dDataCorrente), rValor,
                           rValor)) then begin

        //Se não atualizou nenhum registro insere um novo
        InsereSaldo(iExercicio, iPeriodo, PlanoOrc, IdEmpresa,
                     cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                     FormatDateTime('dd/mm/yyyy',dDataCorrente), rValor,
                     0, 0, 0, rValor, 0);
      end;
      }
      cdsSaldos.Close;
      FCdsSaldoOrcado.Close;
      with dtmBuscaContabil.sqlSaldos do begin
        Prepare;
        //Busca na tabela de Saldos se o registro existe
        ParamByName('CAMPOS').AsString := 'IDCONTAORCAMEN, IDPESSOA,        IDPLANOORCAMEN, DATAREFERENCIA,' +
                                          'EXERCICIO,      PERIODO,         VLRREALIZADO,   VLRORCADO,' +
                                          'VLRRESERVADO,   VLRCOMPROMETIDO, VLRORCACUM,     VLRREALACUM';
        ParamByName('TABELAS').AsString := 'SALDOORCADO';
        ParamByName('CONDICOES').AsString := '(IDPLANOORCAMEN = ' +
                    IntToStr(PlanoOrc) + ') AND (IDCONTAORCAMEN = ''' +
                    cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').asString +
                    ''') AND (DATAREFERENCIA = TO_DATE(''' +
                    FormatDateTime('dd/mm/yyyy',dDataCorrente) +
                    ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
                    IntToStr(idEmpresa) + ')';
        FCdsSaldoOrcado.Data := Data;
      end;

      with FCdsSaldoOrcado do begin

        if IsEmpty then begin

          Insert;
          FieldByName('IDCONTAORCAMEN').AsString   := cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString;
          FieldByName('IDPESSOA').AsInteger        := IdEmpresa;
          FieldByName('IDPLANOORCAMEN').AsFloat    := PlanoOrc;
          FieldByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
          FieldByName('EXERCICIO').AsInteger       := iExercicio;
          FieldByName('PERIODO').AsInteger         := iPeriodo;
          FieldByName('VLRREALIZADO').AsFloat      := 0;
          FieldByName('VLRORCADO').AsFloat         := rValor;
          FieldByName('VLRRESERVADO').AsFloat      := 0;
          FieldByName('VLRCOMPROMETIDO').AsFloat   := 0;
          FieldByName('VLRORCACUM').AsFloat        := rValor;
          FieldByName('VLRREALACUM').AsFloat       := 0;
        end else begin

          //Caso exista, dá update
          Edit;
          FieldByName('VLRORCADO').AsFloat         := rValor;
          FieldByName('VLRORCACUM').AsFloat        := rValor;
        end;

        Post;
      end;
      AplicaOperacaoSaldoOrcado;
    end;
  end;
end;

procedure TCtrlSaldoOrcado.StartTransactionOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.StartTransactionOrc;

  end else begin

    StartTransaction;
  end;
end;

procedure TCtrlSaldoOrcado.CommitOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.CommitOrc;

  end else begin

    Commit;
  end;
end;

procedure TCtrlSaldoOrcado.RollBackOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.RollBackOrc;

  end else begin

    RollBack;
  end;
end;

function TCtrlSaldoOrcado.AbreCenario : OleVariant;
begin

  Result := GetDataPacket('SELECT'                          + #13 + #10 +
                           '  IDCENARIOORCAMEN, NOMECENARIO' + #13 + #10 +
                           'FROM'                            + #13 + #10 +
                           '  CENARIOORCAMEN'                + #13 + #10 +
                           'ORDER BY'                        + #13 + #10 +
                           '  NOMECENARIO'                   + #13 + #10);
end;

function  TCtrlSaldoOrcado.EfetivaClick(pedtCodigoContaText,
                                         pedtCodigoContaDeText,
                                         pedtCodigoContaParaText,
                                         PdblcPeriodoIniText,
                                         pEdConteudo1Text,
                                         pEdConteudo2Text,
                                         pEdConteudo3Text,
                                         pEdConteudo4Text : String;
                                         psePosIni1Value,
                                         psePosIni2Value,
                                         psePosIni3Value,
                                         psePosIni4Value,
                                         psePosFim1Value,
                                         psePosFim2Value,
                                         psePosFim3Value,
                                         psePosFim4Value,
                                         pspnedExercicioValue: Double;
                                         pdblcPeriodoIniLookupValue,
                                         pdblcPeriodoFimLookupValue : String;
                                         pcbCenariosChecked,
                                         pcbBuscaSaldoAnteriorChecked : Boolean;
                                         pdblcPeriodoLimiteText,
                                         pdblcPeriodoLimiteLookUpValue : String) : Boolean;
var
  rValor           : Double;
  iExercicioAtual,
  iExercicio,
  iPeriodo         : Integer;
  conteudo1,
  conteudo2,
  conteudo3,
  conteudo4        : String;

begin
  try

    StartTransactionOrc;
    //
    if Trim(pedtCodigoContaText) <> '' then begin

      CtrlParamorcamento.AltIdcontaorcresult(pedtCodigoContaText, IdEmpresa);
    end;
    if (edtLegenda.Tag = -1) then Abort;
    //
    if Trim(pedtCodigoContaDeText) <> '' then begin

      CtrlParamorcamento.AltIdcontaorcde(pedtCodigoContaDeText, IdEmpresa);
    end;
    if (edtLegenda.Tag = -1) then Abort;
    //
    if Trim(pedtCodigoContaParaText) <> '' then begin

      CtrlParamorcamento.AltIdcontaorcpara(pedtCodigoContaParaText, idEmpresa);
    end;
    if (edtLegenda.Tag = -1) then Abort;
    //
    EdtLegenda.Text    := '';

    if Trim(PdblcPeriodoIniText) <> '' then begin
      EdtLegenda.Text := 'Zerando Valores do Orçamento nos Períodos Indicados';

      if Trim(pedConteudo1Text) <> '' then begin
        conteudo1 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1Value) + ',' +
                                                      FloatToStr(psePosFim1Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo1Text)) +'))';
      //end else begin
      //  conteudo1 := ' AND (1 = 1)';
      end;

      if Trim(pedConteudo2Text) <> '' then begin
        conteudo2 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni2Value) + ',' +
                                                      FloatToStr(psePosFim2Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo2Text)) + '))';
      //end else begin
      //  conteudo2 := ' AND (1 = 1)';
      end;

      if Trim(pedConteudo3Text) <> '' then begin
        conteudo3 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni3Value) + ',' +
                                                      FloatToStr(psePosFim3Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo3Text)) + '))';
      //end else begin
      //  conteudo3 := ' AND (1 = 1)';
      end;

      if Trim(pedConteudo4Text) <> '' then begin
        conteudo4 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni4Value) + ',' +
                                                      FloatToStr(psePosFim4Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo4Text)) + '))';
      //end else begin
      //  conteudo4 := ' AND (1 = 1)';
      end;

      if pcbCenariosChecked then begin

        CtrlValorescenario.AltVlrOrcCenario(IdEmpresa,
                                             Trunc(pspnedExercicioValue),
                                             StrToInt(pdblcPeriodoIniLookupValue),
                                             StrToInt(pdblcPeriodoFimLookupValue),
                                             conteudo1, conteudo2, conteudo3, conteudo4, 0);
      end else begin

        AltVlrOrcado(IdEmpresa,
                      Trunc(pspnedExercicioValue),
                      StrToInt(pdblcPeriodoIniLookupValue),
                      StrToInt(pdblcPeriodoFimLookupValue),
                      conteudo1, conteudo2, conteudo3, conteudo4, 0);
      end;
    end;

    if (edtLegenda.Tag = -1) then Abort;

    if pcbBuscaSaldoAnteriorChecked then begin
      EdtLegenda.Text := 'Zerando Valores do Orçamento no Saldo Anterior';

      if Trim(pedConteudo1Text) <> '' then begin
        conteudo1 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1Value) + ',' +
                                                      FloatToStr(psePosFim1Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo1Text))+'))';
      //end else begin
      //  conteudo1 := ' AND (1 = 1)';
      end;

      if Trim(pedConteudo2Text) <> '' then begin
        conteudo2 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni2Value) + ',' +
                                                      FloatToStr(psePosFim2Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo2Text)) + '))';
      //end else begin
      //  conteudo2 := ' AND (1 = 1)';
      end;

      if Trim(pedConteudo3Text) <> '' then begin
        conteudo3 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni3Value) + ',' +
                                                      FloatToStr(psePosFim3Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo3Text)) + '))';
      //end else begin
      //  conteudo3 := ' AND (1 =1)';
      end;

      if Trim(pedConteudo4Text) <> '' then begin
        conteudo4 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni4Value) + ',' +
                                                      FloatToStr(psePosFim4Value) + ') IN (' +
                                                      QuotedStr(Trim(pedConteudo4Text)) + '))';
      //end else begin
      //  conteudo4 := ' AND (1 = 1)';
      end;

      if pcbCenariosChecked then begin
        CtrlValorescenario.AltVlrorccenario2(IdEmpresa,
                                              Trunc(pspnedExercicioValue), conteudo1,
                                              conteudo2, conteudo3, conteudo4, 0);
      end else begin
        CtrlSaldoorcadoant.AltVlrorcado(IdEmpresa,
                                         Trunc(pspnedExercicioValue), conteudo1,
                                         conteudo2, conteudo3, conteudo4, 0);
      end;
    end;
    if (edtLegenda.Tag = -1) then Abort;

    EdtLegenda.Text := 'Selecionando as Contas a serem Copiadas';

    cdsContasOrcamen.Close;
    if Trim(pedConteudo1Text) <> '' then begin
      conteudo1 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1Value) + ',' +
                                                    FloatToStr(psePosFim1Value) + ') IN (' +
                                                    QuotedStr(Trim(pedConteudo1Text)) + '))';
    //end else begin
    //  conteudo1 := ' AND (1 = 1)';
    end;

    if Trim(pedConteudo2Text) <> '' then begin
      conteudo2 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni2Value) + ',' +
                                                    FloatToStr(psePosFim2Value) + ') IN (' +
                                                    QuotedStr(Trim(pedConteudo2Text)) + '))';
    //end else begin
    //  conteudo2 := ' AND (1 = 1)';
    end;

    if Trim(pedConteudo3Text) <> '' then begin
      conteudo3 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni3Value) + ',' +
                                                    FloatToStr(psePosFim3Value) + ') IN (' +
                                                    QuotedStr(Trim(pedConteudo3Text)) + '))';
    //end else begin
    //  conteudo3 := ' AND (1 = 1)';
    end;
    if Trim(pedConteudo4Text) <> '' then begin
      conteudo4 := ' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni4Value) + ',' +
                                                    FloatToStr(psePosFim4Value) + ') IN (' +
                                                    Trim(pedConteudo4Text) + '))';
    //end else begin
    //  conteudo4 := ' AND (1 = 1)';
    end;

    with DtmBuscaContabil.sqlContasOrcamen do begin
      Prepare;
      ParamByName('CAMPOS').AsString := 'IDCONTAORCAMEN, FLGSINALCONTA';
      ParamByName('TABELAS').AsString := 'CONTASORCAMEN';
      ParamByName('CONDICOES').asString := '(IDPLANOORCAMEN  = ' + IntToStr(PlanoOrc) + ')' +
                                           conteudo1 + conteudo2 + conteudo3 + conteudo4 +
                                           ' AND  (TIPOCALCREALIZADO = ''P'') AND ' +
                                           '((FLGATIVA = ''A'') OR (FLGATIVA IS NULL))';
      CdsContasOrcamen.Data := Data;
    end;

    if (edtLegenda.Tag = -1) then Abort;

    EdtLegenda.Text := 'Copiando Valores da Contabilidade para o Orçamento';

    pbAguarde.Max := cdsContasOrcamen.RecordCount;
    pbAguarde.Position := 0;
    cdsContasOrcamen.First;
    //*********************************************
    if Trim(pdblcPeriodoIniText) <> '' then begin               // Bloco01 estava abaixo
      cdsPeriodo.Close;
      with DtmBuscaContabil.sqlPeriodo do begin
        Prepare;
        ParamByName('EXERCICIO').AsInteger  := Trunc(pspnedExercicioValue);
        ParamByName('PESSOA').AsInteger     := IdEmpresa;
        ParamByName('PERIODOINI').AsInteger := StrToInt(pdblcPeriodoIniLookupValue);
        ParamByName('PERIODOFIM').AsInteger := StrToInt(pdblcPeriodoFimLookupValue);
        CdsPeriodo.Data := Data;
      end;
    end;

    while not cdsContasOrcamen.EOF do begin
      pbAguarde.Position := pbAguarde.Position + 1;
      edtPosicao.Text    := IntToStr(pbAguarde.Max - pbAguarde.Position);
      cdsComposicao.Close;

      with DtmBuscaContabil.sqlComposicao do begin
        Prepare;
        ParamByName('PLANO').asFloat  := PlanoOrc;
        ParamByName('CONTA').asString := cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString;
        CdsComposicao.Data := Data;
      end;

      if Trim(pdblcPeriodoIniText) <> '' then begin

        // Bloco01 estava aqui

        cdsPeriodo.First;
        while not cdsPeriodo.EOF do begin
          rValor := 0;
          cdsComposicao.First;
          while not cdsComposicao.EOF do begin
            cdsContabilidade.Close;
            conteudo1 := '  (L.PLACONTA LIKE ''' + Trim(cdsComposicao.FieldByName('PLACONTA').AsString) +
                         '%'') AND (L.PLANO = '  + IntToStr(cdsComposicao.FieldByName('PLANO').AsInteger) +
                         ') AND ' + #13 + #10;

            if not cdsComposicao.FieldByName('CODCENTROCUSTO').IsNull then
               begin
              conteudo1 := conteudo1 + '  (L.CODCENTROCUSTO = ''' +
                           Espaco(Trim(cdsComposicao.FieldByName
                           ('CODCENTROCUSTO').asString),10) +
                           ''') AND (L.IDEMPRESA = ' +
                           IntToStr(cdsComposicao.FieldByName
                           ('IDEMPRESA').AsInteger) + ') AND ' + #13 + #10;
            end;
            conteudo1 := conteudo1 + '  (P.IDPESSOA = ' +
                         IntToStr(IdEmpresa) + ') AND ' + #13 + #10;
            if not cdsComposicao.FieldByName('UNIDNEGOC').IsNull then begin
              conteudo1 := conteudo1 + '(L.UNIDNEGOC = ' +
                           IntToStr(cdsComposicao.FieldByName
                           ('UNIDNEGOC').AsInteger) + ') AND ' + #13 + #10;
            end;
            if not cdsComposicao.FieldByName('IDPLANOPREV').IsNull then begin
              conteudo1 := conteudo1 + '  (L.IDPLANOPREV = ' +
                           IntToStr(cdsComposicao.FieldByName ('IDPLANOPREV').AsInteger) + ') AND ' + #13 + #10;
            end;
            if not cdsComposicao.FieldByName('IDPATRO').IsNull then begin
              conteudo1 := conteudo1 + '  (L.IDPATRO = ' +
                           IntToStr(cdsComposicao.FieldByName ('IDPATRO').AsInteger) + ') AND ' + #13 + #10;
            end;
            conteudo1 := conteudo1 +
                      '  (P.PLNDATDIA >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', cdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime) + ''',''DD/MM/YYYY'')) AND'  + #13 + #10 +
                      '  (P.PLNDATDIA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime) + ''',''DD/MM/YYYY'')) AND'  + #13 + #10 +
                      '  (L.PLNCODIGO  = P.PLNCODIGO)' + #13 + #10;
            with DtmBuscaContabil.sqlContabilidade do begin
              Prepare;
              ParamByName('CAMPOS').AsString    := '/*+ INDEX (LANCAMENTO) */ ' + #13 + #10 + 'SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS VALOR';
              ParamByName('TABELAS').AsString   := 'LANCAMENTO L, PLANILHA P';
              ParamByName('CONDICOES').AsString := conteudo1;
              CdsContabilidade.Data := Data;
            end;

            if not cdsContabilidade.IsEmpty then begin
              rValor := rValor + cdsContabilidade.FieldByName('VALOR').asFloat;
            end;
            cdsComposicao.Next;
            if (edtLegenda.Tag = -1) then Abort;
          end;
          if rValor <> 0 then begin
            if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'N' then
              rValor := rValor * -1;
            GravaOrc(rValor,
                      cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime,
                      cdsPeriodo.FieldByName('PERIODO').AsInteger,
                      cdsPeriodo.FieldByName('EXERCICIO').AsInteger,
                      False,
                      pcbCenariosChecked,
                      pedtCodigoContaDeText,
                      pedtCodigoContaParaText,
                      pedtCodigoContaText);
          end;
          cdsPeriodo.Next;

          if (edtLegenda.Tag = -1) then Abort;
        end;
      end;
      if pcbBuscaSaldoAnteriorChecked then begin
        rValor := 0;
        if Trim(pdblcPeriodoLimiteText) <> '' then begin
          iPeriodo        := StrToInt(pdblcPeriodoLimiteLookUpValue);
          iExercicioAtual := Trunc(pspnedExercicioValue) - 1;
        end else begin
          cdsAux.Close;
          with DtmBuscaContabil.sqlAux do begin
            Prepare;
            ParamByName('CAMPOS').AsString := 'PACEXERCICIOATUAL';
            ParamByName('TABELAS').AsString := 'PARAMCONTAB';
            ParamByName('CONDICOES').AsString := 'IDPESSOA = ' + IntToStr(idEmpresa);
            CdsAux.Data := Data;
          end;
          iExercicioAtual := cdsAux.FieldByName('PACEXERCICIOATUAL').AsInteger;
          cdsAux.Close;
          with DtmBuscaContabil.sqlAux do begin
            Prepare;
            ParamByName('CAMPOS').AsString := 'MAX(PERNUMERO) AS PERIODO';
            ParamByName('TABELAS').AsString := 'PERIODO';
            ParamByName('CONDICOES').AsString := '(IDPESSOA = ' + IntToStr(idEmpresa) +
                                                 ')AND (PEREXERCICIO = ' + IntToStr(iExercicioAtual) +
                                                 ') AND (PERBLOQUE = ''S'')';
            CdsAux.Data := Data;
          end;
          iPeriodo := cdsAux.FieldByName('PERIODO').AsInteger;
        end;
        cdsComposicao.First;
        while not cdsComposicao.EOF do begin
          cdsContabilidade.Close;
          if iExercicioAtual < Trunc(pspnedExercicioValue) then
            iExercicio := iExercicioAtual
          else
            iExercicio := Trunc(pspnedExercicioValue);

          conteudo1 := '(PLACONTA = ''' +
                       Espaco(Trim(cdsComposicao.FieldByName ('PLACONTA').AsString),18) + ''') AND (PLANO = ' +
                       IntToStr(cdsComposicao.FieldByName('PLANO').AsInteger) + ') AND ';

          if not cdsComposicao.FieldByName('CODCENTROCUSTO').IsNull then begin
            conteudo1 := conteudo1 + '(CODCENTROCUSTO = ''' +
                                     Espaco(Trim(cdsComposicao.FieldByName
                                     ('CODCENTROCUSTO').asString),10) +
                                     ''') AND (IDEMPRESA = ' +
                                     IntToStr(cdsComposicao.FieldByName
                                     ('IDEMPRESA').AsInteger) + ') AND ';
          end;
          conteudo1 := conteudo1 + '(IDPESSOA = ' +
                                   IntToStr(IdEmpresa) + ') AND ';
          if not cdsComposicao.FieldByName('UNIDNEGOC').IsNull then begin
            conteudo1 := conteudo1 + '(UNIDNEGOC = ' +
                   IntToStr(cdsComposicao.FieldByName('UNIDNEGOC').AsInteger) +
                   ') AND ';
          end;
          if not cdsComposicao.FieldByName('IDPLANOPREV').IsNull then begin
            conteudo1 := conteudo1 + '(IDPLANOPREV = ' +
                 IntToStr(cdsComposicao.FieldByName('IDPLANOPREV').AsInteger) +
                 ') AND ';
          end;
          if not cdsComposicao.FieldByName('IDPATRO').IsNull then begin
            conteudo1 := conteudo1 + '(IDPATRO = ' +
                     IntToStr(cdsComposicao.FieldByName('IDPATRO').AsInteger) +
                     ') AND ';
          end;
          conteudo1 := conteudo1 + '(PEREXERCICIO = ' +
                                   IntToStr(iExercicio) + ') AND ';
          if iExercicioAtual < Trunc(pspnedExercicioValue) then begin
            conteudo1 := conteudo1 + '((PERNUMERO <= ' + IntToStr(iPeriodo) + ') OR (PERNUMERO IS NULL))';
          end else begin
            conteudo1 := conteudo1 + '(PERNUMERO IS NULL)';
          end;

          with DtmBuscaContabil.sqlContabilidade do begin
            Prepare;
            ParamByName('CAMPOS').AsString := 'SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR';
            ParamByName('TABELAS').AsString := 'PLANOSALDO';
            ParamByName('CONDICOES').AsString := conteudo1;
            CdsContabilidade.Data := Data;
          end;

          if not cdsContabilidade.IsEmpty then begin

            rValor := rValor + cdsContabilidade.FieldByName('VALOR').asFloat;
          end;
          cdsComposicao.Next;

          if (edtLegenda.Tag = -1) then Abort;
        end;
        if rValor <> 0 then begin
          if cdsContasOrcamen.FieldByName('FLGSINALCONTA').AsString = 'N' then
            rValor := rValor * -1;
        end;
        if iExercicioAtual < Trunc(pspnedExercicioValue) then begin
          cdsAux.Close;
          with DtmBuscaContabil.sqlAux do begin
            Prepare;
            ParamByName('CAMPOS').AsString := 'SUM(NVL(VLRORCADO,0)) AS SALDO';
            ParamByName('TABELAS').AsString := 'SALDOORCADO';
            ParamByName('CONDICOES').AsString := '(IDPESSOA = ' + IntToStr(idEmpresa) +
                                                 ') AND (PERIODO  > ' + IntToStr(iPeriodo) +
                                                 ') AND (EXERCICIO  >= ' + IntToStr(iExercicioAtual) +
                                                 ') AND (EXERCICIO  < ' + IntToStr(Trunc(pspnedExercicioValue)) +
                                                 ') AND (IDPLANOORCAMEN  = ' + IntToStr(PlanoOrc) +
                                                 ') AND (IDCONTAORCAMEN  = ''' + cdsContasOrcamen.FieldByName('IDCONTAORCAMEN').AsString + ''')';
            CdsContabilidade.Data := Data;
          end;

          if not cdsAux.IsEmpty then
            rValor := rValor + cdsAux.FieldByName('SALDO').AsFloat;
        end;
        if rValor <> 0 then begin
          GravaOrc(rValor,
                    Date,
                    0,
                    Trunc(pspnedExercicioValue),
                    False,
                    pcbCenariosChecked,
                    pedtCodigoContaDeText,
                    pedtCodigoContaParaText,
                    pedtCodigoContaText);

        end;
      end;
      cdsContasOrcamen.Next;

      if (edtLegenda.Tag = -1) then Abort;
    end;
    //******************************************
    if (pcbBuscaSaldoAnteriorChecked) and (Trim(pedtCodigoContaText) <> '') then begin

      EdtLegenda.Text := 'Selecionando as Contas a serem Zeradas';

      cdsContasOrcamen.Close;
      with DtmBuscaContabil.sqlContasOrcamen do begin
        Prepare;
        ParamByName('CAMPOS').AsString := 'C.IDCONTAORCAMEN, C.FLGSINALCONTA';
        ParamByName('TABELAS').AsString := 'CONTASORCAMEN C, GRUPOORCAMEN G';
        ParamByName('CONDICOES').AsString := '(C.IDPLANOORCAMEN  = ' +
                        IntToStr(PlanoOrc) +
                        ') AND (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) ' +
                        'AND ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) ' +
                        'AND (G.FLGRESULTADO = ''S'')';
        CdsContasOrcamen.Data := Data;
      end;
      if (edtLegenda.Tag = -1) then Abort;

      EdtLegenda.Text := 'Zerando as contas de Resultado';

      pbAguarde.Max := cdsContasOrcamen.RecordCount;
      pbAguarde.Position := 0;
      cdsContasOrcamen.First;
      while not cdsContasOrcamen.EOF do begin
        pbAguarde.Position := pbAguarde.Position + 1;
        edtPosicao.Text    := IntToStr(pbAguarde.Max - pbAguarde.Position);

        GravaOrc(0,
                  Date,
                  0,
                  Trunc(pspnedExercicioValue),
                  true,
                  pcbCenariosChecked,
                  pedtCodigoContaDeText,
                  pedtCodigoContaParaText,
                  pedtCodigoContaText);

        cdsContasOrcamen.Next;
        if (edtLegenda.Tag = -1) then Abort;
      end;
    end;
    CommitOrc;

    Result := True;
  except
    On E:exception do begin
      Result := False;
      RollbackOrc;
      MessageInfo := MessageInfo + E.Message;
    end;
  end;
end;



procedure TCtrlSaldoOrcado.CmeCadastroDelete(var pMensagem            : String;
                                                  pdbeContaOrigemText,
                                                  pdbeContaDestinoText,
                                                  psDataOri,
                                                  psDataRef            : String;
                                                  prValorTransf        : Real);
begin
   try
      StartTransactionOrc;

      //Dá o Update no Saldo da Conta de Origem...
      //Repõe o valor antigo na conta de origem
      AtualizaSaldo(PlanoOrc, idEmpresa, pdbeContaOrigemtext,  psDataOri, prValorTransf);

      //Tira o valor antigo na conta de destino
      AtualizaSaldo(PlanoOrc, idEmpresa, pdbeContaDestinotext, psDataRef, -(prValorTransf));
      inherited;

      CommitOrc;
      pMensagem := 'Exclusão da transferência efetuada com sucesso.';
   except
      RollbackOrc;

      pMensagem := 'Foram detectados problemas na exclusão da Transferência.'
   end;
end;



function TCtrlSaldoOrcado.AcertaSaldoConfirmaClick(const pIdEmpresa          : Integer;
                                                   const pedtCodigoContaText : String;
                                                   const iExercicio          : Integer;
                                                   const iPeriodoIni         : Integer;
                                                   const iPeriodoFim         : Integer
                                                  ) : Boolean;
var
   pConta : String;
   sDec   : Char;
begin
   sDec              := DecimalSeparator;
   DecimalSeparator  := '.';

   try
      StartTransactionOrc;

      if (Trim(pEdtCodigoContaText) <> '') then
      begin
         pconta := ') AND (IDCONTAORCAMEN = ''' + Trim(pedtCodigoContaText) + ''')';
      end
      else
      begin
         pconta := ')';
      end;

      ZeraSaldo(pIdEmpresa, pconta);

      // Para Valor Reservado
      with dtmAcertaSaldo do
      begin
         cdsValorCorreto.Close;
         sqlValorCorreto.Prepare;
         sqlValorCorreto.ParamByName('RESCOMP').AsString   := 'R';
         sqlValorCorreto.ParamByName('IDPESSOA').AsInteger := pIdEmpresa;
         sqlValorCorreto.Open;

         pbAguarde.Position   := 0;
         pbAguarde.Max        := cdsValorCorreto.RecordCount;

         //lblTipoSaldo.Caption := 'Atualizando Reservas Orçamentárias';

         cdsValorCorreto.First;
         while not(cdsValorCorreto.EOF) do
         begin
            pbAguarde.Position := pbAguarde.Position + 1;
            if (trim(pedtCodigoContaText) <> '') and
               (trim(pedtCodigoContaText) <> trim(cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString)) then
            begin
               // Não faz Nada
            end
            else
            begin
               cdsContaSaldo.Close;
               sqlContaSaldo.Prepare;
               sqlContaSaldo.ParamByName('IDPESSOA').AsInteger        := pIdEmpresa;
               sqlContaSaldo.ParamByName('IDPLANOORCAMEN').AsInteger  := cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger;
               sqlContaSaldo.ParamByName('IDCONTAORCAMEN').AsString   := cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString;
               sqlContaSaldo.ParamByName('DATAREFERENCIA').AsDateTime := cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime;
               sqlContaSaldo.Open;

               if cdsContaSaldo.RecordCount > 0 then
               begin
                  AcertaValor(pIdEmpresa,
                              cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger,
                              cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString,
                              FormatDateTime('dd/mm/yyyy', cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime),
                              'VLRRESERVADO',
                              cdsValorCorreto.FieldByName('VALOR').AsFloat);
               end
               else
               begin
                  InsereValor(pIdEmpresa,
                              cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger,
                              cdsValorCorreto.FieldByName('EXERCICIO').AsInteger,
                              cdsValorCorreto.FieldByName('PERIODO').AsInteger,
                              cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString,
                              FormatDateTime('dd/mm/yyyy', cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime),
                              'VLRRESERVADO',
                              cdsValorCorreto.FieldByName('VALOR').AsFloat);
               end;
            end;
            cdsValorCorreto.Next;
         end;

         // Para Valor Comprometido
         cdsValorCorreto.Close;
         sqlValorCorreto.Prepare;
         sqlValorCorreto.ParamByName('RESCOMP').AsString   := 'C';
         sqlValorCorreto.ParamByName('IDPESSOA').AsInteger := pIdEmpresa;
         sqlValorCorreto.Open;

         pbAguarde.Position   := 0;
         pbAguarde.Max        := cdsValorCorreto.RecordCount;
         //lblTipoSaldo.Caption := 'Atualizando Compromissos Orçamentários';
         //Application.ProcessMessages;

         cdsValorCorreto.First;
         while not(cdsValorCorreto.EOF) do
         begin
            pbAguarde.Position := pbAguarde.Position + 1;

            if (trim(pedtCodigoContaText) <> '')
               and (trim(pedtCodigoContaText) <> trim(cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString)) then
            begin
               // Não faz Nada
            end
            else
            begin
               cdsContaSaldo.Close;
               sqlContaSaldo.Prepare;
               sqlContaSaldo.ParamByName('IDPESSOA').AsInteger        := pIdEmpresa;
               sqlContaSaldo.ParamByName('IDPLANOORCAMEN').AsInteger  := cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger;
               sqlContaSaldo.ParamByName('IDCONTAORCAMEN').AsString   := cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString;
               sqlContaSaldo.ParamByName('DATAREFERENCIA').AsDateTime := cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime;
               sqlContaSaldo.Open;

               if cdsContaSaldo.RecordCount > 0 then
               begin
                  AcertaValor(pIdEmpresa,
                              cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger,
                              cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString,
                              FormatDateTime('dd/mm/yyyy', cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime),
                              'VLRCOMPROMETIDO',
                              cdsValorCorreto.FieldByName('VALOR').AsFloat
                             );
               end
               else
               begin
                  InsereValor(pIdEmpresa,
                              cdsValorCorreto.FieldByName('IDPLANOORCAMEN').AsInteger,
                              cdsValorCorreto.FieldByName('EXERCICIO').AsInteger,
                              cdsValorCorreto.FieldByName('PERIODO').AsInteger,
                              cdsValorCorreto.FieldByName('IDCONTAORCAMEN').AsString,
                              FormatDateTime('dd/mm/yyyy', cdsValorCorreto.FieldByName('DATAREFERENCIA').AsDateTime),
                              'VLRCOMPROMETIDO',
                              cdsValorCorreto.FieldByName('VALOR').AsFloat
                             );
               end;
            end;
            cdsValorCorreto.Next;
         end;

         // Para Valor Comprometido Efetivado
         cdsValorCorreto1.Close;
         sqlValorCorreto1.Prepare;
         sqlValorCorreto1.ParamByName('IDPESSOA').AsInteger := pIdEmpresa;
         sqlValorCorreto1.Open;
         pbAguarde.Position   := 0;
         pbAguarde.Max        := cdsValorCorreto1.RecordCount;

         //lblTipoSaldo.Caption := 'Atualizando Compromissos Orçamentários Efetivados';
         //Application.ProcessMessages;

         cdsValorCorreto1.First;
         while not(cdsValorCorreto1.EOF) do
         begin
            pbAguarde.Position := pbAguarde.Position + 1;

            if (trim(pedtCodigoContaText) <> '') and
               (trim(pedtCodigoContaText) <> trim(cdsValorCorreto1.FieldByName('IDCONTAORCAMEN').AsString)) then
            begin
               // Não faz Nada
            end
            else
            begin
               cdsContaSaldo.Close;
               sqlContaSaldo.Prepare;
               sqlContaSaldo.ParamByName('IDPESSOA').AsInteger        := pIdEmpresa;
               sqlContaSaldo.ParamByName('IDPLANOORCAMEN').AsInteger  := cdsValorCorreto1.FieldByName('IDPLANOORCAMEN').AsInteger;
               sqlContaSaldo.ParamByName('IDCONTAORCAMEN').AsString   := cdsValorCorreto1.FieldByName('IDCONTAORCAMEN').AsString;
               sqlContaSaldo.ParamByName('DATAREFERENCIA').AsDateTime := cdsValorCorreto1.FieldByName('DATAREFERENCIA').AsDateTime;
               sqlContaSaldo.Open;

               if cdsContaSaldo.RecordCount > 0 then
               begin
                  AcertaValor(pIdEmpresa,
                              cdsValorCorreto1.FieldByName('IDPLANOORCAMEN').AsInteger,
                              cdsValorCorreto1.FieldByName('IDCONTAORCAMEN').AsString,
                              FormatDateTime('dd/mm/yyyy', cdsValorCorreto1.FieldByName('DATAREFERENCIA').AsDateTime),
                              'VLRCOMPROMETIDO',
                              cdsValorCorreto1.FieldByName('VALOR').AsFloat
                             );
               end
               else
               begin
                  InsereValor(pIdEmpresa,
                              cdsValorCorreto1.FieldByName('IDPLANOORCAMEN').AsInteger,
                              cdsValorCorreto1.FieldByName('EXERCICIO').AsInteger,
                              cdsValorCorreto1.FieldByName('PERIODO').AsInteger,
                              cdsValorCorreto1.FieldByName('IDCONTAORCAMEN').AsString,
                              FormatDateTime('dd/mm/yyyy', cdsValorCorreto1.FieldByName('DATAREFERENCIA').AsDateTime),
                              'VLRCOMPROMETIDO',
                              cdsValorCorreto1.FieldByName('VALOR').AsFloat
                             );
               end;
            end;
            cdsValorCorreto1.Next;
         end;
      end;  // with dtmAcertaSaldo

      CommitOrc;
      Result := True;
      DecimalSeparator := sDec;

      //lblTipoSaldo.Caption := '';
      //Application.ProcessMessages;
      //MsgDlg('Acerto Efetuado com Sucesso!','Aviso',mtWarning,[mbOk],0)

   except
      Result := False;
      RollBackOrc;

      //lblTipoSaldo.Caption := '';
      //Application.ProcessMessages;
      //MsgDlg('Acerto NÃO efetuado.','Erro',mtError,[mbOk],0);
      //Raise;
   end;

   DecimalSeparator := sDec;
end;



//           Integração com o RH
function TCtrlSaldoOrcado.IncluirOrcamentoRH(IdEmpresa           : Integer;
                                              IdPlanoOrcamentario : Double;
                                              ContaOrcamentaria   : String;
                                              DataRef             : TDate;
                                              Valor               : Double) : Boolean;
var
  iNumOrcamentos  : integer;
  wDia, wMes, wAno: word;
begin
  if (ConnectionSide = cnsClient) then begin
    Result := Connection.AppServer.IncluirOrcamentoRH(IdEmpresa,
                                                       IdPlanoOrcamentario,
                                                       ContaOrcamentaria,
                                                       DataRef);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;

  end else begin
    _Cds.Data := GetDataPacket(
      'SELECT'+#13+
      '  COUNT(VLRORCADO) AS NUM_ORCAMENTOS'+#13+
      'FROM'+#13+
      '  SALDOORCADO'+#13+
      'WHERE'+#13+
      '  (IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+#13+
      '  (IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario)+ ') AND'+#13+
      '  (IDCONTAORCAMEN = ' +QuotedStr(ContaOrcamentaria)+ ') AND'+#13+
      '  (TO_CHAR(DATAREFERENCIA,''MM/YYYY'') = ' + QuotedStr(Copy(DateToStr(DataRef),4,7))+ ')');

    iNumOrcamentos := _Cds.FieldByName('NUM_ORCAMENTOS').asInteger;

    if (iNumOrcamentos > 0) then begin
      try
        Result := ExecSQL(
          'UPDATE SALDOORCADO'+#13+
          'SET    VLRORCADO = ROUND(' + TrocaVPP(FloatToStr(Valor)) +'/' + IntToStr(iNumOrcamentos) +',0)'+#13+
          'WHERE'+#13+
          '  (IDPESSOA       = ' +IntToStr(IdEmpresa)+ ') AND'+#13+
          '  (IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario)+ ') AND'+#13+
          '  (IDCONTAORCAMEN = ' +QuotedStr(ContaOrcamentaria)+ ') AND'+#13+
          '  (TO_CHAR(DATAREFERENCIA,''MM/YYYY'') = '+ QuotedStr(Copy(DateToStr(DataRef),4,7))+ ')');

        if not(Result) then
          Raise exception.Create(MessageInfo);
      except
        On E : exception do begin
          Result := false;
          MessageInfo := 'Ocorreu um erro ao tentar alterar o Orçamento para a Conta Nº '+
                         ContaOrcamentaria +#13+ 'Erro:' +#13 + E.Message;
        end;
      end;
    end else begin
      try
        DecodeDate(DataRef, wAno, wMes, wDia);
        Result := ExecSQL(
          'INSERT INTO SALDOORCADO'+#13+
          '(VLRORCADO,IDPESSOA,IDPLANOORCAMEN,IDCONTAORCAMEN,DATAREFERENCIA,PERIODO,EXERCICIO)'+#13+
          'VALUES (' +
            TrocaVPP(FloatToStr(Valor)) +', '+
            IntToStr(IdEmpresa) +', '+
            FloatToStr(IdPlanoOrcamentario) +', '+
            QuotedStr(ContaOrcamentaria) +', '+
            'TO_DATE(' +QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY''), '+
            IntToStr(wMes) +', '+
            IntToStr(wAno) +')');

        if not(Result) then
          Raise exception.Create(MessageInfo);
      except
        On E: exception do
        begin
          Result := false;
          MessageInfo := 'Ocorreu um erro ao tentar inserir o Orçamento para a Conta Nº '+
                         ContaOrcamentaria +#13+ 'Erro:' +#13+ E.Message;
        end;
      end;
    end;
  end;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
procedure TCtrlSaldoOrcado.SetCdsSaldoorcado(const Value: TClientDataSet);
begin
   FCdsSaldoOrcado := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsCenario(Const Value: TClientDataSet);
begin
   FCdsCenario := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsContasOrcamen(Const Value: TClientDataSet);
begin
   FCdsContasOrcamen := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsSaldos(const Value: TClientDataSet);
begin
   FCdsSaldos := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsComposicao(const Value: TClientDataSet);
begin
   FCdsComposicao := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsPeriodo(const Value: TClientDataSet);
begin
   FCdsPeriodo:= Value;
end;

procedure TCtrlSaldoOrcado.SetCdsContabilidade(Const Value: TClientDataSet);
begin
   FCdsContabilidade := Value;
end;

procedure TCtrlSaldoOrcado.SetCdsAux(Const Value: TClientDataSet);
begin
   FCdsAux := Value;
end;
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



end.
