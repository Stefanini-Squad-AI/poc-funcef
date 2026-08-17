// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//  Autor      : Marcelo Almeida da Silva
//  Rotina     : Analise de Elegilibidade
//  Data       : 06/10/2010
//  Pendencia  : SOL 136956 - KINTANA 917626
//  Descrição  : Incluir uso da validação de elegibilidade.
//------------------------------------------------------------------------------

//Pendência   : SOL 121596 KINTANA 587023
//Responsável : Ádler Souza
//Data        : 13/08/2010
//Descrição   : Informar manualmente (pelo usuário) a data de previsão de
//              pagamento nos cálculos de autopatrocinio total.
//--------------------------------------------------------------------------------
//Pendência   : SOL 135165 KINTANA 801908
//Responsável : BRUNO AZEVEDO
//Data        : 05/05/2010
//Descrição   : Utilizar a rotina CalcUltSalPart para obter o salário de manut.
//--------------------------------------------------------------------------------
//  Autor      : Thiago Passos
//  Rotina     : ExecutaRegraCalculo
//  Pendência  : SOL 127038 Kintana 672735
//  Data       : 17/12/2009
//  Descrição  : Inclusão dos campos Origem(idmodulo) e Nova Situação na Fundação
//               Inclusão do Log contendo o SQL de Entrada
//------------------------------------------------------------------------------
//  Autor      : Jéssica Lana
//  Rotina     : ExecutaRegraCalculo
//  Pendência  : SOL 124361 Kintana 631995
//  Data       : 27/10/2009
//  Descrição  : Acrescentei o campo MESREFERENCIA na QRY de entrada dentro da
//               função ExecutaRegraCalculo.
//------------------------------------------------------------------------------
//  Autor      : Ádler Souza
//  Rotina     : Cadastro de Evolução funcional
//  Pendência  : SOL 121368 Kintana 589276
//  Data       : 14/07/2009
//  Descrição  : Alterações nas propriedades da tela e ao chamar o form.
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : VerificaeGravaSituacoes
//  Data       : 05/06/2006
//  Pendencia  : 22521
//  Descrição  : Salvar na Partprevplan nova situação no plano
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 05/05/2005
//  Pendencia  : 19080
//  Descrição  : Retirar Critica
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : formshow
//  Data       : 01.02.2005
//  Pendencia  : --
//  Descrição  : quando no registro de um novo evento estava sempre "zerando" o campo de cargo
//               mersmo após de ter trazido o devidamente cadatrado do banco
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Tela
//  Data       : 21.07.2004
//  Pendencia  : ------
//  Descrição  : Padronizacao da tela com a tela de eventos
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Confirmar Click
//  Data       : 07.07.2004
//  Pendencia  : ------
//  Descrição  : Gravar null no IdPessJurCedido
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Botão novo
//  Data       : 06.07.2004
//  Pendencia  : 16725
//  Descrição  : Botao para alteracao de endereco
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
// Autor(a)    : Augusto
// Data        : 02/04/2004
// Alteração   : 0 default no campo opçao ADN
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Gleyber
// Data        : 25/03/2004
// Pendência   : 16354
// Alteração   : Atribuindo valor à variável sIdTitular do componente ConsPart.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 22.01.2004
// Pendencia   : --- ( Funcef )
// Descrição   : Retirada do grid de itens salariais e inclusao do botão
//               de atalho para a evolução funcional
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 17.12.2003
// Descrição   : Não chamar a tela Mostracontribuicoes pois já chama o demonstrativo
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 22/10/2003
// Descrição   : ExecutaRegraCalculo - Inclusão do campo FLGDIRETOR da ELEGPATRO
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
// Autor(a)    : Augusto
// Data        : 18/09/2003
// Alteração   : Retirada do adicional noturno dos itens que compõem o salario
//               Inclusao do Edit para opcao de ADN 
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 11.09.2003
// Alteração   : Alteração na qryItensSal para tirar o ORDER BY do SUBSELECT
//               pois na CBS é ORACLE 7 e não aceita essa operação
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
// Função      :
// Autor       : Leo
// Data        : 26/09/2002
// Alteração   : confirmação do usuário e commit só após demonstrativo
// *****************************************************************************

unit FEventoAfastamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, cmseldlg, TREdit, URegra, TB97Tlbr, UConsPart, Mask, MskEdDlg,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, FTelaAut, UAnaliseElegibilidade;

type
  TfrmEventoAfastamento = class(TfrmOkCancelar)
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
    MontaSelectPart: TMontaSelect;
    Label9: TLabel;
    Label12: TLabel;
    qrySitPart: TwwQuery;
    dblkpcmbSitPart: TwwDBLookupCombo;
    dtAfastFim: TCMDateTimePicker;
    pnlTempoContrib: TPanel;
    Label13: TLabel;
    edTempoContrib: TEdit;
    pnlTempoAfast: TPanel;
    Label7: TLabel;
    edTempoAfast: TEdit;
    regCalculo: TRegra;
    qryRegra: TwwQuery;
    Label15: TLabel;
    Label16: TLabel;
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
    spbRubricas: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    dblkpcmbCargo: TwwDBLookupCombo;
    edNivel: TEdit;
    qryCargoExt: TwwQuery;
    qryEvento: TwwQuery;
    sgrdSalarios: TStringGrid;
    qrySitFuncDESCRICAO: TStringField;
    qrySitFuncIDSITFUNC: TFloatField;
    qrySitFuncFLGINTERNO: TStringField;
    qrySitFuncTIPOSIT: TStringField;
    PnlOpcao: TPanel;
    Label23: TLabel;
    Label22: TLabel;
    EdtOpcao: TEdit;
    sbtnEvolFuncional: TSpeedButton;
    dtRequerimento: TCMDateTimePicker;
    Label19: TLabel;
    bbtnAltEndereco: TBitBtn;
    Panel1: TPanel;
    Label4: TLabel;
    reSalarioManut: TcmMaskEditDlg;
    dtPrevPagamento: TCMDateTimePicker;
    Label20: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtAfastIniExit(Sender: TObject);
    procedure dtAfastFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure reSalarioManutBtnClick(Sender: TObject);
    procedure dblkpcmbCargoDropDown(Sender: TObject);
    procedure grdItensSalFieldChanged(Sender: TObject; Field: TField);
    procedure sbtnEvolFuncionalClick(Sender: TObject);
    procedure bbtnAltEnderecoClick(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean; 
    iIdEventoPrev , iFLGALTERASITFUNC        : integer;

    sInscricaoData, 
    sDataFimEvento,
    sIdPessoa,        sIdPessJur,       sIdPlanoPrev,
    sSeqProposta,     sIdSitFunc,       sIdSitPart,
    sIdSitPlanoPrev,  sFlgSitFuncImed,  sFlgSitPartImed,
    sFlgSitPlanoImed, sIdRegraSalario,  sEstadoEvento,
    sResultadoRegra,  sMensagem,        sFlgEfetivado,
    sDataEfetivado,   sFlgIntPartAntes                    : string;


    bObrigaOpPatro1,  bObrigaOpPatro2,  bObrigaOpPatro3,
    bAltera,          bFlgUsaRubrica    : boolean;

    rOpcao1,          rOpcao2,          rOpcao3,
    rOpcao4,          rOpcao5,          rOpcao6                 : real;

    iNumOpcoesPatro                                       : word;

    
    function  ExecutaRegraConcessao : boolean;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure VerificaEstadoEvento;
    procedure LimpaCampos;
    procedure ExecutaRegraTempoAfast;
    function  VerificaCampos: boolean;
    procedure GravaDados;
    procedure ExecutaRegraCalculo;   

    function ValidarAnaliseElegibilidade : Boolean;
    procedure AnaliseElegibilidadeValidouRegra(ARegraElegibilidade : TValidacaoRegraElegibilidade; var Validou: Boolean);
  

  public
    { Public declarations }
  end;

var
  frmEventoAfastamento: TfrmEventoAfastamento;
 {Evento Temporário}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, DBaseDados, FCadContribParticipante,
  UMovReserva, FMostraContribuicoes, UEventos, UParticipante,
  UFuncoesUteis, FCadOpcoesElegivel, UIntegraBack,
  UContribuicaoPrev, fAguarde, UBeneficio,
  uSincronismo, USistema, uPCS, FCadEvolFuncPrev, FAlteraEnderecoCobranca;

{$R *.DFM}

procedure TfrmEventoAfastamento.FormCreate(Sender: TObject);
begin
  inherited;
  qryCargoExt.Close;
  qryCargoExt.Open;

  reSalarioManut.Text          := '';
  bEncerrou := False; 
end;

procedure TfrmEventoAfastamento.FormShow(Sender: TObject);
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


   with qryAux do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDEVENTOGERADOR, FLGALTERASITFUNC  '+
             ' FROM   EVENTOGERADOR                      '+
             ' WHERE IDEVENTOGERADOR = ' +sIdEventoGerador);

     Open;
     
   iFLGALTERASITFUNC :=  qryAux.FieldByName('FLGALTERASITFUNC').AsInteger;
   If qryAux.FieldByName('FLGALTERASITFUNC').AsInteger = 0 Then
      dblkpcmbSitFunc.Enabled := False;
   end;

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 

  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoAfastamento.bbtnProcurarClick(Sender: TObject);
var iIdCargoExt : Integer;
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
     edNivel.Text       := MontaSelectPart.ValoresChave[20];
     sFlgIntPartAntes   := MontaSelectPart.ValoresChave[29];
     sInscricaoData     := MontaSelectPart.ValoresChave[13];


     if Trim(MontaSelectPart.ValoresChave[21]) = ''
     then dblkpcmbCargo.Text := ''
     else begin
        iIdCargoExt := StrToInt(MontaSelectPart.ValoresChave[21]);
        if qryCargoExt.Locate('IdCargoExt',iIdCargoExt,[loCaseInsensitive])
        then dblkpcmbCargo.Text := qryCargoExt.FieldByName('Titulo').AsSTring
        else dblkpcmbCargo.Text := '';
        dblkpcmbCargo.PerformSearch;
     end;

     if Trim(MontaSelectPart.ValoresChave[22]) = ''
     then iNumOpcoesPatro    := 0
     else iNumOpcoesPatro    := StrToInt(MontaSelectPart.ValoresChave[22]);
     bObrigaOpPatro1         := (Trim(MontaSelectPart.ValoresChave[23]) = '1');
     bObrigaOpPatro2         := (Trim(MontaSelectPart.ValoresChave[24]) = '1');
     bObrigaOpPatro3         := (Trim(MontaSelectPart.ValoresChave[25]) = '1');

     if Trim(MontaSelectPart.ValoresChave[26]) <> ''
     then rOpcao1 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[26]))
     else rOpcao1 := 0;

     if Trim(MontaSelectPart.ValoresChave[27]) <> ''
     then rOpcao2 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[27]))
     else rOpcao2 := 0;

     if Trim(MontaSelectPart.ValoresChave[28]) <> ''
     then rOpcao3 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[28]))
     else rOpcao3 := 0;

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
     bbtnAltEndereco.Enabled := True; 




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
        


        

        If iFLGALTERASITFUNC = 1 Then   //Permite alterar Situação na Patrocinadora
         begin
           if dblkpcmbSitFunc.LookupTable.RecordCount >= 1
           then dblkpcmbSitFunc.Text      := dblkpcmbSitFunc.LookupTable.fieldbyname('descricao').asString
           else dblkpcmbSitFunc.Text      := '';
         end
        else
          dblkpcmbSitFunc.Text      := MontaSelectPart.ValoresChave[7];
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
           sDataFimEvento       := dtAfastFim.Text;
           ExecutaRegraTempoAfast;
        end
        else if sEstadoEvento = 'EFETIVADO'
             then begin // Não Pode Alterar
                MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                TiraSql(qryAux);
                dtAfastIni.Date      := StrToDate(MontaSelectPart.ValoresChave[14]);
                if Trim(MontaSelectPart.ValoresChave[15]) <> ''
                then dtAfastFim.Date    := StrToDate(MontaSelectPart.ValoresChave[15]);
                sDataFimEvento        := dtAfastFim.Text;
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
        dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString; // Gleyber - 05/05/2004 - Pendência 16427
    end;

     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT FLGUSARUBRICA, IDRGSALMANUT FROM PLANPREVPATRO  '+
                    ' WHERE  IDPESSJUR   = '+''''+sIdPessJur    +''''+
                    ' AND    IDPLANOPREV = '+''''+sIdPlanoPrev  +'''');
     qryAux.Open;
     bFlgUsaRubrica    := (qryAux.FieldByName('FLGUSARUBRICA').AsInteger = 1);
     sIdRegraSalario   :=  qryAux.FieldByName('IDRGSALMANUT').AsString;
  end;



  
  if  (montaselectpart.retornouvalor)  AND  (SEstadoEvento = 'NAO REGISTRADO') then
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitPart.text:='';
       

     end;

end;

procedure TfrmEventoAfastamento.VerificaEstadoEvento;
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

      // Se o evento já foi REGISTRADO ou EFETIVADO, preencher situação anterior baseado
      // na EVENTOSPREV

   end;


end;
  
procedure TfrmEventoAfastamento.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef, sMsgErro,
  sNivel,    sCargo,
  sDataIniSalario,
  sDataFimSalario,
  sAnoMesSalario,
  sIdEvento, sNomeTitular: string;
  bFlgIntContab, bSuspendeContribuicao: boolean;
begin
  inherited;

  if MsgDlg('Confirma Afastamento com Manutenção ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
  then Exit;

  bSuspendeContribuicao := False;

  if not VerificaCampos then Exit;

  if sResultadoRegra = 'False'
  then begin
     MsgDlg(sMensagem + ' O evento não pode ser efetivado.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbSitFunc.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na Patrocinadora deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitFunc.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPart.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPart.SetFocus;
     Exit;
  end;

  if (Trim(dblkpcmbSitPlanoPrev.Text) = '')
  then begin
     MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPlanoPrev.SetFocus;
     Exit;
  end;

  if Trim(dtAfastFim.Text) = '' then edTempoAfast.Text := '0';

  if Trim(edTempoAfast.Text) = ''
  then begin
     MsgDlg('O Tempo de Afastamento deve ser informado.','Erro',mtError,[mbOk,mbHelp],0);
     edTempoAfast.SetFocus;
     Exit;
  end;

  if StrToDate(FormatDateTime('DD/MM/YYYY', dtAfastIni.Date)) < StrToDate( sInscricaoData)  // FUNCEF
  then begin
     MsgDlg('A data da manutenção deve ser maior ou igual a data de inscrição.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtAfastIni.SetFocus;
     TiraSql(qryAux);
     Exit;
  end;

  //Ádler Souza - SOL 121596 KTN 587023
  if dtPrevPagamento.date <= dtAfastIni.date
  then begin
     MsgDlg('A data de previsão de pagamento deve ser maior ou igual a data de Início do Afastamento.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtPrevPagamento.SetFocus;
     TiraSql(qryAux);
     Exit;
  end;
  //Fim - Ádler Souza - SOL 121596 KTN 587023

  If Trim(dtRequerimento.Text) = ''
   Then Begin
     MsgDlg('A data do requerimento deve ser preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     dtRequerimento.SetFocus;
     Exit;
   End;


  {
  ***NÃO DEVE FAZER PARA ESTE ** 
  if not(ValidarAnaliseElegibilidade) then
  begin
    Exit;
  end;
  }

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
     dtmBaseDados.dbBaseDados.RollBack;
     LimpaCampos;
     dtmBaseDados.dbBaseDados.StartTransaction;
     Exit;
  end;

  sDataFimEvento := Trim(dtAfastFim.Text);

  // Gravar situacoes e registro do evento
  if not bAltera
  then VerificaeGravaSituacoes;

  GravaEVENTOSPREV;

  // Atualizar nivel e cargo na tabela elegpatro  - rosana - serpros - 30/08/99
  if Trim(edNivel.Text) = ''
  then sNivel := ' NULL '
  else sNivel := ''''+Trim(edNivel.Text)+'''';


  if Trim(dblkpcmbCargo.Text) = ''
  then sCargo := ' NULL '
  else sCargo := qryCargoExt.FieldByName('IdCargoExt').AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE ELEGPATRO SET NIVEL      = '+sNivel+' , '+
                 '                      IDCARGOEXT = '+sCargo+
                 ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '        IDPESSOA  = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
  end;

  // Grava Data de Inicio Afastamanto, Data de Fim Afastamento
  qryAux.Close;
  qryAux.Sql.Clear;
  
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET IDPESSJURCEDIDO = NULL, DATAINICIOAFAST = To_Date(''' + Trim(dtAfastIni.Text) + ''',''dd/MM/yyyy'')');
  if Trim(sDataFimEvento) <> ''
  then qryAux.SQL.Add(', DATAFIMAFAST    = To_Date(''' +sDataFimEvento+ ''',''dd/MM/yyyy'')' );

  qryAux.SQL.Add(' WHERE IDPESSJUR = ' + sIdPessJur +
                 ' AND   IDPESSOA  = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Grava Salário de Manutenção, e Data de Manutenção
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET SALMANTIDO      = ' + OraNumero(reSalarioManut.Text) + ',' +
                 '                         DATAINICIOMANUT = To_Date(''' + Trim(dtAfastIni.Text) + ''',''dd/MM/yyyy'')' +
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

  // Grava o Histórico de Contribuições por Evento Gerador
  if not bAltera
  then begin
     // Só suspende as contribuições, se o evento não tiver acabado ou a data final for em branco
     if (Trim(sDataFimEvento) = '')  or (Date < StrToDate(sDataFimEvento))
     then bSuspendeContribuicao := True
     else bSuspendeContribuicao := False;

     sMesRef := Copy(dtAfastIni.Text,7,4)+'/'+Copy(dtAfastIni.Text,4,2);

     GravaHSTCONTEVENTOSPRFechado( IntToStr(iIdEventoPrev), sIdPlanoPrev, sIdEventoGerador,
                                   '',sIdPessoa, sIdPessJur, sSeqProposta,'','',
                                   dtAfastIni.Text,bSuspendeContribuicao, qryAux, qryGrava,sIdPlanoPrev)

  end;


  // Só suspende as contribuições, se o evento não tiver acabado
  if bEncerrou then bSuspendeContribuicao := False; 

  if bSuspendeContribuicao
  then if not SuspendeContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtAfastIni.Text,
                                    sDataFimEvento,
                                    edMatricula.Text,
                                    sIdSitPart,
                                    qryAux,
                                    qryGrava,
                                    sFlgInterno, sFlgIntPartAntes)
       then begin
          MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
          dtmBasedados.dbBaseDados.RollBack;
          LimpaCampos;
          dtmBaseDados.dbBaseDados.StartTransaction;
          Exit;
       end;


  if not bAltera
  then begin
     if not AssociaNovasContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtAfastIni.Text,
                                      sDataFimEvento,
                                      edMatricula.Text, qrySitPart.FieldByName('IDSITPART').AsString,
                                      reSalarioManut.Text, False, True,
                                      False,
                                      qryAux, qryGrava,sFlgInterno,iIdEventoPrev,'','',nil,true,dtPrevPagamento.text) //Ádler Souza - SOL 121596 KTN 587023
     then begin
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;


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
              sIdPessJur, sIdPlanoPrev, '', sIdPessJur, sIdPlanoPrev, '', bFlgIntContab,'',
              StrToDate(FormatDateTime('DD/MM/YYYY', dtAfastIni.Date)),
              '', '', 'F', '', 0, 0, StrToDate(FormatDateTime('DD/MM/YYYY', dtAfastIni.Date)),'');

  
  //== Busca o nome real do evento de manutençao
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' select nome from eventogerador '+
                 ' where  ideventogerador       = '+sIdEventoGerador);
  qryAux.Open;
  MostraDetalhesContribuicao( StrToInt(sIdPessJur),
                              StrToInt(sIDPLANOPREV),
                              StrToInt(sIdPessoa),
                              StrToInt(sSeqProposta),
                              'Detalhes de Opções e Contribuições ... ',
                              qryAux.FieldByName('nome').AsString,
                              'AF','' ,
                              dtAfastIni.Text,
                              '',qryAux);

  if MsgDlg('Deseja confirmar os resultados do afastamento?','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo then
  begin
     dtmBasedados.dbBaseDados.Rollback;
     MsgDlg('Evento interrompido pelo usuário.','Informação',mtInformation,[mbOk,mbHelp],0);
  end
  else
  begin
    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes('Evento Afastamento com Manutenção') Then
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
  end;


  LimpaCampos;
  TiraSql(qryAux);

  
  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);



  dtmBaseDados.dbBaseDados.StartTransaction;
end;


procedure TfrmEventoAfastamento.VerificaeGravaSituacoes;
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
                   '     IDSITPLANOPREV = ' + qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString+ //P.RAMOS-05/06/2006-PEND.22520
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

procedure TfrmEventoAfastamento.GravaEVENTOSPREV;
var sDataVolta : string;
begin

  if Trim(dtAfastFim.Text) = '' 
  then sDataVolta := ' NULL '
  else sDataVolta := ' TO_DATE('''+Trim(dtAfastFim.Text)+''', ''DD/MM/YYYY'')' ;

  if bAltera = False
  then begin
          iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

          qryAux.Close;
          qryAux.SQL.Clear;

          If iFLGALTERASITFUNC = 1 Then
            begin
              qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                             '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                             '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                             '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                             '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                             '                         DATAEFETIVADO, FLGEFETIVADO, DATAVOLTA, INSCRICAONUMERO, DATAREQUERIMENTO) ' +
                             ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtAfastIni.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                          sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                          '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                          '''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' +
                                          qrySitPart.FieldbyName('IDSITPART').AsString + ',' + sIdSitPlanoPrev + ',' +
                                          sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                          sDataEfetivado + ',' + sFlgEfetivado +','+sDataVolta+','+OraNumero(edInscNumero.Text)+ ', ' +
                                          'TO_DATE(''' + DateToStr(dtRequerimento.Date) + ''',''DD/MM/YYYY'') )'); 
            end
          Else
             qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                           '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                           '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                           '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                           '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                           '                         DATAEFETIVADO, FLGEFETIVADO, DATAVOLTA, INSCRICAONUMERO, DATAREQUERIMENTO) ' + 
                           ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtAfastIni.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                        sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                        '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                        '''' + sIdSitFunc + '''' + ',' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' + sIdSitPlanoPrev + ',' +
                                        sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                        sDataEfetivado + ',' + sFlgEfetivado +','+sDataVolta+','+OraNumero(edInscNumero.Text)+ ', ' +
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
                         '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                         '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                         '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                         '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                         '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANONOVO  = ' + sIdSitPlanoPrev +
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

procedure TfrmEventoAfastamento.GravaDados;
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

procedure TfrmEventoAfastamento.bbtnCancelarClick(Sender: TObject);
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

procedure TfrmEventoAfastamento.dtAfastIniExit(Sender: TObject);
begin
  inherited;
  if Trim(dtAfastIni.Text) = ''
  then Exit;

  if Trim(dtAfastFim.Text) = ''
  then Exit;

  
  ExecutaRegraTempoAfast;

  // Gleyber - 05/05/2004 - Pendência 16427 - Início
  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtAfastIni.Date;
  // Gleyber - 05/05/2004 - Pendência 16427 - Fim
end;

procedure TfrmEventoAfastamento.dtAfastFimExit(Sender: TObject);
begin
  inherited;
  if Trim(dtAfastFim.Text) = '' then Exit;

  sDataFimEvento := Trim(dtAfastFim.Text);

  if StrToDate( dtAfastFim.text) <   StrToDate( dtAfastIni.text)
  then begin
     MsgDlg('A Data Final do Afastamento deve ser maior que a Data Inicial.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  ExecutaRegraTempoAfast;
end;

procedure TfrmEventoAfastamento.ExecutaRegraTempoAfast;
var
  sSql, sValorRegra: string;
  iNumMesesAux,
  iPartDecAux  : double;
  iPartIntAux  : longint;
  sNumMesesAux : string;
begin

  // Calcular a diferenca entre a data de inicio e a data final em meses
  if Trim(dtAfastFim.Text) = ''
  then begin
     edTempoAfast.Text := '0';
     Exit;
  end
  else begin
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
  end;

  sResultadoRegra := 'True';

  // Executar Regra de Validação do Tempo de Afastamento
  // Passar para a regra a Data Inicial e Final do Afastamento,
  // e o Tempo Total Acumulado de Afastamento
  sSql := ' SELECT  ''' + dtAfastIni.Text   + ''' AS DATAINICIOAFAST, ' +
                   '''' + dtAfastFim.Text   + ''' AS DATAFIMAFAST,    ' +
                          edTempoAfast.Text + '   AS TEMPOAFAST,      '+
          ' EL.TEMPONAOCREDITADO, PLP.IDREGRAVALIDAAFA ' +
          ' FROM  PLANPREVPATRO PLP, ELEGPATRO EL ' +
          ' WHERE PLP.IDPESSJUR   = ' + sIdPessJur   +
          ' AND   PLP.IDPLANOPREV = ' + sIdPlanoPrev +
          ' AND   EL.IDPESSJUR    = PLP.IDPESSJUR ' +
          ' AND   EL.IDPESSOA     = ' + sIdPessoa;
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
        sResultadoRegra := 'False';
        sMensagem := 'Regra de Validação do Tempo de Afastamento retornou "Falso".';
        Exit;
     end;
  end;
end;

function TfrmEventoAfastamento.VerificaCampos: boolean;
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


  if (sDataFimEvento <> '') and
     (StrToDate(FormatDateTime('DD/MM/YYYY', dtAfastFim.Date)) < StrToDate(FormatDateTime('DD/MM/YYYY', dtAfastIni.Date)))
  then begin
       MsgDlg('A Data Final do Afastamento deve ser maior que a Data Inicial.','Erro',mtError,[mbOk,mbHelp],0);
       dtAfastFim.SetFocus;
       Exit;
  end;

  if reSalarioManut.Text = '' then
  begin
       MsgDlg('Salário de Manutenção deve ser informado.','Informação',mtInformation,[mbOk,mbHelp],0);
       reSalarioManut.SetFocus;
       Exit;
  end;
  Result := True;
end;

procedure TfrmEventoAfastamento.LimpaCampos;
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
  dtRequerimento.Text  := '';  
  dblkpcmbSitFunc.Text := '';
  dblkpcmbSitPart.Text := '';
  edTempoAfast.Text    := '';
  reSalarioManut.Text  := '';
  dblkpcmbSitPlanoPrev.Text := '';

  bbtnProcurar.SetFocus;


  ConsPart1.Enabled            := False;
  bbtnOpcoes.enabled           := False;
  bbtnAltEndereco.Enabled := False; 

 
end;

procedure TfrmEventoAfastamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;


end;

procedure TfrmEventoAfastamento.bbtnOpcoesClick(Sender: TObject);
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

procedure TfrmEventoAfastamento.reSalarioManutBtnClick(Sender: TObject);
begin
  inherited;
  if Trim(dtAfastIni.Text) =  ''
  then begin
     MsgDlg('Informe a data do evento. ','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSQL(qryAux);
     dtAfastIni.SetFocus;
     Exit;
  end;

  if ( (iNumOpcoesPatro >= 1) and (bObrigaOpPatro1) and (rOpcao1 <= 0) ) or
     ( (iNumOpcoesPatro >= 2) and (bObrigaOpPatro2) and (rOpcao2 <= 0) ) or
     ( (iNumOpcoesPatro >= 3) and (bObrigaOpPatro3) and (rOpcao3 <= 0) )
  then begin
     MsgDlg('Existem opções obrigatórias não preenchidas. Informe estas opções. ','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSQL(qryAux);
     Exit;
  end;

  if Trim(edNivel.Text) = ''
  then begin
     if MsgDlg('O nível do funcionário na patrocinadora não foi informado. Deseja continuar ? ',
               'Confirmação',mtConfirmation ,[mbYes, mbNo,mbHelp],0) = mrNo
     then begin
       TiraSQL(qryAux);
       Exit;
     end;
  end;

  if Trim(qryCargoExt.FieldByName('IdCargoExt').AsString) = ''
  then begin
     if MsgDlg('O cargo do funcionário na patrocinadora não foi informado. Deseja continuar ? ',
               'Confirmação',mtConfirmation ,[mbYes, mbNo,mbHelp],0) = mrNo
     then begin
       TiraSQL(qryAux);
       Exit;
     end;
  end;
  ExecutaRegraCalculo;
end;

procedure TfrmEventoAfastamento.ExecutaRegraCalculo;  // rosana - serpros - 30/08/99
var
  sSQL, sValorReserva, sMesReferencia, sMesRefSal,
  sOpcao, sSalPart, sRemTotal, sDataInscFund: string;
  rSalarioRefe,
  rValorBaseCalc,
  rValorSalManut,
  rValorRubPerdida,
  rValorRubMantidaFixo,
  rValorRubMantida : Double;
  bPercentual : Boolean;
  sVlrMediaADN, sVlrADN, sVlrSalFacADN: String;
  RegSalPart : TRegSalMes; //Jéssica SOL 124361
  sNovaSitFund:string;
  sLogRegra:TStringList;

begin
  // Executa Regra de Cálculo do Salário de Manutenção
  // Passa para a regra os mesmos dados da Regra de Cálculo do Beneficio
  // Calcula o valor total da soma das reservas do participante
  sLogRegra:=TStringList.Create; //Thiago Passos SOL 127038 Kintana 672735
  frmAguarde.Mostra(' Calculando Salário de Manutenção ... ');
  sSQL := '';

  
  sOpcao := ' ';
  If EdtOpcao.Text <> '' Then Begin
    sOpcao := EdtOpcao.Text;
    MediaAdicional(QryAux,sOpcao,EdMatricula.Text,
                   sVlrMediaADN, sVlrADN, sVlrSalFacADN);
  End;


  //BRUNO AZEVEDO SOL 135165 KINTANA 801908

  {if bFlgUsaRubrica then
     begin
        sSQL := ' SELECT IDPESSOA, IDRUBRICA, VALORRUBRICA, FLGTPRUBMANUT, FLGPERCENT '+
                ' FROM   RUBRICAINDIV  '+
                ' WHERE  IDPESSOA =    '+sIdPessoa +
                ' ORDER  BY FLGTPRUBMANUT ';
     end
  else
     begin
          sValorReserva := OraNumero(CalcReservaPart(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                                                     StrToInt(sIdPessoa), -1, StrToInt(sSeqProposta),
                                                     dtAfastIni.Text,dtAfastIni.Text, '','','', qryAux));

          sMesReferencia := Copy(Trim(dtAfastIni.Text),7,4)+'/'+Copy(Trim(dtAfastIni.Text),4,2);

          sSalPart := ORANUMERO(CalcSalPart(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                             SAnoMesAnterior(sMesReferencia), qryAux));

          sRemTotal := ORANUMERO(CalcREMTOTAL(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                              SAnoMesAnterior(sMesReferencia), qryAux));

          sDataInscFund := CalcDataInscFund(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                                            StrToInt(sIdPessoa), StrToInt(sSeqProposta),qryAux);


       // Jéssica SOL 124361
          RegSalPart := CalcUltSalPart(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                       SAnoMesAnterior(sMesReferencia), sFlgIntPartAntes,
                                       qryAux);

          sMesRefSal := RegSalPart.MesRef; // Jéssica SOL 124361

         if dblkpcmbSitPart.Text <> '' then //Thiago Passos SOL 127038 Kintana 672735
           sNovaSitFund := qrySitPart.FieldByName('IDSITPART').AsString;

          if Trim(sValorReserva) = '' then sValorReserva := '0';
          if Trim(sSalPart) = ''      then sSalPart := '0';
          if Trim(sRemTotal) = ''     then sRemTotal := '0';
          if Trim(sDataInscFund) = '' then sDataInscFund := DateToStr(Date);

          sSQL := ' SELECT '''+sDataInscFund+''' AS INSCRICAODATAFUND, '+  CHR(13) +
                          ''''+Trim(dtAfastIni.Text)+''' AS DATAREF,     '+   CHR(13) +
                          ''''+Trim(dtAfastIni.Text)+''' AS DATAINICIOMANUT,     '+   CHR(13) +

                  QuotedStr(sMesRefSal)       +'    AS MESREFERENCIA,     '+  CHR(13) + // Jéssica SOL 124361
                  QuotedStr(sOpcao)+'               AS OPCAOADN,   '+          CHR(13) +
                  OraNumero(sVlrMediaADN)+'         AS MEDIAADN, '+           CHR(13) +
                  OraNumero(sVlrADN)+'              AS VLRADN, '+             CHR(13) +
                  OraNumero(sVlrSalFacADN)+'        AS SALFACULTADN, '+        CHR(13) +
                  sNovaSitFund +'                   AS NovaSituacaoFund, '+   CHR(13) + //Thiago Passos SOL 127038 Kintana 672735
                  IntToStr(Sistema.IdModulo) + '              As Origem, '+    CHR(13) +  //Thiago Passos SOL 127038 Kintana 672735


                               sSALPART     +' AS VALORPROVENTO,         '+    CHR(13) +
                               sREMTOTAL    +' AS VALORREMTOTAL,         '+     CHR(13) +
                               sValorReserva+' AS VALORRESERVA,          '+     CHR(13) +
                          ''''+Trim(edNivel.Text)    + ''' AS NIVEL,         '+  CHR(13) +
                          qryCargoExt.FieldByName('IdCargoExt').AsString+' AS IDCARGOEXT,   '+  CHR(13) +

                  '        PF.DATANASC,                                '+  CHR(13) +
                  '        PLP.IDRGSALMANUT,                    '+  CHR(13) +
                  '        EL.SALTOTAL, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO, '+  CHR(13) +
                  '        EL.TEMPOSERVANTREAL, EL.TEMPOSITESPECIAL,    '+  CHR(13) +
                  '        EL.IDSITFUNC, '+  CHR(13) +
                  '        EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, '+  CHR(13) +
                  '        EL.DATAADMISSAO, EL.DATADEMISSAO,            '+  CHR(13) +
                  '        PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA, '+  CHR(13) +

                  '        PP.IDSITPART, PP.IDSITPLANOPREV, EL.FLGDIRETOR                '+  CHR(13) +
                  ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF, PLANPREVPATRO PLP '+  CHR(13) +
                  ' WHERE  PP.IDPESSOA    = ' + sIdPessoa    + ' AND ' +  CHR(13) +
                  '        PP.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +   CHR(13) +
                  '        PP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +  CHR(13) +
                  '        PP.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +  CHR(13) +
                  '        EL.IDPESSOA    = PP.IDPESSOA      AND ' +      CHR(13) +
                  '        EL.IDPESSJUR   = PP.IDPESSJUR     AND ' +      CHR(13) +
                  '        PF.IDPESSOA    = EL.IDPESSOA      AND ' +       CHR(13) +
                  '        PP.IDPLANOPREV = PLP.IDPLANOPREV AND ' +        CHR(13) +
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
         frmAguarde.Apaga;
         MostrarErro(E);
         Exit;
     end;
  end;
  frmAguarde.Apaga;

  if (not bFlgUsaRubrica) then
      sIdRegraSalario := qryRegra.FieldByName('IDRGSALMANUT').AsString;

  if sIdRegraSalario = '' then
     begin
       if (bFlgUsaRubrica) then
        begin
           qryRegra.First;
           rSalarioRefe     := 0;
           rValorBaseCalc   := 0;
           rValorSalManut   := 0;
           rValorRubPerdida := 0;
           rValorRubMantida := 0;
           rValorRubMantidaFixo := 0;

           while not qryRegra.Eof do
           begin
              bPercentual  := (qryRegra.FieldByName('FLGPERCENT').AsInteger = 1);

              if qryRegra.FieldByName('FLGTPRUBMANUT').AsString = 'B' then
              rSalarioRefe := rSalarioRefe + (qryRegra.FieldByName('VALORRUBRICA').AsFloat);

              if bPercentual then
              begin
                 if qryRegra.FieldByName('FLGTPRUBMANUT').AsString = 'M' then
                    rValorRubMantida := rValorRubMantida + (qryRegra.FieldByName('VALORRUBRICA').AsFloat/100)
                 else
                    if qryRegra.FieldByName('FLGTPRUBMANUT').AsString = 'P' then
                       rValorRubPerdida := rValorRubPerdida + (qryRegra.FieldByName('VALORRUBRICA').AsFloat/100);
              end
              else
                 if qryRegra.FieldByName('FLGTPRUBMANUT').AsString = 'M' then
                    rValorRubMantidaFixo:= rValorRubMantidaFixo + (qryRegra.FieldByName('VALORRUBRICA').AsFloat);
              qryRegra.Next;
           end;

           rValorSalManut      := (rSalarioRefe * (rValorRubMantida + 1) );
           rValorSalManut      := (rValorSalManut +  rValorRubMantidaFixo);

           //BRUNO AZEVEDO SOL 135165 KINTANA 801908
           //reSalarioManut.Text :=  ClienteNumero(FormatFloat('#0.00',rValorSalManut));
        end;
        Exit;
     end; 

  if (qryRegra.FieldByName('ValorBase1').AsString = '') or
     (qryRegra.FieldByName('ValorBase2').AsString = '') or
     (qryRegra.FieldByName('ValorBase3').AsString = '')
  then begin
     if ( (iNumOpcoesPatro >= 1) and (bObrigaOpPatro1) ) or
        ( (iNumOpcoesPatro >= 2) and (bObrigaOpPatro2) ) or
        ( (iNumOpcoesPatro >= 3) and (bObrigaOpPatro3) )
     then begin
        frmAguarde.Apaga;
        MsgDlg('Existem opções obrigatórias não preenchidas. Informe estas opções. ','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Exit;
     end
     else begin
        if MsgDlg('Existem opções obrigatórias não preenchidas. Deseja continuar ? ','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrNo
        then begin
           frmAguarde.Apaga;
           TiraSQL(qryAux);
           Exit;
        end;
     end;
  end;

  sLogRegra.Add('');  //Thiago Passos SOL 127038 Kintana 672735
  sLogRegra.Add('Data de Execução: '+  FormatDateTime('dd/mm/yyyy hh:mm:ss',now)); //Thiago Passos SOL 127038 Kintana 672735
  sLogRegra.Add('SQL de Entrada da Regra: ' + qryRegra.FieldByName('IDRGSALMANUT').AsString);//Thiago Passos SOL 127038 Kintana 672735
  sLogRegra.Add('');  //Thiago Passos SOL 127038 Kintana 672735
  sLogRegra.Add(qryRegra.SQL.Gettext); //Thiago Passos SOL 127038 Kintana 672735
  sLogRegra.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\Log_SQLEntrada_Regra_'+qryRegra.FieldByName('IDRGSALMANUT').AsString+'.log');//Thiago Passos SOL 127038 Kintana 672735
  FreeAndNil(sLogRegra); //Thiago Passos SOL 127038 Kintana 672735

  regCalculo.QueryIn  := qryRegra;
  regCalculo.RuleName := qryRegra.FieldByName('IDRGSALMANUT').AsString;
  try
     regCalculo.Execute;
  except
     frmAguarde.Apaga;
     MsgDlg('Erro na Execução da Regra de Cálculo do Salário de Manutenção Nº '+
            qryRegra.FieldByName('IdRgSalManut').AsString+'.','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end;
  }

  sMesReferencia := Copy(Trim(dtAfastIni.Text),7,4)+'/'+Copy(Trim(dtAfastIni.Text),4,2);
  RegSalPart     := CalcUltSalPart(StrToInt(sIdPessJur), StrToInt(sIdPessoa), SAnoMesAnterior(sMesReferencia), sFlgIntPartAntes, qryAux);
  reSalarioManut.Text := FormatFloat('#0.00', StrToFloat(RegSalPart.Valor));
  dblkpcmbSitFunc.SetFocus;
  //BRUNO AZEVEDO SOL 135165 KINTANA 801908
  frmAguarde.Apaga;
end;

procedure TfrmEventoAfastamento.dblkpcmbCargoDropDown(Sender: TObject);
begin
  inherited;
  qryCargoExt.Close;
  qryCargoExt.Open;
end;

function TfrmEventoAfastamento.ExecutaRegraConcessao : boolean;
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
  sSQL := ' SELECT PLP.IDREGRAMANUTENCAO, PP.IDPESSOA, PP.IDPESSJUR,      PP.IDPLANOPREV, ' +
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
  qryAux.SQL.Add(' SELECT IDREGRAMANUTENCAO FROM PLANPREVPATRO '+
                 ' WHERE  IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                 '        IDPLANOPREV = ' + sIdPlanoPrev );
  qryAux.Open;
  if not qryAux.IsEmpty
  then sIdRegra := qryAux.FieldByName('IDREGRAMANUTENCAO').AsString;

  if sIdRegra = ''
  then begin
     Result := True;
     Exit;
  end;

  if not RegraBooleana(sIdRegra, sSQL, bErro )
  then begin
     if bErro
     then begin
        MsgDlg('Erro na Execução da Regra de Concessão de Manutenção.','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSql(qryAux);
        Exit;
     end
     else begin
        MsgDlg('Manutenção não permitida . Motivo : Participante não aprovado pela Regra de Elegibilidade. ','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSql(qryAux);
        Exit;
     end;
     Result := False;
  end
  else Result := True;
end;


procedure TfrmEventoAfastamento.grdItensSalFieldChanged(Sender: TObject;
  Field: TField);
var sDataFinal : String;
begin
  inherited;



end;

procedure TfrmEventoAfastamento.sbtnEvolFuncionalClick(Sender: TObject);
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
  if dtmBaseDados.dbBaseDados.InTransaction
  then begin
      dtmBaseDados.dbBaseDados.RollBack;
      bReabreTransacao := True;
  end;

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

       //SOL 121368 - KINTANA 589276 - Álder Souza - INÍCIO
       TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).Visible := False;
       TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).ShowModal;
       //SOL 121368 - KINTANA 589276 - Álder Souza - FIM
    end;
  except
     raise;
  end;

  if bReabreTransacao
  then begin
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;
end;

procedure TfrmEventoAfastamento.bbtnAltEnderecoClick(Sender: TObject);
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Selecione um Participante.','Erro',mtError,[mbOK],0);
     Exit;
  end;

  frmAlteraEnderecoCobranca := TfrmAlteraEnderecoCobranca.Create(Application);
  try
     if frmAlteraEnderecoCobranca.AlteraEnderecoCobranca(StrToInt(OraNumero(sIdPessoa)))
     then MsgDlg('Alterações efetuadas com sucesso.'+#13+
                 'ATENÇÃO : Essas alterações só serão gravadas se o evento for confirmado.','Informação',mtInformation,[mbOK],0)
     else MsgDlg('Erro ao efetuar alterações.'+#13+
                 'ATENÇÃO : Essas alterações NÃO serão gravadas.','Informação',mtInformation,[mbOK],0)
  finally
     frmAlteraEnderecoCobranca.Free;
  end;

end;

procedure TfrmEventoAfastamento.AnaliseElegibilidadeValidouRegra(
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

function TfrmEventoAfastamento.ValidarAnaliseElegibilidade: Boolean;
var
  analiseElegibilidade : TAnaliseElegibilidade;
begin
  Result := True;
  analiseElegibilidade := TAnaliseElegibilidade.Create('BaseDados',
                                                       reElegibilidadeBPD,
                                                       StrToInt(sIdPessoa),
                                                       StrToInt(sIdPlanoPrev),
                                                       StrToInt(sIdEventoGerador),
                                                       Trim(dtAfastIni.Text),
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
    if (not(Result)) then
    begin
      MsgDlg(analiseElegibilidade.MensagemRegrasNaoElegiveis, 'Analise de Elegibilidade', mtInformation, [mbOk], 0);
    end;
  finally
    FreeAndNil(analiseElegibilidade);
  end;
end;

end.
