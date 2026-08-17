// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
// Autor       : Augusto
// Data        : 11/07/2006
// Rotina      : bbtnConfirmarClick
// Pendência   : 22866
// Descrição   : Retirada a obrigação de informar o salário.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Rotina      : bbtnConfirmarClick
// Data        : 04/07/2006
// Pendência   : 22729
// Descrição   : Correção para não considerar mês de abono menor que o último mês
//               de contribuição.
//               Mudança da crítica sobre a data de reinscrição para um aviso.
//------------------------------------------------------------------------------
// Autor       : GravaEVENTOSPREV
// Data        : 28/11/2005 e 02122005
// Pendência   : 20836
// Descrição   : alterações para: mostrar demonstrativo padrão e pedir confirmação de associação de contribuições apenas uma vez.
//------------------------------------------------------------------------------
// Autor       : GravaEVENTOSPREV
// Data        : 03/02/2005
// Pendência   : 17459
// Descrição   : Gravar matricula na EVENTOSPREV
//------------------------------------------------------------------------------
// Autor       : Camille
// Data        : 23.08.2004
// Pendência   : ------
// Descrição   : Passar mataricula para rotina ReativaParticipanteNaPatro
//------------------------------------------------------------------------------
// Rotina      : ValidaBeneficioAnterior
// Autor(a)    : Camille
// Pendência   : 16616
// Data        : 26.04.2004
// Descricao   : Criacao de variavel para dizer se encerrou ou nao beneficio
//               para que os eventos possam saber se devem ou não encerrar
//               as contribuicoes.
//------------------------------------------------------------------------------
// Rotina      : MostraContribuicoesInscricao
// Autor(a)    : Gleyber
// Data        : 05/04/2004
// Pendência   : 16430
// Alteração   : Criação da rotina para visualização das associações de contribuições.
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Gleyber
// Data        : 25/03/2004
// Pendência   : 16354
// Alteração   : Atribuindo valor à variável sIdTitular do componente ConsPart.
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 25/03/2004
// Pendência   : 16256
// Alteração   : Inserção da rotina de para abertura da tela de de contribuições
//               do participante.
//------------------------------------------------------------------------------
// Rotina      : ReativaParticipanteNaPatro
// Autor(a)    : Camille
// Data        : 20.01.2004
// Pendência   : ------
// Alteração   : Permitir a passagem do salário do ativo na volta
//------------------------------------------------------------------------------
// Autor       : Carlos Guedes
// Data        : 16/10/2003
// Pendência   : 15053
// Descrição   : Alterando função (chamada) InsereHistFuncPrev 
//------------------------------------------------------------------------------
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
// Data        : 23/07/2003
// Alteração   : Criada função VerificaDatas, utilizada na VerificaEstadoEvento.
//               Para permitir uma outra "Reinscrição"...
// Pendência   : 14626
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
// Rotina    : ExecutaRegraDataPgtoBeneficio
// Autor(a)  : Camille
// Data      : 12.07.2002
// Alteração : Alterei parâmetro para atualizacao da PARTPREVPLAN pois este
//             update é para ser feito na nova patrocinadora e nao na antiga 
// -----------------------------------------------------------------------------
unit FEventoReinscricao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, TREdit, URegra, TB97Tlbr, Mask, DBCtrls, UConsPart,
  IvDictio, IvMulti, IvEMulti, TEdNum, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook;

type
  TfrmEventoReinscricao = class(TfrmOkCancelar)
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
    lblValores: TLabel;
    Label11: TLabel;
    MontaSelectPart: TMontaSelect;
    qrySitPart: TwwQuery;
    Label13: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    regCalculo: TRegra;
    Label10: TLabel;
    dtEvento: TCMDateTimePicker;
    qryGrava: TwwQuery;
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
    Label1: TLabel;
    edNovaInscricao: TEdit;
    Label4: TLabel;
    dtDemissao: TCMDateTimePicker;
    Label12: TLabel;
    dtInscricao: TCMDateTimePicker;
    Label14: TLabel;
    edTempoAfast: TEdit;
    Label15: TLabel;
    memResult: TMemo;
    Label16: TLabel;
    edNovoSalario: TEditNum;
    Label17: TLabel;
    edTempoServAnt: TEditNum;
    Label18: TLabel;
    Label19: TLabel;
    edUltMesContrib: TEditNum;
    Label20: TLabel;
    edUltAnoContrib: TEditNum;
    edNovaMatricula: TEdit;
    lblMatricula: TLabel;
    qryEvento: TwwQuery;
    qryPatro: TwwQuery;
    lblNovaPatro: TLabel;
    dblkpcmbNovaPatro: TwwDBLookupCombo;
    lblAdmissao: TLabel;
    dtAdmissao: TCMDateTimePicker;
    Label21: TLabel;
    dtCancelamento: TCMDateTimePicker;
    qryHstContribPrev: TwwQuery;
    qryMostraContribuicao: TwwQuery;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure dtEventoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean; 
    iTempoAfastIni,
    iIdEventoPrev: integer;
    sInscricaoData,
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta, sDataNasc: string;
    sFlgIntSitFunc, sFlgIntSitPart, sFlgIntSitPlano,
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sTempoServAntReal: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;


    bEfetivado,   // informa se o evento foi efetivado
    bRegistrado,  // informa se o evento foi registrado
    bRequerBenef  // informa se o usuario clicou no botao Requerimento de beneficio
                  : boolean;

    sEstadoEvento: string;
    pIdSitFunc, pIdSitPart, pIdSitPlanoPrev, pTipoSit: string;
    rOpcao1,               rOpcao2,                  rOpcao3  ,
    rOpcao4,               rOpcao5,                  rOpcao6                : real;    
    procedure VerificaeGravaSituacoes;
    function  GravaEVENTOSPREV : boolean;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    Function VerificaDatas: Boolean;
    procedure MostraContribuicoesInscricao;  
  public
    { Public declarations }
  end;

var
  frmEventoReinscricao: TfrmEventoReinscricao;

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FCadContribParticipante, FMostraContribuicoes, UEventos,
  UModulo, FCadOpcoesElegivel, UContribuicaoPrev, UParticipante, UBeneficio,
  fAguarde, USistema, fNovaDataReinscricao,UMovReserva, FMostraAux;

{$R *.DFM}

procedure TfrmEventoReinscricao.FormCreate(Sender: TObject);
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

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;
  bEncerrou := False; 

end;

procedure TfrmEventoReinscricao.bbtnProcurarClick(Sender: TObject);
var sUltAnoMesPreparo,
    sDataDemissao       : string;
begin
  inherited;
  memResult.Lines.Clear;
  memResult.Lines.Add('Resultados para o Registro do Evento : ');
  memResult.Lines.Add('==================================== ');

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     sIdPessoa          := MontaSelectPart.ValoresChave[0];
     sIdPessJur         := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
     sIdSitFunc         := MontaSelectPart.ValoresChave[15];
     sIdSitPart         := MontaSelectPart.ValoresChave[16];
     sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[17];
     sSeqProposta       := MontaSelectPart.ValoresChave[19];
     edNome.Text        := MontaSelectPart.ValoresChave[3];
     edMatricula.Text   := MontaSelectPart.ValoresChave[4];
     edPatro.Text       := MontaSelectPart.ValoresChave[5];
     edPlano.Text       := MontaSelectPart.ValoresChave[6];
     edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
     edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
     edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
     sDataNasc          := MontaSelectPart.ValoresChave[11];
     sInscricaoData     := MontaSelectPart.ValoresChave[13];

     edNovaMatricula.Text    := MontaSelectPart.ValoresChave[4];
     dtAdmissao.Text         := MontaSelectPart.ValoresChave[31];
     dtDemissao.Text         := MontaSelectPart.ValoresChave[30];
     edInscNumero.Text       := MontaSelectPart.ValoresChave[12];
     edNovaInscricao.Text    := edInscNumero.Text;

     qryPatro.Close;
     qryPatro.ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
     qryPatro.Open;
     qryPatro.Locate('IdPessoa', StrToInt(sIdPessJur),[loCaseInsensitive]);


     dblkpcmbNovaPatro.Text  := qryPatro.fieldbyname('NOME').AsString ; 
     dblkpcmbNovaPatro.PerformSearch;
     
     // Se o participante estava demitido, entao permitir a inclusao dele em uma nova
     // Patrocinadora. Senao, obrigar a reinscricao na mesma patrocinadora.
     sDataDemissao            := MontaSelectPart.ValoresChave[30];
     if Trim(sDataDemissao) <> ''
     then begin
        dblkpcmbNovaPatro.Enabled := True;
        edNovaMatricula.Enabled   := True;
        dblkpcmbNovaPatro.Color   := clWindow;
        edNovaMatricula.Color     := clWindow;
        lblNovaPatro.Caption      := 'Patrocinadora na qual o Participante está Reingressando';
     end
     else begin
        dblkpcmbNovaPatro.Enabled := False;
        edNovaMatricula.Enabled   := False;
        dblkpcmbNovaPatro.Color   := clSilver;
        edNovaMatricula.Color     := clSilver;
        lblNovaPatro.Caption      := 'Patrocinadora do Participante';
     end;

     if Trim(MontaSelectPart.ValoresChave[29]) = ''
     then edNovoSalario.Text  := ''
     else edNovoSalario.Text  := FormatFloat('#0.00',StrToFloat(MontaSelectPart.ValoresChave[29]));

     if MontaSelectPart.ValoresChave[21] <> ''
     then sTempoServAntReal := MontaSelectPart.ValoresChave[21]  
     else sTempoServAntReal := MontaSelectPart.ValoresChave[22]; 

     edTempoServAnt.Text := MontaSelectPart.ValoresChave[22];    

     if Trim(MontaSelectPart.ValoresChave[23]) <> ''
     then dtCancelamento.TEXT    := MontaSelectPart.ValoresChave[23]; 
     dtInscricao.TEXT       := MontaSelectPart.ValoresChave[24]; 
     edTempoAfast.Text      := MontaSelectPart.ValoresChave[25]; 
     if Trim(edTempoAfast.Text) <> ''
     then iTempoAfastIni := StrToInt(edTempoAfast.Text);

     sFlgIntSitFunc         := MontaSelectPart.ValoresChave[26];
     sFlgIntSitPart         := MontaSelectPart.ValoresChave[27];
     sFlgIntSitPlano        := MontaSelectPart.ValoresChave[28];

     edNovaMatricula.Text      := edMatricula.Text;   

     pnlInformacao.Enabled := True;

     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;

     ConsPart1.sIdPessoa := sidpessoa;
     ConsPart1.sIdTitular := sIdPessoa;   
     ConsPart1.sSeqProposta := sseqproposta;
     ConsPart1.sIdPlanoprev := sidplanoprev;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur := sidpessjur;
     ConsPart1.Enabled := true;
     bbtnOpcoes.enabled := true;

     // Verifica se o evento já foi registrado
     VerificaEstadoEvento;

     bRegistrado := True;
     if sEstadoEvento = 'NAO REGISTRADO'
     then begin // Verifica se pode Inserir
        if not PodeRegistrarEvento(qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                           sFlgInterno,sIdSitFunc,sIdSitPart,sIdSitPlanoPrev,sMotivoEvento)
        then begin
           MsgDlg('Esse Evento não pode ser registrado. Motivo : '+sMotivoEvento,'Informação',mtInformation,[mbOk,mbHelp],0);
           TiraSql(qryAux);
           bRegistrado := False;
           bEfetivado  := False;
           bbtnConfirmar.Enabled := False;
           bbtnCancelar.Enabled  := True;
           pnlInformacao.Enabled := False;

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
        else begin // nao foi registrado e PODE ser registrao
           bRegistrado := False;
           bEfetivado  := False;
           bbtnConfirmar.Enabled := True;
           bbtnCancelar.Enabled  := True;
           pnlInformacao.Enabled     := True;
          
           dblkpcmbSitFunc.Text      := '';
           dblkpcmbSitPlanoPrev.Text := '';
           dblkpcmbSitPart.Text      := '';
         
        end;
     end
     else begin
        
        if sEstadoEvento = 'REGISTRADO'
        then begin// Pode Alterar
           MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
           TiraSql(qryAux);
           bRegistrado := True;
           bEfetivado  := False;
           edNovaInscricao.Text      := MontaSelectPart.ValoresChave[12];
           edTempoServAnt.Text       := MontaSelectPart.ValoresChave[22];    
           dtCancelamento.TEXT       := MontaSelectPart.ValoresChave[23];
           if Trim(MontaSelectPart.ValoresChave[29]) = ''
           then edNovoSalario.Text  := ''
           else edNovoSalario.Text  := FormatFloat('#0.00',StrToFloat(MontaSelectPart.ValoresChave[29]));
           bbtnConfirmar.Enabled := True;
           bbtnCancelar.Enabled  := True;
           dtEvento.SetFocus;
        end
        else if sEstadoEvento = 'EFETIVADO'
             then begin// Não Pode Alterar, nem inserir outro evento
                MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                TiraSql(qryAux);
                bRegistrado := True;
                bEfetivado  := True;
                edNovaInscricao.Text      := MontaSelectPart.ValoresChave[12];
                edTempoServAnt.Text       := MontaSelectPart.ValoresChave[22];    
                dtCancelamento.TEXT       := MontaSelectPart.ValoresChave[23];
                if Trim(MontaSelectPart.ValoresChave[29]) = ''
                then edNovoSalario.Text  := ''
                else edNovoSalario.Text  := FormatFloat('#0.00',StrToFloat(MontaSelectPart.ValoresChave[29]));
                pnlInformacao.Enabled := False;
                bbtnConfirmar.Enabled := False;
                bbtnCancelar.Enabled  := False;
             end;

        dtAdmissao.Date           := StrToDate(qryEvento.FieldByName('DataAdmissao').AsString);
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
     end;

     // Preencher ultimo mês de contribuição do participante
     if not qryEvento.IsEmpty
     then sUltAnoMesPreparo := CalcUltMesContribuicao(StrToInt(sIdPessJur),
                                                      StrToInt(sIdPlanoPrev),
                                                      StrToInt(sIdPessoa),
                                                      StrToInt(sSeqProposta),-1,
                                                      Copy(qryEvento.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryEvento.FieldByName('DataEvento').AsString,4,2),
                                                      qryAux)
     else sUltAnoMesPreparo := CalcUltMesContribuicao(StrToInt(sIdPessJur),
                                                      StrToInt(sIdPlanoPrev),
                                                      StrToInt(sIdPessoa),
                                                      StrToInt(sSeqProposta),  -1,
                                                      SAnoMesAnterior(Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2) ) ,
                                                      qryAux);

     if (Trim(sUltAnoMesPreparo) = '') or (Trim(sUltAnoMesPreparo) = '0000/00')
     then begin
        edUltMesContrib.Text := '';
        edUltAnoContrib.Text := '';
        edUltMesContrib.Enabled := True;
        edUltAnoContrib.Enabled := True;
     end
     else begin
        edUltMesContrib.Text := Copy(sUltAnoMesPreparo,6,2);
        edUltAnoContrib.Text := Copy(sUltAnoMesPreparo,1,4);
        edUltMesContrib.Enabled := False;
        edUltAnoContrib.Enabled := False;
     end;
  end; 

  if  (MontaSelectPart.RetornouValor) AND (sEstadoEvento = 'NAO REGISTRADO')
  then begin
      

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT FLGAUTONUMINSC FROM PLANPREV '+
                    ' WHERE  IDPLANOPREV = '+sIdPlanoPrev);
     qryAux.Open;

     if qryAux.FieldbyName('FLGAUTONUMINSC').AsInteger = 1 
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT MAX(INSCRICAONUMERO) AS PROXINSC FROM PARTPREVPLAN '+
                       ' WHERE IDPLANOPREV = '+sIdPlanoPrev);
        qryAux.Open;
        if Trim(qryAux.FieldByName('PROXINSC').AsString) = ''
        then edNovaInscricao.Text := '1'
        else edNovaInscricao.Text := IntToStr(qryAux.FieldByName('PROXINSC').AsInteger + 1);
        qryAux.Close;
     end;
  end;
end;

procedure TfrmEventoReinscricao.VerificaEstadoEvento;
var sSQL : string;
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

      if IsEmpty then
        sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
      Else If VerificaDatas Then
        sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
      else if FieldByName('FLGEFETIVADO').AsString = '0' then
      begin
        sEstadoEvento := 'REGISTRADO'; // Pode Alterar
        sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
      end else sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
   end;
end;

procedure TfrmEventoReinscricao.bbtnConfirmarClick(Sender: TObject);
var sMsgErro,
    sNovoSalario,
    sMesRef       : string;
    bErro         : boolean;
    sSeqHistFunc,
    sSQL          : string;
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  if Trim(dtEvento.Text) = ''
  then begin
     MsgDlg('A Data da Reinscrição deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dtEvento.SetFocus;
     Exit;
  end;

  if Trim(edNovaInscricao.Text) = ''
  then begin
     MsgDlg('O novo número de inscrição deve ser informado. Caso não haja '+
            'um novo número, repita o número anterior.','Erro',mtError,[mbOk,mbHelp],0);
     edNovaInscricao.SetFocus;
     Exit;
  end;

  if Trim(edTempoServAnt.Text) = ''
  then begin
     MsgDlg('O Tempo de Serviço Anterior deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
     edTempoServAnt.SetFocus;
     Exit;
  end;

  if (edUltMesContrib.Enabled) and (edUltAnoContrib.Enabled)
  then begin
     if (Trim(edUltMesContrib.Text) = '') and (Trim(edUltAnoContrib.Text) <> '')
     then begin
        MsgDlg('O Mês e o Ano da Última Contribuição devem ser preenchidos.','Erro',mtError,[mbOk,mbHelp],0);
        edUltMesContrib.SetFocus;
        Exit;
     end;

     if (Trim(edUltMesContrib.Text) <> '') and (Trim(edUltAnoContrib.Text) = '')
     then begin
        MsgDlg('O Mês e o Ano da Última Contribuição devem ser preenchidos.','Erro',mtError,[mbOk,mbHelp],0);
        edUltAnoContrib.SetFocus;
        Exit;
     end;

     if (Trim(edUltMesContrib.Text) = '') and (Trim(edUltAnoContrib.Text) = '')
     then begin

          edUltMesContrib.Text := '00';
          edUltAnoContrib.Text := '0000';
     end;
  end;

  if Trim(edUltMesContrib.Text) <> '00'
  then begin
     
     If (StrToInt(edUltMesContrib.Text) = 13) And (Copy(Trim(dtEvento.Text),7,4) = Trim(edUltAnoContrib.Text))
      Then sMesRef := (Trim(edUltAnoContrib.Text)+'/'+Trim(edUltMesContrib.Text) )
      Else sMesRef := (Copy(Trim(dtEvento.Text),7,4)+'/'+Copy(Trim(dtEvento.Text),4,2));
     
     if ((sMesRef) <= (Trim(edUltAnoContrib.Text)+'/'+Trim(edUltMesContrib.Text)) ) And (StrToInt(edUltMesContrib.Text) <> 13)
     then begin
        If MsgDlg('O Último Mês de Contribuição não pode ser posterior à Data da Reinscrição.'+#13+'Deseja Continuar assim mesmo? ','Atenção',mtWarning,[mbYes, mbNo],0) = mrNo
         Then Begin
           dtEvento.SetFocus;
           Exit;
         End;
     end;
     
  end;

  if Trim(dblkpcmbNovaPatro.Text) = ''
  then begin
     MsgDlg('A Patrocinadora do Participante deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbNovaPatro.SetFocus;
     Exit;
  end;

  if Trim(dtAdmissao.Text) = ''
  then begin
     MsgDlg('A Data de Admissão do Participante deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dtAdmissao.SetFocus;
     Exit;
  end;

  if Trim(edNovaMatricula.Text) = ''
  then begin
     MsgDlg('A Matrícula do Participante deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     edNovaMatricula.SetFocus;
     Exit;
  end;
  
  
  if Trim(edNovoSalario.Text) = ''
  then begin
     MsgDlg('O novo salário não foi informado.','Aviso', mtWarning, [mbOk],0);
     
  end;
  

  try
     StrToInt(edNovaInscricao.Text);
  except
     MsgDlg('O novo número de inscrição é inválido.','Erro',mtError,[mbOk,mbHelp],0);
     edNovaInscricao.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitFunc.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitFunc.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPlanoPrev.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPart.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPart.SetFocus;
     Exit;
  end;

  if (Trim(sInscricaoData) <> '' ) and
     (StrToDate(dtEvento.Text) <= StrToDate(sInscricaoData) )
  then begin
     
     If MsgDlg('A data da reinscrição deveria ser pelo menos um dia após a data da inscrição.'+#13+
               'Deseja continuar assim mesmo?','Aviso',mtError,[mbYes, mbNo],0) = mrNo
       Then Begin
     dtEvento.SetFocus;
     Exit;
       End;
     
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

  
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDREGRAELEGREINS FROM PLANPREV '+
                 ' WHERE  IDPLANOPREV = ' + sIdPlanoPrev);
  qryAux.Open;

  if qryAux.FieldByName('IDREGRAELEGREINS').AsInteger > 0
  then begin
     sSQL := ' SELECT PP.IDPESSOA, PP.IDPLANOPREV, PP.DTINICIOINSC, PP.IDPESSJUR, PP.SEQPROPOSTA, '+
             '        '''+Trim(dtEvento.Text)+''' AS INSCRICAODATA, '+
                      ''''+Trim(dtEvento.Text)+''' AS DATAREF, '+
                      ''''+DateToStr(date)+''' AS REQUERIMENTODATA,  '+
             '        PP.IDSITPART, PP.IDSITPLANOPREV, EL.IDSITFUNC, '+
             '        EL.CODCENTROCUSTO, EL.IDCARGOEXT AS IDCARGO, EL.IDCARGOEXT, '+
             '        EL.MATRICULA, EL.DATAADMISSAO, EL.SALTOTAL, EL.PARTICIPPREVID, '+
             '        EL.PARTICIPASSIST, EL.NIVEL, EL.TEMPOSERVANTERIOR, PF.DATANASC, PF.SEXO, '+
             '        PF.DATAMORTE, PF.ESTCIVIL '+
             ' FROM   PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP '+
             ' WHERE  PP.IDPESSJUR   = '+sIdPessJur+
             ' AND    PP.IDPLANOPREV = '+sIdPlanoPrev+
             ' AND    PP.IDPESSOA    = '+sIdPessoa+
             ' AND    PP.SEQPROPOSTA = '+sSeqProposta+
             ' AND    EL.IDPESSJUR   = PP.IDPESSJUR '+
             ' AND    EL.IDPESSOA    = PP.IDPESSOA '+
             ' AND    PF.IDPESSOA    = EL.IDPESSOA ';

     if not RegraBooleana(qryAux.FieldByName('IDREGRAELEGREINS').AsString, sSQL,bErro)
     then begin
        if bErro
        then MsgDlg('Erro na execução da Regra de Elegibilidade para Reinscrição Nº '+qryAux.FieldByName('IDREGRAELEGREINS').AsString,
                    'Erro',mtError,[mbOk],0)
        else MsgDlg('A Regra de Elegibilidade para Reinscrição no Plano Nº '+qryAux.FieldByName('IDREGRAELEGREINS').AsString+ ' não foi satisfeita. '+
                    'O participante não poderá ser reinscrito no plano. ',
                    'Informação',mtInformation,[mbOk,mbHelp],0);

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

  if qryAux.IsEmpty
  then begin
     sFlgSitFuncImed  := '1';
     sFlgSitPartImed  := '1';
     sFlgSitPlanoImed := '1';
  end
  else begin
     sFlgSitFuncImed  := qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString;
     sFlgSitPartImed  := qryAux.FieldByName('FLGSITPARTIMEDIA').AsString;
     sFlgSitPlanoImed := qryAux.FieldByName('FLGSITPLANOIMEDI').AsString;
  end;

  frmAguarde.Mostra(' Efetivando evento ... ');


  if not bEfetivado then VerificaeGravaSituacoes; 


  if Trim(sIdPessjur) <> (qryPatro.FieldByName('IdPessoa').AsString)
  then begin 
     if not InsereNaPatrocinadoraNova ( qryAux, qryGrava,
                                        StrToInt(sIdPessoa),
                                        StrToInt(sIdPessJur),
                                        qryPatro.FieldByName('IdPessoa').AsInteger, 
                                        StrToInt(sIdPlanoPrev),
                                        StrToInt(sIdPlanoPrev),
                                        qrySitFunc.FieldByName('IdSitFunc').AsInteger,
                                        edNovaMatricula.Text,
                                        dtAdmissao.Text,
                                        qrySitPart.FieldByName('IdSitPart').AsInteger,
                                        qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsInteger,
                                        StrToInt(edNovaInscricao.Text),
                                        dtEvento.Text,
                                        edNovoSalario.Text,
                                        StrToInt(sIdEventoGerador),
                                        sFlgInterno,
                                        '1',
                                        edUltAnoContrib.Text+'/'+edUltMesContrib.Text,
                                        sMsgErro)
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;

     if not GravaEVENTOSPREV
     then begin
        MsgDlg('Erro ao gravar evento. Registro do Evento não efetuado.','Erro',mtError,[mbOk, mbHelp], 0);
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
                                         edNovoSalario.Text,
                                         '1',
                                         dtEvento.Text, True, qryAux, qryGrava,sIdPlanoPrev)
     then begin
        MsgDlg('Erro ao gravar histórico de contribuições do evento. ','Erro',mtError,[mbOk, mbHelp], 0);
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
                                           sMsgErro)
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;

     // Encerra beneficio
     if not ValidaBeneficioAnterior ( qryAux,
                                      StrToInt(sIdPessJur),
                                      StrToInt(sIdPlanoPrev),
                                      StrToInt(sIdPessoa),
                                      StrToInt(sSeqProposta),
                                      StrToInt(sIdEventoGerador),
                                      False,
                                      DateToStr(StrToDate(dtEvento.Text) - 1),
                                      sMsgErro,
                                      bEncerrou) 
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;
  end 
  else begin // Participante voltou para mesma
     if not GravaEVENTOSPREV
     then begin
        MsgDlg('Erro ao gravar evento. Registro do Evento não efetuado.','Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
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
                                         dtAdmissao.Text,
                                         dtEvento.Text,
                                         sMsgErro,
                                         edNovoSalario.Text, 
                                         edNovaMatricula.Text , 
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
                                         edNovoSalario.Text,
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
                                          edNovaMatricula.Text,
                                          dtEvento.Text,
                                          dtEvento.Text,
                                          '1',
                                          edUltAnoContrib.Text+'/'+edUltMesContrib.Text,
                                          edNovoSalario.Text,
                                          sInscricaoData,
                                          sMsgErro  )

     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

  end;

  
  // Se participante havia sido DEMITIDO, entao inserir periodo de afastamento na HISTFUNCPREV
  if (Trim(dtDemissao.Text) <> '') and (StrToDate(dtAdmissao.Text) > StrToDate(dtDemissao.Text) )
  then begin
    if not InsereHistFuncPrev ( qryAux , StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                edNovaMatricula.Text,
                                dtAdmissao.Text, '','')
    then begin
        MsgDlg('Erro ao inserir histórico funcional. ', 'Erro',mtError,[mbOk, mbHelp], 0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
    end;
  end;


  

  //== Busca o nome real do evento
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' select ideventogerador, flginterno, nome from eventogerador '+
                 ' where  ideventogerador       = '+sIdEventoGerador);
  qryAux.Open;

  MostraDetalhesContribuicao( StrToInt(sIdPessJur),
                              StrToInt(sIDPLANOPREV),
                              StrToInt(sIdPessoa),
                              StrToInt(sSeqProposta),
                              'Detalhes de Opções e Contribuições ... ',
                              qryAux.FieldByName('nome').AsString,
                              qryAux.FieldByName('flgInterno').asstring,
                              '',
                              dtEvento.Text,
                              '',qryAux);
  



  if (not bRequerBenef) and (not bRegistrado)
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

  
  // Adicionando Log Padrao
  Try
    If Not Sistema.GravaLogOperacoes('Evento Reinscrição de Participante') Then
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

  

  If MsgDlg('Evento efetuado com sucesso. Confirma a Gravaçao ?','Confirmação',mtConfirmation,[mbno, mbyes],0) = mrYes
    Then If dtmBaseDados.dbBaseDados.InTransaction
          Then Begin
            dtmBasedados.dbBaseDados.Commit;
            MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
          End
    Else If dtmBaseDados.dbBaseDados.InTransaction
          Then Begin
            dtmBasedados.dbBaseDados.Rollback;
            MsgDlg('Evento cancelado.','Informação',mtInformation,[mbOk,mbHelp],0);
          End;
  
  LimpaCampos;
  TiraSql(qryAux);
  bRequerBenef := False;

  
  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);
  

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoReinscricao.VerificaeGravaSituacoes;
var sSQL  : string;
begin
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

  if qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1'
  then begin
     sFlgSitFuncImed := '1';

     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC  = '+ qrySitFunc.FieldByName('IDSITFUNC').AsString +
                      '                    , MATRICULA  = '''+Trim(edNovaMatricula.Text)+''''+    // rosana - serpros - 31/08/99
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

  sSQL := ' UPDATE PARTPREVPLAN SET INSCRICAODATA     = TO_DATE('''+dtEvento.Text+''', ''dd/mm/yyyy''),'+
          '                         INSCRICAONUMERO   = '+Trim(edNovaInscricao.Text)+','+
          '                         SALINSCRICAO      = '+OraNumero(Trim(edNovoSalario.Text))+','+ 
          '                         SALPARTICIPACAO   = '+OraNumero(Trim(edNovoSalario.Text))+','+
          '                         IDADEBASE         = TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE('''+sDataNasc+''',''DD/MM/YYYY''))/12,0) , '+ 
          '                         TEMPOAFASTADO     = '+Trim(edTempoAfast.Text);

  if qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1'
  then begin
     sFlgSitPartImed := '1';
     sSQL := sSQL +', IDSITPART = ' + qrySitPart.FieldByName('IDSITPART').AsString;
  end
  else begin
     sFlgSitPartImed := '0';
  end;

  if qryAux.FieldByName('FLGSITPLANOIMEDI').AsString  = '1'
  then begin
     sFlgSitPlanoImed := '1';
     sSQL := sSQL + ', IDSITPLANOPREV = ' + qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString;
  end
  else begin
     sFlgSitPlanoImed := '0';
  end;

  sSQL := sSQL +  ' WHERE IDPESSJUR   = ' + qryPatro.FieldByName('IDPESSOA').AsString+ ' AND ' + 
                  '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                  '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                  '       IDPESSOA    = ' + sIdPessoa;

  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(sSQL);
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  
  if not AtualizaFlgDesativado    ( qryGrava,
                                    StrToInt(sIdPessJur),
                                    StrToInt(sIdPlanoPrev),
                                    StrToInt(sIdPessoa),
                                    StrToInt(sSeqProposta) )
  then begin
     MsgDlg('Erro ao ativar participante no plano. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  
  // Gravar tempo de servico anterior, independente do sitimediato
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVANTERIOR  = '+ Trim(edTempoServAnt.Text)+
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

  // Se o último mes de contribuicao estava habilitado, atualiza-lo
  // Sendo que só estaria habilitado se anteriormente estivesse em branco
  // no banco.
  if (edUltMesContrib.Enabled) and (edUltAnoContrib.Enabled)
  then begin
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+Trim(edUltAnoContrib.Text)+'/'+Trim(edUltMesContrib.Text)+''''+
                      ' WHERE  (IDPESSJUR = ' + sIdPessJur + ') AND ' +
                      '        (IDPESSOA  = ' + sIdPessoa  + ') AND '+
                      '        (IDPLANOPREV = '+sIdPlanoPrev+') AND '+
                      '        ( (ULTMESPREPARO IS NULL) OR (ULTMESPREPARO = ''0000/00'') ) ');
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

end;

function TfrmEventoReinscricao.GravaEVENTOSPREV : boolean;
var sFlgEfetivado, sDataEfetivado : string;
begin
  Result := False;

  if (sFlgSitFuncImed = '1') and (sFlgSitPartImed = '1') and (sFlgSitPlanoImed = '1')
  then begin
     sFlgEfetivado  := '1';
     sDataEfetivado := ' TO_DATE(''' + DateToStr(Date) + ''',''DD/MM/YYYY'')';
  end
  else begin
     sFlgEfetivado  := '0';
     sDataEfetivado := 'NULL';
  end;

  if not bRegistrado
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
                    ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' TO_DATE(''' + DateToStr(Date) + ''',''DD/MM/YYYY'')' + ',' + ' TO_DATE(''' + Trim(dtEvento.Text) + ''',''DD/MM/YYYY'')' + ',' +
                                 sIdPessoa  + ',' +
                                 qryPatro.FieldByName('IDPESSOA').AsString + ',' +
                                 sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                 '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                 '''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                 sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                 sDataEfetivado + ',' + sFlgEfetivado+','+OraNumero(edNovaInscricao.Text) + ',' +
                                 QuotedStr(edNovaMatricula.Text)+ ')');
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
  Result := True;
end;

procedure TfrmEventoReinscricao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then begin
     if dtmBasedados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.RollBack;

     LimpaCampos;
     bRequerBenef := False;

     if not dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.StartTransaction;
  end;
end;

procedure TfrmEventoReinscricao.LimpaCampos;
begin
  edNome.Text            := '';
  edMatricula.Text       := '';
  edNovaMatricula.Text   := '';
  edPatro.Text           := '';
  edPlano.Text           := '';
  edSitPatro.Text        := '';
  edSitFundacao.Text     := '';
  edSitPlano.Text        := '';
  edInscNumero.Text      := '';
  dtEvento.Text          := '';
  dtInscricao.Text       := '';
  edNovaInscricao.Text   := '';
  edTempoServAnt.Text    := '';
  edUltMesContrib.Text   := '';
  edUltAnoContrib.Text   := '';
  dblkpcmbNovaPatro.Text := '';
  dtAdmissao.Text        := '';
  edNovoSalario.Text     := '';
  dtCancelamento.Text    := '';
  edTempoAfast.Text      := '';
  dblkpcmbSitFunc.Text   := '';
  dblkpcmbSitPart.Text   := '';
  dblkpcmbSitPlanoPrev.Text := '';
  memResult.Lines.Clear;
  memResult.SendToBack;
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;
end;

procedure TfrmEventoReinscricao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.RollBack;
end;

procedure TfrmEventoReinscricao.bbtnOpcoesClick(Sender: TObject);
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

procedure TfrmEventoReinscricao.dtEventoExit(Sender: TObject);
var iTempoAfast, iTotalDias : longint;
    rTotalDias  : real;
    dtDataCancelamento, dtDataReinscricao : TDateTime;
begin
  inherited;

  // Calcular o tempo de afastamento
  // O tempo total de afastamento será o tempo que já tem mais a diferença
  // entre a data do cancelamento e a data da reinscricao

  // Verificar se as datas de cancelamento e reinscricao estao preenchidas
  if Trim(dtEvento.Text) = ''        then Exit;
  if Trim(dtCancelamento.Text) = ''  then Exit;


  // Transformar as datas de texto em data
  dtDataCancelamento := StrToDate(dtCancelamento.Text);
  dtDataReinscricao  := StrToDate(dtEvento.Text);

  // Verificar se a data de reinscricao é maior que a data de cancelamento
  if dtDataReinscricao < dtDataCancelamento
  then begin
     MsgDlg('A data de reinscrição deve ser posterior à data do cancelamento.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtEvento.SetFocus;
     Exit;
  end;

  // Preencher o tempo de afastamento já existente

  // Calcular a diferenca em dias entre as duas datas
  rTotalDias := dtDataReinscricao - dtDataCancelamento;

  // Arredondar esta diferenca
  iTotalDias := Round(rTotalDias);

  // Somar o número de dias ao tempo de afastamento
  iTempoAfast := iTempoAfastIni + iTotalDias;

  edTempoAfast.Text := IntToStr(iTempoAfast);
end;


procedure TfrmEventoReinscricao.FormShow(Sender: TObject);
begin
  inherited;
  memResult.SendToBack;
  qryPatro.Close;
  qryPatro.Open;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 21.06.2003  
end;

function TfrmEventoReinscricao.VerificaDatas: Boolean;
begin
  Result := False;

  // Solicita a data do evento (Novo)
  try
    Application.CreateForm(TfrmNovaDataReinscricao, frmNovaDataReinscricao);
    frmNovaDataReinscricao.ShowModal;
    // Compara com a data da última re-inscrição.
    Result := frmNovaDataReinscricao.dtEvento.Date > qryEvento.FieldByName('DATAEVENTO').AsDateTime;
    // Se data deste evento for superior a data do último evento
    // atribuir à "Data da Reinscrição".
    If Result Then
      Self.dtEvento.Date := frmNovaDataReinscricao.dtEvento.Date;
    Self.dtEvento.ReadOnly := Result;
  Finally
    frmNovaDataReinscricao.Free;
  End;
end;

    
procedure TfrmEventoReinscricao.MostraContribuicoesInscricao;
var sNomeOp1, sNomeOp2, sNomeOp3, sMes : string;
    bPossuiOpcoes : boolean;
    iNumRecebimento,
    iIdContribuicao : longint;
    SavePlace1,
    SavePlace2      : TBookmark;
begin
   frmMostraAux.Caption := 'Informações da Inscrição do Participante ... ';
   frmMostraAux.memResult.Lines.Clear;

   // Abre queries
   qryMostraContribuicao.Close;
   qryMostraContribuicao.ParamByName('IDPESSOA').AsInteger   := StrToInt(sIdPessoa);
   qryMostraContribuicao.ParamByName('IDPESSJUR').AsInteger  := StrToInt(sIdPessJur);
   qryMostraContribuicao.ParamByName('IDPLANOPREV').AsInteger := StrToInt(sIdPlanoPrev);
   qryMostraContribuicao.Open;

   qryHstContribPrev.Close;
   qryHstContribPrev.ParamByName('MESCOBRANCA').AsString  := Trim(edUltAnoContrib.Text)+'/'+Trim(edUltMesContrib.Text);
   qryHstContribPrev.ParamByName('IDPESSOA').AsInteger    := StrToInt(sIdPessoa);
   qryHstContribPrev.ParamByName('IDPESSJUR').AsInteger   := StrToInt(sIdPessJur);
   qryHstContribPrev.ParamByName('IDPLANOPREV').AsInteger := StrToInt(sIdPlanoPrev);
   qryHstContribPrev.ParamByName('SEQPROPOSTA').AsInteger := StrToInt(sSeqProposta);
   qryHstContribPrev.Open;

   // Verificar se existem opcoes do elegivel na patrocinadora
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT NUMOPCOES, NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3 '+
                  ' FROM PATRO '+
                  ' WHERE IDPESSOA = ' +qryPatro.FieldByName('IDPESSOA').AsString);
   qryAux.Open;
   if (qryAux.IsEmpty) or
      (qryAux.FieldByName('NumOpcoes').AsString = '') or
      (qryAux.FieldByName('NumOpcoes').AsInteger <= 0)
   then begin
      bPossuiOpcoes := False;
      sNomeOp1      := '';
      sNomeOp2      := '';
      sNomeOp3      := '';
   end
   else begin
      bPossuiOpcoes := True;
      sNomeOp1      := qryAux.FieldByName('NomeValorBase1').AsString;
      sNomeOp2      := qryAux.FieldByName('NomeValorBase2').AsString;
      sNomeOp3      := qryAux.FieldByName('NomeValorBase3').AsString;
   end;
   qryAux.Close;

   frmMostraAux.memResult.Lines.Add(' PARTICIPANTE : '+Trim(edNome.Text));
   frmMostraAux.memResult.Lines.Add(' MATRÍCULA : '+Trim(edMatricula.Text)+
                                    '                       '+
                                    ' DATA DA CONSULTA  : '+DateToStr(date) );
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   frmMostraAux.memResult.Lines.Add(' Evento : Reinscrição de Participante '+
                                    ' - Data : '+ dtEvento.Text);
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');

   frmMostraAux.memResult.Lines.Add(' PATROCINADORA : '+dblkpcmbNovaPatro.Text);
   frmMostraAux.memResult.Lines.Add(' PLANO PREVID. : '+edPlano.Text);

   frmMostraAux.memResult.Lines.Add(' INSCRIÇÃO Nº : '+Trim(edInscNumero.Text));
   frmMostraAux.memResult.Lines.Add(' NÍVEL : '+Trim(qryMostraContribuicao.FieldByName('NIVEL').AsString)+
                                    '                       '+
                                    ' CARGO : '+Trim(qryMostraContribuicao.FieldByName('IDCARGOEXT').AsString));
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   frmMostraAux.memResult.Lines.Add('  ');
   frmMostraAux.memResult.Lines.Add(' DADOS DO PARTICIPANTE ');
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   frmMostraAux.memResult.Lines.Add(' Data Nasc : '    + qryMostraContribuicao.FieldByName('DataNasc').AsString+
                                    ' - Sexo : '+qryMostraContribuicao.FieldByName('Sexo').AsString);
   frmMostraAux.memResult.Lines.Add(' Admissão : '    + qryMostraContribuicao.FieldByName('DataAdmissao').AsString+
                                    ' - Inscrição : ' + qryMostraContribuicao.FieldByName('INSCRICAODATA').AsString);
   frmMostraAux.memResult.Lines.Add(' Tempo de Serv. Anterior : '   + qryMostraContribuicao.FieldByName('TempoServAnterior').AsString+' meses ' );


   if Trim(qryMostraContribuicao.FieldByName('SALPARTICIPACAO').AsString) <> ''
   then frmMostraAux.memResult.Lines.Add(' Salário : R$ '+ FormatFloat('#0.00', qryMostraContribuicao.FieldByName('SALPARTICIPACAO').AsFloat))
   else frmMostraAux.memResult.Lines.Add(' Salário : R$ 0.00');
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');


   // Exibir opcoes do elegivel na patrocinadora
   if bPossuiOpcoes
   then begin
      frmMostraAux.memResult.Lines.Add(' OPÇÕES NA PATROCINADORA : ');
      frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
      if (Trim(sNomeOp1) <> '') and (Trim(qryMostraContribuicao.FieldByName('ValorBase1').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+sNomeOp1+' : '+qryMostraContribuicao.FieldByName('ValorBase1').AsString);
      if (Trim(sNomeOp2) <> '') and (Trim(qryMostraContribuicao.FieldByName('ValorBase2').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+sNomeOp2+' : '+qryMostraContribuicao.FieldByName('ValorBase2').AsString);
      if (Trim(sNomeOp3) <> '') and (Trim(qryMostraContribuicao.FieldByName('ValorBase3').AsString) <> '')
      then frmMostraAux.memResult.Lines.Add('   '+sNomeOp3+' : '+qryMostraContribuicao.FieldByName('ValorBase3').AsString);
   end;

   // Exibir opcoes por contribuicao por plano
   frmMostraAux.memResult.Lines.Add('   ');
   frmMostraAux.memResult.Lines.Add(' OPÇÕES DAS CONTRIBUÇÕES NO PLANO : ');
   frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
   SavePlace1 := qryMostraContribuicao.GetBookmark;
   qryMostraContribuicao.First;
   while not qryMostraContribuicao.Eof do
   begin

      iIdContribuicao := qryMostraContribuicao.FieldbyName('IdContribuicao').AsInteger;

      frmMostraAux.memResult.Lines.Add('===> '+qryMostraContribuicao.FieldByName('Nome').AsString);

      if Trim(qryMostraContribuicao.FieldByName('Periodicidade').AsString) = ''
      then frmMostraAux.memResult.Lines.Add('          Tipo de Pagmto : Esporádico ')
      else frmMostraAux.memResult.Lines.Add('          Tipo de Pagmto : '+qryMostraContribuicao.FieldByName('Periodicidade').AsString);

      if Trim(qryMostraContribuicao.FieldByName('QtdeParcelas').AsString) <> ''
      then frmMostraAux.memResult.Lines.Add('          Nº de Parcelas : '+qryMostraContribuicao.FieldByName('QtdeParcelas').AsString )
      else frmMostraAux.memResult.Lines.Add('          Nº de Parcelas : 0 ');

      if (qryMostraContribuicao.FieldbyName('NumOpcoes').AsInteger < 1)
      then begin
         qryMostraContribuicao.Next;
         Continue;
      end;

      SavePlace2 := qryMostraContribuicao.GetBookmark;

      qryMostraContribuicao.First;
      while (iIdContribuicao = qryMostraContribuicao.FieldbyName('IdContribuicao').AsInteger) and
            (not qryMostraContribuicao.Eof) do
      begin
         sNomeOp1        := qryMostraContribuicao.FieldbyName('NomeValorBase1').AsString;
         sNomeOp2        := qryMostraContribuicao.FieldbyName('NomeValorBase2').AsString;
         sNomeOp3        := qryMostraContribuicao.FieldbyName('NomeValorBase3').AsString;
         if (Trim(sNomeOp1) <> '') and (Trim(qryMostraContribuicao.FieldByName('ValorBase1').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add('          '+sNomeOp1+' : '+qryMostraContribuicao.FieldByName('ValorBase1').AsString);
         if (Trim(sNomeOp2) <> '') and (Trim(qryMostraContribuicao.FieldByName('ValorBase2').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add('          '+sNomeOp2+' : '+qryMostraContribuicao.FieldByName('ValorBase2').AsString);
         if (Trim(sNomeOp3) <> '') and (Trim(qryMostraContribuicao.FieldByName('ValorBase3').AsString) <> '')
         then frmMostraAux.memResult.Lines.Add('          '+sNomeOp3+' : '+qryMostraContribuicao.FieldByName('ValorBase3').AsString);
         qryMostraContribuicao.Next;
      end;

      qryMostraContribuicao.GotoBookmark(SavePlace2);

      qryMostraContribuicao.Next;
   end;

   qryMostraContribuicao.GotoBookmark(SavePlace1);

   if not qryHstContribPrev.IsEmpty
   then begin
      frmMostraAux.memResult.Lines.Add('   ');
      frmMostraAux.memResult.Lines.Add(' CONTRIBUIÇÕES A COBRAR DO PARTICIPANTE : ');
      frmMostraAux.memResult.Lines.Add(' _____________________________________________________________');
      qryHstContribPrev.First;
      while not qryHstContribPrev.Eof do
      begin
         frmMostraAux.memResult.Lines.Add('   ');
         sMes := qryHstContribPrev.FieldByName('MesReferencia').AsString;
         frmMostraAux.memResult.Lines.Add(' => Referência em ' +qryHstContribPrev.FieldByName('MesReferencia').AsString);
         while (sMes = qryHstContribPrev.FieldByName('MesReferencia').AsString) and
               (not    qryHstContribPrev.Eof) do
         begin
            iIdContribuicao := qryHstContribPrev.FieldbyName('IdContribuicao').AsInteger;
            frmMostraAux.memResult.Lines.Add('       -> '+qryHstContribPrev.FieldByName('Nome').AsString+ ' : '+
                                             ' Valor = R$ '+FormatFloat('#0.00', qryHstContribPrev.FieldByName('ValorEsperado').AsFloat));
            qryHstContribPrev.Next;
          end;
      end;
   end;

   qryMostraContribuicao.FreeBookmark(SavePlace1);
   qryMostraContribuicao.FreeBookmark(SavePlace2);


   frmMostraAux.ShowModal;
end; 

end.
