// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : VerificaeGravaSituacoes
//  Data       : 05/06/2006
//  Pendencia  : 22520
//  Descrição  : Salvar na Partprevplan nova situação no plano
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Tela
//  Data       : 21.07.2004
//  Pendencia  : ------
//  Descrição  : Padronizacao da tela com a tela de afastamento com manutencao
//------------------------------------------------------------------------------
// Rotinas     : VerificaEstadoEvento ( qryEvento )
// Autor(a)    : Camille
// Pendência   : 17305
// Data        : 17.06.2004
// Descricao   : Permitir registrar um evento de afastamento com manutenção para quem
//               já teve esse evento registrado em uma outra data. Para isto, alterei
//               a tela para verificar apenas se o ULTIMO evento registrado é da mesma
//               categoria que o evento que está sendo registrado nesse momento
//------------------------------------------------------------------------------
// Rotinas     : bbtnProcurarClick, GravaEVENTOSPREV, LimpaCampos e bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 16427
// Data        : 05/05/2004
// Descricao   : Criacao do campo Data de Requerimento na EVENTOSPREV
//------------------------------------------------------------------------------
// Rotina      : ValidaBeneficioAnterior
// Autor(a)    : Camille
// Pendência   : 16616
// Data        : 26.04.2004
// Descricao   : Criacao de variavel para dizer se encerrou ou nao beneficio
//               para que os eventos possam saber se devem ou não encerrar
//               as contribuicoes.
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Gleyber
// Data        : 25/03/2004
// Pendência   : 16354
// Alteração   : Atribuindo valor à variável sIdTitular do componente ConsPart.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 30/10/2003
// Descrição   : Acertos diversos
//------------------------------------------------------------------------------
// Autor(a)    : Ricardo Vigorito
// Data        : 15/10/2003
// Pendência   : 15143  - 15145
// Descrição   : Inclusão da chamada da rotina RODAPADRAOMOVRESERVA
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/10/2003
// Alteração   : bbtnConfirmarClick
// Pendência   : 14938
// Descrição   : Inclusão da rotina de impressão da carta do evento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------

unit FEventoAfastSemRemun;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, TREdit, URegra, TB97Tlbr, UConsPart, Mask, MskEdDlg,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook;

type
  TfrmEventoAfastSemRemun = class(TfrmOkCancelar)
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
    qrySitFunc: TwwQuery;
    pnlInformacao: TPanel;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    qryAux: TwwQuery;
    Label10: TLabel;
    dtAfastIni: TCMDateTimePicker;
    lblValores: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    qrySitPart: TwwQuery;
    dblkpcmbSitPart: TwwDBLookupCombo;
    dtAfastFim: TCMDateTimePicker;
    regCalculo: TRegra;
    qryRegra: TwwQuery;
    qryGrava: TwwQuery;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    Label5: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qrySitPlanoPrev: TwwQuery;
    qryEvento: TwwQuery;
    MontaSelectPart: TMontaSelect;
    dtRequerimento: TCMDateTimePicker;
    Label16: TLabel;
    pnlTempoAfast: TPanel;
    Panel1: TPanel;
    Label4: TLabel;
    edTempoNaoCred: TEdit;
    Label13: TLabel;
    Label7: TLabel;
    edTempoAfast: TEdit;
    Label15: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtAfastIniExit(Sender: TObject);
    procedure dtAfastFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean; 
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6                 : real;
    iIdEventoPrev: integer;

    sFlgIntPartAntes,
    sInscricaoData,
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    bAltera: boolean;
    sEstadoEvento: string;
    sResultadoRegra, sMensagem: string;
    function  ExecutaRegraConcessao : boolean;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure VerificaEstadoEvento;
    procedure LimpaCampos;
    procedure ExecutaRegraTempoAfast;
    function  VerificaCampos: boolean;
    procedure GravaDados;
  public
    { Public declarations }
  end;

var
  frmEventoAfastSemRemun: TfrmEventoAfastSemRemun;
 {Evento Temporário}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados, FCadContribParticipante,
  UMovReserva, FMostraContribuicoes, UEventos,
  UFuncoesUteis, UModulo, FCadOpcoesElegivel, UIntegraBack, UBeneficio,
  UParticipante, USistema;

{$R *.DFM}

procedure TfrmEventoAfastSemRemun.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';
  bEncerrou := False; 
end;

procedure TfrmEventoAfastSemRemun.FormShow(Sender: TObject);
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

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 

  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoAfastSemRemun.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     // Carrega Campos
     sIdPessoa          := MontaSelectPart.ValoresChave[0];
     sIdPessJur         := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
     sIdSitFunc         := MontaSelectPart.ValoresChave[16];
     sIdSitPart         := MontaSelectPart.ValoresChave[17];
     sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[18];
     sSeqProposta       := MontaSelectPart.ValoresChave[19];
     edNome.Text        := MontaSelectPart.ValoresChave[3];
     edMatricula.Text   := MontaSelectPart.ValoresChave[4];
     edPatro.Text       := MontaSelectPart.ValoresChave[5];
     edPlano.Text       := MontaSelectPart.ValoresChave[6];
     edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
     edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
     edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
     edInscNumero.Text  := MontaSelectPart.ValoresChave[12];
     edTempoNaoCred.Text:= MontaSelectPart.ValoresChave[20];  
     sInscricaoData     := MontaSelectPart.ValoresChave[13];

     pnlInformacao.Enabled := True;
     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;
     

     ConsPart1.sIdPessoa    := sidpessoa;
     ConsPart1.sIdTitular   := sIdPessoa;   
     ConsPart1.sSeqProposta := sseqproposta;
     ConsPart1.sIdPlanoprev := sidplanoprev;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur := sidpessjur;
     ConsPart1.Enabled    := true;
     bbtnOpcoes.enabled   := true;

     // Verifica se o evento já foi registrado
     VerificaEstadoEvento;

     if sEstadoEvento = 'NAO REGISTRADO'
     then begin // Verifica se pode Inserir
        if not PodeRegistrarEvento(qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                   sFlgInterno,sIdSitFunc,sIdSitPart,sIdSitPlanoPrev,sMotivoEvento)
        then begin
           MsgDlg('Esse Evento não pode ser registrado. Motivo : '+sMotivoEvento,'Informação',mtInformation,[mbOk,mbHelp],0);
           LimpaCampos;
           TiraSql(qryAux);
           exit;
        end;

        bAltera := False;
        dtAfastIni.Text         := '';
        dtAfastFim.Text         := '';
        dblkpcmbSitFunc.Text    := '';
        dblkpcmbSitPart.Text    := '';
        edTempoAfast.Text       := '';

        if dblkpcmbSitFunc.LookupTable.RecordCount >= 1
        then dblkpcmbSitFunc.Text      := dblkpcmbSitFunc.LookupTable.fieldbyname('descricao').asString
        else dblkpcmbSitFunc.Text      := '';
        dblkpcmbSitFunc.PerformSearch;

        if dblkpcmbSitPart.LookupTable.RecordCount >= 1
        then dblkpcmbSitPart.Text      := dblkpcmbSitPart.LookupTable.fieldbyname('descricao').asString
        else dblkpcmbSitPart.Text      := '';
        dblkpcmbSitPart.PerformSearch;

        if dblkpcmbSitPlanoPrev.LookupTable.RecordCount >= 1
        then dblkpcmbSitPlanoPrev.Text := dblkpcmbSitPlanoPrev.LookupTable.fieldbyname('descricao').asString
        else dblkpcmbSitPlanoPrev.Text := '';
        dblkpcmbSitPlanoPrev.PerformSearch;

        
     end
     else begin

        bAltera := True; 

        if sEstadoEvento = 'REGISTRADO'
        then begin// Pode Alterar
           MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
           TiraSql(qryAux);
           bAltera := True;
           dtAfastIni.Date      := StrToDate(MontaSelectPart.ValoresChave[14]);
           if Trim(MontaSelectPart.ValoresChave[15]) <> ''
           then dtAfastFim.Date    := StrToDate(MontaSelectPart.ValoresChave[15]);

           dtAfastIni.SetFocus;
           ExecutaRegraTempoAfast;
        end
        else if sEstadoEvento = 'EFETIVADO'
             then begin // Não Pode Alterar
                MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                TiraSql(qryAux);
                dtAfastIni.Date      := StrToDate(MontaSelectPart.ValoresChave[14]);
                if Trim(MontaSelectPart.ValoresChave[15]) <> ''
                then dtAfastFim.Date    := StrToDate(MontaSelectPart.ValoresChave[15]);

                ExecutaRegraTempoAfast;
                pnlInformacao.Enabled := False;
                bbtnConfirmar.Enabled := False;
                bbtnCancelar.Enabled  := False;
             end;
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

  
  if  montaselectpart.retornouvalor AND (sEstadoEvento = 'NAO REGISTRADO') then
     begin
       dblkpcmbSitFunc.text:='';
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitPart.text:='';
     end;

end;

procedure TfrmEventoAfastSemRemun.VerificaEstadoEvento;
begin
   
   with qryEvento do
   begin
      Close;
      ParamByName('FlgInterno').AsString   := sFlgInterno;
      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      Open;

      if IsEmpty
      then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
      else if FieldByName('FLGEFETIVADO').AsString = '0'
           then begin
              sEstadoEvento := 'REGISTRADO'; // Pode Alterar
              sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
           end
           else sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
   end;


end;

procedure TfrmEventoAfastSemRemun.bbtnConfirmarClick(Sender: TObject);
var
  sMsgErro,
  sMesRef, 
  sIdEvento, sNomeTitular: string;
  bFlgIntContab, bSuspendeContribuicao: boolean;
begin
  inherited;

  bSuspendeContribuicao := False;

  if not VerificaCampos then Exit;

  if sResultadoRegra = 'False' then  
     begin
         MsgDlg(sMensagem + #13+'O evento não pode ser efetivado. ','Informação',mtInformation,[mbOk,mbHelp],0);
         Exit;
     end;

     if Trim(dblkpcmbSitFunc.Text) = '' then
        begin
             MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
             dblkpcmbSitFunc.SetFocus;
             Exit;
        end;

  if Trim(dblkpcmbSitPart.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  if (Trim(dblkpcmbSitPlanoPrev.Text) = '')  then
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;

  
  if StrToDate(FormatDateTime('DD/MM/YYYY', dtAfastIni.Date)) < StrToDate(sInscricaoData)  // FUNCEF
  then begin
     MsgDlg('A data do afastamento deve ser maior ou igual a data de inscrição.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtAfastIni.SetFocus;
     TiraSql(qryAux);
     Exit;
  end;

  
  If Trim(dtRequerimento.Text) = ''
   Then Begin
     MsgDlg('A data do requerimento deve ser preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     dtRequerimento.SetFocus;
     Exit;
   End;
  

  if not AtualizaFLGPossuiEmprestimo ( qryAux,
                                       StrToInt(sIdPessJur),
                                       StrToInt(sIdPlanoPrev),
                                       StrToInt(sIdPessoa) ,
                                       StrToInt(sSeqProposta))
  then begin
     MsgDlg('Erro ao verificar se participante possui empréstimo. ','Erro',mtError,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end;


  if not ExecutaRegraConcessao
  then begin
     MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end;

  if ExistemContribuicoesPeriodo ( qryAux ,
                                   StrToInt(sIdPessJur),
                                   StrToInt(sIdPlanoPrev),
                                   StrToInt(sIdPessoa),
                                   StrToInt(sSeqProposta),
                                   dtAfastIni.Text, dtAfastFim.Text)
  then begin
     MsgDlg('Existem contribuições pagas no período informado como afastamento. Verifique.','Informação',mtInformation,[mbOk],0);
     Exit;
  end;


  if not bAltera then
     VerificaeGravaSituacoes;

  GravaEVENTOSPREV;

 {Grava Data de Inicio Afastamanto, Data de Fim Afastamento}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET DATAINICIOAFAST = To_Date(''' + Trim(dtAfastIni.Text) + ''',''dd/MM/yyyy'')' + ',' +
                 '                      DATAFIMAFAST    = To_Date(''' + Trim(dtAfastFim.Text) + ''',''dd/MM/yyyy'')' +
                 ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '       IDPESSOA  = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;


  // Grava o Histórico de Contribuições por Evento Gerador
  if not bAltera
  then begin
     // Só suspende as contribuições, se o evento não tiver acabado
     if (Date < StrToDate(FormatDateTime('DD/MM/YYYY', dtAfastFim.Date)))
     then bSuspendeContribuicao := True
     else bSuspendeContribuicao := False;

     sMesRef := Copy(dtAfastIni.Text,7,4)+'/'+Copy(dtAfastIni.Text,4,2);

     GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), sIdPlanoPrev, sIdEventoGerador, '', sIdPessoa, sIdPessJur, sSeqProposta, '','',
                                  dtAfastIni.Text,bSuspendeContribuicao, qryAux, qryGrava,sIdPlanoPrev);
  end;


  {Só suspende as contribuições, se o evento não tiver acabado}
  if bEncerrou then bSuspendeContribuicao := False; 

  if bSuspendeContribuicao then
     if not SuspendeContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtAfastIni.Text, dtAfastFim.Text,
                                  edMatricula.Text, sIdSitPart, qryAux, qryGrava, sFlgInterno,
                                  sFlgIntPartAntes) then 
        begin
             MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
             dtmBasedados.dbBaseDados.RollBack;
             LimpaCampos;
             dtmBaseDados.dbBaseDados.StartTransaction;
             exit;
        end;

  if not bAltera then
     begin
          if not AssociaNovasContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtAfastIni.Text, dtAfastFim.Text,
                                           edMatricula.Text, qrySitPart.FieldByName('IDSITPART').AsString, '', False, True,
                                           False,
                                           qryAux, qryGrava, sFlgInterno,iIdEventoPrev,'') then 
             begin
                  MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
                  dtmBasedados.dbBaseDados.RollBack;
                  LimpaCampos;
                  dtmBaseDados.dbBaseDados.StartTransaction;
                  exit;
             end;
          MostraContribuicoes(IntToStr(iIdEventoPrev), edNome.Text, edPatro.Text, edPlano.Text);
          if not ValidaBeneficioAnterior ( qryAux,
                                           StrToInt(sIdPessJur),
                                           StrToInt(sIdPlanoPrev),
                                           StrToInt(sIdPessoa),
                                           StrToInt(sSeqProposta),
                                           StrToInt(sIdEventoGerador),
                                           False,
                                           dtAfastIni.Text,
                                           sMsgErro,
                                           bEncerrou) 
          then begin
             MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
             Exit;
          end;
     end;

  GravaDados;

  sIdEvento     := sIdEventoGerador;
  sNomeTitular  := edNome.Text;
  bFlgIntContab := (IntegraBack.Contabilidade = 'S');


  MoveReserva(sIdEvento, sIdPessoa, sSeqProposta, sNomeTitular, '', qryAux, regCalculo, sMsgErro,
              sIdPessJur, sIdPlanoPrev, '', sIdPessJur, sIdPlanoPrev, '', bFlgIntContab,'',StrToDate(dtAfastIni.Text),
              '', '', 'F', '', 0, 0, StrToDate(dtAfastIni.Text),'');

  
  // Adicionando Log Padrao
  Try
    If Not Sistema.GravaLogOperacoes(self.Caption) Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;
  


  if not RODAPADRAOMOVRESERVA
        (  StrToInt(sIdPessJur)  ,
           StrToInt(sIdPlanoPrev) ,
           StrToInt(sIdPessoa) ,
           1,
          -1,
          StrToint(sIdEventoGerador),
          StrToInt(sIdPessJur)  ,
          strtoInt(sIdPlanoPrev) ,
          sFlgInterno,
          dtAfastIni.Text,
          sMsgErro,
          -1  ,
           'O',
           ' ' )
        then begin
         
           MsgDlg('Ocorreu um erro na execução do Padrão de Movimentação de Reserva ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
       
           Exit;
    end;
 

  dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  LimpaCampos;

  TiraSql(qryAux);

  
  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);
  

  dtmBaseDados.dbBaseDados.StartTransaction;
end;


procedure TfrmEventoAfastSemRemun.VerificaeGravaSituacoes;
begin
 {Se o Evento não requer Benefício, grava as situações de Imediato, e já grava o evento como efetivado}
  sFlgEfetivado    := '1';
  sDataEfetivado   := ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')';

  sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';

 {Grava nova Situação do Participante na Patrocinadora}
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = ''' + qrySitFunc.FieldByName('IDSITFUNC').AsString +''''+
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

 {Grava nova Situação do Participante na Fundação}
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE PARTPREVPLAN '+
                   ' SET IDSITPART = ' + qrySitPart.FieldByName('IDSITPART').AsString+','+
                   '     IDSITPLANOPREV = ' + qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString+','+ //P.RAMOS-05/06/2006-PEND.22520
                   '     TEMPOAFASTADO = '+OraNumero(edTempoAfast.Text)+
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
end;

procedure TfrmEventoAfastSemRemun.GravaEVENTOSPREV;
var sDataVolta : string;
begin
  if Trim(dtAfastFim.Text) = '' 
  then sDataVolta := ' NULL '
  else sDataVolta := ' TO_DATE('''+Trim(dtAfastFim.Text)+''', ''DD/MM/YYYY'')' ;

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
                         '                         DATAEFETIVADO, FLGEFETIVADO,DATAVOLTA, INSCRICAONUMERO, DATAREQUERIMENTO) ' + 
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtAfastIni.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                      sIdSitFunc  + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                      qrySitFunc.FieldbyName('IDSITFUNC').AsString  + ',' +
                                      qrySitPart.FieldbyName('IDSITPART').AsString + ',' + sIdSitPlanoPrev + ',' +
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                      sDataEfetivado + ',' + sFlgEfetivado+','+sDataVolta+','+OraNumero(edInscNumero.Text)+ ', ' +
                                      'TO_DATE(''' + DateToStr(dtRequerimento.Date) + ''',''DD/MM/YYYY'') )'); 
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
  else
     begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAEVENTO   = To_Date(''' + Trim(dtAfastIni.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAVOLTA    = '+sDataVolta+ ','+
                         '                        DATAREQUERIMENTO = TO_DATE(''' + DateToStr(dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' + 
                         '                        IDSITFUNCATUAL  = ' + sIdSitFunc + ',' +
                         '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                         '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                         '                        IDSITFUNCNOVO   = ' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ',' +
                         '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANONOVO  = ' + sIdSitPlanoPrev +
                         ' WHERE SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                         '       IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                         '       IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                         '       IDPESSOA        = ' + sIdPessoa    + ' AND ' +
                         '       IDEVENTOGERADOR = ' + sIdEventoGerador );
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

procedure TfrmEventoAfastSemRemun.GravaDados;
var
  iTempoNaoCreditado: integer;
begin
 {Seleciona TEMPONAOCREDITADO}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT TEMPONAOCREDITADO FROM ELEGPATRO ' +
                 ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '       IDPESSOA  = ' + sIdPessoa);
  qryAux.Open;
  
  If Trim(edTempoAfast.Text) = '' Then
    iTempoNaoCreditado := qryAux.FieldByName('TEMPONAOCREDITADO').AsInteger
  Else
    iTempoNaoCreditado := qryAux.FieldByName('TEMPONAOCREDITADO').AsInteger +
                          StrToInt(edTempoAfast.Text);
  

 {Adiciona em ELEGPATRO Tempo Acumulado de Servico}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET TEMPONAOCREDITADO = ' + IntToStr(iTempoNaoCreditado) +
                 ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '       IDPESSOA  = ' + sIdPessoa);
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

procedure TfrmEventoAfastSemRemun.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
     begin
         with dtmBasedados.dbBaseDados do
             if InTransaction then
                RollBack;

             LimpaCampos;
             dtmBaseDados.dbBaseDados.StartTransaction;
     end;
end;

procedure TfrmEventoAfastSemRemun.dtAfastIniExit(Sender: TObject);
begin
  inherited;
  if Trim(dtAfastIni.Text) = ''
  then Exit;

  if Trim(dtAfastFim.Text) = ''
  then Exit;

  if StrToDate(dtAfastFim.Text) < StrToDate(dtAfastIni.Text)
  then begin
     MsgDlg('A Data Final do Afastamento deve ser maior que a Data Inicial.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  ExecutaRegraTempoAfast;

  
  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtAfastIni.Date;
  

end;

procedure TfrmEventoAfastSemRemun.dtAfastFimExit(Sender: TObject);
begin
  inherited;
  if Trim(dtAfastFim.Text) = '' then Exit;

  if StrToDate(dtAfastFim.Text) < StrToDate(dtAfastIni.Text) then
     begin
          MsgDlg('A Data Final do Afastamento deve ser maior que a Data Inicial.','Erro',mtError,[mbOk,mbHelp],0);
          Exit;
     end;

  ExecutaRegraTempoAfast;
end;

procedure TfrmEventoAfastSemRemun.ExecutaRegraTempoAfast;
var
  sSql, sValorRegra: string;
  iNumMesesAux,
  iPartDecAux  : double;
  iPartIntAux  : longint;
  sNumMesesAux : string;
begin

   if (Trim(dtAfastIni.Text) = '') or (Trim(dtAfastFim.Text) = '')
   then begin
      edTempoAfast.Text := '0';
      Exit;
   end;

   try
     iNumMesesAux := CalculaDifMesesDec(qryAux, Trim(dtAfastIni.Text),Trim(dtAfastFim.Text) );
     sNumMesesAux := FloatToStr(iNumMesesAux);

     if Pos(',', sNumMesesAux ) > 0
     then begin
        iPartIntAux  := StrToInt  ( Copy(sNumMesesAux, 1, Pos(',',sNumMesesAux) - 1));
        iPartDecAux  := StrToFloat( '0'+DecimalSeparator+Copy(sNumMesesAux, Pos(',',sNumMesesAux)+1, Length(sNumMesesAux ) - 1));
        iPartDecAux  := StrToFloat(FormatFloat('#0.00',iPartDecAux));

     end
     else begin
        iPartIntAux  := Trunc( iNumMesesAux );
        iPartDecAux  := 0;
     end;

     // Comparar se a parte decimal é maior ou igual que 0.48 - que representa dezesseis dias. Se sim,
     // somar 1 ao numero de meses
     if iPartDecAux >= 0.47999
     then inc(iPartIntAux);
     edTempoAfast.Text :=  IntToStr(iPartIntAux);
   except
      MsgDlg('Erro ao calcular o tempo de afastamento.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

  sResultadoRegra := 'True';

  // Executar Regra de Validação do Tempo de Afastamento
  // Passar para a regra a Data Inicial e Final do Afastamento,
  // e o Tempo Total Acumulado de Afastamento
  sSql := ' SELECT ' + '''' + dtAfastIni.Text + '''' + ' AS DATAINICIOAFAST, ' +
          '''' + dtAfastFim.Text + '''' + ' AS DATAFIMAFAST, ' +
          edTempoAfast.Text+' AS TEMPOAFAST,    '+
          edTempoAfast.Text+' AS TEMPOAFASTADO, '+
          ' NVL(EL.TEMPONAOCREDITADO,0) TEMPONAOCREDITADO, PLP.IDREGRAVALIDAAFA ' +  // rosana - 20/09/99
          ' FROM  PLANPREVPATRO PLP, ELEGPATRO EL ' +
          ' WHERE PLP.IDPESSJUR   = ' + sIdPessJur   + ' AND '  +
          '       PLP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND '  +
          '       EL.IDPESSJUR    = PLP.IDPESSJUR AND ' +
          '       EL.IDPESSOA     = ' + sIdPessoa;
  qryRegra.Close;
  qryRegra.Sql.Clear;
  qryRegra.Sql.Add(sSQL);
  try
     qryRegra.Open;
  except
     on E:EDBEngineError do
     begin
         MostrarErro(E);
         Exit;
     end;
  end;

  
  if Trim(qryRegra.FieldByName('IDREGRAVALIDAAFA').AsString) <> ''
  then begin
      regCalculo.QueryIn  := qryRegra;
      regCalculo.RuleName := qryRegra.FieldByName('IDREGRAVALIDAAFA').AsString;

      try
         regCalculo.Execute;
      except
         MsgDlg('Erro na Execução da Regra de Validação do Tempo de Afastamento.','Informação',mtInformation,[mbOk,mbHelp],0);
         sResultadoRegra := 'False';
         sMensagem := 'Erro na Execução da Regra de Validação do Tempo de Afastamento.';
         TiraSql(qryAux);
         Exit;
      end;

      
      sValorRegra := Trim(UpperCase(regCalculo.Result));
      if (sValorRegra = 'FALSE') or (sValorRegra = 'FALSO')
      then begin
         MsgDlg(' A Regra de Validação do Tempo de Afastamento retornou "Falso" => '+
                ' Tempo de Afastamento inválido. ','Informação',mtInformation,[mbOk,mbHelp],0);
         TiraSql(qryAux);
         edTempoAfast.Text := '';
         sResultadoRegra   := 'False';
         sMensagem := 'Tempo de Afastamento inválido.';
         Exit;
      end;
  end;
end;

function TfrmEventoAfastSemRemun.VerificaCampos: boolean;
begin
  Result := False;

  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;

  if Trim(dtAfastIni.Text) = '' then
     begin
          MsgDlg('A Data Inicial do Afastamento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtAfastIni.SetFocus;
          Exit;
     end;

  if Trim(dtAfastFim.Text) = '' then
     begin

       Result := True;
       Exit; 
     end;


  if StrToDate(dtAfastFim.Text) < StrToDate(dtAfastIni.Text) then
     begin
          MsgDlg('A Data Final do Afastamento deve ser maior que a Data Inicial.','Erro',mtError,[mbOk,mbHelp],0);
          dtAfastFim.SetFocus;
          Exit;
     end;

  Result := True;
end;

procedure TfrmEventoAfastSemRemun.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
  dtAfastIni.Text    := '';
  dtAfastFim.Text    := '';
  dblkpcmbSitFunc.Text := '';
  dblkpcmbSitPart.Text := '';
  edTempoAfast.Text    := '';
  dtRequerimento.Text  := '';  
  dblkpcmbSitPlanoPrev.Text := '';

  bbtnProcurar.SetFocus;



  ConsPart1.Enabled    := False;
  bbtnOpcoes.enabled   := False;
end;

procedure TfrmEventoAfastSemRemun.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

procedure TfrmEventoAfastSemRemun.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  inherited;
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3,  EL.VALORBASE4, EL.VALORBASE5, EL.VALORBASE6, '+
                 ' PATRO.NUMOPCOES    , '+
                 ' PATRO.NOMEVALORBASE1    ,  PATRO.NOMEVALORBASE2   ,  PATRO.NOMEVALORBASE3, '+
                 ' PATRO.FLGOBRIGAOP1    , PATRO.FLGOBRIGAOP2  ,  PATRO.FLGOBRIGAOP3  , '+
                 ' PATRO.FLGEDITAOP1    , PATRO.FLGEDITAOP2    ,  PATRO.FLGEDITAOP3    , '+
                 ' PATRO.IDREGRACALCOP1   ,  PATRO.IDREGRACALCOP2  ,  PATRO.IDREGRACALCOP3  ,  '+
                 ' PATRO.IDREGRAVALIDAOP1  ,   PATRO.IDREGRAVALIDAOP2  ,  PATRO.IDREGRAVALIDAOP3, '+
                 ' PATRO.NOMEVALORBASE4    ,  PATRO.NOMEVALORBASE5   ,  PATRO.NOMEVALORBASE6, '+
                 ' PATRO.FLGOBRIGAOP4    , PATRO.FLGOBRIGAOP5  ,  PATRO.FLGOBRIGAOP6  , '+
                 ' PATRO.FLGEDITAOP4    , PATRO.FLGEDITAOP5    ,  PATRO.FLGEDITAOP6    , '+
                 ' PATRO.IDREGRACALCOP4   ,  PATRO.IDREGRACALCOP5  ,  PATRO.IDREGRACALCOP6  ,  '+
                 ' PATRO.IDREGRAVALIDAOP4  ,   PATRO.IDREGRAVALIDAOP5  ,  PATRO.IDREGRAVALIDAOP6 '+
                 ' FROM ELEGPATRO EL, PATRO ' +
                 ' WHERE EL.IDPESSJUR   = ' +sidpessjur+ ' AND '+
                 ' EL.IDPESSOA = '+sidpessoa+' AND '+
                 ' EL.IDPESSJUR = PATRO.IDPESSOA ' );
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
     rOpcao4 := 0;
     rOpcao5 := 0;
     rOpcao6 := 0;
  end
  else begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;

     if qryAux.FieldByName('VALORBASE4').AsString <> ''
     then rOpcao4 := qryAux.FieldByName('VALORBASE4').AsFloat
     else rOpcao4 := 0;

     if qryAux.FieldByName('VALORBASE5').AsString <> ''
     then rOpcao5 := qryAux.FieldByName('VALORBASE5').AsFloat
     else rOpcao5 := 0;

     if qryAux.FieldByName('VALORBASE6').AsString <> ''
     then rOpcao6 := qryAux.FieldByName('VALORBASE6').AsFloat
     else rOpcao6 := 0;
  end;

  bPodeAlterarOpcoes := True;

  if not qryAux.IsEmpty
  then begin // Opcoes já cadastradas
     bOpcoesExistem := True;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(edNome.text,  edPatro.text,
                                 qryaux.FieldByName('NOMEVALORBASE1').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE2').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE3').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE4').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE5').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE6').AsString,
                                 qryaux.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 rOpcao4, rOpcao5, rOpcao6, bPodeAlterarOpcoes,
                                 qryaux.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP4').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP5').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP6').AsInteger,
                                 strtoint(sidpessjur),strtoint(sidpessoa),
                                 '','');
     frmCadOpcoesElegivel.Free;
  end
  else begin // Cadastrar Opcoes
     bOpcoesExistem := False;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(edNome.text, edPatro.text,
                                 qryaux.FieldByName('NOMEVALORBASE1').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE2').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE3').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE4').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE5').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE6').AsString,
                                 qryaux.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 rOpcao4, rOpcao5, rOpcao6, bPodeAlterarOpcoes,
                                 qryaux.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP4').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP5').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP6').AsInteger,
                                 strtoint(sidpessjur), strtoint(sidpessoa),
                                 '', '');

     frmCadOpcoesElegivel.Free;
  end;

  if ((rOpcao1 >= 0) or (rOpcao2 >= 0) or (rOpcao3 >= 0)
      or (rOpcao4 >= 0) or (rOpcao5 >= 0) or (rOpcao6 >= 0)) and
     (frmCadOpcoesElegivel.ModalResult = mrok)
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE ELEGPATRO SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1) + ',' +
                    '                      VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2) + ',' +
                    '                      VALORBASE3 = ' + FormatFloat('#0.00000',rOpcao3) + ',' +
                    '                      VALORBASE4 = ' + FormatFloat('#0.00000',rOpcao4) + ',' +
                    '                      VALORBASE5 = ' + FormatFloat('#0.00000',rOpcao5) + ',' +
                    '                      VALORBASE6 = ' + FormatFloat('#0.00000',rOpcao6) +
                    ' WHERE IDPESSJUR   = ' + sidpessjur   + ' AND ' +
                    '       IDPESSOA    = ' + sidpessoa   + ' ' );
     DecimalSeparator := cAuxSeparador;
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

function TfrmEventoAfastSemRemun.ExecutaRegraConcessao : boolean;
var
  sIdRegra,
  sDataFinal,
  sUltMesPreparo,
  sSQL: string;
  bErro : boolean;
begin
  Result := False;

  // Procurar data final de manutenção, caso o particip venha de manutencao (PDV)
  sDataFinal := dtAfastFim.Text;

  sUltMesPreparo := CalcUltMesContribuicao(StrToInt(sIdPessJur),
                                           StrToInt(sIdPlanoPrev),
                                           StrToInt(sIdPessoa),
                                           StrToInt(sSeqProposta),-1,
                                           Copy(Trim(dtAfastIni.Text),7,4)+'/'+Copy(Trim(dtAfastIni.Text),4,2),
                                           qryAux);


  // Executar Regra de Concessão de Manutenção - Passa para a Regra os dados do Participante
  sSQL := ' SELECT PLP.IDRGELEGAFAST, PP.IDPESSOA, PP.IDPESSJUR,      PP.IDPLANOPREV, ' +
          '        PP.SEQPROPOSTA,  EL.IDSITFUNC,      EL.IDCARGOEXT,     EL.MATRICULA, '   +
          '        EL.DATAADMISSAO, EL.SALTOTAL,       EL.PARTICIPPREVID, EL.PARTICIPASSIST, ' +
          '        EL.NIVEL,        EL.TEMPOSERVANTERIOR,                 PF.DATANASC,   PF.SEXO, PF.DATAMORTE, ' +
          '        PF.ESTCIVIL,     P.NUMDOCUMENTO,    PP.IDSITPART,      PP.IDSITPLANOPREV, ' +
          '        PP.FLGDEVEPREVIDENC, PP.INSCRICAODATA, PP.DTINICIOINSC,      '+
          ''''+sDataFinal+''' AS DATAFINAL, '+
          '        EL.DATADEMISSAO,  '+
          ''''+Trim(dtAfastIni.Text)+''' AS DATAREF,    '+
          ''''+Trim(dtAfastIni.Text)+''' AS DATAEVENTO, '+
          ''''+sUltMesPreparo+'''      AS ULTMESPREPARO, '+
          '        PP.IDSITPART        AS IDSITPARTATUAL,  '+
          '        PP.IDSITPLANOPREV   AS IDSITPLANOATUAL, '+
          '        EL.IDSITFUNC        AS IDSITFUNCATUAL,  '+
          sIdEventoGerador+' AS IDEVENTOGERADOR, '+
          qrySitFunc.FieldByName('IdSitFunc').AsString+' AS IDSITFUNCNOVO, '+
          qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString+' AS IDSITPLANONOVO, '+
          qrySitPart.FieldByName('IdSitPart').AsString+' AS IDSITPARTNOVO, '+
          qrySitFunc.FieldByName('IdSitFunc').AsString+' AS IDSITFUNCNOVA, '+
          qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString+' AS IDSITPLANONOVA, '+
          qrySitPart.FieldByName('IdSitPart').AsString+' AS IDSITPARTNOVA '+
          ' FROM PARTPREVPLAN PP, ELEGPATRO EL, PLANPREV PL, PESSOAFISICA PF,  ' +
          '      PESSOA P, PLANPREVPATRO PLP ' +
          ' WHERE PP.IDPESSOA    = ' + sIdPessoa    + ' AND ' +
          '       PP.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       PP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       PP.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
          '       EL.IDPESSOA    = PP.IDPESSOA     AND ' +
          '       EL.IDPESSJUR   = PP.IDPESSJUR    AND ' +
          '       PP.IDPLANOPREV = PL.IDPLANOPREV  AND ' +
          '       PP.IDPESSOA    = PF.IDPESSOA     AND ' +
          '       PP.IDPESSOA    = P.IDPESSOA      AND ' +
          '       PP.IDPLANOPREV = PLP.IDPLANOPREV AND ' +
          '       PP.IDPESSJUR   = PLP.IDPESSJUR  ';

  sIdRegra := '';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT IDRGELEGAFAST FROM PLANPREVPATRO '+
                 ' WHERE  IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                 '        IDPLANOPREV = ' + sIdPlanoPrev );
  qryAux.Open;
  if not qryAux.IsEmpty
  then sIdRegra := qryAux.FieldByName('IDRGELEGAFAST').AsString;

  if sIdRegra = ''
  then begin
     Result := True;
     Exit;
  end;

  if not RegraBooleana(sIdRegra, sSQL, bErro )
  then begin
     if bErro
     then begin
        MsgDlg('Erro na Execução da Regra de Elegibilidade do Afastamento.','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSql(qryAux);
        Exit;
     end
     else begin
        MsgDlg('Afastamento não permitido . Motivo : Participante não aprovado pela Regra de Elegibilidade. ','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSql(qryAux);
        Exit;
     end;
     Result := False;
  end
  else Result := True;
end;

end.
