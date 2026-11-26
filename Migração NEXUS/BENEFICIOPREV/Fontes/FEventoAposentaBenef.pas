unit FEventoAposentaBenef;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************

{-------------------------------------------------------------------------------
Alteração  : separacao da funcionalidade do CadastroPrev
Nº SOL.....: 253577-18129
KTN / PPM  : 1303078
Data       : 25/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - separação das interfaces
-------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, TREdit,
  TB97Tlbr, Mask, DBCtrls, UConsPart, IvDictio, IvMulti, IvEMulti, TEdNum,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, URegra;


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
          '        B.IDPLANOPREV, '+
          '        B.FONTEPAGADORA ' +
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
  TfrmEventoAposentaBenef = class(TfrmOkCancelar)
    Panel2: TPanel;
    Label2: TLabel;
    lblPatro: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edPlano: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    pnlInformacao: TPanel;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    Label7: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qryAux: TwwQuery;
    lblValores: TLabel;
    Label11: TLabel;
    pnlBotao: TPanel;
    regCalculo: TRegra;
    bbtnRequerBeneficio: TBitBtn;
    MontaSelectPart: TMontaSelect;
    qrySitPart: TwwQuery;
    Label13: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    Label10: TLabel;
    dtEvento: TCMDateTimePicker;
    qryGrava: TwwQuery;
    Panel5: TPanel;
    Label9: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    Label1: TLabel;
    dtDemissao: TCMDateTimePicker;
    ConsPart1:  TConsPart;
    chkSitEspecial: TCheckBox;
    Label4: TLabel;
    qryEvento: TwwQuery;
    pnlTempoServTotal: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    edTempoServTotal: TEditNum;
    Label15: TLabel;
    edTempoServMes: TEditNum;
    edTempoServDia: TEditNum;
    Label16: TLabel;
    dtRequerimento: TCMDateTimePicker;
    Label17: TLabel;
    ToolbarSep972: TToolbarSep97;
    btnBeneficio: TBitBtn;
    edMatricula: TEdit;
    edInscNumero: TEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnRequerBeneficioClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure ConcederOK;
  private
    { Private declarations }
    iIdEventoPrev: integer;

    bEncerrou : boolean;
    sNumerosProcessos,
    sTipoSitFuncAntes,
    sFlgIntPartAntes,

    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sTempoServAntReal: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    bEfetivado,   // informa se o evento foi efetivado
    bAltera,
    bRequerBenef: boolean; // indica se requereu beneficio
    sEstadoEvento: string;
    pIdSitFunc, pIdSitPart, pIdSitPlanoPrev, pTipoSit,  sFlgSitEspecial: string;

    procedure VerificaeGravaSituacoes;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    procedure SetarMatricula;
    procedure SetarVariaveis;

  public
    { Public declarations }
    Msg : String;
    sRequerimento: Boolean;
  end;

var
  frmEventoAposentaBenef: TfrmEventoAposentaBenef;
{Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FCadRequerBenefParticip, UBeneficio,
  fAguarde, UParticipante, DAPrev, Usistema;

{$R *.DFM}

procedure TfrmEventoAposentaBenef.FormCreate(Sender: TObject);
begin
  inherited;
  bRequerBenef := False;

  qrySitFunc.Close;
  qrysitFunc.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitFunc.Open;
  qrySitPlanoPrev.Close;
  qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoPrev.Open;
  qrySitPart.Close;
  qrysitPart.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPart.Open;

  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';

  bEncerrou := False;
end;

procedure TfrmEventoAposentaBenef.FormShow(Sender: TObject);
begin
  inherited;

  frmEventoAposentaBenef.Height := 287;

  TB97oKCancelar.Enabled := true;
  TB97oKCancelar.SetFocus;
  pnlInformacao.Visible  := false;

  pnlBotao.Visible   := false;
  ConsPart1.Visible  := false;
  bbtnProcurar.top   := 57;
  bbtnAjuda.Visible  := false;

  bbtnConfirmar.Enabled := false;
  bbtnCancelar.Enabled  := false;

  // ------- TABELA
  MontaSelectPart.Tabelas.Add('EVENTOSPREV');
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPLANOPREV = EVENTOSPREV.IDPLANOPREV');
  MontaSelectPart.Filtro.Add('PESSOA.IDPESSOA = EVENTOSPREV.IDPESSOA');
  MontaSelectPart.Filtro.Add('EVENTOSPREV.IDEVENTOGERADOR = '+ sIdEventoGerador );
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  // ------- FILTRO

  LimpaCampos();
end;

procedure TfrmEventoAposentaBenef.bbtnProcurarClick(Sender: TObject);
Var
  wSai: Boolean;
begin
  wSai := false;

  inherited;
  Msg := '';
  MontaSelectPart.Executar;
  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then Begin
    sIdPessoa              := MontaSelectPart.ValoresChave[0];
    sIdPessJur             := MontaSelectPart.ValoresChave[1];
    sIdPlanoPrev           := MontaSelectPart.ValoresChave[2];
    sIdSitFunc             := MontaSelectPart.ValoresChave[15];
    sIdSitPart             := MontaSelectPart.ValoresChave[16];
    sIdSitPlanoPrev        := MontaSelectPart.ValoresChave[17];
    sSeqProposta           := MontaSelectPart.ValoresChave[19];
    edNome.Text            := MontaSelectPart.ValoresChave[3];
    edMatricula.Text       := MontaSelectPart.ValoresChave[4];
    edPatro.Text           := MontaSelectPart.ValoresChave[5];
    edPlano.Text           := MontaSelectPart.ValoresChave[6];
    edSitPatro.Text        := MontaSelectPart.ValoresChave[7];
    edSitFundacao.Text     := MontaSelectPart.ValoresChave[8];
    edSitPlano.Text        := MontaSelectPart.ValoresChave[9];
    edInscNumero.Text      := MontaSelectPart.ValoresChave[12];

    if MontaSelectPart.ValoresChave[22] <> ''
    then sTempoServAntReal := MontaSelectPart.ValoresChave[21]
    else sTempoServAntReal := MontaSelectPart.ValoresChave[22];

    dtDemissao.Text        := MontaSelectPart.ValoresChave[23];
    sFlgSitEspecial        := MontaSelectPart.ValoresChave[24];
    sTipoSitFuncAntes      := MontaSelectPart.ValoresChave[25];
    edTempoServTotal.Text  := MontaSelectPart.ValoresChave[26];
    sFlgIntPartAntes       := MontaSelectPart.ValoresChave[27];
    edTempoServMES.Text    := MontaSelectPart.ValoresChave[28];
    edTempoServDIA.Text    := MontaSelectPart.ValoresChave[29];

    SetarMatricula;

    btnBeneficio.Enabled  := true;
    bbtnCancelar.Enabled  := true;

  end
  else
    btnBeneficio.Enabled  := false;
end;

procedure TfrmEventoAposentaBenef.VerificaEstadoEvento;
begin
  // Verificar se evento já foi registrado na mesma categoria
   with qryEvento do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT EP.FLGEFETIVADO, EG.IDEVENTOGERADOR, EP.DATAEVENTO, ');
      SQL.Add('       EP.IDSITPARTNOVO, EP.IDSITPLANONOVO, EP.IDSITFUNCNOVO, ');
      SQL.Add('       SPART.FLGINTERNO, ');
      SQL.Add('       EG.FLGINTERNO AS FLGINTANT, ');
      SQL.Add('       SPART.DESCRICAO  AS NOMESITPART, ');
      SQL.Add('       SPLANO.DESCRICAO AS NOMESITPLANO, ');
      SQL.Add('       SFUNC.DESCRICAO  AS NOMESITFUNC, ');
      SQL.Add('       SPARTANT.DESCRICAO  AS NOMESITPARTANT, ');
      SQL.Add('       SPLANOANT.DESCRICAO AS NOMESITPLANOANT, ');
      SQL.Add('       SFUNCANT.DESCRICAO  AS NOMESITFUNCANT, ');
      SQL.Add('       EP.DATAREQUERIMENTO ');
      SQL.Add('FROM   EVENTOGERADOR EG, EVENTOSPREV EP, SITPART SPART, ');
      SQL.Add('       SITPLANOPREV SPLANO, SITFUNC SFUNC, ');
      SQL.Add('       SITPART SPARTANT, ');
      SQL.Add('       SITPLANOPREV SPLANOANT, SITFUNC SFUNCANT ');
      SQL.Add('WHERE (EG.FLGINTERNO     IN (''TS'', ''ID'', ''IN'') ) ');
      SQL.Add('AND   (EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR) ');
      SQL.Add('AND   (EG.IDEVENTOGERADOR = :IDEVENTOGERADOR) ');
      SQL.Add('AND   (EP.SEQPROPOSTA     = :SEQPROPOSTA) ');
      SQL.Add('AND   (EP.IDPESSJUR       = :IDPESSJUR) ');
      SQL.Add('AND   (EP.IDPLANOPREV     = :IDPLANOPREV) ');
      SQL.Add('AND   (EP.IDPESSOA        = :IDPESSOA) ');
      SQL.Add('AND   (EP.IDSITFUNCNOVO   = SFUNC.IDSITFUNC) ');
      SQL.Add('AND   (EP.IDSITPARTNOVO   = SPART.IDSITPART) ');
      SQL.Add('AND   (EP.IDSITPLANONOVO  = SPLANO.IDSITPLANOPREV) ');
      SQL.Add('AND   (EP.IDSITFUNCATUAL  = SFUNCANT.IDSITFUNC) ');
      SQL.Add('AND   (EP.IDSITPARTATUAL  = SPARTANT.IDSITPART) ');
      SQL.Add('AND   (EP.IDSITPLANOATUAL = SPLANOANT.IDSITPLANOPREV) ');
      SQL.Add('AND  EP.DATAVOLTA IS NULL');
      Prepare;

      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      ParamByName('IdEventoGerador').AsInteger := StrToInt(sIdEventoGerador);
      Open;

      if IsEmpty
      then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
      else if FieldByName('FLGEFETIVADO').AsString = '0'
           then begin
              sEstadoEvento := 'REGISTRADO'; // Pode Alterar
              sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
           end
           else
           begin

              //verifica se o participante já teve um evento de aposentadoria que foi
              //cancelado, por exemplo, uma invalidez que foi revogada pelo inss e, mais tarde,
              //o participante requer a aposentadoria por tempo de contribuição.
              //a consulta abaixo testa se existe algum processo ativo
              qryaux.close;
              qryaux.Sql.Clear;
              qryaux.sql.Add('SELECT 1 '+
                                 ' FROM PROCESSOBENEF P, BENEFBFCIARIO B '+
                                 ' WHERE IDEVENTOGERADOR IN '+
                                 '       (SELECT IDEVENTOGERADOR FROM EVENTOGERADOR WHERE FLGINTERNO     IN (''TS'', ''ID'', ''IN'')) '+
                                 ' AND   (B.IDPESSJUR       = '''+sIdPessJur+''') '+
                                 ' AND   (B.IDPLANOPREV     = '''+sIdPlanoPrev+''' ) '+
                                 ' AND   (B.IDPESSOA        = '''+sIdPessoa+''') '+
                                 ' AND   B.NUMEROPROCESSO = P.NUMEROPROCESSO '+
                                 ' AND   P.IDSITPROCESSO < 3              ');
                                 // No caso de aposentadoria por tempo de contribuição, o sistema deve verificar apenas se existe
                                 // evento gerado independente do campo idsitprocesso.

              qryaux.open;
              if qryaux.isempty then sEstadoEvento := 'NAO REGISTRADO'
              else       sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
           end;
   end;
end;


procedure TfrmEventoAposentaBenef.bbtnRequerBeneficioClick(Sender: TObject);
var sTempoContribuicao, sMsgErro : string;
    bConcedeBenef : boolean;
begin
  inherited;
  if Trim(edNome.Text) = '' then
     begin
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
                                       dtEvento.Text,
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
                                      dtEvento.Text,
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


  If ((edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '')) and (Sistema.IdModulo <> 454) Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If ((edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '')) and (Sistema.IdModulo <> 454) Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If ((edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '')) and (Sistema.IdModulo <> 454) Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';

  if qryEvento.Locate('IDEVENTOGERADOR', sIdEventoGerador,[]) then
     if qryEvento.FieldByName('DataEvento').AsString <> '' then
        dtEvento.Text := qryEvento.FieldByName('DataEvento').AsString;

  bConcedeBenef := AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                                       sSeqProposta,dtEvento.Text,'',
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
     ConcederOK();

  bbtnSairClick(self);

end;

procedure TfrmEventoAposentaBenef.VerificaeGravaSituacoes;
begin
  // Gravar tempo de servido total, independente de gravar situacoes
  // neste momento
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ OraNumero(edTempoServTotal.Text)+', '+
                   '                      TEMPOSERVTOTMES  = '+ OraNumero(edTempoServMes.Text)+', '+
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

  // Verificar se o usuario deseja gravar novas situacoes imediatamente
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

  if (qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPLANOIMEDI').AsString = '1')
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

     // Grava nova Situação do Participante na Patrocinadora
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = ''' +qrySitFunc.FieldByName('IDSITFUNC').AsString +''''+
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


  if qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1'
  then begin
     sFlgSitPartImed := '1';

     // Grava nova Situação do Participante na Fundação
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
  else sFlgSitPartImed := '0';


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


procedure TfrmEventoAposentaBenef.bbtnCancelarClick(Sender: TObject);
begin
  LimpaCampos;
  TiraSql(qryAux);

  inherited;
end;


procedure TfrmEventoAposentaBenef.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
  dtEvento.Text      := '';
  dtDemissao.Text    := '';
  dtRequerimento.Text   := '';  
  edTempoServTotal.Text := '';
  edTempoServMes.Text   := '';
  edTempoServDia.Text   := '';
  dblkpcmbSitFunc.Text  := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  chkSitEspecial.Checked    := False;
  btnBeneficio.Enabled      := false;
  bbtnCancelar.Enabled      := false;
  bbtnProcurar.SetFocus;
end;



procedure TfrmEventoAposentaBenef.bbtnSairClick(Sender: TObject);
Var qryNUMPROC: TwwQuery;
begin

  inherited;
end;


procedure TfrmEventoAposentaBenef.SetarMatricula;
begin

  pnlBotao.Enabled      := True;

  if conspart1 = Nil then
     ConsPart1 := TConsPart.Create(self);

   ConsPart1.sIdPessoa    := sidpessoa;
   ConsPart1.sIdTitular   := sIdPessoa;
   ConsPart1.sSeqProposta := sseqproposta;
   ConsPart1.sIdPlanoprev := sidplanoprev;
   ConsPart1.DataBaseName := 'BaseDados';
   ConsPart1.sIdPessjur := sidpessjur;

   // Verifica se o evento já foi registrado
   VerificaEstadoEvento;

   bAltera := True;
   if sEstadoEvento <> 'NAO REGISTRADO'
   then begin
      dtEvento.Date             := StrToDate(qryEvento.FieldByName('DataEvento').AsString);
      dblkpcmbSitFunc.Text      := qryEvento.FieldByName('NOMESITFUNC').AsString;
      dblkpcmbSitFunc.PerformSearch;

      dblkpcmbSitPlanoPrev.Text := qryEvento.FieldByName('NOMESITPLANO').AsString;
      dblkpcmbSitPlanoPrev.PerformSearch;

      dblkpcmbSitPart.Text      := qryEvento.FieldByName('NOMESITPART').AsString;
      dblkpcmbSitPart.PerformSearch;

      edSitPatro.Text           := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
      edSitPlano.Text           := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
      edSitFundacao.Text        := qryEvento.FieldByName('NOMESITPARTANT').AsString;
      sFlgIntPartAntes          := qryEvento.FieldByName('FLGINTANT').AsString;
      dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString;
   end;
end;


procedure TfrmEventoAposentaBenef.SetarVariaveis;
begin
     sIdPessoa          := InttoStr(qryAux.FieldByName('C6').AsInteger); // IDPESSOA
     sIdPessJur         := InttoStr(qryAux.FieldByName('C7').AsInteger); // IDPESSJUR
     sIdPlanoPrev       := InttoStr(qryAux.FieldByName('C8').AsInteger); // IDPLANOPREV
     edNome.Text        := qryAux.FieldByName('C1').AsString; // PESSOA.NOME
     edMatricula.Text   := qryAux.FieldByName('C0').AsString; // MATRICULA
     edPatro.Text       := qryAux.FieldByName('C5').AsString; // PATRO.NOME
     edPlano.Text       := qryAux.FieldByName('C4').AsString; // PLANO.NOME
     edSitPatro.Text    := qryAux.FieldByName('C14').AsString; // PATRO.SITPATRO
     edSitFundacao.Text := qryAux.FieldByName('C13').AsString; // SITFUNDACAO
     edSitPlano.Text    := qryAux.FieldByName('C15').AsString; // SITPLANO
     edInscNumero.Text  := qryAux.FieldByName('C2').AsString; // INSCRICAONUMERO
     sIdSitFunc         := InttoStr(qryAux.FieldByName('C21').AsInteger); // IDSITFUNC
     sIdSitPart         := InttoStr(qryAux.FieldByName('C22').AsInteger); // IDSITPART
     sIdSitPlanoPrev    := InttoStr(qryAux.FieldByName('C23').AsInteger); // IDSITPLANOPREV
     sSeqProposta       := InttoStr(qryAux.FieldByName('C26').AsInteger); // SEQPROPOSTA
     if qryAux.FieldByName('C22').AsInteger <> 0   // TEMPOSERVANTREAL
     then sTempoServAntReal := InttoStr(qryAux.FieldByName('C22').AsInteger) // ELEGPATRO.TEMPOSERVANTREAL
     else sTempoServAntReal := InttoStr(qryAux.FieldByName('C23').AsInteger); // ELEGPATRO.TEMPOSERVANTERIOR
     dtDemissao.Text    := qryAux.FieldByName('C30').AsString;  // DATADEMISSAO
     sFlgSitEspecial    := qryAux.FieldByName('C31').AsString;  // FLGSITESPECIAL
     sTipoSitFuncAntes  := qryAux.FieldByName('C32').AsString; //TIPOSITFUNCANTES
     edTempoServTotal.Text := InttoStr(qryAux.FieldByName('C33').AsInteger); //TEMPOSERVTOTAL
     sFlgIntPartAntes      := qryAux.FieldByName('C34').AsString; //FLGINTPARTANTES
     edTempoServMES.Text   := qryAux.FieldByName('C35').AsString;
     edTempoServDIA.Text   := qryAux.FieldByName('C36').AsString;
end;


procedure TfrmEventoAposentaBenef.ConcederOK;
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
                  '',sNumerosProcessos,qryCO.FieldByName('MATRICULA').AsString,true);

         end;
      end;
  end;
end;



end.
