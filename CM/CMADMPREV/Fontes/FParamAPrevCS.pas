// *****************************************************************************
// **************************** REGISTRO DE ALTERAÇÕES *************************
// *****************************************************************************
{-------------------------------------------------------------------------------
Alteração  : remover grpSaidaEmail, edtSaidaEmail e o campo EMAILTRATDIVERG
Nº SOL.....: 253577-17744
KTN / PPM  : 1063636
Data       : 04/01/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - inadimplencia
-------------------------------------------------------------------------------}
//  Nº SOL: 240582
//  Nº PPM: 563271
//  Data da Alteração: 29/10/2014
//  Alteração Form: Inclusão de grpSaidaEmail, edtSaidaEmail, layout, inclusao
//                  do campo EMAILTRATDIVERG no sql da qry (TWWQuery)
//  Responsável:    Helio Lima Custodio
//  Descrição:      Inclusão da campo de caixa de saida de e-mail
//------------------------------------------------------------------------------
//  Autor      : Hugo Luna
//  Data       : 18/10/2007
//  Pendência  : 26560
//  Descrição  : criação do campo FLGCONTROLERUB
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 04/09/2007
// Rotina      : PessoaChangeSubtipo
// Pendencia   : 22119
// Alteração   : Confirmar que a FrmAguarde seja sempre fechada qdo terminar a uma operação
//--------------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 10/02/2006
//  Pendência  : 19533
//  Descrição  : criação do campo FLGATUPERCGF
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 10/11/2005
//  Pendência  : 18306
//  Descrição  : Alteção do caption do GroupBox15 para tirar o texto Coletivo.
//               Incluido obs indicado que é um parâmetro para uso no padrão
//               de movimentação de reservas
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Data       : 08/09/2005
//  Pendência  : 19233
//  Descrição  : Criação de um campo para permitir informar o motivo de abono para
//               folha da fundação.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 13/06/2005
//  Pendência  : 18853
//  Descrição  : Criação de um campo novo para informar se a fundação não irá
//               efetuar acertos de contribuição quando for evento de Demissão da
//               Patrocinadora. Campo criado: FLGNAOACERTCONTDP
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 31/05/2005
//  Pendência  : 18061
//  Descrição  : Criação de um campo novo para permitir que a fundação opte por
//               permitir que o salário do participante fique zerado no momento
//               da inscrição.
//------------------------------------------------------------------------------
//  Autor      : Leonardo
//  Data       : 11/04/2005
//  Descrição  : criação do parâmero que indica se as contribuições da fundação devem
//               gerar integração contábil/financeira ( FLGINTFUNDACAO )
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Data       : 15/03/2005
//  Descrição  : Alteração de lugar dos parâmetros de Percentual Mínimo e Máximo
//               para Parcelamento de contribuições, que foram retirados da guia
//               compra de carências dentro da guia de motivos e colocadas na
//               guia de contribuições.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 18/01/2005
//  Descrição  : criação do campo IDPESSOAREPASSE (Identificador do recebedor do reembolso)
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 07/01/2005
//  Pendência  : 18306
//  Descrição  : Criação de um campo novo para aceitar reservas coletivas negativas.
//               Campo criado: FLGRESNEGATIVA
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 17/12/2004
//  Pendência  : 18297
//  Descrição  : Inserção do campo FLGACUMALTER no UPD da QRY.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 13/12/2004
//  Pendência  : 18175
//  Descrição  : criação do campo IDPESSOAINSS (Identificador do INSS)
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 02.12.2004
//  Pendência  : 16940
//  Descrição  : criação do campo IDMOTIVOQUITANT (Motivo para Quitação Automática
//               de Benefícios)
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 11/08/2004
//  Pendência  : ---
//  Descrição  : criação do campo FLGINFCONTABINDIV
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 10.08.2004
//  Pendência  : 17358
//  Descrição  : . Criacao de parametro "Permitir Retenção Anterior a Ult. Pagamento"
//               . Criacao de parametro "Recalcular Benefícios na Liberação de Retidos"
//               . Criacao de parametro "Recalcular Benefícios na Liberação de Retidos
//                 inclusive dos Beneficiários que não eram retidos"
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 03/06/2004
//  Pendência  : ---
//  Descrição  : criação do campo FLGACUMALTER
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 19/05/2004
//  Pendência  : ---
//  Descrição  : criação do campo IDRGCONTABBENEF
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 05/05/2004
//  Pendência  : ---
//  Descrição  : criação do campo IDMOTIVOACERTOTP  
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 05/05/2004
//  Pendência  : ---
//  Descrição  : criação dos campos IDRGDIGMATPENS,MASCMATPENS ,FLGINCAUTMATPENS 
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 04.05.2004
//  Pendência  : ---
//  Descrição  : Retirada dos motivos de folha que estão nesse sistema
//               Retirada da pasta Rubricas pois esses parametros estão na folha
//               e não são usados pelo AdmPREV
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 04.05.2004
//  Pendência  : ---
//  Descrição  : Retirada da pasta Motivo | Emprestimo pois não era usada
//               pelo emprestimo
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 29/04/2004
//  Pendência  : ---
//  Descrição  : criação do campo IDRGMARGEMCONSIG (Regra de cálculo da margem para parcelamento de dívida na revisão)
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 06/04/2004
//  Pendência  : 16429
//  Descrição  : Criação de um parâmetro para indicar se as opções de contribuição
//               devem vir preenchidas ou não na REINSCRIÇÃO.
//------------------------------------------------------------------------------
//  Autor      : Ricardo Vigorito
//  Data       : 22/01/2004
//  Pendência  : 15568
//  Descrição  : Foi incluido o componte TDBCHECKBOK, para realizar a manutençao
//                do parametro FLGPATROFOLHA da tabela PARAMAPREV
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 26/11/2003
//  Pendência  : 15652
//  Descrição  : Inclusão do campo FLGCONTATEMPINSC na qry principal;
//               Criação do checkbox "Conta Tempo de Serviço na Inscrição do Participante"
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 17/09/2003
//  Descrição  : inclusao dos motivos de acerto e devolucao de contribuição(IDMOTIVOATRASO, IDMOTIVODEVOLUC)
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Data       : 05/08/2003
//  Pendência  : 14780
//  Descrição  : Acerto no Update na ParamAPrev - Retirado o campo
//               IDMOTIVOPARCELA_1 e feito o update tendo como condição o IdFundacao
//------------------------------------------------------------------------------
//  Autor      : Carlos Guedes
//  Data       : 26/03/2003
//  Descrição  : Criando parâmetro QTDDIASRETRBENEF. Pendência: 13113
//------------------------------------------------------------------------------
//  Autor      : Carlos Guedes
//  Data       : 25/03/2003
//  Descrição  : Criando parâmetro IDTPPGBENVITAL para armazenar o tipo de pagamento
//    de benefício vitalício. Pendência: 13115
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Data       : 14.01.2003
//  Descrição  : Criação dos parametros IDMOTIVOACERTOFL e FLGTIPOACERTOFL
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Data       : 27.11.2002
//  Descrição  : inclusão dos motivos de parcelamento
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 05/06/2002
// Alteração   : tratamento do parâmetro IDMOTIVOSALMANUT
//------------------------------------------------------------------------------
//  Autor      : Carlos Gleyber Macedo de Mesquita
//  Data       : 01.02.2002
//  Descrição  : Criação dos campos Regra para Cálculo de Maioridade e Grau de
//               Instrução correspondente a universitário
//------------------------------------------------------------------------------
// Autora      : Camille
// Data        : 03.04.2002
// Alteração   : Criação dos campos "Atualizar matrículas dos funcionários da
//               fundação no Previdenciário" e "Gerar rubricas de contribuição e
//               benefícios automaticamente"".
//------------------------------------------------------------------------------
// Autora      : Carlos Gleyber Macedo de Mesquita
// Data        : 17.06.2002
// Alteração   : Criação do campo "Cobrar Contribuição no Evento Auxílio Doença.
//               Pendência: 7223 (FCRT)
// *****************************************************************************

unit FParamAPrevCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Wwdbspin, DBCtrls, Wwdotdot,
  Wwdbcomb, Mask, wwdbedit, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  ComCtrls, TREdit,

  uVerificaPreenchimento; //Helio - SOL Nº 240582 PPM Nº 563271


type
  TfrmParamAPrevCS = class(TfrmCadastroCS)
    qryDescontos: TwwQuery;
    qryAux: TwwQuery;
    qryMotivo: TwwQuery;
    qryRegra: TwwQuery;
    qryTpReserva: TwwQuery;
    qryRubricas: TwwQuery;
    qryTipoDocPessoa: TwwQuery;
    qryProventos: TwwQuery;
    pgctrlParam: TPageControl;
    tbsGeral: TTabSheet;
    pnlGerais: TPanel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    gbPrevidenciario: TGroupBox;
    dbcbFlgIntContab: TDBCheckBox;
    dbcbFlgIntCPagarPrev: TDBCheckBox;
    dbcbFLGINTCRECEBERPR: TDBCheckBox;
    gbDocumentoSpc: TGroupBox;
    Label22: TLabel;
    dblkpcmbNomeDocumento: TwwDBLookupCombo;
    tbsContrib: TTabSheet;
    pnlContribuicoes: TPanel;
    grpTpReserva: TGroupBox;
    Panel2: TPanel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    pnlMascara: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edInput: TEdit;
    edDisplay: TEdit;
    tbsBenef: TTabSheet;
    pnlBeneficios: TPanel;
    dbrgpSimulaBenef: TDBRadioGroup;
    tbsMotivos: TTabSheet;
    pnlMotivos: TPanel;
    PageControl1: TPageControl;
    tbsMotivoContrib: TTabSheet;
    Panel1: TPanel;
    Label9: TLabel;
    Label2: TLabel;
    dblkpcmbMotivoNormalPREV: TwwDBLookupCombo;
    dblkpcmbDIVERGPREV: TwwDBLookupCombo;
    tbsMotivoFolha: TTabSheet;
    Panel3: TPanel;
    Label18: TLabel;
    Label47: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    tbsINSS: TTabSheet;
    pnlFundoINSS: TPanel;
    grpOpcaoINSS1: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    dbedNomeBINSS1: TwwDBEdit;
    dbchkEditaINSS1: TDBCheckBox;
    dblkpcmbRgBINSS1: TwwDBLookupCombo;
    grpOpcaoINSS2: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    dbedNomeBINSS2: TwwDBEdit;
    dbchkEditaINSS2: TDBCheckBox;
    dblkpcmbRgBINSS2: TwwDBLookupCombo;
    grpOpcaoINSS3: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    dbedNomeBINSS3: TwwDBEdit;
    dbchkEditaINSS3: TDBCheckBox;
    dblkpcmbRgBINSS3: TwwDBLookupCombo;
    GroupBox6: TGroupBox;
    Label46: TLabel;
    dbspinNumOPINSS: TwwDBSpinEdit;
    DBCheckBox5: TDBCheckBox;
    GroupBox1: TGroupBox;
    DbrgPesquisa: TDBRadioGroup;
    Label13: TLabel;
    dblcDocumento: TwwDBLookupCombo;
    qryDocumento: TwwQuery;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    dblcRegraRetencao: TwwDBLookupCombo;
    qryGrau: TwwQuery;
    GroupBox4: TGroupBox;
    Label23: TLabel;
    wwDBLookupCombo12: TwwDBLookupCombo;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    TabSheet1: TTabSheet;
    Panel6: TPanel;
    Label3: TLabel;
    wwDBLookupCombo13: TwwDBLookupCombo;
    GroupBox5: TGroupBox;
    dbckCobraContADoenca: TDBCheckBox;
    tbMotivoParcelamento: TTabSheet;
    Label4: TLabel;
    cmbMotivoParcela: TwwDBLookupCombo;
    Label25: TLabel;
    cmbMotivoQuitacao: TwwDBLookupCombo;
    Label26: TLabel;
    cmbMotivoAmortiza: TwwDBLookupCombo;
    dbrgrpTipoAcertoFL: TDBRadioGroup;
    Label27: TLabel;
    wwDBLookupCombo14: TwwDBLookupCombo;
    GroupBox8: TGroupBox;
    wwDBLookupCombo15: TwwDBLookupCombo;
    qryTpPagto: TwwQuery;
    GroupBox9: TGroupBox;
    wwDBEdit1: TwwDBEdit;
    Label29: TLabel;
    GroupBox10: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    wwDBLookupCombo17: TwwDBLookupCombo;
    wwDBLookupCombo18: TwwDBLookupCombo;
    qryGrupoRubricas: TwwQuery;
    GroupBox11: TGroupBox;
    cboxGrupoRubrica: TwwDBLookupCombo;
    DBCheckBox10: TDBCheckBox;
    tbsNaoGravavel: TTabSheet;
    Label51: TLabel;
    edNumTentativas: TEdit;
    GroupBox12: TGroupBox;
    dbckCobracontpatr: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    grpMatPensionista: TGroupBox;
    Label1: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    wwDBEdit4: TwwDBEdit;
    Label5: TLabel;
    Label11: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    dbchkMatPensionista: TDBCheckBox;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    cmbRegraMargemParc: TwwDBLookupCombo;
    Label12: TLabel;
    cmbRgContabBenef: TwwDBLookupCombo;
    dbckhFlgRetDataant: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label10: TLabel;
    Label14: TLabel;
    wwDBLookupCombo5: TwwDBLookupCombo;
    GroupBox14: TGroupBox;
    MSIdentPESSOA: TMontaSelect;
    EdNomeINSS: TEdit;
    BtProcuraINSS: TToolbarButton97;
    GroupBox3: TGroupBox;
    dbchkAcumAlter: TDBCheckBox;
    GroupBox13: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    GroupBox15: TGroupBox;
    dbckAceitaReservaNegativa: TDBCheckBox;
    GroupBox16: TGroupBox;
    EdNomePessoaRepasse: TEdit;
    BtProcuraRecebedor: TToolbarButton97;
    grbInfParcelamento: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label33: TLabel;
    Label39: TLabel;
    wwDBEdit3: TwwDBEdit;
    Label32: TLabel;
    chkbxflgintfundacao: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    GroupBox17: TGroupBox;
    DBCheckBox12: TDBCheckBox;
    dblkMotivoAbonoFolhaFund: TwwDBLookupCombo;
    Label15: TLabel;
    DbChbxAtualizaGF: TDBCheckBox;
    Label16: TLabel;
    DBCheckBox13: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure edInputKeyPress(Sender: TObject; var Key: Char);
    procedure edInputExit(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure pgctrlParamChange(Sender: TObject);
    procedure dbspinNumOPINSSChange(Sender: TObject);
    procedure DbrgPesquisaClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure edNumTentativasExit(Sender: TObject);
    procedure dbchkMatPensionistaClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BtProcuraINSSClick(Sender: TObject);
    procedure BtProcuraRecebedorClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);

  private
    { Private declarations }
    //Helio - SOL Nº 240582 PPM Nº 563271
    function ValidaEMail(Const EMailIn : String) : Boolean;
    //function VerificaPreenchimentoEmail : Boolean;    // edilaine - SOL 253577-17744 / PPM 1063636 - comentado
    //FIM Helio - SOL Nº 240582 PPM Nº 563271
  public
    { Public declarations }
  end;

const
   mascara : set of char = ['9','.'];
   letra   : set of char = ['A'..'z'];
   numero  : set of char = ['0'..'9'];


var
  frmParamAPrevCS: TfrmParamAPrevCS;

implementation


uses fAguarde, UAdmPrev, UMensErro, USistema;

{$R *.DFM}

procedure TfrmParamAPrevCS.FormShow(Sender: TObject);
var i : integer;
    sInput : string;

begin
  inherited;
  qryTpPagto.Close;
  qryTpPagto.Open;
  qryGrupoRubricas.Open;

  qryDocumento.Close;
  qryDocumento.Open;
  qryMotivo.Close;
  qryMotivo.Open;
  qryGrau.Close;
  qryGrau.Open;
  qryDescontos.Close;
  qryDescontos.SQL.Clear;
  qryproventos.Close;
  qryproventos.SQL.Clear;
  if (qry.IsEmpty) or (not prmflgMultiFundacao)
  then begin

     qryDescontos.SQL.Add(' SELECT P.IDPROVENTO,P.DESCRICAO '+
                          ' FROM PROVDESC P '+
                          ' WHERE P.FLGDESCONTO = 1 '+
                          ' ORDER BY (P.DESCRICAO) ');

     qryproventos.SQL.Add(' SELECT P.IDPROVENTO,P.DESCRICAO '+
                          ' FROM PROVDESC P '+
                          ' WHERE P.FLGDESCONTO = 0'+
                          ' ORDER BY (P.DESCRICAO) ');
  end
  else begin // Monofundacao
     qryDescontos.SQL.Add(' SELECT P.IDPROVENTO,P.DESCRICAO '+
                          ' FROM PROVDESC P, RUBRICAXPESS R '+
                          ' WHERE R.IDPESSOA = '+IntToStr(iIdFundacao)+' AND '+
                          '       P.FLGDESCONTO = 1 AND '+
                          '       R.IDRUBRICA = P.IDPROVENTO '+
                          ' ORDER BY (P.DESCRICAO) ');

      qryproventos.SQL.Add(' SELECT P.IDPROVENTO,P.DESCRICAO '+
                          ' FROM PROVDESC P, RUBRICAXPESS R '+
                          ' WHERE R.IDPESSOA = '+IntToStr(iIdFundacao)+' AND '+
                          '       P.FLGDESCONTO = 0 AND '+
                          '       R.IDRUBRICA = P.IDPROVENTO '+
                          ' ORDER BY (P.DESCRICAO) ');
  end;
  
  qryDescontos.Open;
  qryproventos.Open;
  qryRubricas.Close;
  qryRubricas.SQL.Clear;
  if (qry.IsEmpty) or (prmflgMultiFundacao)
  then begin

     qryRubricas.SQL.Add(' SELECT P.IDPROVENTO,P.DESCRICAO '+
                         ' FROM PROVDESC P '+
                         ' WHERE P.FLGDESCONTO = 0 '+
                         ' ORDER BY (P.DESCRICAO) ');
  end
  else begin // Monofundacao
     qryRubricas.SQL.Add(' SELECT P.IDPROVENTO,P.DESCRICAO '+
                         ' FROM PROVDESC P, RUBRICAXPESS R '+
                         ' WHERE P.FLGDESCONTO = 0 AND '+
                         '       R.IDPESSOA = '+IntToStr(iIdFundacao)+' AND '+
                         '       R.IDRUBRICA = P.IDPROVENTO '+
                         ' ORDER BY (P.DESCRICAO) ');
  end;
  qryRubricas.Open;

  { Se houver algum tipo de reserva cadastrado nao pode alterar a mascara}
  qryTpReserva.Close;
  qryTpReserva.Open;

  if not qryTpReserva.IsEmpty
  then begin
     grpTpReserva.Enabled := False;
  end
  else begin
     grpTpReserva.Enabled := True;
  end;

  qryRegra.Close;
  qryRegra.Open;

  qryTipoDocPessoa.Close;
  qryTipoDocPessoa.Open;

  pgctrlParam.ActivePage := tbsGeral;

  qry.Close;
  qry.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qry.Open;

  edInput.Text := qry.FieldByName('MASCTIPORESERVA').AsString;
  if Trim(edInput.Text) = ''
  then edDisplay.Text := ''
  else begin
     sInput := Trim(edInput.Text);
     edDisplay.Text := '';
     for i := 1 to length(sInput)
     do begin
        if sInput[i] = '9'
        then edDisplay.Text := edDisplay.Text+'_'
        else edDisplay.Text := edDisplay.Text+sInput[i];
     end;
  end;
  sbtnAlterar.Enabled := True;
end;

procedure TfrmParamAPrevCS.edInputKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if length(edInput.Text) >= 10 then Exit;

  if key in mascara
  then begin
       case key of
           '.' : edDisplay.Text := edDisplay.Text + '.';
       else
           edDisplay.Text := edDisplay.Text + '_';
       end;
  end
  else begin
     if (key in letra) or (key in numero) then Abort;
     if (key = '-') then Abort;
     if key = #8 { BackSpace }
     then begin
        edDisplay.Text := Copy(edDisplay.Text,1,length(edDisplay.Text)-1);
     end;
  end;


end;

procedure TfrmParamAPrevCS.edInputExit(Sender: TObject);
var i : integer;
    iQtdeNum : integer; // quantidade de numeros na mascara
    sMascara : string;
begin
  inherited;
  if not grpTpReserva.Enabled then Exit;
  { Testar se a Máscara é valida :
    8 números e 12 caracteres no máximo }
   if length(Trim(edInput.Text)) > 12
   then begin
      MsgDlg('A Máscara de Tipo de Reserva deve ter no máximo 12 caracteres.','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlParam.ActivePage := tbsContrib;
     // edInput.SetFocus;
      Exit;
   end;

   sMascara := edInput.Text;
   iQtdeNum := 0;

   for i := 1 to length(sMascara) do
   begin
      if sMascara[i] = '9'
      then inc(iQtdeNum);
   end;
   if iQtdeNum > 8
   then begin
      MsgDlg('A Máscara de Tipo de Reserva deve ter no máximo 8 dígitos.','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlParam.ActivePage := tbsContrib;
      Exit;
   end;

end;

procedure TfrmParamAPrevCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  qry.FieldByName('MASCTIPORESERVA').AsString := edInput.Text;


  if Trim(qry.FieldByName('NomeBInss1').AsString) = ''
  then qry.FieldByName('NomeBInss1').AsString := 'Base de Cálculo';

  if Trim(qry.FieldByName('NomeBInss2').AsString) = ''
  then qry.FieldByName('NomeBInss2').AsString := 'Índice Corretivo';

  if Trim(qry.FieldByName('NomeBInss3').AsString) = ''
  then qry.FieldByName('NomeBInss3').AsString := 'Conteúdo Livre';

  // Adicionando Log Padrao
  Try
    If Not Sistema.GravaLogOperacoes('Parâmetros do Sistema AdmPrev') Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

end;

procedure TfrmParamAPrevCS.pgctrlParamChange(Sender: TObject);
begin
  inherited;
  if pgctrlParam.ActivePage = tbsMotivos then
  begin
     frmAguarde.Mostra('Verificando motivos utilizados ...');

     with qryAux do
     begin
        frmAguarde.Mostra('Verificando Motivo para Cobrança Normal - esta operação pode demorar ...');

        Application.ProcessMessages;

        if qry.FieldByName('IdMotivoContribP').AsInteger > 0 then
        begin
          // VERIFICANDO MOTIVO DE CONTRIBUICAO NORMAL
          Close;
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) AS TOTAL FROM HSTCONTRIBPREV '+
                  'WHERE  IDMOTIVO = '+IntToSTr(qry.FieldByName('IdMotivoContribP').AsInteger));
          Open;
          if (not IsEmpty) and (FieldbyName('Total').AsFloat > 0) then
            dblkpcmbMotivoNormalPREV.Enabled := False
          else
            dblkpcmbMotivoNormalPREV.Enabled := True;
        end;
        frmAguarde.Apaga; 

        frmAguarde.Mostra('Verificando Motivo para Divergências - esta operação pode demorar ...');
        Application.ProcessMessages;
        if qry.FieldByName('IDMOTIVODIVERG').AsInteger > 0
        then begin
           // VERIFICANDO MOTIVO DE DIVERGENCIA
           Close;
           SQL.Clear;
           SQL.Add('SELECT COUNT(*) AS TOTAL FROM HSTCONTRIBPREV '+
                   'WHERE  IDMOTIVO = '+IntToSTr(qry.FieldByName('IDMOTIVODIVERG').AsInteger));
           Open;
           if (not IsEmpty) and (FieldbyName('Total').AsFloat > 0) then
             dblkpcmbDIVERGPREV.Enabled := False
           else
             dblkpcmbDIVERGPREV.Enabled := True;
        end;
        frmAguarde.Apaga;

        frmAguarde.Mostra('Verificando Motivo para Parcelamento - esta operação pode demorar  ...');
        Application.ProcessMessages;
        if qry.FieldByName('IDMOTIVOPARCELA').AsInteger > 0
        then begin
           // VERIFICANDO MOTIVO DE DIVERGENCIA
           Close;
           SQL.Clear;
           SQL.Add('SELECT COUNT(*) AS TOTAL FROM HSTCONTRIBPREV '+
                   'WHERE  IDMOTIVO = '+IntToSTr(qry.FieldByName('IDMOTIVOPARCELA').AsInteger));
           Open;
           if (not IsEmpty) and (FieldbyName('Total').AsFloat > 0) then
             cmbMotivoParcela.Enabled := False
           else
             cmbMotivoParcela.Enabled := True;
        end;
        frmAguarde.Apaga; 

        if qry.FieldByName('IDMOTIVOAMORTIZA').AsInteger > 0
        then begin
           // VERIFICANDO MOTIVO DE DIVERGENCIA
           Close;
           SQL.Clear;
           SQL.Add('SELECT COUNT(*) AS TOTAL FROM HSTCONTRIBPREV '+
                   'WHERE  IDMOTIVO = '+IntToSTr(qry.FieldByName('IDMOTIVOPARCELA').AsInteger));
           Open;
           if (not IsEmpty) and (FieldbyName('Total').AsFloat > 0)
           then cmbMotivoAmortiza.Enabled := False
           else cmbMotivoAmortiza.Enabled := True;
        end;

        if qry.FieldByName('IDMOTIVOQUITACAO').AsInteger > 0
        then begin
           // VERIFICANDO MOTIVO DE DIVERGENCIA
           Close;
           SQL.Clear;
           SQL.Add('SELECT COUNT(*) AS TOTAL FROM HSTCONTRIBPREV '+
                   'WHERE  IDMOTIVO = '+IntToSTr(qry.FieldByName('IDMOTIVOPARCELA').AsInteger));
           Open;
           if (not IsEmpty) and (FieldbyName('Total').AsFloat > 0)
           then cmbMotivoQuitacao.Enabled := False
           else cmbMotivoQuitacao.Enabled := True;
        end;


     end;
     frmAguarde.Apaga;
  end else if pgctrlParam.ActivePage = tbsINSS
       then begin
          dbspinNumOPINSSChange(Sender);
          { Buscar Nome do INSS na Tabela PESSOA }

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add('SELECT RAZAOSOCIAL FROM PESSOA '+
                         'WHERE  IDPESSOA = '+IntToSTr(qry.FieldByName('IDPESSOAINSS').AsInteger));
          QryAux.Open;
          EdNomeINSS.Text := QryAux.FieldByName('RAZAOSOCIAL').AsString;

          { Buscar Nome do Recebedor na Tabela PESSOA }

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add('SELECT RAZAOSOCIAL FROM PESSOA '+
                         'WHERE  IDPESSOA = '+IntToSTr(qry.FieldByName('IDPESSOAREPASSE').AsInteger));
          QryAux.Open;
          EdNomePessoaRepasse.Text := QryAux.FieldByName('RAZAOSOCIAL').AsString;

  end;

end;

procedure TfrmParamAPrevCS.dbspinNumOPINSSChange(Sender: TObject);
begin
  inherited;
  if Trim(dbspinNumOPINSS.Text) = ''
  then begin
     dbspinNumOPINSS.Text  := '3';
     dbspinNumOPINSS.Value := 3;
  end;

  grpOpcaoINSS1.Visible := (dbspinNumOPINSS.Value >= 1) ;
  grpOpcaoINSS2.Visible := (dbspinNumOPINSS.Value >= 2) ;
  grpOpcaoINSS3.Visible := (dbspinNumOPINSS.Value >= 3) ;

  if grpOpcaoINSS1.Visible and (Trim(dbedNomeBINSS1.Text) = '' )
  then begin
     dbedNomeBINSS1.Text                    := 'Base de Cálculo';
     if qry.State in [dsInsert, dsEdit] then qry.FieldByName('NomeBInss1').AsString := 'Base de Cálculo';
  end;

  if grpOpcaoINSS2.Visible and (Trim(dbedNomeBINSS2.Text) = '' )
  then begin
     dbedNomeBINSS2.Text                    := 'Índice Corretivo';
     if qry.State in [dsInsert, dsEdit] then qry.FieldByName('NomeBInss2').AsString := 'Índice Corretivo';
  end;

  if grpOpcaoINSS3.Visible and (Trim(dbedNomeBINSS3.Text) = '' )
  then begin
     dbedNomeBINSS3.Text                    := 'Conteúdo Livre';
     if qry.State in [dsInsert, dsEdit] then qry.FieldByName('NomeBInss3').AsString := 'Conteúdo Livre';
  end;
end;

procedure TfrmParamAPrevCS.DbrgPesquisaClick(Sender: TObject);
begin
  inherited;

  If DbrgPesquisa.ItemIndex = 1
   Then dblcDocumento.Enabled:=True
   Else
    Begin
     dblcDocumento.DisplayValue:='';
     dblcDocumento.Value:='';
     dblcDocumento.Enabled:=False;
    End;

end;

procedure TfrmParamAPrevCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
{    Na aba benefício, verifica qual o tipo de busca indicado; se o tipo de documento       }
{    escolhido for matricula, o combo do tipo de documento ficará desabilitado.             }

  If DbrgPesquisa.ItemIndex = 1
   Then dblcDocumento.Enabled:=True
   Else dblcDocumento.Enabled:=False;

end;

procedure TfrmParamAPrevCS.edNumTentativasExit(Sender: TObject);
begin
  inherited;
  MsgDlg('ATENÇÃO : '+ #13+
         'Esta alteração só será válida durante a conexão atual no AdmPrev.','Informação',mtInformation,[mbOK],0);
  prmNumTentativasSalario:= StrToInt(edNumTentativas.Text);
end;

procedure TfrmParamAPrevCS.dbchkMatPensionistaClick(Sender: TObject);
begin
  inherited;
  grpMatPensionista.visible := dbchkMatPensionista.checked;
end;

procedure TfrmParamAPrevCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  grpMatPensionista.visible := dbchkMatPensionista.checked;
end;

procedure TfrmParamAPrevCS.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  LeParam('BaseDados', False); 
end;

procedure TfrmParamAPrevCS.BtProcuraINSSClick(Sender: TObject);
begin
  inherited;
  MSIdentPESSOA.Executar;
  if MSIdentPESSOA.RetornouValor then begin
    EdNomeINSS.Text := MSIdentPESSOA.ValoresChave[2];
    Qry.FieldByName('IDPESSOAINSS').AsString := MSIdentPESSOA.ValoresChave[0];
  end;
end;

procedure TfrmParamAPrevCS.BtProcuraRecebedorClick(Sender: TObject);
begin
  inherited;
  MSIdentPESSOA.Executar;
  if MSIdentPESSOA.RetornouValor then begin
    EdNomePessoaRepasse.Text := MSIdentPESSOA.ValoresChave[2];
    Qry.FieldByName('IDPESSOAREPASSE').AsString := MSIdentPESSOA.ValoresChave[0];
  end;
end;

//Helio - SOL Nº 240582 PPM Nº 563271
function TfrmParamAPrevCS.ValidaEMail(const EMailIn : String) : Boolean;
const
  CaraEsp: array[1..42] of string[1] =
  ( '!','#','$','%','¨','&','*',
  '(',')','+','=','§','¬','¢','¹','²',
  '³','£','´','`','ç','Ç',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  'º','ª','°','é','ó');
var
  i,cont,t, posPonto   : integer;
  EMail                : ShortString;
begin
  EMail  := PChar(EMailIn);
  Result := True;
  cont   := 0;
  t      := Length(EMail);
  posPonto := 999;

  if EMail <> '' then

    //O texto digitado deve possuir, no mínimo, dois caracteres antes do final
    if Length(EMail) >= 1 then
        if (Email[t] = '.') or (Email[t-1] = '.') then
             Result := False;

    //o ultimo ponto deve vir depois do arroba
    {if (Pos('@', EMail) > Pos('.', EMail)) then
        Result := False;}

    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then    // existe @ .
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
        Result := False
      else                                   // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
          begin
            for i := 1 to 40 do            // se existe Caracter Especial
              if Pos(CaraEsp[i], EMail)<>0 then
                Result := False;
            for i := 1 to length(EMail) do
            begin                                 // se existe apenas 1 @
              if EMail[i] = '@' then
                cont := cont + 1;                    // . seguidos de .
              if (EMail[i] = '.') and (EMail[i+1] = '.') then
                Result := false;

              if EMail[i] = '.' then
                  posPonto := i;
            end;
                                   // . no f, 2ou+ @, . no i, - no i, _ no i
            if (cont >=2) or ( EMail[length(EMail)]= '.' )
              or ( EMail[1]= '.' ) or ( EMail[1]= '_' )
              or ( EMail[1]= '-' )  then
                Result := false;
                                            // @ seguido de COM e vice-versa
            if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
              Result := False;
                                              // @ seguido de - e vice-versa
            if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
              Result := False;
                                              // @ seguido de _ e vice-versa
            if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
              Result := False;
          end;
    end
    else
      Result := False;

   //o ultimo ponto deve vir depois do arroba
   if (Pos('@', EMail) > posPonto) then
        Result := False;
end;

//Helio - SOL Nº 240582 PPM Nº 563271
procedure TfrmParamAPrevCS.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := True;

  // edilaine - SOL 253577-17744 / PPM 1063636 - comentado inicio
  {if not VerificaPreenchimentoEmail then
      Accept := False;
  }// edilaine - SOL 253577-17744 / PPM 1063636 - fim

end;


// edilaine - SOL 253577-17744 / PPM 1063636 - comentado inicio
//Helio - SOL Nº 240582 PPM Nº 563271
{function TfrmParamAPrevCS.VerificaPreenchimentoEmail : Boolean;
var
    msgEmailInvalido, msgEmailEmBranco : String;

begin

   try

     Result := False;
     msgEmailInvalido := 'O e-mail cadastrado não é valido. Favor verificar.';
     msgEmailEmBranco := 'A caixa de saída do e-mail do tratamento de divergência não está cadastrada na aba Contribuições. Favor verificar. ';

     if Trim(edtSaidaEmail.Text) = '' then
         raise EValidacao.CreateVal(msgEmailEmBranco, edtSaidaEmail);

     if not ValidaEMail(edtSaidaEmail.Text) then
         raise EValidacao.CreateVal(msgEmailInvalido, edtSaidaEmail);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtError, [mbOk], 0);
         Repaint;
         pgctrlParam.ActivePageIndex := 1;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;

end;
}// edilaine - SOL 253577-17744 / PPM 1063636 - comentado fim

end.

