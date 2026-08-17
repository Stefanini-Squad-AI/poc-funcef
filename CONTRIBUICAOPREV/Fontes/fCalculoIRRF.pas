// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Rotina     : (.dfm qryTpResgate incluir IDBENEFICIO)
//Nº WO......: 36050
//Inicio dev : 09/04/20026
//Responsável: Edilaine
//Descrição..: Incluir idbeneficio na consulta dos Resgates
//------------------------------------------------------------------------------
//Rotina     : tbButtonEnviarClick
//Nº WO......: 32251
//Inicio dev : 23/03/20026
//Responsável: LEANDRO
//Descrição..: Incluir idbeneficio ao gravar HSTPRAZOACUMULACAOFOLHA
//------------------------------------------------------------------------------
//Rotina     : atualizaValoresBaseCalculoeIR
//Nº WO......: 26837
//Inicio dev : 24/02/2026
//Responsável: Leandcro
//Descrição..: Ajuste busca valores base de calculo e IR
//------------------------------------------------------------------------------
//Rotina     : tbButtonEnviarClick
//Nº WO......: 20723
//Inicio dev : 25/04/2025
//Responsável: Edilaine
//Descrição..: Resgate de Beneficiários não apresenta Tipo de Resgate para cálculo do IR
//------------------------------------------------------------------------------
// N. Chamado....: WO9831
// Dt Alteração..: 16/04/2024
// Responsável...: Paulo Nobre
// Descrição.....: Ajustes na rotina de "Desfazer" para incluir, também, a
//                 exclusão dos registros nas tabelas:
//                  .HSTPRAZOACUMULACAOFOLHA
//                  .HSTCALCULOPMPFOLHA
//                 Os lançamentos nestas tabelas são usados pela Prévia da Folha
//                 para apurar o IR Regressivo sobre as Reservas do Participante.
//--------------------------------------------------------------------------------
//Rotina     : (dfm gbTipoCalculo), tbButtonAlterarClick, VerificaOpcaoIRPortabilidadePrev
//Nº WO......: 9102
//Inicio dev : 27/03/2024
//Responsável: Edilaine
//Descrição..: Segregar calculo do IR entre reservas Normais / Portadas
//------------------------------------------------------------------------------
//Rotina     : (dfm qryTpResgate)
//Nº WO......: 8603
//Inicio dev : 01/03/2024
//Responsável: Edilaine
//Descrição..: Ajuste para listar os valores resgatados judicialmente
//------------------------------------------------------------------------------
//Nº WO......: 7491
//Inicio dev : 01/02/2024
//Responsável: Leandro Pocebon
//Descrição..: Ajuste para tratar null no tipo de opção IR
//------------------------------------------------------------------------------
//Nº WO......: 7091
// Rotina....: MontaSelectPart.Filtro
//Inicio dev : 22/01/2024
//Responsável: Leandro Pocebon
//Descrição..: Ajuste na busca pelos participantes também considere os que tiverem o regime
//             tributário cadastrado como Progressivopara que seja possível simular o
//             cálculo do Imposto de Renda pelo Regime Regressivo
//------------------------------------------------------------------------------
//Nº SIG.....: 133134
//Inicio dev : 02/03/2023
//Responsável: Leandro Pocebon
//Descrição..: Ajuste para listar os valores retidos no resgate pra calculo do irrf
//------------------------------------------------------------------------------
//Nº SIG.....: 20491
//Data merge : 24/06/2022
//Inicio dev : 27/02/2018
//Responsável: Darivaldo Alencar
//Descrição..: Desenvolver na funcionalidade de Cálculo do IR Regressivo as regras
//             de retenção de percentual das contribuições
//             centralizar código dentro da unit uCtrlCalculoIRRF.pas
//--------------------------------------------------------------------------------
//Rotina      : tbButtonEnviarClick, gravarHistoricoCalculoPMP, gravarHistoricoPrazoAcumulacao
//              ListaPrazoAcumulacao
//Pendência   : SIG 100862
//Responsável : Edilaine Ferraresi
//Data        : 16/07/2020
//Descrição   : opção de sobrepor ou salvar novos cálculos PMP e Prazo
//------------------------------------------------------------------------------
//Rotina      : bbtnExcluiCorrenteClick, bbtnExcluiTudoClick,
//              bbtnIncluiListaClick, bbtnIncluiBenefClick, ListaParticipante
//Pendência   : SIG99565
//Responsável : Taffarel Sevaybriker
//Data        : 28/04/2020
//Descrição   : Efetuar commit ao incluir/excluir registro na lista individual
//------------------------------------------------------------------------------
//Rotina      : bbtnProcurarClick, ListaParticipante
//Pendência   : SIG 95333
//Responsável : Edilaine Ferraresi
//Data        : 30/03/2020
//Descrição   : erro ao processar cálculo para lista de pessoas
//------------------------------------------------------------------------------
//Rotina      : gravarHistoricoPrazoAcumulacao  (migrou para uCtrlCalculoIRRF)
//Pendência   : SIG 85804
//Responsável : Edilaine Ferraresi
//Data        : 09/05/2019
//Descrição   : Apresenta inconsistência na Base de Cálculo IR, comparado com os
//              valores que estão em analítico na aba Prazo Acumulação
//------------------------------------------------------------------------------
//Rotina      : (.dfm tbButtonExportar)
//Pendência   : SIG 25745
//Responsável : Edilaine Ferraresi
//Data        : 05/06/2017
//Descrição   : exportar os cálculos realizados para PDF/Excel: Prazo de Acumulação
//              Prazo Medio Ponderado e Lista individual
//------------------------------------------------------------------------------
//Pendência   : SOL 254124 PPM 793415
//Responsável : Felipe A. Santos
//Data        : 20/05/2015
//Descrição   : Erro ao processar, causado pela duplicidade de IDPESSOA.
// *****************************************************************************
//Pendência   : SOL 151061 - KINTANA 1105188
//Responsável : MARCIO MORAIS
//Data        : 16/11/2012
//Descrição   : Calculo do IR Regressivo
// *****************************************************************************
// Rotina......: -
// Nº SOL......: 187099
// Nº KINTANA..: 1763201
// Data........: 09/08/2012
// Responsável.: Bruno Azevedo
// Descrição...: Correção do SOL 180350.
// *****************************************************************************
// Rotina......: -
// Nº SOL......: 180350
// Nº KINTANA..: 1710563
// Data........: 27/07/2012
// Responsável.: THiago Melo
// Descrição...: Permissão botão gravar
// *****************************************************************************
// Rotina......: -
// Nº SOL......: 181765
// Nº KINTANA..: 1698477
// Data........: 20/06/2012
// Responsável.: Otacilio Aquino
// Descrição...: erro "Erro ao calcular IRRF"
// *****************************************************************************
// Rotina......: -
// Nº SOL......: 182365
// Nº KINTANA..: 1698477
// Data........: 15/06/2012
// Responsável.: Otacilio Aquino
// Descrição...: erro "Erro ao calcular IRRF"
// DFM.........: Adicionado no MontaSelectPart campos IDTITULAR e IDPESSOA
// *****************************************************************************
// Rotina......: -
// Nº SOL......: 180351
// Nº KINTANA..: 1679062
// Data........: 29/05/2012
// Responsável.: Fernando Xavier
// Descrição...: erro "Erro ao calcular IRRF"
// *****************************************************************************
// Rotina......: -
// Nº SOL......: 173803
// Nº KINTANA..: 1602955
// Data........: 24/04/2012
// Responsável.: Márcio Denilson
// Descrição...: Implementação da ação do botão Gravar
// *****************************************************************************
// Rotina......: -
// Nº SOL......: 167930
// Nº KINTANA..: 1501823
// Data........: 27/01/2012
// Responsável.: Otacilio Aquino
// Descrição...: Implementação para calcular IR Regressivo dos pensionista
//------------------------------------------------------------------------------

unit fCalculoIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, ComCtrls, TB97Ctls, DBCtrls, Mask,
  Grids, Wwdbigrd, Wwdbgrid, fFrameLista, MontaSelect, Db, DBTables,dBaseDados,
  Wwdatsrc, Wwquery, DBGrids, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlCalculoIRRF, //Darivaldo Alencar SIG20491
  ComObj, wwdblook, DBClient, uCMClientDataSet, wwdbedit, Wwdotdot,
  Wwdbcomb;    //edilaine - SIG25745


Const
  MSG09 = 'Tipo de Resgate não parametrizado';

type
  TFrmCalculoIRRF = class(TfrmSairAjuda)
    lblValores: TfcLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblParticipante: TLabel;
    lblPatrocinadora: TLabel;
    lblPlanoPrevidenciario: TLabel;
    lblnumeroInscricao: TLabel;
    lblMatricula: TLabel;
    lblSituacao: TLabel;
    cboPlano: TDBLookupComboBox;
    Label14: TLabel;
    Splitter1: TSplitter;
    pnlOperacoes: TPanel;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    tbButtonCancelar: TToolbarButton97;
    ToolbarSep978: TToolbarSep97;
    ToolbarSep9711: TToolbarSep97;
    tbButtonEnviar: TToolbarButton97;
    tbButtonAlterar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    bbtnFiltro: TBitBtn;
    PgProcessos: TPageControl;
    tbPrazoMedioPonderado: TTabSheet;
    TbPrazoAcumulacao: TTabSheet;
    grdPrzMedio: TwwDBGrid;
    chkListaIndividual: TCheckBox;
    grdPrzAcumulo: TwwDBGrid;
    tbListaIndividual: TTabSheet;
    frmFrameListaBenef1: TfrmFrameListaBenef;
    Bevel1: TBevel;
    MontaSelectPart: TMontaSelect;
    QryParticipantes: TwwQuery;
    dsParticipantes: TwwDataSource;
    QryPrazoAcumulacao: TwwQuery;
    dsPrazoAcumulacao: TwwDataSource;
    QryPMP: TwwQuery;
    dsPMP: TwwDataSource;
    QryPlanos: TQuery;
    dsPlanos: TDataSource;
    btnLimparFiltro: TBitBtn;
    QryAux: TQuery;
    Label15: TLabel;
    wwDBGrid2: TwwDBGrid;
    Upd: TUpdateSQL;
    UpdPmp: TUpdateSQL;
    Label7: TLabel;
    Label8: TLabel;
    lblBaseCalculo: TLabel;
    lblValorIr: TLabel;
    PMP: TLabel;
    lblValorPMP: TLabel;
    Label9: TLabel;
    btnProcurar: TBitBtn;
    qryUpdHST: TQuery;
    qryConsHSTAux: TwwQuery;
    qryConsHST: TwwQuery;
    edtDataPagamento: TCMDateTimePicker;
    tbButtonExportar: TToolbarButton97;
    SaveDlg: TSaveDialog;
    qryTpResgate: TQuery;
    Label10: TLabel;
    dblkTpResgate: TwwDBLookupCombo;
    gbTpReserva: TGroupBox;
    rbTpResNormal: TRadioButton;
    rbTpResPort: TRadioButton;
    rbTpResAmbas: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure chkListaIndividualClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure tbButtonAlterarClick(Sender: TObject);

    //Darivaldo Alencar SIG20491 -inicio
    {//funções foram transferidas para uCtrlCalculoIRRF
	  // OTACILIO SOL182365 KINTANA 1698477
    procedure ProcessaPrazoAcumulacao(IdPessJur:Integer;IdPessoa:Integer;iREB:Integer;
                                      iNovoPlano:Integer;sDataPrevista:String
                                      ;iTipoOpcaoIR : Integer; iListaBenef : integer; iMatricula: string;
                                      IdTitular : Integer // Felipe A. Santos SOL 254124 PPM 793415
                                      );

	// OTACILIO SOL182365 KINTANA 1698477
    procedure ProcessaCalcMedioPonderado(IdPessJur:Integer;IdPessoa:Integer;iPlano:Integer;iListaBenef : integer; iTipoOpcaoIr : Integer; iMatricula: string);
    }//Darivaldo Alencar SIG20491

    procedure ListaPrazoAcumulacao(IdPessJur:Integer;IdPessoa:Integer;iPlano:Integer;iListaBenef : integer);
    procedure ListaCalculoMedioPonderado(pIdPessoa:Integer;iPlano:Integer;iListaBenef : integer);

    procedure ListaParticipante(pIdPessoa:Integer; piPlano:Integer; pidPessJur :Integer; bGravar: boolean = false); //TAES - SIG99565

    procedure tbButtonCancelarClick(Sender: TObject);
    procedure tbButtonEnviarClick(Sender: TObject);
    procedure bbtnFiltroClick(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryParticipantesAfterScroll(DataSet: TDataSet);
    procedure frmFrameListaBenef1bbtnIncluiBenefClick(Sender: TObject);
    procedure frmFrameListaBenef1bbtnExcluiCorrenteClick(Sender: TObject);
    procedure frmFrameListaBenef1bbtnIncluiListaClick(Sender: TObject);
    procedure frmFrameListaBenef1bbtnExcluiTudoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure QryParticipantesBeforeOpen(DataSet: TDataSet);
    procedure MontaSelectPartBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure tbButtonExportarClick(Sender: TObject);
    procedure dblkTpResgateChange(Sender: TObject);

  private
  { Private declarations }
    Sheet    : Variant;                    //edilaine - SIG25745
    ctrlCalculoIRRF : TCtrlCalculoIRRF;    //edilaine - SIG20491

    // MARCIO DENILSON SOL 173803 KINTANA 1602955
    function retornaIdTitular(iidPessoa:Integer;Matricula:String):Integer;
    function retornaMatricula(iidPessoa,iidPessoaJur:Integer):String;

    //Darivaldo Alencar SIG20491 -inicio
    {//funções foram transferidas para uCtrlCalculoIRRF
    procedure gravarHistoricoPrazoAcumulacao(vIdPessoa, vIdTitular, vIdPessoaJur, vIdPlano: Integer);
    procedure gravarHistoricoCalculoPMP(vIdPessoa, vIdTitular, vIdPessoaJur, vIdPlano: Integer);

    // MARCIO DENILSON SOL 151061 KINTANA 1105188
    function verificaInformacoesSendoUtilizadasPrevia(vIdPessoa, vIdTitular, vIdPessoaJur, vIdPlano: Integer):boolean;
    // FIM SOL 151061 KINTANA 1105188

    }//Darivaldo Alencar SIG20491 -inicio

    procedure atualizaValoresBaseCalculoeIR();
    procedure atualizaValorPrazoMedioPonderado();
    // FIM SOL 173803 KINTANA 1602955

    // Thiago Melo 180350 KINTANA 1710563
    function  VerificaAutorizacao(sIdOperFunc : String):boolean;
    // Thiago Melo 180350 KINTANA 1710563


    procedure MontaArquivoExcel;     //edilaine - SIG25745

    function VerificaTipoResgate : Boolean;          //edilaine - SIG20491


    function VerificaOpcaoIRPortabilidadePrev(iidPessoa,iidPessoaJur,iidPlanoPrev:Integer):boolean; //leandro - WO7091

  public
    IdPessJur : integer;
    IdPessoa  : integer;
    iPlano    : integer;
    idTitular : integer;
    sMatricula : String;
    sSQLParticipante : String;

  { Public declarations }
  end;

var
  FrmCalculoIRRF: TFrmCalculoIRRF;

implementation
 uses UMensErro,FProgresso, USistema;
{$R *.DFM}

function iif(condicao : boolean; vTrue, vFalse : integer) : integer;
begin
  if condicao then result := vTrue
              else result := vFalse;
end;


procedure TFrmCalculoIRRF.FormShow(Sender: TObject);
begin
  //inherited;

  PgProcessos.ActivePage       := TbPrazoAcumulacao;
  tbListaIndividual.tabvisible := false;
  frmFrameListaBenef1.DefineLista(0);

  sSQLParticipante := QryParticipantes.SQL.Text;

end;

procedure TFrmCalculoIRRF.chkListaIndividualClick(Sender: TObject);
begin
  inherited;

  QryPlanos.Close;
  tbButtonExportar.Enabled := false;       //edilaine - SIG25745
  tbButtonEnviar.Enabled   := False;
  tbButtonCancelar.Enabled := False;
  bbtnFiltro.Enabled       := False;
  btnLimparFiltro.Enabled  := False;


  tbListaIndividual.tabvisible := chkListaIndividual.Checked;

  lblParticipante.caption        :='';
  lblPatrocinadora.caption       :='';
  lblPlanoPrevidenciario.caption :='';
  lblnumeroInscricao.caption     :='';
  lblMatricula.caption           :='';
  lblSituacao.caption            :='';
  lblBaseCalculo.caption         :='';
  lblValorIr.caption             :='';
  lblValorPMP.caption            :='';

  if chkListaIndividual.Checked then begin
    iPlano                         := 0;
    IdPessoa                       := 0;
    IdPessJur                      := 0;
    IdTitular                      := 0;        //edilaine #95333
    QryPlanos.Open;
    bbtnFiltro.Enabled             := True;
    btnLimparFiltro.Enabled        := True;

    ListaParticipante(IdPessoa,iPlano,idPessJur);
  end else begin

    QryParticipantes.Close;
    QryParticipantes.SQL.Text := sSQLParticipante;
    QryParticipantes.open;

    QryPrazoAcumulacao.Close;
    QryPrazoAcumulacao.Open;

    QryPMP.Close;
    QryPMP.Open;
  end;

  //edilaine WO9102 : inicio
  rbTpResAmbas.checked := true;
  gbTpReserva.enabled  := not chkListaIndividual.Checked;
  //edilaine WO9102 : fim

end;

procedure TFrmCalculoIRRF.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  tbButtonExportar.Enabled := false;       //edilaine - SIG25745
  tbButtonEnviar.Enabled   := False;
  tbButtonCancelar.Enabled := False;
  QryPMP.Close;
  bbtnFiltro.Enabled      := False;
  btnLimparFiltro.Enabled := False;

  QryParticipantes.Close;
  QryPrazoAcumulacao.Close;


  IdPessJur := 0;
  IdPessoa  := 0;
  iPlano    := 0;

  MontaSelectPart.Executar;

  if MontaSelectPart.RetornouValor then begin
    lblParticipante.caption        := MontaSelectPart.ValoresChave[2];
    lblPatrocinadora.caption       := MontaSelectPart.ValoresChave[4];
    lblPlanoPrevidenciario.caption := MontaSelectPart.ValoresChave[5];
    lblnumeroInscricao.caption     := MontaSelectPart.ValoresChave[11];
    lblMatricula.caption           := MontaSelectPart.ValoresChave[19];
    lblSituacao.caption            := MontaSelectPart.ValoresChave[8];

    IdPessoa                       := strToint(MontaSelectPart.ValoresChave[17]);
    IdPessJur                      := strToint(MontaSelectPart.ValoresChave[18]);
    iPlano                         := strToint(MontaSelectPart.ValoresChave[1]);
    IdTitular                      := strToint(MontaSelectPart.ValoresChave[20]);     //edilaine #95333    

    ListaParticipante(IdPessoa,iPlano,idPessJur);

   end;

end;

procedure TFrmCalculoIRRF.tbButtonAlterarClick(Sender: TObject);
var iREB         : Integer;
    iNovoPlano   : Integer;
    sMsgErro     : string;            //edilaine - SIG20491
    iSeqResgate  : integer;           //edilaine - SIG20491
    iTipoCalculo : integer;           //edilaine WO9102
begin
  inherited;

  if edtDataPagamento.Date <=0 then begin
    MsgDlg('Preencha a data do Pagamento','Confirmação',mtConfirmation,[mbOK],0);
    exit;
  end;

  // 0 FALSE
  // 1 TRUE

  //edilaine - SIG20491 - inicio
  if not VerificaTipoResgate then
     exit;
  //edilaine - SIG20491 - fim

 if not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;

  iReb        :=0;
  iNovoPLano  :=0;

  if (QryParticipantes.Active) then begin
    if QryParticipantes.FieldByname('IDPLANOPREV').asString ='000' then begin
      if MsgDlg('Nenhum participante seleciondo. Confirma o cálculo para todos os participantes?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        //edilaine - SIG20491 - inicio
        {// OTACILIO SOL182365 KINTANA 1698477
        // Felipe A. Santos SOL 254124 PPM 793415 - incluído o IDTITULAR na rotina ProcessaPrazoAcumulacao
		ProcessaPrazoAcumulacao(0,0,0,0,edtDataPagamento.Text,2,0, '', 0);
        // OTACILIO SOL182365 KINTANA 1698477
		ProcessaCalcMedioPonderado(0,0,0,0,2, ''); }

        if not ctrlCalculoIRRF.ProcessarTodos(edtDataPagamento.Text, sMsgErro) then
        begin
          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;

          MsgDlg(sMsgErro, 'Aviso', mtInformation, [mbOk], 0);
        end;
        //edilaine - SIG20491 - fim
        ListaParticipante(0,0,0);
      end;
      Exit;
    end;
  end;

  if (trim(cboPlano.Text) <> '') and (chkListaIndividual.Checked) then begin
    iPLano := cboPlano.KeyValue;
  end;

  if iPLano <> 0 then begin
    if iPLano = 66 then begin
      iReb        :=1;
      iNovoPLano  :=0;
    end else if iPLano = 74 then begin
      iReb        :=0;
      iNovoPLano  :=1;
    end;
  end;

  if chkListaIndividual.Checked then begin
    //edilaine - SIG20491 - inicio
    // OTACILIO SOL182365 KINTANA 1698477
    // Felipe A. Santos SOL 254124 PPM 793415 - incluído o IDTITULAR na rotina ProcessaPrazoAcumulacao
    if not ctrlCalculoIRRF.ProcessaPrazoAcumulacao(0,0,iREB,iNovoPlano,edtDataPagamento.Text,2,
                                                   frmFrameListaBenef1.ListaUsuario, '', 0, -1
                                                   ) then
    begin
      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

      MsgDlg('Erro ao calcular IRRF', 'Aviso', mtInformation, [mbOk], 0);
      Exit;
    end;
    ListaPrazoAcumulacao(0,0,iPlano,frmFrameListaBenef1.ListaUsuario);

	  // OTACILIO SOL182365 KINTANA 1698477
    if ctrlCalculoIRRF.ProcessaCalcMedioPonderado(0,0, iPlano, frmFrameListaBenef1.ListaUsuario,2, '', edtDataPagamento.Text, 0) then  //edilaine SIG20491
    begin
      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

      MsgDlg('Erro no Calculo Médio Ponderado', 'Aviso', mtInformation, [mbOk], 0);
      Exit;
    end;
    ListaCalculoMedioPonderado(0,0,frmFrameListaBenef1.ListaUsuario);
   //edilaine - SIG20491 - fim

  end else begin
    if QryParticipantes.Active then begin
      //edilaine - SIG20491 - inicio
      if dblkTpResgate.enabled then
         iSeqResgate := qryTpResgate.FieldByName('SEQRESGATE').AsInteger
      else
         iSeqResgate := -1;


      iTipoCalculo := iif(rbTpResNormal.checked, 0, iif(rbTpResPort.checked, 1, 2));  //edilaine WO9102

      // OTACILIO SOL182365 KINTANA 1698477
      // Felipe A. Santos SOL 254124 PPM 793415 - incluído o IDTITULAR na rotina ProcessaPrazoAcumulacao
      if not ctrlCalculoIRRF.ProcessaPrazoAcumulacao(QryParticipantes.FieldByname('IDPESSJUR').asInteger,
                                                     QryParticipantes.FieldByname('IDPESSOA').asInteger,
                                                     iREB, iNovoPlano, edtDataPagamento.Text,
                                                     2, 0, // leandro wo7091 -  QryParticipantes.FieldByname('TIPOOPCAOIR').asInteger, 0,
                                                     QryParticipantes.FieldByname('MATRICULA').AsString,
                                                     QryParticipantes.FieldByName('IDTITULAR').AsInteger,
                                                     iSeqResgate,
                                                     iTipoCalculo           //edilaine WO9102
                                                     ) then
      begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;

        MsgDlg('Erro ao calcular IRRF', 'Aviso', mtInformation, [mbOk], 0);
        Exit;
      end;
      ListaPrazoAcumulacao(QryParticipantes.FieldByname('IDPESSJUR').asInteger,QryParticipantes.FieldByname('IDPESSOA').asInteger,iPlano,0);

	    // OTACILIO SOL182365 KINTANA 1698477
      if not ctrlCalculoIRRF.ProcessaCalcMedioPonderado(QryParticipantes.FieldByname('IDPESSJUR').asInteger,
                                                        QryParticipantes.FieldByname('IDPESSOA').asInteger,
                                                        iPlano, 0, 2,
                                                        QryParticipantes.FieldByname('MATRICULA').AsString,
                                                        edtDataPagamento.Text,
                                                        QryParticipantes.FieldByName('IDTITULAR').AsInteger,       //edilaine SIG20491
                                                        iTipoCalculo           //edilaine WO9102
                                                      ) then
      begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;

        MsgDlg('Erro no Calculo Médio Ponderado', 'Aviso', mtInformation, [mbOk], 0);
        Exit;
      end;
      ListaCalculoMedioPonderado(QryParticipantes.FieldByname('IDPESSJUR').asInteger,iPlano,0);
      //edilaine - SIG20491 - fim
    end;
  end;

  ListaParticipante(IdPessoa,iPlano,idPessJur);

  // Thiago Melo 180350 KINTANA 1710563

  QryAux.Close;
  QryAux.SQL.Clear;
  //BRUNO AZEVEDO SOL 187099 KINTANA 1763201
  //QryAux.SQL.Add(' Select idoperfunc from OperFunc where IdFuncao = 26879 and IdModulo = 456 and idoperfunc = 19428');
  QryAux.SQL.Add(' Select idoperfunc from OperFunc where IdFuncao = 26879 and IdModulo = 456 and idoperacao = 1068');
  //BRUNO AZEVEDO SOL 187099 KINTANA 1763201
  QryAux.Open;

  tbButtonEnviar.Enabled   := VerificaAutorizacao(QryAux.FieldByname('idoperfunc').asString);
  tbButtonCancelar.Enabled := VerificaAutorizacao(QryAux.FieldByname('idoperfunc').asString);

  tbButtonExportar.Enabled := true;       //edilaine - SIG25745

  QryAux.Close;

  // Thiago Melo 180350 KINTANA 1710563
end;




procedure TFrmCalculoIRRF.tbButtonCancelarClick(Sender: TObject);
begin
  inherited;

 // SOL 169676 - KINTANA 1506866 - DETC 07/12/2011 - INICIO
 //  if dtmBaseDados.dbBaseDados.InTransaction then
 //    dtmBaseDados.dbBaseDados.Rollback;

  // Paulo Nobre - WO9831 - Inicio
  if not VerificaTipoResgate then
    exit;
  // Paulo Nobre - WO9831 - Fim

  try
    if not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;
    try
      //edilaine #95333 : inicio
      QryParticipantes.DisableControls;            //edilaine #20491
      QryParticipantes.first;

      While not QryParticipantes.Eof do
       begin
          // Paulo Nobre - WO9831 - Inicio
          if chkListaIndividual.Checked then
          begin
            if QryParticipantes.FieldByName('MATRICULA').AsString <> '' then
              idTitular   := retornaIdTitular(QryParticipantes.FieldByName('IDPESSOA').AsInteger,
                                              QryParticipantes.FieldByName('MATRICULA').AsString)
            Else
              idTitular   := QryParticipantes.FieldByName('IDPESSOA').AsInteger;
          end
          Else
          begin
            idTitular   := retornaIdTitular( QryParticipantes.FieldByName('IDPESSOA').AsInteger,sMatricula);
          end;

          if CtrlCalculoIRRF.verificaInformacoesSendoUtilizadasPrevia(QryParticipantes.FieldByName('IDPESSOA').AsInteger
                                                                     ,idTitular
                                                                     ,QryParticipantes.FieldByName('IDPESSJUR').AsInteger
                                                                     ,QryParticipantes.FieldByName('IDPLANOPREV').AsInteger) then
          begin
            Application.MessageBox(pchar('Dados estão sendo usados na Prévia !' + #13 +
                                         'Entre em contato com a área de Pagamento de Benefícios!'),'Verifique',MB_ICONINFORMATION );
            Exit;
          end;
          // Paulo Nobre - WO9831 - Fim

          QryAux.Close;
          QryAux.SQL.Text := 'DELETE FROM HSTCALCULOPMP WHERE IDPESSOA = :IDPESSOA AND IDPLANOPREV = :IDPLANOPREV';
          QryAux.ParamByName('IDPESSOA').AsString    := QryParticipantes.FieldByName('IDPESSOA').AsString;
          QryAux.ParamByName('IDPLANOPREV').AsString := QryParticipantes.FieldByName('IDPLANOPREV').AsString;
          QryAux.ExecSQL;

          QryAux.Close;
          //edilaine SIG20491 : inicio
          QryAux.SQL.Clear;
          if (dblkTpResgate.Enabled) and (dblkTpResgate.Text <> '') then
          begin
             QryAux.SQL.Add('DELETE FROM PRAZOACUMULACAO ');
             QryAux.SQL.Add(' WHERE SEQRESGATE = '+qryTpResgate.FieldByName('SEQRESGATE').AsString ) ;
             QryAux.SQL.Add('   AND IDPESSOA = :IDPESSOA AND IDPLANOPREV = :IDPLANOPREV ');
          end
          else
             QryAux.SQL.Text := 'DELETE FROM PRAZOACUMULACAO WHERE IDPESSOA = :IDPESSOA AND IDPLANOPREV = :IDPLANOPREV' ;
          //edilaine SIG20491 : fim

          QryAux.ParamByName('IDPESSOA').AsString    := QryParticipantes.FieldByName('IDPESSOA').AsString;
          QryAux.ParamByName('IDPLANOPREV').AsString := QryParticipantes.FieldByName('IDPLANOPREV').AsString;
          QryAux.ExecSQL;

          // Paulo Nobre - WO9831 - Inicio
          If (dblkTpResgate.Enabled) and (dblkTpResgate.Text <> '') then
          Begin
            QryAux.Close;
            QryAux.SQL.Clear;
            QryAux.SQL.Add('DELETE FROM HSTPRAZOACUMULACAOFOLHA ');
            QryAux.SQL.Add('WHERE SEQRESGATE = '+qryTpResgate.FieldByName('SEQRESGATE').AsString ) ;
            QryAux.SQL.Add('      AND IDPESSOA = :IDPESSOA AND IDPLANOPREV = :IDPLANOPREV ');
          End
          Else
             QryAux.SQL.Text := 'DELETE FROM HSTPRAZOACUMULACAOFOLHA WHERE IDPESSOA = :IDPESSOA AND IDPLANOPREV = :IDPLANOPREV' ;

          QryAux.ParamByName('IDPESSOA').AsString    := qryParticipantes.FieldByName('IDPESSOA').AsString;
          QryAux.ParamByName('IDPLANOPREV').AsString := qryParticipantes.FieldByName('IDPLANOPREV').AsString;
          QryAux.ExecSQL;

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add('DELETE FROM HSTCALCULOPMPFOLHA WHERE IDPESSOA = :IDPESSOA AND IDPLANOPREV = :IDPLANOPREV');
          QryAux.ParamByName('IDPESSOA').AsString    := QryParticipantes.FieldByName('IDPESSOA').AsString;
          QryAux.ParamByName('IDPLANOPREV').AsString := QryParticipantes.FieldByName('IDPLANOPREV').AsString;
          QryAux.ExecSQL;
          // Paulo Nobre - WO9831 - Fim

          QryParticipantes.next;
       end;
      //edilaine #95333 : fim

    finally
      dtmBaseDados.dbBaseDados.Commit;
      QryPrazoAcumulacao.Close;
      QryPrazoAcumulacao.Open;

      QryPMP.Close;
      QryPMP.Open;
    end;
  except
    dtmBaseDados.dbBaseDados.Rollback;
  end;
 // SOL 169676 - KINTANA 1506866 - DETC 07/12/2011 - FIM

  QryParticipantes.EnableControls;         //edilaine #20491

  atualizaValoresBaseCalculoeIR;           //edilaine #20491

  atualizaValorPrazoMedioPonderado();      //edilaine WO9102

  tbButtonEnviar.Enabled   := False;
  tbButtonCancelar.Enabled := False;
  tbButtonExportar.Enabled := false;       //edilaine - SIG25745

end;

procedure TFrmCalculoIRRF.tbButtonEnviarClick(Sender: TObject);
var
  bAlteraFolha : boolean;       //edilaine SIG100862
  ind : integer;
begin
  inherited;
  // MARCIO DENILSON SOL 173803 KINTANA 1602955

  //edilaine SIG100862 : inicio
  bAlteraFolha := MsgDlg('Deseja alterar o PMP na estrutura da Folha de Benefício?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes;
  //edilaine SIG100862 : fim

  Try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    QryParticipantes.DisableControls;         //edilaine - SIG20491
    QryParticipantes.First;

    While not QryParticipantes.Eof do
     begin

        if chkListaIndividual.Checked then
         begin
              if QryParticipantes.FieldByName('MATRICULA').AsString <> '' then
                idTitular   := retornaIdTitular( QryParticipantes.FieldByName('IDPESSOA').AsInteger,QryParticipantes.FieldByName('MATRICULA').AsString)
              Else
                idTitular   := QryParticipantes.FieldByName('IDPESSOA').AsInteger;
         end;
        //edilaine WO20723 : inicio
        //Else
        // begin
        //  idTitular   := retornaIdTitular( QryParticipantes.FieldByName('IDPESSOA').AsInteger,sMatricula);
        // end;
        //edilaine WO20723 : fim

        //MARCIO DENILSON SOL 151061 KINTANA 1105188
        if CtrlCalculoIRRF.verificaInformacoesSendoUtilizadasPrevia(QryParticipantes.FieldByName('IDPESSOA').AsInteger
                                                                   ,idTitular
                                                                   ,QryParticipantes.FieldByName('IDPESSJUR').AsInteger
                                                                   ,QryParticipantes.FieldByName('IDPLANOPREV').AsInteger) then
          begin
             Application.MessageBox(pchar('A funcionalidade de Prévia está sendo executada!' + #13 + 'Entre em contato com a área de Pagamento de Benefícios!'),'Verifique',MB_ICONINFORMATION );

             //edilaine - SIG20491 - inicio
             if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
             //edilaine - SIG20491 - fim

             Exit;
          end;
        //FIM MARCIO DENILSON SOL 151061 KINTANA 1105188

        //edilaine - SIG20491 - inicio
        CtrlCalculoIRRF.gravarHistoricoPrazoAcumulacao( QryParticipantes.FieldByName('IDPESSOA').AsInteger
                                                       ,idTitular
                                                       ,QryParticipantes.FieldByName('IDPESSJUR').AsInteger
                                                       ,QryParticipantes.FieldByName('IDPLANOPREV').AsInteger
                                                       ,qryTpResgate.FieldByName('IDBENEFICIO').AsInteger); //wo32251 leandro

        if bAlteraFolha then    //edilaine SIG100862
          CtrlCalculoIRRF.gravarHistoricoCalculoPMP(QryParticipantes.FieldByName('IDPESSOA').AsInteger
                                                    ,idTitular
                                                    ,QryParticipantes.FieldByName('IDPESSJUR').AsInteger
                                                    ,QryParticipantes.FieldByName('IDPLANOPREV').AsInteger);
        //edilaine - SIG20491 - fim

        QryParticipantes.Next;
     end;

    dtmBaseDados.dbBaseDados.Commit;

    tbButtonEnviar.Enabled := False;

  Except
    on e: Exception do
     begin

        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;

        Application.MessageBox(pchar('Erro ao gravar: ' + e.Message ),'Erro',MB_ICONERROR );
     end;
  end;

  QryParticipantes.EnableControls;         //edilaine - SIG20491
  atualizaValoresBaseCalculoeIR;           //edilaine - SIG20491
  atualizaValorPrazoMedioPonderado();      //edilaine WO9102

end;

procedure TFrmCalculoIRRF.ListaPrazoAcumulacao(IdPessJur, IdPessoa, iPlano,
  iListaBenef: integer);
  var fValorBase : Real;
  fValorIr   : Real;
begin

  fValorBase :=0;
  fValorIr   :=0;

  QryPrazoAcumulacao.Close;
  QryPrazoAcumulacao.Open;

  //edilaine SIG20491 : inicio
  if (dblkTpResgate.Enabled) and (dblkTpResgate.Text = '') then
     exit;
  //edilaine SIG20491 : fim

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' SELECT IDPRAZOACUM,IDPESSJUR, ');
  QryAux.SQL.Add('  IDPESSOA,        ');
  QryAux.SQL.Add('  IDPLANOPREV,     ');
  QryAux.SQL.Add('  VLRCOTA,         ');
  QryAux.SQL.Add('  VLRVALOR,        ');
  QryAux.SQL.Add('  PERCENTUALIR || ''%''  AS PERCENTUALIR ,    ');
  QryAux.SQL.Add('  INDICE,          ');
  QryAux.SQL.Add('  DESCRICAOFAIXA,   ');
  QryAux.SQL.Add('  (VLRVALOR*PERCENTUALIR)/100 AS IRRF   ');
  QryAux.SQL.Add(' FROM PRAZOACUMULACAO ');
  QryAux.SQL.Add(' WHERE IDPESSJUR  =' +intTostr(IdPessJur));
  QryAux.SQL.Add('  AND IDPESSOA    ='   +intTostr(idPessoa));
  QryAux.SQL.Add('  AND IDPLANOPREV ='+intTostr(iPLano));
  //leandro WO7091 - inicio
  //edilaine SIG100862 : inicio
  //QryAux.SQL.Add('  AND (TIPOOPCAOIR = ''REGRESSIVO''');

  ////QryAux.SQL.Add('   OR  (IDPESSOA IN (SELECT IDPESSOA FROM PORTABILIDADEPREV PPR');
  //QryAux.SQL.Add('   OR EXISTS (SELECT 1 FROM PORTABILIDADEPREV PPR');
  //QryAux.SQL.Add('               WHERE PPR.IDPESSJUR   = ' +intTostr(IdPessJur));
  //QryAux.SQL.Add('                 AND PPR.IDPESSOA    = ' +intTostr(idPessoa));
  //QryAux.SQL.Add('                 AND PPR.IDPLANOPREV = ' +intTostr(iPLano));
  //QryAux.SQL.Add('                 AND PPR.OPCAOIR = ''R''))               ');
  //edilaine SIG100862 : fim
  //leandro WO7091 - fim

  //edilaine SIG20491 : inicio
  if (dblkTpResgate.Enabled) then
  begin
    if (dblkTpResgate.Text <> '') then
       QryAux.SQL.Add('  AND SEQRESGATE = '+qryTpResgate.FieldByName('SEQRESGATE').AsString )
    else
       QryAux.SQL.Add('  AND SEQRESGATE = -1 ');
  end;
  //edilaine SIG20491 : fim

  QryAux.SQL.Add(' ORDER BY IDPRAZOACUM DESC');

  QryAux.open;
  QryAux.first;

  While not QryAux.Eof do begin
    if trim(QryPrazoAcumulacao.FieldByName('IDPRAZOACUM').asString) = '' then begin
      QryPrazoAcumulacao.Edit;
    end else begin
      QryPrazoAcumulacao.Insert;
    end;

     QryPrazoAcumulacao.FieldByname('IDPRAZOACUM').asString    := QryAux.FieldByname('IDPRAZOACUM').asString;
     QryPrazoAcumulacao.FieldByname('IDPESSJUR').asString      := QryAux.FieldByname('IDPESSJUR').asString;
     QryPrazoAcumulacao.FieldByname('IDPESSOA').asString       := QryAux.FieldByname('IDPESSOA').asString;
     QryPrazoAcumulacao.FieldByname('IDPLANOPREV').asString    := QryAux.FieldByname('IDPLANOPREV').asString;
     QryPrazoAcumulacao.FieldByname('VLRVALOR').asString       := FormatFloat('#####,###0.00',QryAux.FieldByname('VLRVALOR').asFloat);
     QryPrazoAcumulacao.FieldByname('VLRCOTA').asString        := FormatFloat('#####,###0.00',QryAux.FieldByname('VLRCOTA').asFloat);
     QryPrazoAcumulacao.FieldByname('PERCENTUALIR').asString   := QryAux.FieldByname('PERCENTUALIR').asString;
     QryPrazoAcumulacao.FieldByname('INDICE').asString         := QryAux.FieldByname('INDICE').asString;
     QryPrazoAcumulacao.FieldByname('DESCRICAOFAIXA').asString := QryAux.FieldByname('DESCRICAOFAIXA').asString;
     QryPrazoAcumulacao.FieldByname('IRRF').asString           := FormatFloat('#####,###0.00',QryAux.FieldByname('IRRF').asFloat);

     fValorBase := fValorBase + QryAux.FieldByname('VLRVALOR').asFloat;
     fValorIr   := fValorIr   + QryAux.FieldByname('IRRF').asFloat;

    QryPrazoAcumulacao.Post;

    QryAux.Next;
  end;


 // MARCIO DENILSON SOL 173803 KINTANA 1602955
  atualizaValoresBaseCalculoeIR();

(*
  // RETIRADO PELO SOL 173803 KINTANA 1602955
  lblBaseCalculo.Caption := FormatFloat('#####,###0.00',fValorBase);
  lblValorIr.Caption     := FormatFloat('#####,###0.00',fValorIr);
*)


end;


procedure TFrmCalculoIRRF.ListaCalculoMedioPonderado(pIdPessoa,
  iPlano, iListaBenef: integer);
begin

  QryPmp.CLose;
  QryPmp.Open;

  QryAux.Close;
  QryAux.SQL.Clear;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' SELECT * FROM HSTCALCULOPMP ');
  QryAux.SQL.Add('  WHERE idpessoa  =' + intTostr(pIdPessoa));
  QryAux.SQL.Add('  AND idplanoprev =' + intTostr(iPlano));
  QryAux.SQL.Add(' ORDER BY IDHSTCALCULOPMP desc');

  QryAux.Open;
  QryAux.First;

(*
   // RETIRADO PELO SOL 173803 KINTANA 1602955
  if trim(QryAux.FieldByname('PRAZOMEDIOPONDERADO').asString) ='' then begin
    lblValorPMP.caption := '0.00';
  end else begin
    lblValorPMP.caption := QryAux.FieldByname('PRAZOMEDIOPONDERADO').asString;
  end;
*)

  while not QryAux.Eof do begin
    if trim(QryPmp.FieldByName('IDHSTCALCULOPMP').asString) = '' then begin
      QryPmp.Edit;
    end else begin
      QryPmp.Insert;
    end;
     QryPmp.FieldByname('IDHSTCALCULOPMP').asString     := QryAux.FieldByname('IDHSTCALCULOPMP').asString;
     QryPmp.FieldByname('MESREFERENCIA').asString       := QryAux.FieldByname('MESREFERENCIA').asString;
     QryPmp.FieldByname('FATORPERMANENCIA').asString    := FormatFloat('#####,###0.00',QryAux.FieldByname('FATORPERMANENCIA').asFloat);
     QryPmp.FieldByname('SALDOACUMULADO').asString      := FormatFloat('#####,###0.00',QryAux.FieldByname('SALDOACUMULADO').asFloat);
     QryPmp.FieldByname('PRAZOMEDIOPONDERADO').asString := QryAux.FieldByname('PRAZOMEDIOPONDERADO').asString;
     QryPmp.FieldByname('IDPLANOPREV').asString         := QryAux.FieldByname('IDPLANOPREV').asString;
     //BRUNO AZEVEDO
     //QryPmp.FieldByname('VLRCOTA').asString             := QryAux.FieldByname('VLRCOTA').asString;
     QryPmp.FieldByname('QTDCOTA').asString             := QryAux.FieldByname('QTDCOTA').asString;
     //BRUNO AZEVEDO

    QryPmp.Post;
    QryAux.Next;
  end;

 // MARCIO DENILSON SOL 173803 KINTANA 1602955
 //atualizaValorPrazoMedioPonderado();   //edilaine WO9102


 QryAux.Close;
 QryAux.SQL.Clear;

 QryAux.Close;
 QryAux.SQL.Clear;
 QryAux.SQL.Add(' SELECT DISTINCT to_char(datainiciofund,''mm/rrrr'') AS ANOMES FROM   benefbfciario ');
 QryAux.SQL.Add(' WHERE  idpessoa = ' + intTostr(IdPessoa));
 // QryAux.SQL.Add(' AND    idplanoprev = 66 ' );                  //edilaine SIG20491
 QryAux.SQL.Add(' AND    idplanoprev = ' + intTostr(iPlano) );
 QryAux.SQL.Add(' AND    IDSITBENEFICIO IN (1,3) ');
 QryAux.SQL.Add(' AND    FONTEPAGADORA = 1 ');
 QryAux.Open;

 if not(QryAux.isEmpty) then
    QryPmp.Locate('MESREFERENCIA',QryAux.FieldByName('ANOMES').AsString,[]);


end;



procedure TFrmCalculoIRRF.bbtnFiltroClick(Sender: TObject);
begin
  inherited;

  if cboPlano.Text = '' then exit;

  if QryParticipantes.Active then begin
    QryParticipantes.Filter   := 'idplanoprev = '+ IntTostr(cboPlano.KeyValue);
    QryParticipantes.Filtered := True;
    QryParticipantes.First;
  end;

  if QryPMP.Active then begin
    QryPMP.Filter   := 'idplanoprev = '+ IntTostr(cboPlano.KeyValue);
    QryPMP.Filtered := True;
    QryPMP.First;
  end;

  if QryPrazoAcumulacao.Active then begin
    QryPrazoAcumulacao.Filter   := 'idplanoprev = '+ IntTostr(cboPlano.KeyValue);
    QryPrazoAcumulacao.Filtered := True;
    QryPrazoAcumulacao.First;
  end;


end;

procedure TFrmCalculoIRRF.btnLimparFiltroClick(Sender: TObject);
begin
  inherited;
  cboPlano.Keyvalue := -1;

  if chkListaIndividual.Checked then begin
    iPLano := 0;
  end;

  if QryParticipantes.Active then begin
    QryParticipantes.Filter   := '';
    QryParticipantes.Filtered := False;
  end;

  if QryPMP.Active then begin
    QryPMP.Filter   := '';
    QryPMP.Filtered := False;
    QryPMP.First;
    While not QryPMP.EOF do begin
      if TRIM(QryPMP.FieldByname('IDHSTCALCULOPMP').asString) = '' then begin
        QryPMP.Delete
      end else begin
        QryPMP.Next;
      end;
    end;
  end;

  if QryPrazoAcumulacao.Active then begin
    QryPrazoAcumulacao.Filter   := '';
    QryPrazoAcumulacao.Filtered := False;
    QryPrazoAcumulacao.First;
    While not QryPrazoAcumulacao.EOF do begin
      if TRIM(QryPrazoAcumulacao.FieldByname('IDPRAZOACUM').asString) = '' then begin
        QryPrazoAcumulacao.Delete
      end else begin
        QryPrazoAcumulacao.Next;
      end;
    end;
  end;

end;

procedure TFrmCalculoIRRF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;

end;

procedure TFrmCalculoIRRF.QryParticipantesAfterScroll(DataSet: TDataSet);
begin
  inherited;

  //if QryParticipantes.Active then begin
  if (QryParticipantes.Active) and (not QryParticipantes.ControlsDisabled) then begin
    ListaPrazoAcumulacao(QryParticipantes.FieldByname('IDPESSJUR').asInteger,QryParticipantes.FieldByname('IDPESSOA').asInteger,QryParticipantes.FieldByname('IDPLANOPREV').asInteger,frmFrameListaBenef1.ListaUsuario);
    ListaCalculoMedioPonderado(QryParticipantes.FieldByname('IDPESSOA').asInteger,QryParticipantes.FieldByname('IDPLANOPREV').asInteger, frmFrameListaBenef1.ListaUsuario);

    lblParticipante.caption        := QryParticipantes.FieldByname('NOME').asString;
    lblPlanoPrevidenciario.caption := QryParticipantes.FieldByname('PLANO').asString;
    lblnumeroInscricao.caption     := QryParticipantes.FieldByname('INSCRICAONUMERO').asString;

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(' SELECT ');
    QryAux.SQL.Add(' (SELECT MATRICULA FROM DEPENTIT WHERE IDPESSOA ='+IntTostr(QryParticipantes.FieldByname('IDPESSOA').asInteger)+' AND ROWNUM=1) AS MATRICULA,  ');
    QryAux.SQL.Add(' (SELECT S.DESCRICAO ');
    QryAux.SQL.Add('  FROM ELEGPATRO E, SITFUNC S, DEPENTIT D');
    QryAux.SQL.Add('   WHERE E.IDPESSJUR ='+IntTostr(QryParticipantes.FieldByname('IDPESSJUR').asInteger));
    QryAux.SQL.Add('   AND D.IDPESSOA =   '+IntTostr(QryParticipantes.FieldByname('IDPESSOA').asInteger));
    QryAux.SQL.Add('   AND E.IDSITFUNC = S.IDSITFUNC');
    QryAux.SQL.Add('   AND E.IDPESSOA = D.IDPESSOA');
    QryAux.SQL.Add('   AND ROWNUM = 1) AS DESCRICAO,');
    QryAux.SQL.Add(' (SELECT NOME FROM PESSOA WHERE IDPESSOA ='+IntTostr(QryParticipantes.FieldByname('IDPESSJUR').asInteger)+')AS PATROCINADORA');


    QryAux.SQL.Add(' FROM DUAL');
    QryAux.Open;

    //lblMatricula.caption           := QryAux.FieldByname('MATRICULA').asString;
    //lblMatricula.caption           := MontaSelectPart.ValoresChave[19];                 //edilaine #95333
    lblMatricula.caption           := QryAux.FieldByname('MATRICULA').asString;           //edilaine #95333
    lblSituacao.caption            := QryAux.FieldByname('DESCRICAO').asString;
    lblPatrocinadora.caption       := QryAux.FieldByname('PATROCINADORA').asString;

  end;

end;

procedure TFrmCalculoIRRF.ListaParticipante(pIdPessoa:Integer; piPlano:Integer; pidPessJur :Integer; bGravar: boolean = false); //TAES - SIG99565
begin

  QryParticipantes.Close;
  QryParticipantes.SQL.Clear;
  // OTACILIO SOL182365 KINTANA 1698477
  QryParticipantes.SQL.Add('SELECT PPP.TIPOOPCAOIR,PPP.INSCRICAONUMERO,PPP.IDPESSJUR,P.IDPESSOA, P.NOME, PPP.IDPLANOPREV, PP.NOME AS PLANO, D.MATRICULA, D.IDTITULAR  ');

  QryParticipantes.SQL.Add(' FROM PESSOA P , PARTPREVPLAN PPP, PLANPREV PP, DEPENTIT D');

  QryParticipantes.SQL.Add(' WHERE 1=1                                                                 ');
  if idpessoa <> 0 then begin
    QryParticipantes.SQL.Add(' AND D.IDPESSOA ='+ IntTostr(pidpessoa)                                 );
  end;

  if idPessJur <> 0 then begin
    QryParticipantes.SQL.Add(' AND PPP.IDPESSJUR ='+IntTostr(pidPessJur)                                );
  end;

  if iPLano <> 0 then begin
    QryParticipantes.SQL.Add(' AND PPP.IDPLANOPREV ='+intTostr(piPlano)                                 );
  end else begin
    QryParticipantes.SQL.Add(' AND PPP.IDPLANOPREV IN (66,74)                                          ');
  end;

  //leandro WO7091 - inicio
  //QryParticipantes.SQL.Add(' AND ((PPP.TIPOOPCAOIR = 2)                                                    ');
  //QryParticipantes.SQL.Add(' OR  (PPP.IDPESSOA IN (SELECT IDPESSOA FROM PORTABILIDADEPREV PPR');
  //QryParticipantes.SQL.Add('                             WHERE PPR.IDPESSJUR = PPP.IDPESSJUR          ');
  //QryParticipantes.SQL.Add('                             AND PPR.IDPESSOA = PPP.IDPESSOA              ');
  //QryParticipantes.SQL.Add('                             AND PPR.IDPLANOPREV = PPP.IDPLANOPREV        ');
  //QryParticipantes.SQL.Add('                             AND PPR.OPCAOIR = ''R'')))                           ');
  //leandro WO7091 - fim

  // OTACILIO SOL167930 KINTANA 1501823
  QryParticipantes.SQL.Add(' AND P.IDPESSOA = D.IDPESSOA                                             ');
  QryParticipantes.SQL.Add(' AND PP.IDPLANOPREV = PPP.IDPLANOPREV                                      ');
  QryParticipantes.SQL.Add(' AND PPP.IDPESSOA = D.IDTITULAR                                            ');

  // OTACILIO SOL182365 KINTANA 1698477
  //if Trim(MontaSelectPart.ValoresChave[20]) = Trim(MontaSelectPart.ValoresChave[21]) then           //edilaine #95333
  if pIdPessoa = IdTitular then                                                                       //edilaine #95333
    QryParticipantes.SQL.Add(' AND D.IDPESSOA = D.IDTITULAR                                            ');

  //edilaine #95333 : inicio
   {// Felipe A. Santos SOL 254124 PPM 793415  - início
   if Trim(MontaSelectPart.ValoresChave[20]) <> '' then
    QryParticipantes.SQL.Add(' AND D.IDTITULAR = ' + QuotedStr(MontaSelectPart.ValoresChave[20]));
   }// Felipe A. Santos SOL 254124 PPM 793415 - fim
  if IdTitular > 0 then
    QryParticipantes.SQL.Add(' AND D.IDTITULAR = ' + intTostr(IdTitular) );
  //edilaine #95333 : fim

  if chkListaIndividual.Checked then begin
    QryParticipantes.SQL.Add(' AND EXISTS (SELECT 1 ');
    QryParticipantes.SQL.Add('            FROM LISTAFOLHABENEFDET LD ');
    QryParticipantes.SQL.Add('            WHERE PPP.IDPESSOA = LD.IDPESSOA ');
    QryParticipantes.SQL.Add('            AND LD.IDLISTA =' + intTostr(frmFrameListaBenef1.ListaUsuario)+')');
  end;
  QryParticipantes.Open;

  //TAES - SIG99565 - início
  if (bGravar) then
  begin
    try
      if(not(dtmBaseDados.dbBaseDados.InTransaction)) then
      begin
        dtmBaseDados.dbBaseDados.StartTransaction;
        dtmBasedados.dbBaseDados.Commit;
      end;
    except
      dtmBasedados.dbBaseDados.RollBack;
    end;
  end;
  //TAES - SIG99565 - fim
end;

procedure TFrmCalculoIRRF.frmFrameListaBenef1bbtnIncluiBenefClick(
  Sender: TObject);
begin
  inherited;
  frmFrameListaBenef1.bbtnIncluiBenefClick(Sender);
  ListaParticipante(IdPessoa,iPlano,idPessJur,true); //TAES - SIG99565
end;

procedure TFrmCalculoIRRF.frmFrameListaBenef1bbtnExcluiCorrenteClick(
  Sender: TObject);
begin
  inherited;
  frmFrameListaBenef1.bbtnExcluiCorrenteClick(Sender);
  ListaParticipante(IdPessoa,iPlano,idPessJur,true); //TAES - SIG99565
end;

procedure TFrmCalculoIRRF.frmFrameListaBenef1bbtnIncluiListaClick(
  Sender: TObject);
begin
  inherited;
  frmFrameListaBenef1.bbtnIncluiListaClick(Sender);
  ListaParticipante(IdPessoa,iPlano,idPessJur,true); //TAES - SIG99565
end;

procedure TFrmCalculoIRRF.frmFrameListaBenef1bbtnExcluiTudoClick(
  Sender: TObject);
begin
  inherited;
  frmFrameListaBenef1.bbtnExcluiTudoClick(Sender);
  ListaParticipante(IdPessoa,iPlano,idPessJur,true); //TAES - SIG99565
end;

procedure TFrmCalculoIRRF.FormCreate(Sender: TObject);
begin
  //inherited;

end;

procedure TFrmCalculoIRRF.btnProcurarClick(Sender: TObject);
begin
  inherited;

  tbButtonExportar.Enabled := false;       //edilaine - SIG25745
  tbButtonEnviar.Enabled   := False;
  tbButtonCancelar.Enabled := False;
  QryPMP.Close;
  bbtnFiltro.Enabled       := False;
  btnLimparFiltro.Enabled  := False;

  QryParticipantes.Close;
  QryPrazoAcumulacao.Close;
  qryTpResgate.Close;          //edilaine - SIG20491

  IdPessJur := 0;
  IdPessoa  := 0;
  iPlano    := 0;
  iPlano     := 0;
  sMatricula := '';

  MontaSelectPart.Executar;

  if MontaSelectPart.RetornouValor then begin



    //leandro - WO7091 - inicio
    // participante com tipo de opção IR diferente de regressivo
    //if (strToint(MontaSelectPart.ValoresChave[22]) <> 2) AND // leandro wo7491
    if (not VerificaOpcaoIRPortabilidadePrev(strToint(MontaSelectPart.ValoresChave[17]),         //WO9102
                                             strToint(MontaSelectPart.ValoresChave[18]),
                                             strToint(MontaSelectPart.ValoresChave[1])) ) and
       (Trim(MontaSelectPart.ValoresChave[22]) <> '2') then                                      //WO9102
    begin
      //if MessageBox(0, 'O participante optou inicialmente pelo regime PROGRESSIVO. Deseja continuar para o cálculo do IR pelo regime REGRESSIVO?', 'Confirmação Regime IR', MB_ICONWARNING or MB_YESNO) = mrNO then   // leandro wo7491
      if MsgDlg('O participante optou inicialmente pelo regime PROGRESSIVO.'+char(10)+char(13)+
                'Deseja continuar para o cálculo do IR pelo regime REGRESSIVO?', 'Confirmação Regime IR', mtConfirmation, [mbYes, mbNo],0) = mrNO then     // leandro wo7491
         exit;
    end;
    //leandro - WO7091 - fim



    lblParticipante.caption        := MontaSelectPart.ValoresChave[2];
    lblPatrocinadora.caption       := MontaSelectPart.ValoresChave[4];
    lblPlanoPrevidenciario.caption := MontaSelectPart.ValoresChave[5];
    lblnumeroInscricao.caption     := MontaSelectPart.ValoresChave[11];
    lblMatricula.caption           := MontaSelectPart.ValoresChave[19];
    lblSituacao.caption            := MontaSelectPart.ValoresChave[8];

    IdPessoa                       := strToint(MontaSelectPart.ValoresChave[17]);
    IdPessJur                      := strToint(MontaSelectPart.ValoresChave[18]);
    iPlano                         := strToint(MontaSelectPart.ValoresChave[1]);
    sMatricula                     := MontaSelectPart.ValoresChave[19];
    //idTitular                      := retornaIdTitular(IdPessoa,sMatricula);       //edilaine SIG20491
    idTitular                      := strToint(MontaSelectPart.ValoresChave[20]);    //edilaine SIG20491

    //edilaine - SIG20491 - inicio
    qryTpResgate.Close;
    qryTpResgate.ParamByName('IDPESSOA').AsInteger    := IdPessoa;
    qryTpResgate.ParamByName('IDPLANOPREV').AsInteger := iPlano;
    qryTpResgate.ParamByName('IDPESSJUR').AsInteger   := idPessJur;
    qryTpResgate.Open;

    dblkTpResgate.Enabled := not qryTpResgate.IsEmpty;
    //edilaine - SIG20491 - fim

    ListaParticipante(IdPessoa,iPlano,idPessJur);

    atualizaValorPrazoMedioPonderado();      //edilaine WO9102

   end;

end;

function TFrmCalculoIRRF.VerificaOpcaoIRPortabilidadePrev(iidPessoa,iidPessoaJur,iidPlanoPrev:Integer):boolean; //leandro - WO7091
begin
  result := false;

  { Verificar se exite reservas portadas para o Participante }
  QryAux.Close;
  QryAux.SQL.Clear;
  //edilaine WO9102 - inicio
  {QryAux.SQL.Add(' SELECT IDPESSOA');
  QryAux.SQL.Add(' FROM   PORTABILIDADEPREV ');
  QryAux.SQL.Add(' WHERE  IDPESSJUR   = '+intTostr(iidPessoaJur));
  QryAux.SQL.Add(' AND    IDPESSOA    = '+intTostr(iidPessoa));
  QryAux.SQL.Add(' AND    IDPLANOPREV = '+intTostr(iidPLanoPrev));
  QryAux.SQL.Add(' AND OPCAOIR = ''R'''); }
  QryAux.SQL.Add('  SELECT count(*) AS FLGTEMPORTAB ');
  QryAux.SQL.Add('    from hstcontribprev hst ');
  QryAux.SQL.Add('    join portabilidadeprev por on por.idplanoprev = hst.idplanoprev ');
  QryAux.SQL.Add('     and hst.idportabilidade = por.idportabilidade     ');
  QryAux.SQL.Add('     and por.idpessoa = hst.idpessoa                   ');
  QryAux.SQL.Add('    join histmovreserva h on por.idpessoa = h.idpessoa ');
  QryAux.SQL.Add('     and hst.idplanoprev = h.idplanoprev               ');
  QryAux.SQL.Add('     and hst.numrecebimento = h.numrecebimento         ');
  QryAux.SQL.Add('     and por.idpessjur = h.idpessjur                   ');
  QryAux.SQL.Add('     and hst.idpessoa = h.idpessoa                     ');
  QryAux.SQL.Add('     and por.idplanoprev = h.idplanoprev               ');
  QryAux.SQL.Add('    join contribuicao c on c.idcontribuicao = por.idcontribuicao ');
  QryAux.SQL.Add('   WHERE POR.idpessoa    = '+intTostr(iidPessoa));
  QryAux.SQL.Add('     AND POR.idpessjur   = '+intTostr(iidPessoaJur));
  QryAux.SQL.Add('     AND POR.idplanoprev = '+intTostr(iidPLanoPrev));
  QryAux.SQL.Add('     AND H.IDTIPORESERVA IN (select idtiporeserva from reservaxplano where flgportabilidade = 1) ');
  QryAux.open;
  //edilaine WO9102 - fim

  rbTpResPort.enabled   := (not QryAux.Eof) and (QryAux.FieldByName('FLGTEMPORTAB').AsInteger <> 0);
  rbTpResAmbas.enabled  := (not QryAux.Eof) and (QryAux.FieldByName('FLGTEMPORTAB').AsInteger <> 0);
  rbTpResNormal.checked := (QryAux.Eof) or (QryAux.FieldByName('FLGTEMPORTAB').AsInteger = 0);
  //edilaine WO9102 - fim

  if not QryAux.Eof then
     result := true;
end;

procedure TFrmCalculoIRRF.QryParticipantesBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  if QryParticipantes.IsEmpty then begin
    QryPrazoAcumulacao.CLose;
    qryPMP.Close;
  end;

end;

procedure TFrmCalculoIRRF.MontaSelectPartBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
var qryTemp: TwwQuery;
    sMatricula: string;
    iPosicao  : Smallint;
begin
  inherited;
  try
    qryTemp  := TwwQuery.Create(Self);
    iPosicao := 0;


    if (Pos('DEPENTIT.MATRICULA=', UpperCase(strListParams[0])) > 0)  then
    begin
      sMatricula := StringReplace(strListParams[0], 'DEPENTIT.MATRICULA=', '', [rfReplaceAll]);
      qryTemp.DatabaseName := 'BaseDados';
      qryTemp.Close;
      qryTemp.SQL.Clear;
      qryTemp.SQL.Text := 'SELECT D.IDTITULAR, D.IDPESSOA FROM DEPENTIT D WHERE D.MATRICULA = ' + QuotedStr(sMatricula);
      qryTemp.Open;

      iPosicao := Pos('LOWER(DEPENTIT', UpperCase(sqlText));

      if Trim(qryTemp.FieldByName('IDTITULAR').AsString) = Trim(qryTemp.FieldByName('IDPESSOA').AsString) then
      begin
        if iPosicao > 0 then
          sMatricula := Copy(sqlText, 1, iPosicao-1);
          sMatricula := sMatricula + 'LOWER(ELEGPATRO' + Copy(sqlText, iPosicao + 14 , Length(sqlText));
          sqlText    := sMatricula;
      end;
    end;

  finally
    qryTemp.Close;
    FreeAndNil(qryTemp);
  end;


end;

procedure TFrmCalculoIRRF.atualizaValoresBaseCalculoeIR;
var bExisteRegistro: boolean;
    fValorBase  : Real;
    fValorIr    : Real;
begin
   With qryConsHST do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT COUNT(*) AS TOTAL            ');
      Sql.Add(' FROM CM.HSTPRAZOACUMULACAOFOLHA     ');
      Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
      //Sql.Add('   AND IDTITULAR = :IDTITULAR        ');          //edilaine - SIG20491
      Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
      Sql.Add('   AND DATAFIM IS NULL               ');
      //Sql.Add('   AND FLGPROCESSADO = 1             ');          //WO26837 Leandro -  //edilaine - SIG20491

      //edilaine SIG20491 : inicio
      if (dblkTpResgate.Enabled) then
      begin
        if (dblkTpResgate.Text <> '') then
           SQL.Add('  AND SEQRESGATE = '+qryTpResgate.FieldByName('SEQRESGATE').AsString )
        else
        begin                                                    //WO26837 Leandro
           Sql.Add('  AND FLGPROCESSADO = 1');                   //WO26837 Leandro
           SQL.Add('  AND SEQRESGATE = -1 ');
        end;                                                     //WO26837 Leandro
      end;
      //edilaine SIG20491 : fim

      ParamByName('IDPESSOA').AsInteger     := IdPessoa;
      //ParamByName('IDTITULAR').AsInteger    := idTitular;        //edilaine - SIG20491
      ParamByName('IDPLANOPREV').AsInteger  := iPlano;
      Open;
      if not IsEmpty then
       bExisteRegistro := (FieldByName('TOTAL').AsInteger > 0);
      Close;

      Close;
      Sql.Clear;
      if bExisteRegistro then
       begin
          Sql.Add(' SELECT NVL(SUM(VLRVALOR),0) AS VLRVALOR   ');
          Sql.Add('      , NVL(SUM(VLRIRRF),0) AS VLRIRRF     ');
          Sql.Add(' FROM CM.HSTPRAZOACUMULACAOFOLHA     ');
          Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
          //Sql.Add('   AND IDTITULAR = :IDTITULAR        ');     //edilaine - SIG20491
          Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
          Sql.Add('   AND DATAFIM IS NULL               ');
          //Sql.Add('   AND FLGPROCESSADO = 1             ');     /WO26837 - Leandro  //edilaine - SIG20491

          //WO26837 Leandro inicio
          if (dblkTpResgate.Enabled) then
          begin
            if (dblkTpResgate.Text <> '') then
              SQL.Add('  AND SEQRESGATE = '+qryTpResgate.FieldByName('SEQRESGATE').AsString )
            else
            begin
              Sql.Add('  AND FLGPROCESSADO = 1');
              SQL.Add('  AND SEQRESGATE = -1 ');
            end;                                                    
          end;
          //WO26837 Leandro inicio

       end
      Else
       begin
          Sql.Add(' SELECT NVL(SUM(VLRVALOR),0) AS VLRVALOR   ');
          Sql.Add('      , NVL(SUM(VLRIRRF),0) AS VLRIRRF     ');
          Sql.Add(' FROM CM.HSTPRAZOACUMULACAOFOLHA P         ');
          Sql.Add(' WHERE IDPESSOA = :IDPESSOA                ');
          //Sql.Add('   AND IDTITULAR = :IDTITULAR              ');     //edilaine - SIG20491
          Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV          ');
          Sql.Add('   AND DATAFIM IS NOT NULL                 ');
          Sql.Add('   AND DATAFIM =                           ');
          Sql.Add('   (                                       ');
          Sql.Add(' SELECT MAX(DATAFIM)                       ');
          Sql.Add(' FROM CM.HSTPRAZOACUMULACAOFOLHA P2        ');
          Sql.Add(' WHERE IDPESSOA = :IDPESSOA                ');
          //Sql.Add('   AND IDTITULAR = :IDTITULAR              ');     //edilaine - SIG20491
          Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV          ');
          Sql.Add('   AND P2.PERCENTUALIR = P.PERCENTUALIR    ');
          Sql.Add('   AND DATAFIM IS NOT NULL                 ');
          Sql.Add('   )                                       ');
       end;

      //edilaine SIG20491 : inicio
      if (dblkTpResgate.Enabled) then
      begin
        if (dblkTpResgate.Text <> '') then
           SQL.Add('  AND SEQRESGATE = '+qryTpResgate.FieldByName('SEQRESGATE').AsString )
        else
           SQL.Add('  AND SEQRESGATE = -1 ');
      end;
      //edilaine SIG20491 : fim

      ParamByName('IDPESSOA').AsInteger     := IdPessoa;
      //ParamByName('IDTITULAR').AsInteger    := idTitular;             //edilaine - SIG20491
      ParamByName('IDPLANOPREV').AsInteger  := iPlano;
      Open;

      lblBaseCalculo.Caption := FormatFloat('#####,###0.00',FieldByname('VLRVALOR').asFloat);
      lblValorIr.Caption     := FormatFloat('#####,###0.00',FieldByname('VLRIRRF').asFloat);

      Close;

    end;
end;

procedure TFrmCalculoIRRF.atualizaValorPrazoMedioPonderado;
var bExisteRegistro: boolean;
    fValorBase : Real;
    fValorIr   : Real;
begin
   try
     With qryConsHST do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT COUNT(*) AS TOTAL            ');
        Sql.Add(' FROM CM.HSTCALCULOPMPFOLHA          ');
        Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
        //Sql.Add('   AND IDTITULAR = :IDTITULAR        ');           //edilaine - SIG20491
        Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
        Sql.Add('   AND DATAFIM IS NULL               ');
        ParamByName('IDPESSOA').AsInteger     := IdPessoa;
        //ParamByName('IDTITULAR').AsInteger    := idTitular;         //edilaine - SIG20491
        ParamByName('IDPLANOPREV').AsInteger  := iPlano;
        Open;
        if not IsEmpty then
         bExisteRegistro := (FieldByName('TOTAL').AsInteger > 0);
        Close;

        Close;
        Sql.Clear;
        if bExisteRegistro then
         begin
            Sql.Add(' SELECT PRAZOMEDIOPONDERADO          ');
            Sql.Add(' FROM CM.HSTCALCULOPMPFOLHA          ');
            Sql.Add(' WHERE IDPESSOA = :IDPESSOA          ');
            //Sql.Add('   AND IDTITULAR = :IDTITULAR        ');           //edilaine - SIG20491
            Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV    ');
            Sql.Add('   AND DATAFIM IS NULL               ');
         end
        Else
         begin
            Sql.Add(' SELECT PRAZOMEDIOPONDERADO                ');
            Sql.Add(' FROM CM.HSTCALCULOPMPFOLHA P              ');
            Sql.Add(' WHERE IDPESSOA = :IDPESSOA                ');
            //Sql.Add('   AND IDTITULAR = :IDTITULAR              ');     //edilaine - SIG20491
            Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV          ');
            Sql.Add('   AND DATAFIM IS NOT NULL                 ');
            Sql.Add('   AND DATAFIM =                           ');
            Sql.Add('   (                                       ');
            Sql.Add(' SELECT MAX(DATAFIM)                       ');
            Sql.Add(' FROM CM.HSTCALCULOPMPFOLHA P2             ');
            Sql.Add(' WHERE IDPESSOA = :IDPESSOA                ');
            //Sql.Add('   AND IDTITULAR = :IDTITULAR              ');     //edilaine - SIG20491
            Sql.Add('   AND IDPLANOPREV = :IDPLANOPREV          ');
            Sql.Add('   AND DATAFIM IS NOT NULL                 ');
            Sql.Add('   )                                       ');
         end;
        ParamByName('IDPESSOA').AsInteger     := IdPessoa;
        //ParamByName('IDTITULAR').AsInteger    := idTitular;             //edilaine - SIG20491
        ParamByName('IDPLANOPREV').AsInteger  := iPlano;
        Open;
      end;

      lblValorPMP.Caption := qryConsHST.FieldByname('PRAZOMEDIOPONDERADO').AsString;

   finally
      qryConsHST.close;
   end;
end;



function TFrmCalculoIRRF.retornaIdTitular(iidPessoa: Integer;
  Matricula: String): Integer;
begin
  Result := IdPessoa;
  With qryConsHST do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT IDTITULAR   ');
      Sql.Add(' FROM CM.DEPENTIT   ');
      Sql.Add(' WHERE IDPESSOA = ' + IntToStr( iidPessoa )  );
      Sql.Add(' AND MATRICULA = ' + QuotedStr ( matricula )  );
      Open;
      if (not IsEmpty) and ( not FieldByName('IDTITULAR').IsNull ) then
       Result := FieldByName('IDTITULAR').AsInteger;
      Close;
  end;
end;

function TFrmCalculoIRRF.retornaMatricula(iidPessoa,iidPessoaJur: Integer): String;
begin
  Result := '';
  With qryConsHST do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT MATRICULA   ');
      Sql.Add(' FROM CM.ELEGPATRO   ');
      Sql.Add(' WHERE IDPESSOA = ' + IntToStr( iidPessoa )  );
      Sql.Add(' AND IDPESSJUR = ' + IntToStr( iidPessoaJur )  );
      Open;
      if (not IsEmpty) and ( not FieldByName('MATRICULA').IsNull ) then
       Result := FieldByName('MATRICULA').AsString;
      Close;
  end;
end;

 // Thiago Melo 180350 KINTANA 1710563
function TFrmCalculoIRRF.VerificaAutorizacao(sIdOperFunc: String): boolean;
var
  qryAutoriza : TwwQuery;
  xIdEspAcesso  : String;
begin
  qryAutoriza := TwwQuery.Create(Self);
  qryAutoriza.DataBaseName := 'BASEDADOS';

  try
    qryAutoriza.Close;
    qryAutoriza.SQL.Clear;
    qryAutoriza.SQL.Add(' SELECT AUTORIZA.IDOPERFUNC ');
    qryAutoriza.SQL.Add('   FROM AUTORIZA            ');
    qryAutoriza.SQL.Add('  WHERE (AUTORIZA.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa)  + ' )');
    qryAutoriza.SQL.Add('    AND (AUTORIZA.IDOPERFUNC = '+sIdOperFunc+' ) ');
    qryAutoriza.SQL.Add('    AND (AUTORIZA.IDESPACESSO = '+IntToStr(Sistema.IdEspAcesso) + ' ) ');
    qryAutoriza.Open;

    if qryAutoriza.IsEmpty then begin
      qryAutoriza.Close;
      qryAutoriza.Sql.Clear;
      qryAutoriza.Sql.Add('     SELECT GAC.IDESPACESSO');
      qryAutoriza.Sql.Add('              FROM GRUPOACESSO GAC');
      qryAutoriza.Sql.Add('             INNER JOIN GRUPOUSU GUS');
      qryAutoriza.Sql.Add('                ON (GAC.IDGRUPO = GUS.IDGRUPO)');
      qryAutoriza.Sql.Add('             INNER JOIN AUTORIZA AUT');
      qryAutoriza.Sql.Add('                ON (AUT.IDESPACESSO = GAC.IDESPACESSO)');
      qryAutoriza.Sql.Add('             WHERE GUS.IDUSUARIO = ' + IntToStr(Sistema.IdUsuario)+ ' ');
      qryAutoriza.Sql.Add('             GROUP BY GAC.IDESPACESSO');
      qryAutoriza.Open;

      if not qryAutoriza.IsEmpty  then begin
        qryAutoriza.First;
        if qryAutoriza.RecordCount > 1 then begin
          while not qryAutoriza.Eof do
          begin
            xIdEspAcesso := xIdEspAcesso + qryAutoriza.FieldByName('IDESPACESSO').AsString;
            qryAutoriza.Next;
            if not qryAutoriza.Eof then begin
              xIdEspAcesso := xIdEspAcesso + ',';
            end;
          end;
        end
        else begin
          xIdEspAcesso := qryAutoriza.FieldByName('IDESPACESSO').AsString;
        end;

        qryAutoriza.Close;
        qryAutoriza.Sql.Clear;
        qryAutoriza.SQL.Add(' SELECT AUTORIZA.IDOPERFUNC ');
        qryAutoriza.SQL.Add('   FROM AUTORIZA            ');
        qryAutoriza.SQL.Add('  WHERE (AUTORIZA.IDPESSOA   = ' + IntToStr(Sistema.IdEmpresa)  + ' )');
        qryAutoriza.SQL.Add('    AND (AUTORIZA.IDOPERFUNC = ' + sIdOperFunc+' ) ');
        qryAutoriza.SQL.Add('    AND (AUTORIZA.IDESPACESSO IN (' + xIdEspAcesso + ' )) ');
        qryAutoriza.Open;
      end;
    end;
    result := not (qryAutoriza.IsEmpty);
  finally
    qryAutoriza.Close;
    FreeAndNil(qryAutoriza);
  end
 // Thiago Melo 180350 KINTANA 1710563
end;


//edilaine - SIG25745 - inicio
procedure TFrmCalculoIRRF.tbButtonExportarClick(Sender: TObject);
begin
  inherited;

  try
    MontaArquivoExcel();

    Screen.Cursor := crDefault;
    MsgDlg('Os cálculos de IRRF realizados para o cadastro selecionado, foram exportados com sucesso.', 'Aviso', mtInformation, [mbOk], 0);
  Except
    on e: Exception do
     begin
       Screen.Cursor := crDefault;
       Application.MessageBox(pchar('Erro ao exportar: ' + e.Message ),'Erro', MB_ICONERROR );
     end;
  end;
end;


procedure TFrmCalculoIRRF.MontaArquivoExcel;
   procedure FormataColunas(grdDados : TwwDBGrid; qryDados : TwwQuery; iCol : byte);
   var  sCampo : string;
   begin
     for iCol := 0 to grdDados.GetColCount-1 do
     begin
       sCampo := grdDados.Columns[icol].FieldName;
       if sCampo <> '' then
       begin
         if (qryDados.FieldByName(sCampo).DataType = ftFloat) then
            Sheet.Columns[icol+1].NumberFormat := '@'
         else if (qryDados.FieldByName(sCampo).DataType = ftInteger) then
            Sheet.Columns[icol+1].NumberFormat := '@';
       end;
     end;
   end;

   procedure InsereCabColunas(grdDados : TwwDBGrid; iCol : byte);
   var  sColuna : string;
   begin
     for iCol := 0 to grdDados.GetColCount-1 do
     begin
       sColuna := grdDados.Columns[icol].DisplayLabel;
       Sheet.Cells[1, iCol+1] := #9+Trim(sColuna);
     end;
   end;

   procedure InsereDadosPlanilha(grdDados : TwwDBGrid; qryDados : TwwQuery; iLin, iCol : byte );
   var  sCampo : string;
   begin
     iLin := 2;
     qryDados.DisableControls;
     qryDados.First;
     while not qryDados.Eof do
     begin
       for iCol := 0 to grdDados.GetColCount-1 do
       begin
          sCampo := grdDados.Columns[icol].FieldName;
          if sCampo <> '' then
          begin
            if (qryDados.FieldByName(sCampo).DataType = ftFloat) then
               Sheet.Cells[iLin, iCol+1] := qryDados.FieldByName(sCampo).AsString
            else if (qryDados.FieldByName(sCampo).DataType = ftInteger) then
               Sheet.Cells[iLin, iCol+1] := qryDados.FieldByName(sCampo).AsString
            else
               Sheet.Cells[iLin, iCol+1] := #9+qryDados.FieldByName(sCampo).AsString;
          end;
       end;
       qryDados.next;
       inc(iLin);
     end;
     qryDados.first;
     qryDados.EnableControls;
   end;
var
  sNomeArquivo : string;
  iCol, iLin   : byte;
  ExcelApp     : Variant;
begin

   with SaveDlg do
       if Execute then
          sNomeArquivo := FileName;

   Screen.Cursor := crHourGlass;

   try

//      lstDados.Add('MATRICULA'+#59+'CPF'+#59+'NOME'+#59+'SEXO'+#59+'PATRO'+#59+'PLANO'+#59+'DTDEMISSAO'+#59+'DTADPLANO'+#59+'IDADE'+#59+'DTATUAL'+#59+'ELEGIVEL1'+#59+'SALDOCONTA'+#59+'RESPOUP'+#59+'ELEGIVEL2'+#59+'VLRASERPORTADO'+#59+'VLRPORTADO'+#59+'TOTPORTADO'+#59+'ELEGIVEL3'+#59+'VLRTRIB'+#59+'VLRNAOTRIB'+#59+'RESGBRUTO'+#59+'ELEGIVEL4'+#59+'SALPART'+#59+'VLRINIPART'+#59+'PERCPART'+#59+'VLRINIPATRO'+#59+'PERCPATRO'+#59+'VLRINICADM'+#59+'PERCCADM'+#59+'VLRINICRISCO'+#59+'PERCCRISCO');

      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Visible := false;
      ExcelApp.WorkBooks.Add(1);
      ExcelApp.DisplayAlerts := False;

      //---- Prazo de Acumulação
      ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count].Name:='Prazo de Acumulação';
      sheet := ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count];

      FormataColunas(grdPrzAcumulo, QryPrazoAcumulacao, iCol);
      InsereCabColunas(grdPrzAcumulo, iCol);
      if not QryPrazoAcumulacao.IsEmpty then
         InsereDadosPlanilha(grdPrzAcumulo, QryPrazoAcumulacao, iLin, iCol );

      ExcelApp.columns.AutoFit;

      //---- Prazo de Acumulação
      ExcelApp.WorkBooks[1].Sheets.Add(null, Sheet);
      ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count].Name:='Prazo Médio Ponderado';
      sheet := ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count];

      FormataColunas(grdPrzMedio, QryPMP, iCol);
      InsereCabColunas(grdPrzMedio, iCol);
      if not QryPMP.IsEmpty then
         InsereDadosPlanilha(grdPrzMedio, QryPMP, iLin, iCol );

      ExcelApp.columns.AutoFit;


      //---- Lista Individual
      if chkListaIndividual.Checked then
      begin
        ExcelApp.WorkBooks[1].Sheets.Add(null, Sheet);
        ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count].Name:='Lista Individual Processamento';
        sheet := ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count];

        FormataColunas(frmFrameListaBenef1.dbgrdPessoas, frmFrameListaBenef1.qryLista, iCol);
        InsereCabColunas(frmFrameListaBenef1.dbgrdPessoas, iCol);
        if not frmFrameListaBenef1.qryLista.IsEmpty then
           InsereDadosPlanilha(frmFrameListaBenef1.dbgrdPessoas, frmFrameListaBenef1.qryLista, iLin, iCol );

        ExcelApp.columns.AutoFit;
      end;

   finally
     (* Fecha o Arquivo Independente do resultado da Operação *)
     ExcelApp.ActiveWorkbook.SaveAs( sNomeArquivo );
     ExcelApp.DisplayAlerts:= 0;
     ExcelApp.ActiveWorkbook.Close(False);
     ExcelApp.Quit;
     ExcelApp := Unassigned;
   end;

end;
//edilaine - SIG25745 - fim


//edilaine - SIG20491 - inicio
function TFrmCalculoIRRF.VerificaTipoResgate : Boolean;
begin
  if (dblkTpResgate.Enabled) and (dblkTpResgate.Text = '') and (not chkListaIndividual.checked) then
  begin
     MsgDlg(MSG09, 'Aviso', mtInformation, [mbOk], 0);
     result:= false;
  end
  else
    result:= true;
end;


procedure TFrmCalculoIRRF.dblkTpResgateChange(Sender: TObject);
begin
  inherited;

  if (dblkTpResgate.Enabled) and (dblkTpResgate.Text <> '') then
     QryParticipantesAfterScroll(QryParticipantes);
end;
//edilaine - SIG20491 - fim


end.




