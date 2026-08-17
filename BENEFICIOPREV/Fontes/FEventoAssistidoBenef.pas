unit FEventoAssistidoBenef;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{-------------------------------------------------------------------------------
Alteração  : separacao da funcionalidade do CadastroPrev
Nº SOL.....: 253577-18129
KTN / PPM  : 1303078
Data       : 24/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - separação das interfaces
-------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, URegra,
  TB97Tlbr, TREdit, UConsPart, Mask, MskEdDlg,
  IvDictio, IvMulti, IvEMulti, TEdNum, wwdblook, wwdbdatetimepicker, CMDateTimePicker;


const
sSQLCO =  ('SELECT  DISTINCT  EL.MATRICULA,'+
          '        PP.INSCRICAONUMERO,'+
          '        PES.NOME,'+
          '        BF.NOME,'+
          '        P.DTEVENTO,'+
          '        P.NUMEROPROCESSO,'+
          '        EL.IDPESSOA,'+
          '        EL.DATAADMISSAO,'+
          '        P.NUMEROPROCESSO,'+
          '        B.IDTITULAR,'+
          '        B.SEQPROPOSTA,'+
          '        B.IDPESSJUR,'+
          '        B.IDPLANOPREV '+
          '  FROM  PROCESSOBENEF P,'+
          '        BENEFBFCIARIO B,'+
          '        ELEGPATRO EL,'+
          '        PARTPREVPLAN PP,'+
          '        PESSOA PES,'+
          '        BENEFPLANPREV BPL,'+
          '        BENEFICIO BF '+
          ' WHERE (P.NUMEROPROCESSO = B.NUMEROPROCESSO)'+
          '   AND (EL.IDPESSOA = B.IDTITULAR)'+
          '   AND (EL.IDPESSJUR = B.IDPESSJUR)'+
          '   AND (B.IDPESSJUR = PP.IDPESSJUR)'+
          '   AND (B.IDPLANOPREV = PP.IDPLANOPREV)'+
          '   AND (B.IDTITULAR = PP.IDPESSOA)'+
          '   AND (B.SEQPROPOSTA = PP.SEQPROPOSTA)'+
          '   AND (B.IDTITULAR = PES.IDPESSOA)'+
          '   AND (BPL.IDPLANOPREV = B.IDPLANOPREV)'+
          '   AND (BPL.IDBENEFICIO = B.IDBENEFICIO)'+
          '   AND (BF.IDBENEFICIO = B.IDBENEFICIO)'+
          '   AND (((BPL.FLGREFERENCIA = 0) OR'+
          '                ((BPL.FLGREFERENCIA = 1) AND (BPL.FLGPAGAINSS = 1))))'+
          '   AND (B.IDPESSOA = B.IDTITULAR)'+
          '   AND (((B.IDSITBENEFICIO = 4) OR (B.IDSITBENEFICIO = 6)))'+
          '   AND (PP.IDPESSJUR IN'+
          '                (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = 1))'+
          '   AND (EL.MATRICULA = :MATRICULA)');

type
  TfrmEventoAssistidoBenef = class(TfrmOkCancelar)
    Panel2: TPanel;
    Label2: TLabel;

    lblPatro: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    edPlano: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    pnlInformacao: TPanel;
    qryAux: TwwQuery;
    dtInicialAssist: TCMDateTimePicker;
    lblValores: TLabel;
    Label11: TLabel;
    pnlBotao: TPanel;
    bbtnRequerBeneficio: TBitBtn;
    MontaSelectPart: TMontaSelect;
    qrySitPart: TwwQuery;
    Label13: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    Label10: TLabel;
    Label7: TLabel;
    dtFinalAssist: TCMDateTimePicker;
    qryGrava: TwwQuery;
    regCalculo: TRegra;
    Panel5: TPanel;
    Label9: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    lblSalVirtual: TLabel;
    qryRegra: TwwQuery;
    ConsPart1: TConsPart;
    reSalarioAssistido: TcmMaskEditDlg;
    qrySitFunc: TwwQuery;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    Label1: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qrySitPlanoPrev: TwwQuery;
    qryEvento: TwwQuery;
    reSalarioPart: TcmMaskEditDlg;
    lblSalPart: TLabel;
    pnlTempoServTotal: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edTempoServTotal: TEditNum;
    edTempoServMes: TEditNum;
    edTempoServDia: TEditNum;
    qryeventogerador: TwwQuery;
    dtRequerimento: TCMDateTimePicker;
    Label4: TLabel;
    btnBeneficio: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnRequerBeneficioClick(Sender: TObject);
    procedure reSalarioAssistidoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure ConcederOK;
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    iIdRubSalario,
    iIdEventoPrev: integer;
    bEncerrou : boolean;
    sNumerosProcessos,
    sTipoSitFuncAntes,
    sFlgIntPartAntes,
    sIdPessoa,       sIdPessJur,      sIdPlanoPrev,      sSeqProposta,
    sIdSitFunc,      sIdSitPart,      sIdSitPlanoPrev,   sTempoServAntReal,
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed,  sFlgEfetivado,
    sDataEfetivado,  sMsgErro,        sEstadoEvento,
    pIdSitFunc,      pIdSitPart,      pIdSitPlanoPrev,   pTipoSit   : string;

    bEfetivado,  bAltera, bRequerBenef : boolean;

    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;

  public
    { Public declarations }
    Msg : String;
  end;

var
  frmEventoAssistidoBenef: TfrmEventoAssistidoBenef;

{Evento Temporário}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FCadContribParticipante, FMostraContribuicoes, UEventos,
  UParticipante, FCadRequerBenefParticip,
  UBeneficio, fAguarde, uSincronismo, DAPrev, USistema,DRelatAdmPREV2;


{$R *.DFM}

procedure TfrmEventoAssistidoBenef.FormCreate(Sender: TObject);
begin
  inherited;
  qrySitFunc.Close;
  qrysitFunc.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitFunc.Open;

  qrySitPlanoPrev.Close;
  qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoPrev.Open;
  
  qrySitPart.Close;
  qrysitPart.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPart.Open;

  qryeventogerador.close;
  qryeventogerador.ParamByName('IDEVENTO').AsString := sIdEventoGerador;
  qryeventogerador.open;

  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  bEncerrou := False; 
end;

procedure TfrmEventoAssistidoBenef.FormShow(Sender: TObject);
begin
  inherited;

  bRequerBenef := False;

  lblSalVirtual.Visible      := False;
  lblSalPart.Visible         := False;
  reSalarioAssistido.Visible := False;
  reSalarioPart.Visible      := False;

  if(sIdEventoGerador = '8') and (sistema.IdModulo = 454)then  begin
    pnlInformacao.Visible := false;

    TB97oKCancelar.Enabled := true;
    TB97oKCancelar.SetFocus;

    bbtnProcurar.top := 59;
    frmEventoAssistidoBenef.Height := 287;
    ConsPart1.Visible := false;
    pnlBotao.Visible  := false;
    bbtnAjuda.visible := false;
  end else begin
    btnBeneficio.Visible := false;
  end;

  LimpaCampos();

  MontaSelectPart.Tabelas.Add('EVENTOSPREV ');
  MontaSelectPart.Filtro.Add('PESSOA.IDPESSOA = EVENTOSPREV.IDPESSOA');
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPLANOPREV = EVENTOSPREV.IDPLANOPREV');
  MontaSelectPart.Filtro.Add('EVENTOSPREV.IDEVENTOGERADOR = '+ sIdEventoGerador );
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

end;

procedure TfrmEventoAssistidoBenef.bbtnProcurarClick(Sender: TObject);
Var
  wSai: Boolean;
begin
  inherited;

  Msg := '';
  pnlInformacao.Enabled := True;
  pnlBotao.Enabled      := True;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count <=  0) or (MontaSelectPart.ValoresChave[0] = '')
  then Exit;

  sIdPessoa          := MontaSelectPart.ValoresChave[0];
  sIdPessJur         := MontaSelectPart.ValoresChave[1];
  sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
  sIdSitFunc         := MontaSelectPart.ValoresChave[16];
  sIdSitPart         := MontaSelectPart.ValoresChave[17];
  sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[18];
  sSeqProposta       := MontaSelectPart.ValoresChave[20];
  edNome.Text        := MontaSelectPart.ValoresChave[3];
  edMatricula.Text   := MontaSelectPart.ValoresChave[4];
  edPatro.Text       := MontaSelectPart.ValoresChave[5];
  edPlano.Text       := MontaSelectPart.ValoresChave[6];
  edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
  edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
  edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
  edInscNumero.Text  := MontaSelectPart.ValoresChave[12];
  if MontaSelectPart.ValoresChave[23] <> ''
  then sTempoServAntReal := MontaSelectPart.ValoresChave[23]
  else sTempoServAntReal := MontaSelectPart.ValoresChave[24];
  sTipoSitFuncAntes := MontaSelectPart.ValoresChave[25];
  edTempoServTotal.Text  := MontaSelectPart.ValoresChave[26];
  sFlgIntPartAntes       := MontaSelectPart.ValoresChave[27];
  edTempoServMES.Text    := MontaSelectPart.ValoresChave[30]; 
  edTempoServDIA.Text    := MontaSelectPart.ValoresChave[31]; 

  ConsPart1.sIdPessoa    := sidpessoa;
  ConsPart1.sIdTitular   := sIdPessoa;
  ConsPart1.sSeqProposta := sseqproposta;
  ConsPart1.sIdPlanoprev := sidplanoprev;
  ConsPart1.DataBaseName := 'BaseDados';
  ConsPart1.sIdPessjur := sidpessjur;
  ConsPart1.Enabled := true;

  // Verifica se o evento já foi registrado
  VerificaEstadoEvento;

  bAltera := True;
  dtInicialAssist.Text       := MontaSelectPart.ValoresChave[14];

  if Trim(MontaSelectPart.ValoresChave[15]) <> ''
  then dtFinalAssist.Date    := StrToDate(MontaSelectPart.ValoresChave[15]);
  edTempoServTotal.Text      := MontaSelectPart.ValoresChave[26];

  edTempoServMES.Text        := MontaSelectPart.ValoresChave[30];
  edTempoServDIA.Text        := MontaSelectPart.ValoresChave[31];

  reSalarioAssistido.Text    := MontaSelectPart.ValoresChave[21];
  if qryEvento.FieldByName('FlgInterno').AsString = 'MA'
  then reSalarioPart.Text    := MontaSelectPart.ValoresChave[29]
  else reSalarioPart.Text    := MontaSelectPart.ValoresChave[28];

  lblSalVirtual.Visible      := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
  reSalarioAssistido.Visible := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
  dblkpcmbSitFunc.Text       := qryEvento.FieldByName('NOMESITFUNC').AsString;
  dblkpcmbSitFunc.PerformSearch;

  dblkpcmbSitPlanoPrev.Text  := qryEvento.FieldByName('NOMESITPLANO').AsString;
  dblkpcmbSitPlanoPrev.PerformSearch;

  dblkpcmbSitPart.Text       := qryEvento.FieldByName('NOMESITPART').AsString;
  dblkpcmbSitPart.PerformSearch;

  edSitPatro.Text            := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
  edSitPlano.Text            := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
  edSitFundacao.Text         := qryEvento.FieldByName('NOMESITPARTANT').AsString;
  sFlgIntPartAntes           := qryEvento.FieldByName('FLGINTANT').AsString;
  dtRequerimento.Text        := qryEvento.FieldByName('DATAREQUERIMENTO').AsString;

  bbtnConfirmar.Enabled := false;
  bbtnCancelar.Enabled  := true;
  btnBeneficio.Enabled  := true;

end;

procedure TfrmEventoAssistidoBenef.VerificaEstadoEvento;
begin

   // Quando for um evento temporario, pode acontecer de já haver
   // um evento e o  usuário querer cadastrar outro

   with qryEvento do
   begin
      Close;
      ParamByName('FlgInterno').AsString   := sFlgInterno;
      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      Open;
      if (sistema.idmodulo <> 454)then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
        if IsEmpty
        then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir

        else if MsgDlg('Existe um outro evento da mesma categoria em aberto. '+#13+
                       'Deseja abrir um novo evento ? ','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrYes

             then begin
                sEstadoEvento := 'NAO REGISTRADO';
             end
             else begin
                if FieldByName('FLGEFETIVADO').AsString = '0'
                then begin
                   sEstadoEvento := 'REGISTRADO'; // Pode Alterar
                   sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
                end
                else sEstadoEvento := 'EFETIVADO' // Não pode Alterar
             end
      end else begin // Felipe A. Santos SOL 223982 KINTANA 2057667 - segue o fluxo de não da mensagem acima
          if not IsEmpty then begin
            //sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
            if FieldByName('FLGEFETIVADO').AsString = '0' then begin
               sEstadoEvento := 'REGISTRADO'; // Pode Alterar
               sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
            end
            else sEstadoEvento := 'EFETIVADO' // Não pode Alterar
          end
          else
            sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
       end; // Felipe A. Santos SOL 223982 KINTANA 2057667 - fim
   end;
end;


procedure TfrmEventoAssistidoBenef.bbtnRequerBeneficioClick(Sender: TObject);
Var
  sTempoContribuicao : String;
  bConcedeBenef : boolean;
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;


  // Verificar se o participante tem contribuicoes que ainda nao alimentaram reserva
  // e alimentá-las, em caso positivo.
  frmAguarde.Mostra('Atualizando Reserva ... ');
  if not AtualizaReservaParticipante ( qryAux, qryGrava,
                                       StrToInt(sIdPessJur),
                                       StrToInt(sIdPlanoPrev),
                                       StrToInt(sIdPessoa),
                                       StrToInt(sSeqProposta),
                                       -1, // nao passar evento gerador para mostrar no extrato o nome da contribuicao
                                       dtInicialAssist.Text,
                                       sMsgErro ) then
  begin
    frmAguarde.Apaga;
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
    Exit;
  end;
  frmAguarde.Apaga;

  if (not bRequerBenef) and (not bAltera)
  then begin
     if not ValidaBeneficioAnterior ( qryAux,
                                      StrToInt(sIdPessJur),
                                      StrToInt(sIdPlanoPrev),
                                      StrToInt(sIdPessoa),
                                      StrToInt(sSeqProposta),
                                      StrToInt(sIdEventoGerador),
                                      False,
                                      dtInicialAssist.Text,
                                      sMsgErro,
                                      bEncerrou) 

     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        Exit;
     end;

  end;

  bRequerBenef := True;

  pIdSitFunc      := qrySitFunc.FieldByName('IDSITFUNC').AsString;
  pIdSitPart      := qrySitPart.FieldByName('IDSITPART').AsString;
  pIdSitPlanoPrev := qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString;
  pTipoSit        := qrySitFunc.FieldByName('TIPOSIT').AsString;

  if not bEfetivado
  then VerificaeGravaSituacoes;


  If (edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '') Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If (edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If (edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';


  if qryEvento.FieldByName('DATAEVENTO').AsString <> '' then
     dtInicialAssist.Text := qryEvento.FieldByName('DATAEVENTO').AsString;


  bConcedeBenef := AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                                       sSeqProposta,dtInicialAssist.Text,'',
                                       sIdEventoGerador, '',sNumerosProcessos,
                                       sTipoSitFuncAntes,
                                       sFlgIntPartAntes,
                                       qrySitPart.FieldByName('FlgInterno').AsString,
                                       sIdSitPart,
                                       sIdSitPlanoPrev,
                                       sIdSitFunc,
                                       qrySitPart.FieldByName('IdSitPart').AsString,
                                       qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString,
                                       qrySitFunc.FieldByName('IdSitFunc').AsString,
                                       sTempoContribuicao,
                                       dtRequerimento.Text);

  if bConcedeBenef then
     ConcederOK;

  bbtnSairClick(self);

end;


procedure TfrmEventoAssistidoBenef.VerificaeGravaSituacoes;
begin
  // Gravar tempo de servido total, independente de gravar situacoes
  // neste momento
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ OraNumero(edTempoServTotal.Text) +', '+
                   '                      TEMPOSERVTOTMES  = '+ OraNumero(edTempoServMes.Text)   +', '+
                   '                      TEMPOSERVTOTDIA  = '+ OraNumero(edTempoServDia.Text)+
                   ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                   '       IDPESSOA  = ' + sIdPessoa);
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT FLGSITFUNCIMEDIA, FLGSITPARTIMEDIA, FLGSITPLANOIMEDI FROM EVENTOGERADOR ' +
                 ' WHERE IDEVENTOGERADOR = ' + sIdEventoGerador);
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
  end;

  // Se o evento indicar que atualiza situacao imediatamente e a data final ainda nao acabou
  if (qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPLANOIMEDI').AsString = '1')  and
     ( (Trim(dtFinalAssist.Text) = '') or ( (Trim(dtFinalAssist.Text) <> '') and (StrToDate(dtFinalAssist.Text) <= date) ) )
  then begin
     sFlgEfetivado  := '1';
     sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')'; 
  end
  else begin
     sFlgEfetivado  := '0';
     sDataEfetivado := 'NULL';
  end;


  if qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1'
  then begin
     sFlgSitFuncImed := '1';

     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = ''' + qrySitFunc.FieldByName('IDSITFUNC').AsString +''''+ 
                      ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND ' +
                      '        IDPESSOA  = ' + sIdPessoa);
     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
  end
  else sFlgSitFuncImed := '0';


  if qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1' then
     begin
          sFlgSitPartImed := '1';

         {Grava nova Situação do Participante na Fundação}
          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPART = ' + qrySitPart.FieldByName('IDSITPART').AsString +
                           ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                           '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                           '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                           '       IDPESSOA    = ' + sIdPessoa);
          try
             qryGrava.ExecSQL;
          except
             on E:EDBEngineError do
                begin
                     MostrarErro(E);
                     Exit;
                end;
          end;
     end
  else
     sFlgSitPartImed := '0';


  if qryAux.FieldByName('FLGSITPLANOIMEDI').AsString  = '1'
  then begin
    sFlgSitPlanoImed := '1';

    // Grava nova Situação do Participante no Plano
    qryGrava.Close;
    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPLANOPREV = ' + qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString +
                     ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                     '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                     '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                     '       IDPESSOA    = ' + sIdPessoa);
    try
       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
          begin
               MostrarErro(E);
               Exit;
          end;
    end;
  end
  else sFlgSitPlanoImed := '0';
end;


procedure TfrmEventoAssistidoBenef.GravaEVENTOSPREV;
var sSalParticipacao : string;
begin
  if Trim(reSalarioPart.Text) = ''
  then sSalParticipacao := '0'
  else sSalParticipacao := OraNumero(Trim(reSalarioPart.Text));

  if not bAltera
  then begin
     iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                    '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                    '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                    '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                    '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                    '                         DATAEFETIVADO, FLGEFETIVADO, SALPARTICIPACAO, INSCRICAONUMERO, DATAREQUERIMENTO) ' + 
                   ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtInicialAssist.Text) + ''',''dd/MM/yyyy'')' + ',' + 
                                 sIdPessoa  + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                 sIdSitFunc + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                 qrySitFunc.FieldbyName('IDSITFUNC').AsString + ' ,' +
                                 qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                                 qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                 sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                 sDataEfetivado + ',' + sFlgEfetivado+','+sSalParticipacao+','+OraNumero(edInscNumero.Text)+ ', ' +
                                 'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtRequerimento.Date) + ''',''DD/MM/YYYY'') )'); 
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
  end
  else begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + 
                    '                        DATAEVENTO   = To_Date(''' + Trim(dtInicialAssist.Text) + ''',''dd/MM/yyyy'')' + ',' +
                    '                        DATAREQUERIMENTO = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' + 
                    '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                    '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                    '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                    '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                    '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                    '                        IDSITPLANONOVO  = ' + sIdSitPlanoPrev+','+
                    '                        SALPARTICIPACAO = ' + sSalParticipacao+
                    ' WHERE SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                    '       IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                    '       IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                    '       IDPESSOA        = ' + sIdPessoa    + ' AND ' +
                    '       IDEVENTOGERADOR = ' + sIdEventoGerador + ' AND ' +
                    '       DATAVOLTA IS NULL ');
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
            MostrarErro(E);
            Exit;
        end;
     end;
  end;
end;


procedure TfrmEventoAssistidoBenef.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
  dtInicialAssist.Text := '';
  dtFinalAssist.Text   := '';
  edTempoServTotal.Text := '';
  edTempoServMES.Text    := '';
  edTempoServDIA.Text    := '';

  lblSalVirtual.Visible      := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
  reSalarioAssistido.Visible := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
  reSalarioAssistido.Text := '';
  reSalarioPart.Text := '';
  dblkpcmbSitFunc.Text := '';
  dblkpcmbSitPart.Text := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dtRequerimento.Text    := '';  
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  bbtnConfirmar.Enabled := false;
  bbtnCancelar.Enabled  := false;
  btnBeneficio.Enabled  := false;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

end;

procedure TfrmEventoAssistidoBenef.reSalarioAssistidoExit(Sender: TObject);
begin
  inherited;
  if Trim(reSalarioAssistido.Text) = ''
  then begin
     MsgDlg('Salário de Assistido deve ser informado.','Informação',mtInformation,[mbOk,mbHelp],0);
     reSalarioAssistido.setfocus;
     Exit;
  end;
end;


procedure TfrmEventoAssistidoBenef.ConcederOK;
var
  sNumerosProcessos : string;
  cTipoBenef : Char;
  iIdCalculo : Integer;
  qryCO: TwwQuery;
begin
  inherited;
  qryCO := TwwQuery.Create(Application);
  qryCO.DatabaseName := 'BaseDados';
  qryCO.SQL.Text := sSQLCO;
  qryCO.Close;
  qryCO.ParamByName('MATRICULA').AsString := edMatricula.Text;
  qryCO.Open;
  if not qryCO.IsEmpty then begin
      sNumerosProcessos:= qryCO.FieldByName('NUMEROPROCESSO').AsString;

      cTipoBenef := 'P';


      case  cTipoBenef of
         'P' : // Concessao de Beneficio para PARTICIPANTE
         begin
                AbreRequerParticip(
                  'CO',qryCO.FieldByName('IDPESSOA').AsString, qryCO.FieldByName('IDPESSJUR').AsString,
                  qryCO.FieldByName('IDPLANOPREV').AsString, qryCO.FieldByName('SEQPROPOSTA').AsString,
                  qryCO.FieldByName('DTEVENTO').AsString,'', '-1','',
                  sNumerosProcessos,'',
                  '','','','','','','','','',
                  '',sNumerosProcessos,qryCO.FieldByName('NUMEROPROCESSO').AsString,true);

         end;
      end;
  end;
end;


procedure TfrmEventoAssistidoBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos();
end;

end.
