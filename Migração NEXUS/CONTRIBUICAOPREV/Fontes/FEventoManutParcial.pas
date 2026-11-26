// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
// Autor(a)   : Jéssica Lana
// Data       : 07/08/2009
// Pendência  : SOL 122115 - Ktn 606390
// Descricao  : Ajuste na propriedade WINDOW MODAL (abre cadastro de evolução funcional)
// -----------------------------------------------------------------------------
//  Autor      : Renato Visoni
//  Rotina     : qryCargoExCo e qryCargoExt
//  Data       : 09/10/2008
//  Pendencia  : SOL 98164 \ Kintana 428126
//  Descrição  : Inclusão da condição AND IDPESSJUR =:IDPESSJUR
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : ExecutaRegraCalculo e BuscaDatasEvolFuncPrev
//  Data       : 28/03/2007
//  Pendencia  : 24613
//  Descrição  : Inclusão dos campos DATAINICIO e DATAFIM na query da regra
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
// Rotinas     : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 22677
// Data        : 05/07/2006
// Descricao   : Correção para cancelar toda a rotina no caso de não confirmar a
//               a operação ao final do processo.
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 23/06/2006
// Rotina      : bbtnConfirmarClick
// Descrição   : Incluisão do teste se esta em transação 
//------------------------------------------------------------------------------
// Rotinas     : bbtnConfirmarClick, bbtnProcurarClick
// Autor(a)    : Gleyber
// Pendência   : 18994
// Data        : 03/08/2004
// Descricao   : Inclusão de um check box para indicar se o funcionário foi cedido
//               à fundação.
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 29/11/2004
// Rotina      : bbtnConfirmarClick
// Descrição   : Chamar a rotina de parcelamento
//------------------------------------------------------------------------------
// Rotinas     : sbtnEvolFuncionalClick
// Autor(a)    : Augusto
// Pendência   : 17938
// Data        : 11/11/2004
// Descricao   : Manter cadastramento da Evolução Funcional na Transação
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
// Autor(a)    : Gleyber
// Data        : 16/03/2004
// Alteração   : bbtnConfirmarClick
// Pendência   : 16237
// Descrição   : Incluída a rotina de confirmação no final da rotina do evento.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 03/03/2004
// Descrição   : Comentei mensagem a pedido da FUNCEF
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.01.2004
// Pendencia   : --- ( Funcef )
// Descrição   : Retirada do grid de itens salariais e inclusao do botão
//               de atalho para a evolução funcional
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 15/10/2003
// Descrição   : ExecutaRegraCalculo - Inclusão do campo FLGDIRETOR da ELEGPATRO
//------------------------------------------------------------------------------
//  Autor(a)    : Ricardo Vigorito
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
// Autor(a)    : Augusto
// Data        : 18/09/2003
// Alteração   : Retirada do adicional noturno dos itens que compõem o salario
//               Inclusao do Edit para opcao de ADN
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

unit FEventoManutParcial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, cmseldlg, TREdit, URegra, TB97Tlbr, UConsPart, IvDictio,
  IvMulti, IvEMulti, Mask, MskEdDlg, DBCtrls, FAguarde, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker ;

type
  TfrmEventoManutParcial = class(TfrmOkCancelar)
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
    Label10: TLabel;
    dtEvento: TCMDateTimePicker;
    lblValores: TLabel;
    Label11: TLabel;
    MontaSelectPart: TMontaSelect;
    Label9: TLabel;
    Label12: TLabel;
    qrySitPart: TwwQuery;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qryGrava: TwwQuery;
    regCalculo: TRegra;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    qryRegra: TwwQuery;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    reSalarioManut: TcmMaskEditDlg;
    Label4: TLabel;
    reSalarioParticip: TEdit;
    spbRubricas: TSpeedButton;
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    Label5: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dblkpcmbCargo: TwwDBLookupCombo;
    dblkpcmbCargoConf: TwwDBLookupCombo;
    edNivel: TEdit;
    edNivelConf: TEdit;
    qryCargoExCo: TwwQuery;
    qryCargoExt: TwwQuery;
    qryEvento: TwwQuery;
    sbtnEvolFuncional: TSpeedButton;
    Label17: TLabel;
    dtRequerimento: TCMDateTimePicker;
    PnlOpcao: TPanel;
    Label22: TLabel;
    EdtOpcao: TEdit;
    chkFuncionarioCedido: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reSalarioManutExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure reSalarioManutBtnClick(Sender: TObject);
    procedure reSalarioParticipExit(Sender: TObject);
    procedure grdItensSalFieldChanged(Sender: TObject; Field: TField);
    procedure sbtnEvolFuncionalClick(Sender: TObject);
    procedure dtEventoExit(Sender: TObject);

  
  private { Private declarations }

    bEncerrou : boolean; 
    iIdEventoPrev: integer;
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed,
    sIdRegraSalario: string;
    sFlgEfetivado, sDataEfetivado: string;
    bAltera, bFlgUsaRubrica: boolean;
    sEstadoEvento  : string;
    sResultadoRegra: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6               : real;

    procedure ExecutaRegraConcessao;
    procedure ExecutaRegraCalculo;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    procedure BuscaDatasEvolFuncPrev(var sDataInicio, sDataFinal : String); 


  public  { Public declarations }


  end;



var
  frmEventoManutParcial: TfrmEventoManutParcial;



implementation
{$R *.DFM}
uses
  UAdmPrev,    UDataBase, UMensErro, FTelaAut, DBaseDados,
  UMovReserva, FMostraContribuicoes, UEventos, UContribuicaoPrev, UParticipante,
  UModulo,     FCadOpcoesElegivel, UIntegraBack,  UFuncoesUteis,
  UBeneficio, UPCS, USistema, FCadEvolFuncPrev;



procedure TfrmEventoManutParcial.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption    := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  spbRubricas.Enabled := False;
  bEncerrou := False; 
end;

procedure TfrmEventoManutParcial.FormShow(Sender: TObject);
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

  // Renato Visoni SOL 98164 \ Kintana 428126
  qryCargoExt.Close;
  qryCargoExt.SQL.Clear;
  qryCargoExt.SQL.Add('SELECT IDCARGOEXT, TITULO');
  qryCargoExt.SQL.Add('FROM  CARGOEXT');
  qryCargoExt.SQL.Add('ORDER BY IDCARGOEXT');
  qryCargoExt.Open;

  qryCargoExCo.Close;
  qryCargoExCo.SQL.Clear;
  qryCargoExCo.SQL.Add('SELECT IDCARGOEXT, TITULO');
  qryCargoExCo.SQL.Add('FROM  CARGOEXT');
  qryCargoExCo.SQL.Add('ORDER BY IDCARGOEXT');
  qryCargoExCo.Open;
  // Fim Renato Visoni SOL 98164 \ Kintana 428126

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoManutParcial.bbtnProcurarClick(Sender: TObject);
var iIdCargoExt : longint;
begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
      begin
          {Carrega Campos}
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
           edNivel.Text       := MontaSelectPart.ValoresChave[20];
           reSalarioParticip.Text     := MontaSelectPart.ValoresChave[23];

           chkFuncionarioCedido.Checked := (StrToInt(MontaSelectPart.ValoresChave[24]) = iIdFundacao);

           // Renato Visoni SOL 98164 \ Kintana 428126
           if sIdPessJur <> '' then begin
             qryCargoExt.Close;
             qryCargoExt.SQL.Clear;
             qryCargoExt.SQL.Add('SELECT IDCARGOEXT, TITULO');
             qryCargoExt.SQL.Add('FROM  CARGOEXT');
             qryCargoExt.SQL.ADD('WHERE IDPESSJUR =:IDPESSJUR');
             qryCargoExt.SQL.Add('ORDER BY IDCARGOEXT');
             qryCargoExt.ParamByName('IDPESSJUR').asString := sIdPessJur;
             qryCargoExt.Open;

             qryCargoExCo.Close;
             qryCargoExCo.SQL.Clear;
             qryCargoExCo.SQL.Add('SELECT IDCARGOEXT, TITULO');
             qryCargoExCo.SQL.Add('FROM  CARGOEXT');
             qryCargoExCo.SQL.ADD('WHERE IDPESSJUR =:IDPESSJUR');
             qryCargoExCo.SQL.Add('ORDER BY IDCARGOEXT');
             qryCargoExCo.ParamByName('IDPESSJUR').asString := sIdPessJur;
             qryCargoExCo.Open;
           end;
           // Fim Renato Visoni SOL 98164 \ Kintana 428126

           if Trim(MontaSelectPart.ValoresChave[21]) = ''
           then dblkpcmbCargo.Text    := ''
           else begin
              iIdCargoExt := StrToInt(MontaSelectPart.ValoresChave[21]);
              if qryCargoExt.Locate('IdCargoExt',iIdCargoExt,[loCaseInsensitive])
              then dblkpcmbCargo.Text := qryCargoExt.FieldByName('Titulo').AsSTring
              else dblkpcmbCargo.Text := '';
              dblkpcmbCargo.PerformSearch;
           end;

           pnlInformacao.Enabled := True;
           bbtnConfirmar.Enabled := True;
           bbtnCancelar.Enabled  := True;

           ConsPart1.sIdPessoa    := sidpessoa;
           ConsPart1.sIdTitular   := sIdPessoa;   
           ConsPart1.sSeqProposta := sseqproposta;
           ConsPart1.sIdPlanoprev := sidplanoprev;
           ConsPart1.DataBaseName := 'BaseDados';
           ConsPart1.sIdPessjur   := sidpessjur;
           ConsPart1.Enabled      := true;
           bbtnOpcoes.enabled     := true;


          {Verifica se o evento já foi registrado}
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
               reSalarioManut.Text       := '';
               dblkpcmbSitFunc.Text      := '';
               dblkpcmbSitPlanoPrev.Text := ''; 
               dblkpcmbSitPart.Text      := '';

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

               dtEvento.Text := ''; // Precisa limpar (senao nao executa regra)
              end
           else begin

              if sEstadoEvento = 'REGISTRADO'
              then begin// Pode Alterar
                 MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
                 bAltera := True;
                 reSalarioManut.Text  := MontaSelectPart.ValoresChave[15];
                 dtEvento.SetFocus;
              end
              else if sEstadoEvento = 'EFETIVADO'
                   then begin // Não Pode Alterar
                      MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                      bAltera := True; //leorefer - 2112
                      reSalarioManut.Text  := MontaSelectPart.ValoresChave[15];
                      pnlInformacao.Enabled := False;
                      bbtnConfirmar.Enabled := False;
                      bbtnCancelar.Enabled  := False;
                   end;
              dtEvento.date             := StrToDate(qryEvento.FieldByName('DataEvento').AsString);
              dblkpcmbSitFunc.Text      := qryEvento.FieldByName('NOMESITFUNC').AsString;
              dblkpcmbSitFunc.PerformSearch;

              dblkpcmbSitPlanoPrev.Text := qryEvento.FieldByName('NOMESITPLANO').AsString;
              dblkpcmbSitPlanoPrev.PerformSearch;

              dblkpcmbSitPart.Text      := qryEvento.FieldByName('NOMESITPART').AsString;
              dblkpcmbSitPart.PerformSearch;

              edSitPatro.Text           := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
              edSitPlano.Text           := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
              edSitFundacao.Text        := qryEvento.FieldByName('NOMESITPARTANT').AsString;
              dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString; 
           end;

          // Verifica se usa Cadastro de Rubricas no Cálculo do Salário //
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add(' SELECT FLGUSARUBRICA, IDRGSALMANUTPART FROM PLANPREVPATRO  '+
                         ' WHERE  IDPESSJUR   = '+''''+sIdPessJur    +''''+
                         ' AND    IDPLANOPREV = '+''''+sIdPlanoPrev  +'''');
          qryAux.Open;
          bFlgUsaRubrica  := (qryAux.FieldByName('FLGUSARUBRICA').AsInteger = 1);
          sIdRegraSalario :=  qryAux.FieldByName('IDRGSALMANUTPART').AsString;

      end;

  if  montaselectpart.retornouvalor then
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitPart.text:='';
       dblkpcmbSitFunc.TexT:='';
     end;
end;



procedure TfrmEventoManutParcial.VerificaEstadoEvento;
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



procedure TfrmEventoManutParcial.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef, 
  sNovoSalario, 
  sIdEvento, sNomeTitular, sRemTotal, sAnoMesRef: string;
  sMsgErro,
  sNivel, sCargo : string;
  bFlgIntContab: boolean;
begin
  inherited;

  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtEvento.SetFocus;
          Exit;
     end;

   if Trim(reSalarioManut.Text) = '' then
      begin
           MsgDlg('Salário de Manutenção deve ser informado.','Informação',mtInformation,[mbOk,mbHelp],0);
           reSalarioManut.SetFocus;
           Exit;
   end;

     if Trim(dblkpcmbSitFunc.Text) = '' then
        begin
             MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
             dblkpcmbSitFunc.SetFocus;
             Exit;
        end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = '' then 
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;

  if Trim(dblkpcmbSitPart.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  if qrySitPart.FieldByName('FLGINTERNO').AsString <> 'MP' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser da Categoria Mantido Parcial.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  If Trim(dtRequerimento.Text) = ''
   Then Begin
     MsgDlg('A data do requerimento deve ser preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     dtRequerimento.SetFocus;
     Exit;
   End;

  if (reSalarioParticip.Text = '') then 
     begin
          MsgDlg('O último salário de participação não foi encontrado no banco. '+#13+
                 'Informe o valor do salário praticado. ' ,'Atenção',mtWarning,[mbOk,mbHelp],0);
          reSalarioParticip.SetFocus;
          Exit;
     end;

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

  ExecutaRegraConcessao;

  if sResultadoRegra = 'False' then
     begin
          MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
          dtmBaseDados.dbBaseDados.RollBack;
          LimpaCampos;
          dtmBaseDados.dbBaseDados.StartTransaction;
          Exit;
     end;

  if not bAltera then
     VerificaeGravaSituacoes;

  GravaEVENTOSPREV;

  // atualizar nivel e cargo na tabela elegpatro
  if Trim(edNivel.Text) = ''
  then sNivel := ' NULL '
  else sNivel := ''''+Trim(edNivel.Text)+'''';

  if Trim(dblkpcmbCargo.Text) = ''
  then sCargo := ' NULL '
  else sCargo := qryCargoExt.FieldByName('IdCargoExt').AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE ELEGPATRO SET NIVEL = '+sNivel+' , '+
                 '                      IDCARGOEXT = '+sCargo);

  If chkFuncionarioCedido.Checked
   Then qryAux.SQL.Add(', IDPESSJURCEDIDO = '+IntToStr(iIdFundacao));

  qryAux.SQL.Add(' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '       IDPESSOA  = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
  end;

 {Grava SALTOTAL}
  sAnoMesRef := Copy(dtEvento.Text ,7,4) + '/' + Copy(dtEvento.Text ,4,2);
  sRemTotal  := OraNumero(CalcRemTotal(StrToInt(sIdPessJur),StrToInt(sIdPessoa),
                          SAnoMesAnterior(sAnoMesRef), qryAux));

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET SALTOTAL = ' + sRemTotal +
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

 {Grava Salário de Manutenção, e Data de Manutenção}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET SALMANTIDO      = ' + OraNumero(reSalarioManut.Text)    + ',' +
                 '                         SALPARTICIPACAO = ' + OraNumero(reSalarioParticip.Text) + ',' +   
                 '                         DATAINICIOMANUT = To_Date(''' + Trim(dtEvento.Text)     + ''',''dd/MM/yyyy'')' +
                 ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                 '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                 '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                 '       IDPESSOA    = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  if not bAltera
  then begin
     sMesRef := Copy(dtEvento.Text,7,4)+'/'+Copy(dtEvento.Text,4,2);

     GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), sIdPlanoPrev, sIdEventoGerador, '', sIdPessoa, sIdPessJur, sSeqProposta, '','',
          dtEvento.Text, 
          False, qryAux, qryGrava,sIdPlanoPrev);

     if not AssociaNovasContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                      edMatricula.Text, qrySitPart.FieldByName('IDSITPART').AsString,
                                      reSalarioManut.Text, False, True,
                                      False,  
                                      qryAux, qryGrava,sFlgInterno,iIdEventoPrev,'') then 
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
                                       dtEvento.Text,
                                       sMsgErro,
                                       bEncerrou) 
      then begin
         MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
         Exit;
      end;
  end;

  sIdEvento     := sIdEventoGerador;
  sNomeTitular  := edNome.Text;
  bFlgIntContab := (IntegraBack.Contabilidade = 'S');

  MoveReserva(sIdEvento, sIdPessoa, sSeqProposta, sNomeTitular, '', qryAux, regCalculo, sMsgErro,
              sIdPessJur, sIdPlanoPrev, '', sIdPessJur, sIdPlanoPrev, '', bFlgIntContab,'', StrToDate(dtEvento.Text),
              '', '', 'F', '', 0, 0, StrToDate(dtEvento.Text),'');


  Try
    If Not Sistema.GravaLogOperacoes('Evento Manutenção Parcial') Then
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
          dtEvento.Text,
          sMsgErro,
          -1  ,
           'O',
           ' ' )
        then begin
           MsgDlg('Ocorreu um erro na execução do Padrão de Movimentação de Reserva ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
           Exit;
    end;


  MostraDetalhesContribuicao( StrToInt(sIdPessJur),    
                              StrToInt(sIDPLANOPREV),
                              StrToInt(sIdPessoa),
                              StrToInt(sSeqProposta),
                              'Detalhes de Opções e Contribuições ... ',
                              'Manutenção Parcial de Contribuição ',
                              'MP', '',
                              dtEvento.Text,
                              '',qryAux);


  If Not EfetuaPareclamentoContribuicao(StrToInt(sIdPessJur),StrToInt(sIdPlanoPrev),
                                        StrToInt(sIdPessoa), StrToInt(sIdPessoa),
                                        StrToInt(sSeqProposta))
  Then Begin
    MsgDlg('Erro no parcelamento, Evento não efetuado.','Erro',mtError,[mbOk,mbHelp],0);
    dtmBaseDados.dbBaseDados.RollBack;
    LimpaCampos;
    dtmBaseDados.dbBaseDados.StartTransaction;
    Exit;
  End;

  If MsgDlg('Confirma efetivação do evento ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
   Then begin
     dtmBasedados.dbBaseDados.Commit;
     LimpaCampos;
     TiraSql(qryAux);
     MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

     If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
       Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);
   End Else Begin
         If dtmBaseDados.dbBaseDados.InTransaction  
          Then dtmBaseDados.dbBaseDados.Rollback;   
         bbtnCancelarClick(Self);
       End;


  LimpaCampos;
  TiraSql(qryAux);

  If ( Not dtmBaseDados.dbBaseDados.InTransaction ) Then Begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  End;

end;


procedure TfrmEventoManutParcial.VerificaeGravaSituacoes;
begin
 {Se o Evento não requer Benefício, grava as situações de Imediato, e já grava o evento como efetivado}
  sFlgEfetivado  := '1';
  sDataEfetivado := ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')';

  sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';


  // Grava nova Situação do Participante na Patrocinadora
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
  
  // Grava nova Situação do Participante na Fundação e no Plano
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPART = ' + qrySitPart.FieldByName('IDSITPART').AsString + ',' +
                   '                         IDSITPLANOPREV = ' + qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString +
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

procedure TfrmEventoManutParcial.GravaEVENTOSPREV;
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
                         '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, DATAREQUERIMENTO) ' + 
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                      '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                      '''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' + 
                                          qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                                          qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                      sDataEfetivado + ',' + sFlgEfetivado +','+OraNumero(edInscNumero.Text)+ ', ' +
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
                         '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAREQUERIMENTO = TO_DATE(''' + DateToStr(dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' + 
                         '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                         '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                         '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                         '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                         '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString   + ',' +
                         '                        IDSITPLANONOVO  = ' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + 
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

procedure TfrmEventoManutParcial.ExecutaRegraConcessao;
var
  sSQL : string;
begin
 {Executar Regra de Concessão de Manutenção Parcial - Passa para a Regra os dados do Participante}
  sSQL := ' SELECT PLP.IDREGRAMANUTPARC, PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, ' +
          '        PP.SEQPROPOSTA,  EL.IDSITFUNC, EL.IDCARGOEXT, EL.MATRICULA, ' +
          '        EL.DATAADMISSAO, EL.SALTOTAL, EL.PARTICIPPREVID, EL.PARTICIPASSIST, ' +
          '        EL.NIVEL,    EL.TEMPOSERVANTERIOR, PF.DATANASC, PF.SEXO, PF.DATAMORTE, ' +
          '        PF.ESTCIVIL, P.NUMDOCUMENTO, PP.IDSITPART,   PP.IDSITPLANOPREV , ' + 
          '        PP.FLGDEVEPREVIDENC,  '+  
          '        PP.IDSITPART        AS IDSITPARTATUAL,  '+
          '        PP.IDSITPLANOPREV   AS IDSITPLANOATUAL, '+
          '        EL.IDSITFUNC        AS IDSITFUNCATUAL,  '+
          ''''+qrySitFunc.FieldByName('IdSitFunc').AsString+'''           AS IDSITFUNCNOVO,  '+
          ''''+qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString+''' AS IDSITPLANONOVO, '+
          ''''+qrySitPart.FieldByName('IdSitPart').AsString+'''           AS IDSITPARTNOVO,   '+
          ''''+qrySitFunc.FieldByName('IdSitFunc').AsString+'''           AS IDSITFUNCNOVA,  '+
          ''''+qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString+''' AS IDSITPLANONOVA, '+
          ''''+qrySitPart.FieldByName('IdSitPart').AsString+'''           AS IDSITPARTNOVA   '+
          ' FROM PARTPREVPLAN PP, ELEGPATRO EL, PLANPREV PL, PESSOAFISICA PF, ' +
          '      PESSOA P, PLANPREVPATRO PLP ' +
          ' WHERE PP.IDPESSOA    = ' + sIdPessoa    + ' AND ' +
          '       PP.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       PP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       PP.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
          '       EL.IDPESSOA  = PP.IDPESSOA AND ' +
          '       EL.IDPESSJUR = PP.IDPESSJUR AND ' +
          '       PP.IDPLANOPREV = PL.IDPLANOPREV AND ' +
          '       PP.IDPESSOA = PF.IDPESSOA AND ' +
          '       PP.IDPESSOA = P.IDPESSOA AND ' +
          '       PP.IDPLANOPREV = PLP.IDPLANOPREV AND ' +
          '       PP.IDPESSJUR   = PLP.IDPESSJUR ';
  qryRegra.Close;
  qryRegra.Sql.Clear;
  qryRegra.Sql.Add(sSQL);
  try
     qryRegra.Open;
  except
     on E:EDBEngineError do
     begin
         MostrarErro(E);
         sResultadoRegra := 'False';
         Exit;
     end;
  end;

  if qryRegra.FieldByName('IDREGRAMANUTPARC').AsString = '' then
     begin
          sResultadoRegra := 'True';
          exit;
     end;

  regCalculo.QueryIn  := qryRegra;
  regCalculo.RuleName := qryRegra.FieldByName('IDREGRAMANUTPARC').AsString;

  try
     regCalculo.Execute;
  except
     MsgDlg('Erro na Execução da Regra de Concessão de Manutenção Parcial.','Informação',mtInformation,[mbOk,mbHelp],0);
     sResultadoRegra := 'False';
     TiraSql(qryAux);
     Exit;
  end;

  sResultadoRegra := regCalculo.Result;

  if sResultadoRegra = 'False' then
     begin
          MsgDlg('Manutenção não permitida .','Informação',mtInformation,[mbOk,mbHelp],0);
          TiraSql(qryAux);
          Exit;
     end;
end;

procedure TfrmEventoManutParcial.ExecutaRegraCalculo;
var
  sSQL, sValorReserva, sMesReferencia, sSalPart,
  sOpcao, sRemTotal, sDataInscFund: string;
  rValorBaseCalc,
  rValorSalManut,
  rValorRubPerdida,
  rValorRubMantida : Double;
  sVlrMediaADN, sVlrADN, sVlrSalFacADN : String;

  dSomaItemNaDIB,
  dSomaItemNoPBC  : double;
  sDataInicio, sDataFim : String;   
begin
  sOpcao := ' ';
  If EdtOpcao.Text <> '' Then Begin
    sOpcao := EdtOpcao.Text;
    MediaAdicional(QryAux,sOpcao,EdMatricula.Text,
                   sVlrMediaADN, sVlrADN, sVlrSalFacADN);
  End;


  // Executa Regra de Cálculo do Salário de Manutenção Parcial - Passa para a regra os mesmos dados da Regra de Cálculo do Beneficio
  sSQL := '';

  if bFlgUsaRubrica then
     begin
        sSQL := ' SELECT IDPESSOA, IDRUBRICA, VALORRUBRICA, FLGTPRUBMANUT, FLGPERCENT, '+
                  OraNumero(reSalarioParticip.Text)+' AS VALORPROVENTO '+
                ' FROM   RUBRICAINDIV  '+
                ' WHERE  IDPESSOA =    '+sIdPessoa +
                ' ORDER  BY FLGTPRUBMANUT ';
     end
  else
     begin
        //Calcula o valor total da soma das reservas do participante
        sValorReserva := OraNumero(CalcReservaPart(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                                                   StrToInt(sIdPessoa), -1, StrToInt(sSeqProposta), dtEvento.Text,
                                                   dtEvento.Text, '','', '', qryAux));

        sMesReferencia := Copy(Trim(dtEvento.Text),7,4)+'/'+Copy(Trim(dtEvento.Text),4,2);

        sSalPart := ORANUMERO(CalcSalPart(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                           SAnoMesAnterior(sMesReferencia), qryAux));

        sRemTotal := ORANUMERO(CalcREMTOTAL(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                            SAnoMesAnterior(sMesReferencia), qryAux));

        sDataInscFund := CalcDataInscFund(StrToInt(sIdPessJur),StrToInt(sIdPlanoPrev),
                                          StrToInt(sIdPessoa),StrToInt(sSeqProposta),qryAux);

        if Trim(sValorReserva) = '' then
           sValorReserva := '0';

        if Trim(sSalPart) = '' then
           sSalPart := '0';

        if Trim(sRemTotal) = '' then
           sRemTotal := '0';

        if Trim(sDataInscFund) = '' then
           sDataInscFund := DateToStr(Date);

        dSomaItemNaDIB := CalculaTotalResumoFuncional ( StrToInt(sIdPessJur), StrToInt(sIdPessoa), dSomaItemNoPBC );

        BuscaDatasEvolFuncPrev(sDataInicio, sDataFim);

        If sDataInicio = ''
        Then sDataInicio := ' ';

        If sDataFim = ''
        Then sDataFim := ' ';

        sSQL := ' SELECT PLP.IDRGSALMANUTPART, PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,    '+
                '        PP.IDSITPART, '    +''''+sDataInscFund+''' AS INSCRICAODATAFUND, PF.DATANASC,         '+
                '        EL.VALORBASE1,       EL.VALORBASE2,        EL.VALORBASE3,                             '+
                '        EL.SALTOTAL,         EL.TEMPOSERVANTERIOR, EL.TEMPOSERVANTREAL, EL.TEMPOSITESPECIAL,  '+
                '        EL.DATAADMISSAO,     EL.DATADEMISSAO,      EL.IDSITFUNC,        EL.TEMPONAOCREDITADO, '+
                '        SF.TIPOSIT,  SF.IDSITFUNC,                                  '+
                sSALPART      +' AS VALORPROVENTO,                                   '+

                QuotedStr(sOpcao)+'               AS OPCAOADN,   '+
                OraNumero(sVlrMediaADN)+'         AS MEDIAADN, '+
                OraNumero(sVlrADN)+'              AS VLRADN, '+
                OraNumero(sVlrSalFacADN)+'        AS SALFACULTADN, '+

                sREMTOTAL     +' AS VALORREMTOTAL,                                   '+
                sValorReserva +' AS VALORRESERVA,                                    '+
                ''''+Trim(edNivel.Text)     + ''' AS NIVEL,                          '+
                ''''+Trim(edNivelConf.Text) + ''' AS NIVELCONF,                      '+
                qryCargoExt.FieldByName('IdCargoExt').AsString+'  AS IDCARGOEXT,     '+
                qryCargoExCo.FieldByName('IdCargoExt').AsString +'  AS IDCARGOCONF,  '+
                OraNumero(FloatToStr(dSomaItemNoPBC)) +' AS SOMAITEMNOPBC,           '+ // SRB
                OraNumero(FloatToStr(dSomaItemNaDIB)) +' AS SOMAITEMNADIB,           '+ // SRB
                ''''+  Trim(dtEvento.Text)            + ''' AS DATAREF ,             '+
                ''''+  Trim(dtEvento.Text)            + ''' AS DATAINICIOMANUT,      '+
                ''''+qrySitFunc.FieldByName('IdSitFunc').AsString           +''' AS IDSITFUNCNOVA, '+
                ''''+qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString +''' AS IDSITPLANONOVA, '+
                ''''+qrySitPart.FieldByName('IdSitPart').AsString           +''' AS IDSITPARTNOVA, '+
                QuotedStr(sDataInicio)+' DATAINICIO, '+QuotedStr(sDataFim)+' DATAFINAL, '+ 

                '        EL.FLGDIRETOR                '+
                ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  ' +
                '        SITFUNC SF, PLANPREVPATRO PLP '+
                ' WHERE  PP.IDPESSOA    = ' + sIdPessoa    + ' AND ' +
                '        PP.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                '        PP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                '        PP.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                '        EL.IDPESSOA    = PP.IDPESSOA      AND ' +
                '        EL.IDPESSJUR   = PP.IDPESSJUR     AND ' +
                '        PF.IDPESSOA    = EL.IDPESSOA      AND ' +
                '        EL.IDSITFUNC   = SF.IDSITFUNC(+)  AND ' +
                '        PP.IDPLANOPREV = PLP.IDPLANOPREV AND ' +
                '        PP.IDPESSJUR   = PLP.IDPESSJUR ';
  end;

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

  if (not bFlgUsaRubrica) then
     sIdRegraSalario := qryRegra.FieldByName('IDRGSALMANUTPART').AsString;

  if (sIdRegraSalario = '') and (not bFlgUsaRubrica) then  
  begin
      MsgDlg('A regra de cálculo da manutenção parcial não foi associada.','Informação',mtInformation,[mbOk,mbHelp],0);
      TiraSql(qryAux);
      Exit;
  end;

  if sIdRegraSalario = '' then
     begin
        if (bFlgUsaRubrica) and (reSalarioParticip.Text <> '') then  // Calcular Salario pelo Programa 
        begin
           qryRegra.First;

           rValorBaseCalc   := 0;
           rValorSalManut   := 0;
           rValorRubPerdida := 0;
           rValorRubMantida := 0;

           while not qryRegra.Eof do
           begin
              if qryRegra.FieldByName('FLGTPRUBMANUT').AsString = 'M' then
                 rValorRubMantida := rValorRubMantida + (qryRegra.FieldByName('VALORRUBRICA').AsFloat/100)
              else
                 if qryRegra.FieldByName('FLGTPRUBMANUT').AsString = 'P' then
                    rValorRubPerdida := rValorRubPerdida + (qryRegra.FieldByName('VALORRUBRICA').AsFloat/100);
              qryRegra.Next;
           end;

           reSalarioParticip.Text := ClienteNumero(reSalarioParticip.Text);   
           rValorBaseCalc      := (StrToFloat(reSalarioParticip.Text) / (rValorRubMantida + 1));
           rValorSalManut      := (rValorBaseCalc * rValorRubPerdida) + StrToFloat(reSalarioParticip.Text);
           reSalarioManut.Text :=  ClienteNumero(FormatFloat('#0.00',rValorSalManut));
        end;
        Exit;
     end;

  regCalculo.QueryIn  := qryRegra;
  regCalculo.RuleName := qryRegra.FieldByName('IDRGSALMANUTPART').AsString;
  try
     regCalculo.Execute;
  except
     MsgDlg('Erro na Execução da Regra de Cálculo do Salário de Manutenção.','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end;
  reSalarioManut.Text := ClienteNumero(regCalculo.Result);
end;

procedure TfrmEventoManutParcial.bbtnCancelarClick(Sender: TObject);
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



procedure TfrmEventoManutParcial.LimpaCampos;
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
  reSalarioManut.Text    := '';
  dblkpcmbSitFunc.Text      := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  reSalarioParticip.Text := '';
  edNivel.Text        := '';
  edNivelConf.Text    := ''; 
  dblkpcmbCargoConf.Text := ''; 
  dtRequerimento.Text    := ''; 
  dblkpcmbCargo.Text  := '';
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;
end;



procedure TfrmEventoManutParcial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;



procedure TfrmEventoManutParcial.reSalarioManutExit(Sender: TObject);
begin
  inherited;
  if Trim(reSalarioManut.Text) = '' then
     begin
          MsgDlg('Salário de Manutenção deve ser informado.','Informação',mtInformation,[mbOk,mbHelp],0);
          Exit;
     end;
end;

procedure TfrmEventoManutParcial.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin    
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
     end;// except
  end;//if
  
end;

procedure TfrmEventoManutParcial.reSalarioManutBtnClick(Sender: TObject);
var sMsgErro : string;
begin
  inherited;
  if Trim(dtEvento.Text) =  ''
  then begin
     MsgDlg('Informe a data do evento. ','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSQL(qryAux);
     dtEvento.SetFocus;
     Exit;
  end;

  if (Trim(reSalarioParticip.Text) = '') and (bFlgUsaRubrica)
  then begin
     MsgDlg('Informe o Salário de Participação. ','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSQL(qryAux);
     reSalarioParticip.SetFocus;
     Exit;
  end;

  // Verificar se o plano no qual o participante se encontra utiliza Evolucao Funcional
  // Se sim, então gerar o Resumo Funcional do participante neste momento
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT FLGUSAEVOLFUNC FROM PLANPREV WHERE IDPLANOPREV = '+sIdPlanoPrev);
  qryAux.Open;
  if (not qryAux.IsEmpty) and (qryAux.FieldByName('FlgUsaEvolFunc').AsInteger = 1)
  then begin
     if not CalculaResumoFuncional ( StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                     dtEvento.Text,
                                     sMsgErro )
     then begin
        MsgDlg('Erro na Geração do Resumo Funcional. ['+sMsgErro+'].','Erro',mtError, [mbOk, mbHelp],0);
        Exit;
     end;
  end;

  FrmAguarde.Mostra('Calculando Salário de Manutenção Parcial.');
  ExecutaRegraCalculo;
  FrmAguarde.Apaga;
end;

procedure TfrmEventoManutParcial.reSalarioParticipExit(Sender: TObject);
begin
  inherited;
  if reSalarioParticip.Text = '' then Exit;
  reSalarioParticip.Text := ClienteNumero(reSalarioParticip.Text);
  reSalarioParticip.Text := ClienteNumero(FormatFloat('#0.00',StrToFloat(reSalarioParticip.Text)));
end;



procedure TfrmEventoManutParcial.grdItensSalFieldChanged(Sender: TObject;
  Field: TField);
var sDatafinal : String;  
begin
  inherited;
end;



procedure TfrmEventoManutParcial.sbtnEvolFuncionalClick(Sender: TObject);
var iIdPessJur       : longint; 
    iIdPessoa        : longint; 
    iIdPlanoPrev     : longint; 
    bReabreTransacao : boolean;
begin
  inherited;

  if Trim(sIdPessoa) = ''
  then begin
     MsgDlg('Selecione o Participante.','Erro',mtError,[mbOk],0);
     Exit;
  end;
  bReabreTransacao := False;

  iIdPessJur   := StrToInt(sIdPessJur);
  iIdPessoa    := StrToInt(sIdPessoa);
  iIdPlanoPrev := StrToInt(sIdPlanoPrev);
  try
     frmCadEvolFuncPrev := TfrmCadEvolFuncPrev.Create(Application);

     with frmCadEvolFuncPrev do
     begin
        qry.Close;
        qry.ParamByName('IdPessJur').Value      := iIdPessJur;
        qry.ParamByName('IdPessoa').Value       := iIdPessoa;
        qry.Open;

        if qry.fieldbyname('TITULAR').AsInteger = 1 then
        begin
           lblnome.Caption := 'Nome do Participante';
           lblmat.caption  := 'Matrícula Participante';
           DBText6.Visible := True;
        end else begin
           lblnome.caption := 'Nome Depen./Benef.';
           lblmat.caption  := 'Matrícula Depen./Benef.';
           DBText6.Visible := False;
        end;

        qryEventos.Close;
        qryEventos.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryEventos.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryEventos.Open;

        qryDet.Close;
        qryDet.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryDet.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryDet.Open;

        qryFuncao.Close;
        qryFuncao.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryFuncao.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryFuncao.ParamByName('IDPLANOPREV').Value := iIdPlanoPrev;
        qryFuncao.Open;

        qryAdicCompens.Close;
        qryAdicCompens.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryAdicCompens.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryAdicCompens.Open;

        qryAdicInsalub.Close;
        qryAdicInsalub.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryAdicInsalub.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryAdicInsalub.Open;

        qryAdicPericul.Close;
        qryAdicPericul.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryAdicPericul.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryAdicPericul.Open;

        qryAdicNoturno.Close;
        qryAdicNoturno.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryAdicNoturno.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryAdicNoturno.Open;

        qryATS.Close;
        qryATS.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryATS.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryATS.Open;

        qryRubSalarial.Close;
        qryRubSalarial.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryRubSalarial.ParamByName('IdPessoa').Value    := iIdPessoa;
        qryRubSalarial.Open;

        qryFuncoes.Close;
        qryFuncoes.ParamByName('IdPessJur').Value  := iIdPessJur;
        qryFuncoes.Open;

        qryCargoxNivel.Close;
        qryCargoxNivel.ParamByName('IdPessJur').Value  := iIdPessJur;
        qryCargoxNivel.Open;

        qryProvDesc.Close;
        qryProvDesc.ParamByName('IdPessJur').Value   := iIdPessJur;
        qryProvDesc.Open;

        bInseriuDetalhe := False;
        bEmTransacaoExterna := True; 

      //Jéssica Lana SOL 122115 Ktn 606390 {abre cadastro de evolução funcional}
        TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).WindowState := wsMaximized;
        TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).Visible := false;
        TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).ShowModal;

      //ShowModal;
      //Fim ...

       end;
  except
     raise;
  end;

  if bReabreTransacao
  then begin
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;
end;

procedure TfrmEventoManutParcial.dtEventoExit(Sender: TObject);
begin
  inherited;
  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtEvento.Date;
end;




procedure TfrmEventoManutParcial.BuscaDatasEvolFuncPrev(var sDataInicio,
  sDataFinal: String);
Var
 sSql : String;
begin
 sSql := 'SELECT DISTINCT EV1.DATAINICIO, EV1.DATAFINAL '+#13+
         'FROM EVOLFUNCPREV EV1 '+#13+
         'WHERE EV1.DATAFINAL IS NULL '+#13+
         '  AND EV1.DATAINICIO IS NOT NULL '+#13+
         '  AND EV1.IDCARGOEXT IS NOT NULL '+#13+
         '  AND EV1.IDPESSOA = ' + sIdPessoa +#13+
         '  AND EV1.IDPESSJUR = ' + sIdPessJur +#13+
         '  AND EV1.SEQHISTFUNC IN (SELECT EV2.SEQHISTFUNC '+#13+
         '                         FROM EVOLFUNCPREV EV2 '+#13+
         '                         WHERE EV2.IDPESSOA  = EV1.IDPESSOA '+#13+
         '                           AND EV2.IDPESSJUR = EV1.IDPESSJUR '+#13+
         '                           AND EV2.DATAFINAL IS NULL '+#13+
         '                           AND EV2.IDCARGOEXT IS NOT NULL '+#13+
         '                           AND EV2.DATAINICIO = (SELECT MAX(EV4.DATAINICIO) '+#13+
         '                                                 FROM EVOLFUNCPREV EV4 '+#13+
         '                                                 WHERE EV4.IDPESSOA = EV2.IDPESSOA '+#13+
         '                                                   AND EV4.DATAFINAL IS NULL '+#13+
         '                                                   AND EV4.DATAINICIO IS NOT NULL '+#13+
         '                                                   AND EV4.IDCARGOEXT IS NOT NULL) '+#13+
         '                           AND (1 = (SELECT COUNT(1) '+#13+
         '                                     FROM EVOLFUNCPREV EV3 '+#13+
         '                                     WHERE EV3.IDPESSOA  = EV2.IDPESSOA '+#13+
         '                                       AND EV3.IDPESSJUR = EV2.IDPESSJUR '+#13+
         '                                       AND EV3.DATAFINAL IS NULL '+#13+
         '                                       AND EV3.DATAINICIO IS NOT NULL '+#13+
         '                                       AND EV3.IDCARGOEXT IS NOT NULL) '+#13+
         '                                OR EV2.MODOFUNCAO = ''EF'') ) ';
 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add(sSql);

 qryAux.Open;

 sDataInicio := ' ';
 sDataFinal  := ' ';

 If Not qryAux.IsEmpty
 Then Begin
   sDataInicio := qryAux.FieldByName('DATAINICIO').AsString;
   sDataFinal  := qryAux.FieldByName('DATAFINAL').AsString;
 End;
end;



end.
