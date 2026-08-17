// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Nº SOL:             266932-18049
//Nº KINTANA          1239691
//Data da Alteração:  22/02/2016
//Alteração Form:     ReadOnly = true para campo data demissao
//Responsável:        André Imakawa
//******************************************************************************
//  Autor      : William Moreira da Silva
//  Rotina     : Busca do participante
//  Data       : 21/07/2015
//  Pendencia  : SOL 257947 - PPM 984201
//  Descrição  : Incluir a condição idsitplanoprev  IN (25,27,28,29)) para as buscas do participante
//------------------------------------------------------------------------------
//  Autor      : Marcelo Almeida da Silva
//  Rotina     : Analise de Elegilibidade
//  Data       : 06/10/2010
//  Pendencia  : SOL 136956 - KINTANA 917626
//  Descrição  : Incluir uso da validação de elegibilidade.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
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
// Data        : 19.03.2004
// Pendência   : 16257
// Descrição   : Foi incluido um aviso, quando  o participante estiver ativo na
//               patrocinadora e sua data de demissão estiver preenchida.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 27/11/2003
// Pendência   : 15053
// Rotina      : bbtnConfirmarClick
// Descrição   : Criação da rotina para ascrescer uma linha no histórico Funcional
//               do participante
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/11/2003
// Pendência   : 15143
// Rotina      : ExecutaRegraElegibilidade
// Descrição   : Acrescido o comando "frmAguarde.Apaga"
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 20/10/2003
// Pendência   : 15053
// Rotinma     : bbtnConfirmarClick
// Descrição   : Inserindo datainicio à função AtualizaHistFuncPrev
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

unit FEventoDemissaoManutSaldo;

interface
                                                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, URegra, TB97Tlbr, UConsPart, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, wwdblook, UAnaliseElegibilidade, dbclient;

type
  TfrmEventoDemissaoManutSaldo = class(TfrmOkCancelar)
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
    lblDataDemissao: TLabel;
    dtDataDemissao: TCMDateTimePicker;
    dtRequerimento: TCMDateTimePicker;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure dtDataDemissaoExit(Sender: TObject);
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
    procedure ExecutaRegraElegibilidade;   
    
    function InsereHistFunc(piIdPessoa, piIdPessjur : Integer;
                            psDataInicio, psDataProcesso, psMatricula  :String) : Boolean;

    function ValidarAnaliseElegibilidade : Boolean;
    procedure AnaliseElegibilidadeValidouRegra(ARegraElegibilidade : TValidacaoRegraElegibilidade; var Validou: Boolean);
  public
    { Public declarations }
  end;

var
  frmEventoDemissaoManutSaldo: TfrmEventoDemissaoManutSaldo;

  {Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  UMovReserva, FMostraContribuicoes, UEventos,
  FCadOpcoesElegivel, fAguarde, UIntegraBack, UBeneficio,
  UParticipante, Usistema;

{$R *.DFM}

procedure TfrmEventoDemissaoManutSaldo.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';
  bEncerrou := False; 
end;

procedure TfrmEventoDemissaoManutSaldo.FormShow(Sender: TObject);
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
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoDemissaoManutSaldo.bbtnProcurarClick(Sender: TObject);
var
tipsit : string;
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
           dtDataDemissao.Text:= MontaSelectPart.ValoresChave[14];

       
           tipsit := MontaSelectPart.ValoresChave[19];
           if (tipsit =  'A') and (dtDataDemissao.Text <> '') then
                MsgDlg('Este participante está com situação da categoria ATIVO na patrocinadora porém já possui data de demissão preenchida. Verifique. ','Informação',mtInformation,[mbOk],0)  ;


        
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
            
              dtEvento.Text             := '';
              dblkpcmbSitFunc.Text      := '';
              dblkpcmbSitPlanoPrev.Text := '';
              dblkpcmbSitPart.Text      := '';  
  
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
              dtEvento.Date             := StrToDAte(qryEvento.FieldByName('DataEvento').AsString);
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

      
if  (montaselectpart.retornouvalor)  and (sEstadoEvento = 'NÃO REGISTRADO')  then
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitPart.text:='';
       dblkpcmbSitFunc.TexT:='';
     end;
end;

procedure TfrmEventoDemissaoManutSaldo.VerificaEstadoEvento;
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

procedure TfrmEventoDemissaoManutSaldo.bbtnConfirmarClick(Sender: TObject);
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
  if (dtDataDemissao.Text = '') then
     begin
          MsgDlg('A data de demissão deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtDataDemissao.SetFocus;
          Exit;
     end;
  if StrToDate(dtEvento.Text) < StrToDate(dtDataDemissao.Text)
  then begin
     MsgDlg('A data da manutenção deve ser maior ou igual a data de demissão.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtEvento.SetFocus;
     TiraSql(qryAux);
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

  if qrySitPart.FieldByName('FLGINTERNO').AsString <> 'MS' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser da Categoria Manutenção de Saldo de Conta.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
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

  //BRUNO AZEVEDO SOL KINTANA
  //ExecutaRegraElegibilidade;
  //BRUNO AZEVEDO SOL KINTANA

  if UpperCase(sResultadoRegra) = 'FALSE' then Exit;

  if not bAltera then
     VerificaeGravaSituacoes;

  GravaEVENTOSPREV;

 {Grava Data de Demissão}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET DATADEMISSAO = To_Date(''' + Trim(dtDataDemissao.Text) + ''',''dd/MM/yyyy'')' +
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


  If prmFlgContaTempInsc = 1 Then
    If Not InsereHistFunc(StrToInt(sIdPessoa),StrToInt(sIdPessjur),                          
                          dtEvento.Text, FormatDateTime('dd/mm/yyyy', Date), edMatricula.Text) Then 
      MsgDlg('Erro ao incluir Histórico Funcional de Diferimento.','Erro', mtError, [mbok],0);


 {Grava Data de Manutenção}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET DATAINICIOMANUT = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' +
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
          True, qryAux, qryGrava,sIdPlanoPrev);

          if not bEncerrou
          then begin
             if not SuspendeContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                          edMatricula.Text, sIdSitPart, qryAux, qryGrava,
                                          sFlgInterno,
                                          sFlgIntPartAntes) then 
                begin
                     MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
                     dtmBasedados.dbBaseDados.RollBack;
                     LimpaCampos;
                     dtmBaseDados.dbBaseDados.StartTransaction;
                     exit;
                end;
          end;


          if not AssociaNovasContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                           edMatricula.Text, qrySitPart.FieldByName('IDSITPART').AsString, '',False, True,
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
      If Not Sistema.GravaLogOperacoes('Evento Demissão com Manutenção de Saldo de Contas') Then
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

procedure TfrmEventoDemissaoManutSaldo.VerificaeGravaSituacoes;
begin
 {Se o Evento não requer Benefício, grava as situações de Imediato, e já grava o evento como efetivado}
  sFlgEfetivado  := '1';  
  sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')'; 
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

procedure TfrmEventoDemissaoManutSaldo.GravaEVENTOSPREV;
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
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + 
                         ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoa  + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                      '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                      '''' + qrySitFunc.FieldByName('IDSITFUNC').AsString + '''' + ',' + qrySitPart.FieldByName('IDSITPART').AsString + ',' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                      sDataEfetivado + ',' + sFlgEfetivado +','+OraNumero(edInscNumero.Text) + ', ' +
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
  else
     begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' +  
                         '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAREQUERIMENTO = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' + 
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

procedure TfrmEventoDemissaoManutSaldo.bbtnCancelarClick(Sender: TObject);
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

procedure TfrmEventoDemissaoManutSaldo.LimpaCampos;
begin
  edNome.Text               := '';
  edMatricula.Text          := '';
  edPatro.Text              := '';
  edPlano.Text              := '';
  edSitPatro.Text           := '';
  edSitFundacao.Text        := '';
  edSitPlano.Text           := '';
  edInscNumero.Text         := '';
  dtDataDemissao.Text       := '';
  dtEvento.Text             := '';
  dblkpcmbSitFunc.Text      := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  dtRequerimento.Text       := '';  
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;
end;

procedure TfrmEventoDemissaoManutSaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

procedure TfrmEventoDemissaoManutSaldo.bbtnOpcoesClick(Sender: TObject);
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
     end;// except
  end;//if
end;

procedure TfrmEventoDemissaoManutSaldo.ExecutaRegraElegibilidade;
var
  sUltMesPreparo,
  sIdRegraCancelamento,
  sSQL: string;
begin
  sUltMesPreparo := CalcUltMesContribuicao(StrToInt(sIdPessJur),
                                           StrToInt(sIdPlanoPrev),
                                           StrToInt(sIdPessoa),
                                           StrToInt(sSeqProposta),-1,
                                           Copy(Trim(dtEvento.Text),7,4)+'/'+Copy(Trim(dtEvento.Text),4,2),
                                           qryAux);

  // Executar Regra de Manutancao com saldo de contas - Passa para a regra os mesmos dados da Regra de Admissão
  frmAguarde.Mostra('Executando Regra de Elegibilidade a Manutenção de Saldo de Conta ...');

  sSQL := ' SELECT PL.IDREGRADESISTENC, PP.IDPESSOA,          PP.IDPESSJUR,        PP.IDPLANOPREV,              ' +
          '        PP.SEQPROPOSTA,      EL.IDSITFUNC,         EL.CODCENTROCUSTO,   EL.IDCARGOEXT, EL.MATRICULA, ' +
          '        EL.DATAADMISSAO,     EL.SALTOTAL,          EL.PARTICIPPREVID,   EL.PARTICIPASSIST,     ' +
          '        EL.NIVEL,            EL.TEMPOSERVANTERIOR, PF.DATANASC,         PF.SEXO, PF.DATAMORTE, ' +
          '        PF.ESTCIVIL,         P.NUMDOCUMENTO,       PP.IDSITPART,        PP.IDSITPLANOPREV,     ' +
          '        PP.INSCRICAODATA,    PP.DTINICIOINSC,   '+
          OraNumero(sIdSitFunc) + ' AS IDSITFUNCATUAL,     '+
          OraNumero(sIdSitPart) + ' AS IDSITPARTATUAL,     '+
          OraNumero(sIdSitPlanoPrev)+' AS IDSITPLANOATUAL, '+
          OraNumero(qrySitFunc.FieldByName('IdSitFunc').AsString) + ' AS IDSITFUNCNOVO,     '+
          OraNumero(qrySitPart.FieldByName('IdSitPart').AsString) + ' AS IDSITPARTNOVO,     '+
          OraNumero(qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString) + ' AS IDSITPLANONOVO, '+
          OraNumero(qrySitFunc.FieldByName('IdSitFunc').AsString) + ' AS IDSITFUNCNOVA,     '+
          OraNumero(qrySitPart.FieldByName('IdSitPart').AsString) + ' AS IDSITPARTNOVA,     '+
          OraNumero(qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString) + ' AS IDSITPLANONOVA, '+
          '        PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO, PP.FLGDEVEPREVIDENC, PL.IDREGRACANCDESC,    ' +   
          ''''+sUltMesPreparo+''' AS ULTMESPREPARO, '+
          ''''+Trim(dtDataDemissao.Text)     +''' AS DATADEMISSAO, '+
          '        To_Date(''' + Trim(dtEvento.Text)      + ''',''DD/MM/yyyy'') AS DTEVENTO, ' +
          '        To_Date(''' + Trim(dtEvento.Text)      + ''',''DD/MM/yyyy'') AS DATAEVENT, ' +
          '        To_Date(''' + Trim(dtEvento.Text)      + ''',''DD/MM/yyyy'') AS DATAREF,   ' +
          OraNumero(sIdEventoGerador)+' AS IDEVENTOGERADOR, '+
          '        PLP.IDREGRAMANUTSALD     '+  
          ' FROM  PARTPREVPLAN PP, ELEGPATRO EL, PLANPREV PL, PESSOAFISICA PF, PESSOA P, PLANPREVPATRO PLP ' +
          ' WHERE PP.IDPESSOA    = ' + sIdPessoa    + ' AND ' +
          '       PP.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       PP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       PP.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
          '       EL.IDPESSOA    = PP.IDPESSOA      AND ' +
          '       EL.IDPESSJUR   = PP.IDPESSJUR     AND ' +
          '       PP.IDPLANOPREV = PL.IDPLANOPREV   AND ' +
          '       PP.IDPESSOA    = PF.IDPESSOA      AND ' +
          '       PP.IDPESSOA    = P.IDPESSOA       AND ' +
          '       PP.IDPESSJUR   = PLP.IDPESSJUR    AND ' +
          '       PP.IDPLANOPREV = PLP.IDPLANOPREV  ';
  qryRegra.Close;
  qryRegra.Sql.Clear;
  qryRegra.Sql.Add(sSQL);
  try
     qryRegra.Open;
  except
     on E:EDBEngineError do
     begin
         frmAguarde.Apaga;
         MostrarErro(E);
         sResultadoRegra := 'False';
         Exit;
     end;
  end;

  sIdRegraCancelamento := qryRegra.FieldByName('IDREGRAMANUTSALD').AsString;  

  if (sIdRegraCancelamento) = ''
  then begin
     frmAguarde.Apaga;  
     sResultadoRegra := 'True';
     Exit;
  end;

  regCalculo.QueryIn  := qryRegra;
  regCalculo.RuleName := sIdRegraCancelamento;

  try
     regCalculo.Execute;
  except
     frmAguarde.Apaga;
     MsgDlg('Erro na Execução da Regra de Elegibilidade por Manutenção de Saldo de Conta Nº '+
            sIdRegraCancelamento,'Informação',mtInformation,[mbOk,mbHelp],0);
     sResultadoRegra := 'False';
     TiraSql(qryAux);
     Exit;
  end;
  frmAguarde.Apaga;

  sResultadoRegra := regCalculo.Result;
  if (UpperCase(sResultadoRegra) <> 'FALSE') and (UpperCase(sResultadoRegra) <> 'TRUE')
  then begin
     MsgDlg('A Regra de Elegibilidade por Manutencão de Saldo de Conta Nº '+
            sIdRegraCancelamento+
            ' retornou um resultado inválido. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end
  else begin
     if UpperCase(sResultadoRegra) = 'FALSE'
     then begin
        MsgDlg('A Regra de Elegibilidade por Manutencão de Saldo de Conta Nº '+
               sIdRegraCancelamento+
               ' não permitiu o cancelamento do participante. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSql(qryAux);
        Exit;
     end;
  end;
end;

procedure TfrmEventoDemissaoManutSaldo.dtDataDemissaoExit(Sender: TObject);
begin
  inherited;
  inherited;
  if dtDataDemissao.Text = '' then Exit;
  if StrToDate(dtEvento.Text) < StrToDate(dtDataDemissao.Text)
  then begin
     MsgDlg('A data da manutenção deve ser maior ou igual a data de demissão.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtDataDemissao.SetFocus;
     TiraSql(qryAux);
  end;

end;


function TfrmEventoDemissaoManutSaldo.InsereHistFunc(piIdPessoa,
  piIdPessjur: Integer; psDataInicio, psDataProcesso,
  psMatricula: String): Boolean;
Var
 iSeqHistFunc,
 iLixo         : Integer;
begin
 Result := False;

 iSeqHistFunc := LeUltRegistro(nil, 'HISTFUNCPREV');

 
 // TROQUEI QRYAUX2 POR QRYAUX, POIS O OBJETO QRYAUX2 NÃO EXISTE
 With qryAux do
  Begin
   // Grava no ultimo registro da HistfuncPrev
   // a data de demissão como data final
   Close;
   SQL.Clear;
   SQL.Add('UPDATE HISTFUNCPREV');
   SQL.Add('SET DATAFINAL = TO_DATE('+QuotedStr(dtDataDemissao.Text)+','+QuotedStr('DD/MM/YYYY')+')');
   SQL.Add('WHERE IDPESSOA = '+IntToStr(piIdPessoa));
   SQL.Add('  AND SEQHISTFUNC = (SELECT MAX(SEQHISTFUNC)');
   SQL.Add('                     FROM HISTFUNCPREV ');
   SQL.Add('                     WHERE IDPESSOA = '+IntToStr(piIdPessoa)+')');

   Try
    ExecSQL;
   Except
    Exit;
   End;

   // Insere uma linha na HistfuncPrev
   // Para o evento de diferimento.
   Close;
   SQL.Clear;
   SQL.Add('INSERT INTO HISTFUNCPREV');
   SQL.Add('(IDPESSOA, IDPESSJUR, SEQHISTFUNC, DATAINICIO, FLGCONTATS,');
   SQL.Add('FLGCONCOMITANTE, DATAPROCESSO, MATRICULA, EMPRESA)');
   SQL.Add('VALUES (');
   SQL.Add(IntToStr(piIdPessoa)+',');     // IDPESSOA
   SQL.Add(IntToStr(piIdPessjur)+',');    // IDPESSJUR
   SQL.Add(IntToStr(iSeqHistFunc)+',');       // SEQHISTFUNC
   SQL.Add('TO_DATE('+QuotedStr(psDatainicio)+','+QuotedStr('DD/MM/YYYY')+'), ');  // DATAINICIO
   SQL.Add('1, ');                        // FLGCONTATS
   SQL.Add('0, ');                        // FLGCONCOMITANTE
   SQL.Add('TO_DATE('+QuotedStr(psDataProcesso)+','+QuotedStr('DD/MM/YYYY')+'), ');// DATAPROCESSO
   SQL.Add(QuotedStr(psMatricula)+', ');  // MATRICULA
   SQL.Add(QuotedStr('DIFERIMENTO')+')'); // DIFERIMENTO

   Try
    ExecSQL;
   Except
    Exit;
   End;

  End;

 iLixo := CalcTempoContrib(qryAux,
                           piIdPessoa,
                           iSeqHistFunc,
                           1,
                           1,
                           DateTimeToStr(dtEvento.Date),
                           '',
                           
                           FormatDateTime('dd/mm/yyyy', Date)); 
 Result:= True;
end;


procedure TfrmEventoDemissaoManutSaldo.dtEventoExit(Sender: TObject);
begin
  inherited;
  
  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtEvento.Date;
  
end;

//BRUNO AZEVEDO SOL KINTANA
function TfrmEventoDemissaoManutSaldo.ValidarAnaliseElegibilidade: Boolean;
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

procedure TfrmEventoDemissaoManutSaldo.AnaliseElegibilidadeValidouRegra(
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
//BRUNO AZEVEDO SOL KINTANA

end.
