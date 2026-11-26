// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Nº SIG.....: SIG TIBERO
// Data.......: 05/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Rotina      : Tela
// Autor(a)    : Camille
// Data        : 27.08.2004
// Pendência   : -----
// Alteração   : Padronização da Tela
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Gleyber
// Data        : 25/03/2004
// Pendência   : 16354
// Alteração   : Atribuindo valor à variável sIdTitular do componente ConsPart.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FEventoTransfReserva;

interface
                                                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, cmseldlg, URegra, TREdit, TB97Tlbr, UConsPart, IvDictio,
  IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEventoTransfReserva = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    qryRegra: TwwQuery;
    regCalculo: TRegra;
    qryGrava: TwwQuery;
    qrymov: TwwQuery;
    Panel1: TPanel;
    SaveDlg: TSaveDialog;
    MonSelReserva: TMontaSelect;
    Panel3: TPanel;
    Label4: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    edPlano: TEdit;
    Panel4: TPanel;
    Label21: TLabel;
    lblSitPatro: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    Panel6: TPanel;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    bbtnProcurar: TBitBtn;
    pnlInformacao: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label9: TLabel;
    Label13: TLabel;
    pnlreal: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    edValorReservaMoeda: TEdit;
    edValorReservaDestMoeda: TEdit;
    pnlcotas: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    edValorReservaCotas: TEdit;
    edValorReservaDestCotas: TEdit;
    dtEvento: TCMDateTimePicker;
    edreservaorig: TEdit;
    edreservadest: TEdit;
    chkResult: TCheckBox;
    bbtnVerResultado: TBitBtn;
    redValorTransf: TRealEdit;
    rdgrpescolha: TRadioGroup;
    redValorTransfCotas: TRealEdit;
    pnlresult: TPanel;
    memresult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    MontaSelectPart: TMontaSelect;
    Label1: TLabel;
    lblValores: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure TiraIconeSql;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    function  VerificaParticipante(sIdPessoaTrans, sIdPessJurTrans, sIdPlanoPrevTrans, sSeqPropostaTrans : String) : boolean;
    procedure rdgrpescolhaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sPodeCancelar: string;
    sIdEventoGerador: string;
    bFlgIntContab,
    bAltera: boolean;
    procedure  BuscaReservasRel;
    procedure  BuscaReservasNaoRel;
    function GravaEVENTOSPREV : boolean;
    procedure LimpaCampos;
    function SuspendeContribuicoes : boolean;
    function AssociaContribuicoesReserva(pIdPessJur, pIdPlanoPrev, pIdPessoa, pSeqProposta,
             pIdtiporeserva: string; qryAux, qryGrava: TwwQuery; sCont : String) : boolean;
    procedure VerificaEstadoEvento;

  public
    { Public declarations }


  end;

var
  frmEventoTransfReserva: TfrmEventoTransfReserva;
  sIdreservaOrig , sIdreservaDest ,
  sNomereservaorig , sNomereservadest, sCont : String;
  sIdreserva, sNomeReserva , sValorReservaMoeda, sValorReservaCotas,
  sIndicereajuste,sIndicereajusteOrig,sIndicereajusteDest  : String;
  rValorReservaOrig : double;
  bDesAssociaCont : boolean;
  Sai : boolean;
  sIdPessoaTrans, sIdPessJurTrans, sIdPlanoPrevTrans, sSeqPropostaTrans: string;
  sIdBeneficioTrans : String;// Cobertura no caso do aberto
  bReservaDest : Boolean;
  sTipoPrevidenciaAux : String;

{Evento Temporário}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, DBaseDados, FEscolheReservaPart,
  FTelaAut, UMovReserva, FEscolheCont, UEventos, UIntegraBack, Usistema;

{$R *.DFM}

procedure TfrmEventoTransfReserva.VerificaEstadoEvento;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT  EG.IDEVENTOGERADOR ' +
                 ' FROM EVENTOGERADOR EG ' +
                 ' WHERE EG.FLGINTERNO = ' + ''''+sFlgInterno+''' ');
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  sIdEventoGerador := qryaux.fieldbyname('ideventogerador').AsString;

end;


procedure TfrmEventoTransfReserva.FormShow(Sender: TObject);
begin
//  inherited;
  bFlgIntContab := (IntegraBack.Contabilidade = 'S');
  bbtnVerResultado.Visible := False;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  MonSelReserva.Filtro.Add('PLANPREV.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO PT WHER PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+' AND PLP.IDPESSJUR = PT.IDPESSOA) ');
end;

procedure TfrmEventoTransfReserva.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count <=  0) or (MontaSelectPart.ValoresChave[0] = '')
  then Exit;

  sIdPessoaTrans     := MontaSelectPart.ValoresChave[0];
  sIdPessJurTrans    := MontaSelectPart.ValoresChave[1];
  sIdPlanoPrevTrans      := MontaSelectPart.ValoresChave[2];
  sSeqPropostaTrans  := MontaSelectPart.ValoresChave[20];
  edNome.Text         := MontaSelectPart.ValoresChave[3];
  edMatricula.Text    := MontaSelectPart.ValoresChave[4];
  edPatro.Text        := MontaSelectPart.ValoresChave[5];
  edPlano.Text        := MontaSelectPart.ValoresChave[6];
  edSitPatro.Text     := MontaSelectPart.ValoresChave[7];
  edSitFundacao.Text  := MontaSelectPart.ValoresChave[8];
  edSitPlano.Text     := MontaSelectPart.ValoresChave[9];
  edInscNumero.Text   := MontaSelectPart.ValoresChave[12];

  pnlInformacao.Enabled := True;
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;

  edreservaorig.text := '';
  edreservadest.text := '';
  sIdreservaorig     := '';
  sIdreservadest     := '';
  sIdreserva         := '';
  sNomereserva       := '';
  sNomereservaorig   := '';
  sNomereservadest   := '';

  VerificaEstadoEvento;

  ConsPart1.sIdPessoa    := sIdPessoaTrans;
  ConsPart1.sIdTitular   := sIdPessoaTrans; 
  ConsPart1.sSeqProposta := sSeqPropostaTrans;
  ConsPart1.sIdPlanoprev := sIdPlanoPrevTrans;
  ConsPart1.DataBaseName := 'BaseDados';
  ConsPart1.sIdPessjur := sIdPessJurTrans;
  ConsPart1.Enabled := true;
 {Fim - Carrega Campos}
end;

procedure TfrmEventoTransfReserva.bbtnConfirmarClick(Sender: TObject);
var
   sMsgErro : string;
   bErro : boolean;
   cAux : char; 
begin
  inherited;
  sai := false;
  sIdBeneficiotrans := '';

  if dtmBasedados.dbBaseDados.InTransaction then
  dtmBasedados.dbBaseDados.Rollback;
  dtmBasedados.dbBaseDados.StartTransaction;

  memresult.Lines.Clear;
  memresult.Lines.add('');
  memresult.Lines.add('Evento -  Transferência de Reservas -    ' + FormatDateTime('dd/mm/yyyy', Date) + ' '); 
  memresult.Lines.add('-------------------------------------------------------------');
  memresult.Lines.add('');


  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          TiraIconeSql;
          Exit;
     end;

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtEvento.SetFocus;
          TiraIconeSql;
          Exit;
     end;

  if Trim(edreservaorig.Text) = '' then
     begin
          MsgDlg('A Reserva de Origem deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          edreservaorig.SetFocus;
          TiraIconeSql;
          Exit;
     end;

  if Trim(edreservadest.Text) = '' then
     begin
          MsgDlg('A reserva destino deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          edreservadest.SetFocus;
          TiraIconeSql;
          Exit;
     end;

  if Trim(edreservaorig.Text)  = Trim(edreservadest.Text) then
     begin
       MsgDlg('A reserva destino não pode ser a mesma de origem.','Erro',mtError,[mbOk,mbHelp],0);
       edreservadest.SetFocus;
       TiraIconeSql;
       Exit;
     end;

  case  rdgrpescolha.itemindex of
     0:
     begin
        rValorReservaOrig := strtofloat(edValorReservaMoeda.text);

        //testa se valor disponível na reserva de origem é igual a zero
        if rValorReservaOrig = 0 then
        begin
           MsgDlg('Não há valor disponível para transferência.','Erro',mtError,[mbOk],0);
           TiraIconeSql;
           exit;
        end;

        //testa se o valor digitado para transferência é maior que o disponível
        // na reserva de origem
        if rValorReservaOrig < redValorTransf.value then
        begin
           MsgDlg('O valor de Transferência deve ser menor ou igual ao valor disponível na reserva de origem.','Erro',mtError,[mbOk],0);
           TiraIconeSql;
           exit;
        end;

        if  redValorTransf.value = 0 then
        begin
           if MsgDlg('O valor da transferência não foi definido, deseja transferir integralmente o valor disponível na reserva de origem.','Confirmação',mtConfirmation,[mbYes,mbno],0) = mrno then
           begin
              TiraIconeSql;
              exit;
           end
           else redValorTransf.value :=  rValorReservaOrig;
        end;

        if rValorReservaOrig = redValorTransf.value then
        bDesAssociaCont := true
        else bDesAssociaCont := False;

        //ExecutaRegra;
        if sPodeCancelar = 'False' then
           exit;

        bErro := false;


        if MoveReserva(sIdeventogerador,sIdPessoaTrans,sSeqPropostaTrans,sNomeParticip,'',qrymov,RegCalculo,sMsgErro,
                           sIdPessJurTrans,sIdPlanoPrevTrans,sIdreservaorig,sIdPessJurTrans,sIdPlanoPrevTrans,sIdreservaDest,bFlgIntContab,
                           trim(redValorTransf.text),strtodate(dtEvento.text),sSeqPropostaTrans,'','','',0,0,strtodate(dtEvento.text),'') <> 2  then
        begin
           bErro := true;
        end;
     end;
     1:
     begin
        rValorReservaOrig := strtofloat(edValorReservaCotas.text);

        //testa se valor disponível na reserva de origem é igual a zero
        if rValorReservaOrig = 0 then
        begin
           MsgDlg('Não há valor disponível para transferência.','Erro',mtError,[mbOk],0);
           TiraIconeSql;
           exit;
        end;

        //testa se o valor digitado para transferência é maior que o disponível
        // na reserva de origem
        if rValorReservaOrig < redValorTransfCotas.value then
        begin
           MsgDlg('O valor de Transferência deve ser menor ou igual ao valor disponível na reserva de origem.','Erro',mtError,[mbOk],0);
           TiraIconeSql;
           exit;
        end;

        if  redValorTransfCotas.value = 0 then
        begin
           if MsgDlg('O valor da transferência não foi definido, deseja transferir integralmente o valor disponível na reserva de origem.','Confirmação',mtConfirmation,[mbYes,mbno],0) = mrno then
           begin
              TiraIconeSql;
              exit;
           end
           else redValorTransfCotas.value :=  rValorReservaOrig;
        end;

        if rValorReservaOrig = redValorTransfCotas.value then
        bDesAssociaCont := true
        else bDesAssociaCont := False;

        //ExecutaRegra;
        if sPodeCancelar = 'False' then
           exit;

        bErro := false;

        //transforma valor digitado em cotas em moeda corrente
        redValorTransf.Value := strtofloat(truncaround(floattostr(redValorTransfCotas.Value * VoltaValorCotacao(qryaux,sIndiceReajusteOrig,'','',dtEvento.text)),2));

        cAux := DecimalSeparator;
        DecimalSeparator := '.';
        if MoveReserva(sIdeventogerador,sIdPessoaTrans,sSeqPropostaTrans,sNomeParticip,'',qrymov,RegCalculo,sMsgErro,
                           sIdPessJurTrans,sIdPlanoPrevTrans,sIdreservaorig,sIdPessJurTrans,sIdPlanoPrevTrans,sIdreservaDest,bFlgIntContab,
                           trim(FloattoStr(redValorTransf.Value)),strtodate(dtEvento.text),sSeqPropostaTrans,'','','',0,0,strtodate(dtEvento.text),'') <> 2 then
        begin
           bErro := true;
        end;
        DecimalSeparator := cAux;
     end;
  end;

  if not berro then
  begin

     if not GravaEVENTOSPREV then
     begin
        memresult.Lines.add('Erro na gravação no histórico de eventos.');
        berro := true;
     end;

     if not bAltera then
        begin
             if bDesAssociaCont then
             begin
                if not SuspendeContribuicoes then
                begin
                   memresult.Lines.add('Erro na desativação das contribuições relacionadas a reserva de origem.');
                   berro := true;
                end;
             end;

          
             //LISTA AS CONTRIBUIÇÕES RELACIONADAS AQUELA RESERVA/PARTICIPANTE
             qryaux.Close;
             qryaux.Sql.Clear;
//             qryaux.Sql.Add(' SELECT  DISTINCT CONTRIBUICAO.IDCONTRIBUICAO, NOME FROM RESERVAXCONTRIB, CONTRIBUICAO ' +             //Everson TIBERO
             qryaux.Sql.Add(' SELECT  DISTINCT CONTRIBUICAO.IDCONTRIBUICAO, CONTRIBUICAO.NOME FROM RESERVAXCONTRIB, CONTRIBUICAO ' +  //Everson TIBERO
                            //Everson TIBERO - Início
                            {' WHERE IDTIPORESERVA  = ' + sIdreservaDest   + ' AND ' +
                            '       IDPLANOPREV    = ' + sIdPlanoPrevTrans + ' AND '+}
                            ' WHERE RESERVAXCONTRIB.IDTIPORESERVA  = ' + sIdreservaDest   + ' AND ' +
                            '       RESERVAXCONTRIB.IDPLANOPREV    = ' + sIdPlanoPrevTrans + ' AND '+
                            //Everson TIBERO - Fim

                            '       CONTRIBUICAO.IDCONTRIBUICAO  = RESERVAXCONTRIB.IDCONTRIBUICAO AND '+
                            '       CONTRIBUICAO.IDCONTRIBUICAO NOT IN '+
                            '       (SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP '+
                            '       WHERE IDPESSOA = '+sIdPessoaTrans+' AND '+
                            '       IDPLANOPREV= '+sIdPlanoPrevTrans+'  AND '+
                            '       IDPESSJUR= '+sIdPessJurTrans+' AND '+
                            '       SEQPROPOSTA= '+sSeqPropostaTrans+' ) '+
//                            ' ORDER BY NOME ');            //Everson TIBERO
                            ' ORDER BY CONTRIBUICAO.NOME '); //Everson TIBERO

             try
                qryaux.Open;
             except
             end;

             //faz lista de contribuições daquela reserva
             while not qryaux.eof do
             begin
                if sCont = '' then sCont := qryaux.fieldbyname('IDCONTRIBUICAO').AsString;
                sCont := sCont+','+qryaux.fieldbyname('IDCONTRIBUICAO').AsString;
                qryaux.next;
             end;


             if sCont <> '' then
             begin
                if not AssociaContribuicoesReserva(sIdPessJurTrans, sIdPlanoPrevTrans, sIdPessoaTrans,sSeqPropostaTrans, sIdreservadest, qryAux, qryGrava,sCont )
                then
                begin
                   //algumas
                   memresult.Lines.add('Erro na Associação das contribuições da reserva destino.');
                   berro := true;
                end;
             end;
        end;
  end;

  if not bErro
  then
  begin

    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

     dtmBasedados.dbBaseDados.Commit;
     MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk],0);

  end
  else
  begin
     MsgDlg('Ocorreram Erros na Transferência de Reservas e a transação vai ser desfeita. Verifique Descrição dos Erros.','Erro',mtError,[mbok],0);
     dtmBasedados.dbBaseDados.Rollback;
     if chkResult.checked then
     begin
        bbtnVerResultado.Visible := true;
        bbtnVerResultado.enabled := true;
        bbtnVerResultadoClick(self);
     end;
     exit;
  end;

  LimpaCampos;
  TiraIconeSql;

  dtmBaseDados.dbBaseDados.StartTransaction;
end;

function TfrmEventoTransfReserva.SuspendeContribuicoes : boolean ;
begin

 {Suspende a Cobrança de todas as Contribuições Previdenciarias do Participante}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 ' +
                 ' WHERE SEQPROPOSTA = ' + sSeqPropostaTrans + ' AND' +
                 '       IDPESSJUR   = ' + sIdPessJurTrans   + ' AND' +
                 '       IDPLANOPREV = ' + sIdPlanoPrevTrans + ' AND' +
                 '       IDPESSOA    = ' + sIdPessoaTrans+' '+
                 '       AND IDPLANOPREV IN ( SELECT IDPLANOPREV '+
                 '       FROM RESERVAXCONTRIB WHERE IDTIPORESERVA = '+sIdreservaorig+')');
  try
     qryAux.ExecSQL;
  except
     result := false;
     exit;
  end;
  result := true;
end;

function TfrmEventoTransfReserva.GravaEVENTOSPREV : boolean;
var
  iIdEventoPrev: integer;
begin
  if bAltera = False then
     begin
          iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                         '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                         '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                         '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                         '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                         '                         DATAEFETIVADO, FLGEFETIVADO) ' +
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoaTrans + ',' + sIdPessJurTrans + ',' + sIdPlanoPrevTrans + ',' + sSeqPropostaTrans + ',' +
                         ' '''','''','''',' +
                         ' '''','''','''',' +
                         sIdEventoGerador + ',''1'',''1'',''1'',' +
                         '            to_date(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''dd/mm/yyyy''),''1'')'); 
          try
             qryAux.ExecSQL;
          except
             result := false;
             exit;
          end;

     end
  else
     begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        IDSITFUNCATUAL  = '''',' +
                         '                        IDSITPARTATUAL  = '''',' +
                         '                        IDSITPLANOATUAL = '''',' +
                         '                        IDSITFUNCNOVO   = '''',' +
                         '                        IDSITPARTNOVO   = '''',' +
                         '                        IDSITPLANONOVO  = '''' '+
                         ' WHERE SEQPROPOSTA     = ' + sSeqPropostaTrans + ' AND ' +
                         '       IDPESSJUR       = ' + sIdPessJurTrans   + ' AND ' +
                         '       IDPLANOPREV     = ' + sIdPlanoPrevTrans + ' AND ' +
                         '       IDPESSOA        = ' + sIdPessoaTrans    + ' AND ' +
                         '       IDEVENTOGERADOR = ' + sIdEventoGerador + ' AND ' +
                         '       DATAVOLTA IS NULL ');
          try
             qryAux.ExecSQL;
          except
             result := false;
             exit;
          end;
     end;
     result := true;
end;


procedure TfrmEventoTransfReserva.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Qualquer operação que esteja sendo executada será cancelada. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
         with dtmBasedados.dbBaseDados do
             if InTransaction then
                RollBack;

             LimpaCampos;
             dtmBaseDados.dbBaseDados.StartTransaction;
     end;
end;

procedure TfrmEventoTransfReserva.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  dtEvento.Text      := '';
  edreservaorig.Text := '';
  edreservadest.Text := '';
  edValorReservaMoeda.text := '';
  edValorReservaDestMoeda.text := '';
  edValorReservaCotas.text := '';
  edValorReservaDestCotas.text := '';
  edValorReservaDestMoeda.Clear;
  edValorReservaMoeda.clear;
  redValorTransf.clear;
  redValorTransf.value := 0;
  memresult.Lines.Clear;
  iIdParticipante := 0;
  iIdPlanoPrev := 0;
  iIDPatrocin := 0;
  bbtnProcurar.SetFocus;
  redValorTransfCotas.clear;
  redValorTransfCotas.value := 0;
  ConsPart1.Enabled := false;
end;

procedure TfrmEventoTransfReserva.TiraIconeSql;
begin
 {Adaptacao para tirar o icone de SQL}
  with qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT * FROM DUAL');
     Open;
     Close;
  end;
end;

procedure TfrmEventoTransfReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

function TfrmEventoTransfReserva.AssociaContribuicoesReserva(pIdPessJur, pIdPlanoPrev, pIdPessoa, pSeqProposta,
pIdtiporeserva: string; qryAux, qryGrava: TwwQuery; sCont : String) : boolean;
begin


  qryaux.Close;
  qryaux.Sql.Clear;
  qryaux.Sql.Add(' SELECT IDCONTRIBUICAO FROM RESERVAXCONTRIB ' +
                   ' WHERE IDTIPORESERVA  = ' + pIdtiporeserva   + ' AND ' +
                   '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND '+
                   '       IDCONTRIBUICAO IN ('+sCont+') ');

  try
     qryaux.Open;
  except
     result := false;
     exit;
  end;
  qryaux.first;

  while not qryAux.EOF do
     begin
         {Verifica se a contribuição já está associada ao participante}
          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP ' +
                           ' WHERE IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                           '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                           '       IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                           '       SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                           '       IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
          qryGrava.Open;
         {Fim - Verifica se a contribuição já está associada ao participante}


          if qryGrava.IsEmpty then
             begin
                 {Associa a contribuição ao participante}
                  qryGrava.Close;
                  qryGrava.Sql.Clear;
                  qryGrava.Sql.Add(' INSERT INTO CONTRIBPREVPARTP(IDPESSJUR, IDPESSOA, IDPLANOPREV, IDCONTRIBUICAO, FLGRETROATIVO, FLGCOBRA, SEQPROPOSTA) ' +
                                   ' VALUES( ' + pIdPessJur + ',' + pIdPessoa + ',' + pIdPlanoPrev + ',' +
                                             qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',''0'',''1'','+pSeqProposta+')');
                  try
                     qryGrava.ExecSQL;
                  except
                     result := false;
                     exit;
                  end;
                 {Fim - Associa a contribuicao ao participante}
             end
          else
             begin
                 {Altera a contribuição do participante}
                  qryGrava.Close;
                  qryGrava.Sql.Clear;
                  qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGRETROATIVO = ''0'',' +
                                   '                                FLGCOBRA      = ''1'' ' +
                                   ' WHERE IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                                   '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                                   '       IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                                   '       SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                                   '       IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
                  try
                     qryGrava.ExecSQL;
                  except
                     result := false;
                     exit;
                  end;
                 {Fim - Altera a contribuicao do participante}
             end;

          qryAux.Next;
     end;
     result := true;
end;

procedure TfrmEventoTransfReserva.SpeedButton1Click(Sender: TObject);
begin
  bReservaDest := false;

  inherited;
  try

   if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtEvento.SetFocus;
          TiraIconeSql;
          Exit;
     end;

  if not VerificaParticipante(sIdPessoaTrans, sIdPessJurTrans, sIdPlanoPrevTrans, sSeqPropostaTrans) then exit;

  sNomereserva := '';
  sValorReservaMoeda := '';
  sValorReservaCotas := '';
  sIndiceReajuste := '';
  sIdreserva := '';
  iidparticipante := strtoint(sIdPessoaTrans);
  iidpatrocin := strtoint(sIdPessJurTrans);
  iidplanoprev := strtoint(sIdPlanoPrevTrans);
  sNomeParticip := edNome.Text;
  sNomePatro :=  edPatro.Text;
  sNomePlano := edPlano.Text;
  if (iIdParticipante  <> 0) and (iIdPlanoPrev <> 0) and
     (iIDPatrocin <> 0)  and (edNome.text <> '')
  then   
  begin
     ConsultaReserva(inttostr(iidparticipante),sSeqPropostaTrans, inttostr(iidpatrocin),
                     inttostr(iidplanoprev), sNomeParticip,
                     sNomePatro, sNomePlano , 'PARTICIPANTE');
  end;

  if (sIdreserva <> '') then
  begin
     sIdreservaorig           := sIdreserva;
     sNomeReservaorig         := sNomereserva;
     edreservaorig.Text       := sNomereservaorig;
     edValorReservaMoeda.text := sValorReservaMoeda;
     edValorReservaCotas.text := sValorReservaCotas;
     sIndiceReajusteOrig      := sindicereajuste ;
     IF rdgrpescolha.ItemIndex = 0 Then
        redValorTransfCotas.Text := sValorReservaMoeda
     else
        redValorTransfCotas.Text := sValorReservaCotas;

     sIdreservadest  := '';
     sNomeReservadest := '';
     edreservadest.Text := sNomereservadest;
     edValorReservaDestMoeda.text := '';
     edValorReservaDestCotas.text := '';
     sIndiceReajusteDest :=  '';
  end;
  except
  end;
end;

procedure TfrmEventoTransfReserva.SpeedButton2Click(Sender: TObject);
var bAlgumaResRel, bAlgumaResDes : Boolean;
begin
  ConsultaReserva(inttostr(iidparticipante),sSeqPropostaTrans, inttostr(iidpatrocin),
                     inttostr(iidplanoprev), sNomeParticip,
                     sNomePatro, sNomePlano , 'PARTICIPANTE');

  if (sIdreserva <> '') then
  begin
     sIdreservadest               := sIdreserva;
     sNomeReservadest             := sNomereserva;
     edreservadest.Text           := sNomereservadest;
     edValorReservaDestMoeda.text := sValorReservaMoeda;
     edValorReservaDestCotas.text := sValorReservaCotas;
     sIndiceReajusteDest          :=  sindicereajuste;
  end;

end;

procedure  TfrmEventoTransfReserva.BuscaReservasNaoRel;
begin
     sNomereserva := '';
     sNomereservadest := '';
     sValorReservaMoeda := '';
     sValorReservaCotas := '';
     sIndiceReajuste := '';
     sIdreserva := '';
     MonSelReserva.Filtro.Clear;
     MonSelReserva.Filtro.add('RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV');
     MonSelReserva.Filtro.add('PLANPREV.IDPLANOPREV = '+sIdPlanoPrevTrans+'');
     MonSelReserva.Filtro.add('RESERVAXPLANO.IDTIPORESERVA NOT IN (SELECT IDTIPORESERVA FROM RESERVAPART '+
                              ' WHERE IDPLANOPREV = '+sIdPlanoPrevTrans+' AND IDPESSJUR = '+sIdPessJurTrans+' AND'+
                              ' IDPESSOA = '+sIdPessoaTrans+' AND SEQPROPOSTA = '+sSeqPropostaTrans+'  )');
     MonSelReserva.Filtro.add('RESERVAXPLANO.ANALITICOSINTETI = ''A''');
     MonSelReserva.Filtro.add('RESERVAXPLANO.IDTIPORESERVA <> '+sIdreservaOrig+'');
     MonSelReserva.Filtro.add('RC.IDTIPORESERVA = RESERVAXPLANO.IDTIPORESERVA');
     MonSelReserva.Filtro.add('C.IDCONTRIBUICAO = RC.IDCONTRIBUICAO');
     MonSelReserva.Filtro.add('RESERVAXPLANO.FLGCOLETIVA = 0');


     try
        MonSelReserva.Executar;
        sNomereserva := MonSelReserva.ValoresChave[0];
        sIdreserva   := MonSelReserva.ValoresChave[1];
        Label14.Visible := false;
        edValorReservaDestMoeda.visible := false;
        edValorReservaDestCotas.visible := false;
        Label16.visible := false;
     except
     end;
end;


procedure TfrmEventoTransfReserva.BuscaReservasRel;
begin
     Label14.Visible := true;
     edValorReservaDestMoeda.visible := true;
     edValorReservaDestCotas.visible := true;
     Label16.visible := true;

     if not VerificaParticipante(sIdPessoaTrans, sIdPessJurTrans, sIdPlanoPrevTrans, sSeqPropostaTrans) then exit;

     sNomereserva := '';
     sNomereservadest := '';
     sValorReservaMoeda := '';
     sValorReservaCotas := '';
     sIndiceReajuste := '';
     sIdreserva := '';
     iidparticipante := strtoint(sIdPessoaTrans);
     iidpatrocin := strtoint(sIdPessJurTrans);
     iidplanoprev := strtoint(sIdPlanoPrevTrans);
     sNomeParticip := edNome.Text;
     sNomePatro :=  edPatro.Text;
     sNomePlano := edPlano.Text;
     if (iIdParticipante  <> 0) and (iIdPlanoPrev <> 0) and
        (iIDPatrocin <> 0)  and (edNome.text <> '')
     then   //AbrirFormModal(frmEscolheReservaPart, TfrmEscolheReservaPart);
     begin
        ConsultaReserva(inttostr(iidparticipante),sSeqPropostaTrans ,inttostr(iidpatrocin),
                        inttostr(iidplanoprev), sNomeParticip,
                        sNomePatro, sNomePlano , 'PARTICIPANTE');
     end;
end;

function TfrmEventoTransfReserva.VerificaParticipante(sIdPessoaTrans, sIdPessJurTrans, sIdPlanoPrevTrans, sSeqPropostaTrans : String) : boolean;
begin
//
   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' SELECT IDTIPORESERVA FROM RESERVAPART '+
                  ' WHERE IDPESSOA = '+sIdPessoaTrans+' '+
                  ' AND   IDPESSJUR = '+sIdPessJurTrans+' '+
                  ' AND   IDPLANOPREV = '+sIdPlanoPrevTrans+' '+
                  ' AND   SEQPROPOSTA = '+sSeqPropostaTrans+' '+
                  ' AND   FLGATIVO = 1 ');
   try
      qryaux.open;
   except
      result := false;
      exit;
   end;

   if qryaux.isempty then
   begin
      MsgDlg('O Participante não tem reservas relacionadas.','Erro',mtError,[mbOk],0);
      result := false;
      exit;
   end;

   result := true;
//
end;

procedure TfrmEventoTransfReserva.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
pnlInformacao.BringToFront;
pnlResult.SendToBack;
end;

procedure TfrmEventoTransfReserva.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmEventoTransfReserva.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlInformacao.SendToBack;
  pnlResult.BringToFront;
end;

procedure TfrmEventoTransfReserva.rdgrpescolhaClick(Sender: TObject);
begin
  inherited;
   case rdgrpescolha.itemindex of
      0:
      begin
         pnlreal.visible := true;
         pnlcotas.visible := false;
         redValorTransfCotas.visible := false;
         redValorTransf.visible := true;
      end;
      1:
      begin
         pnlreal.visible := false;
         pnlcotas.visible := true;
         redValorTransfCotas.visible := true;
         redValorTransf.visible := false;
      end;
   end;
end;

procedure TfrmEventoTransfReserva.FormActivate(Sender: TObject);
begin
  inherited;
   sTipoPrevidenciaAux := 'F';
end;

procedure TfrmEventoTransfReserva.FormCreate(Sender: TObject);
begin
  inherited;
 SaveDlg.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.
