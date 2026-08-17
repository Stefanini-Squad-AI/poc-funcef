// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//***************************************************************************************
//Nº SIG:........... 112877
//Data da Alteração: 25/01/2021
//Responsável......: Edilaine
//Descrição........: Conforme informação prestada pela área de negócio
//                   na solicitação da demanda, remover validação.
//***************************************************************************************
//Nº SIG:........... 82996
//Data da Alteração: 05/04/2019
//Responsável......: Darivaldo Alencar
//Descrição........: Conforme informação prestada pela área de negócio
//                   na solicitação da demanda, remover validação.
//***************************************************************************************
//Nº SIG:........... 78421
//Data da Alteração: 21/12/2018
//Responsável......: Taffarel Sevaybriker
//Descrição........: Erro ao desfazer evento de aposentadoria
//***************************************************************************************
//Nº SIG:........... 70125
//Data da Alteração: 31/07/2018
//Responsável......: Denis Horongoso
//Descrição........: Corrigir erro referente a verificação do campo dataevento
//***************************************************************************************
//Nº SOL:........... 264614
//Nº PPM...........: 1157652
//Data da Alteração: 11/11/2015
//Responsável......: William Santana
//Descrição........: Solicito que seja verificado o erro ao gerar o evento de "RETORNO DE CANCELADO PARA ATIVO"
//***************************************************************************************
//------------------------------------------------------------------------------
// Autor       : Douglas.siqueira
// Data        : 02.02.2012
// Pendência   : SOL 165485/7981 KINTANA 1564446
// Descrição   : Incluir a condição SITPART.FLGINTERNO = 'AT' E 'AS' na query que busca
//               o participante para realizar o evento de Retorno para Ativo.
//------------------------------------------------------------------------------
//Pendência   : SOL 130119 KINTANA 789646
//Responsável : BRUNO AZEVEDO
//Data        : 28/04/2010
//Descrição   : Ratear o valor das devoluções de acordo com o fim da manutenção.
//--------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 06/12/2005
// Pendência   : 20761
// Descrição   : Gravação do campo DATAREADMISSAO da ELEGPATRO
//------------------------------------------------------------------------------
// Autor       : GravaEVENTOSPREV
// Data        : 03/02/2005
// Pendência   : 17459
// Descrição   : Gravar matricula na EVENTOSPREV
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 02.12.2004
// Pendência   : 18203
// Descrição   : Incluir a condição SITPART.FLGINTERNO = 'MS' na query que busca
//               o participante para realizar o evento de Retorno para Ativo.
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 20.09.2004
// Rotina      : InsereNoHistoricoFuncional
// Descrição   : retirei FLGUSOUBONUS da inserção na HISTFUNCPREV
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 31.08.2004
// Pendência   : ------
// Descrição   : inclusão do flginterno MS nas críticas por situação da tela
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 31.08.2004
// Pendência   : ------
// Descrição   : retirada dos campos  CODBONUSTRAB,   FLGUSOUBONUS nos tratamentos da tabela HISTFUNCPREV
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 23.08.2004
// Pendência   : ------
// Descrição   : Passar mataricula para rotina ReativaParticipanteNaPatro
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 20.01.2004
// Pendência   : ------
// Descrição   : Exibir demonstrativo e permitir cancelar evento em seguida
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 20.01.2004
// Pendência   : ------
// Descrição   : Exibir ultimo salario de ativo existente no sistema e permitir
//               que o mesmo seja alterado
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 28.10.2003
// Pendência   : 15519
// Descrição   : Inclusao de tratamento para o caso de haver erro de cadastro
//               Tratamento de não ter insalubridade
//               Retirada dos campos NOMESTEP e VALORSTEP
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 27/10/2003
// Descrição   : Incluí na procura o flginterno MP, para mantidos parciais
//------------------------------------------------------------------------------
// Autor       : Ricardo Vigorito
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
// Rotina      : GravaEVENTOSPREVNovaPatro
// Autor(a)    : Leo
// Data        : 18.10.2002
// Alteração   : implementação da função para gravar o evento de inscrição na
//               patrocinadora nova
// -----------------------------------------------------------------------------
// Rotina      : InsereNoHistoricoFuncional
// Autor(a)    : Leo
// Data        : 18.10.2002
// Alteração   : passagem do nome da patrocinadora nova na inclusão do histórico
//               funcional
// -----------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Leo
// Data        : 18.10.2002
// Alteração   : aviso caso o cargo não esteja preenchido
// -----------------------------------------------------------------------------

unit FEventoRetornoMantidoParaAtivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, TREdit, URegra, TB97Tlbr, Mask, DBCtrls, wwdbedit,
  UConsPart, ComCtrls, IvDictio, IvMulti, IvEMulti, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEventoRetornoMantidoParaAtivo = class(TfrmOkCancelar)
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
    qryAux: TwwQuery;
    lblValores: TLabel;
    MontaSelectPart: TMontaSelect;
    qryGrava: TwwQuery;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    qryPatro: TwwQuery;
    regCalculo: TRegra;
    qryCargoExt: TwwQuery;
    qryTpInsalubri: TwwQuery;
    qryTipoDocPessoa: TwwQuery;
    qryTpBonusTrab: TwwQuery;
    qryRegra: TwwQuery;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    pgctrlEvento: TPageControl;
    tbsInfoGerais: TTabSheet;
    tbsHistFunc: TTabSheet;
    pnlInformacao: TPanel;
    pnlDadosHistFuncional: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dblkpcmbIdCargoExt: TwwDBLookupCombo;
    dblkpcmbCodTpInsalubri: TwwDBLookupCombo;
    dblkpcmbIdDocumento: TwwDBLookupCombo;
    edNumDocumento: TEdit;
    pnlSitAntes: TPanel;
    Label11: TLabel;
    lblPatroAntes: TLabel;
    lblMatriculaAntes: TLabel;
    lblSitFuncAntes: TLabel;
    lblSitPlanoAntes: TLabel;
    lblSitPartAntes: TLabel;
    lblDataAdmAntes: TLabel;
    lblDataDemissAntes: TLabel;
    pnlSitDurante: TPanel;
    Label17: TLabel;
    lblSitFuncDurante: TLabel;
    lblSitPlanoDurante: TLabel;
    lblSitPartDurante: TLabel;
    lblIniManut: TLabel;
    lblFimManut: TLabel;
    pnlSitDepois: TPanel;
    lblMatricula: TLabel;
    Label4: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    edMatricula1: TEdit;
    dtEvento: TCMDateTimePicker;
    dblkpcmbPatro: TwwDBLookupCombo;
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    qrySitPart: TwwQuery;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    Label7: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    Label13: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    dtVolta: TCMDateTimePicker;
    qryEventos: TwwQuery;
    tbsResultado: TTabSheet;
    memResult: TMemo;
    Label19: TLabel;
    reSalarioAtivo: TRealEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dblkpcmbIdDocumentoChange(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure dtVoltaExit(Sender: TObject);
    procedure dtEventoExit(Sender: TObject);
  private
    { Private declarations }
        sEstadoEvento: string;
    iIdEventoPrev: integer;
    sInscricaoData,
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev: string;
    sFlgIntSitFunc, sFlgIntSitPart, sFlgIntSitPlano,
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado, sNomeStep, sValorStep: string;
    bEfetivado,   // informa se o evento foi efetivado
    bRegistrado,  // informa se o evento foi registrado
    bRequerBenef  // informa se o usuario clicou no botao Requerimento de beneficio
                  : boolean;

    dTempoDecorrido, dTempoCalculado, dTempoemMeses: double;
    sDataInicio, sDataFinal, sTEMPOCALCINSALUB: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6                 : real;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;

    function  InsereNoHistoricoFuncional: Boolean;

    procedure ExecutaRegra;
    procedure VerificaEstadoEvento;
    function  GravaTEMPOSERVANTERIOR: boolean;
    function  GravaTEMPOSITESPECIAL: boolean;
    procedure GravaEVENTOSPREVNovaPatro;    
  public
    { Public declarations }
  end;

var
  frmEventoRetornoMantidoParaAtivo: TfrmEventoRetornoMantidoParaAtivo;

 {Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados, FCadContribParticipante,
  FMostraContribuicoes, UEventos, UParticipante,
  UContribuicaoPrev, FAguarde, UModulo, FCadOpcoesElegivel, UBeneficio,
  UFuncoesUteis, USistema, UMovReserva;

{$R *.DFM}

procedure TfrmEventoRetornoMantidoParaAtivo.VerificaEstadoEvento;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT EP.FLGEFETIVADO, EG.IDEVENTOGERADOR ' +
                 ' FROM EVENTOGERADOR EG, EVENTOSPREV EP ' +
                 ' WHERE EG.FLGINTERNO IN ' + '(''TS'', ''ID'', ''IN'')' + ' AND ' +
                 '       EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ' +
                 '       EP.SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                 '       EP.IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                 '       EP.IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                 '       EP.IDPESSOA        = ' + sIdPessoa);
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  if (not(qryAux.IsEmpty)) and (sIdEventoGerador = '352') then //Taffarel - SIG78421
      sEstadoEvento := 'NAO REGISTRADO'
  else begin
  if qryAux.IsEmpty
  then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
  else if qryAux.FieldByName('FLGEFETIVADO').AsString = '0'
       then begin
          sEstadoEvento := 'REGISTRADO'; // Pode Alterar
          sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
       end
       else sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
  end;
end;

procedure TfrmEventoRetornoMantidoParaAtivo.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
end;

procedure TfrmEventoRetornoMantidoParaAtivo.FormShow(Sender: TObject);
begin
  inherited;
  qryPatro.Close;         qryPatro.Open;
  qryCargoExt.Close;      qryCargoExt.Open;
  qryTpInsalubri.Close;   qryTpInsalubri.Open;
  
  qrySitFunc.Close;
  qrysitFunc.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitFunc.Open;
  qrySitPlanoPrev.Close;
  qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoPrev.Open;
  qrySitPart.Close;
  qrysitPart.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPart.Open;

  //Início - William Santana - SOL 264614 - PPM 1157652
  // Retorno de Cancelado para Ativo
   if (sIdEventoGerador = '354') then
   begin
     MontaSelectPart.Filtro.Text := StringReplace(MontaSelectPart.Filtro.Text,'SITPART.FLGINTERNO IN (''MA'', ''MP'',''MS'',''AS'',''AT'')',
                                                         'SITPART.FLGINTERNO IN (''CA'')',[rfReplaceAll, rfIgnoreCase]);
     MontaSelectPart.Filtro.Text := StringReplace(MontaSelectPart.Filtro.Text,'PARTPREVPLAN.FLGDESATIVADO = 0',
                                                         'PARTPREVPLAN.FLGDESATIVADO = 1',[rfReplaceAll, rfIgnoreCase]);
   end;
  //Término - William Santana - SOL 264614 - PPM 1157652

  qryTipoDocPessoa.Close; qryTipoDocPessoa.Open;
  qryTpBonusTrab.Close;   qryTpBonusTrab.Open;
  tbsResultado.TabVisible := False;
  LimpaCampos;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoRetornoMantidoParaAtivo.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  memResult.Lines.Clear;
  memResult.Lines.Add('Resultados para o Registro do Evento : ');
  memResult.Lines.Add('==================================== ');

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     LimpaCampos;
     // Carrega Campos

     sIdPessoa          := MontaSelectPart.ValoresChave[0];
     sIdPessJur         := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
     sIdSitFunc         := MontaSelectPart.ValoresChave[11];
     sIdSitPart         := MontaSelectPart.ValoresChave[12];
     sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[13];
     sSeqProposta       := MontaSelectPart.ValoresChave[14];
     edNome.Text        := MontaSelectPart.ValoresChave[3];
     edMatricula.Text   := MontaSelectPart.ValoresChave[4];
     edPatro.Text       := MontaSelectPart.ValoresChave[5];
     edPlano.Text       := MontaSelectPart.ValoresChave[6];
     edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
     edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
     edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
     edInscNumero.Text  := MontaSelectPart.ValoresChave[10];
     sFlgIntSitFunc     := MontaSelectPart.ValoresChave[16];
     sFlgIntSitPart     := MontaSelectPart.ValoresChave[17];
     sFlgIntSitPlano    := MontaSelectPart.ValoresChave[18];
     sInscricaoData     := MontaSelectPart.ValoresChave[15];
     reSalarioAtivo.Text := ClienteNumero(MontaSelectPart.ValoresChave[21]); 

     edMatricula1.Text  := edMatricula.Text;   

     qryPatro.Close; // Filtra somente as Patrocinadora que possuem o plano do Participante
     qryPatro.ParamByName('pIdPlanoPrev').AsString := sIdPlanoPrev;
     qryPatro.Open;

     qryPatro.Locate('IdPessoa',StrToInt(sIdPessJur),[loCaseInsensitive]);
     dblkpcmbPatro.Text := qryPatro.FieldByName('Nome').AsString;
     dblkpcmbPatro.PerformSearch;
     
     ConsPart1.sIdPessoa := sidpessoa;
     ConsPart1.sSeqProposta := sseqproposta;
     ConsPart1.sIdPlanoprev := sidplanoprev;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur := sidpessjur;
     ConsPart1.Enabled := true;
     bbtnOpcoes.enabled := true; 

     // Verifica se o evento já foi registrado
     VerificaEstadoEvento;

     // Filtrar dados do Evento Manutencao ocorrido
     qryEventos.Close;
     qryEventos.ParamByName('IdPessoa').Value    := StrToInt(sIdPessoa);
     qryEventos.ParamByName('IdPessJur').Value   := StrToInt(sIdPessJur);
     qryEventos.ParamByName('IdPlanoPrev').Value := StrToInt(sIdPlanoPrev);
     qryEventos.ParamByName('SeqProposta').Value := StrToInt(sSeqProposta);
     qryEventos.Open;

     if qryEventos.IsEmpty
     then if MsgDlg('Não existe evento de manutenção registrado para este participante.'+
                    'Deseja continuar ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
          then Exit;

     // Preencher dados de Durante a Manutencao
     lblSitFuncDurante.Caption  := 'Sit. na Patrocinadora : '+MontaSelectPart.ValoresChave[7];
     lblSitPlanoDurante.Caption := 'Sit. no Plano : '+MontaSelectPart.ValoresChave[9];
     lblSitPartDurante.Caption  := 'Sit. na Fundação : '+MontaSelectPart.ValoresChave[8];
     lblIniManut.Caption        := 'Início da Manutenção : '+qryEventos.FieldByName('DataEvento').AsString;
     

     // Preencher dados de Antes da Manutencao
     lblPatroAntes.Caption     := MontaSelectPart.ValoresChave[5];
     lblMatriculaAntes.Caption := 'Matrícula : '+ MontaSelectPart.ValoresChave[4];

     lblSitFuncAntes.Caption    := 'Sit. na Patrocinadora : '+qryEventos.FieldByName('NomeSitFunc').AsString;
     lblSitPlanoAntes.Caption   := 'Sit. no Plano : '+qryEventos.FieldByName('NomeSitPlano').AsString;
     lblSitPartAntes.Caption    := 'Sit. na Fundação : '+qryEventos.FieldByName('NomeSitPart').AsString;
     lblDataAdmAntes.Caption    := 'Admissão : '+qryEventos.FieldByName('DataAdmissao').AsString;
     lblDataDemissAntes.Caption := 'Demissão : '+qryEventos.FieldByName('DataDemissao').AsString;

     pgctrlEvento.ActivePage := tbsInfoGerais;
     

     bRegistrado := True;
     if sEstadoEvento = 'NAO REGISTRADO'
     then begin // Verifica se pode Inserir
        if not PodeRegistrarEvento( qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                    sFlgInterno,sIdSitFunc,sIdSitPart,sIdSitPlanoPrev,
                                    sMotivoEvento)
        then begin
           MsgDlg('Esse Evento não pode ser registrado. Motivo : '+sMotivoEvento,'Informação',mtInformation,[mbOk,mbHelp],0);
           TiraSql(qryAux);
           tbsResultado.TabVisible := True;
           pgctrlEvento.ActivePage := tbsResultado;
           bRegistrado := False;
           bEfetivado  := False;
           bbtnConfirmar.Enabled := False;
           bbtnCancelar.Enabled  := True;
           pnlInformacao.Enabled := False;
        end
        else begin // nao foi registrado e PODE ser registrao
           bRegistrado := False;
           bEfetivado  := False;
           bbtnConfirmar.Enabled := True;
           bbtnCancelar.Enabled  := True;
           pnlInformacao.Enabled := True;
           dtVolta.Text          := '';
           dtEvento.Text         := '';
        end;
     end
     else if sEstadoEvento = 'REGISTRADO'
          then begin// Pode Alterar
              MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
              TiraSql(qryAux);
              bRegistrado := True;
              bEfetivado  := False;
              bbtnConfirmar.Enabled := True;
              bbtnCancelar.Enabled  := True;
          end
          else if sEstadoEvento = 'EFETIVADO'
               then begin// Não Pode Alterar, nem inserir outro evento
                  MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                  TiraSql(qryAux);
                  bRegistrado := True;
                  bEfetivado  := True;
                  pnlInformacao.Enabled := False;
                  bbtnConfirmar.Enabled := False;
                  bbtnCancelar.Enabled  := False;
               end;
  end
  else LimpaCampos;

  
  if  montaselectpart.retornouvalor  AND (sEstadoEvento <> 'REGISTRADO') then
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbPatro.Text:='';
       dblkpcmbSitPart.text:='';
       dblkpcmbSitFunc.TexT:='';
     end;

end;

procedure TfrmEventoRetornoMantidoParaAtivo.bbtnConfirmarClick(Sender: TObject);
var sMsgErro : string;
begin
  inherited;

  // Verificar campos obrigatorios
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbPatro.Text) = ''
  then begin
     MsgDlg('A Patrocinadora deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     pgctrlEvento.ActivePage := tbsInfoGerais;
     dblkpcmbPatro.SetFocus;
     Exit;
  end;

  if Trim(dtVolta.Text) = ''
  then begin
     MsgDlg('A Data do Final da Manutenção deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     pgctrlEvento.ActivePage := tbsInfoGerais;
     dtVolta.SetFocus;
     Exit;
  end;

  if Trim(dtEvento.Text) = ''
  then begin
     MsgDlg('A nova Data de Admissão deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     pgctrlEvento.ActivePage := tbsInfoGerais;
     dtEvento.SetFocus;
     Exit;
  end;

  if Trim(edMatricula1.Text) = ''
  then begin
     MsgDlg('A Matrícula deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     pgctrlEvento.ActivePage := tbsInfoGerais;
     edMatricula1.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitFunc.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na Patrocinadora deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     pgctrlEvento.ActivePage := tbsInfoGerais;
     dblkpcmbSitFunc.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     pgctrlEvento.ActivePage := tbsInfoGerais;
     dblkpcmbSitPlanoPrev.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPart.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     pgctrlEvento.ActivePage := tbsInfoGerais;
     dblkpcmbSitPart.SetFocus;
     Exit;
  end;

  // A data da volta da manutencao deve ser posterior ao inicioda da manutencao
  if not qryEventos.FieldByName('DataEvento').IsNull then //Denis Horongoso - SIG 70125
     if (StrToDate(dtVolta.Text) < StrToDate(qryEventos.FieldByName('DataEvento').AsString))
        and (sIdEventoGerador <> '354') //SIG82996
        and (sIdEventoGerador <> '352') //SIG112877
     then begin
        MsgDlg('O "Fim da Manutenção" deve ser anterior ao início da mesma.','Erro',mtError,[mbOk,mbHelp],0);
        pgctrlEvento.ActivePage := tbsInfoGerais;
        dtVolta.SetFocus;
        Exit;
     end;

  
  if dblkpcmbIdCargoExt.Text = ''
  then begin
     if MsgDlg('O cargo não foi preenchido. Deseja continuar sem gravar o histórico funcional?','Atenção',mtConfirmation,[mbNo,mbYes],0) = mrNo then
     begin
        pgctrlEvento.ActivePage := tbsHistFunc;
        dblkpcmbIdCargoExt.SetFocus;
        Exit;
     end;
  end;

  frmAguarde.Mostra(' Efetivando evento ... '); // Mostra Form de Aguarde.

  try
     GravaEVENTOSPREV;
  except
     MsgDlg('Erro ao gravar evento. ','Erro',mtError,[mbOk, mbHelp], 0);
     dtmBasedados.dbBaseDados.RollBack;
     LimpaCampos;
     dtmBaseDados.dbBaseDados.StartTransaction;
     Exit;
  end;

  // Verificar se o participante voltou para a mesma patrocinadora
  // ou  se ele entrou em uma nova patrocinadora
  if Trim(sIdPessjur) <> (qryPatro.FieldByName('IdPessoa').AsString)
  then begin // Participante entrou em uma nova patrocinadora

     if not GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev),
                                         sIdPlanoPrev,
                                         sIdEventoGerador,
                                         '-1',
                                         sIdPessoa,
                                         qryPatro.FieldByName('IdPessoa').AsString,
                                         '1',
                                         '',
                                         '1',
                                         dtEvento.Text, True, qryAux, qryGrava,sIdPlanoPrev)
     then begin
        MsgDlg('Erro ao gravar histórico de contribuições do evento. ','Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

     if not InsereNaPatrocinadoraNova ( qryAux, qryGrava,
                                        StrToInt(sIdPessoa),
                                        StrToInt(sIdPessJur),
                                        qryPatro.FieldByName('IdPessoa').AsInteger,
                                        StrToInt(sIdPlanoPrev),
                                        StrToInt(sIdPlanoPrev),
                                        qrySitFunc.FieldByName('IdSitFunc').AsInteger,
                                        edMatricula1.Text,
                                        dtEvento.Text,
                                        qrySitPart.FieldByName('IdSitPart').AsInteger,
                                        qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsInteger,
                                        StrToInt(edInscNumero.Text),
                                        dtEvento.Text,
                                        reSalarioAtivo.Text,
                                        StrToInt(sIdEventoGerador),
                                        sFlgInterno,
                                        '1',
                                        '0000/00',
                                        sMsgErro)
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;


     try
        GravaEVENTOSPREVNovaPatro;
     except
        MsgDlg('Erro ao gravar evento. ','Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;


     frmAguarde.Mostra('Desativando participante da situação antiga ... ');
     if not AtualizaFlgDesativado( qryAux,
                                   qryPatro.FieldByName('IdPessoa').AsInteger,
                                   StrToInt(sIdPlanoPrev),
                                   StrToInt(sIdPessoa),
                                   1 )
     then begin
        frmAguarde.Apaga;
        MsgDlg('Erro ao desativar participante da patrocinadora X plano anterior.','Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;

     if not CancelaNaPatrocinadoraAntiga ( qryAux, qryGrava,
                                           StrToInt(sIdPessoa),
                                           StrToInt(sIdPessJur),
                                           StrToInt(sIdPlanoPrev),
                                           StrToInt(sIdSitPart),
                                           StrToInt(sIdEventoGerador),
                                           sFlgInterno,
                                           DateToStr(StrToDate(dtEvento.Text) - 1),
                                           edMatricula.Text,
                                           sMsgErro,
                                           dtVolta.Text) //BRUNO AZEVEDO SOL 130119 KINTANA 789646
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;

     if Trim(dblkpcmbIdCargoExt.Text) <> ''
     then begin
        if not InsereNoHistoricoFuncional
        then begin
           dtmBasedados.dbBaseDados.RollBack;
           LimpaCampos;
           dtmBaseDados.dbBaseDados.StartTransaction;
           exit;
        end;
     end;
  end 
  else begin // Participante voltou para mesma

     
     if Trim(dblkpcmbIdCargoExt.Text) <> ''
     then begin
        if not InsereNoHistoricoFuncional
        then begin
           dtmBasedados.dbBaseDados.RollBack;
           LimpaCampos;
           dtmBaseDados.dbBaseDados.StartTransaction;
           Exit;
        end;
     end;

     if not ReativaParticipanteNaPatro ( qryAux, qryGrava,
                                         StrToInt(sIdPessoa),
                                         qryPatro.FieldbyName('IdPessoa').AsInteger,
                                         StrToInt(sIdPlanoPrev),
                                         qrySitFunc.FieldbyName('IdSitFunc').AsInteger,
                                         qrySitPart.FieldByName('IdSitPart').AsInteger,
                                         qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsInteger,
                                         iIdEventoPrev,
                                         StrToInt(sIdEventoGerador),
                                         sFlgInterno,
                                         MontaSelectPart.ValoresChave[19],
                                         MontaSelectPart.ValoresChave[15],
                                         sMsgErro,
                                         reSalarioAtivo.Text,
                                         edMatricula1.Text, 
                                         dtEvento.Text)   
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

     if not GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev),
                                         sIdPlanoPrev,
                                         sIdEventoGerador,
                                         '-1',
                                         sIdPessoa,
                                         qryPatro.FieldByName('IdPessoa').AsString,
                                         '1',
                                         '',
                                         '1',
                                         dtEvento.Text, True, qryAux, qryGrava,sIdPlanoPrev)
     then begin
        MsgDlg('Erro ao gravar histórico de contribuições do evento. ','Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

     if not VoltaContribuicoesAnteriores( qryAux, qryGrava,
                                          StrToInt(sIdPessoa),
                                          StrToInt(sIdPessJur),
                                          qryPatro.FieldByName('IdPessoa').AsInteger,
                                          StrToInt(sIdPlanoPrev),
                                          StrToInt(sIdPlanoPrev),
                                          StrToInt(sIdSitPart),
                                          qrySitPart.FieldByName('IdSitPart').AsInteger,
                                          StrToInt(sIdEventoGerador),
                                          iIdEventoPrev,
                                          sFlgInterno,
                                          edMatricula.Text,
                                          edMatricula1.Text,
                                          dtEvento.Text,
                                          dtEvento.Text,
                                          '1',
                                          '0000/00',

                                          OraNumero(reSalarioAtivo.Text),
                                          sInscricaoData,
                                          sMsgErro,
                                          dtVolta.Text  )  //BRUNO AZEVEDO SOL 130119 KINTANA 789646

     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

     
  end;

  
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET DATAREADMISSAO = TO_DATE(' +  QuotedStr(dtEvento.Text) + ',''DD/MM/YYYY'')');
  qryGrava.Sql.Add(' WHERE IDPESSJUR = ' + qryPatro.FieldByName('IDPESSOA').AsString );
  qryGrava.Sql.Add('   AND IDPESSOA  = ' + sIdPessoa);
  Try
   qryGrava.ExecSQL;
  Except
   On E:EDBEngineError Do
     Begin
        MsgDlg('Erro na tentativa de atualizar a DATA DE READMISSÃO. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        exit;
     End;
  End;
  

  if not RODAPADRAOMOVRESERVA  (  StrToInt(sIdPessJur)  ,
                                  StrToInt(sIdPlanoPrev) ,
                                  StrToInt(sIdPessoa) ,
                                  1,
                                  -1,
                                  StrToint(sIdEventoGerador),
                                  StrToInt(sIdPessJur)  ,
                                  strtoInt(sIdPlanoPrev) ,
                                  sFlgInterno,
                                  dtEvento.Text,
                                  sMsgErro,
                                  -1  ,
                                  'O',
                                  ' ' )
  then begin
     MsgDlg('Ocorreu um erro na execução do Padrão de Movimentação de Reserva ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  frmAguarde.Apaga; // Tira Form de Aguarde.

  
  MostraDetalhesContribuicao( StrToInt(sIdPessJur),
                              StrToInt(sIDPLANOPREV),
                              StrToInt(sIdPessoa),
                              StrToInt(sSeqProposta),
                              'Detalhes de Opções e Contribuições ... ',
                              'Retorno de Mantido para Ativo ',
                              'RA', '',
                              dtEvento.Text,
                              '',
                              qryAux);

  if MsgDlg('Deseja confirmar o evento ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes
  then begin
    dtmBasedados.dbBaseDados.Commit;
    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes('Evento Retorno de Mantido para Ativo') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
    MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
  end
  else begin
    dtmBasedados.dbBaseDados.Rollback;
    MsgDlg('Evento cancelado.','Informação',mtError,[mbOk],0);
  end;

  LimpaCampos;
  TiraSql(qryAux);

  
  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);
  

  dtmBaseDados.dbBaseDados.StartTransaction;
end;

function TfrmEventoRetornoMantidoParaAtivo.InsereNoHistoricoFuncional: Boolean;
var
  sSeqHistFunc, sCodTpInsalubri, sCodBonusTrab: string;
begin
  Result := False;


 {Insere no Historico Funcional - Periodo: da Data de Admissao na Patrocinadora Antiga ate a Data de Inicio de Mantido}
 {Pega Proximo SeqHistFunc}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT MAX(SEQHISTFUNC) + 1 AS PROXIMOSEQHISTFUNC FROM HISTFUNCPREV ' +
                 ' WHERE IDPESSOA = ' + sIdPessoa);
  qryAux.Open;

  if (qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString = '') or
     (qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString = '0') then
      sSeqHistFunc := '1'
  else
      sSeqHistFunc := qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString;
 {Fim - Pega Proximo SeqHistFunc}

 {Pega DataInicio e DataFinal}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DATAADMISSAO, DATADEMISSAO FROM ELEGPATRO ' +
                 ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '        IDPESSOA  = ' + sIdPessoa);
  qryAux.Open;

  sDataInicio := qryAux.FieldByName('DATAADMISSAO').AsString;
  sDataFinal  := qryAux.FieldByName('DATADEMISSAO').AsString;
 {Fim - Pega DataInicio e DataFinal}

  {Verifica Tempo Calculado}
  
  if (Trim(sDataFinal) = '') or (Trim(sDataInicio) = '')
  then begin
     dTempoDecorrido := 0;
     if Trim(sDataInicio) = ''
     then MsgDlg('A data de admissão do participante não foi encontrada. '+#13+
                 'Por favor acerte o cadastro do participante antes de retorná-lo para ativo.','Erro',mtError,[mbOK],0)
     else MsgDlg('A data de demissão do participante não foi encontrada. '+#13+
                 'Por favor acerte o cadastro do participante antes de retorná-lo para ativo.','Erro',mtError,[mbOK],0);
     Exit;
  end
  else dTempoDecorrido := StrToDate(sDataFinal) - StrToDate(sDataInicio);

  
  if Trim(dblkpcmbCodTpInsalubri.Text) = ''
  then sTempoCalcInsalub := '0'
  else begin
     if qryTpInsalubri.FieldByName('FATOR').AsString <> ''
     then begin
        dTempoCalculado := dTempoDecorrido * qryTpInsalubri.FieldByName('FATOR').AsInteger;
        sTEMPOCALCINSALUB := FloatToStr(dTempoCalculado);
     end
     else begin
        ExecutaRegra;
        sTEMPOCALCINSALUB := OraNumero(regCalculo.Result);
     end;
  end;

  if sTEMPOCALCINSALUB = '' then sTEMPOCALCINSALUB := '0';
 {Fim - Verifica Tempo Calculado}

  qryGrava.Close;
  qryGrava.Sql.Clear;
  
  // Tirei os campos NOMESTEP E VALORSTEP pois não são mais usados
  qryGrava.Sql.Add(' INSERT INTO HISTFUNCPREV (IDPESSOA, SEQHISTFUNC, IDDOCUMENTO,            ' +
                   '                           CODTPINSALUBRI, IDCARGOEXT,      ' +
                   '                           DATAINICIO, DATAFINAL, EMPRESA,                ' +
                   '                           FLGCONTATS, NUMDOCUMENTO , TEMPOCALCINSALUB)                ' +
                   ' VALUES (' + sIdPessoa                                                + ',' +
                                 sSeqHistFunc                                             + ',' +
                                 qryTipoDocPessoa.FieldByName('IDDOCUMENTO').AsString     + ',' +
                                 '''' + sCodTpInsalubri + ''''                            + ',' +
                                 qryCargoExt.FieldByName('IDCARGOEXT').AsString           + ',' +
                                 ' To_Date(''' + Trim(sDataInicio) + ''',''dd/MM/yyyy'')' + ',' +
                                 ' To_Date(''' + Trim(sDataFinal) + ''',''dd/MM/yyyy'')'  + ',' +
                                 '''' + edPatro.Text + ''''                               + ',' +
                                 '1' + ',' +
                                 '''' + edNumDocumento.Text + '''' + ',' +
                                 OraNumero(Trim(sTEMPOCALCINSALUB)) + ')');
  try
     qryGrava.ExecSQL
  except
       on E:EDBEngineError do
          begin
               MsgDlg('Erro na tentativa de inserir participante no histórico funcional. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
               exit;
          end;
  end;

  if not GravaTEMPOSERVANTERIOR then // Tempo de Serviço Anterior
     begin
          dtmBasedados.dbBaseDados.RollBack;
          LimpaCampos;
          dtmBaseDados.dbBaseDados.StartTransaction;
          exit;
     end;

  if Trim(dblkpcmbCodTpInsalubri.Text) <> ''  then
     if not GravaTEMPOSITESPECIAL then // Tempo de Serviço em Periculosidade
        begin
             dtmBasedados.dbBaseDados.RollBack;
             LimpaCampos;
             dtmBaseDados.dbBaseDados.StartTransaction;
             exit;
        end;
 {Fim - Insere no Historico Funcional - Periodo: da Data de Admissao na Patrocinadora Antiga ate a Data de Inicio de Mantido}



 {Insere no Historico Funcional - Periodo: da Data de Inicio de Mantido ate a Data de Admissao na Nova Patrocinadora}
 {Pega Proximo SeqHistFunc}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT MAX(SEQHISTFUNC) + 1 AS PROXIMOSEQHISTFUNC FROM HISTFUNCPREV ' +
                 ' WHERE IDPESSOA = ' + sIdPessoa);
  qryAux.Open;

  if (qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString = '') or
     (qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString = '0') then
      sSeqHistFunc := '1'
  else
      sSeqHistFunc := qryAux.FieldByName('PROXIMOSEQHISTFUNC').AsString;
 {Fim - Pega Proximo SeqHistFunc}

 {Pega DataInicio e DataFinal}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DATADEMISSAO FROM ELEGPATRO ' +
                 ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '        IDPESSOA  = ' + sIdPessoa);
  qryAux.Open;

  sDataInicio := qryAux.FieldByName('DATADEMISSAO').AsString;
  sDataFinal  := Trim(dtVolta.Text);
 {Fim - Pega DataInicio e DataFinal}

  {Verifica Tempo Calculado}
  dTempoDecorrido := StrToDate(sDataFinal) - StrToDate(sDataInicio);

  
  if Trim(dblkpcmbCodTpInsalubri.Text) = ''
  then sTempoCalcInsalub := '0'
  else begin
     if qryTpInsalubri.FieldByName('FATOR').AsString <> ''
     then begin
        dTempoCalculado := dTempoDecorrido * qryTpInsalubri.FieldByName('FATOR').AsInteger;
        sTEMPOCALCINSALUB := FloatToStr(dTempoCalculado);
     end
     else begin
        ExecutaRegra;
        sTEMPOCALCINSALUB := OraNumero(regCalculo.Result);
     end;
  end;

  if sTEMPOCALCINSALUB = '' then
     sTEMPOCALCINSALUB := '0';
 {Fim - Verifica Tempo Calculado}

  qryGrava.Close;
  qryGrava.Sql.Clear;
  
  
  qryGrava.Sql.Add(' INSERT INTO HISTFUNCPREV (IDPESSOA, SEQHISTFUNC, IDDOCUMENTO,       ' +
                   '                           CODTPINSALUBRI, CODBONUSTRAB, IDCARGOEXT, ' +
                   '                           DATAINICIO, DATAFINAL, EMPRESA,           ' +
                   '                           FLGCONTATS, NUMDOCUMENTO,                 ' +
                   '                           TEMPOCALCINSALUB) ' + 
                   ' VALUES (' + sIdPessoa + ',' + sSeqHistFunc + ',' + qryTipoDocPessoa.FieldByName('IDDOCUMENTO').AsString + ',' +
                             '''' + sCodTpInsalubri + '''' + ', ' + qryCargoExt.FieldByName('IDCARGOEXT').AsString + ',' +
                             ' To_Date(''' + Trim(sDataInicio) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(sDataFinal) + ''',''dd/MM/yyyy'')' + ',' +
                             
                             '''' + dblkpcmbPatro.Text + '''' + ',' +
                             
                             '1' + ',' + '''' + edNumDocumento.Text + '''' + ',' +
                             OraNumero(Trim(sTEMPOCALCINSALUB)) + ')');
  try
     qryGrava.ExecSQL
  except
       on E:EDBEngineError do
          begin
               MsgDlg('Erro na tentativa de inserir participante no histórico funcional. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
               exit;
          end;
  end;

  if not GravaTEMPOSERVANTERIOR then // Tempo de Serviço Anterior
     begin
          dtmBasedados.dbBaseDados.RollBack;
          LimpaCampos;
          dtmBaseDados.dbBaseDados.StartTransaction;
          exit;
     end;

  if Trim(dblkpcmbCodTpInsalubri.Text) <> ''  then
     if not GravaTEMPOSITESPECIAL then // Tempo de Serviço em Periculosidade
        begin
             dtmBasedados.dbBaseDados.RollBack;
             LimpaCampos;
             dtmBaseDados.dbBaseDados.StartTransaction;
             exit;
        end;
 {Fim - Insere no Historico Funcional - Periodo: da Data de Inicio de Mantido ate a Data de Admissao na Nova Patrocinadora}

  Result := True;
end;

function TfrmEventoRetornoMantidoParaAtivo.GravaTEMPOSERVANTERIOR: boolean; // Tempo de Servico Anterior
var
  dTempoServAnterior: double;
begin
  Result := False;

  dTempoDecorrido := StrToDate(sDataFinal) - StrToDate(sDataInicio);
  dTempoemMeses := dTempoDecorrido / 30;

 {Seleciona TEMPOSERVANTERIOR}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT TEMPOSERVANTERIOR FROM ELEGPATRO '  +
                 ' WHERE IDPESSJUR = ' + qryPatro.FieldByName('IDPESSOA').AsString + ' AND ' +
                 '       IDPESSOA  = ' + sIdPessoa);
  qryAux.Open;
  dTempoServAnterior := qryAux.FieldByName('TEMPOSERVANTERIOR').AsFloat + dTempoemMeses;

 {Adiciona em ELEGPATRO Tempo Servico Anterior}
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVANTERIOR = ' + OraNumero(FloatToStr(dTempoServAnterior)) +
                   ' WHERE IDPESSJUR = ' + qryPatro.FieldByName('IDPESSOA').AsString + ' AND ' +
                   '       IDPESSOA  = ' + sIdPessoa);
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
        begin
             MsgDlg('Erro na tentativa de inserir o Tempo de Serviço anterior do participante. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
             exit;
        end;
  end;

  Result := True;
end;

function TfrmEventoRetornoMantidoParaAtivo.GravaTEMPOSITESPECIAL: boolean; // Tempo de Servico em Periculosidade
var
  dTempoSitEspecial: double;
begin
  Result := False;

  dTempoDecorrido := StrToDate(sDataFinal) - StrToDate(sDataInicio);
  dTempoemMeses   := dTempoDecorrido / 30;

  if (qryTpInsalubri.FieldByName('FLGTEMPOCONTINUO').AsString = '1') and // Se o tempo de servico deve ser continuo e,
     (qryTpInsalubri.FieldByName('TEMPOPERMANMINIMO').AsFloat > dTempoemMeses) then // Se o tempo de servico minimo exigido for maior que o tempo de servico do participante nesta empresa
      begin
           Result := True;
           exit; // Nao grava tempo como TEMPOSITESPECIAL
      end;

  dTempoemMeses := StrToFloat(sTEMPOCALCINSALUB) / 30;

 {Seleciona TEMPOSITESPECIAL}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT TEMPOSITESPECIAL FROM ELEGPATRO '   +
                 ' WHERE IDPESSJUR = ' + qryPatro.FieldByName('IDPESSOA').AsString + ' AND ' +
                 '       IDPESSOA  = ' + sIdPessoa);
  qryAux.Open;

  if (qryTpINsalubri.FieldByName('FLGTEMPOCONTINUO').AsString = '0') and // Se o tempo de servico nao deve ser continuo e,
     (qryTpInsalubri.FieldByName('TEMPOPERMANMINIMO').AsFloat > qryAux.FieldByName('TEMPOSITESPECIAL').AsFloat) then // Se o tempo de servico minimo exigido for maior que o tempo de servico do participante acumulado(em todas as empresas)
      begin
           Result := True;
           exit; // Nao grava tempo como TEMPOSITESPECIAL
      end;

  dTempoSitEspecial := qryAux.FieldByName('TEMPOSITESPECIAL').AsFloat + dTempoemMeses;

 {Adiciona em ELEGPATRO Tempo Situacao Especial}
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSITESPECIAL = ' + OraNumero(FloatToStr(dTempoSitEspecial)) +
                   ' WHERE IDPESSJUR = ' + qryPatro.FieldByName('IDPESSOA').AsString + ' AND ' +
                   '       IDPESSOA  = ' + sIdPessoa);
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
        begin
             MsgDlg('Erro na tentativa de inserir o Tempo de Situação Especial do participante. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
             exit;
        end;
  end;

  Result := True;
end;

procedure TfrmEventoRetornoMantidoParaAtivo.ExecutaRegra;
var
  sSql: string;
begin
  sSql := ' SELECT ' + FloatToStr(dTempoDecorrido) + ' AS TEMPODECORRIDO ' +

          ' FROM DUAL ';

  qryRegra.Close;
  qryRegra.Sql.Clear;
  qryRegra.Sql.Add(sSQL);
  try
     qryRegra.Open;
  except
     on E:EDBEngineError do
        begin
             MsgDlg('Erro na tentativa de executar a Regra. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
             exit;
        end;
  end;

  regCalculo.QueryIn  := qryRegra;
  regCalculo.RuleName := qryTpInsalubri.FieldByName('IDREGRAINSALUBRI').AsString;

  try
     regCalculo.Execute;
  except
     MsgDlg('Erro na Execução da Regra.','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end;
end;

procedure TfrmEventoRetornoMantidoParaAtivo.GravaEVENTOSPREV;
begin
  // Se o Evento não requer Benefício, grava as situações de Imediato,
  // e já grava o evento como efetivado
  sFlgEfetivado  := '1';
  sDataEfetivado := ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')';

  sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';

  if bRegistrado = False
  then begin
     iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

     
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                    '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                    '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                    '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                    '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                    '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, MATRICULA) ' +
                    ' VALUES(' + IntToStr(iIdEventoPrev) + ',' +
                                 ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                                 ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                 sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                 '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev  + ',' +
                                 '''' + qrySitFunc.FieldByName('IDSITFUNC').AsString           + '''' + ',' +
                                 '''' + qrySitPart.FieldByName('IDSITPART').AsString           + '''' + ',' +
                                 '''' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + '''' + ',' +
                                 sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                 sDataEfetivado + ',' + sFlgEfetivado+','+OraNumero(edInscNumero.Text) + ',' +
                                 QuotedStr(edMatricula1.Text)+ ')' );
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
     qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                    '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                    '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                    '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                    '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                    '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldByName('IDSITFUNC').AsString + ''',' +
                    '                        IDSITPARTNOVO   = '   + qrySitPart.FieldByName('IDSITPART').AsString +   ',' +
                    '                        IDSITPLANONOVO  = '   + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString +
                    ' WHERE SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                    '       IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                    '       IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                    '       IDPESSOA        = ' + sIdPessoa    + ' AND ' +
                    '       IDEVENTOGERADOR = ' + sIdEventoGerador);
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


procedure TfrmEventoRetornoMantidoParaAtivo.GravaEVENTOSPREVNovaPatro;
var sIdEventoInscricao : String;
begin
  // Se o Evento não requer Benefício, grava as situações de Imediato,
  // e já grava o evento como efetivado
  sFlgEfetivado  := '1';
  sDataEfetivado := ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')';

  sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';

  qryAux.close;
  qryaux.sql.text := ' SELECT IDEVENTOGERADOR FROM EVENTOGERADOR '+
                     '  WHERE FLGINTERNO = ''IP'' '+
                     '  AND ROWNUM <=1 ';
  qryaux.open;

  if not qryaux.isempTy then
  begin
     sIdEventoInscricao := qryaux.fieldbyname('IDEVENTOGERADOR').AsString;
  end
  else
  begin
     MsgDlg('Não foi encontrado no cadastro um evento para o tipo INSCRIÇÃO.','Erro Cadastro',mtError,[mbOk],0);
     Exit;
  end;


  if bRegistrado = False
  then begin
     iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                    '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                    '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                    '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                    '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                    '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO) ' +
                    ' VALUES(' + IntToStr(iIdEventoPrev) + ',' +
                                 ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                                 ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                 sIdPessoa + ',' +qrypatro.fieldbyname('IDPESSOA').AsString+ ', ' +
                                 sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                 '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev  + ',' +
                                 '''' + qrySitFunc.FieldByName('IDSITFUNC').AsString           + '''' + ',' +
                                 '''' + qrySitPart.FieldByName('IDSITPART').AsString           + '''' + ',' +
                                 '''' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + '''' + ',' +
                                 sIdEventoInscricao + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                 sDataEfetivado + ',' + sFlgEfetivado+','+OraNumero(edInscNumero.Text) + ')');
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
     qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                    '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' +',' +
                    '                        IDSITFUNCATUAL  = '''+sIdSitFunc+''',' +
                    '                        IDSITPARTATUAL  = '''+sIdSitPart+''',' +
                    '                        IDSITPLANOATUAL = '''+sIdSitPlanoPrev+''',' +
                    '                        IDSITFUNCNOVO   = ''' +qrySitFunc.FieldByName('IDSITFUNC').AsString + ''',' +
                    '                        IDSITPARTNOVO   = '+ qrySitPart.FieldByName('IDSITPART').AsString +   ',' +
                    '                        IDSITPLANONOVO  = '+ qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString +
                    ' WHERE SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                    '       IDPESSJUR       = ' + qrypatro.fieldbyname('IDPESSOA').AsString   + ' AND ' +
                    '       IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                    '       IDPESSOA        = ' + sIdPessoa    + ' AND ' +
                    '       IDEVENTOGERADOR = ' + sIdEventoInscricao);
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


procedure TfrmEventoRetornoMantidoParaAtivo.bbtnCancelarClick(Sender: TObject);
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

procedure TfrmEventoRetornoMantidoParaAtivo.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
  dblkpcmbPatro.Text := '';
  dtVolta.Text      := '';
  dtEvento.Text    := '';
  edMatricula1.Text  := '';

  dblkpcmbSitFunc.Text      := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  dblkpcmbIdCargoExt.Text   := '';
  dblkpcmbCodTpInsalubri.Text := '';
  dblkpcmbIdDocumento.Text  := '';
  edNumDocumento.Text       := '';


  lblPatroAntes.Caption := 'Patrocinadora';
  lblMatriculaAntes.Caption := 'Matrícula';
  lblSitFuncAntes.Caption := 'Sit. na Patrocinadora';
  lblSitPlanoAntes.Caption := 'Sit. no Plano';
  lblSitPartAntes.Caption := 'Sit. na Fundação';
  lblDataAdmAntes.Caption := 'Admissão';
  lblDataDemissAntes.Caption := 'Demissão';

  lblSitFuncDurante.Caption := 'Sit. na Patrocinadora';
  lblSitPlanoDurante.Caption := 'Sit. no Plano';
  lblSitPartDurante.Caption := 'Sit. na Fundação';
  lblIniManut.Caption := 'Início da Manutenção';

  memResult.Lines.Clear;
  tbsResultado.TabVisible := False;
  pgctrlEvento.ActivePage := tbsInfoGerais;
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;
  frmAguarde.Apaga;    
end;

procedure TfrmEventoRetornoMantidoParaAtivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

procedure TfrmEventoRetornoMantidoParaAtivo.dblkpcmbIdDocumentoChange(Sender: TObject);
begin
  inherited;
  if (sIdPessoa <> '') and (Trim(dblkpcmbIdDocumento.Text) = 'CPF') then
      begin
           qryAux.Close;
           qryAux.Sql.Clear;
           qryAux.Sql.Add(' SELECT NUMDOCUMENTO FROM PESSOA ' +
                          ' WHERE IDPESSOA = ' + sIdPessoa);
           qryAux.Open;

           edNumDocumento.Text := qryAux.FieldByName('NUMDOCUMENTO').AsString;
      end;
end;

procedure TfrmEventoRetornoMantidoParaAtivo.bbtnOpcoesClick(
  Sender: TObject);
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

procedure TfrmEventoRetornoMantidoParaAtivo.dtVoltaExit(Sender: TObject);
begin
  inherited;
  if Trim(dtVolta.Text) <> ''
  then dtEvento.Date := dtVolta.date +  1;
end;

procedure TfrmEventoRetornoMantidoParaAtivo.dtEventoExit(
  Sender: TObject);
var sDataEventoMaisUm : string;
begin
  inherited;
  if (Trim(dtEvento.Text) <> '') and (Trim(dtVolta.Text) <> '')
  then begin
    sDataEventoMaisUm := AdcionaDias(dtVolta.Text, 1);
    if dtEvento.Text <> sDataEventoMaisUm
    then begin
       MsgDlg('A "Data de Retorno" deve ser um dia após o "Fim da Manutenção". Verifique.','Erro',mtError,[mbOk,mbHelp],0);
       dtEvento.Text := '';
       Exit;
    end;
  end;

end;

end.
