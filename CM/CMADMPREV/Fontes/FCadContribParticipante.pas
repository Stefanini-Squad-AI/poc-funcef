unit FCadContribParticipante;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//-------------------------------------------------------------------------------
//N. Solicitação: WO8602
//Dt Alteração..: 05/06/2024
//Responsável...: Luis Ferrari
//Descrição.....: Readequação do rateio e Importação de planilha Excel com o rateio por planos de benefícios dos imóveis da FUNCEF.
//-------------------------------------------------------------------------------
//Nº SIG.....: 81662
//Data.......: 05/02/2019
//Responsável: Darivaldo Alencar
//Descrição..: Ao clicar em alterar, o grid estava apontando para o primeiro registro.
//             removido SIG80777(Atualizar registros na base) 
//-------------------------------------------------------------------------------
//Nº SIG.....: 80777
//Data.......: 23/01/2019
//Responsável: Taffarel Sevaybriker
//Descrição..: Erro ao carregar plano contábil de acordo com o plano previdenciário 
//-------------------------------------------------------------------------------
//Nº SIG.....: 57395
//Data.......: 04/11/2017
//Responsável: Darivaldo Alencar
//Descrição..: Não estava trazendo a opção CEF- Devolução de contribuição,
//         Ajustado conforme tela de cadastro manual de historico de contribuição 
//-------------------------------------------------------------------------------
// Alteração  : (dfm)
// Autor(a)   : Edilaine Ferraresi
// Data       : 30/01/2017
// SIG        : 36752
// Descricao  : Equacionamento - ação judicial / importação arquivo
//------------------------------------------------------------------------------
// Autor(a)  : Felipe Azevedo dos Santos
// Data      : 31/05/2016
// Pendência : SIG 20793
// Descricao : Controle de habilitação do campo Percentual de contribuição.
//------------------------------------------------------------------------------
// Autor(a)  : Darivaldo
// Data      : 13/11/2015
// Pendência : SOL 264933  PPM 1159141
// Descricao : Sistema não atualiza plano contábil na funcionalidade.
//------------------------------------------------------------------------------
// Autor(a)  : Marcelo Cardoso
// Data      : 05/10/2015
// Pendência : SOL 262947 PPM 1100532
// Descricao : O sistema apresenta erro ao cadastrar uma contribuição para um
//             participante
//------------------------------------------------------------------------------
// Autor(a)  : Marcelo Cardoso/Fernando Xavier
// Data      : 09/09/2015
// Pendência : SOL 261062 PPM 1054249
// Descricao : Erro ao inserir percentual de inscrição o evento de inscrição
// -----------------------------------------------------------------------------
// Autor(a)  : Helio Lima Custódio
// Data      : 20/07/2015
// Pendência : SOL 253577/17460 PPM 955546
// DFM       : Inclui PARTPREVPLAN no SQL de qryGridContrib
// Descricao : Ajustar contribuições para que na integração seja utilizado o plano contábil.
// -----------------------------------------------------------------------------
// Autor(a)  : Fernando Xavier
// Data      : 31/07/2014
// Pendência : SOL 258530 PPM 989741
// Descricao : Erro ao requerer autopatrocinio causado pela evolução 162126
// -----------------------------------------------------------------------------
// Autor(a)  : William Moreira da Silva
// Data      : 09/07/2014
// Pendência : SOL 235054 PPM 442686
// Descricao : Insconsistência ao registrar eventos
// -----------------------------------------------------------------------------
// Autor(a)  : Jéssica Lana
// Data      : 28/10/2009
// Pendência : SOL 126331
// Descricao : O filtro estava habilitado mas não está funcionando na troca de planos.
// -----------------------------------------------------------------------------
// Autor(a)  : Jéssica Lana
// Data      : 01/10/2009
// Pendência : SOL 124312
// Descricao : Erro: falta de expressão ao clicar em alterar sem o plano selecionado.
// -----------------------------------------------------------------------------
// Autor(a)  : Luis C. Dornellas
// Data      : 03/07/2009
// Pendência : SOL 119732
// Descricao : Retirada da qury do MontaSelect a linha do campo FlgDesativado
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 16/08/2007
// Pendencia   : 19962
// Rotina      : Varias
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/08/2007
// Pendencia   : 25904
// Rotina      : bbtnConfirmarClick
// Alteração   : Comentada a linha que fecha a consulta do participante.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 30/05/2007
// Pendencia   : 25499
// Alteração   : Acerto na utilização do CODPORTFORMA13
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/05/2007
// Pendencia   :
// Rotina      : dblkPlanoPrevChange
// Alteração   : Atualizar variavel que contem o plano previdenciário 
// -----------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/05/2007
// Pendencia   : 24961
// Rotina      : GravaContribuicao
// Alteração   : Acerto no alias das tabelas na query de delete.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/04/2007
// Pendencia   : 25170 
// Rotina      : 1) qryGridContrib
// Alteração   :    Inclusão do campo CODPORTFORMA13
//               2) HabilitaPainel 
//                  Acerto na pesquisa das contribuições para ficar de acordo com
//                  o plano escolhido 
// -----------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/03/2007
// Pendencia   : 21555
// Rotina      : GravaContribuicao, LimpaPainel e PreenchePainel
// Alteração   : Inclusão do campo CODPORTFORMA13 na atualização dos dados.
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, CMTree, DBCtrls, wwdblook, Db, DBTables,
  Wwquery, Wwdatsrc, Mask, TB97, TREdit, MontaSelect,  
  TB97Tlbr, URegra, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  UImportaArquivoNovo, FMostraResultados, ComObj, FCadContribAcaoJudicial,      //edilaine - SIG36752   //WO8602
  uCMTypes, FTelaAut,                                                           //edilaine - SIG36752
  CMDateTimePicker, TEdNum, TB97Ctls, ImgList, wwdbedit;

type
  TfrmCadContribParticipante = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlContrib: TPanel;
    pnlControlesDet: TPanel;
    Panel4: TPanel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    dbgrdDet: TwwDBGrid;
    pnlBarraDetalhe: TPanel;
    dsGridContrib: TwwDataSource;
    qryContribuicao: TwwQuery;
    qryGridContrib: TwwQuery;
    qryAux: TwwQuery;
    qryPortForma: TwwQuery;
    grpOpcao: TGroupBox;
    lblNomeValorBase1: TLabel;
    lblNomeValorBase2: TLabel;
    lblNomeValorBase3: TLabel;
    pnlParticipante: TPanel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    grpRecebimento: TGroupBox;
    Label5: TLabel;
    dblkpcmbPortForma: TwwDBLookupCombo;
    Label1: TLabel;
    cmbDiaVencimento: TComboBox;
    MontaSelectPart: TMontaSelect;
    edOp1: TEditNum;
    edOp2: TEditNum;
    edOp3: TEditNum;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    dtedInicio: TCMDateTimePicker;
    lblQtdeParcelas: TLabel;
    edQtdeParcelas: TEditNum;
    Label8: TLabel;
    dtedFinal: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    dblkpcmbContribuicao: TwwDBLookupCombo;
    chkCobrarContrib: TCheckBox;
    chkRetroativa: TCheckBox;
    chkDescFolha: TCheckBox;
    Label9: TLabel;
    dblkpcmbPeriodicidade: TwwDBLookupCombo;
    qryPeriodicidade: TwwQuery;
    sbExecutaRegra: TSpeedButton;
    qryRegra: TwwQuery;
    regcalculo: TRegra;
    qryParticipante: TwwQuery;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    ImlPadrao: TImageList;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    sbtnConsContrib: TSpeedButton;
    bbtnVoltarDet: TBitBtn;
    dsParticipante: TwwDataSource;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edNome: TwwDBEdit;
    edPatro: TwwDBEdit;
    edPlano: TwwDBEdit;
    edMatricula: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    wwDBEdit7: TwwDBEdit;
    qryPlanoPrev: TwwQuery;
    dblkPlanoPrev: TwwDBLookupCombo;
    dblkpcmbPortForma13: TwwDBLookupCombo;
    Label15: TLabel;
    qryPortForma13: TwwQuery;
    qryPlanoContabil: TwwQuery;
    Label16: TLabel;
    cbxPlanoContabil: TwwDBLookupCombo;
    pnlImportaArq: TPanel;
    Label17: TLabel;
    edtNomeArq: TEdit;
    btnProcuraArq: TBitBtn;
    btnValida: TBitBtn;
    sbtnAcaoJud: TToolbarButton97;
    odAbreArq: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dblkpcmbContribuicaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbContribuicaoExit(Sender: TObject);
    procedure chkDescFolhaClick(Sender: TObject);
    procedure qryGridContribCalcFields(DataSet: TDataSet);
    procedure tEnter(Sender: TObject);
    procedure tExit(Sender: TObject);
    procedure qryGridContribAfterScroll(DataSet: TDataSet);
    procedure qryContribuicaoAfterScroll(DataSet: TDataSet);
    procedure chkCobrarContribClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edQtdeParcelasExit(Sender: TObject);
    procedure dblkpcmbPeriodicidadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dtedInicioExit(Sender: TObject);
    procedure sbExecutaRegraClick(Sender: TObject);
    procedure sbtnConsContribClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkPlanoPrevChange(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAcaoJudClick(Sender: TObject);
    procedure btnProcuraArqClick(Sender: TObject);
    procedure btnValidaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    bApagarContribuicoes : boolean;
    sValOp1, sValOp2, sValOp3,
    sDtInicioInsc,
    sInscricaoData  : string;
    EstadoContrib   : TDataSetState;
    lIdPessoa,lIdPessJur,lIdPlanoPrev,liSeqProposta : integer;
    bUsaABC: boolean; { Este flag é opcional, testando se a empresa trabalha ou não com ABC,  }
                      { para que você não precise fazer uma query com esta finalidade.        }

    //edilaine - SIG36752 - inicio
    lstValidaArquivo : TStringList;
    vColunasArq  : TArrayStr;
    vColunaTipo  : TArrayTipo;
    vColunaOpcao : TArrayOpcao;
    bPermissaoImporta : boolean;
    bPermissaoAcaoJud : boolean;
    //edilaine - SIG36752 - fim

    procedure HabilitaPainel( panel : TPanel ; flag : boolean);

    //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
    function TemPMPPPessoaParam(idPessoa : Integer): Boolean;
    function PlanoGridContribSelecionado : Integer;
    //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546

    //edilaine - SIG36752 - inicio
    procedure HabilitarImportaArquivo(bHabilita : boolean);
    procedure ValidaArquivo(var iNumFalhas : integer; var vDadosProntos : TArrayImportacao);
    procedure ApagaAcaoJudicial;
    //edilaine - SIG36752 - fim

  public
    { Public declarations }

     procedure AssociaContrib(sNomeParticip,sNomePatro,sNomePlano,sDtInicio  : string;
                              iIdPessoa,iIdPessJur,iIdPlanoPrev,iSeqProposta : integer; bProcura : boolean;
                              const pAcessoViaMenu : boolean = false);    //edilaine - SIG36752
     function  GravaContribuicao  : boolean;
     function  ContribuicaoExiste : boolean;
     function  ValidaOpcoes : boolean;
     procedure LimpaPainel;
     procedure PreenchePainel;
     procedure ApagaRegistro;
  end;

var
  frmCadContribParticipante: TfrmCadContribParticipante;
  bFlgRetroativo: boolean;
  bAcessoViaMenu : boolean;       //edilaine - SIG36752

implementation

uses UMensErro, UDataBase, USistema, UAutorizacao,  UFuncoesUteis,
     UAdmPrev,  UContribuicaoPrev,   UParticipante, DAPrev,
     DBaseDados; //Helio - SOL Nº 253577/17460 PPM Nº 955546

{$R *.DFM}

//Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
Const
       PLANO_REGPLANPURO      = 0;
       PLANO_REGPLANSALDADO   = 1;
       PLANO_NOVOPLANOEXPMPP  = 2;
       PLANO_NOVOPLANO        = 3;
       PLANO_REB              = 4;
       PLANO_REBFUNCEF        = 5;
       PLANO_REB1998          = 6;
//Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546

procedure TfrmCadContribParticipante.AssociaContrib( sNomeParticip,sNomePatro,sNomePlano,sDtInicio  : string;
                                                     iIdPessoa,iIdPessJur,iIdPlanoPrev,iSeqProposta : integer; bProcura : boolean;
                                                     const pAcessoViaMenu : boolean);    //edilaine - SIG36752
begin

   bAcessoViaMenu := pAcessoViaMenu;       //edilaine - SIG36752

   edNome.Text     := sNomeParticip;
   edPatro.Text    := sNomePatro;
   edPlano.Text    := sNomePlano;
   dtedInicio.Text := sDtInicio;

   lIdPessoa     := iIdPessoa;
   lIdPessJur    := iIdPessJur;
   lIdPlanoPrev  := iIdPlanoPrev;
   liSeqProposta := iSeqProposta;


   qryParticipante.Close;
   qryParticipante.ParamByName('IdPessJur').AsInteger   := lIdPessJur;
   qryParticipante.ParamByName('IdPlanoPrev').AsInteger := lIdPlanoPrev;
   qryParticipante.ParamByName('IdPessoa').AsInteger    := lIdPessoa;
   qryParticipante.ParamByName('SeqProposta').AsInteger := liSeqProposta;
   qryParticipante.Open;

   qryPlanoPrev.Close;
   qryPlanoPrev.ParamByName('IdPessJur').AsInteger   := lIdPessJur;
   qryPlanoPrev.ParamByName('IdPessoa').AsInteger    := lIdPessoa;
   qryPlanoPrev.ParamByName('SeqProposta').AsInteger := liSeqProposta;
   qryPlanoPrev.Open;

   qryPlanoPrev.Locate('Situacao', 'ATIVO', []);
   dblkPlanoPrev.LookupValue := qryPlanoPrev.FieldByName('IDPLANOPREV').AsString;
   dblkPlanoPrev.Enabled := True;

   qryGridContrib.Close;
   qryGridContrib.ParambyName('iIdPlanoPrev').AsInteger := lIdPlanoPrev;
   qryGridContrib.ParambyName('iIdPessoa').AsInteger    := lIdPessoa;
   qryGridContrib.ParambyName('iIdPessJur').AsInteger   := lIdPessJur;
   qryGridContrib.ParambyName('iSeqProposta').AsInteger := liSeqProposta;
   qryGridContrib.Open;

   sbtnAlterarClick(Self);


   ShowModal;



end;

procedure TfrmCadContribParticipante.FormCreate(Sender: TObject);
begin
  inherited;
  bFlgRetroativo := True;//William Moreira da Silva - SOL 235054 PPM 442686

  qryPeriodicidade.close;
  qryPeriodicidade.open;
end;

procedure TfrmCadContribParticipante.FormShow(Sender: TObject);
begin
  inherited;

  //edilaine - SIG36752 - inicio
  lstValidaArquivo  := TStringList.create;
  bPermissaoImporta := pnlImportaArq.Enabled;
  bPermissaoAcaoJud := sbtnAcaoJud.Enabled;

  HabilitarImportaArquivo(bPermissaoImporta);
  //edilaine - SIG36752 - fim

  chkRetroativa.checked := bflgRetroativo;
  chkRetroativa.Enabled := True;
  sbtnAlterar.Enabled   := False;
  dbgrdDet.BringToFront;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

end;

function  TfrmCadContribParticipante.ValidaOpcoes : boolean;
var bErroRegra            : boolean;
    sRegraValidOp1, sRegraValidOp2, sRegraValidOp3,
    sOpcao,         sSQL  : string;
begin
   Result         := False;
   sRegraValidOp1 := '';
   sRegraValidOp2 := '';
   sRegraValidOp3 := '';

   if edOp1.Visible
   then begin

     if sbtnInsDet.Down
     then
        sRegraValidOp1 := qryContribuicao.FieldbyName('IDREGRAVALIDAOP1').AsString
     else
        sRegraValidOp1 := qryGridContrib.FieldbyName('IDREGRAVALIDAOP1').AsString;

     sOpcao := OraNumero(edOp1.Text);
     sSQL   := ' SELECT '+qryParticipante.FieldByName('IDPESSOA').AsString+       ' AS IDPESSOA,'+
                         qryParticipante.FieldByName('IDPESSJUR').AsString+      ' AS IDPESSJUR,'+
                         qryParticipante.FieldByName('IDPLANOPREV').AsString+    ' AS IDPLANOPREV,'+
                         qryParticipante.FieldByName('SEQPROPOSTA').AsString+    ' AS SEQPROPOSTA,'+
               OraNumero(qryParticipante.FieldByName('SALPARTICIPACAO').AsString)+' AS SALPARTICIPACAO,'+
               OraNumero(qryParticipante.FieldByName('SALINSCRICAO').AsString)+   ' AS SALINSCRICAO,'+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString+'''  AS INSCRICAODATA, '+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString+'''  AS DATAREF, '+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString +'''  AS DTINICIOINSC, '+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString +'''  AS INSCRICAODATAFUND, '+
                    ''''+qryParticipante.FieldByName('IDSITFUNC').AsString+''' AS IDSITFUNC,'+
                    ''''+qryParticipante.FieldByName('IDCARGOEXT').AsString+  ''' AS IDCARGOEXT,'+
                    ''''+qryParticipante.FieldByName('NIVEL').AsString+    ''' AS NIVEL,'+
                    ''''+qryParticipante.FieldByName('DATAADMISSAO').AsString+''' AS DATAADMISSAO,'+
                    ''''+qryParticipante.FieldByName('DATADEMISSAO').AsString+''' AS DATADEMISSAO,'+
               OraNumero(qryParticipante.FieldByName('SALTOTAL').AsString)+   '   AS SALTOTAL,'+
                    ''''+qryParticipante.FieldByName('TEMPONAOCREDITADO').AsString+''' AS TEMPONAOCREDITADO,'+
                    ''''+qryParticipante.FieldByName('TEMPOSERVANTERIOR').AsString+''' AS TEMPOSERVANTERIOR,'+
                    ''''+qryParticipante.FieldByName('DATANASC').AsString+''' AS DATANASC,'+
                    ''''+qryParticipante.FieldByName('DATAMORTE').AsString+''' AS DATAMORTE,'+
                    ''''+qryParticipante.FieldByName('SEXO').AsString+''' AS SEXO,'+
                    ''''+qryParticipante.FieldByName('ESTCIVIL').AsString+''' AS ESTCIVIL,'+
                       sOpcao+' AS VALORBASE1 FROM DUAL ';


     if (Trim(sRegraValidOp1) <> '') and
        (not RegraBooleana(sRegraValidOp1,sSQL,bErroRegra))
     then begin
        if not bErroRegra
        then MsgDlg(' Opção 1 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 1.','Informação',mtInformation,[mbOk,mbHelp],0);
        edOp1.SetFocus;
        Exit;
     end;
   end;

   if edOp2.Visible
   then begin
     if sbtnInsDet.Down
     then
        sRegraValidOp2 := qryContribuicao.FieldbyName('IDREGRAVALIDAOP2').AsString
     else
        sRegraValidOp2 := qryGridContrib.FieldbyName('IDREGRAVALIDAOP2').AsString;

     sOpcao := OraNumero(edOp2.Text);
     sSQL   := ' SELECT '+qryParticipante.FieldByName('IDPESSOA').AsString+       ' AS IDPESSOA,'+
                         qryParticipante.FieldByName('IDPESSJUR').AsString+      ' AS IDPESSJUR,'+
                         qryParticipante.FieldByName('IDPLANOPREV').AsString+    ' AS IDPLANOPREV,'+
                         qryParticipante.FieldByName('SEQPROPOSTA').AsString+    ' AS SEQPROPOSTA,'+
               OraNumero(qryParticipante.FieldByName('SALPARTICIPACAO').AsString)+' AS SALPARTICIPACAO,'+
               OraNumero(qryParticipante.FieldByName('SALINSCRICAO').AsString)+   ' AS SALINSCRICAO,'+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString+'''  AS INSCRICAODATA, '+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString +'''  AS DTINICIOINSC, '+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString +'''  AS INSCRICAODATAFUND, '+
                    ''''+qryParticipante.FieldByName('IDSITFUNC').AsString+''' AS IDSITFUNC,'+
                    ''''+qryParticipante.FieldByName('IDCARGOEXT').AsString+  ''' AS IDCARGOEXT,'+
                    ''''+qryParticipante.FieldByName('NIVEL').AsString+    ''' AS NIVEL,'+
                    ''''+qryParticipante.FieldByName('DATAADMISSAO').AsString+''' AS DATAADMISSAO,'+
                    ''''+qryParticipante.FieldByName('DATADEMISSAO').AsString+''' AS DATADEMISSAO,'+
               OraNumero(qryParticipante.FieldByName('SALTOTAL').AsString)+   '   AS SALTOTAL,'+
                    ''''+qryParticipante.FieldByName('TEMPONAOCREDITADO').AsString+''' AS TEMPONAOCREDITADO,'+
                    ''''+qryParticipante.FieldByName('TEMPOSERVANTERIOR').AsString+''' AS TEMPOSERVANTERIOR,'+
                    ''''+qryParticipante.FieldByName('DATANASC').AsString+''' AS DATANASC,'+
                    ''''+qryParticipante.FieldByName('DATAMORTE').AsString+''' AS DATAMORTE,'+
                    ''''+qryParticipante.FieldByName('SEXO').AsString+''' AS SEXO,'+
                    ''''+qryParticipante.FieldByName('ESTCIVIL').AsString+''' AS ESTCIVIL,'+
                       sOpcao+' AS VALORBASE2 FROM DUAL ';
     if (Trim(sRegraValidOp2) <> '') and
        (not RegraBooleana(sRegraValidOp2,sSQL,bErroRegra))
     then begin
        if not bErroRegra
        then MsgDlg(' Opção 2 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 2.','Informação',mtInformation,[mbOk,mbHelp],0);
        edOp2.SetFocus;
        Exit;
     end;
   end;

   if edOp3.Visible
   then begin
     if sbtnInsDet.Down
     then
        sRegraValidOp3 := qryContribuicao.FieldbyName('IDREGRAVALIDAOP3').AsString
     else
        sRegraValidOp3 := qryGridContrib.FieldbyName('IDREGRAVALIDAOP3').AsString;

     sOpcao := OraNumero(edOp3.Text);
     sSQL   := ' SELECT '+qryParticipante.FieldByName('IDPESSOA').AsString+       ' AS IDPESSOA,'+
                         qryParticipante.FieldByName('IDPESSJUR').AsString+      ' AS IDPESSJUR,'+
                         qryParticipante.FieldByName('IDPLANOPREV').AsString+    ' AS IDPLANOPREV,'+
                         qryParticipante.FieldByName('SEQPROPOSTA').AsString+    ' AS SEQPROPOSTA,'+
               OraNumero(qryParticipante.FieldByName('SALPARTICIPACAO').AsString)+' AS SALPARTICIPACAO,'+
               OraNumero(qryParticipante.FieldByName('SALINSCRICAO').AsString)+   ' AS SALINSCRICAO,'+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString+'''  AS INSCRICAODATA, '+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString +'''  AS DTINICIOINSC, '+
                    ''''+qryParticipante.FieldByName('INSCRICAODATA').AsString +'''  AS INSCRICAODATAFUND, '+
                    ''''+qryParticipante.FieldByName('IDSITFUNC').AsString+''' AS IDSITFUNC,'+
                    ''''+qryParticipante.FieldByName('IDCARGOEXT').AsString+  ''' AS IDCARGOEXT,'+
                    ''''+qryParticipante.FieldByName('NIVEL').AsString+    ''' AS NIVEL,'+
                    ''''+qryParticipante.FieldByName('DATAADMISSAO').AsString+''' AS DATAADMISSAO,'+
                    ''''+qryParticipante.FieldByName('DATADEMISSAO').AsString+''' AS DATADEMISSAO,'+
               OraNumero(qryParticipante.FieldByName('SALTOTAL').AsString)+   '   AS SALTOTAL,'+
                    ''''+qryParticipante.FieldByName('TEMPONAOCREDITADO').AsString+''' AS TEMPONAOCREDITADO,'+
                    ''''+qryParticipante.FieldByName('TEMPOSERVANTERIOR').AsString+''' AS TEMPOSERVANTERIOR,'+
                    ''''+qryParticipante.FieldByName('DATANASC').AsString+''' AS DATANASC,'+
                    ''''+qryParticipante.FieldByName('DATAMORTE').AsString+''' AS DATAMORTE,'+
                    ''''+qryParticipante.FieldByName('SEXO').AsString+''' AS SEXO,'+
                    ''''+qryParticipante.FieldByName('ESTCIVIL').AsString+''' AS ESTCIVIL,'+
                       sOpcao+' AS VALORBASE3 FROM DUAL ';

     if (Trim(sRegraValidOp3) <> '') and
        (not RegraBooleana(sRegraValidOp3,sSQL,bErroRegra))
     then begin
        if not bErroRegra
        then MsgDlg(' Opção 3 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 3.','Informação',mtInformation,[mbOk,mbHelp],0);
        edOp3.SetFocus;
        Exit;
     end;
   end;
   Result := True;
end;

function  TfrmCadContribParticipante.ContribuicaoExiste : boolean;
begin
   Result := True;
   with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP '+
              ' WHERE  IDPESSOA       = '+IntToStr(lIdPessoa)+' AND '+
              '        IDPESSJUR      = '+IntToStr(lIdPessJur) +' AND '+
              '        IDPLANOPREV    = '+IntToStr(lIdPlanoPrev) +' AND '+
              '        SEQPROPOSTA    = '+IntToStr(liSeqProposta)  +' AND '+
              '        IDCONTRIBUICAO = '+qryContribuicao.FieldbyName('IdContribuicao').AsString);
      Open;
      if not IsEmpty
      then begin
         MsgDlg('Contribuição já cadastrada para este participante.','Erro',mtError,[mbOk,mbHelp],0);
         Close;
         Exit;
      end;
      Close;
   end;
   Result := False;
end;

procedure TfrmCadContribParticipante.FormActivate(Sender: TObject);
var qryUsistema: TQuery;
begin
  if (not qryGridContrib.Active) or ((sbtnAcaoJud.down) and (bAcessoViaMenu)) then Exit;     //edilaine - SIG36752

  inherited;
  qryContribuicao.Close;
  qryContribuicao.SQL.Clear;

  qryContribuicao.SQL.Add(' SELECT C.IDCONTRIBUICAO, C.IDTPPERIODICIDADE, '+
                          '        C.NOME, C.QTDEPARCELAS,  '+
                          '        C.FLGOBRIGATORIA,   '+
                          '        C.NOMERESUM, C.FLGRISCO, '+
                          '        C.TRGDTINCLUSAO, C.TRGUSERINCLUSAO, '+
                          '        CP.FLGACEITAOPCAO,CP.NUMOPCOES, '+
                          '        CP.NOMEVALORBASE1,  CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, '+
                          '        CP.IDREGRACALCOP1,  CP.IDREGRACALCOP2, CP.IDREGRACALCOP3, '+
                          '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2, '+
                          '        CP.IDREGRAVALIDAOP3                      '+
                          ' FROM   CONTRIBUICAO C, CONTPREV CP              '+
                          ' WHERE  CP.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                          '        CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                          '        CP.FLGPAGADOR <> ''E'' AND '+
                          '        CP.IDCONTRIBUICAO NOT IN '+
                          '        (SELECT CP2.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP2 '+
                          '         WHERE  CP2.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+  ' AND '+
                          '                CP2.IDPESSJUR   = '+IntToStr(lIdPessJur)+    ' AND '+
                          '                CP2.IDPESSOA    = '+IntToStr(lIdPessoa)+     ' AND '+
                          '                CP2.SEQPROPOSTA = '+IntToStr(liSeqProposta)+ ') '+
                          ' ORDER BY C.NOME ');
  qryContribuicao.Open;

  qryPortForma.Close;   qryPortForma.Open;
  qryPortForma13.Close; qryPortForma13.Open;

  qryPeriodicidade.Close;
  qryPeriodicidade.Open;

  EstadoContrib := dsBrowse;
  dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;
  pnlControlesDet.SendToBack;
  dbGrdDet.BringToFront;

  HabilitarImportaArquivo(false);    //edilaine - SIG36752

end;

procedure TfrmCadContribParticipante.HabilitaPainel( panel : TPanel ; flag : boolean);
var
    i : integer;
begin
    panel.Visible := flag;
    if flag
    then begin
       qryContribuicao.Close;
       qryContribuicao.SQL.Clear;

       qryContribuicao.SQL.Add(' SELECT C.IDCONTRIBUICAO, C.IDTPPERIODICIDADE, '+
                               '        C.NOME, C.QTDEPARCELAS,  '+
                               '        C.FLGOBRIGATORIA,   '+
                               '        C.NOMERESUM, C.FLGRISCO, '+
                               '        C.TRGDTINCLUSAO, C.TRGUSERINCLUSAO, '+
                               '        CP.FLGACEITAOPCAO,CP.NUMOPCOES, '+
                               '        CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, '+
                               '        CP.IDREGRACALCOP1, CP.IDREGRACALCOP2, CP.IDREGRACALCOP3, '+
                               '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2, '+
                               '        CP.IDREGRAVALIDAOP3                      '+
                               ' FROM   CONTRIBUICAO C, CONTPREV CP              '+
                               ' WHERE  CP.IDPLANOPREV = '+ dblkPlanoPrev.LookupValue +' AND '+

                               '        CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                               '        CP.FLGPAGADOR <> ''E'' AND '+
                               '        CP.IDCONTRIBUICAO NOT IN '+
                               '        (SELECT CP2.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP2 '+
                               '         WHERE  CP2.IDPLANOPREV = '+ dblkPlanoPrev.LookupValue +' AND '+
                               '                CP2.IDPESSJUR = '+IntToStr(lIdPessJur)+ ' AND '+
                               '                CP2.IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
                               '                CP2.SEQPROPOSTA = '+IntToStr(liSeqProposta)+' )'+
                               ' ORDER BY C.NOME ');
       qryContribuicao.Open;

       HabilitarImportaArquivo(false);   // edilaine - SIG36752

    end
    else
       HabilitarImportaArquivo(bPermissaoImporta);   // edilaine - SIG36752
end;

function TfrmCadContribParticipante.GravaContribuicao : boolean;
var sSQLValues : string;
    cAuxSeparador : char;

begin
   Result := False;
   qryAux.Close;
   qryAux.SQL.Clear;
   dblkpcmbContribuicao.PerformSearch;
   dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));
   if EstadoContrib = dsInsert
   then begin
      sSQLValues := '';
      sSQLValues := IntToStr(lIdPessoa);
      sSQLValues := sSQLValues+', '+IntToStr(lIdPessJur);
      sSQLValues := sSQLValues+', '+IntToStr(lIdPlanoPrev);
      sSQLValues := sSQLValues+', '+qryContribuicao.FieldbyName('IdContribuicao').AsString;

      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      if chkDescFolha.Checked
      then sSQLValues := sSQLValues+', NULL'
      else if trim (dblkpcmbPortForma.Text) <> ''
           then sSQLValues := sSQLValues +', '+dblkpcmbPortForma.LookupValue 
           else sSQLValues  := sSQLValues+', NULL';

      
      if chkDescFolha.Checked
      then sSQLValues := sSQLValues+', NULL'
      else if trim (dblkpcmbPortForma13.Text) <> ''
           then sSQLValues := sSQLValues +', '+dblkpcmbPortForma13.LookupValue
           else sSQLValues  := sSQLValues+', NULL';


      if Trim(cmbDiaVencimento.Text) <> ''
      then sSQLValues := sSQLValues+', '+IntToStr(cmbDiaVencimento.itemindex + 1)
      else sSQLValues := sSQLValues+', 0';

      if chkDescFolha.Checked
      then sSQLValues := sSQLValues + ', 1'
      else sSQLValues := sSQLValues + ', 0';

      if chkCobrarContrib.Checked
      then sSQLValues := sSQLValues + ', 1'
      else sSQLValues := sSQLValues + ', 0';

      cAuxSeparador := DecimalSeparator;
      DecimalSeparator := '.';

      if Trim(edOp1.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp1);

      if Trim(edOp2.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp2);

      if Trim(edOp3.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp3);
      DecimalSeparator := cAuxSeparador;

      if Trim(edQtdeParcelas.Text) = ''
      then sSQLValues := sSQLValues+', NULL'
      else sSQLValues := sSQLValues+', '+edQtdeParcelas.Text;

      if bFlgRetroativo or (chkRetroativa.checked)
      then sSQLValues := sSQLValues+', 1'
      else sSQLValues := sSQLValues+', 0';

      sSQLValues := sSQLValues+', 1';

      if Trim(dtedInicio.Text) <> ''
      then sSQLValues := sSQLValues+', TO_DATE('''+Trim(dtedInicio.Text)+''',''dd/mm/yyyy'')'
      else sSQLValues := sSQLValues+', NULL';

      if Trim(dtedFinal.Text) <> ''
      then sSQLValues := sSQLValues+', TO_DATE('''+Trim(dtedFinal.Text)+''',''dd/mm/yyyy'')'
      else sSQLValues := sSQLValues+', NULL';

      if Trim(dblkpcmbPeriodicidade.text) <> ''
      then sSQLValues := sSQLValues + ', '+qryPeriodicidade.FieldByName('IdTpPeriodicidade').AsString
      else sSQLValues := sSQLValues+', NULL';

      sSQLValues := sSQLValues+', ''0000/00''';
      sSQLValues := sSQLValues+', '+qryPlanoContabil.FieldByName('IDPLANOPREV').AsString;

      qryAux.SQL.Add(' INSERT INTO CONTRIBPREVPARTP(IDPESSOA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                     '             PLANO,PLACONTAC,PLACONTAD,IDEMPRESAPROP,CODCENTROCUSTOC,CODCENTROCUSTOD,UNIDNEGOC, '+
                     '             CODPORTFORMA,CODPORTFORMA13,DIAVENCIMENTO,FLGDESCFOLHA, FLGCOBRA, VALORBASE1,VALORBASE2,VALORBASE3, '+ 
                     '             QTDEPARCELAS, FLGRETROATIVO,FLGRECALCULA,DATAINICIO,DATAFINAL,IDTPPERIODICIDADE, ULTMESPREPARO,IDPLANPREVCONTAB) '+
                     ' VALUES ('+sSQLValues+')');
   end
   else begin
      sSQLValues := '';
      if Trim(dblkpcmbPortForma.Text) <> ''
      then sSQLValues := ' CODPORTFORMA = '+qryPortForma.FieldByName('CODPORTFORMA').AsString
      else sSQLValues := ' CODPORTFORMA = NULL';


      if Trim(dblkpcmbPortForma13.Text) <> ''
      then sSQLValues := sSQLValues+', CODPORTFORMA13 = '+qryPortForma13.FieldByName('CODPORTFORMA').AsString 
      else sSQLValues := sSQLValues+', CODPORTFORMA13 = NULL';
      

      if Trim(edQtdeParcelas.Text) <> ''
      then sSQLValues := sSQLValues+', QTDEPARCELAS = '+edQtdeParcelas.Text
      else sSQLValues := sSQLValues+', QTDEPARCELAS = NULL ';

      if Trim(dtedInicio.Text) <> ''
      then sSQLValues := sSQLValues+', DATAINICIO = TO_DATE('''+dtedInicio.Text+''',''dd/mm/yyyy'') '
      else sSQLValues := sSQLValues+', DATAINICIO = NULL ';

      if Trim(dtedFinal.Text) <> ''
      then sSQLValues := sSQLValues+', DATAFINAL = TO_DATE('''+dtedFinal.Text+''',''dd/mm/yyyy'') '
      else sSQLValues := sSQLValues+', DATAFINAL = NULL ';


      if Trim(cmbDiaVencimento.Text) <> ''
      then sSQLValues := sSQLValues+', DIAVENCIMENTO = '+IntToStr(cmbDiaVencimento.itemindex + 1)
      else sSQLValues := sSQLValues+', DIAVENCIMENTO = 0 ';

      if chkDescFolha.Checked
      then sSQLValues := sSQLValues + ', FLGDESCFOLHA = 1'
      else sSQLValues := sSQLValues + ', FLGDESCFOLHA = 0';

      if chkCobrarContrib.Checked
      then sSQLValues := sSQLValues + ', FLGCOBRA = 1'
      else sSQLValues := sSQLValues + ', FLGCOBRA = 0';

      cAuxSeparador := DecimalSeparator;
      DecimalSeparator := '.';
      if Trim(edOp1.Text) <> ''
      then sSQLValues := sSQLValues + ', VALORBASE1 = '+ OraNumero(sValOp1)
      else sSQLValues := sSQLValues + ', VALORBASE1 = 0';

      if Trim(edOp2.Text) <> ''
      then sSQLValues := sSQLValues + ', VALORBASE2 = '+ OraNumero(sValOp2)
      else sSQLValues := sSQLValues + ', VALORBASE2 = 0';

      if Trim(edOp3.Text) <> ''
      then sSQLValues := sSQLValues + ', VALORBASE3 = '+ OraNumero(sValOp3)
      else sSQLValues := sSQLValues + ', VALORBASE3 = 0';

      if Trim(dblkpcmbPeriodicidade.text) <> ''
      then sSQLValues := sSQLValues + ', IDTPPERIODICIDADE = '+qryPeriodicidade.FieldByName('IdTpPeriodicidade').AsString
      else sSQLValues := sSQLValues+', IDTPPERIODICIDADE = NULL ';

      If chkRetroativa.Checked
       Then sSQLValues := sSQLValues + ', FLGRETROATIVO = 1'
       Else sSQLValues := sSQLValues + ', FLGRETROATIVO = 0';

      sSQLValues := sSQLValues+', IDPLANPREVCONTAB = '+qryPlanoContabil.FieldByName('IDPLANOPREV').AsString;

      qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET '+sSQLValues+
                     ' WHERE IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
                     '       IDPESSJUR = '+IntToStr(lIdPessJur) +' AND '+
                     '       IDPLANOPREV = '+ qryPlanoPrev.FieldByName('IDPLANOPREV').AsString + ' AND '+
                     '       SEQPROPOSTA = '+inttostr(liSeqProposta)+' AND '+
                     '       IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString);
      DecimalSeparator := cAuxSeparador;
   end;

   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
      begin
         MostrarErro(E);
         Exit;
      end;
   end;


   Try
      if EstadoContrib = dsInsert
      then begin
        if not Sistema.GravaLogOperacoes('Contribuição do Participante  - Inserindo Registro')
        then raise exception.Create('Erro ao gravar Log.');
      end
      else begin
        if not Sistema.GravaLogOperacoes('Contribuição do Participante  - Alterando Registro')
        then raise exception.Create('Erro ao gravar Log.');

        if (OraNumero(qryGridContrib.FieldByName('VALORBASE1').AsString) = OraNumero(sValOp1)) and
           (OraNumero(qryGridContrib.FieldByName('VALORBASE2').AsString) = OraNumero(sValOp2)) and
           (OraNumero(qryGridContrib.FieldByName('VALORBASE3').AsString) = OraNumero(sValOp3))
        then GravaLogTotalPREV('Matr. '+edMatricula.Text+'-Contrib. Part-Alteração Contrib-Contrib.'+qryGridContrib.FieldByName('IdContribuicao').AsString)
        else begin
           if (OraNumero(qryGridContrib.FieldByName('VALORBASE1').AsString) <> OraNumero(sValOp1))
           then GravaLogTotalPREV('Matr. '+edMatricula.Text+'-Contrib. Part-Alteração Opção1-Contrib.'+qryGridContrib.FieldByName('IdContribuicao').AsString+'-Vlr Ant:'+OraNumero(qryGridContrib.FieldByName('VALORBASE1').AsString));

           if (OraNumero(qryGridContrib.FieldByName('VALORBASE2').AsString) <> OraNumero(sValOp2))
           then GravaLogTotalPREV('Matr. '+edMatricula.Text+'-Contrib. Part-Alteração Opção2-Contrib.'+qryGridContrib.FieldByName('IdContribuicao').AsString+'-Vlr Ant:'+OraNumero(qryGridContrib.FieldByName('VALORBASE2').AsString));

           if (OraNumero(qryGridContrib.FieldByName('VALORBASE3').AsString) <> OraNumero(sValOp3))
           then GravaLogTotalPREV('Matr. '+edMatricula.Text+'-Contrib. Part-Alteração Opção3-Contrib.'+qryGridContrib.FieldByName('IdContribuicao').AsString+'-Vlr Ant:'+OraNumero(qryGridContrib.FieldByName('VALORBASE3').AsString));
        end;

      end;
   Except
   End;


   // Se o usuario mandou apagar contribuicoes a nao cobrar -> apagá-las
   if (EstadoContrib = dsEdit) and (bApagarContribuicoes)
   then begin
      // Apagar contribuicoes do juros e correcao
      qryAux.Close;
      qryAux.SQL.Clear;
      
      qryAux.SQL.Add(' DELETE FROM HSTATRASOCONTRIB HCA'+
                     ' WHERE HCA.NUMRECEBIMENTO IN  '+
                     ' (SELECT HST.NUMRECEBIMENTO '+
                     '  FROM   HSTCONTRIBPREV HST '+
                     '  WHERE  HST.IDPESSJUR =  '+IntToStr(lIdPessJur)+' AND       '+
                     '         HST.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND    '+
                     '         HST.IDPESSOA = '+IntToStr(lIdPessoa)+' AND          '+
                     '         HST.SEQPROPOSTA = '+IntToStr(liSeqProposta)+' AND '+
                     '         HST.IDCONTRIBUICAO   = '+qryGridContrib.FieldByName('IdContribuicao').AsString+' AND '+
                     '         HST.SITRECEBIMENTO  = ''0'' AND                   '+
                     '         HST.NUMRECEBIMENTO = HCA.NUMRECEBIMENTO)           ');
      
      try
         qryAux.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;//try

      // Apagar contribuicoes do histórico de contribuicoes
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' DELETE FROM HSTCONTRIBPREV '+
                     ' WHERE  IDPESSJUR =  '+IntToStr(lIdPessJur)+' AND       '+
                     '        IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND    '+
                     '        IDPESSOA = '+IntToStr(lIdPessoa)+' AND          '+
                     '        SEQPROPOSTA = '+IntToStr(liSeqProposta)+' AND   '+
                     '        IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString+' AND '+
                     '        SITRECEBIMENTO = ''0'' ');
      try
         qryAux.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;//try

   end;

   EstadoContrib := dsBrowse;
   dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));
   Result := True;
end;

procedure TfrmCadContribParticipante.LimpaPainel;
begin
    dblkpcmbContribuicao.Text := '';
    dblkpcmbPortForma.Text    := '';
    dblkpcmbPortForma13.Text  := ''; 
    cmbDiaVencimento.Text     := '';
    edQtdeParcelas.Text       := '';

    if dtedInicio.Text     = '' then dtedInicio.Text  := FormatDateTime('dd/mm/yyyy', Date);

    dtedFinal.Text      := '';
    grpOpcao.Visible    := False;
    edOp1.text := '';
    edOp2.text := '';
    edOp3.text := '';
    grpRecebimento.Visible   := False;
    sbExecutaRegra.Enabled   := False;
    chkDescFolha.Checked     := True;
    chkCobrarContrib.Checked := True;
end;

procedure TfrmCadContribParticipante.PreenchePainel;
var
  iNumOpcoes : integer;
  sDataIni   : string;
  NMes       : Integer;
begin
  dblkpcmbContribuicao.Text := qryGridContrib.FieldByName('Nome').AsString;
  dblkpcmbContribuicao.PerformSearch;
  chkDescFolha.Checked      := (qryGridContrib.FieldByName('flgDescFolha').AsInteger = 1);
  chkCobrarContrib.Checked  := (qryGridContrib.FieldByName('flgCobra').AsInteger = 1);
  grpRecebimento.Visible    := (qryGridContrib.FieldByName('flgDescFolha').AsInteger = 0);
  cmbDiaVencimento.Text     := qryGridContrib.FieldByName('DiaVencimento').AsString;
  edQtdeParcelas.Text       := qryGridContrib.FieldByName('QtdeParcelas').AsString;

  if qryGridContrib.FieldByName('DataInicio').AsString = '' Then
    dtedInicio.Text         := ''
  else
    dtedInicio.Text         := FormatDateTime('dd/mm/yyyy', qryGridContrib.FieldByName('DataInicio').AsDateTime);

  if qryGridContrib.FieldByName('DataFinal').AsString = '' Then
    dtedFinal.Text          := ''
  else
    dtedFinal.Text          := qryGridContrib.FieldByName('DataFinal').AsString;

  if qryGridContrib.FieldByName('flgAceitaOpcao').AsInteger = 1 then
    begin
        iNumOpcoes := qryGridContrib.FieldByName('NumOpcoes').AsInteger;
        grpOpcao.Visible := True;
        { Como tela de calculo de opções pressupõe que os }
        { dados já estaram no banco, só pode ser chamado quando alterando      }
        If EstadoContrib = dsInsert Then
          sbExecutaRegra.Enabled := False
        Else
          sbExecutaRegra.Enabled := True;

        // edOp1.Enabled := True; // Felipe A. Santos - SIG 20793
        sbExecutaRegra.Enabled := edOp1.Enabled; // Felipe A. Santos - SIG 20793

        edOp2.Enabled := True;
        edOp3.Enabled := True;

        edOp1.Visible := (iNumOpcoes >= 1);
        edOp2.Visible := (iNumOpcoes >= 2);
        edOp3.Visible := (iNumOpcoes >= 3);

        edOp1.Text := qryGridContrib.FieldByName('ValorBase1').AsString;
        edOp2.Text := qryGridContrib.FieldByName('ValorBase2').AsString;
        edOp3.Text := qryGridContrib.FieldByName('ValorBase3').AsString;

        if qryGridContrib.FieldByName('NOMEVALORBASE1').AsString <> '' then
           lblNomeValorBase1.Caption := qryGridContrib.FieldByName('NOMEVALORBASE1').AsString
        else
           lblNomeValorBase1.Caption := 'Opção 1';

        if qryGridContrib.FieldByName('NOMEVALORBASE2').AsString <> '' then
           lblNomeValorBase2.Caption := qryGridContrib.FieldByName('NOMEVALORBASE2').AsString
        else
           lblNomeValorBase2.Caption := 'Opção 2';

        if qryGridContrib.FieldByName('NOMEVALORBASE3').AsString <> '' then
           lblNomeValorBase3.Caption := qryGridContrib.FieldByName('NOMEVALORBASE3').AsString
        else
           lblNomeValorBase3.Caption := 'Opção 3';

        lblNomeValorBase1.Visible := (iNumOpcoes >= 1);
        lblNomeValorBase2.Visible := (iNumOpcoes >= 2);
        lblNomeValorBase3.Visible := (iNumOpcoes >= 3);
    end
  else
    begin
         grpOpcao.Visible := False;
         edOp1.text := '';
         edOp2.text := '';
         edOp3.text := '';
    end;

  if qryGridContrib.FieldByName('IdTpPeriodicidade').AsString <> ''
  then begin
     if qryPeriodicidade.Locate('IdTpPeriodicidade',qryGridContrib.FieldByName('IdTpPeriodicidade').AsInteger,[loCaseInsensitive,loPartialKey])
     then dblkpcmbPeriodicidade.Text := qryPeriodicidade.FieldByName('Nome').AsString
     else dblkpcmbPeriodicidade.Text := '';
  end
  else dblkpcmbPeriodicidade.Text := '';

  if qryGridContrib.FieldByName('CodPortForma').AsString <> ''
  then begin
     if qryPortForma.Locate('CodPortForma',qryGridContrib.FieldByName('CodPortForma').AsInteger,[loCaseInsensitive,loPartialKey])
     then dblkpcmbPortForma.Text := qryPortForma.FieldByName('DESCRICAO').AsString
     else dblkpcmbPortForma.Text := '';
  end
  else dblkpcmbPortForma.Text := '';

  if qryGridContrib.FieldByName('CODPORTFORMA13').AsString <> ''
  then begin
     if qryPortForma13.Locate('CODPORTFORMA',qryGridContrib.FieldByName('CODPORTFORMA13').AsInteger,[loCaseInsensitive,loPartialKey])
     then dblkpcmbPortForma13.Text := qryPortForma13.FieldByName('DESCRICAO').AsString
     else dblkpcmbPortForma13.Text := '';
  end
  else dblkpcmbPortForma13.Text := '';

end;

procedure TfrmCadContribParticipante.ApagaRegistro;
begin
  //edilaine - SIG36752 - inicio
  {se chamou direito pelo menu do Contrib, abre transação para operacoes}
  if (bAcessoViaMenu) and (not dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.StartTransaction;
  //edilaine - SIG36752 - fim


  ApagaAcaoJudicial();  //edilaine - SIG36752

  with qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add(' DELETE FROM CONTRIBPREVPARTP '+
             ' WHERE IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
             '       IDPESSJUR = '+IntToStr(lIdPessJur) +' AND '+
             '       IDPLANOPREV = '+ qryPlanoPrev.FieldByName('IDPLANOPREV').AsString + ' AND '+
             '       SEQPROPOSTA = '+IntToStr(liSeqProposta)+' AND '+
             '       IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString);
     try
        ExecSQL;
     except
        on E:EDBEngineError do
           MostrarErro(E);
     end;//try

  end; //with


  // Adicionando Log Padrao
  Try
     If Not Sistema.GravaLogOperacoes('Contribuição do Participante  - Apagando Registro') Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;


   qryGridContrib.Close;
   qryGridContrib.Open;
   dbGrdDet.BringToFront;
   HabilitaPainel(pnlControlesDet,False );
   sbtnInsdet.Down := False;
   sbtnAltdet.Down := False;
   dbgrdDet.ApplySelected;

   { Sobe o botão de Apagar }
   sbtnExcluiDet.Down := False;
end;

procedure TfrmCadContribParticipante.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  if Trim(edOp1.Text) = '' then edOp1.Text := '0';
  if Trim(edOp2.Text) = '' then edOp2.Text := '0';
  if Trim(edOp3.Text) = '' then edOp3.Text := '0';

  try
     sValOp1 := edOp1.Text;
     sValOp2 := edOp2.Text;
     sValOp3 := edOp3.Text;
  except
      MsgDlg('Valor de Opções inválido.','Erro',mtError,[mbOk,mbHelp],0);
      edOp1.SetFocus;
      Exit;
  end;

  // Testar se Forma de Recebimento e Dia de Vencimento estao preenchidos
  if Trim(dblkpcmbContribuicao.Text) = ''
  then begin
      MsgDlg('Nome da Contribuição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbContribuicao.SetFocus;
      Exit;
  end;

  if not ValidaOpcoes
  then begin
     TiraSQL(qryAux);
     Exit;
  end;

  if EstadoContrib = dsInsert
  then begin
    if not ContribuicaoExiste
    then begin
       // Gravar contribuicao
       if GravaContribuicao
       then sbtnInsDetClick(Sender)
       else bbtnCancelarDetClick(Sender);
    end
    else bbtnCancelarDetClick(Sender);
  end
  else begin // Estado de Edicao
    GravaContribuicao;
    qryGridContrib.Close;
    qryGridContrib.Open;
    dbGrdDet.BringToFront;
    HabilitaPainel(pnlControlesDet,False );
    sbtnInsdet.Down := False;
    sbtnAltdet.Down := False;
    dbgrdDet.ApplySelected;
    EstadoContrib := dsBrowse;
  end;
  dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));
end;

procedure TfrmCadContribParticipante.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
   try
      qryGridContrib.Close;
      qryGridContrib.Open;
      dbGrdDet.BringToFront;
      dbgrdDet.ApplySelected;
      HabilitaPainel(pnlControlesDet,False);
      sbtnInsDet.Down := False;
      sbtnAltDet.Down := False;
      EstadoContrib   := dsBrowse;
      dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));
   except Raise;
   end; { Except }
end;

procedure TfrmCadContribParticipante.dblkpcmbContribuicaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var iNumOpcoes : integer;
    NMes       : LongInt;
    sDataIni         : string;
begin
  inherited;
  if qryContribuicao.FieldByName('flgAceitaOpcao').AsInteger = 1 then
     begin
         iNumOpcoes := qryContribuicao.FieldByName('NumOpcoes').AsInteger;
         if iNumOpcoes = 0 then
            grpOpcao.Caption   := 'Opções de Contribuição [não disponíveis] '
         else grpOpcao.Caption := 'Opções de Contribuição ';
         grpOpcao.Visible      := True;

         edOp1.Visible := (iNumOpcoes >= 1);
         edOp2.Visible := (iNumOpcoes >= 2);
         edOp3.Visible := (iNumOpcoes >= 3);

         if qryContribuicao.FieldByName('NOMEVALORBASE1').AsString <> '' then
            lblNomeValorBase1.Caption := qryContribuicao.FieldByName('NOMEVALORBASE1').AsString
         else
            lblNomeValorBase1.Caption := 'Opção 1';

         if qryContribuicao.FieldByName('NOMEVALORBASE2').AsString <> '' then
            lblNomeValorBase2.Caption := qryContribuicao.FieldByName('NOMEVALORBASE2').AsString
         else
            lblNomeValorBase2.Caption := 'Opção 2';

         if qryContribuicao.FieldByName('NOMEVALORBASE3').AsString <> '' then
            lblNomeValorBase3.Caption := qryContribuicao.FieldByName('NOMEVALORBASE3').AsString
         else
            lblNomeValorBase3.Caption := 'Opção 3';

         lblNomeValorBase1.Visible := (iNumOpcoes >= 1);
         lblNomeValorBase2.Visible := (iNumOpcoes >= 2);
         lblNomeValorBase3.Visible := (iNumOpcoes >= 3);
     end
  else
     begin
         grpOpcao.Visible := False;
         edOp1.text := '';
         edOp2.text := '';
         edOp3.text := '';
     end;

  // Preencher periodicidade padrao
  if EstadoContrib = dsInsert
  then begin

     edQtdeParcelas.Text := qryContribuicao.FieldbyName('QtdeParcelas').AsString;
     if qryContribuicao.FieldByName('IdTpPeriodicidade').AsString = ''
     then Exit;
     if qryPeriodicidade.Locate('IdTpPeriodicidade',qryContribuicao.FieldByName('IdTpPeriodicidade').AsInteger,[loCaseInsensitive,loPartialKey])
     then dblkpcmbPeriodicidade.Text := qryPeriodicidade.FieldByName('Nome').AsString
     else dblkpcmbPeriodicidade.Text := '';
     try
        dtedFinal.Text := CalcDataFinal(StrToDate(dtedInicio.Text),
                                        edQtdeParcelas.Text,
                                        qryPeriodicidade.FieldByName('QtdeMeses').AsString);
     except
     end;
  end;
end;

procedure TfrmCadContribParticipante.dblkpcmbContribuicaoExit(Sender: TObject);
var iNumOpcoes : integer;
begin
  inherited;
  if (Trim(dblkpcmbContribuicao.Text) <> '') and
     (qryContribuicao.FieldByName('flgAceitaOpcao').AsInteger = 1)
  then begin
     iNumOpcoes := qryContribuicao.FieldByName('NumOpcoes').AsInteger;
  end;
end;

procedure TfrmCadContribParticipante.chkDescFolhaClick(Sender: TObject);
begin
  inherited;
  grpRecebimento.Visible := not chkDescFolha.Checked;
end;

procedure TfrmCadContribParticipante.qryGridContribCalcFields(DataSet: TDataSet);
begin
  inherited;
  with qryGridContrib do
  begin
     if FieldbyName('flgPagador').AsString = 'C'
     then FieldByName('calcPagador').AsString := 'Contribuinte'
     else if FieldByName('flgPagador').AsString = 'P'
          then FieldByName('calcPagador').AsString := 'Patrocinadora'
          else FieldByName('calcPagador').AsString := 'Exclusiva da Patrocinadora';
  end;
end;

procedure TfrmCadContribParticipante.tEnter(Sender: TObject);
begin
  inherited;
  if Trim(TEdit(Sender).Text) = '0' then TEdit(Sender).Text := '';
end;

procedure TfrmCadContribParticipante.tExit(Sender: TObject);
begin
  inherited;
  if Trim(TEdit(Sender).Text) = '' then TEdit(Sender).Text := '0,00';
end;

procedure TfrmCadContribParticipante.qryGridContribAfterScroll(DataSet: TDataSet);
var
  sSql: string;
begin
  inherited;
  bApagarContribuicoes := False;
  if (qryGridContrib.State in [dsInactive]) or (qryGridContrib.IsEmpty) then
      Exit;

  sSQL := ' SELECT FLGOBRIGATORIA FROM CONTRIBUICAO ' +
          ' WHERE IDCONTRIBUICAO = ' + qryGridContrib.FieldByName('IDCONTRIBUICAO').AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  qryAux.Open;

end;

procedure TfrmCadContribParticipante.qryContribuicaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if (EstadoContrib = dsInsert)
  then edQtdeParcelas.Text := qryContribuicao.FieldbyName('QtdeParcelas').AsString;
end;

procedure TfrmCadContribParticipante.chkCobrarContribClick(Sender: TObject);
var sIdContribuicao : string;
begin
  inherited;

  // Se o usuario marcar para nao cobrar a contribuicao , e a mesma já tiver sido
  // preparada, apagar do histórico
  dblkpcmbContribuicao.PerformSearch;
  if (not chkCobrarContrib.Checked) and (not bApagarContribuicoes)  and (not qryGridContrib.IsEmpty)
  then begin
    if Trim(qryGridContrib.FieldbyName('IdContribuicao').AsString) <> ''
    then sIdContribuicao := qryGridContrib.FieldbyName('IdContribuicao').AsString
    else if Trim(qryContribuicao.FieldbyName('IdContribuicao').AsString) <> ''
         then sIdContribuicao := qryContribuicao.FieldbyName('IdContribuicao').AsString
         else sIdContribuicao := '-1';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT NUMRECEBIMENTO '+
                   ' FROM  HSTCONTRIBPREV '+
                   ' WHERE IDPESSJUR      =  '+IntToStr(lIdPessJur)+' AND       '+
                   '       IDPLANOPREV    = '+IntToStr(lIdPlanoPrev)+' AND    '+
                   '       IDPESSOA       = '+IntToStr(lIdPessoa)+' AND          '+
                   '       IDCONTRIBUICAO = '+sIdContribuicao+' AND '+
                   '       SEQPROPOSTA    = '+IntToStr(liSeqProposta)+' AND '+
                   '       SITRECEBIMENTO = ''0''  ');
    qryAux.Open;
    if not qryAux.IsEmpty
    then if MsgDlg('Esta contribuição já foi preparada para a cobrança. Deseja não cobrá-la ? ','Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes  // PROVISORIO
         then
            bApagarContribuicoes    := True
         else  bApagarContribuicoes := False;
    qryAux.Close;
  end;
end;

procedure TfrmCadContribParticipante.edQtdeParcelasExit(Sender: TObject);
begin
  inherited;
  try
     dtedFinal.Text := CalcDataFinal(StrToDate(dtedInicio.Text),
                                     edQtdeParcelas.Text,
                                     qryPeriodicidade.FieldByName('QtdeMeses').AsString);
  except
  end;
end;

procedure TfrmCadContribParticipante.dblkpcmbPeriodicidadeCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  try
     dtedFinal.Text := CalcDataFinal(StrToDate(dtedInicio.Text),
                                     edQtdeParcelas.Text,
                                     qryPeriodicidade.FieldByName('QtdeMeses').AsString);
  except
  end;

end;

procedure TfrmCadContribParticipante.dtedInicioExit(Sender: TObject);
begin
  inherited;
  try
     dtedFinal.Text := CalcDataFinal(StrToDate(dtedInicio.Text),
                                     edQtdeParcelas.Text,
                                     qryPeriodicidade.FieldByName('QtdeMeses').AsString);
  except
  end;
end;

procedure TfrmCadContribParticipante.sbExecutaRegraClick(Sender: TObject);
var
  sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
  sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
  sAssoc1Op3, sAssoc2Op3, sAssoc3Op3,
  sDiaVencimento, sDataInicio, sDataFinal,
  sMesRef, sValorProvento, sUltMesPreparo,
  sInscricaoDataFund,
  sQtdeParcelas, sPartReinscrito ,sPartResgPoupanca, sSQL: string;

  bPartResgPoupanca,
  bPartReinscrito : boolean;
begin
  inherited;
  if Trim(cmbDiaVencimento.Text) <> ''
  then sDiaVencimento := IntToStr(cmbDiaVencimento.ItemIndex + 1)
  else sDiaVencimento := '0';

  if Trim(dtedInicio.Text) <> ''
  then sDataInicio := Trim(dtedInicio.Text)
  else sDataInicio := 'NULL';

  if Trim(dtedFinal.Text) <> ''
  then sDataFinal := Trim(dtedFinal.Text)
  else sDataFinal := 'NULL';

  if Trim(edQtdeParcelas.Text) <> ''
  then sQtdeParcelas := Trim(edQtdeParcelas.Text)
  else sQtdeParcelas := 'NULL';

  bPartReinscrito := PartReinscrito (lIdPessJur, lIdPlanoPrev, lIdPessoa, qryAux);
  if bPartReinscrito
  then sPartReinscrito := '1'
  else sPartReinscrito := '0';

  bPartResgPoupanca    := PartResgPoupanca(lIdPessjur, lIdPlanoPrev, lIdPessoa, liSeqProposta, qryAux);
  if bPartResgPoupanca
  then sPartResgPoupanca := '1'
  else sPartResgPoupanca := '0';

  if bPartReinscrito
  then sMesRef := Copy(sInscricaoData,7,4)+'/'+Copy(sInscricaoData,4,2)
  else sMesRef := Copy(sDtInicioInsc,7,4) +'/'+Copy(sDtInicioInsc,4,2);

  if (Trim(sMesRef) = '') or (Trim(sMesRef) = '/') Then sMesRef := Copy(FormatDateTime('dd/mm/yyyy', Date), 7,4) + '/' +
                                                                   Copy(FormatDateTime('dd/mm/yyyy', Date), 4,2);

  sValorProvento  := CalcSALPART(lIdPessJur,
                                 lIdPessoa,
                                 sMesRef,qryAux);

  if Trim(sValorProvento) = '' then sValorProvento := '0';
  sUltMesPreparo       := CalcUltMesContribuicao( lIdPessJur,
                                                  lIdPlanoPrev,
                                                  lIdPessoa,
                                                  liSeqProposta,
                                                  qryGridContrib.FieldByName('IDCONTRIBUICAO').AsInteger,
                                                  sMesRef,
                                                  qryAux);

  sInscricaoDataFund := CalcDataInscFund(lIdPessJur, lIdPlanoPrev, lIdPessoa,
                                         liSeqProposta,qryAux);

  if Trim(sInscricaoDataFund) = '' then sInscricaoDataFund := FormatDateTime('dd/mm/yyyy', Date);

  PreencheContribAssociada( lIdPessJur,
                            lIdPlanoPrev,
                            lIdPessoa,
                            liSeqProposta,
                            qryGridContrib.FieldByName('IDCONTRIBUICAO').AsInteger,
                            sAssoc1Op1, sAssoc2Op1, sAssoc3Op1,
                            sAssoc1Op2, sAssoc2Op2, sAssoc3Op2,
                            sAssoc1Op3, sAssoc2Op3, sAssoc3Op3, dtmAPrev.qryAux);


  // Executa Regra de Cálculo do Valor das Opções
  sSQL := ' SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA, PP.SEQPROPOSTA, PF.DATANASC, ' +
          '        EL.SALTOTAL, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO, EL.DATAADMISSAO,  ' +
          '        CP.IDREGRACALCOP1, CP.IDREGRACALCOP2, CP.IDREGRACALCOP3, PF.SEXO, ' +
          '        PP.DTINICIOINSC,   CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
                   qryGridContrib.FieldByName('IDCONTRIBUICAO').AsString + ' AS IDCONTRIBUICAO, ' +
                   '''' + sDiaVencimento + '''' + ' AS DIAVENCIMENTO, ' +
                   '''' + sDataInicio    + '''' + ' AS DATAINICIO, ' +
                   '''' + sDataFinal     + '''' + ' AS DATAFINAL, ' +
                   '''' + sQtdeParcelas  + '''' + ' AS QTDEPARCELAS, ' +
                   OraNumero(sValorProvento)+ ' AS VALORPROVENTO, '+
                   ''''+sInscricaoDataFund+''' AS INSCRICAODATAFUND, '+
                   ''''+sUltMesPreparo+''' AS ULTMESPREPARO, '+
                   OraNumero(sAssoc1Op1)+' AS ASSOC1OP1, '+
                   OraNumero(sAssoc2Op1)+' AS ASSOC2OP1, '+
                   OraNumero(sAssoc3Op1)+' AS ASSOC3OP1, '+
                   OraNumero(sAssoc1Op2)+' AS ASSOC1OP2, '+
                   OraNumero(sAssoc2Op2)+' AS ASSOC2OP2, '+
                   OraNumero(sAssoc3Op2)+' AS ASSOC3OP3, '+
                   OraNumero(sAssoc1Op3)+' AS ASSOC1OP3, '+
                   OraNumero(sAssoc2Op3)+' AS ASSOC2OP3, '+
                   OraNumero(sAssoc3Op3)+' AS ASSOC3OP3, '+
                   sPartReinscrito+' AS PARTREINSC, '+
                   sPartResgPoupanca+' AS RESGPOUPANCA '+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF, CONTPREV CP, '+
          '        CONTRIBPREVPARTP CPP ' +
          ' WHERE  PP.IDPESSJUR   = ' + IntToStr(lIdPessJur)    + ' AND ' +
          '        PP.IDPLANOPREV = ' + IntToStr(lIdPlanoPrev)  + ' AND ' +
          '        PP.IDPESSOA    = ' + IntToStr(lIdPessoa)     + ' AND ' +
          '        PP.SEQPROPOSTA = ' + IntToStr(liSeqProposta) + ' AND ' +
          '        EL.IDPESSOA    = PP.IDPESSOA  AND ' +
          '        EL.IDPESSJUR   = PP.IDPESSJUR AND ' +
          '        PF.IDPESSOA    = EL.IDPESSOA  AND ' +
          '        PP.IDPLANOPREV = CP.IDPLANOPREV AND ' +
          '        CPP.IDPESSJUR      = PP.IDPESSJUR   AND ' +
          '        CPP.IDPLANOPREV    = PP.IDPLANOPREV AND ' +
          '        CPP.SEQPROPOSTA    = PP.SEQPROPOSTA AND ' +
          '        CPP.IDPESSOA       = PP.IDPESSOA    AND ' +
          '        CPP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO AND ' +
          '        CP.IDCONTRIBUICAO = ' + qryGridContrib.FieldByName('IDCONTRIBUICAO').AsString;
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

  if edOp1.Visible
  then begin
     if qryRegra.FieldByName('IDREGRACALCOP1').AsString = ''
     then  begin
        MsgDlg('Regra de Cálculo da Opção 1 não preenchida.','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
     end
     else begin
        regCalculo.RuleName := qryRegra.FieldByName('IDREGRACALCOP1').AsString;
        regCalculo.Execute;

        if regCalculo.Result  <> ''
        then edOp1.Text := ClienteNumero(regCalculo.Result);
     end;
  end;

  if edOp2.Visible
  then begin
     if qryRegra.FieldByName('IDREGRACALCOP2').AsString = ''
     then begin
        MsgDlg('Regra de Cálculo da Opção 2 não preenchida.','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
     end
     else begin
        regCalculo.RuleName := qryRegra.FieldByName('IDREGRACALCOP2').AsString;
        regCalculo.Execute;

        if regCalculo.Result  <> ''
        then edOp2.Text := ClienteNumero(regCalculo.Result);
     end;
  end;
  if edOp3.Visible
  then begin
     if qryRegra.FieldByName('IDREGRACALCOP3').AsString = ''
     then begin
        MsgDlg('Regra de Cálculo da Opção 3 não preenchida.','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
     end
     else begin
        regCalculo.RuleName := qryRegra.FieldByName('IDREGRACALCOP3').AsString;
        regCalculo.Execute;

        if regCalculo.Result  <> ''
        then edOp3.Text := ClienteNumero(regCalculo.Result);
     end;
  end;
 {Fim - Executa Regra de Cálculo do Valor das Opções}
end;

procedure TfrmCadContribParticipante.sbtnConsContribClick(Sender: TObject);
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Selecione o participante ! ','Informação',mtInformation,[mbOk,mbHelp],0);
     sbtnConsContrib.Down := False;
     Exit;
  end;

  HabilitarImportaArquivo(false);   // edilaine - SIG36752

  MostraDetalhesContribuicao( lIdPessJur, lIdPlanoPrev, lIdPessoa, liSeqProposta,
                             'Consulta às contribuições do participante ...',
                             '','','','',
                             '',qryAux);
  sbtnConsContrib.Down := False;

  HabilitarImportaArquivo(bPermissaoImporta);   // edilaine - SIG36752
                         
end;

procedure TfrmCadContribParticipante.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     sbtnAlterar.Enabled   := True;
     lIdPessoa     := StrToInt(MontaSelectPart.ValoresChave[0]);
     lIdPessJur    := StrToInt(MontaSelectPart.ValoresChave[1]);
     lIdPlanoPrev  := StrToInt(MontaSelectPart.ValoresChave[2]);
     liSeqProposta := StrToInt(MontaSelectPart.ValoresChave[16]);

     if Trim(MontaSelectPart.ValoresChave[17]) <> '' Then
       sDtInicioInsc  := MontaSelectPart.ValoresChave[17]
     else
       sDtInicioInsc  := FormatDateTime('dd/mm/yyyy', Date);

     if Trim(MontaSelectPart.ValoresChave[13]) <> '' Then
       sInscricaoData := MontaSelectPart.ValoresChave[13]
     else
       sInscricaoData := FormatDateTime('dd/mm/yyyy', Date);

     qryContribuicao.Close;
     qryContribuicao.SQL.Clear;
     qryContribuicao.SQL.Add(' SELECT C.IDCONTRIBUICAO, C.IDTPPERIODICIDADE, '+
                             '        C.NOME, C.QTDEPARCELAS,  '+
                             '        C.FLGOBRIGATORIA,   '+
                             '        C.NOMERESUM, C.FLGRISCO, '+
                             '        C.TRGDTINCLUSAO, C.TRGUSERINCLUSAO, '+
                             '        CP.FLGACEITAOPCAO,CP.NUMOPCOES, '+
                             '        CP.NOMEVALORBASE1,  CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, '+
                             '        CP.IDREGRACALCOP1,  CP.IDREGRACALCOP2, CP.IDREGRACALCOP3, '+
                             '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2, '+
                             '        CP.IDREGRAVALIDAOP3                      '+
                             ' FROM   CONTRIBUICAO C, CONTPREV CP              '+
                             ' WHERE  CP.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                             '        CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                             '        CP.FLGPAGADOR <> ''E'' AND '+
                             '        CP.IDCONTRIBUICAO NOT IN '+
                             '        (SELECT CP2.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP2 '+
                             '         WHERE  CP2.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                             '                CP2.IDPESSJUR   = '+IntToStr(lIdPessJur)+ ' AND '+
                             '                CP2.IDPESSOA    = '+IntToStr(lIdPessoa)+' AND '+
                             '                CP2.SEQPROPOSTA = '+IntToStr(liSeqProposta)+') '+
                             ' ORDER BY C.NOME ');
     qryContribuicao.Open;

     qryPortForma.Close;   qryPortForma.Open;
     qryPortForma13.Close; qryPortForma13.Open;

     qryParticipante.Close;
     qryParticipante.ParamByName('IdPessJur').AsInteger   := lIdPessJur;
     qryParticipante.ParamByName('IdPlanoPrev').AsInteger := lIdPlanoPrev;
     qryParticipante.ParamByName('IdPessoa').AsInteger    := lIdPessoa;
     qryParticipante.ParamByName('SeqProposta').AsInteger := liSeqProposta;
     qryParticipante.Open;

     qryPlanoPrev.Close;
     qryPlanoPrev.ParamByName('IdPessJur').AsInteger   := lIdPessJur;
     qryPlanoPrev.ParamByName('IdPessoa').AsInteger    := lIdPessoa;
     qryPlanoPrev.ParamByName('SeqProposta').AsInteger := liSeqProposta;
     qryPlanoPrev.Open;

     qryPlanoPrev.Locate('Situacao', 'ATIVO', []);
     dblkPlanoPrev.LookupValue := qryPlanoPrev.FieldByName('IDPLANOPREV').AsString;

     dblkPlanoPrev.Enabled := True;

     qryGridContrib.Close;
     qryGridContrib.ParambyName('iIdPlanoPrev').AsInteger := lIdPlanoPrev;
     qryGridContrib.ParambyName('iIdPessoa').AsInteger    := lIdPessoa;
     qryGridContrib.ParambyName('iIdPessJur').AsInteger   := lIdPessJur;
     qryGridContrib.ParambyName('iSeqProposta').AsInteger := liSeqProposta;
     qryGridContrib.Open;

     qryPlanoContabil.close;
     qryPlanoContabil.sql.Text :='SELECT * FROM PLANPREVCONTABIL';
     qryPlanoContabil.Open;

     EstadoContrib := dsBrowse;
     pnlControlesDet.SendToBack;
     dbGrdDet.BringToFront;

     pnlBarraDetalhe.Enabled := False;
     tb97BotoesDetalhe.Enabled := False;

  end else begin
     edNome.Text := '';
     edPatro.Text := '';
     edPlano.Text := '';
     lIdPessoa := -1;
     lIdPessJur := -1;
     lIdPlanoPrev := -1;
     liSeqProposta := -2;
     pnlBarraDetalhe.Enabled := False;
     sbtnAlterar.Enabled   := False;
     tb97BotoesDetalhe.Enabled := False;
     qryParticipante.Close;
     qryParticipante.ParamByName('IdPessJur').AsInteger   := -1;
     qryParticipante.ParamByName('IdPlanoPrev').AsInteger := -1;
     qryParticipante.ParamByName('IdPessoa').AsInteger    := -1;
     qryParticipante.ParamByName('SeqProposta').AsInteger := -1;
     qryParticipante.Open;

  end;
  sbtnProcurar.Down := False;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

procedure TfrmCadContribParticipante.sbtnInsDetClick(
  Sender: TObject);
//Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
var
    planPrevContabSelecionado : Integer;
    sqlPlanPrevC,
    planoPreSelecionado : String;
//Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     sbtnInsDet.Down := False;
     Exit;
  end;
  qryPlanoContabil.close;
  qryPlanoContabil.sql.Text :='SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' '; // SOL 261062 - PPM 1054249 - Marcelo Cardoso
  qryPlanoContabil.Open;
  try
     dblkPlanoPrev.Enabled := False;
      cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
    if (qryPlanoContabil.FieldByName('Ativo').AsString = 'S') then
    begin

      //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
      {if (qryGridContrib.FieldByName('IDPLANOPREV').AsString = '66') then  begin
         qryPlanoContabil.close;
         qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV in (66) ';
         qryPlanoContabil.Open;
         cbxPlanoContabil.LookupValue := '66';
      end else  if (qryGridContrib.FieldByName('IDPLANOPREV').AsString = '74') then  begin
         qryPlanoContabil.close;
         qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV in (74,75) ';
         qryPlanoContabil.Open;
         cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
      end else  if (qryGridContrib.FieldByName('IDPLANOPREV').AsString = '2') then  begin
         qryPlanoContabil.close;
         qryPlanoContabil.sql.Text := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 28 UNION SELECT IDPLANOPREV,nome FROM planprev where IDPLANOPREV  = 2';
         qryPlanoContabil.Open;
         cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
      end
      else
      begin
         qryPlanoContabil.close;
         qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = ''S''';
         qryPlanoContabil.Open;
         cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
      end;}
           planPrevContabSelecionado := PlanoGridContribSelecionado;
           case planPrevContabSelecionado of
                PLANO_REGPLANPURO : begin //RNG04
                                      sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 28 UNION SELECT IDPLANOPREV,nome FROM planprev where IDPLANOPREV  = 2';
                                      planoPreSelecionado := '2';
                                    end;

                PLANO_REGPLANSALDADO :  begin //RNG05
                                          sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 28 UNION SELECT IDPLANOPREV,nome FROM planprev where IDPLANOPREV  = 2';
                                          planoPreSelecionado := '28';
                                        end;

                PLANO_NOVOPLANOEXPMPP : begin //RNG06
                                          sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV IN (74, 75) ';
                                          planoPreSelecionado := '75';
                                        end;

                PLANO_NOVOPLANO : begin //RNG07
                                    sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV IN (74, 75) ';
                                    planoPreSelecionado := '74';
                                  end;

                PLANO_REB    : begin //RNG08
                                sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 66 ';
                                planoPreSelecionado := '66';
                              end;

                PLANO_REBFUNCEF : begin //RNG09
                                    sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 79 ';
                                    planoPreSelecionado := '79';
                                  end;

                PLANO_REB1998 : begin //RNG10
                                  sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 19 ';
                                  planoPreSelecionado := '19';
                                end;

           Else
                sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S''';
                planoPreSelecionado := inttostr(lIdPlanoPrev);// SOL 261062 - PPM 1054249 - Marcelo Cardoso
           End; //END case planPrevContabSelecionado of

           qryPlanoContabil.close;
           qryPlanoContabil.sql.Text := sqlPlanPrevC;
           qryPlanoContabil.Open;
           cbxPlanoContabil.LookupValue := planoPreSelecionado;
      //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546
      end
      else
      begin
        if (qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString = '') then begin
            qryPlanoContabil.close;
            qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+inttostr(lIdPlanoPrev); // SOL 261062 - PPM 1054249 - Marcelo Cardoso
            qryPlanoContabil.Open;
            cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANOPREV').AsString
         end
         else
         begin
             qryPlanoContabil.close;
             qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+QuotedStr(qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString); //SOL 258530 PPM 989741
             qryPlanoContabil.Open;
             cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
         end;
      end;

     dbGrdDet.SendToBack;
     HabilitaPainel(pnlControlesDet, true);
     LimpaPainel;
     dblkpcmbContribuicao.Enabled := True;
     chkDescFolha.Checked := True;
     chkCobrarContrib.Checked := True;
     EstadoContrib := dsInsert;
     dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));
     sbExecutaRegra.Enabled := edOp1.Enabled; // Felipe A. Santos - SIG 20793

     //edilaine - SIG36752 - inicio
     {se chamou direito pelo menu do Contrib, abre transação para operacoes}
     if (bAcessoViaMenu) and (not dtmBaseDados.dbBaseDados.InTransaction) then
        dtmBaseDados.dbBaseDados.StartTransaction;
     //edilaine - SIG36752 - fim

  except
     sbtnInsDet.Down := False;
     raise;
  end; { Except }

end;

procedure TfrmCadContribParticipante.sbtnAltDetClick(
  Sender: TObject);
//Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
var
     planPrevContabSelecionado : Integer;
     sqlPlanPrevC : String;
//Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546
begin
  inherited;
  // Se o usuario já estiver inserindo ou alterando, sair
  if (sbtnInsDet.Down = True) or (EstadoContrib = dsEdit)
  then Exit;

  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     //bbtnProcurar.SetFocus;
     sbtnAltDet.Down := False;
     Exit;
  end;
  qryPlanoContabil.close;
  qryPlanoContabil.sql.Text :='SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' '; // SOL 261062 - PPM 1054249 - Marcelo Cardoso
  qryPlanoContabil.Open;
  dblkPlanoPrev.Enabled := False;
  cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
  if (qryPlanoContabil.FieldByName('Ativo').AsString = 'S') then
  begin
    //Inicio - Helio - SOL Nº 253577/17460 PPM Nº 955546
    {if (qryGridContrib.FieldByName('IDPLANOPREV').AsString = '66') then  begin
       qryPlanoContabil.close;
       qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV in (66) ';
       qryPlanoContabil.Open;
       cbxPlanoContabil.LookupValue := '66';
    end else  if (qryGridContrib.FieldByName('IDPLANOPREV').AsString = '74') then  begin
       qryPlanoContabil.close;
       qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV in (74,75) ';
       qryPlanoContabil.Open;
       cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
    end else  if (qryGridContrib.FieldByName('IDPLANOPREV').AsString = '2') then  begin
       qryPlanoContabil.close;
       qryPlanoContabil.sql.Text := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 28 UNION SELECT IDPLANOPREV,nome FROM planprev where IDPLANOPREV  = 2';
       qryPlanoContabil.Open;
       cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
    end
    else
    begin
       qryPlanoContabil.close;
       qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = ''S''';
       qryPlanoContabil.Open;
       cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
    end;}
           planPrevContabSelecionado := PlanoGridContribSelecionado;
           case planPrevContabSelecionado of
                PLANO_REGPLANPURO : //RNG04
                                    sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 28 UNION SELECT IDPLANOPREV,nome FROM planprev where IDPLANOPREV  = 2';

                PLANO_REGPLANSALDADO : //RNG05
                                       sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 28 UNION SELECT IDPLANOPREV,nome FROM planprev where IDPLANOPREV  = 2';

                PLANO_NOVOPLANOEXPMPP : //RNG06
                                        sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV IN (74, 75) ';

                PLANO_NOVOPLANO : //RNG07
                                  sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV IN (74, 75) ';

                PLANO_REB    : //RNG08
                               sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 66 ';

                PLANO_REBFUNCEF : //RNG09
                                  sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 79 ';

                PLANO_REB1998 : //RNG10
                                sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S'' AND IDPLANOPREV = 19 ';

           Else
                sqlPlanPrevC := ' SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL WHERE ATIVO = ''S''';
           End; //END case planPrevContabSelecionado of

           qryPlanoContabil.close;
           qryPlanoContabil.sql.Text := sqlPlanPrevC;
           qryPlanoContabil.Open;

           //Darivaldo SOL264933 PPM 1159141 - inicio
           // cbxPlanoContabil.LookupValue := inttostr(lIdPlanoPrev); // SOL 261062 - PPM 1054249 - Marcelo Cardoso
//SIG81662 -inicio
//           //Taffarel - SIG80777 - início
//           qryGridContrib.Close;
//           qryGridContrib.ParambyName('iIdPlanoPrev').AsInteger := lIdPlanoPrev;
//           qryGridContrib.ParambyName('iIdPessoa').AsInteger    := lIdPessoa;
//           qryGridContrib.ParambyName('iIdPessJur').AsInteger   := lIdPessJur;
//           qryGridContrib.ParambyName('iSeqProposta').AsInteger := liSeqProposta;
//           qryGridContrib.Open;
//           //Taffarel - SIG80777 - fim
//SIG81662 -Fim
           cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
           //Darivaldo SOL264933 PPM 1159141 - fim

    //Fim - Helio - SOL Nº 253577/17460 PPM Nº 955546
  end
  else
  begin
           if (qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString = '') then begin
            qryPlanoContabil.close;
            qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+inttostr(lIdPlanoPrev); // SOL 261062 - PPM 1054249 - Marcelo Cardoso
            qryPlanoContabil.Open;
            cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANOPREV').AsString
         end
         else
         begin
             qryPlanoContabil.close;
             qryPlanoContabil.sql.Text := 'SELECT * FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+QuotedStr(qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString); //SOL 258530 PPM 989741
             qryPlanoContabil.Open;
             cbxPlanoContabil.LookupValue := qryGridContrib.FieldByName('IDPLANPREVCONTAB').AsString;
         end;

  end;

  try
    //  Altera registro na tabela
    dbGrdDet.SendToBack;
    HabilitaPainel(pnlControlesDet,True );

    // Preencher Painel
    PreenchePainel;

    // Desabilitar como de contribuicao
    dblkpcmbContribuicao.Enabled := False;

    EstadoContrib := dsEdit;
    dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));

    //edilaine - SIG36752 - inicio
    {se chamou direito pelo menu do Contrib, abre transação para operacoes}
    if (bAcessoViaMenu) and (not dtmBaseDados.dbBaseDados.InTransaction) then
       dtmBaseDados.dbBaseDados.StartTransaction;
    //edilaine - SIG36752 - fim

  except
      sbtnAltDet.Down := False;
      Raise;
  end; { Except }

  if (sbtnaltDet.Down = False)
  then begin
     sbtnAltDet.Down := True;
     Exit;
  end;

end;

procedure TfrmCadContribParticipante.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     sbtnExcluiDet.Down := False;
     Exit;
  end;

  // Desce o botão Procurar
  sbtnExcluiDet.Down := True;
  EstadoContrib    := dsBrowse;

  // testa se a tabela está vazia
  if qryGridContrib.IsEmpty
  then begin
      MsgDlg('Não existem contribuições a excluir. ','Erro',mtError,[mbOk, mbHelp], 0);
      sbtnExcluiDet.Down := False;
      Exit;
  end;

  // Testa se a Contribuição não é obrigatória
  if qryGridContrib.FieldByName('FLGOBRIGATORIA').AsString = 'O'
  then begin
      if MsgDlg('Esta Contribuição é obrigatória. Confirma exclusão ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
         begin
              ApagaRegistro;
              exit;
         end
      else
         begin
              sbtnExcluiDet.Down := False;
              Exit;
         end;
  end;

   { Tenta apagar o registro }
   try
      { Pergunta se deseja realmente apagar }
      if MsgDlg('Deseja excluir este registro ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
      then begin
                ApagaRegistro;
      end;//if
   except Raise;
   end; { Except }
end;

procedure TfrmCadContribParticipante.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  pnlBarraDetalhe.Enabled := True;
  tb97BotoesDetalhe.Enabled := True;
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
end;

procedure TfrmCadContribParticipante.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  //edilaine - SIG36752 - inicio
  {se chamou direito pelo menu do Contrib, desfaz as operacoes}
  if (bAcessoViaMenu) and (dtmBaseDados.dbBaseDados.InTransaction) then
        dtmBaseDados.dbBaseDados.rollback;
  //edilaine - SIG36752 - fim

  edNome.Text := '';
  edPatro.Text := '';
  edPlano.Text := '';
  lIdPessoa := -1;
  lIdPessJur := -1;
  lIdPlanoPrev := -1;
  liSeqProposta := -2;
  pnlBarraDetalhe.Enabled := False;
  sbtnAlterar.Enabled     := False;
  sbtnAlterar.Down        := False;
  qryGridContrib.Close;

  tb97BotoesDetalhe.Enabled := False;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;

  dblkPlanoPrev.Enabled := True;

  qryParticipante.Close;

  dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));
  dblkPlanoPrev.Value   := '';
end;

procedure TfrmCadContribParticipante.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  //edilaine - SIG36752 - inicio
  {se chamou direito pelo menu do Contrib, commit as operacoes}
  if (bAcessoViaMenu) and (dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.commit;
  //edilaine - SIG36752 - fim

  tb97BotoesDetalhe.Enabled := False;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  sbtnAlterar.Down      := False;

  dblkPlanoPrev.Enabled := True;

  dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit]));
  //dblkPlanoPrev.Value   := '';   Jéssica Lana  SOL 124312

end;

procedure TfrmCadContribParticipante.dblkPlanoPrevChange(
  Sender: TObject);
begin
  inherited;

  qryGridContrib.Close;
  qryGridContrib.ParambyName('iIdPlanoPrev').AsInteger := qryPlanoPrev.FieldbyName('IDPLANOPREV').AsInteger;
  qryGridContrib.ParambyName('iIdPessoa').AsInteger    := lIdPessoa;
  qryGridContrib.ParambyName('iIdPessJur').AsInteger   := lIdPessJur;
  qryGridContrib.ParambyName('iSeqProposta').AsInteger := liSeqProposta;
  qryGridContrib.Open;

  lIdPlanoPrev := qryPlanoPrev.FieldbyName('IDPLANOPREV').AsInteger;

  //William Moreira da Silva - SOL PPM
  {qryGridContrib.edit;
  if lIdPlanoPrev = 2 then
  begin
     qryGridContrib.Locate('IDCONTRIBUICAO', '259', []);
     qryGridContrib.FieldByName('FLGCOBRA').asInteger := 1;
  end;

  if (lIdPlanoPrev = 66) or (lIdPlanoPrev = 74) then
  begin
     qryGridContrib.Locate('IDCONTRIBUICAO', '500', []);
     qryGridContrib.FieldByName('FLGCOBRA').asInteger := 1;
  end;  }
  //William Moreira da Silva - SOL PPM

end;

procedure TfrmCadContribParticipante.sbtnInserirClick(Sender: TObject);
begin
  inherited;

  dblkPlanoPrev.Enabled := False;
  
end;

//Helio - SOL Nº 253577/17460 PPM Nº 955546
function TfrmCadContribParticipante.TemPMPPPessoaParam(idPessoa : Integer): Boolean;
var
     qryTemp : TWWQuery;
begin
         qryTemp := TWWQuery.Create(nil);
         qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

         qryTemp.SQL.Text := ' SELECT * ' +#13+
                             '     FROM PESSOAPARAM PA ' +#13+
                             '    WHERE PA.IDPESSOA = ' + IntToStr(idPessoa) +#13+
                             '      AND PA.IDPARAM IN (SELECT PF.IDPARAM ' +#13+
                             '                           FROM PARAMFLAGPESSOA PF ' +#13+
                             '                          WHERE PF.DESCRICAO LIKE ''%PMPP%'') ';

         try
           qryTemp.Open;
           If Not qryTemp.IsEmpty then
                Result := True
           else
                Result := False;
         except
            qryTemp.Close;
            FreeAndNil(qryTemp);
            raise;
         end;

         qryTemp.Close;
         FreeAndNil(qryTemp);
end;

//Helio - SOL Nº 253577/17460 PPM Nº 955546
function TfrmCadContribParticipante.PlanoGridContribSelecionado: Integer;

//Inicio - SOL 261062 - PPM 1054249 - Marcelo Cardoso
 var sSql : string;
begin
      Result := -1;

   with TwwQuery.create(self) do
   try

      DataBaseName := 'BaseDados';

      close;
// sql.add('SELECT IDPLANOPREV, IDSITPLANOPREV FROM PARTPREVPLAN WHERE IDPESSOA = '+Inttostr(lIdPessoa)+ ' AND IDPLANOPREV = '+ InttoStr(lIdPlanoPrev));   //   SOL 262947 - PPM 1100532 - Marcelo Cardoso
      sql.add('SELECT IDPLANOPREV, IDSITPLANOPREV, IDPESSOA FROM PARTPREVPLAN WHERE IDPESSOA = '+Inttostr(lIdPessoa)+ ' AND IDPLANOPREV = '+ InttoStr(lIdPlanoPrev));  //   SOL 262947 - PPM 1100532 - Marcelo Cardoso
      open;
// FIM - SOL 261062 - PPM 1054249 - Marcelo Cardoso

      //REG/REPLAN puro RNG04
      if (FieldByName('IDPLANOPREV').AsString = '2') And       // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
         (FieldByName('IDSITPLANOPREV').AsInteger >= 1) And    // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
         (FieldByName('IDSITPLANOPREV').AsInteger <= 24) then  // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
      begin
            Result := PLANO_REGPLANPURO;
            Exit;
      end;

      //REG/REPLAN SALDADO puro RNG05
      if (FieldByName('IDPLANOPREV').AsString = '2') And      // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
         (FieldByName('IDSITPLANOPREV').AsInteger >= 25) And  // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
         (FieldByName('IDSITPLANOPREV').AsInteger <= 29) then // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
      begin
            Result := PLANO_REGPLANSALDADO;
            Exit;
      end;

      //NOVO PLANO EX-PMPP
      //OU NOVO PLANO
      if FieldByName('IDPLANOPREV').AsString = '74' then   // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
      begin
             if TemPMPPPessoaParam(FieldByName('IDPESSOA').AsInteger) then   // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
                  Result := PLANO_NOVOPLANOEXPMPP//NOVO PLANO EX-PMPP RNG06
             else
                  Result := PLANO_NOVOPLANO;//NOVO PLANO RNG07

             Exit;
      end;

      //REB RNG08
      if (FieldByName('IDPLANOPREV').AsString = '66') then  // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
      begin
            Result := PLANO_REB;
            Exit;
      end;

      //REB FUNCEF RNG09
      if (FieldByName('IDPLANOPREV').AsString = '79') then  // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
      begin
            Result := PLANO_REBFUNCEF;
            Exit;
      end;

      //REB 1998 RNG10
      if (FieldByName('IDPLANOPREV').AsString = '19') then   // SOL 261062 - PPM 1054249 - Marcelo Cardoso - Retirando qryGridContrib
      begin
            Result := PLANO_REB1998;
            Exit;
      end;
// Inicio - SOL 261062 - PPM 1054249 - Marcelo Cardoso
   finally
     if active then
        close;
     free;
   end;

end;
// FIM - SOL 261062 - PPM 1054249 - Marcelo Cardoso


//edilaine - SIG36752 - inicio
procedure TfrmCadContribParticipante.HabilitarImportaArquivo(bHabilita: boolean);
begin
  if not bHabilita then
     edtNomeArq.color := clSilver
  else
     edtNomeArq.color := clWhite;

  btnProcuraArq.enabled := bHabilita;
  btnValida.enabled     := bHabilita;
end;

procedure TfrmCadContribParticipante.ApagaAcaoJudicial;
begin
  try
    qryAux.close;
    qryAux.SQL.text := 'DELETE FROM CM.CONTRIBPARTPACJUDDEFICIT '+
                       ' WHERE IDPESSOA = '+IntToStr(lIdPessoa)+
                       '   AND IDPESSJUR = '+IntToStr(lIdPessJur)+
                       '   AND IDPLANOPREV = '+qryGridContrib.FieldByName('IDPLANOPREV').AsString+
                       '   AND SEQPROPOSTA = 1'+
                       '   AND IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString;
    qryAux.ExecSQL;
  except
    MsgDlg('Erro ao excluir ação judicial associada.', 'Atenção', mtError, [mbOk], 0);;
  end;
end;

procedure TfrmCadContribParticipante.sbtnAcaoJudClick(Sender: TObject);
begin
  inherited;

  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     sbtnAcaoJud.Down := False;
     Exit;
  end;

  //edilaine - SIG36752 - inicio
  {se chamou direito pelo menu do Contrib, abre transação para operacoes}
  if (bAcessoViaMenu) and (not dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.StartTransaction;
  //edilaine - SIG36752 - fim


  HabilitarImportaArquivo(false);

  CadastraAcaoJudicial(qryGridContrib.FieldbyName('IdContribuicao').AsInteger, lIdPessoa, lIdPessJur, lIdPlanoPrev );

  sbtnAcaoJud.Down := False;

  HabilitarImportaArquivo(bPermissaoImporta);

end;

procedure TfrmCadContribParticipante.btnProcuraArqClick(Sender: TObject);
begin
  inherited;
  if odAbreArq.Execute then
  begin
    edtNomeArq.text := ExtractFileName( odAbreArq.FileName );

    btnValida.enabled := true;

    btnValidaclick(Sender);
  end;
end;

procedure TfrmCadContribParticipante.btnValidaClick(Sender: TObject);
var
  vDadosProntos : TArrayImportacao;
  bHabImporta   : boolean;
  iNumFalhas    : integer;
begin

  iNumFalhas := 0;
  setlength(vDadosProntos, 0);

  ValidaArquivo(iNumFalhas, vDadosProntos);

  // inicia a importação
  if lstValidaArquivo.count > 0 then
  begin
    bHabImporta := (iNumFalhas = 0) and (length(vDadosProntos) > 0);

    if MostraResultados('Validação e Importação do Arquivo', true, bHabImporta, lstValidaArquivo) = mrOk then
    begin
      if ImportaAcaoJudicial(vDadosProntos, true, taParticipante) then
      begin
        MsgDlg('Arquivo importado com sucesso.', 'Informação', mtInformation, [mbOk], 0);

        setlength(vDadosProntos, 0);
        btnValida.enabled := false;
      end;
    end;
  end;
end;

procedure TfrmCadContribParticipante.ValidaArquivo(var iNumFalhas: integer; var vDadosProntos: TArrayImportacao);
var
  Excel, oSheet : Variant;
  iLinha, iCol  : integer;
  sCampo        : string;
  TipoColuna    : TTipoDado;
  TipoOpcao     : TOpcaoColuna;
  sValor        : string;
  sPreparo      : integer;
  sAnoMesVig    : string;
  DadosImportacao : TRecDadosNucleo;
  bErro         : boolean;
  sMensagem     : string;
begin
  inherited;

  if odAbreArq.FileName = '' then
     exit;

  Screen.Cursor := crHourGlass;

  lstValidaArquivo.Clear;

  // definindo numero de colunas do arquivo e cabeçalho
  SetLength(vColunasArq, 10);
  for iCol := Low(vColunasArq) to High(vColunasArq) do
  begin
    case iCol of
      0 : sCampo := 'MATRICULA';
      1 : sCampo := 'IDPESSJUR';
      2 : sCampo := 'IDPLANOPREV';
      3 : sCampo := 'IDCONTRIBUICAO';
      4 : sCampo := 'FLGPREPARO';
      5 : sCampo := 'PERCENTUAL';
      6 : sCampo := 'ANOMESINICIO';
      7 : sCampo := 'ANOMESFIM';
      8 : sCampo := 'IDMOTIVO';
      9 : sCampo := 'OBS';
    end;
    vColunasArq[iCol] := sCampo;
  end;

  // definindo o tipo das colunas
  SetLength(vColunaTipo, 10);
  for iCol := Low(vColunaTipo) to High(vColunaTipo) do
  begin
    case iCol of
              0,9 : TipoColuna := tdString;
      1,2,3,4,5,8 : TipoColuna := tdInteger;
              6,7 : TipoColuna := tdDate;
    end;
    vColunaTipo[iCol] := TipoColuna;
  end;

  // definindo a obrigatoriedade das colunas
  SetLength(vColunaOpcao, 10);
  for iCol := Low(vColunaOpcao) to High(vColunaOpcao) do
  begin
    case iCol of
      5,7,9: TipoOpcao := ocOpcional;
       else  TipoOpcao := ocObrigatoria;
    end;
    vColunaOpcao[iCol] := TipoOpcao;
  end;

  // Cria o objeto
  Excel := CreateOleObject('Excel.application');
  Excel.Visible := False;
  // Abre o Arquivo
  Excel.WorkBooks.Open(ExpandUNCFileName(odAbreArq.FileName),1);

  // Indica a partir de qual linha começar a pegar os registros
  iLinha := 2;

  try
     // Valida o layout do arquivo excel
     if ValidaLayout(Excel, vColunasArq) then
     begin
       lstValidaArquivo.Add('Resultado Validação do Arquivo de Importação:');
       lstValidaArquivo.Add( edtNomeArq.text );
       lstValidaArquivo.Add('');

       if UltimaLinha(Excel, iLinha, 11, length(vColunasArq)) then
       begin
         lstValidaArquivo.Add('O arquivo selecionado não possui informações.');
         inc(iNumFalhas);
       end
       else
       begin

         while not UltimaLinha(Excel, iLinha, 11, length(vColunasArq)) do
         begin
           //zerando valores
           DadosImportacao.iIdPessoa    := -1;
           DadosImportacao.iIdPessJur   := -1;
           DadosImportacao.iIdPlanoPrev := -1;
           DadosImportacao.iIdContrib   := -1;
           DadosImportacao.sPreparo     := '';
           DadosImportacao.iPercentual  := -1;
           DadosImportacao.sAnoMesIni   := '';
           DadosImportacao.sAnoMesFim   := '';
           DadosImportacao.iIdMotivo    := -1;
           DadosImportacao.sObservacao  := '';
           setlength(DadosImportacao.iIdNucleo, 1);

           // validando o tipo de dado das colunas e preenchimento
           for iCol := Low(vColunasArq) to High(vColunasArq) do
           begin
             case iCol of
                4 : DadosImportacao.sPreparo := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLinha, iCol+1].Value));
                5 : if DadosImportacao.sPreparo = '2' then
                       vColunaOpcao[iCol] := ocObrigatoria
                    else
                       vColunaOpcao[iCol] := ocOpcional;
             end;

             if ValidaDadosColuna(iLinha, iCol+1, Excel, vColunasArq[iCol], vColunaTipo[iCol], vColunaOpcao[iCol], lstValidaArquivo, iNumFalhas) then
             begin

               sValor := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[iLinha, iCol+1].Value));

               // valida regras especificas do campo
               case iCol of
                 0 : begin
                       // Validando a MATRICULA
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = ' + QuotedStr(sValor));
                       qryAux.Open;

                       if qryAux.IsEmpty then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': A campo MATRICULA ' + sValor + ' não foi localizado na base de dados..');
                         inc(iNumFalhas);
                         DadosImportacao.iIdPessoa := -1;
                       end
                       else
                         DadosImportacao.iIdPessoa := qryAux.Fields[0].AsInteger;
                     end;
                 1 : begin
                       //Validando IDPESSJUR
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT IDPESSJUR, IDCONTRIBUICAO, IDPESSOA, IDPLANOPREV ');
                       qryAux.SQL.Add('  FROM CONTRIBPREVPARTP');
                       qryAux.SQL.Add(' WHERE IDPESSOA  = '+IntToStr(DadosImportacao.iIdPessoa));
                       qryAux.SQL.Add('   AND IDPESSJUR = '+sValor );
                       qryAux.Open;

                       if qryAux.IsEmpty then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo IDPESSJUR ' + sValor + ' não foi localizado na base de dados..');
                         inc(iNumFalhas);
                         DadosImportacao.iIdPessJur := -1;
                       end
                       else
                         DadosImportacao.iIdPessJur := qryAux.Fields[0].AsInteger;
                     end;
                 2 : begin
                       //Validando IDPLANOPREV
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT IDPLANOPREV, IDPESSJUR, IDCONTRIBUICAO, IDPESSOA ');
                       qryAux.SQL.Add('  FROM CONTRIBPREVPARTP');
                       qryAux.SQL.Add(' WHERE IDPESSOA    = '+IntToStr(DadosImportacao.iIdPessoa));
                       qryAux.SQL.Add('   AND IDPESSJUR   = '+IntToStr(DadosImportacao.iIdPessJur));
                       qryAux.SQL.Add('   AND IDPLANOPREV = '+sValor );
                       qryAux.Open;

                       if qryAux.IsEmpty then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo IDPLANOPREV ' + sValor + ' não foi localizado na base de dados..');
                         inc(iNumFalhas);
                         DadosImportacao.iIdPlanoPrev := -1;
                       end
                       else
                         DadosImportacao.iIdPlanoPrev := qryAux.Fields[0].AsInteger;
                     end;
                 3 : begin
                       // Validando IDCONTRIBUICAO
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT IDCONTRIBUICAO, IDPLANOPREV, IDPESSJUR, IDPESSOA ');
                       qryAux.SQL.Add('  FROM CONTRIBPREVPARTP');
                       qryAux.SQL.Add(' WHERE IDPESSOA    = '+IntToStr(DadosImportacao.iIdPessoa));
                       qryAux.SQL.Add('   AND IDPESSJUR   = '+IntToStr(DadosImportacao.iIdPessJur));
                       qryAux.SQL.Add('   AND IDPLANOPREV = '+IntToStr(DadosImportacao.iIdPlanoPrev));
                       qryAux.SQL.Add('   AND IDCONTRIBUICAO = '+sValor );
                       qryAux.Open;
                       if qryAux.IsEmpty then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': Não existe associação de participante e contribuição parametrizados.');
                         inc(iNumFalhas);
                         DadosImportacao.iIdContrib := -1;
                       end
                       else
                         DadosImportacao.iIdContrib := qryAux.Fields[0].AsInteger;
                     end;
                 4 : begin
                       //Validando FLGPREPARO
                       if not (StrToInt(DadosImportacao.sPreparo) in [0, 1, 2]) then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo FLGPREPARO ' + sValor + ' está inconsistente.');
                         inc(iNumFalhas);
                         DadosImportacao.sPreparo := '';
                       end;
                     end;
                 5 : begin
                       //Validando PERCENTUAL
                       DadosImportacao.iPercentual := StrToIntDef(sValor, -1);
                       if (DadosImportacao.iPercentual > 100) then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo PERCENTUAL ' + sValor + ' está inconsistente.');
                         inc(iNumFalhas);
                       end
                       else if (DadosImportacao.sPreparo = '2') and (DadosImportacao.iPercentual = -1) then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo PERCENTUAL é obrigatório.');  // + IIF(sValor='', '<vazio>', sValor)+ ' está inconsistente.');
                         inc(iNumFalhas);
                       end;
                     end;
                 6 : begin
                       //Validando ANOMESINICIO
                       if AcaoJudicialVigentePessoa(DadosImportacao.iIdPessoa, DadosImportacao.iIdPessJur, DadosImportacao.iIdPlanoPrev, DadosImportacao.iIdContrib, sAnoMesVig) then
                       begin
                         if sAnoMesVig > sValor then
                         begin
                           lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo ANOMESINICIO ' + sValor + ' é menor que a ação vigente.');
                           inc(iNumFalhas);
                           DadosImportacao.sAnoMesIni := '';
                         end
                         else
                            DadosImportacao.sAnoMesIni := sValor;
                       end
                       else
                         DadosImportacao.sAnoMesIni := sValor;
                     end;
                 7 : begin
                       //Validando ANOMESFIM
                       if (sValor <> EmptyStr) and (sValor < DadosImportacao.sAnoMesIni) then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo ANOMESFIM ' + sValor + ' é menor que o campo ANOMESINICIO.');
                         inc(iNumFalhas);
                         DadosImportacao.sAnoMesFim := '';
                       end
                       else
                         DadosImportacao.sAnoMesFim := sValor;
                     end;
                 8 : begin
                       //Validando IDMOTIVO
                       qryAux.Close;
                       qryAux.SQL.Clear;
                       qryAux.SQL.Add('SELECT COUNT(IDMOTIVO) FROM MOTIVO WHERE  FLGTIPO = ''P'' AND IDMOTIVO = '+sValor );
                       qryAux.open;

                       if qryAux.Fields[0].AsInteger = 0 then
                       begin
                         lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) + ': O campo IDMOTIVO ' + sValor + ' não foi localizado na base de dados.');
                         inc(iNumFalhas);
                         DadosImportacao.iIdMotivo := -1;
                       end
                       else
                         DadosImportacao.iIdMotivo := StrToInt(sValor);
                     end;
                 9 : begin
                       //Validando OBS
                       DadosImportacao.sObservacao := sValor;
                     end;
               end;
             end;
           end;

           // verifica se dados preenchidos corretamente para importacao
           if (DadosImportacao.iIdPessoa <> -1)    and (DadosImportacao.iIdContrib <> -1)  and
              (DadosImportacao.sPreparo <> '')     and (DadosImportacao.iPercentual <> -1) and
              (DadosImportacao.sAnoMesIni <> '')   and (DadosImportacao.iIdMotivo <> -1)   and
              (DadosImportacao.sObservacao <> '')  and (DadosImportacao.iIdPessJur <> -1)  and
              (DadosImportacao.iIdPlanoPrev <> -1) then
           begin
             bErro := DadosDuplicados('CONTRIBPARTPACJUDDEFICIT', qryAux, DadosImportacao, taParticipante, -1);
             if not bErro then
                bErro := DadosDuplicados(DadosImportacao, taParticipante, vDadosProntos);

             if bErro then
                lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) +': Registro duplicado e não importado.');

             if not bErro then
             begin
               bErro := VerificaDataIniValida('CONTRIBPARTPACJUDDEFICIT', qryAux, DadosImportacao, taParticipante, vDadosProntos, sMensagem);
               if bErro then
                  lstValidaArquivo.Add('LINHA ' + IntToStr(iLinha) +': '+sMensagem );
             end;

             if not bErro then
             begin
               setlength(vDadosProntos, high(vDadosProntos)+2);

               vDadosProntos[high(vDadosProntos)].iIdPessoa    := DadosImportacao.iIdPessoa;
               vDadosProntos[high(vDadosProntos)].iIdPessJur   := DadosImportacao.iIdPessJur;
               vDadosProntos[high(vDadosProntos)].iIdPlanoPrev := DadosImportacao.iIdPlanoPrev;
               vDadosProntos[high(vDadosProntos)].iIdContrib   := DadosImportacao.iIdContrib;
               vDadosProntos[high(vDadosProntos)].sPreparo     := DadosImportacao.sPreparo;
               vDadosProntos[high(vDadosProntos)].iPercentual  := DadosImportacao.iPercentual;
               vDadosProntos[high(vDadosProntos)].sAnoMesIni   := DadosImportacao.sAnoMesIni;
               vDadosProntos[high(vDadosProntos)].sAnoMesFim   := DadosImportacao.sAnoMesFim;
               vDadosProntos[high(vDadosProntos)].iIdMotivo    := DadosImportacao.iIdMotivo;
               vDadosProntos[high(vDadosProntos)].sObservacao  := DadosImportacao.sObservacao;
               vDadosProntos[high(vDadosProntos)].iIdNucleo    := DadosImportacao.iIdNucleo;
             end
             else
               inc(iNumFalhas);

           end;
           // Contador de linha
           inc(iLinha);
         end;
       end;

       lstValidaArquivo.Add('------------------------------------------------------------------');
       lstValidaArquivo.Add('Total de inconsistências: '+IntToStr(iNumFalhas));

     end
     else
     begin
       MsgDlg('Arquivo não está no formato Excel ou não está com o layout correto.', 'Atenção', mtInformation, [mbOk], 0);
     end;

  finally
     Excel.ActiveWorkBook.Saved:= 1;
     Excel.DisplayAlerts:= 0;
     Excel.ActiveWorkBook.Close(SaveChanges:= 0);
     Excel.Workbooks.Close;
     Excel.Quit;
     Excel := Unassigned;
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContribParticipante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(lstValidaArquivo) ;
end;

procedure TfrmCadContribParticipante.bbtnSairClick(Sender: TObject);
begin
  inherited;
  {se chamou direito pelo menu do Contrib, rollback na transação}
  if (bAcessoViaMenu) and (dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.Rollback;

end;
//edilaine - SIG36752 - fim



end.




