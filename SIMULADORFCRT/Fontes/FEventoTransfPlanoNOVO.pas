// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 14/07/2005
// Pendencia   : 23945
// Rotina      : FormShow
// Alteração   : Liberar acesso para o usuário BT026317 aocampo de data base 
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 16/12/2005
// Rotina      : Diversas
// Pendência   : 21047
// Descricao   : Tratar NVL dos campos de opção passados para as regras.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 14/07/2005
// Rotina      : Varias
// Alteração   : Incluir novo campo na PREVIAMIGRAPLANO, IDEVENTOGERADOR
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 04/07/2005
// Pendencia   : 19607
// Rotina      : Varias
// Alteração   : Setar Periodo de Migração pelo eventogerador da SIMULAMIGRACAO 
//------------------------------------------------------------------------------
unit FEventoTransfPlanoNOVO;

// Etapas da Migração de Plano
// Etapa 1 : Procurar participante
// Etapa 2 : Informacoes de Entrada ( do Tipo Banco ou Regra )
// Etapa 3 : Opcoes
// Etapa 4 : Informacoes de Entrada ( do Tipo Informado )
// Etapa 5 : Estimativas
// Etapa 6 : Relatorios
// Etapa 7 : Migracao
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, ComCtrls, Db, DBTables, Wwquery,
  wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker,
  CMDateTimePicker, ppEndUsr, ppBands, ppCtrls, ppClass, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, FPreview, Pptypes,
  ppStrtch, ppSubRpt, URegra, ppRichTx ;

type
  TfrmEventoTransfPlanoNOVO = class(TfrmOkCancelar)
    pgctrlEtapas: TPageControl;
    tbsEtapa1: TTabSheet;
    tbsEtapa2: TTabSheet;
    MontaSelectPart: TMontaSelect;
    ToolbarSep972: TToolbarSep97;
    bbtnAnterior: TBitBtn;
    qryPlanoDestino: TwwQuery;
    qryInputTransfPlano: TwwQuery;
    qryTiposTransf: TwwQuery;
    Label4: TLabel;
    dbgrdInfBanco: TwwDBGrid;
    dsInputTransfPlano: TwwDataSource;
    updInputTransfPlano: TUpdateSQL;
    tbsEtapa3: TTabSheet;
    lblTituloEtapa2: TLabel;
    lblTituloEtapa3: TLabel;
    Label5: TLabel;
    memOpcoes: TMemo;
    qryConfigTransf: TwwQuery;
    tbsEtapa6: TTabSheet;
    lblTituloEtapa6: TLabel;
    bbtnPrintOpcoes: TBitBtn;
    bbtnPrintTermo: TBitBtn;
    bbtnEfetuaMigracao: TBitBtn;
    bbtnConfirmacaoFinal: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    qryAux: TwwQuery;
    qryAux2: TwwQuery;
    qryGrava: TwwQuery;
    qryParticipanteOrigem: TwwQuery;
    dsConfigTransf: TwwDataSource;
    updConfigTransf: TUpdateSQL;
    Label12: TLabel;
    edOpcao: TEdit;
    tbsEtapa5: TTabSheet;
    lblTituloEtapa5: TLabel;
    lblEstimativa: TLabel;
    memEstimativas: TMemo;
    qryDadosAssistido: TwwQuery;
    qryRegra: TwwQuery;
    qryInfBanco: TwwQuery;
    dsInfBanco: TwwDataSource;
    updInfBanco: TUpdateSQL;
    tbsEtapa4: TTabSheet;
    lblTituloEtapa4: TLabel;
    Label14: TLabel;
    dbgrdInputTransfPlano: TwwDBGrid;
    qryPreviaMigra: TwwQuery;
    dsPreviaMigra: TwwDataSource;
    updPreviaMigra: TUpdateSQL;
    GroupBox1: TGroupBox;
    dtDataTRANSACAO: TCMDateTimePicker;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    dtDataREF: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    lblValores: TLabel;
    lblCampoBusca: TLabel;
    edCampoBusca: TEdit;
    edNome: TEdit;
    Label3: TLabel;
    bbtnProcurar: TBitBtn;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    lblPlanoOrigem: TLabel;
    lblInscricaoData: TLabel;
    lblSitPart: TLabel;
    lblBeneficio: TLabel;
    lblFalecido: TLabel;
    lblDataTransacao: TLabel;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    dblkpcmbNovoPlano: TwwDBLookupCombo;
    lblPeriodoMigracao: TLabel;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure edCampoBuscaExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnAnteriorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnEfetuaMigracaoClick(Sender: TObject);
    procedure bbtnConfirmacaoFinalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnPrintOpcoesClick(Sender: TObject);
    procedure dbgrdInputTransfPlanoFieldChanged(Sender: TObject;
      Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure rpDemonstrativoBeforePrint(Sender: TObject);
    procedure dbgrdInputTransfPlanoColExit(Sender: TObject);
    procedure bbtnPrintTermoClick(Sender: TObject);
    procedure bbtnConfirmaMigracaoClick(Sender: TObject);
    procedure dtDataREFEnter(Sender: TObject);
  private
    { Private declarations }

    iTamDescricao : integer;
    iEtapaAtiva,
    iIdEventoPrevOrig,
    iIdEventoPrevDest      : longint;
    sUltimaMatricula       : string;
    bCalculouBase,
    bMontandoDefault,
    bBeneficioTemporario   : boolean;
    sFlgInterno            : string;
    sControleReserva       : string;
    sControleReservaEstim  : string;
    bAlterouData           : boolean;

//    sValorInputAntes       : string;

    procedure MontaInformacoesParticipante (piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint);
    procedure ExecutaEtapa2;
    procedure ExecutaEtapa4;
    procedure ExecutaEtapa3ou5 (pcTipo : char);

    function GravaEVENTOSPREV : boolean;
    function SuspendeContribuicoes     ( sIdPessJurTransf,
                                         sIdPlanoOrigem,
                                         sIdPessoaTransf,
                                         sSeqPropostaTransf     : string;
                                         qryAux,
                                         qryGrava               : TwwQuery) : boolean;

    function GravaReservasParticipante ( sIdPessJurTransf,
                                         sIdPlanoOrigem,
                                         sIdPessoaTransf,
                                         sSeqPropostaTransf     : string;
                                         qryaux,
                                         qryaux2,
                                         qrygrava               : TwwQuery): boolean ;

    function TransfPlano               ( sIdPessJurTransforig,
                                         sidplanoorig,
                                         sIdPessJurTransfdest,
                                         sIdPlanoDestino,
                                         sIdPessoaTransf,
                                         sSeqPropostaTransf,
                                         sIdSitPlanoOrigem,
                                         sidsitplanoTransfdest   : string;
                                         qryaux,
                                         qrygrava,
                                         qryaux2                 : TwwQuery) : boolean;

    function DesReservasParticipante   ( sIdPessJurDestinoTransf,
                                         sIdPlanoDestino,
                                         sIdPessoaTransf,
                                         sSeqPropostaTransf      : string;
                                         qryaux                  : Twwquery) : boolean;

    function RodaRegraSimula (sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
    function RodaRegraValida (sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
    function RodaRegraElegibili (sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
    procedure TrataPreviaMigraPlano  ( cTipo : char;
                                       psValorItem,
                                       psDescricao : string;
                                       psValorItem2 : string = '0' ) ;
    procedure InserePreviaMigraPlano ( psCodCampoMigra, psValorItem, psDescricao : string ) ;
    Function BuscaTipoMigracao(iIdPessJur, iIdPlano, iIdPessoa, iSeqProposta : LongInt;
                               sDataRef : string): String;
  public
    { Public declarations }
    sIdEventoGerador : string;
  end;

var
  frmEventoTransfPlanoNOVO: TfrmEventoTransfPlanoNOVO;

implementation

uses DBaseDados, DAPrev, UDataBase, UMensErro, {UEventos, }fAguarde,
     UFuncoesUteis, {UParticipante, UMovReserva, }DRelTransfPlano, USistema,
  USimuladorBrTPREV, FPrincipal;

{$R *.DFM}

function TfrmEventoTransfPlanoNOVO.RodaRegraSimula(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux        : char;
    RegraSimula : TRegra;
begin
   Result := '0';
   bErro := False;

   try
      RegraSimula := TRegra.Create(Application);
      RegraSimula.DatabaseName := 'BaseDados';
      RegraSimula.IdEmpresa    := -1;
      RegraSimula.QueryIn      := qryRegra;

      iIdCalculoGeral := 0;
      // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
      // erro se o idcalculo for menor que zero
      if piIdCalculo < 0 then piIdCalculo := 0;
      if Trim(sNumRegra) = '' then Exit;
      if StrToInt(sNumRegra) <= 0 then Exit;

      RegraSimula.RuleName := sNumRegra;                        
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if not qryRegra.IsEmpty
      then begin
         cAux                  := DecimalSeparator;
         RegraSimula.QueryIn   := qryRegra;
         RegraSimula.IdCalculo := piIdCalculo;
         RegraSimula.Execute;

         if not RegraSimula.Error
         then begin
            piIdCalculo := RegraSimula.IdCalculo;

            // Verificar se o resultado da regra é um número válido
            try
               StrToFloat(ClienteNumero(RegraSimula.Result))
            except
               MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
                      '[VALOR = '+RegraSimula.Result+']','Erro',mtError,[mbOk, mbHelp],0);
               bErro := True;
               piIdCalculo := -1;
            end;
            Result := OraNumero(RegraSimula.Result);
         end
         else begin
            bErro       := True;
            piIdCalculo := -1;
         end;
      end;
   finally
      qryRegra.Close;
      RegraSimula.Free;
      DecimalSeparator := cAux;
      iIdCalculoGeral := 0;
   end;
end;

function TfrmEventoTransfPlanoNOVO.RodaRegraValida(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux        : char;
    RegraSimula : TRegra;
begin
   Result := '0';
   bErro := False;

   try
      RegraSimula := TRegra.Create(Application);
      RegraSimula.DatabaseName := 'BaseDados';
      RegraSimula.IdEmpresa    := -1;
      RegraSimula.QueryIn      := qryRegra;

      iIdCalculoGeral := 0;
      // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
      // erro se o idcalculo for menor que zero
      if piIdCalculo < 0 then piIdCalculo := 0;
      if Trim(sNumRegra) = '' then Exit;

      RegraSimula.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if not qryRegra.IsEmpty
      then begin
         cAux                  := DecimalSeparator;
         RegraSimula.QueryIn   := qryRegra;
         RegraSimula.IdCalculo := piIdCalculo;
         RegraSimula.Execute;

         if not RegraSimula.Error
         then begin
            piIdCalculo := RegraSimula.IdCalculo;

            // Verificar se o resultado da regra é um valor válido
            if (UpperCase(Trim(RegraSimula.Result)) <> 'FALSE') and
               (UpperCase(Trim(RegraSimula.Result)) <> 'TRUE')
            then begin
               MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
                      '[VALOR = '+RegraSimula.Result+']','Erro',mtError,[mbOk, mbHelp],0);
               bErro := True;
               piIdCalculo := -1;
            end;
            Result := RegraSimula.Result;
         end
         else begin
            bErro       := True;
            piIdCalculo := -1;
         end;
      end;
   finally
      qryRegra.Close;
      RegraSimula.Free;
      DecimalSeparator := cAux;
      iIdCalculoGeral := 0;
   end;
end;

function TfrmEventoTransfPlanoNOVO.RodaRegraElegibili(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var cAux        : char;
    RegraSimula : TRegra;
begin
   Result := '0';
   bErro := False;

   try
      RegraSimula := TRegra.Create(Application);
      RegraSimula.DatabaseName := 'BaseDados';
      RegraSimula.IdEmpresa    := -1;
      RegraSimula.QueryIn      := qryRegra;

      iIdCalculoGeral := 0;
      // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
      // erro se o idcalculo for menor que zero
      if piIdCalculo < 0 then piIdCalculo := 0;
      if Trim(sNumRegra) = '' then Exit;

      RegraSimula.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if not qryRegra.IsEmpty
      then begin
         cAux                  := DecimalSeparator;
         RegraSimula.QueryIn   := qryRegra;
         RegraSimula.IdCalculo := piIdCalculo;
         RegraSimula.Execute;

         if not RegraSimula.Error
         then begin
            piIdCalculo := RegraSimula.IdCalculo;

            Result := 'True';
         end
         else begin
            bErro       := True;
            piIdCalculo := -1;
         end;
      end;
   finally
      qryRegra.Close;
      RegraSimula.Free;
      DecimalSeparator := cAux;
      iIdCalculoGeral := 0;
   end;
end;

procedure TfrmEventoTransfPlanoNOVO.MontaInformacoesParticipante (piIdPessJur, piIdPlanoPrev, piIdPessoa, piSeqProposta : longint);
var sSQL, sTipoSimulador : string;
    bErro : boolean;
begin
  //P.RAMOS-05.07.2005
  if (piIdPessJur = -1) then
    exit;
  //P.RAMOS-05.07.2005-FIM

   { Inicio Augusto 04/07/2005 - Novo tratamento do periodo para migração }
   //P.RAMOS-05.07.2005-DESATIVADO POIS SE IDENTIFICA A SIMULAÇÃO PELO EVENTO GERADOR GRAVADO NA TABELA DE SIMULAMIGRACAO
   //sTipoSimulador := frmPrincipal.sTipoSimulador;

   sTipoSimulador := BuscaTipoMigracao(piIdPessJur, piIdPlanoPrev,
                                       piIdPessoa, piSeqProposta, dtDataREF.Text);


   { Fim Augusto 04/07/2005 }

   iEtapaAtiva := -1;
   iTamDescricao := 60;
   if sTipoSimulador <> '2' // CAMILLE - 23.11.2004
   then begin
      if (piIdPessJur = 50028) or (piIdPessJur = -1)
      then begin
         sIdEventoGerador := '60';
         iTamDescricao    := 45;
      end
      else sIdEventoGerador := '45';
   end
   else sIdEventoGerador := '62';

   // Solicitado pelo Hercules em 03.03.2004 para liberar acesso a data-base
   // para simulacoes que não sejam da celular.
   if sIdEventoGerador <> '60'
   then begin
     dtDataRef.Enabled := True;
     dtDataRef.Color   := clWhite;
   end;

   sControleReserva      := '1';
   sControleReservaEstim := '1';

   with qryAux do
   begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT DATADADOS FROM EVENTOGERADOR WHERE IDEVENTOGERADOR = '+sIdEventoGerador);
       Open;
   end;

   if (bAlterouData) and (dtDataREF.Text <> qryAux.FieldByName('DATADADOS').AsString)
   then begin
      if MsgDlg('A data digitada no campo "Data Base para Dados" não é a data parametrizada'+#13+
                'atualmente['+qryAux.FieldByName('DATADADOS').AsString+'].'+#13+#13+
                'Deseja manter a data digitada ['+dtDataRef.Text+'] ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
      then dtDataREF.Text := qryAux.FieldByName('DATADADOS').AsString;
   end
   else dtDataREF.Text := qryAux.FieldByName('DATADADOS').AsString;
   bAlterouData   := False;


   if qryInputTransfPlano.UpdatesPending then qryInputTransfPlano.CancelUpdates;
   if qryInfBanco.UpdatesPending         then qryInfBanco.CancelUpdates;
   if qryConfigTransf.UpdatesPending     then qryConfigTransf.CancelUpdates;


    memOpcoes.Lines.Clear;
    bbtnConfirmacaoFinal.Visible := False;
    bBeneficioTemporario         := False;
    bCalculouBase                := False;
    bbtnEfetuaMigracao.Enabled   := True;
    // Abrir query com dados do participante no plano de origem
    with qryParticipanteOrigem do
    begin
       Close;
       ParamByName('IdPessJur').AsInteger   := piIdPessJur;
       ParamByName('IdPlanoPrev').AsInteger := piIdPlanoPrev;
       ParamByName('IdPessoa').AsInteger    := piIdPessoa;
       ParamByName('SeqProposta').AsInteger := piSeqProposta;
       ParamByName('IDEVENTOGERADOR').AsInteger  := StrToInt(sIdEventoGerador);
       ParamByName('DATAREF').asstring      := formatdatetime('dd/mm/yyyy', dtDataRef.date);
       Open;

       if not IsEmpty
       then begin

           with qryAux do
           begin
              Close;
              SQL.Clear;
              SQL.Add(' SELECT IDPESSOA, TRGDTINCLUSAO FROM PREVIAMIGRAPLANO WHERE IDPESSOA = '+QRYPARTICIPANTEORIGEM.FIELDBYNAME('IDPESSOA').ASSTRING);
              Open;
           end;

           if (not qryAux.IsEmpty) and
              (MsgDlg('Este participante já migrou para o BrTPREV. Deseja rever sua simulação ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo)
           then begin
              lblTituloEtapa2.Caption  := '';
              lblTituloEtapa3.Caption  := lblTituloEtapa2.Caption;
              lblTituloEtapa4.Caption  := lblTituloEtapa2.Caption;
              lblTituloEtapa5.Caption  := lblTituloEtapa2.Caption;
              edCampoBusca.Text        := '';
              edNome.Text              := '';
              lblPlanoOrigem.Caption      := 'Plano Origem : < não encontrado >';
              lblInscricaoData.Caption    := 'Inscrito desde : < não encontrado >';
              lblFalecido.Caption         := 'Falecido : < não encontrado >';
              lblSitPart.Caption          := 'Situação na Fundação : < não encontrado >';
              lblBeneficio.Caption        := 'Recebendo Benefício : < não encontrado >';
              edCampoBusca.SetFocus;
           end
           else begin
              if not qryAux.IsEmpty
              then begin
                 bbtnEfetuaMigracao.Enabled := False;
                 if sTipoSimulador <> '2' // CAMILLE - 23.11.2004
                 then begin
                    if (piIdPessJur = 50028)
                    then begin
                       if Trunc(qryAux.FieldByName('TRGDTINCLUSAO').AsDateTime) <= StrToDate('31/08/2003')
                       then sIdEventoGerador := '45'
                       else sIdEventoGerador := '60';
                    end
                    else sIdEventoGerador := '45';
                 end
                 else sIdEventoGerador := '62';
              end;
              lblTituloEtapa2.Caption  := 'Matrícula : '+
                trim(FieldByName('MATRICULA').AsString)+' - '+trim(FieldByName('NOMEPARTICIP').AsString);
              lblTituloEtapa3.Caption  := lblTituloEtapa2.Caption;
              lblTituloEtapa4.Caption  := lblTituloEtapa2.Caption;
              lblTituloEtapa5.Caption  := lblTituloEtapa2.Caption;
              lblTituloEtapa6.Caption  := lblTituloEtapa2.Caption;

              edCampoBusca.Text        := FieldByName('MATRICULA').AsString;
              edNome.Text              := trim(FieldByName('NOMEPARTICIP').AsString);
              lblPlanoOrigem.Caption   := 'Patrocinadora/Plano Origem : '+Trim(FieldByName('NOMEPATRO').AsString)+'/'+Trim(FieldByName('NOMEPLANO').AsString);
              lblInscricaoData.Caption := 'Inscrito desde : '+FieldByName('INSCRICAODATA').AsString;

              if FieldByName('SITUACAO').AsString <> 'FL'
              then lblFalecido.Caption := 'Falecido : Não '
              else lblFalecido.Caption := 'Falecido : Sim - Data : '+FieldByName('DATAMORTE').AsString;

              if FieldByName('SITUACAO').AsString = 'AT'
              then lblSitPart.Caption  := 'Situação na Fundação : Ativo '
              else if FieldByName('SITUACAO').AsString = 'AS'
              then lblSitPart.Caption  := 'Situação na Fundação : Assistido '
              else if FieldByName('SITUACAO').AsString = 'MA'
              then lblSitPart.Caption  := 'Situação na Fundação : Mantido '
              else lblSitPart.Caption  := 'Situação na Fundação : Falecido  ';

              if FieldByName('NOMEBENEFICIO').AsString = ''
              then lblBeneficio.Caption := 'Recebendo Benefício : Não '
              else lblBeneficio.Caption := 'Recebendo Benefício : Sim - '+Trim(FieldByName('NOMEBENEFICIO').AsString);

              lblDataTransacao.Caption := 'Data da Simulação : '+DateToStr(date);

              //P.RAMOS-05.07.2005-EXIBE O PERÍODO DE MIGRAÇÃO
              if sIdEventoGerador = '62' then
                lblPeriodoMigracao.caption:='2º Período de Migração'
              else
                lblPeriodoMigracao.caption:='1º Período de Migração';
              //P.RAMOS-05.07.2005-EXIBE O PERÍODO DE MIGRAÇÃO-fim

              if FieldByName('FLGBENEFTEMP').AsInteger = 1
              then bBeneficioTemporario := True
              else bBeneficioTemporario := False;

              qryPlanoDestino.First;
              if qryPlanoDestino.FieldByName('IDPLANOPREV').AsString <> FieldByName('IDPLANOPREV').AsString
              then dblkpcmbNovoPlano.Text :=  qryPlanoDestino.FieldByName('NOME').AsString;

              bbtnAnterior.Enabled  := True;
              bbtnConfirmar.Enabled := True;
              iEtapaAtiva           := 1;

              sSQL := ' SELECT '+sIdEventoGerador+' AS IDEVENTOGERADOR, '+ // CAMILLE - 23.11.2004
                      '        EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, '+
                      '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT, '+
                      '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES, '+
                      '        EL.TEMPOSITESPECIAL '+
                      '       ,S.SALPARTICIPACAO     AS VALORPROVENTO, '+
                      '        S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA, '+
                      '        S.MATRICULA,          S.IDADEAPOS, '+
                      '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO, '+
                      '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL, '+
                      '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO, '+
                      '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO, '+
                      '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA, '+
                      '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL, '+
                      '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB, '+
                      '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT, '+
                      '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT, '+
                      '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS, '+
                      '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA, '+
                      //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
                      '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
                      '        NVL(S.CAMPOOP2,0) AS CAMPOOP2, '+#13#10+
                      '        NVL(S.CAMPOOP3,0) AS CAMPOOP3, '+#13#10+
                      '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
                      '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
                      '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
                      '        NVL(S.CONTRIBUICAOEXTRA,0) AS CONTRIBUICAOEXTRA, '+#13#10+ //P.RAMOS-21.07.2005-CAMPOS NOVOS
                      //P.RAMOS-16.12.2005-PEND.21047-FIM
                      '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
                      OraNumero(sControleReserva)+' AS CONTROLERESERVA, '+
                      '        '''+qryParticipanteOrigem.FieldByName('DATAREF').asstring+''' AS DATAREF '+
                      ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG '+
                      ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
                      ' AND    S.IDPESSJUR        = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString      +
                      ' AND    S.IDPLANOPREV      = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString    +
                      ' AND    S.IDPESSOA         = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString       +
                      ' AND    S.SEQPROPOSTA      = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString    +
                      ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                      ' AND    EL.IDPESSJUR       = S.IDPESSJUR '+
                      ' AND    EL.IDPESSOA        = S.IDPESSOA                                                    ';

              RodaRegraElegibili('17834', sSQL, bErro,  iIdCalculoGeral);


           end;
       end
       else begin // participante nao existe
           lblTituloEtapa2.Caption  := '';
           lblTituloEtapa3.Caption  := lblTituloEtapa2.Caption;
           lblTituloEtapa4.Caption  := lblTituloEtapa2.Caption;
           lblTituloEtapa5.Caption  := lblTituloEtapa2.Caption;
           edCampoBusca.Text        := '';
           edNome.Text              := '';
           lblPlanoOrigem.Caption      := 'Plano Origem : < não encontrado >';
           lblInscricaoData.Caption    := 'Inscrito desde : < não encontrado >';
           lblFalecido.Caption         := 'Falecido : < não encontrado >';
           lblSitPart.Caption          := 'Situação na Fundação : < não encontrado >';
           lblBeneficio.Caption        := 'Recebendo Benefício : < não encontrado >';
           edCampoBusca.SetFocus;
       end;
    end;

    // Abrir querys de configuracao do evento
    with qryInputTransfPlano do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT IDINPUT, DESCRICAO, IDREGRA, FLGTIPO, TABELA, CAMPO, '+
               '        NOMEPARAREGRA,''                              '' AS VALOR, '+
               '        FLGATIVO, FLGMANTIDO, FLGMANTPARC, FLGASSISTIDO, '+
               '        FLGBENEFICIARIO, FLGPODEALTERAR, ORDEM, VALORDEFAULT, '+
               '        IDREGRAVALIDA,TIPODADO,IDREGRAVLRDEFAULT '+
               ' FROM   INPUTTRANSFPLANO '+
               ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador                         +
               ' AND    FLGTIPO         = ''I''                                     ');
       if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'AT'
       then SQL.Add(' AND FLGATIVO = 1 ')
       else if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MA'
       then SQL.Add(' AND FLGMANTIDO = 1 ')
       else if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MP'
       then SQL.Add(' AND FLGMANTPARC = 1 ')
       else if qryParticipanteOrigem.FieldbyName('FLGINTERNO').AsString = 'FL'
       then SQL.Add(' AND FLGBENEFICIARIO = 1 ')
       else SQL.Add(' AND FLGASSISTIDO    = 1 ');
       SQL.Add(' ORDER BY ORDEM, DESCRICAO ');
       Open;
    end;

    // Abrir querys de configuracao do evento
    with qryInfBanco do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT IDINPUT, DESCRICAO, IDREGRA, FLGTIPO, TABELA, CAMPO, '+
               '        NOMEPARAREGRA,''                              '' AS VALOR, '+
               '        FLGATIVO, FLGMANTIDO, FLGMANTPARC, FLGASSISTIDO, '+
               '        FLGBENEFICIARIO, FLGPODEALTERAR, ORDEM, VALORDEFAULT, '+
               '        TIPODADO, IDREGRAVLRDEFAULT '+
               ' FROM   INPUTTRANSFPLANO '+
               ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador                         +
               ' AND    FLGTIPO         <> ''I''                                    ');
       if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'AT'
       then SQL.Add(' AND FLGATIVO = 1 ')
       else if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MA'
       then SQL.Add(' AND FLGMANTIDO = 1 ')
       else if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MP'
       then SQL.Add(' AND FLGMANTPARC = 1 ')
       else if qryParticipanteOrigem.FieldbyName('FLGINTERNO').AsString = 'FL'
       then SQL.Add(' AND FLGBENEFICIARIO = 1 ')
       else SQL.Add(' AND FLGASSISTIDO    = 1 ');
       SQL.Add(' ORDER BY ORDEM, DESCRICAO ');
       Open;
    end;

    if (qryParticipanteOrigem.FieldbyName('FLGINTERNO').AsString = 'AS') or
       (qryParticipanteOrigem.FieldbyName('FLGINTERNO').AsString = 'FL')
    then begin
       with qryDadosAssistido do
       begin
          Close;
          ParamByName('IdPessJur').AsInteger   := piIdPessJur;
          ParamByName('IdPlanoPrev').AsInteger := piIdPlanoPrev;
          ParamByName('IdPessoa').AsInteger    := piIdPessoa;
          ParamByName('SeqProposta').AsInteger := piSeqProposta;
          Open;
       end;
    end;

    with qryConfigTransf do
    begin
       Close;
       ParamByName('IDEVENTOGERADOR').AsInteger  := StrToInt(sIdEventoGerador);
       Open;
    end;

    // Abrir query com dados para demonstravio
    with dtmRelTransfPlano.qryFundacao do
    begin
       Close;
       ParamByName('pFundacao').AsInteger   := iIdFundacao;
       Open;
    end;
                              
    with dtmRelTransfPlano.qryDemonstrativo do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger       := piIdPessJur;
       ParamByName('IDPESSOA').AsInteger        := piIdPessoa;
       ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
       ParamByName('DATADADOS').AsString        := dtDataRef.Text;
       Open;
    end;

    with dtmRelTransfPlano.qrySubOpcoes do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger   := -1;
       ParamByName('IDPESSOA').AsInteger    := -1;
       Open;
    end;

    with dtmRelTransfPlano.qryBaseCalculo do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger   := -1;
       ParamByName('IDPESSOA').AsInteger    := -1;
       Open;
    end;

    with dtmRelTransfPlano.qryInfDigitadas do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger   := -1;
       ParamByName('IDPESSOA').AsInteger    := -1;
       Open;
    end;
    with dtmRelTransfPlano.qryEstimativas do
    begin
       Close;
       ParamByName('IDPESSJUR').AsInteger   := -1;
       ParamByName('IDPESSOA').AsInteger    := -1;
       Open;
    end;

    with dtmRelTransfPlano.qryOBSPag1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT TO_CHAR(ROWNUM)||''.) ''||NOME AS OBSERVACAO '+
               ' FROM   TIPOSTRANSFPLANO '+
               ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador          +
               ' AND    FLGTIPO = ''R'' '+
               ' AND    TIPOOBS = 1                                  ');

       if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'AT'
       then SQL.Add(' AND FLGATIVO = 1 ')
       else if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MA'
       then SQL.Add(' AND FLGMANTIDO = 1 ')
       else if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MP'
       then SQL.Add(' AND FLGMANTPARC = 1 ')
       else if qryParticipanteOrigem.FieldbyName('FLGINTERNO').AsString = 'FL'
       then SQL.Add(' AND FLGBENEFICIARIO = 1 ')
       else SQL.Add(' AND FLGASSISTIDO    = 1 ');
       Open;
    end;

    with dtmRelTransfPlano.qryOBSPag2 do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' SELECT TO_CHAR(ROWNUM)||''.) ''||NOME AS OBSERVACAO '+
               ' FROM   TIPOSTRANSFPLANO '+
               ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador          +
               ' AND    FLGTIPO = ''R'' '+
               ' AND    TIPOOBS = 2                                  ');
       if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'AT'
       then SQL.Add(' AND FLGATIVO = 1 ')
       else if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MA'
       then SQL.Add(' AND FLGMANTIDO = 1 ')
       else if qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MP'
       then SQL.Add(' AND FLGMANTPARC = 1 ')
       else if qryParticipanteOrigem.FieldbyName('FLGINTERNO').AsString = 'FL'
       then SQL.Add(' AND FLGBENEFICIARIO = 1 ')
       else SQL.Add(' AND FLGASSISTIDO    = 1 ');
       Open;
    end;

    qryPreviaMigra.Close;
    qryPreviaMigra.Open;
end;

procedure TfrmEventoTransfPlanoNOVO.ExecutaEtapa2;
var sSQL , sValorItem, sSQLInput  : string;
    bErro : boolean;
    iAnos, iMeses   : word;
begin
   frmAguarde.Mostra('Buscando Informações do Participante...');
   // Preencher qryInfBanco para os campos do Tipo C = Campo do Banco de Dados
   // Guardar valor de input de um campo para passar para a regra de outro campo
   with qryInfBanco do
   begin
      sSQLInput := '';
      First;
      while not Eof do
      begin
         if FieldByName('FLGTIPO').AsString = 'R'
         then begin
            sSQL := ' SELECT '+sIdEventoGerador+' AS IDEVENTOGERADOR, '; // CAMILLE - 23.11.2004

            if POS(SSQLINPUT,'REVERPENSAO') < 0
            then ssql := ssql + '''N'' AS REVERPENSAO, ';

            ssql := ssql + ' EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, '+
                    '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT, '+
                    '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES, '+
                    '        EL.TEMPOSITESPECIAL,  S.SALPARTICIPACAO     AS VALORPROVENTO '+
                    ' '+sSQLInput                                                                          +
                    '        ,S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA, '+
                    '        S.MATRICULA,          S.IDADEAPOS, '+
                    '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO, '+
                    '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL, '+
                    '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO, '+
                    '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO, '+
                    '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA, '+
                    '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL, '+
                    '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB, '+
                    '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS, '+
                    '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT, '+
                    '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT, '+
                    '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA, '+
                    //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
                    '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
                    '        NVL(S.CAMPOOP2,0) AS CAMPOOP2, '+#13#10+
                    '        NVL(S.CAMPOOP3,0) AS CAMPOOP3, '+#13#10+
                    '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
                    '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
                    '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
                    '        NVL(S.CONTRIBUICAOEXTRA,0) AS CONTRIBUICAOEXTRA, '+#13#10+ //P.RAMOS-21.07.2005-CAMPOS NOVOS
                    //P.RAMOS-16.12.2005-PEND.21047-FIM
                    '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
                    OraNumero(sControleReserva)+' AS CONTROLERESERVA, '+
                    '        '''+qryParticipanteOrigem.FieldByName('DATAREF').asstring+''' AS DATAREF '+
                    ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG '+
                    ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
                    ' AND    S.IDPESSJUR   = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString          +
                    ' AND    S.IDPLANOPREV = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString        +
                    ' AND    S.IDPESSOA    = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString           +
                    ' AND    S.SEQPROPOSTA = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString        +
                    ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                    ' AND    EL.IDPESSJUR       = S.IDPESSJUR '+
                    ' AND    EL.IDPESSOA        = S.IDPESSOA                                                    ';

            sValorItem := RodaRegraSimula(FieldByName('IDREGRA').AsString, sSQL, bErro, iIdCalculoGeral);

            if bErro
            then begin
               frmAguarde.Apaga;
               MsgDlg('Erro ao calcular '+FieldByName('Descricao').AsString +'- Regra No. '+FieldByName('IDREGRA').AsString+'.', 'Erro', mtError, [mbOk],0);
               frmAguarde.Mostra('Calculando Opções do Participante...');
               Next;
               continue;
            end;

            if (FieldByName('NOMEPARAREGRA').AsString <> '') and (sValorItem <> '')
            then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(sValorItem))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;

           
            if FieldByName('TIPODADO').AsString = 'I'
            then begin
               iAnos      := Trunc(StrToInt(sValorItem) / 12);
               iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
               sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
            end
            else if FieldByName('TIPODADO').AsString = 'N'
            then begin
               sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
            end;

            Edit;
            FieldByName('VALOR').AsString := sValorItem;
            Post;
         end;

         // Se chegar neste ponto, entao é do tipo C
         if (UpperCase(FieldByName('TABELA').AsString) = 'PESSOAFISICA' ) or
            (UpperCase(FieldByName('TABELA').AsString) = 'ELEGPATRO'    ) or
            (UpperCase(FieldByName('TABELA').AsString) = 'PARTPREVPLAN' ) or
            (UpperCase(FieldByName('TABELA').AsString) = 'SIMULAMIGRACAO' )
         then begin

            sValorItem := qryParticipanteOrigem.FieldByName(FieldByName('CAMPO').AsString).AsString;

            if FieldByName('TIPODADO').AsString = 'I'
            then begin
               iAnos      := Trunc(StrToInt(sValorItem) / 12);
               iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
               sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
            end
            else if FieldByName('TIPODADO').AsString = 'N'
            then begin
               sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
            end;

            Edit;
            FieldByName('VALOR').AsString := sValorItem;
            Post;

            if (FieldByName('NOMEPARAREGRA').AsString <> '') and (qryParticipanteOrigem.FieldByName(FieldByName('CAMPO').AsString).AsString <> '')
            then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(qryParticipanteOrigem.FieldByName(FieldByName('CAMPO').AsString).AsString))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;
         end;

         if ((qryParticipanteOrigem.FieldbyName('FLGINTERNO').AsString = 'AS') or
            (qryParticipanteOrigem.FieldbyName('FLGINTERNO').AsString = 'FL') )  and
            (UpperCase(FieldByName('TABELA').AsString) = 'BENEFBFCIARIO' )
         then begin
            sValorItem := qryDadosAssistido.FieldByName(FieldByName('CAMPO').AsString).AsString;

            if FieldByName('TIPODADO').AsString = 'I'
            then begin
               iAnos      := Trunc(StrToInt(sValorItem) / 12);
               iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
               sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
            end
            else if FieldByName('TIPODADO').AsString = 'N'
            then begin
               sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
            end;

            Edit;
            FieldByName('VALOR').AsString := sValorItem;
            Post;

            if (FieldByName('NOMEPARAREGRA').AsString <> '') and (qryDadosAssistido.FieldByName(FieldByName('CAMPO').AsString).AsString <> '')
            then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(qryDadosAssistido.FieldByName(FieldByName('CAMPO').AsString).AsString))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;
         end;

         Next;
      end;
   end;
   frmAguarde.Apaga;
end;

procedure TfrmEventoTransfPlanoNOVO.ExecutaEtapa4;
var sSQL , sValorItem, sSQLInput  : string;
    bErro : boolean;
    iAnos,iMeses : word;
begin
   frmAguarde.Mostra('Verificando Opções do Participante...');
   // Preencher qryInputTransfPlano para os campos do Tipo I = Informado
   // Guardar valor de input de um campo para passar para a regra de outro campo
   with qryInputTransfPlano do
   begin
      sSQLInput := '';
      First;
      bMontandoDefault := True;
      while not Eof do
      begin
         if FieldByName('FLGTIPO').AsString = 'I'
         then begin
            if FieldByName('VALORDEFAULT').AsString <> ''
            then begin
               Edit;
               if FieldByName('VALORDEFAULT').AsString = 'HOJE'
               then FieldByName('VALOR').AsString := DateToStr(date)
               else FieldByName('VALOR').AsString := FieldByName('VALORDEFAULT').AsString;
               Post;
            end;

            if (FieldByName('NOMEPARAREGRA').AsString <> '') and (FieldByName('VALOR').AsString <> '')
            then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(FieldByName('VALOR').AsString))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;
         end;
         Next;
      end;
   end;
   bMontandoDefault := False;

   // CAMILLE - 25.09.2002
   // Preencher query para executar regra de calculo
   with qryInfBanco do
   begin
      First;
      while not Eof do
      begin
         if (FieldByName('NOMEPARAREGRA').AsString <> '')
         then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString);
         Next;
      end;
   end;

   with qryInputTransfPlano do
   begin
     First;
     while not Eof do
     begin
        if (FieldByName('IDREGRAVLRDEFAULT').AsString = '') or (FieldByName('IDREGRAVLRDEFAULT').AsInteger <= 0)
        then begin
           Next;
           continue;
        end;
        sSQL := ' SELECT '+sIdEventoGerador+' AS IDEVENTOGERADOR, '; // CAMILLE - 23.11.2004

        if POS(SSQLINPUT,'REVERPENSAO') < 0
        then ssql := ssql + '''N'' AS REVERPENSAO, ';

        sSQL := sSQL+ '  EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, '+
                '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT, '+
                '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES, '+
                '        EL.TEMPOSITESPECIAL '+
                ' '+sSQLInput                                                                          +
                '        ,S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA, '+
                '        S.MATRICULA,          S.IDADEAPOS, '+
                '        S.SALPARTICIPACAO     AS VALORPROVENTO, '+
                '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO, '+
                '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL, '+
                '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO, '+
                '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO, '+
                '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA, '+
                '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL, '+
                '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB, '+
                '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS, '+
                '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT, '+
                '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT, '+
                '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA, '+
                //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
                '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
                '        NVL(S.CAMPOOP2,0) AS CAMPOOP2, '+#13#10+
                '        NVL(S.CAMPOOP3,0) AS CAMPOOP3, '+#13#10+
                '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
                '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
                '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
                '        NVL(S.CONTRIBUICAOEXTRA,0) AS CONTRIBUICAOEXTRA, '+#13#10+ //P.RAMOS-21.07.2005-CAMPOS NOVOS
                //P.RAMOS-16.12.2005-PEND.21047-FIM
                '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
                OraNumero(sControleReserva)+' AS CONTROLERESERVA, '+
                '        '''+qryParticipanteOrigem.FieldByName('DATAREF').asstring+''' AS DATAREF '+
                ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG '+
                ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
                ' AND    S.IDPESSJUR   = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString          +
                ' AND    S.IDPLANOPREV = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString        +
                ' AND    S.IDPESSOA    = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString           +
                ' AND    S.SEQPROPOSTA = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString        +
                ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                ' AND    EL.IDPESSJUR       = S.IDPESSJUR '+
                ' AND    EL.IDPESSOA        = S.IDPESSOA                                                    ';

        sValorItem := RodaRegraSimula(FieldByName('IDREGRAVLRDEFAULT').AsString, sSQL, bErro, iIdCalculoGeral);

        if bErro
        then begin
           frmAguarde.Apaga;
           MsgDlg('Erro ao calcular '+FieldByName('Descricao').AsString +'- Regra No. '+FieldByName('IDREGRAVLRDEFAULT').AsString+'.', 'Erro', mtError, [mbOk],0);
           frmAguarde.Mostra('Calculando Opções do Participante...');
           Next;
           continue;
        end;

        if (FieldByName('NOMEPARAREGRA').AsString <> '') and (sValorItem <> '')
        then sSQLInput := sSQLInput + ', '''+OraNumero(Trim(sValorItem))+''' AS '+FieldByName('NOMEPARAREGRA').AsString;

        if FieldByName('TIPODADO').AsString = 'I'
        then begin
           iAnos      := Trunc(StrToInt(sValorItem) / 12);
           iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
           sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
        end
        else if FieldByName('TIPODADO').AsString = 'N'
        then begin
           // No caso da etapa 4 o valor nao pode ser formatado
           sValorItem := FormatFloat('#0.00',StrToFloat(ClienteNumero(sValorItem)));           
//           sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
        end;

        Edit;
        FieldByName('VALOR').AsString := sValorItem;
        Post;

        Next;
     end;
   end;
   frmAguarde.Apaga;
end;

procedure TfrmEventoTransfPlanoNOVO.ExecutaEtapa3ou5 (pcTipo : char);
var iOpcao          : word;
    bErro           : boolean;
    sSQL,
    sSQLInput,
    sValorItem      : string;
    bPossuiCalculo  : boolean;
    iAnos, iMeses   : word;
    sValorItem2     : string;
begin
   // Montar SQL com todos os dados da etapa 2 (input)
   frmAguarde.Mostra('Preparando Informações ...');
   sSQLInput := '';
   if (pcTipo <> 'E') and dtmRelTransfPlano.qryDemonstrativo.UpdatesPending then dtmRelTransfPlano.qryDemonstrativo.CancelUpdates;
   if (pcTipo <> 'E') and dtmRelTransfPlano.qrySubOpcoes.UpdatesPending     then dtmRelTransfPlano.qrySubOpcoes.CancelUpdates;
   if (pcTipo = 'B')  and dtmRelTransfPlano.qryBaseCalculo.UpdatesPending   then dtmRelTransfPlano.qryBaseCalculo.CancelUpdates;
   if (pcTipo = 'E')  and dtmRelTransfPlano.qryEstimativas.UpdatesPending   then dtmRelTransfPlano.qryEstimativas.CancelUpdates;


   with qryInfBanco do
   begin
      First;
      while not Eof do
      begin
         if (FieldByName('NOMEPARAREGRA').AsString <> '')
         then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString);

         // Preencher dtmRelTransfPlano.qryDemonstrativo
         if pcTipo <> 'E'
         then begin
            dtmRelTransfPlano.qryDemonstrativo.Append;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('IDPESSJUR').AsString        := qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('MATRICULA').AsString        := qryParticipanteOrigem.FieldByName('MATRICULA').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('NOMEPARTICIPANTE').AsString := qryParticipanteOrigem.FieldByName('NOMEPARTICIP').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('NOMEPLANOATUAL').AsString   := qryParticipanteOrigem.FieldByName('NOMEPLANO').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('NOMEINPUT').AsString        := FieldByName('DESCRICAO').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('VALORINPUT').AsString       := FieldByName('VALOR').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('DATADADOS').AsString        := qryParticipanteOrigem.FieldByName('DATAREF').AsString;
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('DATATRANSACAO').AsString    := DateToStr(date);
            dtmRelTransfPlano.qryDemonstrativo.FieldByName('SECAO').AsInteger           := 1;
            dtmRelTransfPlano.qryDemonstrativo.Post;
         end;

         Next;
      end;
   end;

   with qryInputTransfPlano do
   begin
      First;
      while not Eof do
      begin
         if (FieldByName('NOMEPARAREGRA').AsString <> '')
         then begin
            if pcTipo = 'E'
            then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString)
            else sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALORDEFAULT').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString)
         end;
         Next;
      end;
   end;

   with qryTiposTransf do
   begin
      Close;
      ParamByName('IDEVENTOGERADOR').AsInteger  := StrToInt(sIdEventoGerador);
      ParamByName('FLGTIPO').AsString           := pcTipo;
      Open;

      if IsEmpty
      then begin
         if pcTipo = 'O'
         then begin
            tbsEtapa1.TabVisible         := False;
            tbsEtapa2.TabVisible         := False;
            tbsEtapa3.TabVisible         := False;
            tbsEtapa4.TabVisible         := True;
            tbsEtapa5.TabVisible         := False;
            tbsEtapa6.TabVisible         := False;
            pgctrlEtapas.ActivePage      := tbsEtapa4;
            frmAguarde.Apaga;
            ExecutaEtapa4;
            Exit;
         end
         else begin
            frmAguarde.Apaga;
            tbsEtapa1.TabVisible         := False;
            tbsEtapa2.TabVisible         := False;
            tbsEtapa3.TabVisible         := False;
            tbsEtapa4.TabVisible         := False;
            tbsEtapa5.TabVisible         := False;
            tbsEtapa6.TabVisible         := True;
            pgctrlEtapas.ActivePage      := tbsEtapa6;
            Exit;
         end;
      end
   end;

   // Verificar se existem estimativas a fazer
   bPossuiCalculo  := False;
   with qryTiposTransf do
   begin
      First;
      iOpcao := 0;
      while not Eof do
      begin
         // Verificar se opcao é permitida para situação correspondente
         if ((FieldByName('FLGATIVO').AsInteger = 0) ) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'AT')
         then begin
              Next;
              Continue;
         end;

         if (FieldByName('FLGMANTIDO').AsInteger = 0) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MA')
         then begin
              Next;
              Continue;
         end;

         if (FieldByName('FLGMANTPARC').AsInteger = 0) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MP')
         then begin
              Next;
              Continue;
         end;

         if (FieldByName('FLGASSISTIDO').AsInteger = 0) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'AS')
         then begin
              Next;
              Continue;
         end;

         if (FieldByName('FLGBENEFICIARIO').AsInteger = 0) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'FL')
         then begin
              Next;
              Continue;
         end;
         bPossuiCalculo  := True;
         Next;
      end;
   end;

   if (not bPossuiCalculo) and (pcTipo <> 'B')
   then begin
      if pcTipo = 'O'
      then begin
         tbsEtapa1.TabVisible         := False;
         tbsEtapa2.TabVisible         := False;
         tbsEtapa3.TabVisible         := False;
         tbsEtapa4.TabVisible         := True;
         tbsEtapa5.TabVisible         := False;
         tbsEtapa6.TabVisible         := False;

         pgctrlEtapas.ActivePage := tbsEtapa4;
         ExecutaEtapa4;
         frmAguarde.Apaga;
         Exit;
      end
      else begin
         frmAguarde.Apaga;
         tbsEtapa1.TabVisible         := False;
         tbsEtapa2.TabVisible         := False;
         tbsEtapa3.TabVisible         := False;
         tbsEtapa4.TabVisible         := false;
         tbsEtapa5.TabVisible         := False;
         tbsEtapa6.TabVisible         := True;
         pgctrlEtapas.ActivePage := tbsEtapa6;
         Exit;
      end;
   end;

   if pcTipo <> 'E'
   then begin
      if pcTipo = 'B'
      then memOpcoes.Lines.Clear
      else if not bCalculouBase
           then memOpcoes.Lines.Clear;
      frmAguarde.Mostra('Calculando Opções do Participante...');
   end
   else begin
      memEstimativas.Lines.Clear;
      frmAguarde.Mostra('Calculando Estimativas para Opção '+Trim(edOpcao.Text)+'...');
      lblEstimativa.Caption := 'Estimativas para a Opção '+Trim(edOpcao.Text)+'...';
   end;

   // Calcular as opcoes do evento de transferencia
   with qryTiposTransf do
   begin
      First;
      iOpcao := 0;
      while not Eof do
      begin
         sControleReserva      := '1';
         // Verificar se opcao é permitida para situação correspondente
         if ((FieldByName('FLGATIVO').AsInteger = 0) ) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'AT')
         then begin
              Next;
              Continue;
         end;
         if (FieldByName('FLGMANTIDO').AsInteger = 0) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MA')
         then begin
              Next;
              Continue;
         end;
         if (FieldByName('FLGMANTPARC').AsInteger = 0) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'MP')
         then begin
              Next;
              Continue;
         end;
         if (FieldByName('FLGASSISTIDO').AsInteger = 0) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'AS')
         then begin
              Next;
              Continue;
         end;
         if (FieldByName('FLGBENEFICIARIO').AsInteger = 0) and (qryParticipanteOrigem.FieldByName('FLGINTERNO').AsString = 'FL')
         then begin
              Next;
              Continue;
         end;
         inc(iOpcao);
         if pcTipo <> 'E'
         then begin
            if pcTipo = 'O'
            then begin
               memOpcoes.Lines.Add(' ');
               memOpcoes.Lines.Add('Opção '+IntToStr(iOpcao)+' .) Optando por '+FieldByName('NOME').AsString);
               memOpcoes.Lines.Add(' '+ PreparaStr(' ',iTamDescricao)+' '+
                                            CompletaString(FieldByName('TITULOVLR1').AsString,' ', 15, False)+
                                            CompletaString(FieldByName('TITULOVLR2').AsString,' ',15, False));

               memOpcoes.Lines.Add(' ');
            end;
         end
         else begin
            memOpcoes.Lines.Add(' ');
            memEstimativas.Lines.Add(IntToStr(iOpcao)+' .) '+FieldByName('NOME').AsString);
            memOpcoes.Lines.Add(' ');
         end;

         if pcTipo = 'B'
         then begin
            edOpcao.Text := IntToStr(iOpcao);
            // Calcular Item da Configuracao da Opção
            sSQL := ' SELECT '+sIdEventoGerador+' AS IDEVENTOGERADOR, '; // CAMILLE - 23.11.2004

            if POS(SSQLINPUT,'REVERPENSAO') < 0
            then ssql := ssql + '''N'' AS REVERPENSAO, ';

            sSQL := sSQL + ' EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, '+
                    '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT, '+
                    '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES, '+
                    '        EL.TEMPOSITESPECIAL '+
                    ' '+sSQLInput                                                                              +
                    '        ,S.IDPESSJUR,         S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA, '+
                    '        S.MATRICULA,          S.IDADEAPOS, '+
                    '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO, '+
                    '        S.SALPARTICIPACAO   AS VALORPROVENTO, '+
                    '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL, '+
                    '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO, '+
                    '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO, '+
                    '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA, '+
                    '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL, '+
                    '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB, '+
                    '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT, '+
                    '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT, '+
                    '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS, '+
                    '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA, '+
                    //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
                    '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
                    '        NVL(S.CAMPOOP2,0) AS CAMPOOP2, '+#13#10+
                    '        NVL(S.CAMPOOP3,0) AS CAMPOOP3, '+#13#10+
                    '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
                    '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
                    '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
                    '        NVL(S.CONTRIBUICAOEXTRA,0) AS CONTRIBUICAOEXTRA, '+#13#10+ //P.RAMOS-21.07.2005-CAMPOS NOVOS
                    //P.RAMOS-16.12.2005-PEND.21047-FIM
                    '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
                    OraNumero(sControleReserva)+' AS CONTROLERESERVA, '+
                    '        '''+qryParticipanteOrigem.FieldByName('DATAREF').asstring+''' AS DATAREF, '+
                    '-1 AS IDTIPOTRANSF, '+
                    OraNumero(Trim(edOpcao.Text))+' AS OPCAO '+
                    ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG '+
                    ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
                    ' AND    S.IDPESSJUR   = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString           +
                    ' AND    S.IDPLANOPREV = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString         +
                    ' AND    S.IDPESSOA    = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString            +
                    ' AND    S.SEQPROPOSTA = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString         +
                    ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                    ' AND    EL.IDPESSJUR       = S.IDPESSJUR '+
                    ' AND    EL.IDPESSOA        = S.IDPESSOA                                                    ';

            sValorItem := RodaRegraSimula(qryTiposTransf.FieldByName('IDREGRABASE').AsString, sSQL, bErro, iIdCalculoGeral);
            bCalculouBase := True;
            if bErro
            then begin
               frmAguarde.Apaga;
               MsgDlg('Erro ao calcular '+qryTiposTransf.FieldByName('NOME').AsString +'- Regra No. '+qryTiposTransf.FieldByName('IDREGRABASE').AsString+'.', 'Erro', mtError, [mbOk],0);
               frmAguarde.Mostra('Calculando Opções do Participante...');
               qryTiposTransf.Next;
               continue;
            end;

            if qryTiposTransf.FieldByName('TIPODADO').AsString = 'I'
            then begin // idade em anos e meses
               iAnos      := Trunc(StrToInt(sValorItem) / 12);
               iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
               sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
            end
            else if FieldByName('TIPODADO').AsString = 'N'
            then begin
               sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
            end;

            memOpcoes.Lines.Add(' '+ PreparaStr(FieldByName('NOME').AsString ,50)+' '+
                                         CompletaString(sValorItem,' ', 20, False));


            dtmRelTransfPlano.qryBaseCalculo.Append;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('SECAO').AsInteger     := iOpcao;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('NUMOPCAO').AsInteger  := iOpcao;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('DESCOPCAO').AsString  := FieldByName('NOME').AsString;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('NOMEINPUT').AsString  := FieldByName('NOME').AsString;
            dtmRelTransfPlano.qryBaseCalculo.FieldByName('VALORINPUT').AsString := sValorItem;
            dtmRelTransfPlano.qryBaseCalculo.Post;

            TrataPreviaMigraPlano('B',sValorItem,FieldByName('NOME').AsString );
         end
         else begin
            qryConfigTransf.First;
            while not qryConfigTransf.Eof do
            begin
               if (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger <> FieldByName('IDTIPOTRANSF').AsInteger)
               then begin
                  qryConfigTransf.Next;
                  continue;
               end;

               if pcTipo <> 'E'
               then edOpcao.Text := IntToStr(iOpcao);

               if (qryConfigTransf.FieldByName('IDREGRA').AsInteger <= 0)
               then sValorItem := '0'
               else begin
                  sControleReserva      := '1';
                  if pcTipo = 'E' then sControleReserva := sControleReservaEstim;

                  // Calcular Item da Configuracao da Opção
                  sSQL := ' SELECT '+sIdEventoGerador+' AS IDEVENTOGERADOR, '+#13#10; // CAMILLE - 23.11.2004

                  if POS(SSQLINPUT,'REVERPENSAO') < 0
                  then ssql := ssql + '''N'' AS REVERPENSAO, '+#13#10;

                  sSQL := sSQL + ' EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, '+#13#10+
                          '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT, '+#13#10+
                          '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES, '+#13#10+
                          '        EL.TEMPOSITESPECIAL '+#13#10+
                          ' '+sSQLInput                                                                              +#13#10+
                          '        ,S.IDPESSJUR,         S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA, '+#13#10+
                          '        S.MATRICULA,          S.IDADEAPOS, '+#13#10+
                          '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO, '+#13#10+
                          '        S.SALPARTICIPACAO   AS VALORPROVENTO, '+#13#10+
                          '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL, '+#13#10+
                          '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO, '+#13#10+
                          '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO, '+#13#10+
                          '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA, '+#13#10+
                          '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL, '+#13#10+
                          '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB, '+#13#10+
                          '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT, '+#13#10+
                          '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT, '+#13#10+
                          '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS, '+#13#10+
                          '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA, '+#13#10+
                          //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
                          '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
                          '        NVL(S.CAMPOOP2,0) AS CAMPOOP2, '+#13#10+
                          '        NVL(S.CAMPOOP3,0) AS CAMPOOP3, '+#13#10+
                          '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
                          '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
                          '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
                          //P.RAMOS-16.12.2005-PEND.21047-FIM
                          '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+#13#10+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
                          '        0 AS CONTRIBUICAOEXTRA, '+#13#10+ //P.RAMOS-21.07.2005-CAMPOS NOVOS
                          OraNumero(sControleReserva)+' AS CONTROLERESERVA, '+#13#10+
                          '        '''+qryParticipanteOrigem.FieldByName('DATAREF').asstring+''' AS DATAREF, '+#13#10+
                          qryConfigTransf.FieldByName('IDTIPOTRANSF').AsString+' AS IDTIPOTRANSF, '+#13#10+
                          OraNumero(Trim(edOpcao.Text))+' AS OPCAO '+#13#10+
                          ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG '+#13#10+
                          ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +#13#10+
                          ' AND    S.IDPESSJUR   = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString           +#13#10+
                          ' AND    S.IDPLANOPREV = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString         +#13#10+
                          ' AND    S.IDPESSOA    = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString            +#13#10+
                          ' AND    S.SEQPROPOSTA = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString         +#13#10+
                          ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+#13#10+
                          ' AND    EL.IDPESSJUR       = S.IDPESSJUR '+#13#10+
                          ' AND    EL.IDPESSOA        = S.IDPESSOA '+#13#10;

                  sValorItem := RodaRegraSimula(qryConfigTransf.FieldByName('IDREGRA').AsString, sSQL, bErro, iIdCalculoGeral);
               end;

               if bErro
               then begin
                  frmAguarde.Apaga;
                  MsgDlg('Erro ao calcular '+qryConfigTransf.FieldByName('NOME').AsString +'- Regra No. '+qryConfigTransf.FieldByName('IDREGRA').AsString+'.', 'Erro', mtError, [mbOk],0);
                  frmAguarde.Mostra('Calculando Opções do Participante...');
                  qryConfigTransf.Next;
                  continue;
               end;

               if qryConfigTransf.FieldByName('TIPODADO').AsString = 'I'
               then begin // idade em anos e meses
                  iAnos      := Trunc(StrToInt(sValorItem) / 12);
                  iMeses     := StrToInt(sValorItem) - ( iAnos * 12);
                  sValorItem := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
               end
               else if FieldByName('TIPODADO').AsString = 'N'
               then begin
                  sValorItem := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem)));
               end;

               // CUSTOMIZACAO PARA ATENDER SIMULADOR DA CELULAR - 05.02.2004
               // CALCULAR VALOR2 UTILIZANDO IDREGRA2 NA CONFIGTRANSFPLANO, SE HOUVER REGRA
               sValorItem2 := '';
               if (pcTipo = 'O') or (sIdEventoGerador = '45') or (sIdEventoGerador = '62') then
               //P.RAMOS-28.06.2005-CONTROLAR CAMPO2-CONTROLE INADEQUADO MAS NECESSÁRIO
               begin
                  if (qryConfigTransf.FieldByName('IDREGRA2').AsInteger <= 0)
                  then sValorItem2 := '0'
                  else begin
                     // Calcular Item da Configuracao da Opção
                     sControleReserva      := '2';
                     if (pcTipo = 'O') then //P.RAMOS-28.06.2005-CONTROLAR CAMPO2
                       if pcTipo = 'E' then sControleReserva := sControleReservaEstim;

                     sSQL := ' SELECT '+sIdEventoGerador+' AS IDEVENTOGERADOR, '+#13#10; // CAMILLE - 23.11.2004
                     if POS(SSQLINPUT,'REVERPENSAO') < 0 then
                       ssql := ssql + '''N'' AS REVERPENSAO, '+#13#10;
                     sSQL := sSQL + ' EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, '+#13#10+
                             '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT, '+#13#10+
                             '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES, '+#13#10+
                             '        EL.TEMPOSITESPECIAL '+#13#10+
                             ' '+sSQLInput                                                                              +#13#10+
                             '        ,S.IDPESSJUR,         S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA, '+#13#10+
                             '        S.MATRICULA,          S.IDADEAPOS, '+#13#10+
                             '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO, '+#13#10+
                             '        S.SALPARTICIPACAO   AS VALORPROVENTO, '+#13#10+
                             '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL, '+#13#10+
                             '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO, '+#13#10+
                             '        S.SALPARTICIPACAO,    S.REMUNERACAO, '+#13#10+
                             '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA, '+#13#10+
                             '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL, '+#13#10+
                             '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB, '+#13#10+
                             '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT, '+#13#10+
                             '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT, '+#13#10+
                             '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS, '+#13#10+
                             '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA, '+#13#10;

                     //P.RAMOS-30.06.2005-CAMPOS NOVOS
                     if (sIdEventoGerador = '45') or (sIdEventoGerador = '62') then
                       sSQL := sSQL +
                             '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+#13#10+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
                             //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
                             '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
                             '        NVL(S.CAMPOOP5,0) AS CAMPOOP2, '+#13#10+
                             '        NVL(S.CAMPOOP6,0) AS CAMPOOP3, '+#13#10+
                             '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
                             '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
                             '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
                             '        NVL(S.CONTRIBUICAO,0) AS CONTRIBUICAO, '+#13#10+
                             '        NVL(S.CONTRIBUICAOEXTRA,0) AS CONTRIBUICAOEXTRA, '+#13#10 //P.RAMOS-21.07.2005-CAMPOS NOVOS
                             //P.RAMOS-16.12.2005-PEND.21047-FIM
                     else
                       sSQL := sSQL +
                             '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+#13#10+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
                             //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
                             '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
                             '        NVL(S.CAMPOOP2,0) AS CAMPOOP2, '+#13#10+
                             '        NVL(S.CAMPOOP3,0) AS CAMPOOP3, '+#13#10+
                             '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
                             '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
                             '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
                             '        NVL(S.CONTRIBUICAO,0) AS CONTRIBUICAO, '+#13#10+
                             '        0 AS CONTRIBUICAOEXTRA, '+#13#10;
                             //P.RAMOS-16.12.2005-PEND.21047-FIM
                     sSQL:=sSQL+
                     //P.RAMOS-30.06.2005-CAMPOS NOVOS-fim
                             OraNumero(sControleReserva)+' AS CONTROLERESERVA, '+#13#10+
                             '        '''+qryParticipanteOrigem.FieldByName('DATAREF').asstring+''' AS DATAREF, '+
                             qryConfigTransf.FieldByName('IDTIPOTRANSF').AsString+' AS IDTIPOTRANSF, '+#13#10+
                             OraNumero(Trim(edOpcao.Text))+' AS OPCAO '+#13#10+
                             ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG '+#13#10+
                             ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +#13#10+
                             ' AND    S.IDPESSJUR   = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString           +#13#10+
                             ' AND    S.IDPLANOPREV = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString         +#13#10+
                             ' AND    S.IDPESSOA    = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString            +#13#10+
                             ' AND    S.SEQPROPOSTA = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString         +#13#10+
                             ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+#13#10+
                             ' AND    EL.IDPESSJUR       = S.IDPESSJUR '+#13#10+
                             ' AND    EL.IDPESSOA        = S.IDPESSOA '+#13#10;

                     sValorItem2 := RodaRegraSimula(qryConfigTransf.FieldByName('IDREGRA2').AsString, sSQL, bErro, iIdCalculoGeral);
                     sControleReserva      := '1';
                  end;

                  if bErro
                  then begin
                     frmAguarde.Apaga;
                     MsgDlg('Erro ao calcular '+qryConfigTransf.FieldByName('NOME').AsString +'- Regra No. '+qryConfigTransf.FieldByName('IDREGRA').AsString+'.', 'Erro', mtError, [mbOk],0);
                     frmAguarde.Mostra('Calculando Opções do Participante...');
                     qryConfigTransf.Next;
                     continue;
                  end;

                  if qryConfigTransf.FieldByName('TIPODADO').AsString = 'I'
                  then begin // idade em anos e meses
                     iAnos      := Trunc(StrToInt(sValorItem2) / 12);
                     iMeses     := StrToInt(sValorItem2) - ( iAnos * 12);
                     sValorItem2 := IntToStr(iAnos)+' anos e '+IntToStr(iMeses)+' meses';
                  end
                  else if FieldByName('TIPODADO').AsString = 'N'
                  then begin
                     sValorItem2 := FormatFloat('#,##0.00',StrToFloat(ClienteNumero(sValorItem2)));

                     if (pcTipo = 'O') then //P.RAMOS-28.06.2005-CONTROLAR CAMPO2
                       // ESPECIFICO FCRT +OU-
                       // NA HORA DE CALCULAR AS ESTIMATIVAS, SE O VALOR DO ITEM 1 FOR MAIOR
                       // QUE O VALOR DO ITEM 2, PASSAR 1 NO CONTROLE, SENAO, PASSAR 2
                       if (sControleReservaEstim = '1')
                       then begin
                          if (StrToFloat(ClienteNumero(sValorItem2)) > 0) and
                             (StrToFloat(ClienteNumero(sValorItem2)) > StrToFloat(ClienteNumero(sValorItem)))
                          then sControleReservaEstim := '2'
                          else sControleReservaEstim := '1';
                       end;
                  end;
               end;

               qryConfigTransf.Edit;
               qryConfigTransf.FieldByName('VALOR').AsString := sValorItem;
               qryConfigTransf.FieldByName('VALOR2').AsString := sValorItem2;
               qryConfigTransf.Post;

               TrataPreviaMigraPlano('C',sValorItem,qryConfigTransf.FieldByName('NOME').AsString );

               if pcTipo = 'O'
               then begin

                 if (qryConfigTransf.FieldByName('IDREGRA2').AsInteger <= 0)
                 then memOpcoes.Lines.Add(' '+ PreparaStr(qryConfigTransf.FieldByName('NOME').AsString ,iTamDescricao)+' '+
                                                   CompletaString(sValorItem,' ', 15, False)+
                                                   CompletaString(' '       ,' ',15, False))
                 else memOpcoes.Lines.Add(' '+ PreparaStr(qryConfigTransf.FieldByName('NOME').AsString ,iTamDescricao)+' '+
                                                   CompletaString(sValorItem,' ', 15, False)+
                                                   CompletaString(sValorItem2,' ',15, False));
                 dtmRelTransfPlano.qrySubOpcoes.Append;
                 dtmRelTransfPlano.qrySubOpcoes.FieldByName('SECAO').AsInteger      := iOpcao;
                 dtmRelTransfPlano.qrySubOpcoes.FieldByName('NUMOPCAO').AsInteger   := iOpcao;
                 dtmRelTransfPlano.qrySubOpcoes.FieldByName('DESCOPCAO').AsString   := FieldByName('NOME').AsString;
                 dtmRelTransfPlano.qrySubOpcoes.FieldByName('NOMEINPUT').AsString   := qryConfigTransf.FieldByName('NOME').AsString;
                 dtmRelTransfPlano.qrySubOpcoes.FieldByName('VALORINPUT').AsString  := sValorItem;
                 if (qryConfigTransf.FieldByName('IDREGRA2').AsInteger <= 0)
                 then dtmRelTransfPlano.qrySubOpcoes.FieldByName('VALORINPUT2').AsString := ''
                 else dtmRelTransfPlano.qrySubOpcoes.FieldByName('VALORINPUT2').AsString := sValorItem2;
                 dtmRelTransfPlano.qrySubOpcoes.FieldByName('TITULOVLR1').AsString  := qryTiposTransf.FieldByName('TITULOVLR1').AsString;
                 dtmRelTransfPlano.qrySubOpcoes.FieldByName('TITULOVLR2').AsString  := qryTiposTransf.FieldByName('TITULOVLR2').AsString;
                 dtmRelTransfPlano.qrySubOpcoes.Post;
               end
               else
               begin
//P.RAMOS-28.06.2005-CONTROLAR CAMPO2
//                 memEstimativas.Lines.Add(' '+
//                   PreparaStr(qryConfigTransf.FieldByName('NOME').AsString ,50)+' '+
//                   CompletaString(sValorItem,' ', 20, False));
                 if (qryConfigTransf.FieldByName('IDREGRA2').AsInteger <= 0) then
                   memEstimativas.Lines.Add(' '+
                     PreparaStr(qryConfigTransf.FieldByName('NOME').AsString ,50)+' '+
                     CompletaString(sValorItem,' ', 20, False)+
                     CompletaString(' '       ,' ', 20, False))
                 else
                   memEstimativas.Lines.Add(' '+
                     PreparaStr(qryConfigTransf.FieldByName('NOME').AsString ,50)+' '+
                     CompletaString(sValorItem,' ', 20, False)+
                     CompletaString(sValorItem2,' ', 20, False));
//P.RAMOS-28.06.2005-CONTROLAR CAMPO2-FIM
                 dtmRelTransfPlano.qryEstimativas.Append;
                 dtmRelTransfPlano.qryEstimativas.FieldByName('SECAO').AsInteger     := iOpcao;
                 dtmRelTransfPlano.qryEstimativas.FieldByName('NUMOPCAO').AsInteger  := iOpcao;
                 dtmRelTransfPlano.qryEstimativas.FieldByName('DESCOPCAO').AsString  := FieldByName('NOME').AsString;
                 dtmRelTransfPlano.qryEstimativas.FieldByName('NOMEINPUT').AsString  := qryConfigTransf.FieldByName('NOME').AsString;
                 dtmRelTransfPlano.qryEstimativas.FieldByName('VALORINPUT').AsString := sValorItem;
                 dtmRelTransfPlano.qryEstimativas.FieldByName('VALORINPUT2').AsString := sValorItem2; //P.RAMOS-28.06.2005-CONTROLAR CAMPO2
                 //P.RAMOS-04.07.2005-TITULO DAS COLUNAS
                 dtmRelTransfPlano.qryEstimativas.FieldByName('TITULOVLR1').AsString  := qryTiposTransf.FieldByName('TITULOVLR1').AsString;
                 dtmRelTransfPlano.qryEstimativas.FieldByName('TITULOVLR2').AsString  := qryTiposTransf.FieldByName('TITULOVLR2').AsString;
                 //P.RAMOS-04.07.2005-TITULO DAS COLUNAS-FIM
                 dtmRelTransfPlano.qryEstimativas.Post;
               end;

               qryConfigTransf.Next;
            end;
            if pcTipo <> 'E'
            then memOpcoes.Lines.Add ('  ')
            else memEstimativas.Lines.Add('  ');
         end;
         Next;
      end;
   end;
   frmAguarde.Apaga;

   if pcTipo = 'O'
   then begin
      edOpcao.SetFocus;
      edOpcao.Text := '';
   end;
end;


function TfrmEventoTransfPlanoNOVO.GravaEVENTOSPREV : boolean;
var sIdEventoGeradorDestino : string;
begin

   // Gravar evento da categoria Transferencia de Plano no plano de origem
{   iIdEventoPrevOrig := LeUltRegistro(qryAux,'EVENTOSPREV');

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
                  ' TO_DATE(''' + Trim(dtInscricao.Text) + ''',''DD/MM/YYYY'')     ,' +
                  qryParticipanteOrigem.FieldByName('IDPESSOA').AsString        + ',' +
                  qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString       + ',' +
                  qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString     + ',' +
                  qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString     + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITFUNC').AsString       + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITPART').AsString       + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITPLANOPREV').AsString  + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITFUNC').AsString       + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITPART').AsString       + ',' +
                  qrySitPlanoOrigem.FieldByName('IDSITPLANOPREV').AsString      + ',' +
                  sIdEventoGerador       + ',''1'',''1'',''1'',' +
                  ' TO_DATE('''+datetostr(date)+''',''dd/mm/yyyy''),''1'''+','+
                  qryParticipanteOrigem.FieldByName('INSCRICAONUMERO').AsString       +')');
   try
      qryAux.ExecSQL;
   except
      Result := false;
      exit;
   end;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT MAX(IDEVENTOGERADOR) AS IDEVENTOGERADOR '+
                  ' FROM   EVENTOGERADOR '+
                  ' WHERE  FLGINTERNO     = ''IP''                  ');
   qryAux.Open;
   if qryAux.IsEmpty or (qryAux.FieldByName('IDEVENTOGERADOR').AsString = '')
   then begin
      Close;
      MsgDlg('Nenhum evento da categoria "Inscrição no Plano" encontrada. ','Erro', mtError, [mbOk],0);
      Exit;
   end;

   sIdEventoGeradorDestino := qryAux.FieldByName('IDEVENTOGERADOR').AsString;

   // Gravar evento da categoria Inscricao no Plano no plano de destino
   iIdEventoPrevDest := LeUltRegistro(qryAux,'EVENTOSPREV');

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                  '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                  '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                  '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                  '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                  '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO) ' +
                  ' VALUES(' + IntToStr(iIdEventoPrevDest)                   + ',' +
                  ' TO_DATE(''' + DateToStr(Date)     + ''',''DD/MM/YYYY'') ,' +
                  ' TO_DATE(''' + Trim(dtInscricao.Text) + ''',''DD/MM/YYYY'') ,' +
                  qryParticipanteOrigem.FieldByName('IDPESSOA').AsString        + ',' +
                  qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString       + ',' +
                  qryPlanoDestino.FieldByName('IDPLANOPREV').AsString           + ',' +
                  qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString     + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITFUNC').AsString       + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITPART').AsString       + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITPLANOPREV').AsString  + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITFUNC').AsString       + ',' +
                  qryParticipanteOrigem.FieldByName('IDSITPART').AsString       + ',' +
                  qrySitPlanoDestino.FieldByName('IDSITPLANOPREV').AsString     + ',' +
                  sIdEventoGeradorDestino + ',''1'',''1'',''1'',' +
                  ' TO_DATE('''+datetostr(date)+''',''dd/mm/yyyy''),''1'''   +','+
                  Trim(edNumInscDestino.Text)+')');
   try
      qryAux.ExecSQL;
   except
      Result := false;
      exit;
   end;
   Result := True;
}   
end;

function TfrmEventoTransfPlanoNOVO.GravaReservasParticipante(sIdPessJurTransf,sIdPlanoOrigem,sIdPessoaTransf ,sSeqPropostaTransf : String ;
                                                          qryaux, qryaux2, qrygrava  : twwquery): Boolean ;
begin
    Result := false;

   // Filtra todas as Reservas do Plano
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAXPLANO '+
                  ' WHERE  IDPLANOPREV      = ' + sIdPlanoOrigem+
                  ' AND    ANALITICOSINTETI = ' + '''A''' +
                  ' AND    FLGCOLETIVA      = 0 ');
   qryAux.Open;
   qryAux.First;

   while not qryAux.EOF do
   begin
       // Verifica se as Reservas do Participante ainda não foram gravadas
       qryAux2.Close;
       qryAux2.Sql.Clear;
       qryAux2.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAPART ' +
                       ' WHERE IDTIPORESERVA = ' + qryAux.FieldbyName('IDTIPORESERVA').AsString + ' AND ' +
                       '       IDPESSOA      = ' + sIdPessoaTransf + ' AND ' +
                       '       SEQPROPOSTA   = ' + sSeqPropostaTransf +' AND '+
                       '       IDPLANOPREV   = ' + sIdPlanoOrigem + ' AND ' +
                       '       IDPESSJUR     = ' + sIdPessJurTransf );
       qryAux2.Open;
       if qryAux2.IsEmpty
       then begin
           // Grava as Reservas do Participante
           qryGrava.Close;
           qryGrava.Sql.Clear;
           qryGrava.Sql.Add(' INSERT INTO RESERVAPART (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA, SEQPROPOSTA, FLGATIVO) '+
                            ' VALUES( ' + qryAux.FieldbyName('IDTIPORESERVA').AsString  + ',' +
                                          sIdPlanoOrigem+ ',' +
                                          sIdPessJurTransf+ ',' +
                                          sIdPessoaTransf+ ', '+sSeqPropostaTransf+',1 )');
           try
              qryGrava.ExecSQL;
           except
              Exit;
           end;
       end;  //if

      qryAux.Next;
   end;//while

   Result := true;
end;

function TfrmEventoTransfPlanoNOVO.SuspendeContribuicoes(sIdPessJurTransf, sIdPlanoOrigem, sIdPessoaTransf,sSeqPropostaTransf : String ; qryAux, qryGrava : TwwQuery) : boolean ;
begin

 {Suspende a Cobrança de todas as Contribuições Previdenciarias do Participante}
{  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0, DATAFINAL = TO_DATE('''+DateToStr(StrToDate(dtInscricao.Text)-1)+''',''DD/MM/YYYY'')  ' +
                 ' WHERE SEQPROPOSTA = ' + sSeqPropostaTransf + ' AND' +
                 '       IDPESSJUR   = ' + sIdPessJurTransf   + ' AND' +
                 '       IDPLANOPREV = ' + sIdPlanoOrigem + ' AND' +
                 '       IDPESSOA    = ' + sIdPessoaTransf+'    ');
  try
     qryAux.ExecSQL;
  except
     result := false;
     exit;
  end;
}  
  result := true;
end;

function TfrmEventoTransfPlanoNOVO.TransfPlano(sIdPessJurTransforig,sidplanoorig,sIdPessJurTransfdest,sIdPlanoDestino,sIdPessoaTransf,
                                           sSeqPropostaTransf,sIdSitPlanoOrigem,sidsitplanoTransfdest : String ; qryaux, qrygrava, qryaux2  : twwquery) : boolean;
var sSQL     : string;
    bErro : boolean;
begin
   Result := False;
{
   // Seleciona todas as informações do participante no plano de origem
   sSQL := ' SELECT PP.REQUERIMENTODATA, '+
           '        PP.INSCRICAONUMERO,         PP.INSCRICAODATA,   PP.INSCRICAOTIPO, '+
           '        PP.SALINSCRICAO, '+
           '        PP.DATAINICIOASSIST,        PP.SALPARTICIPACAO, PP.SALMANTIDO, '+
           '        PP.SALVINCULADO,            PP.VALORCALCINSS,   PP.DATACANCELAMENTO, '+
           '        PP.DATAINICIOMANUT,         PP.DATAFIMASSIST,   PP.FLGDEVEEMPRESTIMO, '+
           '        PP.FLGDEVEASSISTENC,        PP.FLGDEVEPREVIDENC,PP.VALORINFINSS, '+
           '        PP.DATAINICIOSITTEMP,       PP.DATAFIMSITTEMP,  PP.SALAUXDOENCA, '+
           '        PP.SEQPROPOSTA,             PP.IDSITPART, '+
           '        PP.REQUERIMENTODATA '+
           '  FROM  PARTPREVPLAN PP '+
           '  WHERE PP.IDPLANOPREV = '+sIdPlanoOrig+
           '  AND   PP.IDPESSOA    = '+sIdPessoaTransf;


   // Executa regra de validação de transferencia de plano
   if qryPlanoDestino.fieldbyname('IDREGRATRANSFPLA').AsString <> ''
   then begin
      if not RegraBooleana( qryPlanoDestino.Fieldbyname('IDREGRATRANSFPLA').AsString, sSQL, bErro)
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
   qryAux2.sql.add('  UPDATE  PARTPREVPLAN SET IDSITPLANOPREV = '+sIdSitPlanoOrigem+' '+
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

   if not AtualizaFlgDesativado ( qryAux2,
                                  StrToInt(sIdPessJurTransfDest),
                                  StrToInt(sIdPlanoDestino),
                                  StrToInt(sIdPessoaTransf),
                                  StrToInt(sSeqPropostaTransf) )
   then begin
      MsgDlg('Erro ao ativar participante no plano. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
      Exit;
   end;


   // Insere participante no plano destino
   sSQL := '  INSERT INTO PARTPREVPLAN( '+
           '         IDPESSJUR,         IDPLANOPREV,    IDPESSOA,          SEQPROPOSTA, '+
           '         IDSITPART ,        IDSITPLANOPREV, INSCRICAONUMERO,   INSCRICAODATA, '+
           '         INSCRICAOTIPO,     SALINSCRICAO,   SALPARTICIPACAO,   SALMANTIDO, '+
           '         SALVINCULADO,      VALORCALCINSS,  FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC, '+
           '         FLGDEVEPREVIDENC,  VALORINFINSS,   SALAUXDOENCA, '+
           '         DATAINICIOSITTEMP, DATAFIMSITTEMP, DATAINICIOMANUT,   REQUERIMENTODATA  ) '+
           '  VALUES('+sIdPessJurTransfdest          +','+
                       sIdPlanoDestino            +','+
                       sIdPessoaTransf               +','+
                       sSeqPropostaTransf            +','+
           qryaux.fieldbyname('IDSITPART').AsString  +','+
           sidsitplanoTransfdest+','+edNumInscDestino.Text  +','+
           'TO_DATE('''+dtInscricao.Text+''',''DD/MM/YYYY''),'+
           ''''+qryaux.fieldbyname('INSCRICAOTIPO').AsString+''','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALINSCRICAO').AsFloat))    +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALPARTICIPACAO').AsFloat)) +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALMANTIDO').AsFloat))      +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALVINCULADO').AsFloat))    +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('VALORCALCINSS').AsFloat))   +','+
           qryaux.fieldbyname('FLGDEVEEMPRESTIMO').AsString                     +','+
           qryaux.fieldbyname('FLGDEVEASSISTENC').AsString                      +','+
           qryaux.fieldbyname('FLGDEVEPREVIDENC').AsString                      +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('valorinfinss').AsFloat))    +','+
           OraNumero(FloatToStr(qryaux.fieldbyname('SALAUXDOENCA').AsFloat))    ;

   if qryaux.fieldbyname('DATAINICIOSITTEMP').AsString <> ''
   then sSQL := sSQL +', TO_DATE('''+qryaux.fieldbyname('DATAINICIOSITTEMP').AsString+''',''DD/MM/YYYY'')'
   else sSQL := sSQL +', NULL ';

   if qryaux.fieldbyname('DATAFIMSITTEMP').AsString <> ''
   then sSQL := sSQL +', TO_DATE('''+qryaux.fieldbyname('DATAFIMSITTEMP').AsString+''',''DD/MM/YYYY'')'
   else sSQL := sSQL +', NULL ';

   if  qryaux.fieldbyname('DATAINICIOMANUT').AsString <> ''
   then sSQL := sSQL +', TO_DATE('''+qryaux.fieldbyname('DATAINICIOMANUT').AsString+''',''DD/MM/YYYY'')'
   else sSQL := sSQL +', NULL ';

   sSQL := sSQL +', TO_DATE('''+dtRequerimento.Text+''',''DD/MM/YYYY'')';

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
`}
   Result := True;
end;

function TfrmEventoTransfPlanoNOVO.DesReservasParticipante(sIdPessJurDestinoTransf,sIdPlanoDestino,sIdPessoaTransf,sSeqPropostaTransf : String; qryaux : Twwquery) : boolean;
begin
   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' UPDATE RESERVAPART SET FLGATIVO = 0 , DATADESATIV = SYSDATE '+
                  ' WHERE IDPESSOA = '+sIdPessoaTransf+' '+
                  ' AND IDPESSJUR = '+sIdPessJurDestinoTransf+' '+
                  ' AND IDPLANOPREV = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString+' '+
                  ' AND SEQPROPOSTA = '+sSeqPropostaTransf+' ');
   try
      qryaux.execsql;
   except
      Result := false;
      Exit;
   end;
   Result := true;

end;


procedure TfrmEventoTransfPlanoNOVO.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then MontaInformacoesParticipante (StrToInt(MontaSelectPart.ValoresChave[1]),
                                     StrToInt(MontaSelectPart.ValoresChave[2]),
                                     StrToInt(MontaSelectPart.ValoresChave[0]),
                                     1)
  else MontaInformacoesParticipante (-1, -1,-1, -1);

end;

procedure TfrmEventoTransfPlanoNOVO.edCampoBuscaExit(Sender: TObject);
begin
   inherited;
   if edCampoBusca.Text = '' then Exit;

   if sUltimaMatricula <> Trim(edCampoBusca.Text)
   then begin
      with dtmAPrev.qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA '+
                 ' FROM   ELEGPATRO EL, PARTPREVPLAN PP '+
                 ' WHERE  EL.MATRICULA LIKE '''+Trim(edCampoBusca.Text)+'%'''+
                 ' AND    PP.IDPESSJUR = EL.IDPESSJUR '+
                 ' AND    PP.IDPESSOA = EL.IDPESSOA ');
         Open;
         if not IsEmpty
         then begin
            MontaInformacoesParticipante ( FieldByName('IDPESSJUR').AsInteger,
                                           FieldByName('IDPLANOPREV').AsInteger,
                                           FieldByName('IDPESSOA').AsInteger,
                                           1);
            sUltimaMatricula := Trim(edCampoBusca.Text);
         end
         else MontaInformacoesParticipante (-1, -1,-1, -1);
      end;
   end;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnAnteriorClick(Sender: TObject);
begin
  inherited;
  dec(iEtapaAtiva);
  
  if pgctrlEtapas.ActivePage      = tbsEtapa2
  then begin
     tbsEtapa1.TabVisible         := True;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa1;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa3
  then begin
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := True;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa2;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa4
  then begin
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := True;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa3;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa5
  then begin
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := True;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa4;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa6
  then begin
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := True;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa5;
  end;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbNovoPlano.Text) = ''
  then begin
     MsgDlg('Selecione o Plano Destino.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  // Etapa 1 : Procurar participante
  // Etapa 2 : Informacoes de Entrada ( do Tipo Banco ou Regra )
  // Etapa 3 : Opcoes
  // Etapa 4 : Informacoes de Entrada ( do Tipo Informado )
  // Etapa 5 : Estimativas
  // Etapa 6 : Relatorios
  // Etapa 7 : Migracao
  if pgctrlEtapas.ActivePage      = tbsEtapa1
  then begin
     frmAguarde.Apaga;
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := True;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa2;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa2
  then begin
     frmAguarde.Apaga;
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := True;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa3;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa3
  then begin
     frmAguarde.Apaga;
     if Trim(edOpcao.Text) = ''
     then begin
        MsgDlg('Selecione uma das opções.','Erro',mtError,[mbOk,mbHelp],0);
        edOpcao.SetFocus;
        Exit;
     end;

     if qryInputTransfPlano.IsEmpty
     then begin
        frmAguarde.Apaga;
        lblEstimativa.Caption        := 'Estimativas para a Opção '+Trim(edOpcao.Text)+'...';
        tbsEtapa1.TabVisible         := False;
        tbsEtapa2.TabVisible         := False;
        tbsEtapa3.TabVisible         := False;
        tbsEtapa4.TabVisible         := False;
        tbsEtapa5.TabVisible         := True;
        tbsEtapa6.TabVisible         := False;
        pgctrlEtapas.ActivePage      := tbsEtapa5;
     end
     else begin
        tbsEtapa1.TabVisible         := False;
        tbsEtapa2.TabVisible         := False;
        tbsEtapa3.TabVisible         := False;
        tbsEtapa4.TabVisible         := True;
        tbsEtapa5.TabVisible         := False;
        tbsEtapa6.TabVisible         := False;
        pgctrlEtapas.ActivePage      := tbsEtapa4;
     end;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa4
  then begin
     if dtmRelTransfPlano.qryInfDigitadas.UpdatesPending  then dtmRelTransfPlano.qryInfDigitadas.CancelUpdates;

     with qryInputTransfPlano do
     begin
        First;
        while not Eof do
        begin
           dtmRelTransfPlano.qryInfDigitadas.Append;
           dtmRelTransfPlano.qryInfDigitadas.FieldByName('NOMEINPUT').AsString  := FieldByName('DESCRICAO').AsString;
           dtmRelTransfPlano.qryInfDigitadas.FieldByName('VALORINPUT').AsString := FieldByName('VALOR').AsString;
           dtmRelTransfPlano.qryInfDigitadas.Post;
           Next;
        end;
     end;

     frmAguarde.Apaga;
     lblEstimativa.Caption        := 'Estimativas para a Opção '+Trim(edOpcao.Text)+'...';
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := True;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa5;
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa5
  then begin
     frmAguarde.Apaga;
     tbsEtapa1.TabVisible         := False;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := True;
     pgctrlEtapas.ActivePage      := tbsEtapa6;
  end;

  inc(iEtapaAtiva);

  if pgctrlEtapas.ActivePage = tbsEtapa2
  then ExecutaEtapa2 // informar dados de entrada
  else if pgctrlEtapas.ActivePage = tbsEtapa3
  then begin
     ExecutaEtapa3ou5('B'); // calcular bases de calculo
     ExecutaEtapa3ou5('O'); // calcular opcoes
  end
  else if pgctrlEtapas.ActivePage = tbsEtapa4
  then ExecutaEtapa4
  else if pgctrlEtapas.ActivePage = tbsEtapa5
  then ExecutaEtapa3ou5('E');// calcular estimativas


end;

procedure TfrmEventoTransfPlanoNOVO.FormShow(Sender: TObject);
begin
  inherited;
  sIdEventoGerador      := '62';
  sFlgInterno           := 'TP';
  iIdFundacao           := 1;
  sControleReserva      := '1';
  sControleReservaEstim := '1';
  bAlterouData          := False;

  qryPlanoDestino.Close;
  qryPlanoDestino.Open;

{  qrySitPlanoOrigem.Close;
  qrySitPlanoOrigem.ParamByName('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoOrigem.Open;

  qrySitPlanoDestino.Close;
  qrySitPlanoDestino.Open;
}
  lblTituloEtapa2.Caption      := '';
  lblTituloEtapa3.Caption      := '';
  lblTituloEtapa4.Caption      := '';
  lblTituloEtapa5.Caption      := '';

  tbsEtapa1.TabVisible         := True;
  tbsEtapa2.TabVisible         := False;
  tbsEtapa3.TabVisible         := False;
  tbsEtapa4.TabVisible         := False;
  tbsEtapa5.TabVisible         := False;
  tbsEtapa6.TabVisible         := False;
  pgctrlEtapas.ActivePage      := tbsEtapa1;

 with qryAux do
  begin
     Close;
     SQL.Clear;
     //P.RAMOS-05.07.2005-PEGAR MAIOR DATA DENTRO OS EVENTOS PERMITIDOS
     SQL.Add(
       ' SELECT MAX(DATADADOS) AS DATADADOS '+
       ' FROM EVENTOGERADOR '+
       //' WHERE IDEVENTOGERADOR = '+sIdEventoGerador);
       ' WHERE IDEVENTOGERADOR IN (45,60,62) ');
     //P.RAMOS-05.07.2005-PEGAR MAIOR DATA DENTRO OS EVENTOS PERMITIDOS-FIM
     Open;
  end;

  dtDataREF.Text := qryAux.FieldByName('DATADADOS').AsString;

  if (Sistema.NomeUsuario = 'BT026317') 
  then begin
     dtDataRef.Enabled := True;
     dtDataRef.Color   := clWhite;
  end
  else begin
     dtDataRef.Enabled := False;
     dtDataRef.Color   := clSilver;
  end;

  if dtDataRef.Enabled
  then dtDataRef.Color := clWhite
  else dtDataRef.Color := clSilver;

  memOpcoes.Lines.Clear;
  MontaInformacoesParticipante (-1, -1,-1, -1);
  dtDATATRANSACAO.Text := DateToStr(date);

  sUltimaMatricula := '';

end;

procedure TfrmEventoTransfPlanoNOVO.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryPlanoDestino.Close;
  qryPlanoDestino.Open;
  lblTituloEtapa2.Caption := '';
  lblTituloEtapa3.Caption := '';
  lblTituloEtapa4.Caption  := '';
  lblTituloEtapa5.Caption  := '';

  tbsEtapa1.TabVisible         := True;
  tbsEtapa2.TabVisible         := False;
  tbsEtapa3.TabVisible         := False;
  tbsEtapa4.TabVisible         := False;
  tbsEtapa5.TabVisible         := False;
  tbsEtapa6.TabVisible         := False;
  pgctrlEtapas.ActivePage      := tbsEtapa1;
  memOpcoes.Lines.Clear;
  MontaInformacoesParticipante (-1, -1,-1, -1);

end;

procedure TfrmEventoTransfPlanoNOVO.bbtnEfetuaMigracaoClick(
  Sender: TObject);
var sProximoAnoMes : string;
    dAux           : double;
begin
  inherited;

  with qryInputTransfPlano do
  begin
     First;
     while not Eof do
     begin
        TrataPreviaMigraPlano( 'I',
                                FieldByName('VALOR').AsString,
                                FieldByName('DESCRICAO').AsString );
        Next;
     end;
  end;

  with qryInfBanco do
  begin
     First;
     while not Eof do
     begin
        if (FieldByName('IDINPUT').AsInteger = 6)   or
           (FieldByName('IDINPUT').AsInteger = 22)  or
           (FieldByName('IDINPUT').AsInteger = 26)  or
           (FieldByName('IDINPUT').AsInteger = 53)
        then begin
           TrataPreviaMigraPlano( 'D',
                                   FieldByName('VALOR').AsString,
                                   FieldByName('DESCRICAO').AsString );
        end;
        Next;
     end;
  end;

  // Gravar Reservas
  TrataPreviaMigraPlano('N', qryParticipanteOrigem.FieldByName('RPNAOTRIBUTAVEL').AsString, 'RP NAO TRIBUTAVEL');
  TrataPreviaMigraPlano('T', qryParticipanteOrigem.FieldByName('RPTRIBUTAVEL').AsString,    'RP TRIBUTAVEL');

  // Gravar IdadeApos
  if qryInfBanco.Locate('IDINPUT', 11, [])
  then InserePreviaMigraPlano('IDADEAP', qryInfBanco.FieldByName('VALOR').AsString, 'IDADE APOS');

  // Gravar Opção
  InserePreviaMigraPlano('OPCAO', edOpcao.Text, 'OPÇÃO');

  // Calcular e Gravar CIP e CPI
  if qryParticipanteOrigem.FieldByName('SITUACAO').AsString = 'AT'
  then begin
     // ATIVOS
     //         OPCAO 1         OPCAO 2          OPCAO 3
     // CIP     INCENTIVO       INCENTIVO        RPTRIB+RPNAOTRIB+INCENTIVO
     // CPI     0               VALOR TRANSF     CIP OPCAO3
     if Trim(edOpcao.Text) = '1'
     then begin
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '10107',[])
        then InserePreviaMigraPlano('501', qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString, 'CIP');
     end
     else if Trim(edOpcao.Text) = '2'
     then begin
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '10107',[])
        then InserePreviaMigraPlano('501', qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString, 'CIP');

        if qryPreviaMigra.Locate('CODCAMPOMIGRA', 'CPIOP2',[])
        then InserePreviaMigraPlano('502', qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString, 'CPI')
     end
     else if Trim(edOpcao.Text) = '3'
     then begin
        dAux := 0;
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '511',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '516',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '517',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;

        InserePreviaMigraPlano('501', FloatToStr(dAux), 'CIP');

        if qryPreviaMigra.Locate('CODCAMPOMIGRA', 'CPIOP3',[])
        then InserePreviaMigraPlano('502', qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString, 'CPI');
     end;
  end
  else begin // AutoPatrocinado
     // AUTOPATROCINADOS
     //         OPCAO 1         OPCAO 2             OPCAO 3
     // CIP     INCENTIVO       INCENTIVO+CPIAUTOP  RPTRIB+RPNAOTRIB+INCENTIVO
     // CPI     0               0                   0

     if Trim(edOpcao.Text) = '1'
     then begin
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '10107',[])
        then InserePreviaMigraPlano('501', qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString, 'CIP');
     end
     else if Trim(edOpcao.Text) = '2'
     then begin
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '10107',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;

        if qryPreviaMigra.Locate('CODCAMPOMIGRA', 'CPIAUTOPAT',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;

        InserePreviaMigraPlano('501', FloatToStr(dAux), 'CIP');
     end
     else if Trim(edOpcao.Text) = '3'
     then begin
        dAux := 0;
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '511',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '516',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', '517',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;
        if qryPreviaMigra.Locate('CODCAMPOMIGRA', 'CPIAUTOPAT',[])
        then dAux := dAux + qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat;

        InserePreviaMigraPlano('501', FloatToStr(dAux), 'CIP');
     end;
  end;

  InserePreviaMigraPlano('DATATRANSF', dtDATATRANSACAO.Text, 'DATATRANSF');
  InserePreviaMigraPlano('SITUACAO',   qryParticipanteOrigem.FieldByName('SITUACAO').AsString, 'SITUACAO');
  InserePreviaMigraPlano('DATABASE',    dtDataREF.Text, 'DATABASE');


  if MsgDlg('Deseja confirmar a Adesão do participante '+
            qryParticipanteOrigem.FieldByName('NOMEPARTICIP').AsString+' com '+#13+
            ' Data de Adesão igual a '+dtDATATRANSACAO.Text+' e Opção '+edOpcao.Text+' ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes
  then begin
     qryPreviaMigra.ApplyUpdates;
     dtmBaseDados.dbBaseDados.StartTransaction;

     // ESPECIFICO FCRT +OU-
     // NA HORA DE CALCULAR AS ESTIMATIVAS, SE O VALOR DO ITEM 1 FOR MAIOR
     // QUE O VALOR DO ITEM 2, PASSAR 1 NO CONTROLE, SENAO, PASSAR 2
     if sControleReservaEstim = '2'
     then begin // GRAVAR RESERVA DE RETIRADA (521) NAS CONTAS 402 E 508
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE PREVIAMIGRAPLANO P '+
                       ' SET    VALORAMIGRAR = ( SELECT P2.VALORAMIGRAR '+
                       '                         FROM   PREVIAMIGRAPLANO P2 '+
                       '                         WHERE  P2.CODCAMPOMIGRA = ''521'' '+
                       '                         AND    P2.IDPESSJUR     = P.IDPESSJUR '+
                       '                         AND    P2.IDPLANOPREV   = P.IDPLANOPREV '+
                       '                         AND    P2.IDPESSOA      = P.IDPESSOA '+
                       '                         AND    P2.SEQPROPOSTA   = P.SEQPROPOSTA) '+
                       ' WHERE  CODCAMPOMIGRA = ''402'' '+
                       ' AND    IDPESSJUR     = '+ qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString+
                       ' AND    IDPLANOPREV   = '+ qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString+
                       ' AND    IDPESSOA      = '+ qryParticipanteOrigem.FieldByName('IDPESSOA').AsString+
                                              ' AND    SEQPROPOSTA   = '+ qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString);
        qryAux.ExecSQL;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE PREVIAMIGRAPLANO P '+
                       ' SET    VALORAMIGRAR = ( SELECT P2.VALORAMIGRAR '+
                       '                         FROM   PREVIAMIGRAPLANO P2 '+
                       '                         WHERE  P2.CODCAMPOMIGRA = ''521'' '+
                       '                         AND    P2.IDPESSJUR     = P.IDPESSJUR '+
                       '                         AND    P2.IDPLANOPREV   = P.IDPLANOPREV '+
                       '                         AND    P2.IDPESSOA      = P.IDPESSOA '+
                       '                         AND    P2.SEQPROPOSTA   = P.SEQPROPOSTA) '+
                       ' WHERE  CODCAMPOMIGRA = ''508'' '+
                       ' AND    IDPESSJUR     = '+ qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString+
                       ' AND    IDPLANOPREV   = '+ qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString+
                       ' AND    IDPESSOA      = '+ qryParticipanteOrigem.FieldByName('IDPESSOA').AsString+
                       ' AND    SEQPROPOSTA   = '+ qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString);
        qryAux.ExecSQL;

     end;
     
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT ROUND(TO_CHAR(TO_NUMBER(RESG.VALORAMIGRAR) * TO_NUMBER(PERC.VALORAMIGRAR) / 100 ), 2) AS VALORAMIGRAR '+
                     '   FROM   PREVIAMIGRAPLANO RESG, PREVIAMIGRAPLANO PERC '+
                     '   WHERE RESG.CODCAMPOMIGRA = ''402'' '+
                     '   AND   RESG.IDPESSJUR     = '+ qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString+
                     '   AND   RESG.IDPLANOPREV   = '+ qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString+
                     '   AND   RESG.IDPESSOA      = '+ qryParticipanteOrigem.FieldByName('IDPESSOA').AsString+
                     '   AND   RESG.SEQPROPOSTA   = '+ qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString+
                     '   AND   PERC.CODCAMPOMIGRA = ''513'' '+
                     '   AND   PERC.IDPESSJUR     = RESG.IDPESSJUR '+
                     '   AND   PERC.IDPLANOPREV   = RESG.IDPLANOPREV '+
                     '   AND   PERC.IDPESSOA      = RESG.IDPESSOA '+
                     '   AND   PERC.SEQPROPOSTA   = RESG.SEQPROPOSTA     ');
     qryAux.Open;
     if not qryAux.IsEmpty
     then dAux := qryAux.FieldByName('VALORAMIGRAR').AsFloat;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE PREVIAMIGRAPLANO SET VALORAMIGRAR = '+OraNumero(FloatToStr(dAux))+
                    ' WHERE  CODCAMPOMIGRA = ''512'' '+
                    ' AND    IDPESSJUR     = '+ qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDPLANOPREV   = '+ qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString+
                    ' AND    IDPESSOA      = '+ qryParticipanteOrigem.FieldByName('IDPESSOA').AsString+
                    ' AND    SEQPROPOSTA   = '+ qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString);
     qryAux.ExecSQL;


     dtmBaseDados.dbBaseDados.Commit;



     MsgDlg('Migração Confirmada.', 'Informação', mtInformation, [mbOk],0);
     tbsEtapa1.TabVisible         := True;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage := tbsEtapa1;
     MontaInformacoesParticipante (-1, -1,-1, -1);
  end
  else begin
     qryPreviaMigra.CancelUpdates;
     MsgDlg('Migração Cancelada.', 'Informação', mtInformation, [mbOk],0);
     tbsEtapa1.TabVisible         := True;
     tbsEtapa2.TabVisible         := False;
     tbsEtapa3.TabVisible         := False;
     tbsEtapa4.TabVisible         := False;
     tbsEtapa5.TabVisible         := False;
     tbsEtapa6.TabVisible         := False;
     pgctrlEtapas.ActivePage      := tbsEtapa1;
     MontaInformacoesParticipante (-1, -1,-1, -1);
  end;

end;

procedure TfrmEventoTransfPlanoNOVO.bbtnConfirmacaoFinalClick(
  Sender: TObject);
var sMsgErro : string;
begin
  inherited;
end;

procedure TfrmEventoTransfPlanoNOVO.FormActivate(Sender: TObject);
begin
  inherited;
//  edCampoBusca.SetFocus;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnPrintOpcoesClick(Sender: TObject);
begin
  inherited;
  with dtmRelTransfPlano do
  begin
    DsgnCM.Report.Template.SaveTo   := stFile;
    DsgnCM.Report.Template.Format   := ftASCII;
    DsgnCM.Report.Device            := dvScreen;
    TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, 'TotalPREV - Simulador de Migração de Plano');
  end;
end;

procedure TfrmEventoTransfPlanoNOVO.FormCreate(Sender: TObject);
begin
  inherited;
  iEtapaAtiva := -1;
end;

procedure TfrmEventoTransfPlanoNOVO.dbgrdInputTransfPlanoFieldChanged(
  Sender: TObject; Field: TField);
var sSQL,
    sResultRegra,
    sSQLInput,
    sValor       : string;
    bErro        : boolean;
begin

  if pgctrlEtapas.ActivePage <> tbsEtapa4
  then begin
     inherited;
     Exit;
  end;

  // Executar regra de validacao
  if qryInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString = '' then Exit;
  if qryInputTransfPlano.FieldByName('VALOR').AsString         = '' then Exit;
  if bMontandoDefault                                               then Exit;

  sValor := qryInputTransfPlano.FieldByName('VALOR').AsString;

  if qryInputTransfPlano.FieldByName('TIPODADO').AsString = 'N'
  then sValor := OraNumero(sValor);

  // CAMILLE - 25.09.2002
  // Preencher query para executar regra de calculo
  with qryInfBanco do
  begin
     First;
     while not Eof do
     begin
        if (FieldByName('NOMEPARAREGRA').AsString <> '')
        then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString);
        Next;
     end;
  end;

  sSQL := ' SELECT '''+sValor+''' AS VALOR, '+
          Trim(edOpcao.Text)+' AS OPCAO, '+
          sIdEventoGerador+' AS IDEVENTOGERADOR, '+ // CAMILLE - 23.11.2004
          '        EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, '+
          '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT, '+
          '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES, '+
          '        EL.TEMPOSITESPECIAL '+
          sSQLInput+
          '       ,S.SALPARTICIPACAO     AS VALORPROVENTO, '+
          '        S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA, '+
          '        S.MATRICULA,          S.IDADEAPOS, '+
          '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO, '+
          '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL, '+
          '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO, '+
          '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO, '+
          '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA, '+
          '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL, '+
          '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB, '+
          '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT, '+
          '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT, '+
          '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS, '+
          '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA, '+
          //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
          '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
          '        NVL(S.CAMPOOP2,0) AS CAMPOOP2, '+#13#10+
          '        NVL(S.CAMPOOP3,0) AS CAMPOOP3, '+#13#10+
          '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
          '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
          '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
          '        NVL(S.CONTRIBUICAOEXTRA,0) AS CONTRIBUICAOEXTRA, '+#13#10+ //P.RAMOS-21.07.2005-CAMPOS NOVOS
          //P.RAMOS-16.12.2005-PEND.21047-FIM
          '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
          OraNumero(sControleReserva)+' AS CONTROLERESERVA, '+
          '        '''+qryParticipanteOrigem.FieldByName('DATAREF').asstring+''' AS DATAREF '+
          ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG '+
          ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
          ' AND    S.IDPESSJUR        = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString      +
          ' AND    S.IDPLANOPREV      = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString    +
          ' AND    S.IDPESSOA         = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString       +
          ' AND    S.SEQPROPOSTA      = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString    +
          ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
          ' AND    EL.IDPESSJUR       = S.IDPESSJUR '+
          ' AND    EL.IDPESSOA        = S.IDPESSOA                                                    ';

  sResultRegra := RodaRegraValida (qryInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString,
                                   sSQL,
                                   bErro,
                                   iIdCalculoGeral);

  if UpperCase(Trim(sResultRegra)) = 'FALSE'
  then begin
     MsgDlg('O valor digitado não é permitido. ','Erro', mtError, [mbOk], 0);
     dbgrdInputTransfPlano.DataSource.DataSet.Cancel;
     Abort;
  end;

  inherited;
end;

procedure TfrmEventoTransfPlanoNOVO.rpDemonstrativoBeforePrint(
  Sender: TObject);
begin
  if (QRYPARTICIPANTEORIGEM.FieldByName('SITUACAO').AsString = 'AT') OR
     (QRYPARTICIPANTEORIGEM.FieldByName('SITUACAO').AsString = 'MA')
  then dtmRelTransfPlano.ppSumarioObs1.NewPage := True
  else dtmRelTransfPlano.ppSumarioObs1.NewPage := False;

  inherited;
end;

procedure TfrmEventoTransfPlanoNOVO.dbgrdInputTransfPlanoColExit(
  Sender: TObject);
var sSQL,
    sResultRegra,
    sSQLInput,
    sValor       : string;
    bErro        : boolean;
begin

  if (dbgrdInputTransfPlano.SelectedField.FieldName = 'VALOR') and (not bMontandoDefault)
  then begin
      if pgctrlEtapas.ActivePage <> tbsEtapa4
      then begin
         inherited;
         Exit;
      end;

      // Executar regra de validacao
      if qryInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString = '' then Exit;
      if qryInputTransfPlano.FieldByName('VALOR').AsString         = '' then Exit;

      sValor := qryInputTransfPlano.FieldByName('VALOR').AsString;

      if qryInputTransfPlano.FieldByName('TIPODADO').AsString = 'N'
      then sValor := OraNumero(sValor);

      // CAMILLE - 25.09.2002
      // Preencher query para executar regra de calculo
      with qryInfBanco do
      begin
         First;
         while not Eof do
         begin
            if (FieldByName('NOMEPARAREGRA').AsString <> '')
            then sSQLInput := sSQLInput + ','''+OraNumero(Trim(FieldbyName('VALOR').AsString))+''' AS '+Trim(FieldByName('NOMEPARAREGRA').AsString);
            Next;
         end;
      end;

      sSQL := ' SELECT '''+sValor+''' AS VALOR, '+
              Trim(edOpcao.Text)+' AS OPCAO, '+
              sIdEventoGerador+' AS IDEVENTOGERADOR, '+ // CAMILLE - 23.11.2004              
              '        EL.TEMPONAOCREDITADO, EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, '+
              '        EL.TEMPOSERVCALC,     EL.TEMPOSERVPRIVANT,  EL.TEMPOSERVPUBLANT, '+
              '        EL.TEMPOSERVTOTAL,    EL.TEMPOSERVTOTDIA,   EL.TEMPOSERVTOTMES, '+
              '        EL.TEMPOSITESPECIAL '+
              sSQLInput+
              '       ,S.SALPARTICIPACAO     AS VALORPROVENTO, '+
              '        S.IDPESSJUR,          S.IDPLANOPREV,        S.IDPESSOA,         S.SEQPROPOSTA, '+
              '        S.MATRICULA,          S.IDADEAPOS, '+
              '        DECODE(S.SITUACAO, ''FL'', ''AS'', S.SITUACAO) AS SITUACAO, '+
              '        S.DATANASC,           S.DATAMORTE,          S.ESTADOCIVIL AS ESTCIVIL, '+
              '        S.SEXO,               S.DATAADMISSAO,       S.DATADEMISSAO, '+
              '        S.SALPARTICIPACAO,    S.REMUNERACAO,        S.CONTRIBUICAO, '+
              '        S.TEMPOINSS,          S.JOIA,               S.PRAZOJOIAFALTA, '+
              '        S.PRAZOJOIAPAGO,      S.RPTRIBUTAVEL,       S.RPNAOTRIBUTAVEL, '+
              '        S.SRB,                S.FATORPREVIDENC,     S.TEMPOMINCONTRIB, '+
              '        S.PROPORCAO,          S.COTAPENSAO,         S.DATANASCVIT, '+
              '        S.DATANASCTEMP,       S.NUMDEPEN,           S.NUMDEPENTEMP, S.NUMDEPENVIT, '+
              '        S.DATAINICIOFUND,     S.VALORATUAL,         S.VLRINFINSS, '+
              '        S.IDBENEFICIO,        S.VALORABONO,         S.DATAULTSIMULA, '+
              //P.RAMOS-16.12.2005-PEND.21047-COLOCAR NVLs
              '        NVL(S.CAMPOOP1,0) AS CAMPOOP1, '+#13#10+
              '        NVL(S.CAMPOOP2,0) AS CAMPOOP2, '+#13#10+
              '        NVL(S.CAMPOOP3,0) AS CAMPOOP3, '+#13#10+
              '        NVL(S.CAMPOOP4,0) AS CAMPOOP4, '+#13#10+
              '        NVL(S.CAMPOOP5,0) AS CAMPOOP5, '+#13#10+
              '        NVL(S.CAMPOOP6,0) AS CAMPOOP6, '+#13#10+
              '        NVL(S.CONTRIBUICAOEXTRA,0) AS CONTRIBUICAOEXTRA, '+#13#10+ //P.RAMOS-21.07.2005-CAMPOS NOVOS
              //P.RAMOS-16.12.2005-PEND.21047-FIM
              '        NVL(S.RESERVARETIRADA,0) AS RESERVARETIRADA, '+ //P.RAMOS-10.08.2005-NVL EM RESERVA RETIRADA
              OraNumero(sControleReserva)+' AS CONTROLERESERVA, '+
              '        '''+qryParticipanteOrigem.FieldByName('DATAREF').asstring+''' AS DATAREF '+
              ' FROM   ELEGPATRO EL, SIMULAMIGRACAO S, EVENTOGERADOR EG '+
              ' WHERE  EG.IDEVENTOGERADOR = '+sIdEventoGerador                                             +
              ' AND    S.IDPESSJUR        = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString      +
              ' AND    S.IDPLANOPREV      = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString    +
              ' AND    S.IDPESSOA         = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString       +
              ' AND    S.SEQPROPOSTA      = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString    +
              ' AND    S.ANOMESREF        = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
              ' AND    EL.IDPESSJUR       = S.IDPESSJUR '+
              ' AND    EL.IDPESSOA        = S.IDPESSOA                                                    ';

      sResultRegra := RodaRegraValida (qryInputTransfPlano.FieldByName('IDREGRAVALIDA').AsString,
                                       sSQL,
                                       bErro,
                                       iIdCalculoGeral);

      if UpperCase(Trim(sResultRegra)) = 'FALSE'
      then begin
         MsgDlg('O valor digitado não é permitido. ','Erro', mtError, [mbOk], 0);
         dbgrdInputTransfPlano.DataSource.DataSet.Cancel;
         Abort;
      end;

  end;

  inherited;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnPrintTermoClick(Sender: TObject);
begin
  inherited;

  if qryParticipanteOrigem.FieldByName('SITUACAO').AsString = 'AT'
  then begin
      with dtmRelTransfPlano.qryTermoAtivo do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger       := qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger;
         ParamByName('IDPESSOA').AsInteger        := qryParticipanteOrigem.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
         ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
         Open;
      end;

      with dtmRelTransfPlano do
      begin
        DsgnATIVOS.Report.Template.SaveTo   := stFile;
        DsgnATIVOS.Report.Template.Format   := ftASCII;
        DsgnATIVOS.Report.Device            := dvScreen;
        TFrmPreview.CreateModalPreview(Application, DsgnATIVOS.Report, 'TotalPREV - Termo de Migração para Ativos');
      end;
  end
  else  if qryParticipanteOrigem.FieldByName('SITUACAO').AsString = 'AS'
  then begin
      with dtmRelTransfPlano.qryTermoAssist do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger       := qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger;
         ParamByName('IDPESSOA').AsInteger        := qryParticipanteOrigem.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
         ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
         Open;
      end;

      with dtmRelTransfPlano do
      begin
        DsgnAssist.Report.Template.SaveTo   := stFile;
        DsgnAssist.Report.Template.Format   := ftASCII;
        DsgnAssist.Report.Device            := dvScreen;
        TFrmPreview.CreateModalPreview(Application, DsgnAssist.Report, 'TotalPREV - Termo de Migração para Assistidos');
      end;
  end
  else if qryParticipanteOrigem.FieldByName('SITUACAO').AsString = 'MA'
  then begin
      with dtmRelTransfPlano.qryTermoMantido do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger       := qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger;
         ParamByName('IDPESSOA').AsInteger        := qryParticipanteOrigem.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
         ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
         Open;
      end;

      with dtmRelTransfPlano do
      begin
        DsgnMantido.Report.Template.SaveTo   := stFile;
        DsgnMantido.Report.Template.Format   := ftASCII;
        DsgnMantido.Report.Device            := dvScreen;
        TFrmPreview.CreateModalPreview(Application, DsgnMantido.Report, 'TotalPREV - Termo de Migração para Autopatrocinados');
      end;
  end
  else if qryParticipanteOrigem.FieldByName('SITUACAO').AsString = 'FL'
  then begin
      with dtmRelTransfPlano.qryTermoPensao do
      begin
         Close;
         ParamByName('IDPESSJUR').AsInteger       := qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger;
         ParamByName('IDPESSOA').AsInteger        := qryParticipanteOrigem.FieldByName('IDPESSOA').AsInteger;
         ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
         ParamByName('DATADADOS').AsDateTime      := StrToDate(dtDataRef.Text);
         Open;
      end;

      with dtmRelTransfPlano do
      begin
        DsgnPensao.Report.Template.SaveTo   := stFile;
        DsgnPensao.Report.Template.Format   := ftASCII;
        DsgnPensao.Report.Device            := dvScreen;
        TFrmPreview.CreateModalPreview(Application, DsgnPensao.Report, 'TotalPREV - Termo de Migração para Pensionistas');
      end;
  end;
end;

procedure TfrmEventoTransfPlanoNOVO.bbtnConfirmaMigracaoClick(
  Sender: TObject);
begin
  inherited;
  if MsgDlg('Esta operação irá transferir este participante DEFINITIVAMENTE para o plano '+
            dblkpcmbNovoPlano.Text+'. Confirma ? ','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin
     MsgDlg('Operação Interrompida. ', 'Aviso', mtInformation, [mbOK],0);
     Exit;
  end;


{
  if Trim(dtRequerimento.Text) = ''
  then begin
     MsgDlg('A Data do Requerimento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dtRequerimento.SetFocus;
     Exit;
  end;

  if Trim(dtInscricao.Text) = ''
  then begin
     MsgDlg('A Data de Início Efetivo no Novo Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dtInscricao.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPlanoOrigem.Text) = ''
  then begin
     MsgDlg('A Situação no Plano Origem deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPlanoOrigem.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPlanoDestino.Text) = ''
  then begin
     MsgDlg('A Situação no Plano Destino deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPlanoDestino.SetFocus;
     Exit;
  end;

  if Trim(edNumInscDestino.Text) = ''
  then begin
     MsgDlg('O No. de Inscrição no Plano Destino deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPlanoDestino.SetFocus;
     Exit;
  end;
}
  if dtmBasedados.dbBaseDados.InTransaction
  then dtmBasedados.dbBaseDados.Rollback;
  dtmBasedados.dbBaseDados.StartTransaction;

  frmAguarde.Mostra('Inserindo Participante no Plano Destino...');

  // cadastro do participante no plano destino
  // e atualização do participante com a nova situação no plano antigo
{  if not TransfPlano( qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString,
                      qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString,
                      qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString,
                      qryPlanoDestino.FieldByName('IDPLANOPREV').AsString,
                      qryParticipanteOrigem.FieldByName('IDPESSOA').AsString,
                      qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString,
                      qrySitPlanoOrigem.FieldByName('IDSITPLANOPREV').AsString,
                      qrySitPlanoDestino.FieldByName('IDSITPLANOPREV').AsString,
                      qryaux,
                      qrygrava,
                      qryaux2 )
  then begin
     MsgDlg('Erro ao transferir o participante de plano. Operação Cancelada.','Erro',mtError,[mbOk],0);
     frmAguarde.Apaga;
     dtmBasedados.dbBaseDados.Rollback;
     Exit;
  end;
}
  frmAguarde.Mostra('Gravando o Evento...');

  if not GravaEVENTOSPREV then
  begin
     MsgDlg('Erro na gravação no histórico de eventos. Operação Cancelada.','Erro',mtError,[mbOk],0);
     frmAguarde.Apaga;
     dtmBasedados.dbBaseDados.Rollback;
     Exit;
  end;

  // Associar contribuicoes ao participante no novo plano.
{  GravaHSTCONTEVENTOSPRFechado( IntToStr(iIdEventoPrevOrig),
                                qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString,
                                sIdEventoGerador,
                                '',
                                qryParticipanteOrigem.FieldByName('IDPESSOA').AsString,
                                qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString,
                                qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString,
                                qryParticipanteOrigem.FieldByName('SALARIO').AsString,
                                '0',
                                dtInscricao.Text,
                                True,
                                qryAux,
                                qryGrava,
                                qryPlanoDestino.FieldByName('IDPLANOPREV').AsString);
}
  frmAguarde.Mostra('Suspendendo contribuições do Plano Origem...');

  if not SuspendeContribuicoes( qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString,
                                qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString,
                                qryParticipanteOrigem.FieldByName('IDPESSOA').AsString,
                                qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString,
                                qryAux,
                                qryGrava)
  then begin
     MsgDlg('Erro na desativação das contribuições relacionadas ao plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
     frmAguarde.Apaga;
     dtmBasedados.dbBaseDados.Rollback;
     Exit;
  end;

  // Verificar contribuicoes a associar
{  if not AssociaNovasContribuicoes( qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString,
                                    qryPlanoDestino.FieldByName('IDPLANOPREV').AsString,
                                    qryParticipanteOrigem.FieldByName('IDPESSOA').AsString,
                                    qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString,
                                    sIdEventoGerador,
                                    dtInscricao.Text,
                                    '',
                                    edCampoBusca.Text,
                                    qryParticipanteOrigem.FieldByName('IDSITPART').AsString,
                                    qryParticipanteOrigem.FieldByName('SALARIO').AsString,
                                    False,
                                    True,
                                    False,
                                    qryAux, qryGrava,
                                    sFlgInterno,
                                    StrToInt(sIdEventoGerador),
                                    '0000/00' )
  then begin
     MsgDlg('Erro na associação das contribuições do plano destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
     frmAguarde.Apaga;
     dtmBasedados.dbBaseDados.Rollback;
     Exit;
  end;
}
    //grava reservas
  frmAguarde.Mostra('Associa reservas do Plano Destino...');

  if not GravaReservasParticipante ( qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString,
                                     qryPlanoDestino.FieldByName('IDPLANOPREV').AsString,
                                     qryParticipanteOrigem.FieldByName('IDPESSOA').AsString,
                                     qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString,
                                     qryaux,
                                     qryaux2,
                                     qrygrava)
  then begin
     MsgDlg('Erro na associação das reservas do Plano Destino. Operação Cancelada.','Erro',mtError,[mbOk],0);
     frmAguarde.Apaga;
     dtmBasedados.dbBaseDados.Rollback;
     Exit;
  end;

  // Transfere Reservas ...

  frmAguarde.Mostra('Transferindo Reservas...');

(*
  if not RODAPADRAOMOVRESERVA( qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger,
                               qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsInteger,
                               qryParticipanteOrigem.FieldByName('IDPESSOA').AsInteger,
                               qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsInteger,
                               -1,
                               StrToInt(sIdEventoGerador),
                               qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger,
                               qryPlanoDestino.FieldByName('IDPLANOPREV').AsInteger,
                               sFlgInterno,
                               dtInscricao.Text,
                               sMsgErro, -1, 'O')
  then begin
     MsgDlg('Erro na efetuação do Padrão de Movimentação de Reservas '+#13+
            '['+sMsgErro+']. Operação Cancelada.','Erro',mtError,[mbOk],0);
     frmAguarde.Apaga;
     dtmBasedados.dbBaseDados.Rollback;
     Exit;
  end;
*)
  // desassocia reservas
  // é preciso ser depois da trandferência de reservas
  // para que a transferência enxergue o flgativo como true
  frmAguarde.Mostra('Desassocia reservas do Plano Origem...');

  if not DesReservasParticipante ( qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString,
                                   qryPlanoDestino.FieldByName('IDPLANOPREV').AsString,
                                   qryParticipanteOrigem.FieldByName('IDPESSOA').AsString,
                                   qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString,
                                   qryaux)
  then begin
     MsgDlg('Erro na Desassociação das reservas do Plano Origem. Operação Cancelada.','Erro',mtError,[mbOk],0);

     frmAguarde.Apaga;
     dtmBasedados.dbBaseDados.Rollback;
     Exit;
  end;

  //verifica se restou alguma reserva com saldo
  //avisa, e pergunta se quer abortar a operação
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(' SELECT VALORRESERVA FROM RESERVAPART '+
                 ' WHERE  IDPLANOPREV   = '+qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsString+
                 ' AND    IDPESSJUR     = '+qryParticipanteOrigem.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPESSOA      = '+qryParticipanteOrigem.FieldByName('IDPESSOA').AsString+
                 ' AND    SEQPROPOSTA   = '+qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsString+
                 ' AND    (VALORRESERVA <> 0 OR VALORRESERVA <> NULL) ');
  qryAux.open;

  if not qryAux.isempty then
  begin
     if MsgDlg('Restou saldo em algumas das reservas do plano de origem. Deseja Continuar a transferência mesmo assim?','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrNo
     then begin
        MsgDlg('Operação Interrompida.','Informação',mtInformation,[mbOk],0);

        frmAguarde.Apaga;
        dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;
  end;

  frmAguarde.Apaga;
  dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk],0);
  dtmBasedados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoTransfPlanoNOVO.TrataPreviaMigraPlano  ( cTipo : char;
                                                             psValorItem,
                                                             psDescricao : string;
                                                             psValorItem2 : string = '0' ) ; // B = Base de Calculo
var sCodCampoMigra : string;                                                                 // I = Input = Opcoes Digitadas
begin                                                                                        // C = ConfigTransfPlano
                                                                                             // D = DADOS DE ENTRADA
                                                                                             // T = RESERVA TRIBUTAVEL
                                                                                             // N = RESERVA NAO TRIBUTAVEL

   if cTipo = 'B'          // BASE DE CALCULO
   then begin
     if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger      = 15
     then sCodCampoMigra := '401'
     else if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 18
     then sCodCampoMigra := '402'
     else if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 49                       
     then sCodCampoMigra := '402'
     else if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 16
     then sCodCampoMigra := '511'
     else if (qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger = 50028) and
             (qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 50)
     then sCodCampoMigra := '521'
     else Exit;
   end
   else if cTipo = 'D'          // BASE DE CALCULO                                                                    // T = RESERVA TRIBUTAVEL
   then begin                                                                                                    // N = RESERVA NAO TRIBUTAVEL
     if qryInfBanco.FieldByName('IDINPUT').AsInteger      = 6
     then sCodCampoMigra := '514'
     else if qryInfBanco.FieldByName('IDINPUT').AsInteger = 22
     then sCodCampoMigra := '515'
     else if qryInfBanco.FieldByName('IDINPUT').AsInteger = 26
     then sCodCampoMigra := 'IDBENEF'
     //P.RAMOS-13.07.2005-GRAVAR CONTRIB EXTRA NA PREVIAMIGRAPLANO
     else if qryInfBanco.FieldByName('IDINPUT').AsInteger = 53
     then sCodCampoMigra := '522'
     //P.RAMOS-13.07.2005-GRAVAR CONTRIB EXTRA NA PREVIAMIGRAPLANO-fim
     else Exit;
   end
   else if cTipo = 'I'    // INPUT
   then begin
     if (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger = 6) or (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger = 32)
     then sCodCampoMigra := '514'
     else if (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger = 26)
     then sCodCampoMigra := 'IDADE'
     else if (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger = 22) or (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger = 31)
     then sCodCampoMigra := '515'
     else if (Trim(edOpcao.Text) <> '1' ) and (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger = 49)
     then sCodCampoMigra := '513'
     else if (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger = 50)
     then sCodCampoMigra := 'CPIOP2'
     else if (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger >= 14) and
             (qryInputTransfPlano.FieldByName('IDINPUT').AsInteger <= 18)
     then sCodCampoMigra := qryInputTransfPlano.FieldByName('NOMEPARAREGRA').AsString
     else Exit;
   end
   else if cTipo = 'C'    // CONFIGTRANSFPLANO
   then begin
     if ( (Trim(edOpcao.Text) = '1' )  and (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger      = 1)  and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 1) ) or
        ( (Trim(edOpcao.Text) <> '1' ) and (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger      = 5)  and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 23) ) 
     then sCodCampoMigra := '303'
     else if (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 43)  and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 22)
     then sCodCampoMigra := '303'
     else if ((qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 12) and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 52)) OR
             ((qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 7)  and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 54)) 
     then sCodCampoMigra := '304'
     else if (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 10) and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 46)
     then sCodCampoMigra := '509'
     else if (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 10) and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 45)
     then sCodCampoMigra := '510'
     else if (Trim(edOpcao.Text) <> '1' ) and (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 10) and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 49)
     then sCodCampoMigra := '512'
     else if (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 3)   and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 3)
     then sCodCampoMigra := 'CPIOP3'
     else if (Trim(edOpcao.Text) <> '1' ) and (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 47)   and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 24)
     then sCodCampoMigra := 'CPIAUTOPAT'
     else Exit;
   end
   else if cTipo = 'N'
   then begin
      sCodCampoMigra := '10106';
   end
   else if cTipo = 'T'
   then begin
      sCodCampoMigra := '10105';
   end;

   if sCodCampoMigra = '' then Exit;

   InserePreviaMigraPlano(sCodCampoMigra, psValorItem, psDescricao);

   if (cTipo = 'B') and
      ( (qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 15) or
        (qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 18) or
        (qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 49) or
        (qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 16)
      )
   then begin
      if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 15
      then sCodCampoMigra := '507'
      else if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 18
      then sCodCampoMigra := '508'
      else if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 49
      then sCodCampoMigra := '508'
      else if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 16
      then sCodCampoMigra := '10107';

      InserePreviaMigraPlano(sCodCampoMigra, psValorItem, psDescricao);

      // CELULAR
      if qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger = 50028
      then begin
         if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 18
         then sCodCampoMigra := '520'
         else if qryTiposTransf.FieldByName('IDTIPOTRANSF').AsInteger = 49
         then sCodCampoMigra := '520';
         InserePreviaMigraPlano(sCodCampoMigra, psValorItem, psDescricao);
      end;
      // SOLICITADO EM 23.12.2002 PARA NAO GRAVAR
{      if sCodCampoMigra = '508'
      then begin
         // Assistido Invalido -> 104
         // Assistido Normal   -> 102
         // Pensionista        -> 103
         if qryParticipanteOrigem.FieldbyName('SITUACAO').AsString = 'FL'
         then begin
            sCodCampoMigra := '103';
            InserePreviaMigraPlano(sCodCampoMigra, psValorItem, psDescricao);
         end
         else begin
            if qryParticipanteOrigem.FieldbyName('SITUACAO').AsString = 'AS'
            then begin
               qryInfBanco.Locate('IDINPUT', 26, []);
               if (Trim(qryInfBanco.FieldByName('VALOR').AsString) = '5') or
                  (Trim(qryInfBanco.FieldByName('VALOR').AsString) = '14')
               then sCodCampoMigra := '104'
               else sCodCampoMigra := '102';
               InserePreviaMigraPlano(sCodCampoMigra, psValorItem, psDescricao);
            end;
         end;
      end;
}
   end
   else if ( cTipo = 'C' )
   then begin
      if ( (Trim(edOpcao.Text) = '1' )  and (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger      = 1)  and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 1) ) or
         ( (Trim(edOpcao.Text) <> '1' ) and (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger      = 5)  and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 23) ) 
      then sCodCampoMigra := '506'
      else if (qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 43)  and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 22)
      then sCodCampoMigra := '506'
      else if ((qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 12) and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 52)) OR
              ((qryConfigTransf.FieldByName('IDTIPOTRANSF').AsInteger = 7)  and (qryConfigTransf.FieldByName('IDCONFIG').AsInteger = 54))
      then sCodCampoMigra := '505'
      else Exit;

      InserePreviaMigraPlano(sCodCampoMigra, psValorItem, psDescricao);
   end
   else if cTipo = 'N'
   then begin
      InserePreviaMigraPlano('30202', psValorItem, psDescricao);
      InserePreviaMigraPlano('517',   psValorItem, psDescricao);
   end
   else if cTipo = 'T'
   then begin
      InserePreviaMigraPlano('30201', psValorItem, psDescricao);
      InserePreviaMigraPlano('516',   psValorItem, psDescricao);
   end;
end;

procedure TfrmEventoTransfPlanoNOVO.InserePreviaMigraPlano ( psCodCampoMigra, psValorItem, psDescricao : string ) ;
begin
   if qryPreviaMigra.Locate('CODCAMPOMIGRA', psCodCampoMigra,[])
   then begin
      qryPreviaMigra.Edit;
      if (psValorItem <> 'S')               and
         (psValorItem <> 'N')               and
         (psCodCampoMigra <> 'DATATRANSF')  and
         (psCodCampoMigra <> 'SITUACAO')    and
         (psCodCampoMigra <> 'IDBENEF')     and
         (psCodCampoMigra <> 'DATABASE')
      then qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat  := StrToFloat(ClienteNumero(psValorItem))
      else qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString := psValorItem;
      qryPreviaMigra.FieldByName('IDEVENTOGERADOR').AsString   := sIdEventoGerador; { Augusto 14/07/005 }
      qryPreviaMigra.Post;
   end
   else begin
      qryPreviaMigra.Append;
      qryPreviaMigra.FieldByName('IDPESSJUR').AsInteger    := qryParticipanteOrigem.FieldByName('IDPESSJUR').AsInteger;
      qryPreviaMigra.FieldByName('IDPLANOPREV').AsInteger  := qryParticipanteOrigem.FieldByName('IDPLANOPREV').AsInteger;
      qryPreviaMigra.FieldByName('IDPESSOA').AsInteger     := qryParticipanteOrigem.FieldByName('IDPESSOA').AsInteger;
      qryPreviaMigra.FieldByName('SEQPROPOSTA').AsInteger  := qryParticipanteOrigem.FieldByName('SEQPROPOSTA').AsInteger;
      qryPreviaMigra.FieldByName('IDPLANODEST').AsInteger  := qryPlanoDestino.FieldByName('IDPLANOPREV').AsInteger;
      if (psValorItem <> 'S')              and
         (psValorItem <> 'N')              and
         (psCodCampoMigra <> 'DATATRANSF') and
         (psCodCampoMigra <> 'SITUACAO')   and
         (psCodCampoMigra <> 'IDBENEF')    and
         (psCodCampoMigra <> 'DATABASE')
      then qryPreviaMigra.FieldByName('VALORAMIGRAR').AsFloat  := StrToFloat(ClienteNumero(psValorItem))
      else qryPreviaMigra.FieldByName('VALORAMIGRAR').AsString := psValorItem;

      qryPreviaMigra.FieldByName('DESCRICAO').AsString     := psDescricao;
      qryPreviaMigra.FieldByName('CODCAMPOMIGRA').AsString := psCodCampoMigra;

      qryPreviaMigra.FieldByName('IDEVENTOGERADOR').AsString   := sIdEventoGerador; { Augusto 14/07/005 }
      qryPreviaMigra.Post;
   end;
end;

procedure TfrmEventoTransfPlanoNOVO.dtDataREFEnter(Sender: TObject);
begin
  inherited;
  bAlterouData := True;
end;

function TfrmEventoTransfPlanoNOVO.BuscaTipoMigracao(iIdPessJur, iIdPlano, iIdPessoa, iSeqProposta : LongInt;
                                                     sDataRef: string): String;
Var
  sSQL : String;
begin

  Result := '';
  sSQL := 'SELECT S.IDEVENTOGERADOR '+
          ' FROM SIMULAMIGRACAO S '+
          ' WHERE S.IDPESSJUR    = '+ IntToStr(iIdPessJur) +
          ' AND   S.IDPLANOPREV  = '+ IntToStr(iIdPlano) +
          ' AND   S.IDPESSOA     = '+ IntToStr(iIdPessoa) +
          ' AND   S.SEQPROPOSTA  = '+ IntToStr(iSeqProposta) +
          ' AND   S.ANOMESREF    = '''+Copy(sDataRef,7,4)+'/'+Copy(sDataRef,4,2)+'''';

  If FazQuery(QryAux,sSQL) Then
  Begin
    If (QryAux.FieldByName('IDEVENTOGERADOR').AsString = '62') Then
    Begin
      Result := '2';
    End
    Else
    Begin
      Result := '1';
    End;
  End;

end;

end.



SUBSTITUIU NO MONTASELECT A CLAUSULA DO IDPLANOPREV
PARTPREVPLAN.FLGDESATIVADO = 0

