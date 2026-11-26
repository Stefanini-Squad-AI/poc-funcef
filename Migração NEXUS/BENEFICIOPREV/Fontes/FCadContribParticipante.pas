// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 20/09/2006
// Pendencia   : 18504
// Rotina      : Variadas
// Alteração   : Permitir manutenção dos dados de planos desativados
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 17/02/2005
// Pendencia   : 18504
// Rotina      : GravaContribuicao
// Alteração   : Update na FLGRETROATIVO
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 09.10.2003
// Alteração   : Não gravar dia de vencimento como ZERO
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : sbtnProcurarClick
// Autor(a)    : Leo
// Data        : 03.12.2002
// Alteração   : estava habilitando o tollbar do detalhe sem estar em alteração
// -----------------------------------------------------------------------------
// Rotina      : formshow
// Autor(a)    : Leo
// Data        : 03.12.2002
// Alteração   : comentei código que desabilitava tollbar do detalhe
// -----------------------------------------------------------------------------

unit FCadContribParticipante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, CMTree, DBCtrls, wwdblook, Db, DBTables,
  Wwquery, Wwdatsrc, Mask, TB97, TREdit, MontaSelect,
  TB97Tlbr, URegra, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
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
    qryGridContribNOME: TStringField;
    qryGridContribIDPESSJUR: TFloatField;
    qryGridContribIDPLANOPREV: TFloatField;
    qryGridContribIDCONTRIBUICAO: TFloatField;
    qryGridContribIDPESSOA: TFloatField;
    qryGridContribCODPORTFORMA: TFloatField;
    qryGridContribIDEMPRESAPROP: TFloatField;
    qryGridContribDIAVENCIMENTO: TFloatField;
    qryGridContribFLGDESCFOLHA: TFloatField;
    qryGridContribVALORBASE1: TFloatField;
    qryGridContribVALORBASE2: TFloatField;
    qryGridContribVALORBASE3: TFloatField;
    qryGridContribPERIODICIDADE: TStringField;
    qryGridContribQTDEMESES: TFloatField;
    qryGridContribFLGPAGADOR: TStringField;
    qryGridContribNUMOPCOES: TFloatField;
    qryGridContribcalcPagador: TStringField;
    qryGridContribFLGACEITAOPCAO: TFloatField;
    qryGridContribFLGCOBRA: TFloatField;
    MontaSelectPart: TMontaSelect;
    qryGridContribQTDEPARCELAS: TFloatField;
    qryGridContribFLGRECALCULA: TFloatField;
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
    qryGridContribDATAINICIO: TDateTimeField;
    qryGridContribDATAFINAL: TDateTimeField;
    Label9: TLabel;
    dblkpcmbPeriodicidade: TwwDBLookupCombo;
    qryPeriodicidade: TwwQuery;
    qryGridContribPERIODPADRAO: TStringField;
    sbExecutaRegra: TSpeedButton;
    qryRegra: TwwQuery;
    regcalculo: TRegra;
    qryGridContribIDTPPERIODICIDADE: TFloatField;
    qryGridContribNOMEVALORBASE1: TStringField;
    qryGridContribNOMEVALORBASE2: TStringField;
    qryGridContribNOMEVALORBASE3: TStringField;
    qryGridContribFLGOBRIGATORIA: TStringField;
    qryGridContribSEQPROPOSTA: TFloatField;
    qryGridContribIDREGRACALCOP1: TFloatField;
    qryGridContribIDREGRACALCOP2: TFloatField;
    qryGridContribIDREGRACALCOP3: TFloatField;
    qryGridContribIDREGRAVALIDAOP1: TFloatField;
    qryGridContribIDREGRAVALIDAOP2: TFloatField;
    qryGridContribIDREGRAVALIDAOP3: TFloatField;
    qryParticipante: TwwQuery;
    qryGridContribULTMESPREPARO: TStringField;
    qryGridContribULTANO13: TFloatField;
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
  private
    { Private declarations }
    bApagarContribuicoes : boolean;
    sValOp1, sValOp2, sValOp3,
    sDtInicioInsc,            // CAMILLE - REFER - 07.05.199
    sInscricaoData  : string;
    EstadoContrib   : TDataSetState;
    lIdPessoa,lIdPessJur,lIdPlanoPrev,liSeqProposta : integer; // identificadores do participante
    { flag do template AtividadeABC }
    bUsaABC: boolean; { Este flag é opcional, testando se a empresa trabalha ou não com ABC,
                        para que você não precise fazer uma query com esta finalidade.}
    procedure HabilitaPainel( panel : TPanel ; flag : boolean);
  public
    { Public declarations }

     procedure AssociaContrib(sNomeParticip,sNomePatro,sNomePlano,sDtInicio  : string;
                              iIdPessoa,iIdPessJur,iIdPlanoPrev,iSeqProposta : integer; bProcura : boolean);
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

implementation

uses UMensErro, UDataBase, USistema, UAutorizacao,  UFuncoesUteis,
     UAdmPrev,  UContribuicaoPrev,   UParticipante, DAPrev, UModulo;

{$R *.DFM}

procedure TfrmCadContribParticipante.AssociaContrib( sNomeParticip,sNomePatro,sNomePlano,sDtInicio  : string;
                                                     iIdPessoa,iIdPessJur,iIdPlanoPrev,iSeqProposta : integer; bProcura : boolean);
begin
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

   { ClaudioR - 19/09/2006 - CM 23227 }
   qryPlanoPrev.Close;
   qryPlanoPrev.ParamByName('IdPessJur').AsInteger   := lIdPessJur;
   qryPlanoPrev.ParamByName('IdPessoa').AsInteger    := lIdPessoa;
   qryPlanoPrev.ParamByName('SeqProposta').AsInteger := liSeqProposta;
   qryPlanoPrev.Open;

   qryPlanoPrev.Locate('Situacao', 'ATIVO', []);
   dblkPlanoPrev.LookupValue := qryPlanoPrev.FieldByName('IDPLANOPREV').AsString;
   dblkPlanoPrev.Enabled := True; 
   { ClaudioR - Fim }

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
  bFlgRetroativo := False;

  qryPeriodicidade.close;
  qryPeriodicidade.open;
end;

procedure TfrmCadContribParticipante.FormShow(Sender: TObject);
begin
  inherited;
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
   then begin  // Validar Opcao1

     if sbtnInsDet.Down  // Esta Inserindo
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
   then begin // Validar Opcao2
     if sbtnInsDet.Down  // Esta Inserindo
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
     then begin // Regra de validacao não satisfeita
        if not bErroRegra
        then MsgDlg(' Opção 2 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 2.','Informação',mtInformation,[mbOk,mbHelp],0);
        edOp2.SetFocus;
        Exit;
     end;
   end;

   if edOp3.Visible
   then begin // Validar Opcao3
     if sbtnInsDet.Down  // Esta Inserindo
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
     then begin // Regra de validacao não satisfeita
        if not bErroRegra
        then MsgDlg(' Opção 3 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 3.','Informação',mtInformation,[mbOk,mbHelp],0);
        edOp3.SetFocus;
        Exit;
     end;
   end;
   Result := True;
end; //ValidaOpcoes

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
   end;//with
   Result := False;
end;

procedure TfrmCadContribParticipante.FormActivate(Sender: TObject);
var qryUsistema: TQuery;
begin
  if not qryGridContrib.Active then Exit;

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
  qryPortForma.Close;
  qryPortForma.Open;

  qryPeriodicidade.Close;
  qryPeriodicidade.Open;

  EstadoContrib := dsBrowse;
  dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit])); //ClaudioR - 19/09/2006 - CM 23227
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;
  pnlControlesDet.SendToBack;
  dbGrdDet.BringToFront;

end;

procedure TfrmCadContribParticipante.HabilitaPainel( panel : TPanel ; flag : boolean);
var
    i : integer;
begin
    panel.Visible := flag;

    if flag // painel vai apareceer
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
                               ' WHERE  CP.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                               '        CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                               '        CP.FLGPAGADOR <> ''E'' AND '+
                               '        CP.IDCONTRIBUICAO NOT IN '+
                               '        (SELECT CP2.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP2 '+
                               '         WHERE  CP2.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                               '                CP2.IDPESSJUR = '+IntToStr(lIdPessJur)+ ' AND '+
                               '                CP2.IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
                               '                CP2.SEQPROPOSTA = '+IntToStr(liSeqProposta)+' )'+
                               ' ORDER BY C.NOME ');
       qryContribuicao.Open;
    end;
end;



function TfrmCadContribParticipante.GravaContribuicao : boolean;
var 
  sSQLValues : string;
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
           then sSQLValues := sSQLValues +', '+qryPortForma.FieldByName('CodPortForma').AsString
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

  {.} cAuxSeparador := DecimalSeparator;
  {.} DecimalSeparator := '.';

      if Trim(edOp1.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp1);

      if Trim(edOp2.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp2);

      if Trim(edOp3.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp3);
  {.} DecimalSeparator := cAuxSeparador;

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

      qryAux.SQL.Add(' INSERT INTO CONTRIBPREVPARTP(IDPESSOA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                     '             PLANO,PLACONTAC,PLACONTAD,IDEMPRESAPROP,CODCENTROCUSTOC,CODCENTROCUSTOD,UNIDNEGOC, '+
                     '             CODPORTFORMA,DIAVENCIMENTO,FLGDESCFOLHA, FLGCOBRA, VALORBASE1,VALORBASE2,VALORBASE3, '+
                     '             QTDEPARCELAS, FLGRETROATIVO,FLGRECALCULA,DATAINICIO,DATAFINAL,IDTPPERIODICIDADE, ULTMESPREPARO) '+
                     ' VALUES ('+sSQLValues+')');
   end //then
   else begin //alteracao de contribuicao
      sSQLValues := '';
      if Trim(dblkpcmbPortForma.Text) <> ''
      then sSQLValues := ' CODPORTFORMA = '+qryPortForma.FieldByName('CodPortForma').AsString
      else sSQLValues := ' CODPORTFORMA = NULL';

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

      qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET '+sSQLValues+
                     ' WHERE IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
                     '       IDPESSJUR = '+IntToStr(lIdPessJur) +' AND '+
                     '       IDPLANOPREV = '+ qryPlanoPrev.FieldByName('IDPLANOPREV').AsString + ' AND '+   
                     '       SEQPROPOSTA = '+inttostr(liSeqProposta)+' AND '+
                     '       IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString);
      DecimalSeparator := cAuxSeparador;
   end;//else

   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
      begin
         MostrarErro(E);
         Exit;
      end;
   end;//try


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
      qryAux.SQL.Add(' DELETE FROM HSTATRASOCONTRIB '+
                     ' WHERE NUMRECEBIMENTO IN  '+
                     ' (SELECT HST.NUMRECEBIMENTO '+
                     '  FROM   HSTCONTRIBPREV HST '+
                     '  WHERE  HST.IDPESSJUR =  '+IntToStr(lIdPessJur)+' AND       '+
                     '         HST.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND    '+
                     '         HST.IDPESSOA = '+IntToStr(lIdPessoa)+' AND          '+
                     '         HST.SEQPROPOSTA = '+IntToStr(liSeqProposta)+' AND '+
                     '         HST.IDCONTRIBUICAO   = '+qryGridContrib.FieldByName('IdContribuicao').AsString+' AND '+
                     '         HST.SITRECEBIMENTO  = ''0'' AND                   '+
                     '         HST.NUMRECEBIMENTO = RC.NUMRECEBIMENTO)           ');
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
    cmbDiaVencimento.Text     := '';
    edQtdeParcelas.Text       := '';

    if dtedInicio.Text   = '' then
       dtedInicio.Text  := DateToStr(date);
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

  if qryGridContrib.FieldByName('DataInicio').AsString = ''
  then dtedInicio.Text           := ''
  else dtedInicio.Text           := DateToStr(qryGridContrib.FieldByName('DataInicio').AsDateTime);

  if qryGridContrib.FieldByName('DataFinal').AsString = ''
  then dtedFinal.Text            := ''
  else dtedFinal.Text            := qryGridContrib.FieldByName('DataFinal').AsString;

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

        edOp1.Enabled := True;
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

end;

procedure TfrmCadContribParticipante.ApagaRegistro;
begin
  with qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add(' DELETE FROM CONTRIBPREVPARTP '+
             ' WHERE IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
             '       IDPESSJUR = '+IntToStr(lIdPessJur) +' AND '+
             '       IDPLANOPREV = '+ qryPlanoPrev.FieldByName('IDPLANOPREV').AsString + ' AND '+  // ClaudioR - 20/09/2006 - CM 23227
             '       SEQPROPOSTA = '+IntToStr(liSeqProposta)+' AND '+
             '       IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString);
     try
        ExecSQL;
     except
        on E:EDBEngineError do
           MostrarErro(E);
     end;//try
  end; //with

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
  dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit])); //ClaudioR - 19/09/2006 - CM 23227
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
      dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit])); //ClaudioR - 19/09/2006 - CM 23227
   except Raise;
   end; { Except }
end;

procedure TfrmCadContribParticipante.dblkpcmbContribuicaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var iNumOpcoes : integer;
    NMes       : LongInt;   // rosana - serpros - 12/05/1999
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
  // Se a Contribuicao for obrigatoria

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

procedure TfrmCadContribParticipante.qryContribuicaoAfterScroll(DataSet: TDataSet);
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
  if (not chkCobrarContrib.Checked) and (not bApagarContribuicoes)
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
  else sDiaVencimento := '0'; // CAMILLE - 09.10.2003

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

  if (Trim(sMesRef) = '') or (Trim(sMesRef) = '/')
  then sMesRef := Copy(DateToStr(date), 7,4)+'/'+Copy(DateToStr(date), 4,2);

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
  if Trim(sInscricaoDataFund) = '' then sInscricaoDataFund := DateToStr(date);


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
  MostraDetalhesContribuicao( lIdPessJur, lIdPlanoPrev, lIdPessoa, liSeqProposta,
                             'Consulta às contribuições do participante ...',
                             '','','','',
                             '',qryAux);
  sbtnConsContrib.Down := False;                             
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

     if Trim(MontaSelectPart.ValoresChave[17]) <> ''
     then sDtInicioInsc  := MontaSelectPart.ValoresChave[17]
     else sDtInicioInsc  := DateToStr(date);

     if Trim(MontaSelectPart.ValoresChave[13]) <> ''
     then sInscricaoData := MontaSelectPart.ValoresChave[13]
     else sInscricaoData := DateToStr(date);

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

     qryPortForma.Close; qryPortForma.Open;

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
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     sbtnInsDet.Down := False;
     Exit;
  end;
  
  try
     dbGrdDet.SendToBack;
     HabilitaPainel(pnlControlesDet, true);
     // Limpar Painel
     LimpaPainel;
     // Habilitar como de contribuicao
     dblkpcmbContribuicao.Enabled := True;
     chkDescFolha.Checked := True;
     chkCobrarContrib.Checked := True;
     EstadoContrib := dsInsert;
     dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit])); 
  except
     sbtnInsDet.Down := False;
     raise;
  end; { Except }

end;

procedure TfrmCadContribParticipante.sbtnAltDetClick(
  Sender: TObject);
begin
  inherited;
  // Se o usuario já estiver inserindo ou alterando, sair
  if (sbtnInsDet.Down = True) or (EstadoContrib = dsEdit)
  then Exit;

  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     sbtnAltDet.Down := False;
     Exit;
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

  qryParticipante.Close;

  dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit])); 
  dblkPlanoPrev.Value   := '';
end;

procedure TfrmCadContribParticipante.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  tb97BotoesDetalhe.Enabled := False;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  sbtnAlterar.Down      := False;

  dblkPlanoPrev.Enabled := (Not (EstadoContrib in [dsInsert, dsEdit])); 
  dblkPlanoPrev.Value   := '';

  qryParticipante.Close;
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
end;



end.