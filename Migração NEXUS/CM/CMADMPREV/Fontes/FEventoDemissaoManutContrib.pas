// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina.....: (dfm qrySitFunc, qrySitPart, qrySitPlanoPrev) bbtnProcurarClick, ExecutaRegraCalculo
// Nº SIG.....: 102708
// Data.......: 05/10/2020
// Responsável: Edilaine
// Descrição..: trazer situação nova igual situação atual na patro
// -----------------------------------------------------------------------------
// Rotina.....: (dfm) qryEventoGera, FormShow
// Nº SIG.....: 101492
// Data.......: 13/08/2020
// Responsável: Edilaine
// Descrição..: considerar flags do Evento para atualizaçao das situacoes do participante
// -----------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 02/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
//Nº SIG...........: 27871
//Data da Alteração:  25/11/2016
//Responsável......: Darivaldo Alencar
//Descrição........: Buscando atender a legislação, Instrução PREVIC nº 18 de 24/12/2014,
//                   favor criar os seguintes campos no cadastro dos participantes:
//                   Nome do conjuge; Cargo, emprego ou função pública; Órgão;
//                   Período (data início e data fim).
//------------------------------------------------------------------------------
//Nº SOL:             266932-18049
//Nº KINTANA          1239691
//Data da Alteração:  22/02/2016
//Alteração Form:     ReadOnly = true para campo data demissao
//Responsável:        André Imakawa
//******************************************************************************
//  Autor      : Thiago Melo
//  Rotina     : ExecutaRegraCalculo
//  Data       : 19/11/2013
//  Pendencia  : SOL 210568 Kintana 2049597
//  Descrição  : Erro ao gerar no evento
//------------------------------------------------------------------------------
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
// Autor(a)    : Jéssica Lana
// Rotina      : Varias
// Data        : 04/02/2009
// Pendência   : 130362
// Alteração   : Correção do erro ao abrir o cadastro de evoluçaõ funcional.
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
// Rotinas     : bbtnConfirmarClick, bbtnProcurarClick
// Autor(a)    : Gleyber
// Pendência   : 18994
// Data        : 03/08/2004
// Descricao   : Inclusão de um check box para indicar se o funcionário foi cedido
//               à fundação.
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Botão novo
//  Data       : 06.07.2004
//  Pendencia  : 16725
//  Descrição  : Botao para alteracao de endereco e conta bancaria
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : Click do confirmar
//  Data       : 24.06.2004
//  Descrição  : zerar campo MESULTREAJSAL para que o salário de manutenção seja gerado para pessoas que
//               já tem salário de ativo para meses posteriores
//               como o campo é o mesmo, caso o salário de ativo da pessoa seja posterior, o evento
//               não processa os reajustes
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
// Data        : 30/03/2004
// Alteração   : Inclusao de valor 0 defaut no campo Opção Adicional Noturno
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
// Autor(a)    : Augusto
// Data        : 15/10/2003
// Descrição   : ExecutaRegraCalculo - Inclusão do campo FLGDIRETOR da ELEGPATRO
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.01.2004
// Pendencia   : --- ( Funcef )
// Descrição   : Retirada do grid de itens salariais e inclusao do botão
//               de atalho para a evolução funcional
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
// Data        : 01.10.2003
// Alteração   : Alteração na emissão do demonstrativo e nas perguntas feitas no OK
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 18/09/2003
// Alteração   : Retirada do adicional noturno dos itens que compõem o salario
//               Inclusao do Edit para opcao de ADN 
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 15/08/2003
// Rotina      : qryItensSal
// Pendência   : 14858 - Retirado o Order by da SubQuery e passada para a
//               query principal
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : ExecutaRegraCalculo
// Autor(a)    : Augusto
// Data        : 15/04/2003
// Alteração   : Novo oprocedimento para buscar o salario de participacao.
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
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Carlos Guedes
// Data      : 11/07/2002:
// Alteração : retirado do update (DATACANCELAMENTO)
// *****************************************************************************
// Rotina    :
// Autor(a)  : Gleyber
// Data      : 23/08/2002
// Alteração : Permitir a indicação de uma data de inicio da conbrança de manutenção
//             diferente da data do evento
//             Pendência: 8505
// *****************************************************************************
// Rotina    :
// Autor(a)  : Gleyber
// Data      : 23/08/2002
// Alteração : Inclusão de uma confirmação (commit) logo após emissão do
//             demostrativo de cálculo
//             Pendência: 8475
// *****************************************************************************


unit FEventoDemissaoManutContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,  cmseldlg, TREdit, URegra, TB97Tlbr, UConsPart, Mask, MskEdDlg,
  IvDictio, IvMulti, IvEMulti, TEdNum, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, UAnaliseElegibilidade;

  
type
  TfrmEventoDemissaoManutContrib = class(TfrmOkCancelar)
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
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    qryRegra: TwwQuery;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    dblkpcmbCargo: TwwDBLookupCombo;
    qryCargoExt: TwwQuery;
    lblBeneficio: TLabel;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    qryBenef: TwwQuery;
    Label14: TLabel;
    Label15: TLabel;
    dblkpcmbCargoConf: TwwDBLookupCombo;
    Label9: TLabel;
    spbRubricas: TSpeedButton;
    reSalarioManut: TcmMaskEditDlg;
    qryCargoExCo: TwwQuery;
    edNivel: TEdit;
    edNivelConf: TEdit;
    lblDataDemissao: TLabel;
    dtDataDemissao: TCMDateTimePicker;
    qryEvento: TwwQuery;
    dtDataContribuicao: TCMDateTimePicker;
    Label16: TLabel;
    PnlOpcao: TPanel;
    Label22: TLabel;
    EdtOpcao: TEdit;
    sbtnEvolFuncional: TSpeedButton;
    Label17: TLabel;
    dtRequerimento: TCMDateTimePicker;
    bbtnAltEndereco: TBitBtn;
    chkFuncionarioCedido: TCheckBox;
    dtPrevPagamento: TCMDateTimePicker;
    Label18: TLabel;
    qryEventoGera: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure reSalarioManutBtnClick(Sender: TObject);
    procedure dtDataDemissaoExit(Sender: TObject);
    procedure dtEventoExit(Sender: TObject);
    procedure grdItensSalFieldChanged(Sender: TObject; Field: TField);
    procedure sbtnEvolFuncionalClick(Sender: TObject);
    procedure bbtnAltEnderecoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean; 
    iIdEventoPrev: integer;
    sIdPessoa,  sIdPessJur, sIdPlanoPrev,    sSeqProposta       : string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sFlgInternoSitPart,
    sFlgIntPartAntes : string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado, sIdRegraSalario, sDataInscricao : string;  
    bAltera, bFlgUsaRubrica : boolean;
    sEstadoEvento: string;
    sResultadoRegra: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4 ,               rOpcao5,                  rOpcao6              : real;


    iNumOpcoesPatro : word;
    bObrigaOpPatro1,
    bObrigaOpPatro2,
    bObrigaOpPatro3 : boolean;
    iLeftForm:Integer;
    iHeightForm: Integer;
    iWidthForm: Integer;
    iTopForm: Integer;
    i:integer;



    procedure ExecutaRegraConcessao;
    procedure ExecutaRegraCalculo;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;

    function ValidarAnaliseElegibilidade : Boolean;
    procedure AnaliseElegibilidadeValidouRegra(ARegraElegibilidade : TValidacaoRegraElegibilidade; var Validou: Boolean);
    function PossuiParrametroPPE(IdPessoa: String):boolean;//Darivaldo Alencar SIG 27871
    function CamposPPEVazio(IdPessoa: String):String;//Darivaldo Alencar SIG 27871
  public
    { Public declarations }
  end;

var
  frmEventoDemissaoManutContrib: TfrmEventoDemissaoManutContrib;

 {Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados, FCadContribParticipante,
  UMovReserva, FMostraContribuicoes, UEventos, UParticipante,
  FCadOpcoesElegivel, fAguarde, UContribuicaoPrev, UIntegraBack,
  UFuncoesUteis, UBeneficio, UPCS, USistema, FCadEvolFuncPrev,
  FAlteraEnderecoCobranca;

{$R *.DFM}

procedure TfrmEventoDemissaoManutContrib.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';
  spbRubricas.Enabled := False;
  bEncerrou := False; 
end;

procedure TfrmEventoDemissaoManutContrib.FormShow(Sender: TObject);
begin
  inherited;
  memo.SendToBack;

  qrySitFunc.Close;
  //qrysitFunc.parambyname('IDEVENTO').AsString := sIdEventoGerador;           //edilaine SIG102708
  qrySitFunc.Open;
  qrySitPlanoPrev.Close;
  //qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;      //edilaine SIG102708
  qrySitPlanoPrev.Open;
  qrySitPart.Close;
  //qrysitPart.parambyname('IDEVENTO').AsString  := sIdEventoGerador;          //edilaine SIG102708
  qrySitPart.Open;

  qryBenef.Close;
  qryBenef.ParamByName('IDPLANOPREV').AsInteger := -1;
  qryBenef.Open;

  //edilaine SIG101492 : inicio
  qryEventoGera.Close;
  qryEventoGera.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qryEventoGera.Open;

  dblkpcmbSitFunc.enabled      := (qryEventoGera.FieldByName('FLGSITFUNCIMEDIA').AsInteger = 1) and
                                  (qryEventoGera.FieldByName('FLGALTERASITFUNC').AsInteger = 1);
  dblkpcmbSitPlanoPrev.enabled := qryEventoGera.FieldByName('FLGSITPLANOIMEDI').AsInteger = 1;
  dblkpcmbSitPart.enabled      := qryEventoGera.FieldByName('FLGSITPARTIMEDIA').AsInteger = 1;
  sbtnEvolFuncional.enabled    := qryEventoGera.FieldByName('FLGINCLUIHISTFUNC').AsInteger = 1;
  //edilaine SIG101492 : fim

  qryCargoExt.Close;     qryCargoExt.Open;
  qryCargoExCo.Close;    qryCargoExCo.Open;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  dtmBaseDados.dbBaseDados.StartTransaction;


   i:=0; //Jéssica Lana SOL 130362
end;

procedure TfrmEventoDemissaoManutContrib.bbtnProcurarClick(Sender: TObject);
var iIdCargoExt : longint;
    tipsit : string;
    sCampoVazio: String;//Darivaldo Alencar SIG 27871
begin
  inherited;
  memo.SendToBack;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
    //Darivaldo Alencar SIG 27871 -inicio
    if PossuiParrametroPPE(MontaSelectPart.ValoresChave[0]) then
      begin
         sCampoVazio :=  CamposPPEVazio(MontaSelectPart.ValoresChave[0]);
         if (sCampoVazio <> EmptyStr) then
            begin
              MsgDlg('Impedido de lançar o evento de autopatrocínio.'+#13+
                     'Favor verificar o preenchimento dos campos'+#13+
                     'referente a PPE no cadastro.'+#13+
                      sCampoVazio ,'Aviso',mtWarning,[mbOK],0);
              exit;
            end;
      end
    else begin
          MsgDlg('Impedido de lançar o evento de autopatrocínio.'+#13+
                 'Favor verificar o preenchimento dos campos'+#13+
                 'referente a PPE no cadastro.'+#13+
                 '<Parâmetro>','Aviso',mtWarning,[mbOK],0);
          exit;
    end;
    //Darivaldo Alencar SIG 27871 -fim
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
     dtDataDemissao.Text:= MontaSelectPart.ValoresChave[14];
     edNivel.Text       := MontaSelectPart.ValoresChave[27];
     sFlgInternoSitPart := MontaSelectPart.ValoresChave[29];
     tipsit := MontaSelectPart.ValoresChave[30]; 

     sDataInscricao     := MontaSelectPart.ValoresChave[13];  

     chkFuncionarioCedido.Checked := (StrToInt(MontaSelectPart.ValoresChave[31]) = iIdFundacao);  

      
     if (tipsit =  'A') and (dtDataDemissao.Text <> '') then
           MsgDlg('Este participante está com situação da categoria ATIVO na patrocinadora porém já possui data de demissão preenchida. Verifique. ','Informação',mtInformation,[mbOk],0)  ;

      // Fim Pendência
     if Trim(MontaSelectPart.ValoresChave[28]) = ''
     then dblkpcmbCargo.Text := ''
     else begin
        iIdCargoExt := StrToInt(MontaSelectPart.ValoresChave[28]);
        if qryCargoExt.Locate('IdCargoExt',iIdCargoExt,[loCaseInsensitive])
        then dblkpcmbCargo.Text := qryCargoExt.FieldByName('Titulo').AsSTring
        else dblkpcmbCargo.Text := '';
        dblkpcmbCargo.PerformSearch;
     end;

     if Trim(MontaSelectPart.ValoresChave[20]) = ''
     then iNumOpcoesPatro    := 0
     else iNumOpcoesPatro    := StrToInt(MontaSelectPart.ValoresChave[20]);
     bObrigaOpPatro1         := (Trim(MontaSelectPart.ValoresChave[21]) = '1');
     bObrigaOpPatro2         := (Trim(MontaSelectPart.ValoresChave[22]) = '1');
     bObrigaOpPatro3         := (Trim(MontaSelectPart.ValoresChave[23]) = '1');

     if Trim(MontaSelectPart.ValoresChave[24]) <> ''
     then rOpcao1 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[24]))
     else rOpcao1 := 0;

     if Trim(MontaSelectPart.ValoresChave[25]) <> ''
     then rOpcao2 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[25]))
     else rOpcao2 := 0;

     if Trim(MontaSelectPart.ValoresChave[26]) <> ''
     then rOpcao3 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[26]))
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


     qryBenef.Close;
     qryBenef.ParamByName('IDPLANOPREV').AsString := sIdPlanoPrev;
     qryBenef.Open;

     // Verifica se o evento já foi registrado

     //comentadao para permitir que pessoas em manutanção
     //por planos de incentivo pudessem
     //pasar para manutanção por recursos próprios
     //VerificaEstadoEvento;
     sEstadoEvento := 'NAO REGISTRADO';

     if sEstadoEvento = 'NAO REGISTRADO'
     then begin // Verifica se pode Inserir
        if not PodeRegistrarEvento(qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                           sFlgInterno,sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sMotivoEvento)
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

         dtEvento.Text             := ''; // Precisa limpar (senao nao executa regra)
     end
     else begin

        bAltera := True; 

        if sEstadoEvento = 'REGISTRADO'
        then begin// Pode Alterar
           MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
           bAltera := True;
           reSalarioManut.Text       := MontaSelectPart.ValoresChave[15];
           dtEvento.SetFocus;
        end
        else if sEstadoEvento = 'EFETIVADO'
             then begin// Não Pode Alterar, nem inserir outro evento
                MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                reSalarioManut.Text       := MontaSelectPart.ValoresChave[15];
                pnlInformacao.Enabled := False;
                bbtnConfirmar.Enabled := False;
                bbtnCancelar.Enabled  := False;
             end;
        dtEvento.Text             := qryEvento.FieldByName('DataEvento').AsString;
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

     // Verifica se usa Cadastro de Rubricas no Cálculo do Salário //
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT FLGUSARUBRICA, IDRGSALMANUT FROM PLANPREVPATRO  '+
                    ' WHERE  IDPESSJUR   = '+''''+sIdPessJur    +''''+
                    ' AND    IDPLANOPREV = '+''''+sIdPlanoPrev  +'''');
     qryAux.Open;
     bFlgUsaRubrica    := (qryAux.FieldByName('FLGUSARUBRICA').AsInteger = 1);
     sIdRegraSalario   :=  qryAux.FieldByName('IDRGSALMANUT').AsString;

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

     //edilaine SIG101492 : inicio
     if not dblkpcmbSitFunc.enabled then
     begin
       if dblkpcmbSitFunc.LookupTable.RecordCount >= 1
       then dblkpcmbSitFunc.Text      := edSitPatro.text
       else dblkpcmbSitFunc.Text      := '';
       dblkpcmbSitFunc.PerformSearch;
     end;

     if not dblkpcmbSitPlanoPrev.enabled then
     begin
        if dblkpcmbSitPlanoPrev.LookupTable.RecordCount >= 1
        then dblkpcmbSitPlanoPrev.Text := edSitPlano.Text
        else dblkpcmbSitPlanoPrev.Text := '';
        dblkpcmbSitPlanoPrev.PerformSearch;
     end;

     if not dblkpcmbSitPart.enabled then
     begin
        if dblkpcmbSitPart.LookupTable.RecordCount >= 1
        then dblkpcmbSitPart.Text      := edSitFundacao.Text
        else dblkpcmbSitPart.Text      := '';
        dblkpcmbSitPart.PerformSearch;
     end;
     //edilaine SIG01492 : fim

  end;
    //if  montaselectpart.retornouvalor  and (sEstadoEvento <> 'EFETIVADO')then     //edilaine SIg102708
    if (NOT montaselectpart.retornouvalor) and (sEstadoEvento <> 'EFETIVADO') then  //edilaine SIg102708
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitFunc.Text:='';
       dblkpcmbSitPart.text:='';
      end;
end;

procedure TfrmEventoDemissaoManutContrib.VerificaEstadoEvento;
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

procedure TfrmEventoDemissaoManutContrib.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef,
  sMsgErro,
  sNovoSalario, 
  sIdEvento, sNomeTitular, sRemTotal, sAnoMesRef: string;
  bManutBenefIndicado,
  bFlgIntContab  : boolean;

  sNivel, sCargo : string;
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


  if Trim(dtDataContribuicao.Text) = '' then
     begin
          MsgDlg('A Data do Início da Contribuição deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtDataContribuicao.SetFocus;
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

  if (dtDataDemissao.Text = '') then  
     begin
          MsgDlg('A data de demissão deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtDataDemissao.SetFocus;
          Exit;
     end;

  If Trim(dtRequerimento.Text) = ''
   Then Begin
     MsgDlg('A data do requerimento deve ser preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     dtRequerimento.SetFocus;
     Exit;
   End;

  if StrToDate(FormatDateTime('DD/MM/YYYY', dtDataContribuicao.Date)) < StrToDate(FormatDateTime('DD/MM/YYYY', StrToDateTime(MontaSelectPart.ValoresChave[13])))
  then begin
     MsgDlg('A data da manutenção deve ser maior ou igual a data de inscrição.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtDataContribuicao.SetFocus;
     TiraSql(qryAux);
     Exit;
  end;

  if StrToDate(FormatDateTime('DD/MM/YYYY', dtDataContribuicao.Date)) < StrToDate(FormatDateTime('DD/MM/YYYY', dtDataDemissao.Date))
  then begin
     MsgDlg('A data da manutenção deve ser maior ou igual a data de demissão.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtDataContribuicao.SetFocus;
     TiraSql(qryAux);
     Exit;
  end;

  //Ádler Souza - SOL 121596 KTN 587023
  if dtPrevPagamento.Date <= dtEvento.Date
  then begin

     MsgDlg('A data de previsão de pagamento deve ser maior ou igual a data do Evento.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtPrevPagamento.SetFocus;
     TiraSql(qryAux);
     Exit;
  end;
  //Fim - Ádler Souza - SOL 121596 KTN 587023

  if sFlgInterno = 'PD' then
     if dblkpcmbBeneficio.Text = '' then
        begin
           MsgDlg('O Benefício a ser requerido após a manutenção, não foi informado.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbBeneficio.SetFocus;
           Exit;
        end;

  if qrySitPart.FieldByName('FLGINTERNO').AsString <> 'MA' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser da Categoria Mantido.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  //BRUNO AZEVEDO
  //if not(ValidarAnaliseElegibilidade) then
  //begin
  //  Exit;
  //end;


  if VerificaExisteContribMesEvento(qryAux, sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta, dtEvento.Text) then
  begin
     dtEvento.SetFocus;
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
  if uppercase(sResultadoRegra)  = 'FALSE' then
     begin
          MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
          dtmBaseDados.dbBaseDados.RollBack;
          LimpaCampos;
          memo.Clear;
          dtmBaseDados.dbBaseDados.StartTransaction;
          exit;
     end;

  // Atualizar nivel e cargo na tabela elegpatro
  if Trim(edNivel.Text) = ''
  then sNivel := ' NULL '
  else sNivel := ''''+Trim(edNivel.Text)+'''';

  if Trim(dblkpcmbCargo.Text) = ''
  then sCargo := ' NULL '
  else sCargo := qryCargoExt.FieldByName('IdCargoExt').AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE ELEGPATRO SET NIVEL      = '+sNivel+' , '+
                 '                      IDCARGOEXT = '+sCargo);
  If chkFuncionarioCedido.Checked
   Then qryAux.SQL.Add(', IDPESSJURCEDIDO = '+IntToStr(iIdFundacao));

  qryAux.SQL.Add(
                 ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '        IDPESSOA  = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
  end;


 //== Deve iniciar estar variaveis aqui, porque são usadas na grava eventosprev

 {Se o Evento não requer Benefício, grava as situações de Imediato, e já grava o evento como efetivado}
  sFlgEfetivado    := '1';
  sDataEfetivado   := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')'; 

  //edilaine SIG101492 : inicio
  {sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';}

  sFlgSitFuncImed  := qryEventoGera.FieldByName('FLGSITFUNCIMEDIA').AsString;
  sFlgSitPartImed  := qryEventoGera.FieldByName('FLGSITPARTIMEDIA').AsString;
  sFlgSitPlanoImed := qryEventoGera.FieldByName('FLGSITPLANOIMEDI').AsString;
  //edilaine SIG101492 : fim

  GravaEVENTOSPREV;

 {Grava Data de Demissão, SALTOTAL}
  sAnoMesRef := Copy(dtEvento.Text ,7,4) + '/' + Copy(dtEvento.Text ,4,2);
  sRemTotal  := OraNumero(CalcRemTotal(StrToInt(sIdPessJur),StrToInt(sIdPessoa),
                         SAnoMesAnterior(sAnoMesRef), qryAux));

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET DATADEMISSAO = To_Date(''' + Trim(dtDataDemissao.Text) + ''',''dd/MM/yyyy'')' + ',' +
                 '                      SALTOTAL = ' + sRemTotal +
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

  // Atualizar HISTFUNCPREV com DATADEMISSAO
  if not AtualizaHistFuncPrev ( qryAux, StrToInt(sIdPessJur), StrToInt(sIdPessoa), '',Trim(dtEvento.Text), sIdEventoGerador )
  //
  then begin
     MsgDlg('Erro ao atualizar histórico funcional. Verifique.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  // Grava Salário de Manutenção, e Data de Manutenção
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET SALMANTIDO       = ' + OraNumero(reSalarioManut.Text) + ',' +
                ' MESULTREAJSAL = NULL ,'+ 

                 '                         DATAINICIOMANUT  = To_Date(''' + Trim(dtDataContribuicao.Text) + ''',''dd/MM/yyyy'')' +
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

     sMesRef := Copy(dtDataContribuicao.Text,7,4)+'/'+Copy(dtDataContribuicao.Text,4,2);

     GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), sIdPlanoPrev, sIdEventoGerador, '',
                                       sIdPessoa, sIdPessJur, sSeqProposta, '','',
                                       dtEvento.Text,
                                       True,qryAux,qryGrava,sIdPlanoPrev);

     if not bEncerrou
     then begin 
        if not SuspendeContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador,
                                    dtDataContribuicao.Text,
                                    '', edMatricula.Text,
                                     qrySitPart.FieldByName('IDSITPART').AsString, qryAux, qryGrava,
                                     sFlgInterno, sFlgInternoSitPart)
        then begin
           MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           dtmBasedados.dbBaseDados.RollBack;
           LimpaCampos;
           dtmBaseDados.dbBaseDados.StartTransaction;
           exit;
        end;
     end;


     // Trocar as sit. após suspender contrib., porque em caso de
     // calc. da última contrib. não deve ter trocado a situação
     if not bAltera then
        VerificaeGravaSituacoes;


     if Trim(dblkpcmbBeneficio.Text) <> ''
     then bManutBenefIndicado := True
     else bManutBenefIndicado := False;

     if not AssociaNovasContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador,
                                      dtDataContribuicao.Text, '',
                                      edMatricula.Text, qrySitPart.FieldByName('IDSITPART').AsString,
                                      reSalarioManut.Text,False, True, bManutBenefIndicado,
                                      qryAux, qryGrava,sFlgInterno, iIdEventoPrev,'','',nil,true, dtPrevPagamento.text) //Ádler Souza - SOL 121596 KTN 587023
     then begin
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;


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
                              dblkpcmbBeneficio.Text,
                              dtEvento.Text,
                              '',qryAux);

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
  if MsgDlg('Confirma efetivação do evento ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then begin

    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

     dtmBasedados.dbBaseDados.Commit;
     LimpaCampos;
     TiraSql(qryAux);
     MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

     If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
       Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

  end
  else bbtnCancelarClick(Self);
end;


procedure TfrmEventoDemissaoManutContrib.VerificaeGravaSituacoes;
begin
 {Se o Evento não requer Benefício, grava as situações de Imediato, e já grava o evento como efetivado}
  sFlgEfetivado  := '1';
  sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')';

  //edilaine SIG101492 : inicio
  {sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';}

  sFlgSitFuncImed  := qryEventoGera.FieldByName('FLGSITFUNCIMEDIA').AsString;
  sFlgSitPartImed  := qryEventoGera.FieldByName('FLGSITPARTIMEDIA').AsString;
  sFlgSitPlanoImed := qryEventoGera.FieldByName('FLGSITPLANOIMEDI').AsString;
  //edilaine SIG101492 : fim

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

procedure TfrmEventoDemissaoManutContrib.GravaEVENTOSPREV;
var
  sIdRegraBeneficio, sIdRegraResgate : string;

begin
  sIdRegraBeneficio := '';

  if (sFlgInterno = 'PD') then
  begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' SELECT EP.IDREGRARESGATE, BP.IDREGRACALCULO  '+
                     ' FROM   EVENTOSPLANO EP, BENEFPLANPREV BP     '+
                     ' WHERE  EP.IDEVENTOGERADOR = ' + sIdEventoGerador + ' AND ' +
                     '        EP.IDPLANOPREV     = ' + sIdPlanoPrev     + ' AND ' +
                     '        EP.IDPLANOPREV     = BP.IDPLANOPREV           AND ' +
                     '        BP.IDBENEFICIO     = ' + qryBenef.FieldByName('IDBENEFICIO').AsString);
     qryAux.Open;
     if not qryAux.IsEmpty then
     begin
        sIdRegraResgate   := qryAux.FieldByName('IDREGRARESGATE').AsString;
        sIdRegraBeneficio := qryAux.FieldByName('IDREGRACALCULO').AsString;
     end;
  end;

  if bAltera = False then
     begin
       iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                      '                         IDPESSOA,      IDPESSJUR,    IDPLANOPREV, SEQPROPOSTA, ' +
                      '                         IDSITFUNCATUAL,  IDSITPARTATUAL,  IDSITPLANOATUAL, ' +
                      '                         IDSITFUNCNOVO,   IDSITPARTNOVO,   IDSITPLANONOVO, ' +
                      '                         IDEVENTOGERADOR, FLGSITFUNCIMED,  FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                      '                         DATAEFETIVADO,   FLGEFETIVADO,    IDBENEFICIO,    IDREGRARESGATE,  ' +
                      '                         IDREGRACALCBENEF, INSCRICAONUMERO, DATAREQUERIMENTO) ' + 
                      ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                   sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                   '''' + sIdSitFunc  + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                   '''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' +
                                          qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                                          qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                   sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed  + ',' +
                                   sDataEfetivado   + ',' + sFlgEfetivado + ',' +
                                   '''' + qryBenef.FieldByName('IDBENEFICIO').AsString + '''' + ',' +
                                   '''' + sIdRegraResgate                              + '''' + ',' +
                                   '''' + sIdRegraBeneficio                            + '''' +','+OraNumero(edInscNumero.Text)+ ', ' +
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
                         '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString   + ',' +
                         '                        IDSITPLANONOVO  = ' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ','+
                         '                        IDBENEFICIO     = ''' + qryBenef.FieldByName('IDBENEFICIO').AsString + ''','+
                         '                        IDREGRARESGATE  = ''' + sIdRegraResgate   +''',' +
                         '                        IDREGRACALCBENEF= ''' + sIdRegraBeneficio +''' ' +
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

procedure TfrmEventoDemissaoManutContrib.ExecutaRegraConcessao;
var
  sIdRegra,
  sDataFinal,
  sUltMesPreparo,
  sSQL: string;
begin
  // Procurar data final de manutenção, caso o particip venha de manutencao (PDV)
  sDataFinal := '';
  if sFlgInternoSitPart = 'MA' then
  begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' select distinct datafinal from contribprevpartp '+
                    ' where  idpessjur   = '+sIdPessJur   +
                    ' and    idplanoprev = '+sIdPlanoprev +
                    ' and    idpessoa    = '+sIdPessoa    +
                    ' and    seqproposta = '+sSeqProposta +
                    ' and    flgcobra    = 1 ');
      qryAux.Open;
      sDataFinal := qryAux.FieldByName('datafinal').AsString;
      qryAux.Close;
  end;

  sUltMesPreparo := CalcUltMesContribuicao(StrToInt(sIdPessJur),
                                           StrToInt(sIdPlanoPrev),
                                           StrToInt(sIdPessoa),
                                           StrToInt(sSeqProposta), -1,
                                           Copy(Trim(dtEvento.Text),7,4)+'/'+Copy(Trim(dtEvento.Text),4,2),
                                           qryAux);


  // Executar Regra de Concessão de Manutenção - Passa para a Regra os dados do Participante
  sSQL := ' SELECT PLP.IDREGRAMANUTENCAO, PP.IDPESSOA, PP.IDPESSJUR,      PP.IDPLANOPREV, ' +
          '        PP.SEQPROPOSTA,  EL.IDSITFUNC,      EL.IDCARGOEXT,     EL.MATRICULA, '   +
          '        EL.DATAADMISSAO, EL.SALTOTAL,       EL.PARTICIPPREVID, EL.PARTICIPASSIST, ' +
          '        EL.NIVEL,        EL.TEMPOSERVANTERIOR,                 PF.DATANASC,   PF.SEXO, PF.DATAMORTE, ' +
          '        PF.ESTCIVIL,     P.NUMDOCUMENTO,    PP.IDSITPART,      PP.IDSITPLANOPREV, ' +
          '        PP.FLGDEVEPREVIDENC, PP.INSCRICAODATA, PP.DTINICIOINSC,      '+
          ''''+sDataFinal+''' AS DATAFINAL, '+
          ''''+Trim(dtDataDemissao.Text)     +''' AS DATADEMISSAO, '+
          ''''+Trim(dtEvento.Text)+''' AS DATAREF,    '+
          ''''+Trim(dtEvento.Text)+''' AS DATAEVENTO, '+
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

  if sFlgInterno = 'PD'
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT IDREGRAELEGIEV FROM EVENTOSPLANO '+
                    ' WHERE  IDEVENTOGERADOR = '+sIdEventoGerador+
                    ' AND    IDPLANOPREV     = '+sIdPlanoPrev);
     qryAux.Open;
     if not qryAux.IsEmpty
     then sIdRegra := qryAux.FieldByName('IDREGRAELEGIEV').AsString;
     qryAux.Close;
  end
  else begin
     sIdRegra := qryRegra.FieldByName('IDREGRAMANUTENCAO').AsString;
  end;

  if Trim(sIdRegra) = ''
  then begin
     sResultadoRegra := 'True';
     Exit;
  end;

  regCalculo.QueryIn  := qryRegra;
  regCalculo.RuleName := sIdRegra;

  try
     regCalculo.Execute;
  except
     MsgDlg('Erro na Execução da Regra de Concessão de Manutenção.','Informação',mtInformation,[mbOk,mbHelp],0);
     sResultadoRegra := 'False';
     TiraSql(qryAux);
     Exit;
  end;

  sResultadoRegra := regCalculo.Result;

  if sResultadoRegra = 'False'
  then begin
     MsgDlg('Manutenção não permitida . Motivo : Participante não aprovado pela Regra de Elegibilidade. ','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end;
end;

procedure TfrmEventoDemissaoManutContrib.ExecutaRegraCalculo;
var
  sSQL, sValorReserva, sMesReferencia, sRemTotal, sSalPart, sOpcao,
  sMesRefSal, sDataInscFund: string;
  rSalarioRefe,
  rValorBaseCalc,
  rValorSalManut,
  rValorRubPerdida,
  rValorRubMantidaFixo,
  rValorRubMantida : Double;
  bPercentual : Boolean;

  dSomaItemNaDIB,
  dSomaItemNoPBC  : double;
  sVlrMediaADN, sVlrADN, sVlrSalFacADN : String;

  RegSalPart : TRegSalMes;

begin
  // Executa Regra de Cálculo do Salário de Manutenção
  // Passa para a regra os mesmos dados da Regra de Cálculo do Beneficio
  // Calcula o valor total da soma das reservas do participante
  frmAguarde.Mostra(' Calculando Salário de Manutenção ... ');
  sSQL := '';

  
  sOpcao := ' ';
  If EdtOpcao.Text <> '' Then Begin
    sOpcao := EdtOpcao.Text;
    MediaAdicional(QryAux,sOpcao,EdMatricula.Text,
                   sVlrMediaADN, sVlrADN, sVlrSalFacADN);
  End;
  

  if bFlgUsaRubrica then
     begin
         //Everson TIBERO - Início
        {sSQL := ' SELECT IDPESSOA, IDRUBRICA, VALORRUBRICA, FLGTPRUBMANUT, FLGPERCENT, PLP.IDRGSALMANUT '+
                ' FROM   RUBRICAINDIV , PLANPREVPATRO PLP '+
                ' WHERE  IDPESSOA =    '+sIdPessoa+' AND '+
                '        PLP.IDPESSJUR   = ' + sIdPessJur   +' AND ' +
                '        PLP.IDPLANOPREV = ' + sIdPlanoPrev +' ' +
                ' ORDER  BY FLGTPRUBMANUT ';}

        sSQL := ' SELECT RUBRICAINDIV.IDPESSOA, RUBRICAINDIV.IDRUBRICA, RUBRICAINDIV.VALORRUBRICA, '+
                '        RUBRICAINDIV.FLGTPRUBMANUT, RUBRICAINDIV.FLGPERCENT, PLP.IDRGSALMANUT     '+
                ' FROM   RUBRICAINDIV, PLANPREVPATRO PLP                                           '+
                ' WHERE  RUBRICAINDIV.IDPESSOA = '+sIdPessoa+' AND                                 '+
                '        PLP.IDPESSJUR   = ' + sIdPessJur   +' AND                                 '+
                '        PLP.IDPLANOPREV = ' + sIdPlanoPrev +'                                     '+
                ' ORDER  BY RUBRICAINDIV.FLGTPRUBMANUT                                             ';
        //Everson TIBERO - Fim

     end
  else
     begin
          sValorReserva := OraNumero(CalcReservaPart(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                                                     StrToInt(sIdPessoa), -1, StrToInt(sSeqProposta),
                                                     dtEvento.Text,dtEvento.Text,'','', '', qryAux));

          sMesReferencia := Copy(Trim(dtEvento.Text),7,4)+'/'+Copy(Trim(dtEvento.Text),4,2);

          RegSalPart := CalcUltSalPart(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                       SAnoMesAnterior(sMesReferencia), sFlgInternoSitPart,
                                       qryAux);

          sSalPart   := ORANUMERO(RegSalPart.Valor);
          sMesRefSal := RegSalPart.MesRef;
          

          sRemTotal := ORANUMERO(CalcREMTOTAL(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                              SAnoMesAnterior(sMesReferencia), qryAux));

          sDataInscFund := CalcDataInscFund(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                                            StrToInt(sIdPessoa), StrToInt(sSeqProposta),qryAux);

          if Trim(sValorReserva) = '' then sValorReserva := '0';
          if Trim(sSalPart) = ''      then sSalPart := '0';
          if Trim(sRemTotal) = ''     then sRemTotal := '0';

          if Trim(sDataInscFund) = '' then sDataInscFund := FormatDateTime('dd/mm/yyyy', Date); 

          dSomaItemNaDIB := CalculaTotalResumoFuncional ( StrToInt(sIdPessJur), StrToInt(sIdPessoa), dSomaItemNoPBC );

          sSQL := ' SELECT '''+sDataInscFund           +''' AS INSCRICAODATAFUND, '+
                           ''''+Trim(dtEvento.Text)    +''' AS DATAREF,           '+
                           ''''+Trim(dtEvento.Text)    +''' AS DATAINICIOMANUT,   '+
                           ''''+Trim(edNivel.Text)     +''' AS NIVEL,             '+
                           ''''+Trim(edNivelConf.Text) +''' AS NIVELCONF,         '+
                           sIdEventoGerador            +'   AS IDEVENTOGERADOR,   '+

                  QuotedStr(sOpcao)+'               AS OPCAOADN,   '+
                  OraNumero(sVlrMediaADN)+'         AS MEDIAADN, '+
                  OraNumero(sVlrADN)+'              AS VLRADN, '+
                  OraNumero(sVlrSalFacADN)+'        AS SALFACULTADN, '+

                           sSALPART                    +'   AS VALORPROVENTO,     '+
                           QuotedStr(sMesRefSal)       +'   AS MESREFERENCIA,     '+
                           sREMTOTAL                   +'   AS VALORREMTOTAL,     '+
                           sValorReserva               +'   AS VALORRESERVA,      '+
                          OraNumero(qryCargoExt.FieldByName('IdCargoExt').AsString) +' AS IDCARGOEXT,    '+
                          OraNumero(qryCargoExCo.FieldByName('IdCargoExt').AsString)+' AS IDCARGOCONF,   '+
                          OraNumero(FloatToStr(dSomaItemNoPBC))                     +' AS SOMAITEMNOPBC, '+ 
                          OraNumero(FloatToStr(dSomaItemNaDIB))                     +' AS SOMAITEMNADIB, '+ 
                  '        PF.DATANASC, PLP.IDRGSALMANUT,                                '+
                  '        EL.SALTOTAL, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,      '+
                  '        EL.TEMPOSERVANTREAL, EL.TEMPOSITESPECIAL, EL.IDSITFUNC,       '+
                  '        EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, EL.DATAADMISSAO, '+
                  '        EL.DATADEMISSAO,                                              '+
                  '        PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
                  '        PP.IDPESSOA AS IDTITULAR, ' + // Thiago Melo SOL 210568 Kintana 2049597
                  '        PP.IDSITPART, PP.IDSITPLANOPREV, EL.FLGDIRETOR                '+

                  ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF, PLANPREVPATRO PLP '+
                  ' WHERE  PP.IDPESSOA    = ' + sIdPessoa    + ' AND ' +
                  '        PP.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                  '        PP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                  '        PP.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                  '        EL.IDPESSOA    = PP.IDPESSOA      AND ' +
                  '        EL.IDPESSJUR   = PP.IDPESSJUR     AND ' +
                  '        PF.IDPESSOA    = EL.IDPESSOA      AND ' +
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
       if (bFlgUsaRubrica) then  // Calcular Salario pelo Programa
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

           reSalarioManut.Text :=  ClienteNumero(FormatFloat('#0.00',rValorSalManut));
        end;
        Exit;
  end;  // fim idregracalculo = ''


  if not bFlgUsaRubrica then 
  begin
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
        end;
     end;
  end;

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

  frmAguarde.Apaga;
  reSalarioManut.Text := FormatFloat('#0.00', StrToFloat(ClienteNumero(regCalculo.Result)));

  if dblkpcmbSitFunc.enabled then    //edilaine SIG102708
     dblkpcmbSitFunc.SetFocus;
end;

procedure TfrmEventoDemissaoManutContrib.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then begin
     if dtmBasedados.dbBaseDados.InTransaction
     then dtmBasedados.dbBaseDados.RollBack;
     LimpaCampos;
  end;
end;

procedure TfrmEventoDemissaoManutContrib.LimpaCampos;
begin
  edNome.Text         := '';
  edMatricula.Text    := '';
  edPatro.Text        := '';
  edPlano.Text        := '';
  edSitPatro.Text     := '';
  edSitFundacao.Text  := '';
  edSitPlano.Text     := '';
  edInscNumero.Text   := '';
  dtEvento.Text       := '';
  reSalarioManut.Text := '';
  edNivel.Text        := '';
  edNivelConf.Text    := '';
  dtRequerimento.Text    := '';  
  dblkpcmbCargoConf.Text := '';
  dblkpcmbCargo.Text     := '';
  dblkpcmbSitFunc.Text      := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  dblkpcmbBeneficio.Text    := '';
  dtDataDemissao.Text       := '';
  dtDataContribuicao.text := '';
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled  := false;
  bbtnOpcoes.enabled := false;
  bbtnAltEndereco.Enabled := False; 

end;

procedure TfrmEventoDemissaoManutContrib.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  with dtmBasedados.dbBaseDados do
  if InTransaction
  then RollBack;
end;

procedure TfrmEventoDemissaoManutContrib.bbtnOpcoesClick(Sender: TObject);
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

procedure TfrmEventoDemissaoManutContrib.reSalarioManutBtnClick(
  Sender: TObject);
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

  if ( (iNumOpcoesPatro >= 1) and (bObrigaOpPatro1) and (rOpcao1 <= 0) ) or
     ( (iNumOpcoesPatro >= 2) and (bObrigaOpPatro2) and (rOpcao2 <= 0) ) or
     ( (iNumOpcoesPatro >= 3) and (bObrigaOpPatro3) and (rOpcao3 <= 0) )
  then begin
     MsgDlg('Existem opções obrigatórias não preenchidas. Informe estas opções. ','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSQL(qryAux);
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


  ExecutaRegraCalculo;
end;

procedure TfrmEventoDemissaoManutContrib.dtDataDemissaoExit(
  Sender: TObject);
begin
  inherited;
  if dtDataDemissao.Text = '' then Exit;
  if StrToDate(FormatDateTime('DD/MM/YYYY', dtEvento.Date)) < StrToDate(FormatDateTime('DD/MM/YYYY', dtDataDemissao.Date))
  then begin
     MsgDlg('A data da manutenção deve ser maior ou igual a data de demissão.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtDataDemissao.SetFocus;
     TiraSql(qryAux);
  end;

end;


procedure TfrmEventoDemissaoManutContrib.dtEventoExit(Sender: TObject);
begin
  inherited;
  dtDataContribuicao.Text := dtEvento.Text;

  
  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtEvento.Date;
  
  
end;


procedure TfrmEventoDemissaoManutContrib.grdItensSalFieldChanged(
  Sender: TObject; Field: TField);
var sDataFinal : String;
begin
  inherited;

  //altera os itens da evoluçlão funcional na própria tela
  //para cálculo da regra de manutenção
  //caso o item seja marcado, então a data final deve ser nula para que o item seja contado
  //caso não, este recebe a data final anterior(caso tenha sido marcado anteriormente)
  //ou a data atual



end;

procedure TfrmEventoDemissaoManutContrib.sbtnEvolFuncionalClick(
  Sender: TObject);
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

      //ShowModal;  Jéssica Lana SOL 130362
        TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).FormStyle := fsMDIChild;
        TfrmCadEvolFuncPrev(frmCadEvolFuncPrev).WindowState := wsMaximized;
        frmCadEvolFuncPrev.Show;
      //SOL 130362


     end;
  except
     raise;
  end;

  if bReabreTransacao
  then begin
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;
end;

procedure TfrmEventoDemissaoManutContrib.bbtnAltEnderecoClick(
  Sender: TObject);
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

procedure TfrmEventoDemissaoManutContrib.FormActivate(Sender: TObject);


begin
  inherited;
  //Jéssica Lana SOL 130362
   inc(i);
   if i = 1 then
   begin
      iHeightForm:= self.Height;
      iWidthForm:= self.Width;
      iTopForm:= self.Top;
       iLeftForm:=self.Left;
   end else
    begin
      self.Height := iHeightForm;
      self.Width := iWidthForm;
      self.Top :=iTopForm;
      self.Left := iLeftForm;
   end;
end;
  //Fim SOL 130362
procedure TfrmEventoDemissaoManutContrib.AnaliseElegibilidadeValidouRegra(
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

function TfrmEventoDemissaoManutContrib.ValidarAnaliseElegibilidade: Boolean;
var
  analiseElegibilidade : TAnaliseElegibilidade;
begin
  Result := True;
  if (TAnaliseElegibilidade.LocalizarRegraElegibilidade(sIdEventoGerador, sFlgInterno) = reElegibilidadeAutopatrocinio) then
  begin
    analiseElegibilidade := TAnaliseElegibilidade.Create('BaseDados',
                                                         reElegibilidadeAutopatrocinio,
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
      if (not(Result)) then
      begin
        MsgDlg(analiseElegibilidade.MensagemRegrasNaoElegiveis, 'Analise de Elegibilidade', mtInformation, [mbOk], 0);
      end;
    finally
      FreeAndNil(analiseElegibilidade);
    end;
  end;
end;

//Darivaldo Alencar SIG 27871 -inicio
function TfrmEventoDemissaoManutContrib.PossuiParrametroPPE(
  IdPessoa: String): boolean;
Var query: TwwQuery;
begin
  query:= TwwQuery.create(nil);
  query.DatabaseName:= 'BaseDados';
  try

    FazQuery(query,' SELECT COUNT(1)as QTDE FROM PESSOAPARAM PP INNER JOIN PARAMFLAGPESSOA PF ON PF.IDPARAM = PP.IDPARAM '+
                   ' WHERE PP.IDPESSOA = '+IdPessoa+' AND UPPER(PF.DESCRICAO) = '+QuotedStr('PPE - VIA DECLARAÇÃO'));
    result := query.fieldbyname('QTDE').asInteger > 0;
  finally
     FreeAndNil(query);
  end;
end;

function TfrmEventoDemissaoManutContrib.CamposPPEVazio(
  IdPessoa: String): String;
Var
  query: TwwQuery;
  i,x : integer;
  validaRG,validaCPF: boolean;
  sCamposVazios: array [0..17] of String;
  sResultadoVazio: String;
begin
  query:= TwwQuery.create(nil);
  query.DatabaseName:= 'BaseDados';
  validaRG:= false;
  validaCPF:= false;
  sResultadoVazio:= EmptyStr;
  try
    FazQuery(query,'SELECT P.NOME AS NOME,' + #13#10 +
                    '       PF.NOMECONJUGE AS NOME_DO_CONJUGE,' + #13#10 +
                    '       PF.NOMEMAE AS NOME_DA_MAE,' + #13#10 +
                    '       PF.SEXO,' + #13#10 +
                    '       PF.DATANASC AS DATA_DE_NASCIMENTO,' + #13#10 +
                    '       C.NOME AS NATURALIDADE,' + #13#10 +
                    '       PI.NOMENACIONALIDADE AS NACIONALIDADE,' + #13#10 +
                    '       PF.ESTCIVIL AS ESTADO_CIVIL,' + #13#10 +
                    '       D.IDDOCUMENTO, ' + #13#10 +
                    '       D.ORGAO,' + #13#10 +
                    '       D.DATAEMISSAO,' + #13#10 +
                    '       P.NUMDOCUMENTO,' + #13#10 +
                    '       E.IDENDERECO AS ENDERECO,' + #13#10 +
                    '       T.IDTELEFONE AS TELEFONE,' + #13#10 +
                    '       PA.CARGOEMPFUNC AS CARGO,' + #13#10 +
                    '       PA.ENTIDADE AS ENTIDADE,' + #13#10 +
                    '       PA.RENDA AS RENDA' + #13#10 +
                    '  FROM CM.PESSOA P' + #13#10 +
                    ' INNER JOIN CM.PESSOAFISICA PF' + #13#10 +
                    '    ON PF.IDPESSOA = P.IDPESSOA' + #13#10 +
                    '  LEFT JOIN CM.PESSOAPPE PA' + #13#10 +
                    '    ON PA.IDPESSOA = P.IDPESSOA' + #13#10 +
                    '  LEFT JOIN CM.ENDPESS E' + #13#10 +
                    '    ON E.IDPESSOA = P.IDPESSOA' + #13#10 +
                    '  LEFT JOIN CM.DOCPESSOA D' + #13#10 +
                    '    ON D.IDPESSOA = P.IDPESSOA' + #13#10 +
                    '  LEFT JOIN CM.TELENDPESS T' + #13#10 +
                    '    ON T.IDPESSOA = P.IDPESSOA' + #13#10 +
                    '  LEFT JOIN CM.CIDADES C' + #13#10 +
                    '  ON PF.IDCIDADES = C.IDCIDADES' + #13#10 +
                    '  LEFT JOIN CM.PAIS PI' + #13#10 +
                    '  ON PI.IDPAIS = PF.IDPAIS'+ #13#10 +
                    'WHERE P.IDPESSOA = '+ IdPessoa  + #13#10 +
                    '  AND D.IDDOCUMENTO IN(2,11)' + #13#10 +
                    '  ORDER BY P.NOME');
    repeat
       for i := 0 to 16 do
          begin
             if (query.fields[i].asString = EmptyStr) then
               begin
                   if (query.fields[i].DisplayName = 'NUMDOCUMENTO') then
                   begin
                       case query.fieldByname('IDDOCUMENTO').asInteger of
                            2: sCamposVazios[i]:= '<CPF>';
                           11: sCamposVazios[i]:= '<RG>';
                       end;
                   end
                   else if ((query.fields[i].DisplayName = 'ORGAO') or (query.fields[i].DisplayName = 'DATAEMISSAO'))  then
                      begin
                         if (query.fieldByname('IDDOCUMENTO').asInteger = 11) then
                           begin
                             if (query.fields[i].DisplayName = 'ORGAO') then
                                  sCamposVazios[i]:= '<ÓRGÃO EXPEDIDOR>'
                             else sCamposVazios[i]:= '<DATA DE EXPEDIÇÃO>';
                           end
                      end
                   else if (query.fields[i].DisplayName = 'CARGO') then
                      begin
                         sCamposVazios[i]:= '<OCUPAÇÃO PROFISSIONAL-CARGO, EMPRESA OU FUNÇÃO PÚBLICA>';
                      end
                   else begin
                       sCamposVazios[i]:=  '<'+StringReplace(query.fields[i].DisplayName, '_', ' ', [rfReplaceAll, rfIgnoreCase])+'>';
                   end;
               end
             else if (query.fields[i].DisplayName = 'RENDA') then
                begin
                    if (query.fieldByname('RENDA').asCurrency <= 0) then
                        sCamposVazios[i]:= '<RENDA>';
                end;

             //validar campos sem cadastro na tabela
             if (i = 8) then
               begin
                 if (query.fields[i].asInteger = 11) then
                    validaRG := true

                 else  if (query.fields[i].asInteger = 2) then
                    ValidaCPF:= true;
               end;
          end;
       query.next;
    until(query.eof);

    if not ValidaRG then
       sCamposVazios[11]:= '<RG>';

    if not ValidaCPF then
       sCamposVazios[17]:= '<CPF>';

    i:=0;
    for x:= 0 to 17 do
     begin
        if (sCamposVazios[x]<> emptyStr) then
         begin
           if (x = 11) and not(validaRG) then
             begin
                if (i = 1) then
                   begin
                      sCamposVazios[11]:=  '<RG>'+#13+'<ÓRGÃO EXPEDIDOR><DATA DE EXPEDIÇÃO>';
                      sResultadoVazio  := sResultadoVazio + Trim(sCamposVazios[x]);
                   end
                else if (i = 0) then begin
                      sCamposVazios[11]:=  '<RG><ÓRGÃO EXPEDIDOR><DATA DE EXPEDIÇÃO>'+#13;
                      sResultadoVazio  := sResultadoVazio + Trim(sCamposVazios[x]);
                end;
             end
           else if (x = 14) then
             begin
                if (i = 0) then
                      sResultadoVazio  := sResultadoVazio + Trim(sCamposVazios[x])+#13
                else  sResultadoVazio  := sResultadoVazio + #13+ Trim(sCamposVazios[x]);
             end
           else
             sResultadoVazio:= sResultadoVazio + Trim(sCamposVazios[x]);
           inc(i);
         end;

        if (i = 2) then begin
           sResultadoVazio:= sResultadoVazio +#13;
           i := 0;
          end;
     end;

    result:= sResultadoVazio;
  finally
     FreeAndNil(query);
  end;
end;
//Darivaldo Alencar SIG 27871 -fim


end.


