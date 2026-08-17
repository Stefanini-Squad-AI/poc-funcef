unit FParamRelExtratoDeslig;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor       : Gleyber
// Data        : 09/08/2007
// Pendência   : 26040
// Alteração   : Acerto no cálculo do benefício de Resgate.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 18/04/2007
// Pendência   : 25104
// Alteração   : Acerto na consideração do tipo de dado do registro de
//               portabilidade
//------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, TreeWzd, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  FPreview, Pptypes, ComCtrls, ppTmplat, Wwdatsrc, USistema, DBClient,
  uCMClientDataSet;

type
  TContribManut = Record
    IDCONTRIBUICAO    : Integer;
    NOMECONTRIBUICAO  : String[60];
    VALOR             : Double;
  end;

  TFrmParamRelExtratoDeslig = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtNomeParticip: TEdit;
    Label2: TLabel;
    edtNomePatro: TEdit;
    Label3: TLabel;
    edtInscricao: TEdit;
    Label4: TLabel;
    edtMatricula: TEdit;
    Label5: TLabel;
    edtNomePlano: TEdit;
    btnLocalizar: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    memResult: TMemo;
    MontaSelect: TMontaSelect;
    qryAux: TwwQuery;
    qryCfg: TwwQuery;
    qryEvento: TwwQuery;
    qryTitular: TwwQuery;
    qryBeneficio: TwwQuery;
    qryContribuicoes: TwwQuery;
    pnlEtapas: TPanel;
    twEtapa: TTreeWzd;
    qrySaldoReservas: TwwQuery;
    dsSaldoReservas: TwwDataSource;
    updSaldoReservas: TUpdateSQL;
    qryExe: TwwQuery;
    qryDados: TwwQuery;
    dsDados: TwwDataSource;
    updDados: TUpdateSQL;
    cdsTempoContrib: TCMClientDataSet;
    qryReservaPart: TwwQuery;
    qryMovReservaTemp: TwwQuery;
    updMovReservaTemp: TUpdateSQL;
    procedure FormShow(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure memResultChange(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    aContribManut     : Array of TContribManut;
    sIdEventoGerador,
    sDescricao,
    sMsgErro,
    sSalManut,
    sSql              : String;
    iIdpessoa,
    iIdpessjur,
    iIdPlanoprev,
    iContador,
    iIdEventoPrev,
    iIdSimulaDeslig   : Integer;
    iSeqproposta      : Integer;
    dValor,
    dValorCota,
    rValorReserva,
    rOpcao1,
    rOpcao2,
    rOpcao3           : Double;
    iIdCalculo        : Integer;
    sValor            : String;
    bErro             : Boolean;


    procedure LimpaTela;
    procedure LimpaArray;
    function ApagaDadosGravados : Boolean;
    function RodaRegraElegibilidade(Var PsMsgErro : String): Boolean;
    function RodaRegraBeneficio(Var PbErro : Boolean; Var PsMsgErro : String): String;
    function GravaInicioPart: Boolean;
    function CalculaSalManut(PiIdPessJur, PiIdPessoa  : integer; PsMesRef, PsFlgInterno : string) : String;
    function GravaReservasAssociadas: Boolean;
    function GravaDados(psNomeCampo: String;
    piTipoDado, piFlgCategoria : Integer; pvValor : Variant) : Boolean;
    function GravaDadosAdicionais : Boolean;

    // Funções de Cálculo do extrato.
    function CalculaBeneficio   : Boolean;
    function CalculaDiferimento : Boolean;
    function CalculaManutencao  : Boolean;
    function CalculaReservaParaBeneficio ( piIdBeneficio,
                                           piIdRegraReserva,
                                           piFlgResgate      : longint )  : double;   // Gleyber - 09/08/2007 - Pendência 26040


    // Função para montar o relatório.
    procedure MontaRelatorio;
  public
    { Public declarations }
  end;

var
  FrmParamRelExtratoDeslig: TFrmParamRelExtratoDeslig;

implementation

uses DBaseDados, UDataBase, UMensErro, dRelExtratoDeslig, UBeneficio,
     UParticipante,UAdmPrev, UMovReserva, UEventos, UCtrlTempoServico,
     UConsPart;

{$R *.DFM}

procedure TFrmParamRelExtratoDeslig.FormShow(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFrmParamRelExtratoDeslig.LimpaTela;
begin
  memResult.Lines.Clear;
  edtNomeParticip.Text              := '';
  edtNomePatro.Text                 := '';
  edtInscricao.Text                 := '';
  edtMatricula.Text                 := '';
  edtNomePlano.Text                 := '';
end;

procedure TFrmParamRelExtratoDeslig.LimpaArray;
Var
  iCont : Integer;
begin
  //    limpa o array record
  For iCont := Low(aContribManut) to High(aContribManut) do
  Begin
    aContribManut[iCont].IDCONTRIBUICAO    := 0;
    aContribManut[iCont].NOMECONTRIBUICAO  := '';
    aContribManut[iCont].VALOR             := 0;
  End;
end;

procedure TFrmParamRelExtratoDeslig.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  If MontaSelect.RetornouValor
   Then Begin
     iIdpessoa            := StrToInt(MontaSelect.ValoresChave[0]);
     iIdpessjur           := StrToInt(MontaSelect.ValoresChave[1]);
     iIdPlanoprev         := StrToInt(MontaSelect.ValoresChave[2]);
     edtNomeParticip.Text := MontaSelect.ValoresChave[3];
     edtNomePatro.Text    := MontaSelect.ValoresChave[4];
     edtNomePlano.Text    := MontaSelect.ValoresChave[5];
     edtInscricao.Text    := MontaSelect.ValoresChave[6];
     edtMatricula.Text    := MontaSelect.ValoresChave[7];
     iSeqproposta         := StrToInt(MontaSelect.ValoresChave[8]);
     memResult.Lines.Clear;
     memResult.Lines.Add('Demonstrativo de Demissão para o Participante: ');
     memResult.Lines.Add('             '+MontaSelect.ValoresChave[3]);
     memResult.Lines.Add('  ');
     twEtapa.Etapa.Pos    := 1;
     self.Height          := 384;   // Baca para aparecer a marcação no TTreeWzd

     qryReservaPart.Close;
     qryReservaPart.ParamByName('IDPESSJUR').Value      := iIdpessjur;
     qryReservaPart.ParamByName('IDPLANOPREV').Value    := iIdPlanoprev;
     qryReservaPart.ParamByName('IDTITULAR').Value      := iIdpessoa;
     qryReservaPart.ParamByName('SEQPROPOSTA').Value    := iSeqproposta;
     qryReservaPart.Open;

     qryMovReservaTemp.Close;
     qryMovReservaTemp.ParamByName('IDTITULAR').Value      := iIdpessoa;
     qryMovReservaTemp.ParamByName('SEQPROPOSTA').Value    := iSeqproposta;
     qryMovReservaTemp.ParamByName('IDPESSJUR').Value      := iIdpessjur;
     qryMovReservaTemp.ParamByName('IDPLANOPREV').Value    := iIdPlanoprev;
     qryMovReservaTemp.ParamByName('NUMEROPROCESSO').Value := -1;
     qryMovReservaTemp.Open;

   End;
end;

procedure TFrmParamRelExtratoDeslig.bbtnConfirmarClick(Sender: TObject);
Var
  bJaExiste        : Boolean;
begin
  // Crítica dos campos
  If Trim(edtNomeParticip.Text)=''
   Then Begin
     MsgDlg('Escolha primeiro o participante a executar a simulação.','Erro',mtError,[mbOk],0);
     btnLocalizar.SetFocus;
     Exit;
   End
   Else Begin
     // Verificar se a configuração para o plano existe
     qryCfg.Close;
     qryCfg.ParamByName('PIDPLANOPREV').AsInteger := iIdPlanoprev;
     qryCfg.Open;

     If qryCfg.IsEmpty
      Then Begin
        MsgDlg('O plano previdenciário do participante não está configurado.'+#13+#10+
               'Execute a configuração primeiro.','Erro',mtError,[mbOk],0);
        bbtnSair.SetFocus;
        Exit;
      End;

     // Veriicar se o participante já foi demitido
     qryEvento.Close;
     qryEvento.ParamByName('PIDPESSOA').AsInteger    := iIdpessoa;
     qryEvento.ParamByName('PIDPESSJUR').AsInteger   := iIdpessjur;
     qryEvento.ParamByName('PIDPLANOPREV').AsInteger := iIdPlanoprev;
     qryEvento.Open;

     If qryEvento.IsEmpty
      Then Begin
        MsgDlg('Não foi localizado evento de demissão para este participante.'+#13+#10+
               'Efetue, em primeiro lugar, o Evento de Demissão da Patrocinadora.','Erro',mtError,[mbOk],0);
        bbtnSair.SetFocus;
        Exit;
      End;
   End;

   // Abrir a query com os dados do participante
   qryTitular.Close;
   qryTitular.ParamByName('IDPESSJUR').AsInteger   := iIdpessjur;
   qryTitular.ParamByName('IDPLANOPREV').AsInteger := iIdPlanoprev;
   qryTitular.ParamByName('IDPESSOA').AsInteger    := iIdpessoa;
   qryTitular.ParamByName('SEQPROPOSTA').AsInteger := iSeqproposta;
   qryTitular.Open;


  // Execução do processo
  With memResult.Lines do
   Begin
     Add('- Iniciado às '+DateTimeToStr(Now)+'.');
     Add(' ');
     Add('- Verificando existência de extrato anterior.');

     twEtapa.Etapa.Pos := 2;
     Screen.Cursor := crSQLWait;

     bJaExiste := False;
     sSql := 'SELECT DISTINCT IDSIMULADESLIG, TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') DATA '+
             'FROM SIMULADESLIG '+
             'WHERE IDPESSOA = '+IntToStr(iIdpessoa)+
             ' AND IDPESSJUR = '+IntToStr(iIdpessjur)+
             ' AND IDPLANOPREV = '+IntToStr(iIdPlanoprev);

     If FazQuery(qryAux, sSql)
      Then Begin
       Screen.Cursor := crDefault;
       iIdSimulaDeslig := qryAux.FieldByName('IDSIMULADESLIG').AsInteger;
       Add('- Encontrado cálculos do participante na data de '+qryAux.FieldByName('DATA').AsString+'.');
       If MsgDlg('Foi encontrado dados sobre extrato calculado em '+qryAux.FieldByName('DATA').AsString+
                 '.'+#13+#10+'Deseja fazer novo cálculo ?','Confirmação', mtConfirmation, [mbNo, mbYes], 1) = mrNo
        Then Begin // Passa direto para a etapa do relatório
          bJaExiste := True;
          twEtapa.Etapa.Pos := 4;

          MontaRelatorio;

          twEtapa.Etapa.Pos := 5;
          Add(' ');
          Add('- Finalizado às '+DateTimeToStr(Now)+'.');
          Exit;
        End // If MsgDlg
        Else Begin // Apaga os dados sobre o participante na tabela e continua normalmente
          Screen.Cursor := crSQLWait;

          Add(' - Apagando cálculos anteriores.');

          If Not ApagaDadosGravados
          Then Begin
            Add('   Erro ao apagar dados anteriores.'+#13+#10+
                '   Processo cancelado.');
            Screen.Cursor := crDefault;
            Exit;
          End;
        End // Else Begin
      End;  // If FazQuery(qryAux, sSql)

     If Not bJaExiste
      Then Begin
        twEtapa.Etapa.Pos := 3;
        qryCfg.First;

        GravaInicioPart;

        While Not qryCfg.Eof do
         Begin // Laço para executar eventos na ordem dada na configuração.
           sIdEventoGerador := qryCfg.FieldByName('IDEVENTOGERADOR').AsString;

           // Manutenção (Auto-Pat)
           If qryCfg.FieldByName('FLGCATEGORIA').AsInteger = 0
           Then Begin
             If Not CalculaManutencao  // Rotina de Cálculo de Manutenção
             Then Begin
               If Not ApagaDadosGravados
               Then Add('   Erro ao apagar dados efetuados.');
               Screen.Cursor := crDefault;
               Exit;
             End;

           End; // If qryCfg.FieldByName('FLGCATEGORIA').AsInteger = 0

           If qryCfg.FieldByName('FLGCATEGORIA').AsInteger > 0
           Then Begin
             qryBeneficio.Close;
             qryBeneficio.ParamByName('IDEVENTOGERADOR').AsInteger := qryCfg.FieldByName('IDEVENTOGERADOR').AsInteger;
             qryBeneficio.ParamByName('IDPLANOPREV').AsInteger     := iIdPlanoprev;

             Add(' - Verificando benefícios envolvidos.');

             qryBeneficio.Open;

             // Rotina de Cálculo de Benefício
             If Not CalculaBeneficio
             Then Begin
               If Not ApagaDadosGravados
               Then Add('   Erro ao apagar dados efetuados.');
               Screen.Cursor := crDefault;
               Exit;
             End;

             // Tratamento específico para Diferimento
             If qryCfg.FieldByName('FLGCATEGORIA').AsInteger = 1
             Then Begin

               // Rotina de Cálculo de Diferimento
               If Not CalculaDiferimento
               Then Begin
                 If Not ApagaDadosGravados
                 Then Add('   Erro ao apagar dados efetuados.');
                 Screen.Cursor := crDefault;
                 Exit;
               End;
             End;  // If qryCfg.FieldByName('FLGCATEGORIA').AsInteger = 1
           End;  // If qryCfg.FieldByName('FLGCATEGORIA').AsInteger = 0

             qryCfg.Next;
         End; // While Not qryCfg.Eof do

      End; // If Not bJaExiste

     Add(' - Gravando reservas associadas.');
     If Not GravaReservasAssociadas
     Then Begin
        Add('   Erro na gravação das reservas associadas:'+#13+#10+
            '   Processo cancelado.');
        If Not ApagaDadosGravados
        Then Add('   Erro ao apagar dados efetuados.');
        Screen.Cursor := crDefault;
        Exit;
     End;

     Add(' - Gerando relatório da simulação.');
     Screen.Cursor := crDefault;

     MontaRelatorio;

     twEtapa.Etapa.Pos := 5;
     Add(' ');
     Add('- Finalizado às '+DateTimeToStr(Now)+'.');
   End; // With memResult.Lines do
end;

function TFrmParamRelExtratoDeslig.RodaRegraElegibilidade(Var PsMsgErro : String): Boolean;
Var
 bErro    : Boolean;
 sMsgErro : String;
begin
  If qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger = 0
  Then Exit;

  memResult.Lines.Add(' - Verificando regra de elegibilidade.');
  memResult.Lines.Add('   Regra de Elegibilidade - Nº '+qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsString+'.'); 

  Result := ExecutaRegraElegibilidade(qryAux,
                                      qryBeneficio.FieldByName('IDREGRAELEGIBILI').AsInteger,   
                                      iIdpessjur,
                                      iIdPlanoprev,
                                      iIdpessoa
                                      iSeqproposta,
                                      qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,        
                                      0,  // Opcao1
                                      0,  // Opcao2
                                      0,  // Opcao3
                                      qryEvento.FieldByName('DATAEVENTO').AsString,
                                      qryEvento.FieldByName('DATAEVENTO').AsString,
                                      qryEvento.FieldByName('DATAEVENTO').AsString,
                                      DateToStr(Date), // Data do Requerimento
                                      'AT',
                                      'DP',
                                      qryEvento.FieldByName('IDSITPARTATUAL').AsString,
                                      qryEvento.FieldByName('IDSITPLANOATUAL').AsString,
                                      qryEvento.FieldByName('IDSITFUNCATUAL').AsString,
                                      qryEvento.FieldByName('IDSITPARTNOVO').AsString,
                                      qryEvento.FieldByName('IDSITPLANONOVO').AsString,
                                      qryEvento.FieldByName('IDSITFUNCNOVO').AsString,
                                      1,
                                      0,
                                      bErro,
                                      sMsgErro,
                                      0);
end;

function TFrmParamRelExtratoDeslig.RodaRegraBeneficio(
Var PbErro : Boolean; Var PsMsgErro : String): String;
Var
  bGrupo,
  bErro             : Boolean;
  sMsgErro,
  sSalpart,
  sSalarioIntegral,
  sRemTotal,
  sDataInscFund,
  sFlgSitPartAntes,
  sIdSitFuncAtual,
  sIdSitPartAtual,
  sIdSitPlanAtual,
  sIdSitFuncAntes,
  sIdSitPartAntes,
  sIdSitPlanAntes,
  sMesReferencia    : String;
  iIdCalculo,
  iIdRegraCalculo   : Integer;
  dResult           : Double;
begin

  sSql := 'SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+
          qryEvento.FieldByName('IDSITPARTATUAL').AsString;
  FazQuery(qryAux, sSql);

  sMesReferencia   := Copy(DateToStr(Date),7,4)+Copy(DateToStr(Date),3,3);
  sFlgSitPartAntes := qryAux.FieldByName('FLGINTERNO').AsString;
  sSalPart         := '0';
  sIdSitFuncAtual := qryEvento.FieldByName('IDSITFUNCNOVO').AsString;
  sIdSitPartAtual := qryEvento.FieldByName('IDSITPARTNOVO').AsString;
  sIdSitPlanAtual := qryEvento.FieldByName('IDSITPLANONOVO').AsString;
  sIdSitFuncAntes := qryEvento.FieldByName('IDSITFUNCATUAL').AsString;
  sIdSitPartAntes := qryEvento.FieldByName('IDSITPARTATUAL').AsString;
  sIdSitPlanAntes := qryEvento.FieldByName('IDSITPLANOATUAL').AsString;

  sSalPart         := BuscaSalario(iIdPessJur,
                                   iIdPlanoPrev,
                                   iIdPessoa,
                                   sMesReferencia,
                                   sFlgSitPartAntes,
                                   sSalPart,
                                   sMsgErro,
                                   qryAux);

  sSalarioIntegral := BuscaSalarioPESSOAINTEGRAL(qryAux,
                                                 iIdPessJur,
                                                 iIdPlanoPrev,
                                                 iIdpessoa,
                                                 iSeqProposta,
                                                 sFlgSitPartAntes,
                                                 sMesReferencia );


  sRemTotal := ORANUMERO(CalcREMTOTAL( iIdPessJur,
                                       iIdPessoa,
                                       SAnoMesAnterior(sMesReferencia),
                                       qryAux));

  sDataInscFund := CalcDataInscFund(iIdPessJur,
                                    iIdPlanoPrev,
                                    iIdpessoa,
                                    iSeqProposta,
                                    qryAux);


  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT '+#13+
                 '  VALORBASE1, VALORBASE2, VALORBASE3 '+#13+
                 'FROM '+#13+
                 '  BENEFPLANOPART ' +#13+
                 'WHERE '+#13+
                 '      IDPESSJUR   = ' + IntToStr(iIdPessJur)   +#13+
                 '  AND IDPESSOA    = ' + IntToStr(iIdpessoa)    +#13+
                 '  AND IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) +#13+
                 '  AND SEQPROPOSTA = ' + IntToStr(iSeqProposta) +#13+
                 '  AND IDBENEFICIO = ' + qryBeneficio.FieldByName('IDBENEFICIO').AsString);
  qryAux.Open;

  If qryAux.IsEmpty Then
  Begin
    rOpcao1 := 0;
    rOpcao2 := 0;
    rOpcao3 := 0;
  End
  Else
  Begin
    rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat;
    rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat;
    rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat;
  End;

  rValorReserva := CalculaReservaParaBeneficio(qryBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                               qryBeneficio.FieldByName('IDREGRAPAGAMENTO').AsInteger,
                                               qryBeneficio.FieldByName('FLGRESGATE').AsInteger);

  If qryBeneficio.FieldByName('IdGrupoBenef').AsInteger > 0 Then
    bGrupo := True
  Else
    bGrupo := False;

  sSQL := ' SELECT DISTINCT  1 FLGCONCESSAO, PP.SEQPROPOSTA, PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, '+
          '        PP.INSCRICAODATA, PP.INSCRICAOTIPO, PP.DTINICIOINSC,  '+
          '        PF.DATANASC, PF.SEXO,  PF.DATAMORTE, PP.IDPESSOA AS IDTITULAR,  '+
          '        EL.SALTOTAL,  EL.DATAADMISSAO, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,'+
          '        EL.TEMPOSERVTOTAL,  EL.DATADEMISSAO, EL.FLGDIRETOR, SP.FLGINTERNO, '+
          '        EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, PP.IDPESSOA AS IDTITULAR, '+
          '        0 AS PERCPROVISORIO, 0 AS FLGPROVISORIO, 0 AS PRAZOPROVISORIO, '+
          '        0 AS FLGPOSSUIACOMPINSS, '+
          qryBeneficio.FieldByName('IDBENEFICIO').AsString+ ' AS IDBENEFICIO , '+
          '        0 AS NUMEROPROCESSO , '+
          qryBeneficio.FieldByName('IDBENEFICIO').AsString+ ' AS IDBENEFICIO , '+
          '        0 AS NUMEROPROCESSO , '+
          QuotedStr(qryTitular.FieldByName('INSCRICAODATA').AsString)+' AS INSCRICAODATAFUND , '+
          '        0 AS VLRCALCINSS, '+
          '        0 AS VLRINFINSS, '+
          OraNumero(sSALPART)        +         ' AS VALORPROVENTO, '+
          OraNumero(sREMTOTAL)       +         ' AS VALORREMTOTAL, '+
          OraNumero(sSalarioIntegral)+         ' AS VALORINTEGRAL, '+
          // Gleyber - 09/08/2007 - Pendência 26040 - Início
          OraNumero(FloatToStr(rOpcao1))+      ' AS VALORBASE1, '+
          OraNumero(FloatToStr(rOpcao2))+      ' AS VALORBASE2, '+
          OraNumero(FloatToStr(rOpcao3))+      ' AS VALORBASE3, '+
          OraNumero(FloatToStr(rValorReserva))+' AS VALORRESERVA, '+
          OraNumero(sIdSitFuncAtual)+          ' AS IDSITFUNC, ' +
          OraNumero(sIdSitPartAtual)+          ' AS IDSITPART, ' +
          OraNumero(sIdSitPlanAtual)+          ' AS IDSITPLANOPREV ,  '+
          OraNumero(sIdSitPartAntes)+          ' AS IDSITPARTATUAL,   '+
          OraNumero(sIdSitPlanAntes)+          ' AS IDSITPLANOATUAL,  '+
          OraNumero(sIdSitFuncAntes)+          ' AS IDSITFUNCATUAL,   '+
                                            '  0 AS FLGTIPOINSS, '+
          QuotedStr(DateToStr(Date))+          ' AS DATAREF, '+
          QuotedStr(DateToStr(Date))+          ' AS DATAINICIO, '+
          QuotedStr(DateToStr(Date))+          ' AS DATAINICIOFUND, '+
          QuotedStr(DateToStr(Date))+          ' AS DATAINICIOINSS,   '+
          QuotedStr(DateToStr(Date))+          ' AS DATAINICIOPAGTO,  '+
          QuotedStr(DateToStr(Date))+          ' AS DATAREQUERIMENTO, '+
          ' ''          ''  AS IDTPPAGTOANT,     '+
          ' ''          ''  AS ULTMESREAJANT,    '+
          ' ''          ''  AS FLGBENEFMINANT,   '+
          ' ''          ''  AS DATAEVENTOANT,    '+
          ' ''          ''  AS CODBENEFICIOANT,  '+
          ' ''          ''  AS DATAINICIOANT,    '+
          '        0 AS VLBENEFPGTO,        '+
          '        0 AS VALORBENEFANT,      '+
          '        0 AS VALORBINSSANT1,     '+
          '        0 AS VALORBINSSANT2,     '+
          '        0 AS VALORBINSSANT3,     '+
          '        0 AS NUMBENEF,           '+
          '        0 AS VALORBASE1INSS,     '+
          '        0 AS VALORBASE2INSS,     '+
          '        0 AS VALORBASE3INSS,     '+
          '        0 AS VALORSRB,           '+
          '        0 AS SOMAITEMNOPBC,  '+
          '        0 AS SOMAITEMNADIB,  '+
          '        ''          '' AS DATAFINAL,   '+
          '        0 AS VALORASSOCIADO, 0 AS ASSOC1OP1, 0 AS ASSOC2OP1, 0 AS ASSOC3OP1, '+
          '        0 AS ASSOC1OP2, 0 AS ASSOC2OP2, 0 AS ASSOC3OP2, '+
          '        0 AS ASSOC1OP3, 0 AS ASSOC2OP3, 0 AS ASSOC3OP3  '+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  SITPART SP, SITFUNC SF, BENEFPLANOPART BPL,  '+
          ' BENEFBFCIARIO BFC '+
          ' WHERE  PP.IDPESSJUR   = ' + IntToStr(iIdPessJur)   + ' AND '+
          '        PP.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ' AND '+
          '        PP.IDPESSOA    = ' + IntToStr(iIdPessoa)   + ' AND '+
          '        PP.SEQPROPOSTA = ' + IntToStr(iSeqProposta) + ' AND '+
          '        BFC.IDBENEFICIO(+) = '+qryBeneficio.FieldByName('IDBENEFICIO').AsString + ' AND '+
          '        EL.IDPESSJUR       = PP.IDPESSJUR AND '+
          '        EL.IDPESSOA        = PP.IDPESSOA AND '+
          '        PF.IDPESSOA        = EL.IDPESSOA AND '+
          '        EL.IDSITFUNC       = SF.IDSITFUNC AND '+
          '        PP.IDPESSJUR       = BFC.IDPESSJUR(+) AND '+
          '        PP.IDPLANOPREV     = BFC.IDPLANOPREV(+) AND '+
          '        PP.IDPESSOA        = BFC.IDPESSOA(+) AND '+
          '        PP.SEQPROPOSTA     = BFC.SEQPROPOSTA(+) AND '+
          '        SP.IDSITPART       = PP.IDSITPART AND '+
          '        BPL.IDPESSJUR(+)   = BFC.IDPESSJUR AND '+
          '        BPL.IDPESSOA(+)    = BFC.IDTITULAR AND '+
          '        BPL.IDPESSOA (+)   = BFC.IDPESSOA AND '+
          '        BPL.IDPLANOPREV(+) = BFC.IDPLANOPREV AND '+
          '        BPL.SEQPROPOSTA(+) = BFC.SEQPROPOSTA AND '+
          '        BPL.IDBENEFICIO(+) = BFC.IDBENEFICIO ';


  iIdRegraCalculo := qryBeneficio.FieldByName('IdRegraCalculo').AsInteger;
  memResult.Lines.Add(' - Executando regra de cálculo do benefício.');
  memResult.Lines.Add('   Regra de Cálculo Nº '+IntToStr(iIdRegraCalculo)+'.');

  Result := RegraNumerica(IntToStr(iIdRegraCalculo),sSQL, PbErro, iIdCalculo, False );


  if PbErro
   then begin
     PbErro    := True;
     PsMsgErro := ' Ocorreu um erro na Regra de Cálculo do Valor do Benefício (nº '+IntToStr(iIdRegraCalculo)+') ';
     Result    := '0';
     Exit;
  end;

  if Trim(Result) = ''
  then begin
     PbErro    := True;
     PsMsgErro := '   A regra de cálculo nº '+IntToStr(iIdRegraCalculo)+' retornou um valor nulo';
     Result    := '0';
     Exit;
  end;
end;

function TFrmParamRelExtratoDeslig.GravaInicioPart: Boolean;
begin
  iIdSimulaDeslig := LeUltRegistro(qryExe,'SIMULADESLIG');

  qryExe.Close;
  qryExe.SQL.Clear;
  qryExe.SQL.Add('INSERT INTO SIMULADESLIG ');
  qryExe.SQL.Add('  (IDSIMULADESLIG, IDPESSOA, IDPESSJUR, IDPLANOPREV)');
  qryExe.SQL.Add('VALUES (');
  qryExe.SQL.Add(IntToStr(iIdSimulaDeslig)+', ');  // IDSIUMULADESLIG
  qryExe.SQL.Add(IntToStr(iIdpessoa)+', ');        // IDPESSOA
  qryExe.SQL.Add(IntToStr(iIdpessjur)+', ');       // IDPESSJUR
  qryExe.SQL.Add(IntToStr(iIdPlanoPrev)+') ');     // IDPLANOPREV

  Try
    qryExe.ExecSQL;
    Result := True;
  Except
    Result := False;
  End;
end;

function TFrmParamRelExtratoDeslig.CalculaSalManut(PiIdPessJur,
  PiIdPessoa: integer; PsMesRef, PsFlgInterno: string): String;
Var
  RegSal : TRegSalMes;
begin
  RegSal := CalcUltSalPart(PiIdPessJur,
                          PiIdPessoa,
                          PsMesRef,
                          PsFlgInterno,
                          qryAux);

  Result := RegSal.Valor;
end;

procedure TFrmParamRelExtratoDeslig.memResultChange(Sender: TObject);
begin
  inherited;
  If memResult.Lines.Count > 14
   Then memResult.ScrollBars := ssVertical
   Else memResult.ScrollBars := ssNone;
end;

function TFrmParamRelExtratoDeslig.GravaReservasAssociadas : Boolean;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CD.IDCFGSIMULADESLIG, CD.IDEVENTOGERADOR, RD.IDTIPORESERVA, ');
  qryAux.SQL.Add('       RXP.NOME, RXP.CODHIERARQUIA, RP.VALORRESERVA, ');
  qryAux.SQL.Add('       CD.FLGCATEGORIA, ');
  qryAux.SQL.Add('       DECODE(CD.FLGCATEGORIA, 0, ''AUTOPAT_'', ');
  qryAux.SQL.Add('                               1, ''DIFERIMENTO_'', ');
  qryAux.SQL.Add('                               2, ''PORTABILIDADE_'', ');
  qryAux.SQL.Add('                               3, ''RESGATE_'') CAMPO ');
  qryAux.SQL.Add('FROM RESERVAPART RP,');
  qryAux.SQL.Add('	 RESERVADESLIG RD,');
  qryAux.SQL.Add('     RESERVAXPLANO RXP,');
  qryAux.SQL.Add('     CFGSIMULADESLIG CD');
  qryAux.SQL.Add('WHERE RP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
  qryAux.SQL.Add('  AND RP.IDPESSJUR   = '+IntToStr(iIdpessjur));
  qryAux.SQL.Add('  AND RP.IDPESSOA    = '+IntToStr(iIdpessoa));
  qryAux.SQL.Add('  AND RD.IDTIPORESERVA = RP.IDTIPORESERVA');
  qryAux.SQL.Add('  AND CD.IDCFGSIMULADESLIG = RD.IDCFGSIMULADESLIG');
  qryAux.SQL.Add('  AND RXP.IDPLANOPREV = RP.IDPLANOPREV');
  qryAux.SQL.Add('  AND RXP.IDTIPORESERVA = RP.IDTIPORESERVA');
  qryAux.SQL.Add('  AND NVL(RP.VALORRESERVA,0) > 0');
  qryAux.SQL.Add('ORDER BY CD.IDCFGSIMULADESLIG, CD.IDEVENTOGERADOR, RXP.CODHIERARQUIA');
  qryAux.Open;

  qryAux.First;
  iContador := 0;
  While Not qryAux.Eof do
   Begin
    dValor := qryAux.FieldByName('VALORRESERVA').AsFloat * dValorCota;
    sValor := OraNumero(FloatToStr(dValor));

    Inc(iContador);

    // Grava Código de Hierarquia
    If Not GravaDados(qryAux.FieldByName('CAMPO').AsString+'CODHIERARQUIA_'+IntToStr(iContador),
                      0,
                      qryAux.FieldByName('FLGCATEGORIA').AsInteger,
                      qryAux.FieldByName('CODHIERARQUIA').AsString)
    Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do diferimento (Código de Hierarquia):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados(sIdEventoGerador

    // Grava Nome da Reserva
    If Not GravaDados(qryAux.FieldByName('CAMPO').AsString+'NOME_RESERVA_'+IntToStr(iContador),
                      0,
                      qryAux.FieldByName('FLGCATEGORIA').AsInteger,
                      qryAux.FieldByName('NOME').AsString)
    Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do diferimento (Nome da Reserva):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados(sIdEventoGerador

    // Saldo da Reserva
    If Not GravaDados(qryAux.FieldByName('CAMPO').AsString+'SALDO_'+IntToStr(iContador),
                      1,
                      qryAux.FieldByName('FLGCATEGORIA').AsInteger,
                      qryAux.FieldByName('VALORRESERVA').AsString)   
     Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do diferimento (Saldo da Reserva):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados(sIdEventoGerador

    qryAux.Next;
   End; // While Not qrySaldoReservas.Eof do
   Result := True;
end;

function TFrmParamRelExtratoDeslig.ApagaDadosGravados: Boolean;
begin
  // Apaga dados gravados da simulação
  qryAux.Close;
  qryAux.SQL.Clear;

  qryAux.SQL.Add('DELETE FROM DADOSSIMDESLIG ');
  qryAux.SQL.Add('WHERE IDSIMULADESLIG = '+IntToStr(iIdSimulaDeslig) );

  Try
   qryAux.ExecSQL;
   Result := True;
  Except
   Result := False;
   Exit;
  End;

  // Apaga inicial do participante simulado
  qryAux.Close;
  qryAux.SQL.Clear;

  qryAux.SQL.Add('DELETE FROM SIMULADESLIG ');
  qryAux.SQL.Add('WHERE IDSIMULADESLIG = '+IntToStr(iIdSimulaDeslig) );
  qryAux.SQL.Add(' AND IDPESSOA = '+IntToStr(iIdpessoa) );
  qryAux.SQL.Add(' AND IDPESSJUR = '+IntToStr(iIdpessjur) );
  qryAux.SQL.Add(' AND IDPLANOPREV = '+IntToStr(iIdPlanoprev) );

  Try
   qryAux.ExecSQL;
   Result := True;
  Except
   Result := False;
  End;
end;

function TFrmParamRelExtratoDeslig.GravaDados(psNomeCampo: String;
  piTipoDado, piFlgCategoria : Integer; pvValor : Variant) : Boolean;Var
  iIdDadosSimDeslig : Integer;
begin
//
// piTipoDado:
//   0 - Valor tipo String grava em VALORTIPOS
//   1 - Valor tipo Integer grava em VALORTIPOF
//   2 - Valor tipo Data grava em VALORTIPOD
//
  sSql := 'SELECT 1 FROM DADOSSIMDESLIG ' + #13 +
          'WHERE NOMECAMPO = '+ QuotedStr(psNomeCampo) + #13 +
          '  AND FLGCATEGORIA = '+ IntToStr(piFlgCategoria);

  If FazQuery(qryExe, sSql)  
  Then Begin
    Result := True;
    Exit;
  End;

  iIdDadosSimDeslig := LeUltRegistro(qryExe,'DADOSSIMDESLIG');

  qryExe.Close;
  qryExe.SQL.Clear;
  sSQL := 'INSERT INTO DADOSSIMDESLIG '+#13+
          '  (IDDADOSSIMDESLIG, IDSIMULADESLIG, FLGCATEGORIA, NOMECAMPO, ';

  Case piTipoDado Of
   0 : sSql := sSql + ' VALORTIPOS)'+#13;
   1 : sSql := sSql + ' VALORTIPOF)'+#13;
   2 : sSql := sSql + ' VALORTIPOD)'+#13;
  End;

  sSql := sSql + 'VALUES ('+
          IntToStr(iIdDadosSimDeslig)+', '+  // IDSIMULADESLIG
          IntToStr(iIdSimulaDeslig)+', '+    // IDDADOSSIMDESLIG
          IntToStr(piFlgCategoria)+', '+     // FLGCATEGORIA
          QuotedStr(psNomeCampo)+', ';       // NOMECAMPO

  Case piTipoDado Of
   0   : sSql := sSql + QuotedStr(pvValor)+ ')';
   1,2 : sSql := sSql + OraNumero(pvValor) + ')'; //
  End;

  Try
    qryExe.SQL.Add(sSql);
    qryExe.ExecSQL;
    Result := True;
  Except
    Result := False;
  End;
end;

function TFrmParamRelExtratoDeslig.GravaDadosAdicionais: Boolean;
Var
 sResult,
 sSqlEntrada : String;
 bErro       : Boolean;
 iIdCalculo  : Integer;
begin
  // Não possui campos adicionais, sai da rotina com True
  If (qryCfg.FieldByName('IDREGRARETORNO1').AsInteger = 0) And
     (qryCfg.FieldByName('IDREGRARETORNO2').AsInteger = 0)
  Then Begin
    Result := True;
    Exit;
  End;

  // Monta query genérica para rodar a query
  sSqlEntrada := 'SELECT PE.IDPESSOA, PE.NOME, PE.FLGINVALIDO, PE.NUMDOCUMENTO, ' + #13 +
                 '       PF.DATANASC, PF.ESTCIVIL, PF.SEXO, PF.FLGISENTOIRRF,   ' + #13 +
                 '       EL.DATAADMISSAO, EL.DATADEMISSAO, EL.IDPESSJURCEDIDO,  ' + #13 +
                 '       EL.IDSITFUNC, EL.MATRICULA, EL.SALTOTAL, EL.TEMPOSERVTOTAL, ' + #13 +
                 '       EL.TEMPOSIMPLES, EL.IDPESSJUR, PP.IDSITPART, ' + #13 +
                 '       PP.IDSITPLANOPREV, PP.IDPLANOPREV, PP.INSCRICAONUMERO, ' + #13 +
                 '       PP.INSCRICAODATA, PP.SALINSCRICAO, PP.SALPARTICIPACAO, ' + #13 +
                 '       PP.SALMANTIDO, PP.DATACANCELAMENTO, PP.FLGDESATIVADO, ' + #13 +
                 '       PP.MESULTREAJSAL ' + #13 +
                 'FROM PESSOA PE, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP ' + #13 +
                 'WHERE PE.IDPESSOA    = '+ IntToStr(iIdpessoa) + #13 +
                 '  AND EL.IDPESSJUR   = '+ IntToStr(iIdpessoa) + #13 +
                 '  AND PP.IDPLANOPREV = '+ IntToStr(iIdPlanoPrev) + #13 +
                 '  AND PE.IDPESSOA    = PF.IDPESSOA ' + #13 +
                 '  AND EL.IDPESSOA    = PE.IDPESSOA ' + #13 +
                 '  AND PP.IDPESSOA    = EL.IDPESSOA  ' + #13 +
                 '  AND PP.IDPESSJUR   = EL.IDPESSJUR ';

  // Roda a regra para o primeiro campo adicionado
  If qryCfg.FieldByName('IDREGRARETORNO1').AsInteger > 0
  Then Begin
    sResult := RegraString( qryCfg.FieldByName('IDREGRARETORNO1').AsString,
                            sSqlEntrada,
                            bErro,
                            iIdCalculo );
    If bErro
    Then Begin
      memResult.Lines.Add('   Erro na execução da regra de campo adicional nº '+qryCfg.FieldByName('IDREGRARETORNO1').AsString);
      memResult.Lines.Add('   Processo cancelado.');

      If Not ApagaDadosGravados
      Then  memResult.Lines.Add('   Erro ao apagar dados efetuados.'+#13+#10+
                '   Processo cancelado.');
      Result := False;
      Exit;
    End;

    If Not GravaDados(qryCfg.FieldByName('NOMECAMPO1').AsString,
                      0,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      sValor)
    Then Begin
      memResult.Lines.Add('   Erro na gravação dos dados da regra de campo adicional nº '+qryCfg.FieldByName('IDREGRARETORNO1').AsString);
      memResult.Lines.Add('   Processo cancelado.');

      If Not ApagaDadosGravados
      Then  memResult.Lines.Add('   Erro ao apagar dados efetuados.'+#13+#10+
                          '   Processo cancelado.');
      Result := False;
      Exit;
    End; // If Not GravaDados...
  End; // If qryCfg.FieldByName('IDREGRARETORNO1').AsInteger > 0

  // Roda a regra para o segundo campo adicionado
  If qryCfg.FieldByName('IDREGRARETORNO2').AsInteger > 0
  Then Begin
    sResult := RegraString( qryCfg.FieldByName('IDREGRARETORNO2').AsString,
                            sSqlEntrada,
                            bErro,
                            iIdCalculo );
    If bErro
    Then Begin
      memResult.Lines.Add('   Erro na execução da regra de campo adicional nº '+qryCfg.FieldByName('IDREGRARETORNO2').AsString);
      memResult.Lines.Add('   Processo cancelado.');

      If Not ApagaDadosGravados
      Then  memResult.Lines.Add('   Erro ao apagar dados efetuados.'+#13+#10+
                          '   Processo cancelado.');
      Result := False;
      Exit;
    End;

    If Not GravaDados(qryCfg.FieldByName('NOMECAMPO2').AsString,
                      0,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      sValor)
    Then Begin
      memResult.Lines.Add('   Erro na gravação dos dados da regra de campo adicional nº '+qryCfg.FieldByName('IDREGRARETORNO2').AsString);
      memResult.Lines.Add('   Processo cancelado.');

      If Not ApagaDadosGravados
      Then  memResult.Lines.Add('   Erro ao apagar dados efetuados.'+#13+#10+
                          '   Processo cancelado.');
      Result := False;
      Exit;
    End; // If Not GravaDados...
  End; // If qryCfg.FieldByName('IDREGRARETORNO2').AsInteger > 0

  Result := True;
end;

function TFrmParamRelExtratoDeslig.CalculaBeneficio: Boolean;
begin
  While Not qryBeneficio.Eof do
   Begin // Laço para executar regras dos benefícios envolvidos.

     // Verifica se foi configurado para executar regra de elegibilidade
     If qryCfg.FieldByName('FLGRODAELEG').AsInteger = 1
      Then
        If Not RodaRegraElegibilidade(sMsgErro)
        Then Begin
          If Trim(sMsgErro) <> ''
           Then memResult.Lines.Add('   Erro na execução da regra de elegibilidade:'+#13+#10+
                              sMsgErro+#13+#10+'   Processo cancelado.')
           Else memResult.Lines.Add('   Participante não passou pela regra de elegibilidade.'+#13+#10+'   Processo cancelado.');

           Result := False;
           Exit
         End; // If Not RodaRegraElegibilidade(sMsgErro)

     memResult.Lines.Add(' - Preparando dados para execução da regra de cálculo.');

     sValor := RodaRegraBeneficio(bErro, sMsgErro);

     If bErro
      Then Begin
        memResult.Lines.Add('   Erro na execução da regra de cálculo:'+#13+#10);
        If Trim(sMsgErro) <> ''
         Then memResult.Lines.Add(sMsgErro+#13+#10);
        memResult.Lines.Add('   Processo cancelado.');

        Result := False;
        Exit
      End; // If bErro

     sValor := OraNumero(sValor);

     memResult.Lines.Add(' - Gravando dados do benefício.');
     sDescricao := qryBeneficio.FieldByName('NOMEBENEFICIO').AsString;
     If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+
                       qryBeneficio.FieldByName('IDBENEFICIO').AsString,
                       1,
                       qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                       sValor)
     Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do benefício:'+#13+#10+
           sDescricao+#13+#10+'   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados...

     qryBeneficio.Next;
   End;  // While Not qryBeneficio.Eof do

   If Not GravaDadosAdicionais
   Then Begin
     Screen.Cursor := crDefault;
     Exit;
   End; // If Not GravaDadosAdicionais

   Result := True;
end;

function TFrmParamRelExtratoDeslig.CalculaDiferimento: Boolean;
begin
  qrySaldoReservas.Open;
  memResult.Lines.Add(' - Calculando dados sobre Diferimento.');
  dValor := CalcPadraoMovReserva(iIdpessjur,
                                 iIdPlanoPrev,
                                 iIdpessoa,
                                 iSeqproposta,
                                 StrToInt(sIdEventoGerador),
                                 iIdpessjur,
                                 iIdPlanoPrev,
                                 qryCfg.FieldByName('FLGINTERNO').AsString,
                                 qryEvento.FieldByName('DATAEVENTO').AsString,
                                 sMsgErro,
                                 0,
                                 qrySaldoReservas);
  If Trim(sMsgErro) <> ''
  Then Begin
    memResult.Lines.Add('   Erro na execução do cálculo da reserva:'+#13+#10+sMsgErro);
    memResult.Lines.Add('   Processo cancelado.');

    Result := False;
    Exit;
  End; // If Trim(sMsgErro) <> ''

  sValor := OraNumero(FloatToStr(dValor));

  memResult.Lines.Add(' - Gravando dados o valor do Diferimento.');

  qrySaldoReservas.First;

  iContador := 0;

  While Not qrySaldoReservas.Eof do
  Begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT CODHIERARQUIA, NOME FROM RESERVAXPLANO');
    qryAux.SQL.Add('WHERE IDPLANOPREV   = ' + IntToStr(iIdPlanoPrev));
    qryAux.SQL.Add('  AND IDTIPORESERVA = ' + qrySaldoReservas.FieldByName('IDTIPORESERVA').AsString);
    qryAux.Open;

    If qryAux.IsEmpty
    Then Begin
      qrySaldoReservas.Next;
      Continue;
    End;

    Inc(iContador);

    dValorCota := qrySaldoReservas.FieldByName('VALORCOTA').AsFloat;

    // Grava Código de Hierarquia
    If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'CODHIERARQUIA_'+IntToStr(iContador),
                      0,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      qryAux.FieldByName('CODHIERARQUIA').AsString)
    Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do diferimento (Código de Hierarquia):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados(sIdEventoGerador

    // Grava Nome da Reserva
    If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'NOME_RESERVA_'+IntToStr(iContador),
                      0,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      qryAux.FieldByName('NOME').AsString)
    Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do diferimento (Nome da Reserva):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados(sIdEventoGerador

    // Quantidade de Cotas
    If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'QTD_COTAS_'+IntToStr(iContador),
                      1,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      qrySaldoReservas.FieldByName('QTDCOTAS').AsString)
     Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do diferimento (Quantidade de Cotas):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados(sIdEventoGerador

    // Valor da Cota
    If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'VLR_COTA_'+IntToStr(iContador),
                      1,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      qrySaldoReservas.FieldByName('VALORCOTA').AsString)
     Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do diferimento (Valor da Cota):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados(sIdEventoGerador

    // Saldo da Reserva
    If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'SALDO_'+IntToStr(iContador),
                      1,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      qrySaldoReservas.FieldByName('SALDORESERVA').AsString)
     Then Begin
       memResult.Lines.Add('   Erro na gravação dos dados do diferimento (Saldo da Reserva):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados(sIdEventoGerador

    qrySaldoReservas.Next;

   End; // While Not qrySaldoReservas.Eof do

  qrySaldoReservas.CancelUpdates;
  qrySaldoReservas.Close;
end;

function TFrmParamRelExtratoDeslig.CalculaManutencao: Boolean;
Var
 iCont : Integer;
begin
  // Grava salário de manutenção
  memResult.Lines.Add(' - Calculando salário de manutenção.');

  sSql := 'SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+
          qryEvento.FieldByName('IDSITPARTATUAL').AsString;
  FazQuery(qryAux, sSql);

  sValor := CalculaSalManut(iIdpessjur, iIdpessoa,
                            Copy(MontaSelect.ValoresChave[10],7,4)+Copy(MontaSelect.ValoresChave[10],3,3),
                            qryAux.FieldByName('FLGINTERNO').AsString);

  sSalManut := OraNumero(sValor);

  memResult.Lines.Add(' - Gravando dados do salário de manutenção.');

  If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'SALMANUT',
                    1,
                    qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                    sSalManut)
  Then Begin
     memResult.Lines.Add('   Erro na gravação dos dados do salário de manutenção:'+#13+#10+
         '   Processo cancelado.');
     Result := False;
     Exit;
   End; // If Not GravaDados(sIdEventoGerador,sDescricao,sValor);

  // Lendo as contribuicões atuais do participante
  memResult.Lines.Add(' - Lendo as contribuicões atuais do participante.');
  qryContribuicoes.Close;
  qryContribuicoes.ParamByName('PISEQPROPOSTA').AsInteger := iSeqproposta;
  qryContribuicoes.ParamByName('PIIDPESSJUR').AsInteger   := iIdpessjur;
  qryContribuicoes.ParamByName('PIIDPLANOPREV').AsInteger := iIdPlanoPrev;
  qryContribuicoes.ParamByName('PIIDPESSOA').AsInteger    := iIdpessoa;
  qryContribuicoes.ParamByName('PDDATAEVENTO').AsDate     := qryEvento.FieldByName('DATAEVENTO').AsDateTime;

  qryContribuicoes.Open;

  memResult.Lines.Add(' - Gravando dados das contribuições atuais do participante.');

  iContador := 0;

  While Not qryContribuicoes.Eof do
   Begin
     Inc(iContador);

     sDescricao := qryContribuicoes.FieldByName('NOME').AsString;
     sValor     := OraNumero(qryContribuicoes.FieldByName('VALORESPERADO').AsString);

     // Grava o nome da Contribuição Atual
     If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'NOME_CONTRIB_ATUAL_'+IntToStr(iContador),
                       0,
                       qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                       sDescricao)
      Then Begin
        memResult.Lines.Add('   Erro na gravação das contribuições atuais do participante (Nome):'+#13+#10+
            '   Processo cancelado.');
        Result := False;
        Exit;
      End; // If Not GravaDados(sIdEventoGerador,sDescricao,sValor)

     // Grava o valor da Contribuição Atual
     If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'VALOR_CONTRIB_ATUAL_'+IntToStr(iContador),
                       1,
                       qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                       sValor)
      Then Begin
        memResult.Lines.Add('   Erro na gravação das contribuições atuais do participante (Valor):'+#13+#10+
            '   Processo cancelado.');
        Result := False;
        Exit;
      End; // If Not GravaDados(sIdEventoGerador,sDescricao,sValor)

     qryContribuicoes.Next;
   End; // While Not qryContribuicoes.Eof do

  // Calcula as contribuições de mantido durante a própria associação.

  memResult.Lines.Add(' - Simulando o Autopatrocínio do participante.');

  dtmBaseDados.dbBaseDados.StartTransaction;

  // Associa as novas contribuições

  iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

  sSql := 'INSERT INTO EVENTOSPREV (IDEVENTOSPREV) VALUES ('+IntToStr(iIdEventoPrev)+')';

  qryExe.Close;
  qryExe.SQL.Clear;
  qryExe.SQL.Add(sSql);

  qryExe.ExecSQL;

  GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev),
                               IntToStr(iIdPlanoPrev),
                               qryCfg.FieldByName('IDEVENTOGERADOR').AsString,
                               '',
                               IntToStr(iIdpessoa),
                               IntToStr(iIdpessjur),
                               IntToStr(iSeqproposta),
                               '',
                               '',
                               DateToStr(Date),
                               True,
                               qryAux,
                               qryExe,IntToStr(iIdPlanoPrev));

  If Not AssociaNovasContribuicoes(IntToStr(iIdpessjur),
                                   IntToStr(iIdPlanoPrev),
                                   IntToStr(iIdpessoa),
                                   IntToStr(iSeqproposta),
                                   qryCfg.FieldByName('IDEVENTOGERADOR').AsString,
                                   '01/'+Copy(DateToStr(Date), 4, 7),
                                   '',
                                   edtMatricula.Text,
                                   qryEvento.FieldByName('IDSITPARTATUAL').AsString
                                   sSalManut,
                                   False,
                                   True,
                                   False,
                                   qryAux,
                                   qryExe,
                                   qryCfg.FieldByName('FLGINTERNO').AsString,
                                   0,
                                   '')
  Then Begin
    memResult.Lines.Add('   Erro ao simular AutoPatrocínio (associando novas contribuições):'+#13+#10+
        '   Processo cancelado.');

    dtmBaseDados.dbBaseDados.Rollback;

    Result := False;
    Exit;
  End; // If Not SuspendeContribuicoes

  // Lê as contribuções preparadas
  sSql := 'SELECT HC.IDCONTRIBUICAO, CB.NOME, HC.VALORESPERADO ' + #13 +
          'FROM HSTCONTRIBPREV HC, CONTRIBUICAO CB ' + #13 +
          'WHERE HC.MESREFERENCIA  = '+ QuotedStr(Copy(DateToStr(Date), 4, 7)+Copy(DateToStr(Date), 3, 3)) + #13 +
          '  AND HC.MESCOBRANCA    = '+ QuotedStr(Copy(DateToStr(Date), 4, 7)+Copy(DateToStr(Date), 3, 3)) + #13 +
          '  AND HC.IDPESSOA       = '+ IntToStr(iIdpessoa) + #13 +
          '  AND HC.IDPESSJUR      = '+ IntToStr(iIdpessjur) + #13 +
          '  AND HC.IDPLANOPREV    = '+ IntToStr(iIdPlanoPrev) + #13 +
          '  AND HC.SEQPROPOSTA    = '+ IntToStr(iSeqproposta) + #13 +
          '  AND HC.VALORESPERADO  > 0 ' + #13 +
          '  AND HC.VALORRECEBIDO  = 0 ' + #13 +
          '  AND HC.IDCONTRIBUICAO IN (SELECT CP.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP ' + #13 +
          '                            WHERE CP.IDPESSJUR   = HC.IDPESSJUR ' + #13 +
          '                              AND CP.IDPLANOPREV = HC.IDPLANOPREV ' + #13 +
          '                              AND CP.IDPESSOA    = HC.IDPESSOA ' + #13 +
          '                              AND CP.SEQPROPOSTA = HC.SEQPROPOSTA ' + #13 +
          '                              AND CP.FLGCOBRA    = 1) ';

  FazQuery(qryAux, sSql);
  //  Seta o tamanho do array (aRegBen)
  //  para a quantidade existente
  //  e limpa o array.
  SetLength(aContribManut , qryAux.RecordCount);
  qryAux.First;
  LimpaArray;

  iContador := 0;
  While Not qryAux.Eof do
  Begin
    aContribManut[iContador].IDCONTRIBUICAO   := qryAux.FieldByName('IDCONTRIBUICAO').AsInteger;
    aContribManut[iContador].NOMECONTRIBUICAO := qryAux.FieldByName('NOME').AsString;
    aContribManut[iContador].VALOR            := qryAux.FieldByName('VALORESPERADO').AsFloat;

    qryAux.Next;
  End; // While Not qryAux.Eof do

  // Cancela toda a simulação
  dtmBaseDados.dbBaseDados.Rollback;

  // Grava dados coletados
  For iCont := Low(aContribManut) to High(aContribManut) do
  Begin
    // Grava o nome das Contribuição de manutenção
    If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'NOME_CONTRIB_MANUT_'+IntToStr(aContribManut[iCont].IDCONTRIBUICAO),
                      0,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      aContribManut[iCont].NOMECONTRIBUICAO)
     Then Begin
       memResult.Lines.Add('   Erro na gravação das contribuições de manutenção do participante (Nome):'+#13+#10+
                     '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados

    sValor := OraNumero(FloatToStr(aContribManut[iCont].VALOR));

    // Grava o valor das Contribuição de manutenção
    If Not GravaDados(qryCfg.FieldByName('CAMPO').AsString+'VALOR_CONTRIB_MANUT_'+IntToStr(aContribManut[iCont].IDCONTRIBUICAO),
                      1,
                      qryCfg.FieldByName('FLGCATEGORIA').AsInteger,
                      sValor)
     Then Begin
       memResult.Lines.Add('   Erro na gravação das contribuições de manutenção do participante (Valor):'+#13+#10+
           '   Processo cancelado.');
       Result := False;
       Exit;
     End; // If Not GravaDados

  End; // For iContador := Low(aContribManut) to High(aContribManut) do

  Result := True;
end;

procedure TFrmParamRelExtratoDeslig.MontaRelatorio;
Var
  sAnos,
  sMeses,
  sDias,
  sTempoResumido,
  sNomeArq,
  sSqlRelat       : String;
  iTempoSimples   : Longint;
  fTemplate       : TStrings;
  bValorNulo      : Boolean;

begin
  sSql := 'SELECT CF.ORDEM, CF.FLGCATEGORIA, DS.VALORTIPOS, ' + #13 +
          '       DS.NOMECAMPO, NVL(DS.VALORTIPOF, 0) VALORTIPOF, DS.VALORTIPOD ' + #13 + 
          'FROM CFGSIMULADESLIG CF, SIMULADESLIG SD, DADOSSIMDESLIG DS ' + #13 +
          'WHERE CF.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + #13 +
          '  AND SD.IDPESSJUR   = ' + IntToStr(iIdpessjur) + #13 +
          '  AND SD.IDPESSOA    = ' + IntToStr(iIdpessoa) + #13 +
          '  AND SD.IDPLANOPREV = CF.IDPLANOPREV ' + #13 +
          '  AND DS.IDSIMULADESLIG = SD.IDSIMULADESLIG ' + #13 +
          '  AND DS.FLGCATEGORIA  = CF.FLGCATEGORIA ' + #13 +
          'ORDER BY CF.ORDEM, CF.FLGCATEGORIA ';

  If not FazQuery(qryAux, sSql)
  Then Begin
    memResult.Lines.Add('   Não foram encontrados dados para gerar o relatório.'+#13+#10+
                        '   Processo cancelado.');
    Exit;
  End;

  sSqlRelat := 'SELECT ' + #13 + #10;
  While Not qryAux.Eof do
  Begin
    // Verifica se o valor é completamente nulo
    If (Trim(qryAux.FieldByName('VALORTIPOS').AsString) = '') And
       (qryAux.FieldByName('VALORTIPOF').AsFloat = 0)         And
       (qryAux.FieldByName('VALORTIPOD').AsFloat = 0)         Then
      sSqlRelat := sSqlRelat + '       ' + QuotedStr(' ')
    Else
    Begin
      // Verifica qual o valor foi preenchido
      If Trim(qryAux.FieldByName('VALORTIPOS').AsString) <> ''
      Then sSqlRelat := sSqlRelat + '       '+QuotedStr(qryAux.FieldByName('VALORTIPOS').AsString)
      Else If qryAux.FieldByName('VALORTIPOF').AsFloat > 0
           Then sSqlRelat := sSqlRelat + '       '+OraNumero(qryAux.FieldByName('VALORTIPOF').AsString)
           Else If qryAux.FieldByName('VALORTIPOD').AsFloat > 0
                Then sSqlRelat := sSqlRelat + '       '+QuotedStr(qryAux.FieldByName('VALORTIPOD').AsString);
    End;

    sSqlRelat := sSqlRelat + ' AS ' + qryAux.FieldByName('NOMECAMPO').AsString+', '+#13+#10;
    qryAux.Next;
  End; // While Not qryAux

  // Alimenta a query do relatório com os demais dados

  // NomeParticipante
  sSqlRelat := sSqlRelat + '       ' + QuotedStr(MontaSelect.ValoresChave[3]) + ' AS NOMEPARTICIPANTE, '+#13;

  // DataNasc
  sSqlRelat := sSqlRelat + '       ' +  QuotedStr(MontaSelect.ValoresChave[9]) + ' AS DATANASC, '+#13;

  // IdPlanoPrev
  sSqlRelat := sSqlRelat + '       ' + MontaSelect.ValoresChave[2] + ' AS IDPLANOPREV, '+#13;

  // NomePlano
  sSqlRelat := sSqlRelat + '       ' + QuotedStr(MontaSelect.ValoresChave[5]) + ' AS NOMEPLANO, '+#13;

  // Matricula
  sSqlRelat := sSqlRelat + '       ' + QuotedStr(MontaSelect.ValoresChave[7]) + ' AS MATRICULA, '+#13;

  // IdPessjur
  sSqlRelat := sSqlRelat + '       ' + MontaSelect.ValoresChave[1] + ' AS IDPESSJUR, '+#13;

  // DataDemissao
  sSqlRelat := sSqlRelat + '       ' + QuotedStr(MontaSelect.ValoresChave[10]) + ' AS DATADEMISSAO, '+#13;

  // NomePatro
  sSqlRelat := sSqlRelat + '       ' + QuotedStr(MontaSelect.ValoresChave[4]) + ' AS NOMEPATR, '+#13;

  // DataAdmissao
  sSqlRelat := sSqlRelat + '       ' + QuotedStr(MontaSelect.ValoresChave[13]) + ' AS DATAADMISSAO, '+#13;

  // SalParticipacao
  sSqlRelat := sSqlRelat + '       ' + ClienteNumero(MontaSelect.ValoresChave[14]) + ' AS SALPARTICIPACAO, '+#13;

  // InscriçãoData
  sSqlRelat := sSqlRelat + '       ' + QuotedStr(MontaSelect.ValoresChave[11]) + ' AS INSCRICAODATA, '+#13;

  // InscricaoNumero
  sSqlRelat := sSqlRelat + '       ' + MontaSelect.ValoresChave[6] + ' AS INSCRICAONUMERO, '+#13;

  // Calcula tempos
  iTempoSimples := CalcTempoContrib(qryAux,
                                    iIdpessoa,
                                    0,
                                    1,
                                    1,
                                    MontaSelect.ValoresChave[13],
                                    MontaSelect.ValoresChave[10],
                                    MontaSelect.ValoresChave[10]);

  // Divide o tempo anos, meses e dias
  sTempoResumido := TransformaDiasTempo(iTempoSimples);

  sAnos  := copy(sTempoResumido, 1, 2);
  sMeses := copy(sTempoResumido, 3, 2);
  sDias  := copy(sTempoResumido, 5, 2);

  // TempoContribTotal
  sSqlRelat := sSqlRelat + '       ' + OraNumero(IntToStr(iTempoSimples)) + ' AS TEMPOCONTRIBTOTAL, '+#13;

  // TempoContribAnos
  sSqlRelat := sSqlRelat + '       ' + OraNumero(sAnos) + ' AS TEMPOCONTRIBANOS, '+#13;

  // TempoContribMeses
  sSqlRelat := sSqlRelat + '       ' + OraNumero(sMeses) + ' AS TEMPOCONTRIBMESES, '+#13;

  // TempoContribDias
  sSqlRelat := sSqlRelat + '       ' + OraNumero(sDias) + ' AS TEMPOCONTRIBMESES, '+#13;

  // Sistema
  sSqlRelat := sSqlRelat + '       ' + QuotedStr(Sistema.NomeAplicativo) + ' AS SISTEMA '+#13;

  sSqlRelat := Copy(sSqlRelat, 1, (Length(sSqlRelat) - 2)) + #13 + ' FROM DUAL';

  With dtmRelExtratoDeslig do
   Begin
     twEtapa.Etapa.Pos := 4;

     qryFundacao.Close;
     qryFundacao.ParamByName('PFUNDACAO').AsInteger    := Sistema.IdEmpresa;
     qryFundacao.Open;

     qryExtSimDeslig.Close;
     qryExtSimDeslig.SQL.Clear;
     qryExtSimDeslig.SQL.Add(sSqlRelat);
     qryExtSimDeslig.Open;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT IDPLANOPREV, TEMPLATE');
     qryAux.SQL.Add('FROM CFGSIMULADESLIG');
     qryAux.SQL.Add('WHERE TEMPLATE IS NOT NULL');
     qryAux.SQL.Add('  AND IDPLANOPREV = '+IntToStr(iIdPlanoprev));

     qryAux.Open;

     If Not qryAux.FieldByName('TEMPLATE').IsNull
      Then Begin
        sNomeArq := Sistema.TempDir + 'relsim.tcm';
        fTemplate := TStringList.Create;

        fTemplate.Add(qryAux.FieldByName('TEMPLATE').AsString);
        fTemplate.SaveToFile(sNomeArq);

        dsgExtSimDeslig.Report.Template.FileName := sNomeArq;
        dsgExtSimDeslig.Report.Template.LoadFromFile;
      End;

     dsgExtSimDeslig.Report.Template.SaveTo   := stFile;
     dsgExtSimDeslig.Report.Template.Format   := ftASCII;
     dsgExtSimDeslig.Report.Device            := dvScreen;

     TFrmPreview.CreateModalPreview(Application, dsgExtSimDeslig.Report, 'AdmPREV - Demonstrativo de Desligamento');
   End; // With dtmRelExtratoDeslig do

  If FileExists(sNomeArq) Then  DeleteFile(sNomeArq);

  If fTemplate <> nil Then fTemplate.Free;
end;

procedure TFrmParamRelExtratoDeslig.bbtnSairClick(Sender: TObject);
begin
  If dtmBaseDados.dbBaseDados.InTransaction
  Then dtmBaseDados.dbBaseDados.Rollback;
  inherited;
end;

function TFrmParamRelExtratoDeslig.CalculaReservaParaBeneficio(
  piIdBeneficio, piIdRegraReserva, piFlgResgate: Integer): double;
var dTotReservaReal,
    dValorReservaCota,
    dValorDaCota,
    dTotReserva           : Double;
    sDataRef,
    sDataInicio,
    sValorProvento,
    sValorAtualReserva,
    sValorReservaCota,
    sValorTotReservaReal,
    sDataCancelamento,
    sSQLReserva,
    sDataUltRecebimento   : String;
    bErro                 : Boolean;
    iNumReg,
    iTotReserva,
    iFlgUltimo            : Integer;
    varfields             : Variant;
begin
   Result := 0;

   If qryReservaPart.IsEmpty Then
     Exit;

   If (qryMovReservaTemp.UpdatesPending) Then
     qryMovReservaTemp.CancelUpdates;

   sDataRef := FormatDateTime('dd/mm/yyyy', date);

   sDataInicio := sDataRef;

   // Se tiver regra de calculo de reserva para pagamento
   // Entao utilizar a regra
   // Senao converter as reservas para real e somá-las
   If piIdRegraReserva > 0 Then
   Begin
     qryaux.close;
     qryaux.sql.text := ' SELECT MAX(DATARECEBIMENTO) DATA '+
                        ' FROM HSTCONTRIBPREV  '+
                        ' WHERE  IDPESSJUR =  '''+qryReservaPart.FieldByName('IdPessJur').AsString+'''   '+
                        ' AND IDPLANOPREV = '''+qryReservaPart.FieldByName('IdPlanoPrev').AsString+'''   '+
                        ' AND IDPESSOA =  '''+qryReservaPart.FieldByName('IdPessoa').AsString+'''    '+
                        ' AND SEQPROPOSTA =  '''+qryReservaPart.FieldByName('SeqProposta').AsString+''' ';
     qryaux.open;

     If Not qryaux.isempty Then
       sDataUltRecebimento := qryaux.fieldbyname('DATA').AsString;

     sValorProvento := CalcSALPART( iIdPessJur,iIdpessoa ,
                                    Copy(sDataInicio,7,4)+'/'+Copy(sDataInicio,4,2),
                                    qryAux);
     sSQLReserva := '';
     iNumReg     := 0;
     iFlgUltimo  := 0;
     iTotReserva := qryReservaPart.RecordCount;
     qryReservaPart.First;

     // Executar a regra de reserva para beneficio para cada reserva.
     // A regra retornará o valor em cotas que será usado da reserva para calcular o
     // valor do benefício. Este valor deve ser guardado na MOVRESERVATEMP
     // Quando acabar de executar a regra para todas as reservas, executá-la mais
     // uma vez para a regra retornar o valor total em real da reserva para benefício
     While (Not qryReservaPart.Eof) Or (iNumReg <= iTotReserva) Do
     Begin
        inc(iNumReg);

        // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
        // já rodei a regra para todas as reservas e estou rodando a ultima vez para
        // pegar o total em real das reservas
        If iNumReg > iTotReserva Then
          iFlgUltimo := 1;

        //se for o valor atual deve ser passado como o somatório
        //dos valorres abatidos
        If iFlgUltimo = 1 Then
        Begin
          sValorAtualReserva := OraNumero(FloatToStr(dTotReservaReal));
        End
        Else
        Begin
          varFields := VarArrayCreate([0,1],varVariant);
          varFields[0] := piIdBeneficio;
          varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

          If qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey]) Then
            sValorAtualReserva := OraNumero(FloatToStr(qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                            - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat))
          Else
            If qryMovReservaTemp.Locate('IdTipoReserva',qryReservaPart.FieldByName('IdTipoReserva').AsInteger ,
                                        [loCaseInsensitive, loPartialKey]) Then
               sValorAtualReserva := OraNumero(FloatToStr(qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                               - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat))
             Else
               sValorAtualReserva := OraNumero(qryReservaPart.FieldByName('ValorReserva').AsString);
        End;

        sDataCancelamento := qryTitular.FieldByName('DATACANCELAMENTO').AsString;

        If sDataCancelamento = '' Then
          sDataCancelamento := ' ';

        sSQLReserva := ' SELECT '+IntToStr(iNumReg)+                                                             ' AS CONTRESERVA, '+#13+
                                IntToStr(iFlgUltimo)+                                                            ' AS ULTRESERVA, '+#13+
                                qryReservaPart.FieldByName('IdTipoReserva').AsString+                            ' AS IDTIPORESERVA, '+#13+
                                qryReservaPart.FieldByName('IdPessJur').AsString    +                            ' AS IDPESSJUR, '+#13+
                                qryReservaPart.FieldByName('IdPlanoPrev').AsString  +                            ' AS IDPLANOPREV, '+#13+
                                qryReservaPart.FieldByName('IDPESSOA').AsString     +                            ' AS IDTITULAR, '+#13+
                                qryReservaPart.FieldByName('IdPessoa').AsString     +                            ' AS IDPESSOA, '+#13+
                                qryReservaPart.FieldByName('SeqProposta').AsString     +                         ' AS SEQPROPOSTA, '+#13+
                                ''''+qryReservaPart.FieldByName('FLGDESCIRRF').AsString+                       ''' AS FLGDESCIRRF, '+#13+
                                IntToStr(piIdBeneficio)+                                                         ' AS IDBENEFICIO, '+#13+
                                OraNumero(sValorProvento) +                                                      ' AS VALORPROVENTO, '+#13+
                                sValorAtualReserva        +                                                      ' AS VALORRESERVA, '+#13+
                                ''''+qryReservaPart.FieldByName('MoeSigla').AsString+                          ''' AS MOESIGLA, '+#13+
                                ''''+PreparaStrRegra(sDataInicio)+                                             ''' AS DATAINICIO, '+#13+
                                ''''+PreparaStrRegra(sDataRef)+                                                ''' AS DATAREF, '+#13+
                                ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATAREFERENCIASA').AsString)+ ''' AS DATAREFERENCIASA, '+#13+
                                ''''+PreparaStrRegra(qryReservaPart.FieldByName('DATANASC').AsString)+         ''' AS DATANASC, '+#13+
                                ''''+PreparaStrRegra(qryTitular.FieldByName('INSCRICAODATA').AsString)+        ''' AS INSCRICAODATA, '+#13+
                                ''''+ PreparaStrRegra(sDataCancelamento) +                                     ''' AS DATACANCELAMENTO, '+#13+
                                ''''+qryReservaPart.FieldByName('DATAADMISSAO').AsString  +                    ''' AS DATAADMISSAO, '+#13+
                                ''''+qryReservaPart.FieldByName('CODHIERARQUIA').AsString +                    ''' AS CODHIERARQUIA, '+#13+
                                ''''+qryReservaPart.FieldByName('INDICEREAJUSTE').AsString+                    ''' AS INDICEREAJUSTE, '+#13+
                                ''''+qryReservaPart.FieldByName('FLGCONTROLE').AsString   +                    ''' AS FLGCONTROLE, '+#13+
                                ''''+PreparaStrRegra(FormatDateTime('dd/mm/yyyy', Date) )        +             ''' AS DATAREQUERIMENTO, '+#13+
                                ''''+PreparaStrRegra(FormatDateTime('dd/mm/yyyy', Date) )        +             ''' AS DATAINICIOPAGTO, '+#13+
                                ''''+PreparaStrRegra(qryEvento.FieldByName('FLGINTANT').AsString)+             ''' AS FLGINTERNOANT, '+#13+
                                ''''+PreparaStrRegra(qryEvento.FieldByName('FLGINTNOV').AsString)+             ''' AS FLGINTERNO, '+#13+
                                ''''+PreparaStrRegra(qryEvento.FieldByName('IDSITPARTATUAL').AsString)+        ''' AS IDSITPARTATUAL, '+#13+
                                ''''+PreparaStrRegra(qryEvento.FieldByName('IDSITPLANOATUAL').AsString)+       ''' AS IDSITPLANOATUAL, '+#13+
                                ''''+PreparaStrRegra(qryEvento.FieldByName('IDSITFUNCATUAL').AsString)+        ''' AS IDSITFUNCATUAL, '+#13+
                                ''''+PreparaStrRegra(qryEvento.FieldByName('IDSITPARTNOVO').AsString)+         ''' AS IDSITPARTNOVO, '+#13+
                                ''''+PreparaStrRegra(qryEvento.FieldByName('IDSITPLANONOVO').AsString)+        ''' AS IDSITPLANONOVO, '+#13+
                                ''''+PreparaStrRegra(qryEvento.FieldByName('IDSITFUNCNOVO').AsString)+         ''' AS IDSITFUNCNOVO, '+#13+
                                ''''+OraNumero(qryReservaPart.FieldByName('PERCENTUALSAQUE').AsString)+        ''' AS PERCENTUALSAQUE, '+#13+
                                OraNumero(FloatToStr(rOpcao1))+                                                  ' AS VALORBASE1, '+#13+
                                OraNumero(FloatToStr(rOpcao2))+                                                  ' AS VALORBASE2, '+#13+
                                OraNumero(FloatToStr(rOpcao3))+                                                  ' AS VALORBASE3, '+#13+
                                ''''+PreparaStrRegra(sDataUltRecebimento)+                                     ''' AS DATAULTCONTRIB, '+#13+
                                ''''+PreparaStrRegra(qryTitular.FieldByName('DTINICIOINSC').AsString)+         ''' AS DTINICIOINSC    '+#13+
                    ' FROM DUAL ';

        // Quando a variavel iNumReg for > que a variavel iTotReserva significa que
        // já rodei a regra para todas as reservas e estou rodando a ultima vez para
        // pegar o total em real das reservas
        If iNumReg <=  iTotReserva Then
        Begin
          sValorReservaCota    := RegraNumerica( IntToStr(piIdRegraReserva), sSQLReserva, bErro, iIdCalculo, False);

          If bErro Then
          Begin
            MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+IntToStr(piIdRegraReserva)+'.',
                   'Erro',mtError,[mbOk, mbHelp],0);
            dValorReservaCota := 0;
            break;
          End
          Else
            dValorReservaCota := StrToFloat(ClienteNumero(sValorReservaCota));

           // Acumula valor a ser usado na regra de benefício
           // que é o valor a ser abatido
           dTotReservaReal := dTotReservaReal + dValorReservaCota;

           If (piFlgResgate = 1) Then
           Begin
             // Atualizar/inserir reserva na qryMovReservaTemp
             varFields := VarArrayCreate([0,1],varVariant);
             varFields[0] := piIdBeneficio;
             varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;
             If qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey]) Then
             Begin
               qryMovReservaTemp.Edit;
               qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := dValorReservaCota;
               qryMovReservaTemp.Post;
             End
             Else
             Begin
               qryMovReservaTemp.Insert;
               qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
               qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
               qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := iIdPessJur;
               qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := iIdPlanoPrev;
               qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := iIdpessoa;
               qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := iIdpessoa;
               qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := iSeqProposta;
               qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := piIdBeneficio;
               qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
               qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := dValorReservaCota;
               qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
               qryMovReservaTemp.Post;
             End;
          End;
          qryReservaPart.Next;
        End
        Else
        Begin
          sValorTotReservaReal := RegraNumerica( IntToStr(piIdRegraReserva), sSQLReserva, bErro, iIdCalculo, false );

          If bErro Then
          Begin
            MsgDlg('Erro na Regra de Cálculo de Reserva para Benefício Nº '+IntToStr(piIdRegraReserva)+'.',
                   'Erro',mtError,[mbOk, mbHelp],0);
            dTotReservaReal := 0;
            Break;
          End
          Else
            dTotReservaReal := StrToFloat(ClienteNumero(sValorTotReservaReal));
        End;
     End; // while
   End
   Else
   Begin
     dTotReservaReal := 0;
     dTotReserva     := 0;
     qryReservaPart.First;

     While Not qryReservaPart.Eof Do
     Begin
       If qryReservaPart.FieldByName('FLGCONTROLE').AsInteger = 1 Then
       Begin
         qryReservaPart.Next;
         continue;
       End;

       If qryReservaPart.FieldByName('ValorReserva').AsString <> '' Then
       Begin
         If Not qryMovReservaTemp.isempty Then
         Begin
            varFields := VarArrayCreate([0,1],varVariant);
            varFields[0] := piIdBeneficio;
            varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;

            If qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey]) Then
              dTotReserva := (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat)
            Else
              If qryMovReservaTemp.Locate('IdTipoReserva',qryReservaPart.FieldByName('IdTipoReserva').AsInteger , [loCaseInsensitive, loPartialKey]) Then
                dTotReserva := (qryMovReservaTemp.FieldByName('VlrOriginal').AsFloat
                                - qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat)
              Else
                dTotReserva := qryReservaPart.FieldByName('ValorReserva').AsFloat;
         End
         Else
         Begin
            dTotReserva := qryReservaPart.FieldByName('ValorReserva').AsFloat;
         End;

         dValorDaCota  := VoltaValorCotacao(qryaux,
                                            qryReservaPart.FieldByName('INDICEREAJUSTE').AsString,'','',
                                            FormatDateTime('dd/mm/yyyy', Date)
                                           );

         dTotReservaReal := dTotReservaReal + (  dTotReserva   * dValorDaCota );

         If (piFlgResgate = 1) Then
         Begin
           varFields := VarArrayCreate([0,1],varVariant);
           varFields[0] := piIdBeneficio;
           varFields[1] := qryReservaPart.FieldByName('IdTipoReserva').AsInteger;
           If qryMovReservaTemp.Locate('IdBeneficio;IdTipoReserva',varFields , [loCaseInsensitive, loPartialKey]) Then
           Begin
             qryMovReservaTemp.Edit;
             qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
             qryMovReservaTemp.Post;
           End
           Else
           Begin
             qryMovReservaTemp.Insert;
             qryMovReservaTemp.FieldByName('IDMOVRESERVATMP').AsInteger  := LeUltRegistro(qryAux,'MOVRESERVATEMP');
             qryMovReservaTemp.FieldByName('IDTIPORESERVA').AsInteger    := qryReservaPart.FieldByName('IDTIPORESERVA').AsInteger;
             qryMovReservaTemp.FieldByName('IDPESSJUR').AsInteger        := iIdPessJur;
             qryMovReservaTemp.FieldByName('IDPLANOPREV').AsInteger      := iIdPlanoPrev;
             qryMovReservaTemp.FieldByName('IDTITULAR').AsInteger        := iIdPessoa;
             qryMovReservaTemp.FieldByName('IDPESSOA').AsInteger         := iIdPessoa;
             qryMovReservaTemp.FieldByName('SEQPROPOSTA').AsInteger      := iSeqProposta;
             qryMovReservaTemp.FieldByName('IDBENEFICIO').AsInteger      := piIdBeneficio;
             qryMovReservaTemp.FieldByName('DATAMOV').AsDateTime         := StrToDate(sDataRef);
             qryMovReservaTemp.FieldByName('VLRABATIDO').AsFloat         := qryReservaPart.FieldByName('ValorReserva').AsFloat;
             qryMovReservaTemp.FieldByName('VLRORIGINAL').AsFloat        := qryReservaPart.FieldByName('ValorReserva').AsFloat;
             qryMovReservaTemp.Post;
           End;

         End;

       End;

       qryReservaPart.Next;

     End;

   End;


   Try
     OraNumero(FloatToStr(dTotReservaReal));
   Except
     MsgDlg('O valor calculado para a reserva é inválido. ','Erro',mtError,[mbOk],0);
     Exit;
   End;

   Result := dTotReservaReal;
end;

end.

