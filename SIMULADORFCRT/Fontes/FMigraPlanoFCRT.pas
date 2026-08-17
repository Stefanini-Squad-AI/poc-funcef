// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 16/08/2005
// Pendência   : 19921
// Rotina      : Evento de confirmação da efetivação
// Alteração   : Gravar com SYSDATE o campo DATAULTATUALIZA da ReservaPart
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 14/07/2005
// Rotina      : Varias
// Alteração   : Buscar IDEVENTOGERADOR da PREVIAMIGRAPLANO 
//------------------------------------------------------------------------------
unit FMigraPlanoFCRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Db,
  DBTables, Wwquery, Wwdatsrc, wwdblook, Mask, wwdbedit;

type
  TfrmMigraPlanoFCRT = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dtInicioPeriodo: TCMDateTimePicker;
    Label1: TLabel;
    dtFimPeriodo: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    dtInscricao: TCMDateTimePicker;
    lblProcessando: TLabel;
    qryPessoas: TwwQuery;
    lblTotal: TLabel;
    qryAux: TwwQuery;
    qryAux2: TwwQuery;
    qryAux3: TwwQuery;
    qryPatroPlano: TwwQuery;
    GroupBox3: TGroupBox;
    qryDepen: TwwQuery;
    rgrpTipo: TRadioGroup;
    qryLotesAbertos: TwwQuery;
    dsLotesAbertos: TwwDataSource;
    dblkpcmbLote: TwwDBLookupCombo;
    wwDBEdit1: TwwDBEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    iIdEventoPrevOrig,
    iIdEventoPrevDest      : longint;
    sNumInscDestino, 
    sIdSitPlanoDestino     : string;
    sIdEventoGerador       : string;

    function TransfPlano( sIdPessJurTransforig,
                          sidplanoorig,
                          sIdPessJurTransfdest,
                          sIdPlanoDestino,
                          sIdPessoaTransf,
                          sSeqPropostaTransf,
                          sIdSitPlanoOrigem,
                          sidsitplanoTransfdest : String ;
                          qryaux,
                          qrygrava,
                          qryaux2               : TwwQuery) : boolean;

    function GravaEVENTOSPREV                   : boolean;
    function InsereContribuicoes                : boolean;
    function InsereBeneficiosBeneficiarios      : boolean;
    function InsereBeneficiosParticipante       : boolean;
    function AcertaRESERVASCD                   : boolean;
    function AtualizaReservaTR                  : boolean;
    function TransformaReservasEmCotas          : boolean;
  public
    { Public declarations }
  end;

var
  frmMigraPlanoFCRT: TfrmMigraPlanoFCRT;

implementation

uses DBaseDados, UMensErro, {UParticipante, }UDataBase, {UBeneficio, }UModulo,
     {UMovReserva, }UFuncoesUteis, USistema, USimuladorBrTPREV ;

{$R *.DFM}

procedure TfrmMigraPlanoFCRT.bbtnConfirmarClick(Sender: TObject);
var i               : word;
    iIdHistReserva  : longint;
    sSQL            : string;
    sFatorK         : string;
    bErro           : boolean;
    sMsgErro        : string;
    sCPIIntegral    : string;
    dAux            : double;
begin
  inherited;

  if ((rgrpTipo.ItemIndex = 2) or (rgrpTipo.ItemIndex = 3)) and (dblkpcmbLote.Text = '')
  then begin
     MsgDlg('Indique o Lote para Pagamento de Benefícios. ','Erro',mtError,[mbOK],0);
     Exit;
  end;
  with qryPessoas do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT DISTINCT P.IDPESSJUR, P.IDPLANOPREV, P.IDPESSOA,   P.SEQPROPOSTA,       '+
             '        PF.DATAMORTE,         EL.IDSITFUNC,  PP.IDSITPART, PP.INSCRICAONUMERO,  '+
             '        EL.MATRICULA,                                                           '+
             '        P.VALORAMIGRAR AS DATAMIGRACAO,                                         '+
             '        OP.VALORAMIGRAR AS OPCAO, OP.IDEVENTOGERADOR,                           '+ { Augusto 14/07/2005 - OP.IDEVENTOGERADOR }
             '        DECODE(SIT.VALORAMIGRAR,NULL,SP.FLGINTERNO,TRIM(SIT.VALORAMIGRAR))      '+
             '                                                                AS FLGINTERNO   '+
             ' FROM   PESSOAFISICA PF,     PREVIAMIGRAPLANO P, PREVIAMIGRAPLANO SIT,          '+
             '        PREVIAMIGRAPLANO OP, ELEGPATRO EL,       PARTPREVPLAN PP,               '+
             '        SITPART SP                                                              '+
             ' WHERE  P.CODCAMPOMIGRA = ''DATATRANSF''                                        '+
             ' AND    SUBSTR(P.VALORAMIGRAR,7,4)||''/''||SUBSTR(P.VALORAMIGRAR,4,2)||''/''||SUBSTR(P.VALORAMIGRAR,1,2) >= '''+Copy(dtInicioPeriodo.Text,7,4)+'/'+Copy(dtInicioPeriodo.Text,4,2)+'/'+Copy(dtInicioPeriodo.Text,1,2)+''''+
             ' AND    SUBSTR(P.VALORAMIGRAR,7,4)||''/''||SUBSTR(P.VALORAMIGRAR,4,2)||''/''||SUBSTR(P.VALORAMIGRAR,1,2) <= '''+Copy(dtFIMPeriodo.Text,7,4)+'/'+Copy(dtFIMPeriodo.Text,4,2)+'/'+Copy(dtFIMPeriodo.Text,1,2)+''''+
             ' AND    PP.IDPESSJUR      = P.IDPESSJUR                                         '+
             ' AND    PP.IDPLANOPREV    = P.IDPLANOPREV                                       '+
             ' AND    PP.IDPESSOA       = P.IDPESSOA                                          '+
             ' AND    PP.SEQPROPOSTA    = P.SEQPROPOSTA                                       '+
             ' AND    SIT.IDPESSJUR(+)  = P.IDPESSJUR                                         '+
             ' AND    SIT.IDPLANOPREV(+)= P.IDPLANOPREV                                       '+
             ' AND    SIT.IDPESSOA(+)   = P.IDPESSOA                                          '+
             ' AND    SIT.SEQPROPOSTA(+)= P.SEQPROPOSTA                                       '+
             ' AND    SIT.CODCAMPOMIGRA = ''SITUACAO''                                        '+
             ' AND    OP.IDPESSJUR(+)   = P.IDPESSJUR                                         '+
             ' AND    OP.IDPLANOPREV(+) = P.IDPLANOPREV                                       '+
             ' AND    OP.IDPESSOA(+)    = P.IDPESSOA                                          '+
             ' AND    OP.SEQPROPOSTA(+) = P.SEQPROPOSTA                                       '+
             ' AND    OP.CODCAMPOMIGRA  = ''OPCAO''                                           '+
             ' AND    EL.IDPESSJUR      = PP.IDPESSJUR                                        '+
             ' AND    EL.IDPESSOA       = PP.IDPESSOA                                         '+
             ' AND    PF.IDPESSOA(+)    = P.IDPESSOA                                          '+
             ' AND    SP.IDSITPART      = PP.IDSITPART                                        '+
             ' AND    PP.IDPESSOA NOT IN (SELECT IDPESSOA FROM PARTPREVPLAN WHERE IDPLANOPREV = 33) ');
     case rgrpTipo.ItemIndex of
          0 : begin
                 SQL.Add(' AND P.IDPESSOA IN (SELECT IDPESSOA FROM PREVIAMIGRAPLANO WHERE CODCAMPOMIGRA = ''SITUACAO'' AND VALORAMIGRAR = ''AT'' ) ');
                 Modulo.GravaLogTOTALPREV ('Efetivação de Migração - Período : '+dtInicioPeriodo.Text+' a '+dtFimPeriodo.Text+' - Início : '+dtInscricao.Text +' - Ativos ');
              end;
          1 : begin
                 SQL.Add(' AND P.IDPESSOA IN (SELECT IDPESSOA FROM PREVIAMIGRAPLANO WHERE CODCAMPOMIGRA = ''SITUACAO'' AND VALORAMIGRAR = ''MA'' ) ');
                 Modulo.GravaLogTOTALPREV ('Efetivação de Migração - Período : '+dtInicioPeriodo.Text+' a '+dtFimPeriodo.Text+' - Início : '+dtInscricao.Text +' - Autopat. ');
              end;
          2 : begin
                 SQL.Add(' AND P.IDPESSOA IN (SELECT IDPESSOA FROM PREVIAMIGRAPLANO WHERE CODCAMPOMIGRA = ''SITUACAO'' AND VALORAMIGRAR = ''AS'' ) ');
                 Modulo.GravaLogTOTALPREV ('Efetivação de Migração - Período : '+dtInicioPeriodo.Text+' a '+dtFimPeriodo.Text+' - Início : '+dtInscricao.Text +' - Assistidos ');
              end;
          3 : begin
                 SQL.Add(' AND P.IDPESSOA IN (SELECT IDPESSOA FROM PREVIAMIGRAPLANO WHERE CODCAMPOMIGRA = ''SITUACAO'' AND VALORAMIGRAR = ''FL'' ) ');
                 Modulo.GravaLogTOTALPREV ('Efetivação de Migração - Período : '+dtInicioPeriodo.Text+' a '+dtFimPeriodo.Text+' - Início : '+dtInscricao.Text +' - Pensionistas ');
              end;
     end;
     Open;
     if IsEmpty
     then lblTotal.Caption := 'Participantes Encontrados : 0'
     else lblTotal.Caption := 'Participantes Encontrados : '+IntToStr(RecordCount);
  end;
  
  dtmBasedados.dbBaseDados.StartTransaction;

  i := 0;
  while not qryPessoas.Eof do
  begin
     if (qryPessoas.FieldByName('FLGINTERNO').AsString = 'AT') or (qryPessoas.FieldByName('FLGINTERNO').AsString = 'MA')
     then sIdSitPlanoDestino := '1'
     else if qryPessoas.FieldByName('DATAMORTE').AsString <> ''
     then sIdSitPlanoDestino := '10'
     else sIdSitPlanoDestino := '2';

     { Inicio Augusto 14/07/2005 }
     //if qryPessoas.FieldByName('IDPESSJUR').AsInteger = 50028
     //then sIdEventoGerador := '60'
     //else sIdEventoGerador := '45';
     sIdEventoGerador := qryPessoas.FieldByName('IDEVENTOGERADOR').AsString;
     { Fim Augusto 14/07/2005 }

     qryPatroPlano.Locate('IDPESSJUR', qryPessoas.FieldByName('IDPESSJUR').AsInteger, []);
     // Cadastrar o participante no plano destino
     // e atualizar o participante com situação da categoria TP no plano origem
     if not TransfPlano( qryPessoas.FieldByName('IDPESSJUR').AsString,
                         qryPessoas.FieldByName('IDPLANOPREV').AsString,
                         qryPessoas.FieldByName('IDPESSJUR').AsString,
                         '33',
                         qryPessoas.FieldByName('IDPESSOA').AsString,
                         '1',
                         '13',
                         sIdSitPlanoDestino,
                         qryAux,
                         qryAux2,
                         qryAux3 )
     then begin
        MsgDlg('Erro ao transferir o participante de plano. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     if not GravaEVENTOSPREV then
     begin
        MsgDlg('Erro na gravação no histórico de eventos. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;


     // Suspender a cobrança das contribuições atuais
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0, DATAFINAL = TO_DATE('''+DateToStr(StrToDate(dtInscricao.Text)- 1)+''',''DD/MM/YYYY'')' +
                    ' WHERE  IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString  +
                    ' AND    IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
     try
        qryAux.ExecSQL;
     except
        MsgDlg('Erro ao suspender as contribuições no plano origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.add(' UPDATE RESERVAPART SET FLGATIVO = 0 , DATADESATIV = SYSDATE '+
                    ' WHERE  IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString  +
                    ' AND    IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
     try
        qryAux.execsql;
     except
        MsgDlg('Erro ao zerar reservas do participante no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Gerar Movimento de Reserva com Saída de 100%
     qryAux.close;
     qryAux.sql.clear;
     qryAux.SQL.Add('INSERT INTO HISTMOVRESERVA ( '+
                    ' IDREGRACALCULO,      IDPLANOPREV,         IDTIPORESERVA,     IDPESSJUR,           IDPESSOA,    '+
                    ' SEQPROPOSTA,         IDEVENTOGERADOR,     IDCONTRIBUICAO,    IDBENEFICIO,         DATAMOV,     '+
                    ' VLRREAL,             VLRCOTAS,            SALDOREAL,         SALDOCOTAS,          FLGENTRADA,  '+
                    ' PERCENTUAL,          IDPARTICIPANTE,      SALDOREALCONT,     DATAALIMENTACAO,                  '+
                    ' VALORINDICE,         MESREFERENCIA,       FLGPROCEDENCIA,    IDHISTRESERVA)                    '+
                    ' SELECT NULL,         RP.IDPLANOPREV,      RP.IDTIPORESERVA,  RP.IDPESSJUR,        RP.IDPESSOA, '+
                    ' RP.SEQPROPOSTA,      '+OraNumero(sIdEventoGerador)+',                  NULL,              NULL,                SYSDATE,     '+
                    ' RP.VALORRESERVA,     RP.VALORRESERVA,     0,                 0,                   0,           '+
                    ' NULL,                RP.IDPESSOA,         0,                 SYSDATE,                          '+
                    ' 1,                   '''+Copy(dtInscricao.Text,7,4)+'/'+Copy(dtInscricao.Text,4,2)+''', 0, SEQHISTMOVRESERVA.NEXTVAL '+
                    ' FROM RESERVAPART RP '+
                    ' WHERE  RP.IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    RP.IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString  +
                    ' AND    RP.IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    RP.SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
     try
        qryAux.execsql;
     except
        MsgDlg('Erro ao zerar reservas do participante no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;


     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.add(' UPDATE RESERVAPART SET FLGATIVO = 0 , DATADESATIV = SYSDATE '+
                    ' WHERE  IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString  +
                    ' AND    IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
     try
        qryAux.execsql;
     except
        MsgDlg('Erro ao zerar reservas do participante no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Inserir reservas no novo plano
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.Add(' INSERT INTO RESERVAPART ( IDTIPORESERVA,     IDPLANOPREV,   IDPESSOA,     IDPESSJUR,     '+
                    '                           DATAREFERENCIASA,  SEQPROPOSTA,   VALORRESERVA, FLGATIVO,      '+
                    '                           DATAULTATUALIZA, '+ //P.RAMOS-18.08.2005-PEND.19921
                    '                           FLGINCONSISTENCIA, DATAULTALIM) '+
                    ' SELECT                    R.IDTIPORESERVA,   R.IDPLANOPREV,  PP.IDPESSOA,  PP.IDPESSJUR, '+
                    '                           SYSDATE,           PP.SEQPROPOSTA, 0,            1,            '+
                    '                           SYSDATE, '+ //P.RAMOS-18.08.2005-PEND.19921
                    '                           0,                 SYSDATE '+
                    ' FROM  RESERVAXPLANO R, PARTPREVPLAN PP '+
                    ' WHERE R.IDPLANOPREV = 33 '+
                    ' AND   R.ANALITICOSINTETI = ''A'' '+
                    ' AND   PP.IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND   PP.IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                    ' AND   PP.IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND   PP.SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString  );
     try
        qryAux.execsql;
     except
        MsgDlg('Erro ao inserir reservas do plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Inserir reservas no novo plano
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = ( SELECT TO_NUMBER(P.VALORAMIGRAR) '+
                    '                                           FROM   PREVIAMIGRAPLANO P, RESERVAXPLANO RP        '+
                    '                                           WHERE  P.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    '                                           AND    P.IDPLANOPREV    = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                    '                                           AND    P.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    '                                           AND    P.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                    '                                           AND    RP.IDPLANOPREV   = 33                                              '+
                    '                                           AND    RP.CODHIERARQUIA = P.CODCAMPOMIGRA                                 '+
                    '                                           AND    RP.IDPLANOPREV   = R.IDPLANOPREV                                   '+
                    '                                           AND    RP.IDTIPORESERVA = R.IDTIPORESERVA                                 '+
                    '                                           AND    P.IDPESSJUR      = R.IDPESSJUR                                     '+
                    '                                           AND    P.IDPESSOA       = R.IDPESSOA                                      '+
                    '                                           AND    P.SEQPROPOSTA    = R.SEQPROPOSTA)                                  '+

                    ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    R.IDPLANOPREV    = 33 '                                             +
                    ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
     try
        qryAux.ExecSQL;
     except
        MsgDlg('Erro ao inserir reservas do plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Atualizar OPCAO
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = ( SELECT TO_NUMBER(P.VALORAMIGRAR) '+
                    '                                           FROM   PREVIAMIGRAPLANO P        '+
                    '                                           WHERE  P.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    '                                           AND    P.IDPLANOPREV    = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                    '                                           AND    P.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    '                                           AND    P.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                    '                                           AND    P.CODCAMPOMIGRA  = ''OPCAO'''+
                    '                                           AND    P.IDPESSJUR      = R.IDPESSJUR                                     '+
                    '                                           AND    P.IDPESSOA       = R.IDPESSOA                                      '+
                    '                                           AND    P.SEQPROPOSTA    = R.SEQPROPOSTA)                                  '+
                    ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    R.IDPLANOPREV    = 33 '                                             +
                    ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                    ' AND    R.IDTIPORESERVA  = 71 ');
     try
        qryAux.ExecSQL;
     except
        MsgDlg('Erro ao inserir reservas do plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Atualizar IDADEAPOSENTADORIA
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = ( SELECT TO_NUMBER(P.VALORAMIGRAR) '+
                    '                                           FROM   PREVIAMIGRAPLANO P        '+
                    '                                           WHERE  P.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    '                                           AND    P.IDPLANOPREV    = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                    '                                           AND    P.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    '                                           AND    P.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                    '                                           AND    P.CODCAMPOMIGRA  = ''IDADEAP'''+
                    '                                           AND    P.IDPESSJUR      = R.IDPESSJUR                                     '+
                    '                                           AND    P.IDPESSOA       = R.IDPESSOA                                      '+
                    '                                           AND    P.SEQPROPOSTA    = R.SEQPROPOSTA)                                  '+
                    ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    R.IDPLANOPREV    = 33 '                                             +
                    ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                    ' AND    R.IDTIPORESERVA  = 70 ');
     try
        qryAux.ExecSQL;
     except
        MsgDlg('Erro ao atualizar idade de aposentadoria. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Zerar reserva 2.01.03 se opcao for 1
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.Add(' SELECT VALORRESERVA AS OPCAO '+
                    ' FROM   RESERVAPART           '+
                    ' WHERE  IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    IDPLANOPREV    = 33 '                                             +
                    ' AND    IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                    ' AND    IDTIPORESERVA  = 71 ');
     qryAux.Open;

     if qryAux.FieldByName('OPCAO').AsInteger = 1
     then begin
        qryAux.close;
        qryAux.sql.clear;
        qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = 0 '+
                       ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                       ' AND    R.IDPLANOPREV    = 33 '                                             +
                       ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                       ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                       ' AND    R.IDTIPORESERVA  = 72 ');
        try
           qryAux.ExecSQL;
        except
           MsgDlg('Erro ao inserir reservas do plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;
     end;

     // Acertar reservas que dependem de cálculos
     if not AcertaRESERVASCD
     then begin
        MsgDlg('Erro ao atualizar reservas calculadas. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // CAMILLE - 17.12.2002 - CALCULO DO FATOR K PARA AUTOPATROCINADO
     if qryPessoas.FieldByName('FLGINTERNO').AsString = 'MA'
     then begin
        if qryPessoas.FieldByName('OPCAO').AsInteger = 1
        then begin
          sFatorK := '0';
          sCPIINTEGRAL := '0';
        end
        else begin
           sSQL := ' SELECT EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL,                   '+
                   '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT,                   '+
                   '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES,                    '+
                   '        EL.TEMPOSITESPECIAL,  PP.SALPARTICIPACAO    AS VALORPROVENTO,                      '+
                   '        PP.IDPESSJUR,         PP.IDPLANOPREV,       PP.IDPESSOA,                           '+
                   '        PP.SEQPROPOSTA,       EL.MATRICULA,                                                '+
                   '        PF.DATANASC,          PF.DATAMORTE,         PF.ESTCIVIL,                           '+
                   '        PF.SEXO,              EL.DATAADMISSAO,      EL.DATADEMISSAO,                       '+
                   '        PP.INSCRICAODATA,     PP.INSCRICAODATA AS DATAREF,                                 '+
                   OraNumero(qryPessoas.FieldByName('OPCAO').AsString)+'AS OPCAO,                              '+
                   '        ''MA'' AS SITUACAO, ''MA'' AS FLGINTERNO                                           '+
                   ' FROM   PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP                                     '+
                   ' WHERE  PP.IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString                     +
                   ' AND    PP.IDPLANOPREV = 33                                                                '+
                   ' AND    PP.IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString                      +
                   ' AND    PP.SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString                   +
                   ' AND    EL.IDPESSJUR       = PP.IDPESSJUR                                                  '+
                   ' AND    EL.IDPESSOA        = PP.IDPESSOA                                                   '+
                   ' AND    PF.IDPESSOA        = EL.IDPESSOA                                                   ';
           sFatorK := RegraNumerica('18007', sSQL, bErro, iIdCalculoGeral);

           qryAux.close;
           qryAux.sql.clear;
           qryAux.sql.Add(' SELECT VALORAMIGRAR AS CPIINTEGRAL '+
                          ' FROM PREVIAMIGRAPLANO '+
                          ' WHERE  IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString     +
                          ' AND    IDPLANOPREV    = '+qryPessoas.FieldByName('IDPLANOPREV').AsString   +
                          ' AND    IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                          ' AND    SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                          ' AND    CODCAMPOMIGRA  = ''CPIOP2''' ); // serve para 2 e 3
           qryAux.Open;
           if not qryAux.IsEmpty
           then sCPIIntegral := qryAux.FieldByName('CPIINTEGRAL').AsString
           else sCPIIntegral := '0';
        end;

        // Atualizar reservas da seguinte forma
        // IdTipoReserva  CodHierarquia   Nome                          Valor
        // 50             1.01.12         REVERSAO DAS PARCELAS DA CPI  K * CPIIntegral
        // 32             2.02.04         REVERSAO DAS PARCELAS DA CPI  (1-K) * CPIIntegral
        // 53             5.02            CPI DE TRANSFERENCIA          CPIIntegral
        // 54             5.03            K CPI DE TRANSFERENCIA        K

        qryAux.close;
        qryAux.sql.clear;
        dAux := StrToFloat(ClienteNumero(sFatorK)) * StrToFloat(ClienteNumero(sCPIIntegral));
        dAux := StrToFloat(FormatFloat('#0.00',dAux));
        qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = '+OraNumero(FloatToStr(dAux))+
                       ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                       ' AND    R.IDPLANOPREV    = 33 '                                             +
                       ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                       ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                       ' AND    R.IDTIPORESERVA  = 50 ');
        try
           qryAux.ExecSQL;
        except
           MsgDlg('Erro ao atualizar reservas de autopatrocinados. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;

        qryAux.close;
        qryAux.sql.clear;
        dAux := (1-StrToFloat(ClienteNumero(sFatorK))) * StrToFloat(ClienteNumero(sCPIIntegral));
        dAux := StrToFloat(FormatFloat('#0.00',dAux));
        qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = '+OraNumero(FloatToStr(dAux))+
                       ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                       ' AND    R.IDPLANOPREV    = 33 '                                             +
                       ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                       ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                       ' AND    R.IDTIPORESERVA  = 32 ');
        try
           qryAux.ExecSQL;
        except
           MsgDlg('Erro ao atualizar reservas de autopatrocinados. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;

        qryAux.close;
        qryAux.sql.clear;
        dAux := StrToFloat(ClienteNumero(sCPIIntegral));
        dAux := StrToFloat(FormatFloat('#0.00',dAux));
        qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = '+OraNumero(FloatToStr(dAux))+
                       ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                       ' AND    R.IDPLANOPREV    = 33 '                                             +
                       ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                       ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                       ' AND    R.IDTIPORESERVA  = 53 ');
        try
           qryAux.ExecSQL;
        except
           MsgDlg('Erro ao atualizar reservas de autopatrocinados. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;

        qryAux.close;
        qryAux.sql.clear;
        dAux := StrToFloat(ClienteNumero(sFatorK));
        qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = '+OraNumero(FloatToStr(dAux))+
                       ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                       ' AND    R.IDPLANOPREV    = 33 '                                             +
                       ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                       ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                       ' AND    R.IDTIPORESERVA  = 54 ');
        try
           qryAux.ExecSQL;
        except
           MsgDlg('Erro ao atualizar reservas de autopatrocinados. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;
     end;

     // Inserir contribuicoes
     if not InsereContribuicoes
     then begin
        MsgDlg('Erro ao inserir contribuições no plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Alterar tabela de empréstimo
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.add(' UPDATE CONTRATOEMPTMO SET IDPLANOPREV = 33 '+
                    ' WHERE  IDPATRO     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString  +
                    ' AND    IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    );

     try
        qryAux.execsql;
     except
        MsgDlg('Erro atualizar dados do empréstimo. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Alterar ENVIOS DA TMPDESC
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.add(' UPDATE TMPDESC SET IDPLANOPREV = 33                                                    '+
                    ' WHERE  IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString                     +
                    ' AND    IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString                      +
                    ' AND    IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString                   +
                    ' AND    MESCOBRANCA >= '''+Copy(dtInscricao.Text,7,4)+'/'+Copy(dtInscricao.Text,4,2)+''''+
                    ' AND    SITENVIO    < 9                                                                 ');

     try
        qryAux.execsql;
     except
        MsgDlg('Erro atualizar Tabela Temporária de Descontos. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

     // Inserir benefícios
     if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AS'
     then begin
        if not InsereBeneficiosParticipante
        then begin
           MsgDlg('Erro ao inserir benefícios no plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;

        // Encerrar beneficio no plano BD
        qryAux.close;
        qryAux.sql.clear;
        qryAux.sql.add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 3, DATAFINAL = TO_DATE('''+DateToStr(StrToDate(dtInscricao.Text)-1)+''',''DD/MM/YYYY'') '+
                       ' WHERE  IDPLANOPREV    IN (3,16) '+
                       ' AND    IDTITULAR      = '+qryPessoas.FieldByName('IDPESSOA').AsString   +
                       ' AND    IDSITBENEFICIO IN (1,2) ');
        try
           qryAux.ExecSQL;
        except
           MsgDlg('Erro encerrar benefício no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;
     end
     else if qryPessoas.FieldByName('FLGINTERNO').AsString = 'FL'
     then begin
        if not InsereBeneficiosBeneficiarios
        then begin
           MsgDlg('Erro ao inserir benefícios no plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;
        // Encerrar beneficio no plano BD
        qryAux.close;
        qryAux.sql.clear;
        qryAux.sql.add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = 3, DATAFINAL = TO_DATE('''+DateToStr(StrToDate(dtInscricao.Text)-1)+''',''DD/MM/YYYY'') '+
                       ' WHERE  IDPLANOPREV    IN (3,16) '+
                       ' AND    IDTITULAR      = '+qryPessoas.FieldByName('IDPESSOA').AsString   +
                       ' AND    IDSITBENEFICIO IN (1,2) ');
        try
           qryAux.ExecSQL;
        except
           MsgDlg('Erro encerrar benefício no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
           dtmBasedados.dbBaseDados.Rollback;
           Exit;
        end;
     end;

     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.add(' UPDATE PREVIAMIGRAPLANO SET FLGEFETIVADO = 1 '+
                    ' WHERE  IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString  +
                    ' AND    IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
     try
        qryAux.execsql;
     except
        MsgDlg('Erro ao efetivar migração de plano. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

//P.RAMOS-26.09.2005-TRANSFERIDO PARA CÁ, POIS DEVE-SE ATUALIZAR ANTES DE INSERIR NA HISTMOVRESERVA.
     // SE A PESSOA FOR ATIVA OU AUTOPATROCINADA, ATUALIZAR RESERVA COM TR+CONTRIBUICAO
     if (qryPessoas.FieldByName('FLGINTERNO').AsString = 'AT') or
        (qryPessoas.FieldByName('FLGINTERNO').AsString = 'MA') then
     begin
       if not AtualizaReservaTR then
       begin
          MsgDlg('Erro ao atualizar reservas com (TR+Contribuicao). Operação Cancelada.','Erro',mtError,[mbOk],0);
          dtmBasedados.dbBaseDados.Rollback;
          Exit;
       end;
     end;
//P.RAMOS-26.09.2005-FIM

     // Inserir entrada nas reservas do plano destino
     // Gerar Movimento de Reserva com Saída de 100%
     qryAux.close;
     qryAux.sql.clear;
     qryAux.SQL.Add('INSERT INTO HISTMOVRESERVA ( '+
                    ' IDREGRACALCULO,      IDPLANOPREV,         IDTIPORESERVA,     IDPESSJUR,           IDPESSOA,    '+
                    ' SEQPROPOSTA,         IDEVENTOGERADOR,     IDCONTRIBUICAO,    IDBENEFICIO,         DATAMOV,     '+
                    ' VLRREAL,             VLRCOTAS,            SALDOREAL,         SALDOCOTAS,          FLGENTRADA,  '+
                    ' PERCENTUAL,          IDPARTICIPANTE,      SALDOREALCONT,     DATAALIMENTACAO,                  '+
                    ' VALORINDICE,         MESREFERENCIA,       FLGPROCEDENCIA,    IDHISTRESERVA)                    '+
                    ' SELECT NULL,         RP.IDPLANOPREV,      RP.IDTIPORESERVA,  RP.IDPESSJUR,        RP.IDPESSOA, '+
                    ' RP.SEQPROPOSTA,      '+OraNumero(sIdEventoGerador)+',                  NULL,              NULL,                SYSDATE,     '+
                    ' RP.VALORRESERVA,     RP.VALORRESERVA,     RP.VALORRESERVA,   RP.VALORRESERVA,     1,           '+
                    ' NULL,                RP.IDPESSOA,         0,                 SYSDATE,                          '+
                    ' 1,                   '''+Copy(dtInscricao.Text,7,4)+'/'+Copy(dtInscricao.Text,4,2)+''', 0, SEQHISTMOVRESERVA.NEXTVAL '+
                    ' FROM RESERVAPART RP '+
                    ' WHERE  RP.IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                    ' AND    RP.IDPLANOPREV = 33 '+
                    ' AND    RP.IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                    ' AND    RP.SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
     try
        qryAux.execsql;
     except
        MsgDlg('Erro ao zerar reservas do participante no plano de DESTINO. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;

//P.RAMOS-26.09.2005-DEVE-SE ATUALIZAR ANTES DE INSERIR NA HISTMOVRESERVA. TRANSFERIDO PARA TRECHO ACIMA
//     // SE A PESSOA FOR ATIVA OU AUTOPATROCINADA, ATUALIZAR RESERVA COM TR+CONTRIBUICAO
//     if (qryPessoas.FieldByName('FLGINTERNO').AsString = 'AT') or
//        (qryPessoas.FieldByName('FLGINTERNO').AsString = 'MA')
//     then begin
//        if not AtualizaReservaTR
//        then begin
//           MsgDlg('Erro ao atualizar reservas com (TR+Contribuicao). Operação Cancelada.','Erro',mtError,[mbOk],0);
//           dtmBasedados.dbBaseDados.Rollback;
//           Exit;
//        end;
//     end;
//P.RAMOS-26.09.2005-FIM

     if not TransformaReservasEmCotas
     then begin
        MsgDlg('Erro ao converter reservas para cotas. Operação Cancelada.','Erro',mtError,[mbOk],0);
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;


     qryPessoas.Next;
     inc(i);
     lblProcessando.Caption := 'Processando : '+IntToStr(i)+' registro processados.';
  end;
  dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Efetivação Concluída com Sucesso. ','Informação', mtInformation, [mbOK],0);

end;

function TfrmMigraPlanoFCRT.TransfPlano( sIdPessJurTransfOrig,
                                         sIdPlanoOrig,
                                         sIdPessJurTransfDest,
                                         sIdPlanoDestino,
                                         sIdPessoaTransf,
                                         sSeqPropostaTransf,
                                         sIdSitPlanoOrigem,
                                         sIdSitPlanoTransfDest     : String ;
                                         qryAux,
                                         qryGrava,
                                         qryAux2                   : TwwQuery) : boolean;
var sSQL   : string;
    bErro  : boolean;
begin
   Result := False;

   // Seleciona todas as informações do participante no plano de origem
   sSQL := ' SELECT PP.REQUERIMENTODATA,                                                  '+
           '        PP.INSCRICAONUMERO,         PP.INSCRICAODATA,   PP.INSCRICAOTIPO,     '+
           '        PP.SALINSCRICAO,                                                      '+
           '        PP.DATAINICIOASSIST,        PP.SALPARTICIPACAO, PP.SALMANTIDO,        '+
           '        PP.SALVINCULADO,            PP.VALORCALCINSS,   PP.DATACANCELAMENTO,  '+
           '        PP.DATAINICIOMANUT,         PP.DATAFIMASSIST,   PP.FLGDEVEEMPRESTIMO, '+
           '        PP.FLGDEVEASSISTENC,        PP.FLGDEVEPREVIDENC,PP.VALORINFINSS,      '+
           '        PP.DATAINICIOSITTEMP,       PP.DATAFIMSITTEMP,  PP.SALAUXDOENCA,      '+
           '        PP.SEQPROPOSTA,             PP.IDSITPART,                             '+
           '        PP.REQUERIMENTODATA                                                   '+
           '  FROM  PARTPREVPLAN PP                                                       '+
           '  WHERE PP.IDPLANOPREV = '+sIdPlanoOrig+
           '  AND   PP.IDPESSOA    = '+sIdPessoaTransf;

   // Executa regra de validação de transferencia de plano
   if qryPatroPlano.fieldbyname('IDREGRATRANSFPLA').AsString <> ''
   then begin
      if not RegraBooleana( qryPatroPlano.Fieldbyname('IDREGRATRANSFPLA').AsString, sSQL, bErro)
      then begin
         Result := False;
         MsgDlg('Regra de Transferência de Plano não satisfeita. Verifique.','Informação',mtInformation,[mbOK],0);
         Exit;
      end;

      if bErro
      then begin
         Result := False;
         Exit;
      end;
   end;//if

   qryAux.close;
   qryAux.sql.Clear;
   qryAux.sql.add(sSQL);
   qryAux.open;

   qryAux2.close;
   qryAux2.sql.Clear;
   qryAux2.sql.add('  UPDATE  PARTPREVPLAN SET IDSITPLANOPREV = '+sIdSitPlanoOrigem+', '+
                   '          DATACANCELAMENTO = TO_DATE('''+DateToStr(StrToDate(dtInscricao.Text)- 1)+''',''DD/MM/YYYY'') '+
                   '  WHERE   IDPESSJUR   = '+sIdPessJurTransforig+
                   '  AND     IDPLANOPREV = '+sidplanoorig+
                   '  AND     IDPESSOA    = '+sIdPessoaTransf+
                   '  AND     SEQPROPOSTA = '+sSeqPropostaTransf);

   try
      qryAux2.ExecSQL;
   except
      Result := False;
      Exit;
   end;

   // Gerar Numero de Inscricao Automaticamente, caso o parametro diga que é automatico
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT MAX(INSCRICAONUMERO)+1 AS PROXINSC FROM PARTPREVPLAN '+
                   ' WHERE IDPLANOPREV = '+sIdPlanoDestino);
   qryAux2.Open;
   if Trim(qryAux2.FieldByName('PROXINSC').AsString) <> ''
   then sNumInscDestino := qryAux2.FieldByName('PROXINSC').AsString
   else sNumInscDestino := '1';

   qryAux2.Close;

   // Insere participante no plano destino
   sSQL := '  INSERT INTO PARTPREVPLAN( '+
           '         IDPESSJUR,         IDPLANOPREV,    IDPESSOA,          SEQPROPOSTA,        '+
           '         IDSITPART ,        IDSITPLANOPREV, INSCRICAONUMERO,   INSCRICAODATA,      '+
           '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO,         '+
           '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC,   '+
           '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA,                          '+
           '         DATAINICIOSITTEMP, DATAFIMSITTEMP, DATAINICIOMANUT,   REQUERIMENTODATA,   '+
           '         DTINICIOINSC                                                            ) '+
           '  VALUES('+sIdPessJurTransfdest                                                 +','+
                       sIdPlanoDestino                                                      +','+
                       sIdPessoaTransf                                                      +','+
                       sSeqPropostaTransf                                                   +','+
           qryaux.fieldbyname('IDSITPART').AsString                                         +','+
           sidsitplanoTransfdest+','+sNumInscDestino                                        +','+
           'TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY'')                                     ,'+
           ''''+qryaux.fieldbyname('INSCRICAOTIPO').AsString+'''                              ,'+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALINSCRICAO').AsFloat))                +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALPARTICIPACAO').AsFloat))             +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALMANTIDO').AsFloat))                  +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALVINCULADO').AsFloat))                +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('VALORCALCINSS').AsFloat))               +','+
           qryaux.fieldbyname('FLGDEVEEMPRESTIMO').AsString                                 +','+
           qryaux.fieldbyname('FLGDEVEASSISTENC').AsString                                  +','+
           qryaux.fieldbyname('FLGDEVEPREVIDENC').AsString                                  +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('valorinfinss').AsFloat))                +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALAUXDOENCA').AsFloat))                    ;

   if qryaux.fieldbyname('DATAINICIOSITTEMP').AsString <> ''
   then sSQL := sSQL +', TO_DATE('''+qryaux.fieldbyname('DATAINICIOSITTEMP').AsString+''',''DD/MM/YYYY'')'
   else sSQL := sSQL +', NULL ';

   if qryaux.fieldbyname('DATAFIMSITTEMP').AsString <> ''
   then sSQL := sSQL +', TO_DATE('''+qryaux.fieldbyname('DATAFIMSITTEMP').AsString+''',''DD/MM/YYYY'')'
   else sSQL := sSQL +', NULL ';

   if  qryaux.fieldbyname('DATAINICIOMANUT').AsString <> ''
   then sSQL := sSQL +', TO_DATE('''+qryaux.fieldbyname('DATAINICIOMANUT').AsString+''',''DD/MM/YYYY'')'
   else sSQL := sSQL +', NULL ';


   if  qryaux.fieldbyname('REQUERIMENTODATA').AsString <> ''
   then sSQL := sSQL +', TO_DATE('''+qryaux.fieldbyname('REQUERIMENTODATA').AsString+''',''DD/MM/YYYY'')'
   else sSQL := sSQL +', NULL ';

   sSQL := sSQL +', TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY'') ';
   sSQL := sSQL +')';

   qryGrava.Close;
   qryGrava.SQL.Clear;
   qryGrava.SQL.add(sSQL);

   try
      qryGrava.ExecSQL;
   except
      Result := False;
      Exit;
   end;

   if not AtualizaFlgDesativado ( qryAux2,
                                  StrToInt(sIdPessJurTransfDest),
                                  StrToInt(sIdPlanoDestino),
                                  StrToInt(sIdPessoaTransf),
                                  StrToInt(sSeqPropostaTransf) )
   then begin
      MsgDlg('Erro ao ativar participante no plano. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
      Exit;
   end;

   sSQL := ' UPDATE ELEGPATRO SET VALORBASE1 = '+Trim(qryPessoas.FieldByName('OPCAO').AsString)+
           ' WHERE  IDPESSJUR   = '+sIdPessJurTransforig+
           ' AND    IDPESSOA    = '+sIdPessoaTransf;

   qryGrava.Close;
   qryGrava.SQL.Clear;
   qryGrava.SQL.add(sSQL);

   try
      qryGrava.ExecSQL;
   except
      Result := False;
      Exit;
   end;

   // SE FOR ATIVO, MIGRAR CAMPO REVERSAO EM PENSAO
   if (qryPessoas.FieldByName('FLGINTERNO').AsString = 'AT') or
      (qryPessoas.FieldByName('FLGINTERNO').AsString = 'MA')
   then begin
      qryAux.close;
      qryAux.sql.Clear;
      qryAux.sql.Add(' SELECT VALORAMIGRAR                     '+
                     ' FROM   PREVIAMIGRAPLANO                 '+
                     ' WHERE  IDPESSJUR      = '+sIdPessJurTransforig+
                     ' AND    IDPLANOPREV(+) = '+sIdPlanoOrig+
                     ' AND    IDPESSOA(+)    = '+sIdPessoaTransf+
                     ' AND    SEQPROPOSTA(+) = 1 '+
                     ' AND    CODCAMPOMIGRA  = ''REVERPENSA''   ');
      qryAux.open;
      if not qryAux.IsEmpty
      then begin
         if Trim(qryAux.FieldByName('VALORAMIGRAR').AsString) = 'S'
         then sSQL := ' UPDATE ELEGPATRO SET VALORBASE2 = 1 '
         else sSQL := ' UPDATE ELEGPATRO SET VALORBASE2 = 2 ';

         sSQL := sSQL +' WHERE  IDPESSJUR   = '+sIdPessJurTransforig+
                      ' AND    IDPESSOA     = '+sIdPessoaTransf;

         qryGrava.Close;
         qryGrava.SQL.Clear;
         qryGrava.SQL.add(sSQL);

         try
            qryGrava.ExecSQL;
         except
            Result := False;
            Exit;
         end;

      end;
   end;

   Result := True;
end;

function TfrmMigraPlanoFCRT.GravaEVENTOSPREV : boolean;
begin
   // Gravar evento da categoria Transferencia de Plano no plano de origem
   iIdEventoPrevOrig := LeUltRegistro(nil,'EVENTOSPREV');

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                  '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                  '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                  '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                  '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                  '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO) ' +
                  ' VALUES(' + IntToStr(iIdEventoPrevOrig)                      + ',' +
                  ' TO_DATE(''' + DateToStr(Date)     + ''',''DD/MM/YYYY'')        ,' +
                  ' TO_DATE(''' + Trim(dtInscricao.Text) + ''',''DD/MM/YYYY'')     , '+
                  qryPessoas.FieldByName('IDPESSOA').AsString                   + ',' +
                  qryPessoas.FieldByName('IDPESSJUR').AsString                  + ',' +
                  qryPessoas.FieldByName('IDPLANOPREV').AsString                + ',' +
                  qryPessoas.FieldByName('SEQPROPOSTA').AsString                + ',' +
                  qryPessoas.FieldByName('IDSITFUNC').AsString                  + ',' +
                  qryPessoas.FieldByName('IDSITPART').AsString                  + ',' +
                  '13'                                                          + ',' +
                  qryPessoas.FieldByName('IDSITFUNC').AsString                  + ',' +
                  qryPessoas.FieldByName('IDSITPART').AsString                  + ',' +
                  '13'                                                          + ',' +
                  OraNumero(sIdEventoGerador)+',''1'',''1'',''1''                                            ,' +
                  ' TO_DATE('''+datetostr(date)+''',''dd/mm/yyyy''),''1'''      + ',' +
                  qryPessoas.FieldByName('INSCRICAONUMERO').AsString+')');
   try
      qryAux.ExecSQL;
   except
      Result := false;
      Exit;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT MAX(IDEVENTOGERADOR) AS IDEVENTOGERADOR  '+
                  ' FROM   EVENTOGERADOR                            '+
                  ' WHERE  FLGINTERNO     = ''IP''                  ');
   qryAux.Open;
   if qryAux.IsEmpty or (qryAux.FieldByName('IDEVENTOGERADOR').AsString = '')
   then begin
      Close;
      MsgDlg('Nenhum evento da categoria "Inscrição no Plano" encontrada. ','Erro', mtError, [mbOk],0);
      Exit;
   end;


   // Gravar evento da categoria Inscricao no Plano no plano de destino
   iIdEventoPrevDest := LeUltRegistro(nil,'EVENTOSPREV');

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                  '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                  '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                  '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                  '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                  '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO) ' +
                  ' VALUES(' + IntToStr(iIdEventoPrevDest)                      + ',' +
                  ' TO_DATE(''' + DateToStr(Date)     + ''',''DD/MM/YYYY'')        ,' +
                  ' TO_DATE(''' + Trim(dtInscricao.Text) + ''',''DD/MM/YYYY'')     ,' +
                  qryPessoas.FieldByName('IDPESSOA').AsString                   + ',' +
                  qryPessoas.FieldByName('IDPESSJUR').AsString                  + ',' +
                  '33'                                                          + ',' +
                  qryPessoas.FieldByName('SEQPROPOSTA').AsString                + ',' +
                  qryPessoas.FieldByName('IDSITFUNC').AsString                  + ',' +
                  qryPessoas.FieldByName('IDSITPART').AsString                  + ',' +
                  '13'                                                          + ',' +
                  qryPessoas.FieldByName('IDSITFUNC').AsString                  + ',' +
                  qryPessoas.FieldByName('IDSITPART').AsString                  + ',' +
                  sIdSitPlanoDestino                                            + ',' +
                   '1,''1'',''1'',''1'',' +
                  ' TO_DATE('''+datetostr(date)+''',''dd/mm/yyyy''),''1'''   +','+
                  OraNumero(Trim(sNumInscDestino))+')');
   try
      qryAux.ExecSQL;
   except
      Result := false;
      exit;
   end;


   Result := True;
end;

procedure TfrmMigraPlanoFCRT.FormShow(Sender: TObject);
begin
  inherited;
  qryPatroPlano.Close;
  qryPatroPlano.Open;
  qryLotesAbertos.Close;
  qryLotesAbertos.ParamByName('IDFUNDACAO').AsInteger := Sistema.IdEmpresa;
  qryLotesAbertos.Open;
end;


function TfrmMigraPlanoFCRT.InsereContribuicoes : boolean;
var sCodBasica,
    sCodVolunt,
    sPercentual,
    sIdsContribuicao : string;
begin
   Result := False;

   if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AT'
   then begin
      sIdsContribuicao := '17,20,27,30';
      sCodBasica       := '17,27';
      sCodVolunt       := '20';
   end
   else if qryPessoas.FieldByName('FLGINTERNO').AsString = 'MA'
   then begin
      sIdsContribuicao := '18,22,29,32';
      sCodBasica       := '18,29';
      sCodVolunt       := '22';
   end
   else begin
      Result := True;
      Exit;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO CONTRIBPREVPARTP ( IDPESSJUR,      IDPLANOPREV,       IDPESSOA,      SEQPROPOSTA,   '+
                  '                                IDCONTRIBUICAO, IDTPPERIODICIDADE, DIAVENCIMENTO, FLGDESCFOLHA,  '+
                  '                                VALORBASE1,     VALORBASE2,        VALORBASE3,    FLGCOBRA,      '+
                  '                                DATAINICIO,     DATAFINAL,         ULTMESPREPARO)                '+
                  ' SELECT PP.IDPESSJUR, 33, PP.IDPESSOA, PP.SEQPROPOSTA,                                           '+
                  '        CP.IDCONTRIBUICAO, C.IDTPPERIODICIDADE, 0, CP.FLGDESCFOLHA,                              '+
                  '        0, 0, 0, 1,                                                                              '+
                  '        TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''), NULL, ''0000/00'' '+
                  ' FROM   PARTPREVPLAN PP, CONTPREV CP, CONTRIBUICAO C '+
                  ' WHERE  PP.IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                  ' AND    PP.IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                  ' AND    PP.IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                  ' AND    PP.SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                  ' AND    CP.IDPLANOPREV = 33 '+
                  ' AND    CP.IDCONTRIBUICAO IN ('+sIdsContribuicao+') '+
                  ' AND    C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO ');
   try
      qryAux.ExecSQL;
   except
      exit;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS PERCENTUAL '+
                  ' FROM   PREVIAMIGRAPLANO P           '+
                  ' WHERE  P.CODCAMPOMIGRA = ''PERCBASICA''                                 '+
                  ' AND    P.IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                  ' AND    P.IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                  ' AND    P.IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                  ' AND    P.SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
   qryAux.Open;
   if qryAux.IsEmpty
   then sPercentual := '0'
   else sPercentual := FloatToStr(qryAux.FieldByName('PERCENTUAL').AsFloat  );

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET VALORBASE1 = '+OraNumero(sPercentual)+
                  ' WHERE  IDPESSJUR      =    '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                  ' AND    IDPLANOPREV    = 33 '+
                  ' AND    IDPESSOA       =    '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                  ' AND    SEQPROPOSTA    =    '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                  ' AND    IDCONTRIBUICAO IN ('+sCodBasica+')');
   try
      qryAux.ExecSQL;
   except
      exit;
   end;

   // Atualizar percentual da voluntaria
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS PERCENTUAL '+
                  ' FROM   PREVIAMIGRAPLANO P           '+
                  ' WHERE  P.CODCAMPOMIGRA = ''PERCVOLUNT''                                 '+
                  ' AND    P.IDPESSJUR   = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                  ' AND    P.IDPLANOPREV = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                  ' AND    P.IDPESSOA    = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                  ' AND    P.SEQPROPOSTA = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
   qryAux.Open;
   if qryAux.IsEmpty
   then sPercentual := '0'
   else sPercentual := FloatToStr(qryAux.FieldByName('PERCENTUAL').AsFloat );

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET VALORBASE1 = '+OraNumero(sPercentual)+
                  ' WHERE  IDPESSJUR      =    '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                  ' AND    IDPLANOPREV    = 33 '+
                  ' AND    IDPESSOA       =    '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                  ' AND    SEQPROPOSTA    =    '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                  ' AND    IDCONTRIBUICAO =    '+sCodVolunt);
   try
      qryAux.ExecSQL;
   except
      exit;
   end;

   Result := True;
end;

function TfrmMigraPlanoFCRT.InsereBeneficiosParticipante : boolean;
var iNumeroProcesso           : longint;
    sIdTpPagtoBenefic,
    sIdBeneficio              : string;
    prValorAtualizadoRateado,
    prValorAtualizadoTotal    : double;
    psUltMesReajuste          : string;
    bErro, pbPreparaContrib13 : boolean;
    sMsgErro                  : string;
    iIdLote                   : longint;
    dValorSRB                 : double;

begin
   Result := False;

   if (qryPessoas.FieldByName('FLGINTERNO').AsString <> 'AS') and
      (qryPessoas.FieldByName('FLGINTERNO').AsString <> 'FL')
   then begin
      Result := True;
      Exit;
   end;

   // Inserir processo
   iNumeroProcesso := LeUltRegistro(nil,'PROCESSOBENEF');
   iIdLote         := qryLotesAbertos.FieldByName('IDLOTE').AsInteger;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO PROCESSOBENEF ( NUMEROPROCESSO,   '+
                  '                             IDEVENTOGERADOR,  '+
                  '                             FLGACIDENTAL,     '+
                  '                             DTEVENTO,         '+
                  '                             DTDIREITO,        '+
                  '                             DTREGISTRO,       '+
                  '                             IDSITPROCESSO )   '+
                  ' VALUES ( '+IntToStr(iNumeroProcesso)      +', '+
                  OraNumero(sIdEventoGerador)                 +', '+
                  ' 0,                                            '+
                  ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''), '+
                  ' NULL,                                         '+
                  ' SYSDATE,                                      '+
                  ' 1 )                                           ');
   try
      qryAux.ExecSQL;
   except
      Exit;
   end;


   // Incentivo de 32,75%
   if (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '1') or
      (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '2')
   then begin
      if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AS'
      then sIdBeneficio := '122'
      else if qryPessoas.FieldByName('FLGINTERNO').AsString = 'FL'
      then sIdBeneficio := '135'
      else Exit;
      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS VALORAMIGRAR '+
                     ' FROM   PREVIAMIGRAPLANO P                      '+
                     ' WHERE  P.CODCAMPOMIGRA = ''510''               '+
                     ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                     ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
      qryAux2.Open;


      if qryAux2.FieldbyName('VALORAMIGRAR').AsFloat > 0
      then begin

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN( IDTITULAR,    '+
                        '                              IDPESSJUR,    '+
                        '                              IDPLANOPREV,  '+
                        '                              IDPESSOA,     '+
                        '                              IDRESPONSAVEL,'+
                        '                              IDBENEFICIO,  '+
                        '                              SEQPROPOSTA,  '+
                        '                              PRIORIDADE,   '+
                        '                              PERCENTUAL,   '+
                        '                              IDPLANOORIGEM) '+
                        ' VALUES ( '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                        '33,                                                                     '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                                +', '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                                +', '+
                        sIdBeneficio                                                             +', '+
                        qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                        '0, 0,'+
                        '33)');
         try
            qryAux.ExecSQL;
         except
            exit;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (                                                '+
                        ' NUMEROPROCESSO,     IDPLANOPREV,      IDTITULAR,         IDPESSJUR,        '+
                        ' IDBENEFICIO,        IDPESSOA,         SEQPROPOSTA,       IDSITBENEFICIO,   '+
                        ' IDTPPAGTOBENEFIC,   DATAINICIO,       DATAFINAL,         VALORATUAL,       '+
                        ' DATAREQUERIMENTO,   FLGFORMAPAGTO,    VALORCALCULADO,    DATAULTREAJUSTE,  '+
                        ' ULTMESPREPARO,      DATAINICIOFUND,   FLGBENEFMIN,       VALORTOTAL,       '+
                        ' DATACONCESSAO,      DATAENCERRAMENTO, FLGPROVISORIO,     FONTEPAGADORA,    '+
                        ' ULTMESREAJUSTE,     FLGDATAPREVISTA,  DATAFINALPREVISTA, VALORNADIB,       '+
                        ' FLGPOSSUIACOMPINSS, VALORSRB,         IDPLANOORIGEM)                       '+
                        ' VALUES ( '+IntToStr(iNumeroProcesso)                                   +', '+
                        ' 33,                                                                        '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                        sIdBeneficio                                                             +', '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                        '3,                                                                          '+ // idsitbeneficio
                        '1,                                                                          '+ // idtppagtobenefic
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datafinal
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +', '+ // valoratual
                        ' TO_DATE('''+qryPessoas.FieldByName('DATAMIGRACAO').AsString+''',''DD/MM/YYYY''), '+ // datarequerimento
                        '''F'',                                                                       '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        'NULL,                                                                        '+
                        '''0000/00'',                                                                 '+
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                           '+
                        '0,                                                                           '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        'SYSDATE,                                                                     '+
                        'NULL,                                                                        '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+ // fontepagadora
                        '''0000/00'',                                                                  '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+
                        '33)');

         try
            qryAux.ExecSQL;
         except
            exit;
         end;

         prValorAtualizadoRateado := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
         prValorAtualizadoTotal   := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
         psUltMesReajuste         := '0000/00';
         pbPreparaContrib13       := False;
         dValorSRB                := 0;

         if not PreparaBeneficioConcedido( qryAux,
                                           qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                           qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                           qryPessoas.FieldByName('SEQPROPOSTA').AsInteger,
                                           qryPessoas.FieldByName('IDPESSJUR').AsInteger,
                                           33,
                                           iNumeroProcesso,
                                           StrToInt(sIdBeneficio),
                                           4,
                                           1,
                                           -1,
                                           -1,
                                           -1,
                                           -1,
                                           1, // idtppagto
                                           -1,
                                           'CD - INC MIG - 32,75% SB - APOSENTADO',
                                           '',
                                           '',
                                           qryPessoas.FieldByName('MATRICULA').AsString,
                                           dtInscricao.Text,
                                           dtInscricao.Text,
                                           '0',
                                           qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                           0,
                                           qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                           False,
                                           prValorAtualizadoRateado,
                                           prValorAtualizadoTotal,
                                           psUltMesReajuste,
                                           bErro,
                                           pbPreparaContrib13,
                                           sMsgErro,
                                           iIdLote,
                                           dtInscricao.Text,
                                           7,
                                           0,
                                           dValorSRB )
         then Exit;
      end;
   end;


   // Incentivo Fixo
   if (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '1') or
      (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '2')
   then begin
      if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AS'
      then sIdBeneficio := '121'
      else if qryPessoas.FieldByName('FLGINTERNO').AsString = 'FL'
      then sIdBeneficio := '134'
      else Exit;

      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS VALORAMIGRAR '+
                     ' FROM   PREVIAMIGRAPLANO P                         '+
                     ' WHERE  P.CODCAMPOMIGRA = ''509''                  '+
                     ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                     ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
      qryAux2.Open;

      if qryAux2.FieldbyName('VALORAMIGRAR').AsFloat > 0
      then begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN( IDTITULAR,    '+
                        '                              IDPESSJUR,    '+
                        '                              IDPLANOPREV,  '+
                        '                              IDPESSOA,     '+
                        '                              IDRESPONSAVEL,'+
                        '                              IDBENEFICIO,  '+
                        '                              SEQPROPOSTA,  '+
                        '                              PRIORIDADE,   '+
                        '                              PERCENTUAL,   '+
                        '                              IDPLANOORIGEM) '+
                        ' VALUES ( '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                        '33,                                                                     '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                                +', '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                                +', '+
                        sIdBeneficio                                                             +', '+
                        qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                        '0, 0,'+
                        '33)');
         try
            qryAux.ExecSQL;
         except
            exit;
         end;
   
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (                                                '+
                        ' NUMEROPROCESSO,     IDPLANOPREV,      IDTITULAR,         IDPESSJUR,        '+
                        ' IDBENEFICIO,        IDPESSOA,         SEQPROPOSTA,       IDSITBENEFICIO,   '+
                        ' IDTPPAGTOBENEFIC,   DATAINICIO,       DATAFINAL,         VALORATUAL,       '+
                        ' DATAREQUERIMENTO,   FLGFORMAPAGTO,    VALORCALCULADO,    DATAULTREAJUSTE,  '+
                        ' ULTMESPREPARO,      DATAINICIOFUND,   FLGBENEFMIN,       VALORTOTAL,       '+
                        ' DATACONCESSAO,      DATAENCERRAMENTO, FLGPROVISORIO,     FONTEPAGADORA,    '+
                        ' ULTMESREAJUSTE,     FLGDATAPREVISTA,  DATAFINALPREVISTA, VALORNADIB,       '+
                        ' FLGPOSSUIACOMPINSS, VALORSRB,         IDPLANOORIGEM)                       '+
                        ' VALUES ( '+IntToStr(iNumeroProcesso)                                   +', '+
                        ' 33,                                                                        '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                        sIdBeneficio                                                             +', '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                        '3,                                                                          '+ // idsitbeneficio
                        '1,                                                                          '+ // idtppagtobenefic
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +', '+
                        ' TO_DATE('''+qryPessoas.FieldByName('DATAMIGRACAO').AsString+''',''DD/MM/YYYY''), '+ // datarequerimento
                        '''F'',                                                                       '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        'NULL,                                                                        '+
                        '''0000/00'',                                                                 '+
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                           '+
                        '0,                                                                           '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        'SYSDATE,                                                                     '+
                        'NULL,                                                                        '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+ // fontepagadora
                        '''0000/00'',                                                                  '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+
                        '33)');

         try
            qryAux.ExecSQL;
         except
            exit;
         end;
         prValorAtualizadoRateado := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
         prValorAtualizadoTotal   := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
         psUltMesReajuste         := '0000/00';
         pbPreparaContrib13       := False;
         dValorSRB                := 0;

         if not PreparaBeneficioConcedido( qryAux,
                                           qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                           qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                           qryPessoas.FieldByName('SEQPROPOSTA').AsInteger,
                                           qryPessoas.FieldByName('IDPESSJUR').AsInteger,
                                           33,
                                           iNumeroProcesso,
                                           StrToInt(sIdBeneficio),
                                           4,
                                           1,
                                           -1,
                                           -1,
                                           -1,
                                           -1,
                                           1, // idtppagto
                                           -1,
                                           'CD - INC MIG - 32,75% SB - APOSENTADO',
                                           '',
                                           '',
                                           qryPessoas.FieldByName('MATRICULA').AsString,
                                           dtInscricao.Text,
                                           dtInscricao.Text,
                                           '0',
                                           qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                           0,
                                           qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                           False,
                                           prValorAtualizadoRateado,
                                           prValorAtualizadoTotal,
                                           psUltMesReajuste,
                                           bErro,
                                           pbPreparaContrib13,      
                                           sMsgErro,
                                           iIdLote,
                                           dtInscricao.Text,
                                           7,
                                           0,
                                           dValorSRB )
         then Exit;
      end;
   end;

   // Verificar Resgate de 10% da RT
   if (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '2')
   then begin
      if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AS'
      then sIdBeneficio := '133'
      else if qryPessoas.FieldByName('FLGINTERNO').AsString = 'FL'
      then sIdBeneficio := '136'
      else Exit;

      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS VALORAMIGRAR '+
                      ' FROM   PREVIAMIGRAPLANO P                         '+
                      ' WHERE  P.CODCAMPOMIGRA = ''512''                  '+
                      ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                      ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                      ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                      ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
      qryAux2.Open;

      if qryAux2.FieldbyName('VALORAMIGRAR').AsFloat > 0
      then begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN( IDTITULAR,    '+
                        '                              IDPESSJUR,    '+
                        '                              IDPLANOPREV,  '+
                        '                              IDPESSOA,     '+
                        '                              IDRESPONSAVEL,'+
                        '                              IDBENEFICIO,  '+
                        '                              SEQPROPOSTA,  '+
                        '                              PRIORIDADE,   '+
                        '                              PERCENTUAL,   '+
                        '                              IDPLANOORIGEM) '+
                        ' VALUES ( '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                        '33,                                                                     '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                                +', '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                                +', '+
                        sIdBeneficio                                                             +', '+
                        qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                        '0, 0,'+
                        '33)');
         try
            qryAux.ExecSQL;
         except
            exit;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (                                                '+
                        ' NUMEROPROCESSO,     IDPLANOPREV,      IDTITULAR,         IDPESSJUR,        '+
                        ' IDBENEFICIO,        IDPESSOA,         SEQPROPOSTA,       IDSITBENEFICIO,   '+
                        ' IDTPPAGTOBENEFIC,   DATAINICIO,       DATAFINAL,         VALORATUAL,       '+
                        ' DATAREQUERIMENTO,   FLGFORMAPAGTO,    VALORCALCULADO,    DATAULTREAJUSTE,  '+
                        ' ULTMESPREPARO,      DATAINICIOFUND,   FLGBENEFMIN,       VALORTOTAL,       '+
                        ' DATACONCESSAO,      DATAENCERRAMENTO, FLGPROVISORIO,     FONTEPAGADORA,    '+
                        ' ULTMESREAJUSTE,     FLGDATAPREVISTA,  DATAFINALPREVISTA, VALORNADIB,       '+
                        ' FLGPOSSUIACOMPINSS, VALORSRB,         IDPLANOORIGEM)                       '+
                        ' VALUES ( '+IntToStr(iNumeroProcesso)                                   +', '+
                        ' 33,                                                                        '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                        sIdBeneficio                                                             +', '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                        '3,                                                                          '+ // idsitbeneficio
                        '1,                                                                          '+ // idtppagtobenefic
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +', '+
                        ' TO_DATE('''+qryPessoas.FieldByName('DATAMIGRACAO').AsString+''',''DD/MM/YYYY''), '+ // datarequerimento
                        '''F'',                                                                       '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        'NULL,                                                                        '+
                        '''0000/00'',                                                                 '+
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                           '+
                        '0,                                                                           '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        'SYSDATE,                                                                     '+
                        'NULL,                                                                        '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+ // fontepagadora
                        '''0000/00'',                                                                  '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+
                        '33)');

         try
            qryAux.ExecSQL;
         except
            exit;
         end;
         prValorAtualizadoRateado := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
         prValorAtualizadoTotal   := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
         psUltMesReajuste         := '0000/00';
         pbPreparaContrib13       := False;
         dValorSRB                := 0;

         if not PreparaBeneficioConcedido( qryAux,
                                           qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                           qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                           qryPessoas.FieldByName('SEQPROPOSTA').AsInteger,
                                           qryPessoas.FieldByName('IDPESSJUR').AsInteger,
                                           33,
                                           iNumeroProcesso,
                                           StrToInt(sIdBeneficio),
                                           4,
                                           1,
                                           -1,
                                           -1,
                                           -1,
                                           -1,
                                           1, // idtppagto
                                           -1,
                                           'CD - INC MIG - 32,75% SB - APOSENTADO',
                                           '',
                                           '',
                                           qryPessoas.FieldByName('MATRICULA').AsString,
                                           dtInscricao.Text,
                                           dtInscricao.Text,
                                           '0',
                                           qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                           0,
                                           qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                           False,
                                           prValorAtualizadoRateado,
                                           prValorAtualizadoTotal,
                                           psUltMesReajuste,
                                           bErro,
                                           pbPreparaContrib13,      
                                           sMsgErro,
                                           iIdLote,
                                           dtInscricao.Text,
                                           7,
                                           0,
                                           dValorSRB )
         then Exit;
      end;
   end;

   // Verificar Beneficio
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS IDBENEFICIO '+
                   ' FROM   PREVIAMIGRAPLANO P                        '+
                   ' WHERE  P.CODCAMPOMIGRA = ''IDBENEF''             '+
                   ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                   ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                   ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                   ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
   qryAux2.Open;

   if qryAux2.FieldbyName('IDBENEFICIO').AsInteger > 0
   then begin
      if   qryAux2.FieldbyName('IDBENEFICIO').AsInteger    = 5
      then sIdBeneficio := '127'
      else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 6
      then sIdBeneficio := '128'
      else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 7
      then sIdBeneficio := '125'
      else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 8
      then sIdBeneficio := '124'
      else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 9
      then sIdBeneficio := '126'
      else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 11
      then sIdBeneficio := '129'
      else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 14
      then sIdBeneficio := '131'
      else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 18
      then sIdBeneficio := '130'
      else Exit;

      if sIdBeneficio = '131'
      then sIdTpPagtoBenefic := '3'
      else sIdTpPagtoBenefic := '2';

      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS VALORAMIGRAR '+
                      ' FROM   PREVIAMIGRAPLANO P                        '+
                      ' WHERE  P.CODCAMPOMIGRA = ''303''                 '+
                      ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                      ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                      ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                      ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
      qryAux2.Open;


      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN( IDTITULAR,    '+
                     '                              IDPESSJUR,    '+
                     '                              IDPLANOPREV,  '+
                     '                              IDPESSOA,     '+
                     '                              IDRESPONSAVEL,'+
                     '                              IDBENEFICIO,  '+
                     '                              SEQPROPOSTA,  '+
                     '                              PRIORIDADE,   '+
                     '                              PERCENTUAL,   '+
                     '                              IDPLANOORIGEM) '+
                     ' VALUES ( '+
                     qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                     qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                     '33,                                                                     '+
                     qryPessoas.FieldByName('IDPESSOA').AsString                                +', '+
                     qryPessoas.FieldByName('IDPESSOA').AsString                                +', '+
                     sIdBeneficio                                                             +', '+
                     qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                     '0, 0,'+
                     '33)');
      try
         qryAux.ExecSQL;
      except
         exit;
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (                                                '+
                     ' NUMEROPROCESSO,     IDPLANOPREV,      IDTITULAR,         IDPESSJUR,        '+
                     ' IDBENEFICIO,        IDPESSOA,         SEQPROPOSTA,       IDSITBENEFICIO,   '+
                     ' IDTPPAGTOBENEFIC,   DATAINICIO,       DATAFINAL,         VALORATUAL,       '+
                     ' DATAREQUERIMENTO,   FLGFORMAPAGTO,    VALORCALCULADO,    DATAULTREAJUSTE,  '+
                     ' ULTMESPREPARO,      DATAINICIOFUND,   FLGBENEFMIN,       VALORTOTAL,       '+
                     ' DATACONCESSAO,      DATAENCERRAMENTO, FLGPROVISORIO,     FONTEPAGADORA,    '+
                     ' ULTMESREAJUSTE,     FLGDATAPREVISTA,  DATAFINALPREVISTA, VALORNADIB,       '+
                     ' FLGPOSSUIACOMPINSS, VALORSRB,         IDPLANOORIGEM)                       '+
                     ' VALUES ( '+IntToStr(iNumeroProcesso)                                   +', '+
                     ' 33,                                                                        '+
                     qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                     qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                     sIdBeneficio                                                             +', '+
                     qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                     qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                     '1,                                                                          '+ // idsitbeneficio
                     sIdTpPagtoBenefic                                                        +', '+ // idtppagtobenefic
                     ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                     ' NULL,                                                                      '+ // datafinal
                     OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +', '+
                     ' TO_DATE('''+qryPessoas.FieldByName('DATAMIGRACAO').AsString+''',''DD/MM/YYYY''), '+ // datarequerimento
                     '''F'',                                                                       '+
                     OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                     'NULL,                                                                        '+
                     '''0000/00'',                                                                 '+
                     ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                           '+
                     '0,                                                                           '+
                     OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                     'SYSDATE,                                                                     '+
                     'NULL,                                                                        '+
                     '0,                                                                           '+
                     'NULL,                                                                        '+ // fontepagadora
                     '''0000/00'',                                                                  '+
                     '0,                                                                           '+
                     'NULL,                                                                        '+
                     OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                     '0,                                                                           '+
                     'NULL,                                                                        '+
                     '33)');

      try
         qryAux.ExecSQL;
      except
         exit;
      end;
      prValorAtualizadoRateado := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
      prValorAtualizadoTotal   := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
      psUltMesReajuste         := '0000/00';
      pbPreparaContrib13       := False;
      dValorSRB                := 0;

      if not PreparaBeneficioConcedido( qryAux,
                                        qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                        qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                        qryPessoas.FieldByName('SEQPROPOSTA').AsInteger,
                                        qryPessoas.FieldByName('IDPESSJUR').AsInteger,
                                        33,
                                        iNumeroProcesso,
                                        StrToInt(sIdBeneficio),
                                        4,
                                        1,
                                        -1,
                                        -1,
                                        -1,
                                        -1,
                                        1, // idtppagto
                                        -1,
                                        'CD - INC MIG - 32,75% SB - APOSENTADO',
                                        '',
                                        '',
                                        qryPessoas.FieldByName('MATRICULA').AsString,
                                        dtInscricao.Text,
                                        '', 
                                        '0',
                                        qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                        0,
                                        qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                        False,
                                        prValorAtualizadoRateado,
                                        prValorAtualizadoTotal,
                                        psUltMesReajuste,
                                        bErro,
                                        pbPreparaContrib13,
                                        sMsgErro,
                                        iIdLote,
                                        dtInscricao.Text,
                                        7,
                                        0,
                                        dValorSRB )
      then Exit;
   end;
   Result := True;
end;


function TfrmMigraPlanoFCRT.InsereBeneficiosBeneficiarios : boolean;
var iNumeroProcesso           : longint;
    sIdTpPagtoBenefic,
    sIdBeneficio              : string;
    prValorAtualizadoRateado,
    prValorAtualizadoTotal    : double;
    psUltMesReajuste          : string;
    bErro, pbPreparaContrib13 : boolean;
    sMsgErro                  : string;
    iIdLote                   : longint;
    dValorSRB                 : double;
    iNumBenef                 : word;
    dValorBenef               : double;

begin
   Result := False;

   iNumeroProcesso := LeUltRegistro(nil,'PROCESSOBENEF');
   iIdLote         := qryLotesAbertos.FieldByName('IDLOTE').AsInteger;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO PROCESSOBENEF ( NUMEROPROCESSO,   '+
                  '                             IDEVENTOGERADOR,  '+
                  '                             FLGACIDENTAL,     '+
                  '                             DTEVENTO,         '+
                  '                             DTDIREITO,        '+
                  '                             DTREGISTRO,       '+
                  '                             IDSITPROCESSO )   '+
                  ' VALUES ( '+IntToStr(iNumeroProcesso)      +', '+
                  OraNumero(sIdEventoGerador)                 +', '+
                  ' 0,                                            '+
                  ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''), '+
                  ' NULL,                                         '+
                  ' SYSDATE,                                      '+
                  ' 1 )                                           ');
   try
      qryAux.ExecSQL;
   except
      Exit;
   end;


   with qryDepen do
   begin
      Close;
      ParamByName('IDTITULAR').AsInteger := qryPessoas.FieldByName('IDPESSOA').AsInteger;
      Open;
   end;
   iNumBenef := qryDepen.RecordCount;

   qryDepen.First;

   while not qryDepen.Eof do
   begin

      if (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '1') or
         (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '2')
      then begin
         // Incentivo de 32,75%
         if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AS'
         then sIdBeneficio := '122'
         else if qryPessoas.FieldByName('FLGINTERNO').AsString = 'FL'
         then sIdBeneficio := '135'
         else Exit;


         // Verificar Incentivo de 32.75%
         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS VALORAMIGRAR '+
                        ' FROM   PREVIAMIGRAPLANO P                      '+
                        ' WHERE  P.CODCAMPOMIGRA = ''510''               '+
                        ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                        ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                        ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                        ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
         qryAux2.Open;

         if qryAux2.FieldbyName('VALORAMIGRAR').AsFloat > 0
         then begin

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN( IDTITULAR,    '+
                           '                              IDPESSJUR,    '+
                           '                              IDPLANOPREV,  '+
                           '                              IDPESSOA,     '+
                           '                              IDRESPONSAVEL,'+
                           '                              IDBENEFICIO,  '+
                           '                              SEQPROPOSTA,  '+
                           '                              PRIORIDADE,   '+
                           '                              PERCENTUAL,   '+
                           '                              IDPLANOORIGEM) '+
                           ' VALUES ( '+
                           qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                           '33,                                                                     '+
                           qryDepen.FieldByName('IDPESSOA').AsString                                +', '+
                           qryDepen.FieldByName('IDPESSOA').AsString                                +', '+
                           sIdBeneficio                                                             +', '+
                           qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                           '0, 0,'+
                           '33)');
            try
               qryAux.ExecSQL;
            except
            end;

            dValorBenef := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat / iNumBenef;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (                                                '+
                           ' NUMEROPROCESSO,     IDPLANOPREV,      IDTITULAR,         IDPESSJUR,        '+
                           ' IDBENEFICIO,        IDPESSOA,         SEQPROPOSTA,       IDSITBENEFICIO,   '+
                           ' IDTPPAGTOBENEFIC,   DATAINICIO,       DATAFINAL,         VALORATUAL,       '+
                           ' DATAREQUERIMENTO,   FLGFORMAPAGTO,    VALORCALCULADO,    DATAULTREAJUSTE,  '+
                           ' ULTMESPREPARO,      DATAINICIOFUND,   FLGBENEFMIN,       VALORTOTAL,       '+
                           ' DATACONCESSAO,      DATAENCERRAMENTO, FLGPROVISORIO,     FONTEPAGADORA,    '+
                           ' ULTMESREAJUSTE,     FLGDATAPREVISTA,  DATAFINALPREVISTA, VALORNADIB,       '+
                           ' FLGPOSSUIACOMPINSS, VALORSRB,         IDPLANOORIGEM)                       '+
                           ' VALUES ( '+IntToStr(iNumeroProcesso)                                   +', '+
                           ' 33,                                                                        '+
                           qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                           sIdBeneficio                                                             +', '+
                           qryDepen.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                           '3,                                                                          '+ // idsitbeneficio
                           '1,                                                                          '+ // idtppagtobenefic
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                           OraNumero(FloatToStr(dValorBenef))                                       +', '+
                           ' TO_DATE('''+qryPessoas.FieldByName('DATAMIGRACAO').AsString+''',''DD/MM/YYYY''), '+ // datarequerimento
                           '''F'',                                                                       '+
                           OraNumero(FloatToStr(dValorBenef))                                        +', '+
                           'NULL,                                                                        '+
                           '''0000/00'',                                                                 '+
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                           '+
                           '0,                                                                           '+
                           OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                           'SYSDATE,                                                                     '+
                           'NULL,                                                                        '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+ // fontepagadora
                           '''0000/00'',                                                                  '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+
                           OraNumero(FloatToStr(dValorBenef))                                        +', '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+
                           '33)');

            try
               qryAux.ExecSQL;
            except
               exit;
            end;
            prValorAtualizadoRateado := dValorBenef;
            prValorAtualizadoTotal   := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
            psUltMesReajuste         := '0000/00';
            pbPreparaContrib13       := False;
            dValorSRB                := 0;

            if not PreparaBeneficioConcedido( qryAux,
                                              qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                              qryDepen.FieldByName('IDPESSOA').AsInteger,
                                              qryPessoas.FieldByName('SEQPROPOSTA').AsInteger,
                                              qryPessoas.FieldByName('IDPESSJUR').AsInteger,
                                              33,
                                              iNumeroProcesso,
                                              StrToInt(sIdBeneficio),
                                              4,
                                              iNumBenef,
                                              -1,
                                              -1,
                                              -1,
                                              -1,
                                              1, // idtppagto
                                              -1,
                                              'CD - INC MIG - 32,75% SB - APOSENTADO',
                                              '',
                                              '',
                                              qryPessoas.FieldByName('MATRICULA').AsString,
                                              dtInscricao.Text,
                                              dtInscricao.Text,
                                              '0',
                                              dValorBenef,
                                              0,
                                              qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                              False,
                                              prValorAtualizadoRateado,
                                              prValorAtualizadoTotal,
                                              psUltMesReajuste,
                                              bErro,
                                              pbPreparaContrib13,
                                              sMsgErro,
                                              iIdLote,
                                              dtInscricao.Text,
                                              7,
                                              0,
                                              dValorSRB )
            then Exit;
         end;
      end;


      // Verificar Incentivo Fixo
      if (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '1') or
         (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '2')
      then begin
         if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AS'
         then sIdBeneficio := '121'
         else if qryPessoas.FieldByName('FLGINTERNO').AsString = 'FL'
         then sIdBeneficio := '134'
         else Exit;

         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS VALORAMIGRAR '+
                        ' FROM   PREVIAMIGRAPLANO P                         '+
                        ' WHERE  P.CODCAMPOMIGRA = ''509''                  '+
                        ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                        ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                        ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                        ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
         qryAux2.Open;

         if qryAux2.FieldbyName('VALORAMIGRAR').AsFloat > 0
         then begin
            dValorBenef := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat / iNumBenef;

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN( IDTITULAR,    '+
                           '                              IDPESSJUR,    '+
                           '                              IDPLANOPREV,  '+
                           '                              IDPESSOA,     '+
                           '                              IDRESPONSAVEL,'+
                           '                              IDBENEFICIO,  '+
                           '                              SEQPROPOSTA,  '+
                           '                              PRIORIDADE,   '+
                           '                              PERCENTUAL,   '+
                           '                              IDPLANOORIGEM) '+
                           ' VALUES ( '+
                           qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                           '33,                                                                     '+
                           qryDepen.FieldByName('IDPESSOA').AsString                                +', '+
                           qryDepen.FieldByName('IDPESSOA').AsString                                +', '+
                           sIdBeneficio                                                             +', '+
                           qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                           '0, 0,'+
                           '33)');
            try
               qryAux.ExecSQL;
            except
            end;

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (                                                '+
                           ' NUMEROPROCESSO,     IDPLANOPREV,      IDTITULAR,         IDPESSJUR,        '+
                           ' IDBENEFICIO,        IDPESSOA,         SEQPROPOSTA,       IDSITBENEFICIO,   '+
                           ' IDTPPAGTOBENEFIC,   DATAINICIO,       DATAFINAL,         VALORATUAL,       '+
                           ' DATAREQUERIMENTO,   FLGFORMAPAGTO,    VALORCALCULADO,    DATAULTREAJUSTE,  '+
                           ' ULTMESPREPARO,      DATAINICIOFUND,   FLGBENEFMIN,       VALORTOTAL,       '+
                           ' DATACONCESSAO,      DATAENCERRAMENTO, FLGPROVISORIO,     FONTEPAGADORA,    '+
                           ' ULTMESREAJUSTE,     FLGDATAPREVISTA,  DATAFINALPREVISTA, VALORNADIB,       '+
                           ' FLGPOSSUIACOMPINSS, VALORSRB,         IDPLANOORIGEM)                       '+
                           ' VALUES ( '+IntToStr(iNumeroProcesso)                                   +', '+
                           ' 33,                                                                        '+
                           qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                           sIdBeneficio                                                             +', '+
                           qryDepen.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                           '3,                                                                          '+ // idsitbeneficio
                           '1,                                                                          '+ // idtppagtobenefic
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                           OraNumero(FloatToStr(dValorBenef))                                        +', '+
                           ' TO_DATE('''+qryPessoas.FieldByName('DATAMIGRACAO').AsString+''',''DD/MM/YYYY''), '+ // datarequerimento
                           '''F'',                                                                       '+
                           OraNumero(FloatToStr(dValorBenef))                                        +', '+
                           'NULL,                                                                        '+
                           '''0000/00'',                                                                 '+
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                           '+
                           '0,                                                                           '+
                           OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                           'SYSDATE,                                                                     '+
                           'NULL,                                                                        '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+ // fontepagadora
                           '''0000/00'',                                                                  '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+
                           OraNumero(FloatToStr(dValorBenef))                                        +', '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+
                           '33)');

            try
               qryAux.ExecSQL;
            except
               exit;
            end;

            prValorAtualizadoRateado := dValorBenef;
            prValorAtualizadoTotal   := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
            psUltMesReajuste         := '0000/00';
            pbPreparaContrib13       := False;
            dValorSRB                := 0;

            if not PreparaBeneficioConcedido( qryAux,
                                              qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                              qryDepen.FieldByName('IDPESSOA').AsInteger,
                                              qryPessoas.FieldByName('SEQPROPOSTA').AsInteger,
                                              qryPessoas.FieldByName('IDPESSJUR').AsInteger,
                                              33,
                                              iNumeroProcesso,
                                              StrToInt(sIdBeneficio),
                                              4,
                                              iNumBenef,
                                              -1,
                                              -1,
                                              -1,
                                              -1,
                                              1, // idtppagto
                                              -1,
                                              'CD - INC MIG - 32,75% SB - APOSENTADO',
                                              '',
                                              '',
                                              qryPessoas.FieldByName('MATRICULA').AsString,
                                              dtInscricao.Text,
                                              dtInscricao.Text,
                                              '0',
                                              dValorBenef,
                                              0,
                                              qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                              False,
                                              prValorAtualizadoRateado,
                                              prValorAtualizadoTotal,
                                              psUltMesReajuste,
                                              bErro,
                                              pbPreparaContrib13,
                                              sMsgErro,
                                              iIdLote,
                                              dtInscricao.Text,
                                              7,
                                              0,
                                              dValorSRB )
            then Exit;
         end;
      end;


      // Verificar Resgate de 10% da RT
      if (Trim(qryPessoas.FieldByName('OPCAO').AsString) = '2')
      then begin
         if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AS'
         then sIdBeneficio := '133'
         else if qryPessoas.FieldByName('FLGINTERNO').AsString = 'FL'
         then sIdBeneficio := '136'
         else Exit;

         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS VALORAMIGRAR '+
                         ' FROM   PREVIAMIGRAPLANO P                         '+
                         ' WHERE  P.CODCAMPOMIGRA = ''512''                  '+
                         ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                         ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                         ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                         ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
         qryAux2.Open;

         if qryAux2.FieldbyName('VALORAMIGRAR').AsFloat > 0
         then begin
            dValorBenef := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat / iNumBenef;

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN( IDTITULAR,    '+
                           '                              IDPESSJUR,    '+
                           '                              IDPLANOPREV,  '+
                           '                              IDPESSOA,     '+
                           '                              IDRESPONSAVEL,'+
                           '                              IDBENEFICIO,  '+
                           '                              SEQPROPOSTA,  '+
                           '                              PRIORIDADE,   '+
                           '                              PERCENTUAL,   '+
                           '                              IDPLANOORIGEM) '+
                           ' VALUES ( '+
                           qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                           '33,                                                                     '+
                           qryDepen.FieldByName('IDPESSOA').AsString                                +', '+
                           qryDepen.FieldByName('IDPESSOA').AsString                                +', '+
                           sIdBeneficio                                                             +', '+
                           qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                           '0, 0,'+
                           '33)');
            try
               qryAux.ExecSQL;
            except
            end;
         
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (                                                '+
                           ' NUMEROPROCESSO,     IDPLANOPREV,      IDTITULAR,         IDPESSJUR,        '+
                           ' IDBENEFICIO,        IDPESSOA,         SEQPROPOSTA,       IDSITBENEFICIO,   '+
                           ' IDTPPAGTOBENEFIC,   DATAINICIO,       DATAFINAL,         VALORATUAL,       '+
                           ' DATAREQUERIMENTO,   FLGFORMAPAGTO,    VALORCALCULADO,    DATAULTREAJUSTE,  '+
                           ' ULTMESPREPARO,      DATAINICIOFUND,   FLGBENEFMIN,       VALORTOTAL,       '+
                           ' DATACONCESSAO,      DATAENCERRAMENTO, FLGPROVISORIO,     FONTEPAGADORA,    '+
                           ' ULTMESREAJUSTE,     FLGDATAPREVISTA,  DATAFINALPREVISTA, VALORNADIB,       '+
                           ' FLGPOSSUIACOMPINSS, VALORSRB,         IDPLANOORIGEM)                       '+
                           ' VALUES ( '+IntToStr(iNumeroProcesso)                                   +', '+
                           ' 33,                                                                        '+
                           qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                           sIdBeneficio                                                             +', '+
                           qryDepen.FieldByName('IDPESSOA').AsString                              +', '+
                           qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                           '3,                                                                          '+ // idsitbeneficio
                           '1,                                                                          '+ // idtppagtobenefic
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                           OraNumero(FloatToStr(dValorBenef))                                        +', '+
                           ' TO_DATE('''+qryPessoas.FieldByName('DATAMIGRACAO').AsString+''',''DD/MM/YYYY''), '+ // datarequerimento
                           '''F'',                                                                       '+
                           OraNumero(FloatToStr(dValorBenef))                                        +', '+
                           'NULL,                                                                        '+
                           '''0000/00'',                                                                 '+
                           ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                           '+
                           '0,                                                                           '+
                           OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                           'SYSDATE,                                                                     '+
                           'NULL,                                                                        '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+ // fontepagadora
                           '''0000/00'',                                                                  '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+
                           OraNumero(FloatToStr(dValorBenef))                                        +', '+
                           '0,                                                                           '+
                           'NULL,                                                                        '+
                           '33)');

            try
               qryAux.ExecSQL;
            except
               exit;
            end;

            prValorAtualizadoRateado := dValorBenef;
            prValorAtualizadoTotal   := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
            psUltMesReajuste         := '0000/00';
            pbPreparaContrib13       := False;
            dValorSRB                := 0;

            if not PreparaBeneficioConcedido( qryAux,
                                              qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                              qryDepen.FieldByName('IDPESSOA').AsInteger,
                                              qryPessoas.FieldByName('SEQPROPOSTA').AsInteger,
                                              qryPessoas.FieldByName('IDPESSJUR').AsInteger,
                                              33,
                                              iNumeroProcesso,
                                              StrToInt(sIdBeneficio),
                                              4,
                                              iNumBenef,
                                              -1,
                                              -1,
                                              -1,
                                              -1,
                                              1, // idtppagto
                                              -1,
                                              'CD - INC MIG - 32,75% SB - APOSENTADO',
                                              '',
                                              '',
                                              qryPessoas.FieldByName('MATRICULA').AsString,
                                              dtInscricao.Text,
                                              dtInscricao.Text,
                                              '0',
                                              dValorBenef,
                                              0,
                                              qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                              False,
                                              prValorAtualizadoRateado,
                                              prValorAtualizadoTotal,
                                              psUltMesReajuste,
                                              bErro,
                                              pbPreparaContrib13,
                                              sMsgErro,
                                              iIdLote,
                                              dtInscricao.Text,
                                              7,
                                              0,
                                              dValorSRB )
            then Exit;
         end;
      end;

      // Verificar Beneficio
      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS IDBENEFICIO '+
                     ' FROM   PREVIAMIGRAPLANO P                        '+
                     ' WHERE  P.CODCAMPOMIGRA = ''IDBENEF''             '+
                     ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                     ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
      qryAux2.Open;

      if qryAux2.FieldbyName('IDBENEFICIO').AsInteger > 0
      then begin
         if   qryAux2.FieldbyName('IDBENEFICIO').AsInteger    = 5
         then sIdBeneficio := '127'
         else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 6
         then sIdBeneficio := '128'
         else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 7
         then sIdBeneficio := '125'
         else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 8
         then sIdBeneficio := '124'
         else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 9
         then sIdBeneficio := '126'
         else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 11
         then sIdBeneficio := '129'
         else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 14
         then sIdBeneficio := '131'
         else if qryAux2.FieldbyName('IDBENEFICIO').AsInteger = 18
         then sIdBeneficio := '130'
         else Exit;

         if sIdBeneficio = '131'
         then sIdTpPagtoBenefic := '3'
         else sIdTpPagtoBenefic := '2';

         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.Add(' SELECT TO_NUMBER(P.VALORAMIGRAR) AS VALORAMIGRAR '+
                         ' FROM   PREVIAMIGRAPLANO P                        '+
                         ' WHERE  P.CODCAMPOMIGRA = ''303''                 '+
                         ' AND    P.IDPESSJUR     = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                         ' AND    P.IDPLANOPREV   = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                         ' AND    P.IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                         ' AND    P.SEQPROPOSTA   = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString );
         qryAux2.Open;

         dValorBenef := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat / iNumBenef;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BFCIARIOTITPLAN( IDTITULAR,    '+
                        '                              IDPESSJUR,    '+
                        '                              IDPLANOPREV,  '+
                        '                              IDPESSOA,     '+
                        '                              IDRESPONSAVEL,'+
                        '                              IDBENEFICIO,  '+
                        '                              SEQPROPOSTA,  '+
                        '                              PRIORIDADE,   '+
                        '                              PERCENTUAL,   '+
                        '                              IDPLANOORIGEM) '+
                        ' VALUES ( '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                        '33,                                                                     '+
                        qryDepen.FieldByName('IDPESSOA').AsString                                +', '+
                        qryDepen.FieldByName('IDPESSOA').AsString                                +', '+
                        sIdBeneficio                                                             +', '+
                        qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                        '0, 0,'+
                        '33)');
         try
            qryAux.ExecSQL;
         except
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' INSERT INTO BENEFBFCIARIO (                                                '+
                        ' NUMEROPROCESSO,     IDPLANOPREV,      IDTITULAR,         IDPESSJUR,        '+
                        ' IDBENEFICIO,        IDPESSOA,         SEQPROPOSTA,       IDSITBENEFICIO,   '+
                        ' IDTPPAGTOBENEFIC,   DATAINICIO,       DATAFINAL,         VALORATUAL,       '+
                        ' DATAREQUERIMENTO,   FLGFORMAPAGTO,    VALORCALCULADO,    DATAULTREAJUSTE,  '+
                        ' ULTMESPREPARO,      DATAINICIOFUND,   FLGBENEFMIN,       VALORTOTAL,       '+
                        ' DATACONCESSAO,      DATAENCERRAMENTO, FLGPROVISORIO,     FONTEPAGADORA,    '+
                        ' ULTMESREAJUSTE,     FLGDATAPREVISTA,  DATAFINALPREVISTA, VALORNADIB,       '+
                        ' FLGPOSSUIACOMPINSS, VALORSRB,         IDPLANOORIGEM)                       '+
                        ' VALUES ( '+IntToStr(iNumeroProcesso)                                   +', '+
                        ' 33,                                                                        '+
                        qryPessoas.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('IDPESSJUR').AsString                             +', '+
                        sIdBeneficio                                                             +', '+
                        qryDepen.FieldByName('IDPESSOA').AsString                              +', '+
                        qryPessoas.FieldByName('SEQPROPOSTA').AsString                           +', '+
                        '1,                                                                          '+ // idsitbeneficio
                        sIdTpPagtoBenefic                                                        +', '+ // idtppagtobenefic
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                          '+ // datainicio
                        ' NULL,                                                                      '+ // datafinal
                        OraNumero(FloatToStr(dValorBenef))                                        +', '+
                        ' TO_DATE('''+qryPessoas.FieldByName('DATAMIGRACAO').AsString+''',''DD/MM/YYYY''), '+ // datarequerimento
                        '''F'',                                                                       '+
                        OraNumero(FloatToStr(dValorBenef))                                        +', '+
                        'NULL,                                                                        '+
                        '''0000/00'',                                                                 '+
                        ' TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),                           '+
                        '0,                                                                           '+
                        OraNumero(qryAux2.FieldbyName('VALORAMIGRAR').AsString)                   +',  '+
                        'SYSDATE,                                                                     '+
                        'NULL,                                                                        '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+ // fontepagadora
                        '''0000/00'',                                                                  '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+
                        OraNumero(FloatToStr(dValorBenef))                                        +', '+
                        '0,                                                                           '+
                        'NULL,                                                                        '+
                        '33)');

         try
            qryAux.ExecSQL;
         except
            exit;
         end;
         prValorAtualizadoRateado := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
         prValorAtualizadoTotal   := qryAux2.FieldbyName('VALORAMIGRAR').AsFloat;
         psUltMesReajuste         := '0000/00';
         pbPreparaContrib13       := False;
         dValorSRB                := 0;

         if not PreparaBeneficioConcedido( qryAux,
                                           qryPessoas.FieldByName('IDPESSOA').AsInteger,
                                           qryDepen.FieldByName('IDPESSOA').AsInteger,
                                           qryPessoas.FieldByName('SEQPROPOSTA').AsInteger,
                                           qryPessoas.FieldByName('IDPESSJUR').AsInteger,
                                           33,
                                           iNumeroProcesso,
                                           StrToInt(sIdBeneficio),
                                           4,
                                           1,
                                           -1,
                                           -1,
                                           -1,
                                           -1,
                                           1, // idtppagto
                                           -1,
                                           'CD - INC MIG - 32,75% SB - APOSENTADO',
                                           '',
                                           '',
                                           qryPessoas.FieldByName('MATRICULA').AsString,
                                           dtInscricao.Text,
                                           '', 
                                           '0',
                                           dValorBenef,
                                           0,
                                           qryAux2.FieldbyName('VALORAMIGRAR').AsFloat,
                                           False,
                                           prValorAtualizadoRateado,
                                           prValorAtualizadoTotal,
                                           psUltMesReajuste,
                                           bErro,
                                           pbPreparaContrib13,      
                                           sMsgErro,
                                           iIdLote,
                                           dtInscricao.Text,
                                           7,
                                           0,
                                           dValorSRB )
         then Exit;
      end;                        

      qryDepen.Next;
   end;

   Result := True;
end;

function TfrmMigraPlanoFCRT.AcertaReservasCD : boolean;
begin
   Result := False;
   // Se for AUTOPATROCINADO, migrar contas 10112 e 20204
   if qryPessoas.FieldByName('FLGINTERNO').AsString = 'MA'
   then begin
      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = ( SELECT TO_NUMBER(P.VALORAMIGRAR) '+
                     '                                           FROM   PREVIAMIGRAPLANO P        '+
                     '                                           WHERE  P.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     '                                           AND    P.IDPLANOPREV    = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                     '                                           AND    P.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     '                                           AND    P.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     '                                           AND    P.CODCAMPOMIGRA  = ''CPIAUTOPAT'')                                 '+

                     ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    R.IDPLANOPREV    = 33 '                                             +
                     ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    R.IDTIPORESERVA  = 50 ');
      try
         qryAux.ExecSQL;
      except
         Exit;
      end;

      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = ( SELECT TO_NUMBER(P.VALORAMIGRAR)-TO_NUMBER(P2.VALORAMIGRAR) '+
                     '                                           FROM   PREVIAMIGRAPLANO P, PREVIAMIGRAPLANO P2    '+
                     '                                           WHERE  P.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     '                                           AND    P.IDPLANOPREV    = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                     '                                           AND    P.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     '                                           AND    P.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     '                                           AND    P.CODCAMPOMIGRA  = ''CPIOP2''   '+
                     '                                           AND    P2.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     '                                           AND    P2.IDPLANOPREV    = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                     '                                           AND    P2.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     '                                           AND    P2.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     '                                           AND    P2.CODCAMPOMIGRA = ''CPIAUTOPAT'' ) '+
                     ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    R.IDPLANOPREV    = 33 '                                             +
                     ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    R.IDTIPORESERVA  = 32 ');
      try
         qryAux.ExecSQL;
      except
         Exit;
      end;
   end;

   if qryPessoas.FieldByName('FLGINTERNO').AsString = 'AT'
   then begin
      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.Add(' UPDATE RESERVAPART R SET VALORRESERVA = ( SELECT TO_NUMBER(P.VALORAMIGRAR) '+
                     '                                           FROM   PREVIAMIGRAPLANO P        '+
                     '                                           WHERE  P.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     '                                           AND    P.IDPLANOPREV    = '+qryPessoas.FieldByName('IDPLANOPREV').AsString +
                     '                                           AND    P.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     '                                           AND    P.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     '                                           AND    P.CODCAMPOMIGRA  = ''CPIOP2'')                                 '+

                     ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    R.IDPLANOPREV    = 33 '                                             +
                     ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    R.IDTIPORESERVA  = 72 ');
      try
         qryAux.ExecSQL;
      except
         Exit;
      end;
   end;

   if ( (qryPessoas.FieldByName('FLGINTERNO').AsString = 'AT') or
        (qryPessoas.FieldByName('FLGINTERNO').AsString = 'MA') )   and
      (  qryPessoas.FieldByName('OPCAO').AsString      <> '3'  )
   then begin
      qryAux.Close;
      qryAux.SQL.clear;
      qryAux.SQL.Add(' UPDATE RESERVAPART R SET VALORRESERVA = 0 '+
                     ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    R.IDPLANOPREV    = 33 '                                             +
                     ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    R.IDTIPORESERVA  IN (16,17)  ');
      try
         qryAux.ExecSQL;
      except
         Exit;
      end;
   end;

   if qryPessoas.FieldByName('OPCAO').AsString = '3'
   then begin
      qryAux.Close;
      qryAux.SQL.clear;
      qryAux.SQL.Add(' UPDATE RESERVAPART R SET VALORRESERVA = 0 '+
                     ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    R.IDPLANOPREV    = 33 '                                             +
                     ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    R.IDTIPORESERVA  IN (58,43) ');
      try
         qryAux.ExecSQL;
      except
         Exit;
      end;
   end;

   if (qryPessoas.FieldByName('FLGINTERNO').AsString = 'AS') or (qryPessoas.FieldByName('FLGINTERNO').AsString = 'FL')
   then begin
      qryAux.Close;
      qryAux.SQL.clear;
      qryAux.SQL.Add(' UPDATE RESERVAPART R SET VALORRESERVA = 0 '+
                     ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                     ' AND    R.IDPLANOPREV    = 33 '                                             +
                     ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                     ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    R.IDTIPORESERVA  IN (21,22,23)  ');
      try
         qryAux.ExecSQL;
      except
         Exit;
      end;

      if qryPessoas.FieldbyName('OPCAO').AsInteger = 1
      then begin
         qryAux.Close;
         qryAux.SQL.clear;
         qryAux.SQL.Add(' UPDATE RESERVAPART R SET VALORRESERVA = 0 '+
                        ' WHERE  R.IDPESSJUR      = '+qryPessoas.FieldByName('IDPESSJUR').AsString   +
                        ' AND    R.IDPLANOPREV    = 33 '                                             +
                        ' AND    R.IDPESSOA       = '+qryPessoas.FieldByName('IDPESSOA').AsString    +
                        ' AND    R.SEQPROPOSTA    = '+qryPessoas.FieldByName('SEQPROPOSTA').AsString +
                        ' AND    R.IDTIPORESERVA  IN (64,65)  ');
         try
            qryAux.ExecSQL;
         except
            Exit;
         end;
      end;
   end;

   Result := True;
end;

function TfrmMigraPlanoFCRT.AtualizaReservaTR                  : boolean;
var sDataBase      : string;
    sDataInscricao : string;
    sIniPeriodo    : string;
    sFimPeriodo    : string;
    sAnoMesAtual   : string;
    sDataCota      : string;
    iUltDiaMes     : integer;
    dValorTR       : double;
    dValorRecebido : double;
begin
   Result := False;

   // Buscar Data Base
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT VALORAMIGRAR FROM PREVIAMIGRAPLANO '+
              ' WHERE  IDPESSOA      = '+qryPessoas.FieldByName('IDPESSOA').AsString+
              ' AND    CODCAMPOMIGRA = ''DATABASE'' ');
      Open;
      if IsEmpty
      then sDataBase := SAnoMesAnterior(Copy(qryPessoas.FieldByName('DATAMIGRACAO').AsString,7,4)+'/'+Copy(qryPessoas.FieldByName('DATAMIGRACAO').AsString,4,2))
      else sDataBase := Copy(Trim(qryAux.FieldByName('VALORAMIGRAR').AsString),7,4)+'/'+Copy(Trim(qryAux.FieldByName('VALORAMIGRAR').AsString),4,2);
   end;

   sDataInscricao := dtInscricao.Text;

   sIniPeriodo    := ProximoAnoMes(StrToInt(Copy(sDataBase,6,2)), StrToInt(Copy(sDataBase,1,4)));
   sFimPeriodo    := SAnoMesAnterior(Copy(sDataInscricao,7,4)+'/'+Copy(sDataInscricao,4,2));
   sAnoMesAtual   := sIniPeriodo;

   while sAnoMesAtual <= sFimPeriodo do
   begin

      // ***********************************************************************
      //                      ATUALIZAÇÃO PELA TR
      // ***********************************************************************
      // Buscar TR
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                     ' FROM   COTACAOMOEDA      '+
                     ' WHERE  MOECODIGO = 45    '+
                     ' AND    TO_CHAR(COTDATA,''YYYY/MM'') <= ''' + sAnoMesAtual + ''''+
                     ' ORDER BY COTDATA DESC ');
      qryAux.Open;
      qryAux.First;
      if qryAux.IsEmpty
      then begin
         sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
         continue;
      end;
      dValorTR       := qryAux.FieldByName('COTVALOR').AsFloat;

      qryAux.Close;
      qryAux.SQL.Clear;
      // Verificar Opcao
      if qryPessoas.FieldByName('OPCAO').AsInteger <> 3
      then begin // Opcao 1 ou 2 -> Atualizar contas 3.02.01  e 3.02.02
         qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA * '+OraNumero(FloatToStr(dValorTR))+
                        ' WHERE  IDPESSOA = '+qryPessoas.FieldbyName('IDPESSOA').AsString +
                        ' AND    IDTIPORESERVA IN (41,42) ');

      end
      else begin // Opcao 3      -> Atualizar contas 1.01.05, 1.01.06, 3.02.01 e 3.02.02
         qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA * '+OraNumero(FloatToStr(dValorTR))+
                        ' WHERE  IDPESSOA = '+qryPessoas.FieldbyName('IDPESSOA').AsString +
                        ' AND    IDTIPORESERVA IN (16,17,41,42) ');
      end;

      try
         qryAux.ExecSQL;
      except
         Exit;
      end;

      // ***********************************************************************
      //                      ACRESCIMO DAS CONTRIBUICOES
      // ***********************************************************************
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT SUM(DECODE(H.FLGDEVOLUCAO,1,-H.VALORRECEBIDO, H.VALORRECEBIDO)) AS VALORRECEBIDO '+
                     ' FROM   HSTCONTRIBPREV H, CONTPREV CP                                                    '+
                     ' WHERE  H.IDPESSOA        = '+qryPessoas.FieldByName('IDPESSOA').AsString                 +
                     ' AND    H.SEQPROPOSTA     = 1                                                            '+
                     ' AND    H.MESREFERENCIA   = '''+sAnoMesAtual+''''+
                     ' AND    H.MESCOBRANCA     = '''+sAnoMesAtual+''''+
                     ' AND    H.VALORRECEBIDO   > 0                   '+
                     ' AND    H.VALORRECEBIDO   IS NOT NULL           '+
                     ' AND    ( NOT H.IDCONTRIBUICAO IN (5,6,10,11,12,14,39,40,41) ) '+
                     ' AND    CP.IDPLANOPREV    = H.IDPLANOPREV       '+
                     ' AND    CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO    '+
                     ' AND    CP.FLGPAGADOR     = ''C''               ');
      qryAux.Open;

      if qryAux.FieldbyName('VALORRECEBIDO').AsFloat > 0
      then begin
         dValorRecebido := qryAux.FieldbyName('VALORRECEBIDO').AsFloat;

         qryAux.Close;
         qryAux.SQL.Clear;
         // Verificar Opcao
         if qryPessoas.FieldByName('OPCAO').AsInteger <> 3
         then begin // Opcao 1 ou 2 -> Atualizar contas 3.02.01
            qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA + '+OraNumero(FloatToStr(dValorRecebido))+
                           ' WHERE  IDPESSOA = '+qryPessoas.FieldbyName('IDPESSOA').AsString +
                           ' AND    IDTIPORESERVA = 41 ');

         end
         else begin // Opcao 3      -> Atualizar contas 1.01.05, 1.01.06, 3.02.01 e 3.02.02
            qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA + '+OraNumero(FloatToStr(dValorRecebido))+
                           ' WHERE  IDPESSOA = '+qryPessoas.FieldbyName('IDPESSOA').AsString +
                           ' AND    IDTIPORESERVA IN (16,41) ');
         end;

         try
            qryAux.ExecSQL;
         except
            Exit;
         end;
      end;
      sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
   end;

   Result := True;
end;

function TfrmMigraPlanoFCRT.TransformaReservasEmCotas          : boolean;
var dValorCOTA : double;
begin
   Result := False;

   // ***********************************************************************
   //                      TRANSFORMACAO EM COTAS
   // ***********************************************************************
   // Buscar COTA BRTPREV
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT COTVALOR, COTDATA '+
                  ' FROM   COTACAOMOEDA      '+
                  ' WHERE  MOECODIGO = 112    '+
                  ' AND    TO_CHAR(COTDATA,''YYYY/MM/DD'') <= ''' + Copy(dtInscricao.Text,7,4)+'/'+Copy(dtInscricao.Text,4,2)+'/'+Copy(dtInscricao.Text,1,2)+''''+
                  ' ORDER BY COTDATA DESC ');
   qryAux.Open;
   qryAux.First;
   if qryAux.IsEmpty
   then begin
      Result := True;
      Exit;
   end;
   dValorCOTA       := qryAux.FieldByName('COTVALOR').AsFloat;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA = VALORRESERVA / '+OraNumero(FloatToStr(dValorCOTA))+
                  ' WHERE  IDPESSOA = '+qryPessoas.FieldbyName('IDPESSOA').AsString +
                  ' AND    IDTIPORESERVA IN (12,13,14,15,16,17,18,19,20,47,48,50,26,27,72) ');


   try
      qryAux.ExecSQL;
   except
      Exit;
   end;


   Result := True;
end;

end.


