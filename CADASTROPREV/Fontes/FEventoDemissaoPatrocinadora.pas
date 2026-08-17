// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Nº SIG:             19411
//Data da Alteração:  28/04/2016
//Alteração Form:     Bloqueado campo data demissao(Liberado apenas para o
//                    sIdEventoGerador = 355 Transferencia de saldo entre
//                    matriculas - mesmo Plano/Patro)
//Responsável:        Darivaldo Alencar
//******************************************************************************
//Nº SOL:             266932-18049
//Nº KINTANA          1239691
//Data da Alteração:  22/02/2016
//Alteração Form:     Bloqueado campo data demissao(Liberado apenas para o
//                    sIdEventoGerador = 340 Participante no prazo de opção dos Institutos)
//Responsável:        André Imakawa
//******************************************************************************
//  Autor      : Marcelo Almeida da Silva
//  Rotina     : Analise de Elegilibidade
//  Data       : 06/10/2010
//  Pendencia  : SOL 136956 - KINTANA 917626
//  Descrição  : Incluir uso da validação de elegibilidade.
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
// Rotinas     : QryEvento
// Autor(a)    : Augusto
// Pendência   : 21839
// Data        : 16/06/2005
// Descricao   : Incluído FLGINTERNO = 'TE' (Transferencia de Patrocinadora)
//               na pesquisa de eventos já registrados
//------------------------------------------------------------------------------
/// Rotinas     : Tela ( campo Data do Evento )
// Autor(a)    : Camille
// Pendência   : 17195
// Data        : 13.07.2004
// Descricao   : Indicar que a data do evento é a data da demissao
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
// Autor(a)    : Carlos Guedes
// Data        : 30/09/2003
// Pendencia   : 15053
// Rotina      : AtualizaHistFuncPrev
// Descrição   : Acrescentando parametros à função.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 27/11/2002
// Alteração   : Passando a data de demissao para calcular o tempo de serviço.
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------

unit FEventoDemissaoPatrocinadora;

interface
                                                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, URegra, TB97Tlbr, UConsPart, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, wwdblook, UAnaliseElegibilidade;

type
  TfrmEventoDemissaoPatrocinadora = class(TfrmOkCancelar)
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
    qrySitPlanoPrev: TwwQuery;
    pnlInformacao: TPanel;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    Label7: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qryAux: TwwQuery;
    Label10: TLabel;
    dtEvento: TCMDateTimePicker;
    lblValores: TLabel;
    Label11: TLabel;
    MontaSelectPart: TMontaSelect;
    qrySitPart: TwwQuery;
    Label13: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qryGrava: TwwQuery;
    regCalculo: TRegra;
    memo: TMemo;
    Panel5: TPanel;
    Label9: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    qryRegra: TwwQuery;
    qryEvento: TwwQuery;
    dtRequerimento: TCMDateTimePicker;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure dtEventoExit(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean;
    iIdEventoPrev: integer;
    sFlgIntPartAntes,
    sIdPessoa,  sIdPessJur, sIdPlanoPrev,   sSeqProposta: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sResultadoRegra: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    bAltera: boolean;
    sEstadoEvento: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6                    : real;

    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    function ValidarAnaliseElegibilidade : Boolean;
    procedure AnaliseElegibilidadeValidouRegra(ARegraElegibilidade : TValidacaoRegraElegibilidade; var Validou: Boolean);
  public
    { Public declarations }
  end;

var
  frmEventoDemissaoPatrocinadora: TfrmEventoDemissaoPatrocinadora;

  {Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  UMovReserva, FMostraContribuicoes, UEventos,
  UModulo, FCadOpcoesElegivel, fAguarde, UIntegraBack, UBeneficio,
  UParticipante, USistema;

{$R *.DFM}

procedure TfrmEventoDemissaoPatrocinadora.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';
  bEncerrou := False;
  if (sIdEventoGerador = '340')// Andre Imakawa SOL 266932/18049 PPM 1239691
  or (sIdEventoGerador = '355') //Darivaldo Alencar SIG 19411
  then dtEvento.ReadOnly := False; 

end;

procedure TfrmEventoDemissaoPatrocinadora.FormShow(Sender: TObject);
begin
  inherited;
  memo.SendToBack;

  qrySitFunc.Close;
  qrysitFunc.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitFunc.Open;
  qrySitPlanoPrev.Close;
  qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoPrev.Open;
  qrySitPart.Close;
  qrysitPart.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPart.Open;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 21.06.2003
  dtmBaseDados.dbBaseDados.StartTransaction;

end;

procedure TfrmEventoDemissaoPatrocinadora.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  memo.SendToBack;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
      begin
          {Carrega Campos}
           sIdPessoa          := MontaSelectPart.ValoresChave[0];
           sIdPessJur         := MontaSelectPart.ValoresChave[1];
           sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];

           if Trim(MontaSelectPart.ValoresChave[14]) <> ''
           then dtEvento.Text     := MontaSelectPart.ValoresChave[14];
           
           sIdSitFunc         := MontaSelectPart.ValoresChave[15];
           sIdSitPart         := MontaSelectPart.ValoresChave[16];
           sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[17];
           sSeqProposta       := MontaSelectPart.ValoresChave[18];
           edNome.Text        := MontaSelectPart.ValoresChave[3];
           edMatricula.Text   := MontaSelectPart.ValoresChave[4];
           edPatro.Text       := MontaSelectPart.ValoresChave[5];
           edPlano.Text       := MontaSelectPart.ValoresChave[6];
           edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
           edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
           edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
           edInscNumero.Text  := MontaSelectPart.ValoresChave[12];

           pnlInformacao.Enabled := True;
           bbtnConfirmar.Enabled := True;
           bbtnCancelar.Enabled  := True;
          {Fim - Carrega Campos}

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


              //dtEvento.Text             := '';   SIG19411
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

             
           end
           else begin

              bAltera := True;

              
              if sEstadoEvento = 'REGISTRADO'
              then begin// Pode Alterar
                 MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
                 bAltera := True;
                 dtEvento.SetFocus;
              end
              else if sEstadoEvento = 'EFETIVADO'
                   then begin// Não Pode Alterar, nem inserir outro evento
                      MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
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
              sFlgIntPartAntes          := qryEvento.FieldByName('FLGINTANT').AsString;
              dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString; 
           end;

           //BRUNO AZEVEDO SOL KINTANA
           if not(ValidarAnaliseElegibilidade) then
           begin
             if dtmBasedados.dbBaseDados.InTransaction then begin
               dtmBasedados.dbBaseDados.RollBack;
             end;
             LimpaCampos;
             Exit;
           end;
           //BRUNO AZEVEDO SOL KINTANA
      end;

      
     if  (montaselectpart.retornouvalor)  and (sEstadoEvento = 'NAO REGISTRADO')then
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitPart.text:='';
       dblkpcmbSitFunc.TexT:='';
     end;
end;

procedure TfrmEventoDemissaoPatrocinadora.VerificaEstadoEvento;
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
      else begin
         if FieldByName('IdEventoGerador').AsInteger  <> StrToInt(sIdEventoGerador)
         then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
         else if FieldByName('FLGEFETIVADO').AsString = '0'
              then begin
                 sEstadoEvento := 'REGISTRADO'; // Pode Alterar
                 sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
              end
              else sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
      end;
   end;

end;

procedure TfrmEventoDemissaoPatrocinadora.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef, sMsgErro,
  sIdEvento, sNomeTitular: string;
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

  if UpperCase(sResultadoRegra) = 'FALSE' then Exit;


  If Trim(dtRequerimento.Text) = ''
   Then Begin
     MsgDlg('A data do requerimento deve ser preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     dtRequerimento.SetFocus;
     Exit;
   End;

   //BRUNO AZEVEDO
  {if not(ValidarAnaliseElegibilidade) then
  begin
    Exit;
  end;}

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

  if not bAltera then
     VerificaeGravaSituacoes;

  GravaEVENTOSPREV;

 {Grava Data de Demissão}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET DATADEMISSAO = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' +
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

  
  if not AtualizaHistFuncPrev ( qryAux, StrToInt(sIdPessJur), StrToInt(sIdPessoa), '',Trim(dtEvento.Text), sIdEventoGerador )
  
  then begin
     MsgDlg('Erro ao atualizar histórico funcional. Verifique.','Erro',mtError,[mbOk],0);
     Exit;
  end;


  if not bAltera
  then begin

     sMesRef := Copy(dtEvento.Text,7,4)+'/'+Copy(dtEvento.Text,4,2);
     GravaHSTCONTEVENTOSPRFechado( IntToStr(iIdEventoPrev),
                                   sIdPlanoPrev,
                                   sIdEventoGerador,
                                   '',
                                   sIdPessoa,
                                   sIdPessJur,
                                   sSeqProposta,
                                   '',
                                   '',
                                   dtEvento.Text,
                                   True,
                                   qryAux,
                                   qryGrava,
                                   sIdPlanoPrev );

     if not bEncerrou
     then begin
        if not SuspendeContribuicoes( sIdPessJur,
                                      sIdPlanoPrev,
                                      sIdPessoa,
                                      sSeqProposta,
                                      sIdEventoGerador,
                                      dtEvento.Text,
                                      '',
                                      edMatricula.
                                      Text,
                                      sIdSitPart,
                                      qryAux,
                                      qryGrava,
                                      sFlgInterno,
                                      sFlgIntPartAntes)
        then begin
           MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           dtmBasedados.dbBaseDados.RollBack;
           LimpaCampos;
           dtmBaseDados.dbBaseDados.StartTransaction;
           exit;
        end;
     end;

     if not AssociaNovasContribuicoes( sIdPessJur,
                                       sIdPlanoPrev,
                                       sIdPessoa,
                                       sSeqProposta,
                                       sIdEventoGerador,
                                       dtEvento.Text,
                                       '',
                                       edMatricula.Text,
                                       qrySitPart.FieldByName('IDSITPART').AsString,
                                       '',
                                       False,
                                       True,
                                       False, 
                                       qryAux,
                                       qryGrava,
                                       sFlgInterno,
                                       iIdEventoPrev,
                                       '')
     then begin
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;

     MostraContribuicoes( IntToStr(iIdEventoPrev), edNome.Text, edPatro.Text, edPlano.Text);

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

  memo.Clear;
  MoveReserva(sIdEvento, sIdPessoa, sSeqProposta, sNomeTitular, '', qryAux, regCalculo, sMsgErro,
              sIdPessJur, sIdPlanoPrev, '', sIdPessJur, sIdPlanoPrev, '', bFlgIntContab,'',StrToDate(dtEvento.Text),
              '', '', 'F', '', 0, 0, StrToDate(dtEvento.Text),'');
  memo.BringToFront;

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes('Evento Demissão da Patrocinadora') Then
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
 

  dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
  LimpaCampos;
  TiraSql(qryAux);

  
  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);
  

  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoDemissaoPatrocinadora.VerificaeGravaSituacoes;
begin
 {Se o Evento não requer Benefício, grava as situações de Imediato, e já grava o evento como efetivado}
  sFlgEfetivado  := '1';
  sDataEfetivado := ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')';

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


 {Grava nova Situação do Participante na Fundação e no Plano}
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

procedure TfrmEventoDemissaoPatrocinadora.GravaEVENTOSPREV;
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
                         '                         DATAEFETIVADO, FLGEFETIVADO, '+
                         
                         '                         INSCRICAONUMERO, DATAREQUERIMENTO) ' + 
                         
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoa  + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                      '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                      '''' + qrySitFunc.FieldByName('IDSITFUNC').AsString + '''' + ',' + qrySitPart.FieldByName('IDSITPART').AsString + ',' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                      sDataEfetivado + ',' + sFlgEfetivado + ','+
                         
                                      edInscNumero.Text + ', ' +
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
                         '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANONOVO  = ' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString +
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

procedure TfrmEventoDemissaoPatrocinadora.bbtnCancelarClick(Sender: TObject);
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

procedure TfrmEventoDemissaoPatrocinadora.LimpaCampos;
begin
  edNome.Text               := '';
  edMatricula.Text          := '';
  edPatro.Text              := '';
  edPlano.Text              := '';
  edSitPatro.Text           := '';
  edSitFundacao.Text        := '';
  edSitPlano.Text           := '';
  edInscNumero.Text         := '';
  dtEvento.Text             := '';
  dtRequerimento.Text       := '';  
  dblkpcmbSitFunc.Text      := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;    
end;

procedure TfrmEventoDemissaoPatrocinadora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

procedure TfrmEventoDemissaoPatrocinadora.bbtnOpcoesClick(Sender: TObject);
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


procedure TfrmEventoDemissaoPatrocinadora.dtEventoExit(Sender: TObject);
begin
  inherited;

  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtEvento.Date;

end;

function TfrmEventoDemissaoPatrocinadora.ValidarAnaliseElegibilidade: Boolean;
var
  analiseElegibilidade : TAnaliseElegibilidade;
begin
  Result := True;
  if (TAnaliseElegibilidade.LocalizarRegraElegibilidade(sIdEventoGerador, sFlgInterno) = reElegibilidadeBPD) then
  begin
    analiseElegibilidade := TAnaliseElegibilidade.Create('BaseDados',
                                                         reElegibilidadeBPD,
                                                         StrToInt(sIdPessoa),
                                                         StrToInt(sIdPlanoPrev),
                                                         StrToInt(sIdEventoGerador),
                                                         Trim(dtEvento.Text),
                                                         Trim(dtRequerimento.Text),
                                                         Trim(sFlgIntPartAntes),
                                                         Trim(sFlgInterno),
                                                         Trim(sIdSitPart),
                                                         Trim(sIdSitPlanoPrev),
                                                         Trim(sIdSitFunc),
                                                         Trim(qrySitPart.FieldByName('IDSITPART').AsString),
                                                         Trim(qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString),
                                                         Trim(qrySitFunc.FieldByName('IDSITFUNC').AsString),
                                                         StrToInt(sIdPessoa),
                                                         StrToInt(sIdPessJur));

    try
      analiseElegibilidade.OnValidouAnaliseElegibilidade := AnaliseElegibilidadeValidouRegra;
      Result := analiseElegibilidade.ValidarRegra();
      if not(Result) then
      begin
        MsgDlg(analiseElegibilidade.MensagemRegrasNaoElegiveis, 'Analise de Elegibilidade', mtInformation, [mbOk], 0);
      end;
    finally
      FreeAndNil(analiseElegibilidade);
    end;
  end;
end;

procedure TfrmEventoDemissaoPatrocinadora.AnaliseElegibilidadeValidouRegra(
  ARegraElegibilidade: TValidacaoRegraElegibilidade; var Validou: Boolean);
begin
  if ((ARegraElegibilidade = vrePossui120DiasContadosAPartirDataFatoGerador) and (not(Validou))) then
  begin
    Validou := (MessageDlg('A data de início do afastamento está anterior a 120 dias da data atual.', mtConfirmation, mbOKCancel, 0) = mrOk);
  end;

  if ((ARegraElegibilidade = vreValidarVerificacaoFinanciamentoHabitacional) and (not(Validou))) then
  begin
    Validou := (MessageDlg('Participante possui financiamento habitacional ativo.', mtInformation, [mbOK], 0) = mrOk);
  end;

  if ((ARegraElegibilidade = vreValidarBeneficiosPeculio) and (not(Validou))) then
  begin
    Validou := (MessageDlg('Participante Falecido.', mtConfirmation, mbOKCancel, 0) = mrOk);
  end;
end;

end.
