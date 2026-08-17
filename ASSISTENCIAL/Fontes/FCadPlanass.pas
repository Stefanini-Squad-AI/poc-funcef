// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 09/11/2007
// Rotina      : -----------
// Pendencia   : 26837
// Alteração   : Acrescentado campo situação.
//------------------------------------------------------------------------------
unit FCadPlanass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdblook, wwdbdatetimepicker,
  Wwdbspin, wwdbedit, uCmTypes, Wwdotdot, Wwdbcomb;

type
  TFrmCadPlanass = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbeNomePlano: TDBEdit;
    tbsRegra: TTabSheet;
    tbsCont: TTabSheet;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    Label2: TLabel;
    qryFornServAss: TwwQuery;
    qryProdAss: TwwQuery;
    msBuscaFornecedor: TMontaSelect;
    btnBuscaFornecedor: TBitBtn;
    edtNomeFornecedor: TEdit;
    Label3: TLabel;
    dblkIdProdass: TwwDBLookupCombo;
    Label4: TLabel;
    dbeNumContrato: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dtpDataVigencia: TwwDBDateTimePicker;
    dtpDataComercial: TwwDBDateTimePicker;
    dbIdent: TDBEdit;
    Label7: TLabel;
    grbOutrasOpcoes: TGroupBox;
    dbckPlanoAtivo: TDBCheckBox;
    dbckCobDif: TDBCheckBox;
    dbckAceitaOpcoes: TDBCheckBox;
    sbtnOpcoes: TSpeedButton;
    qryPortForma: TwwQuery;
    qryContrib: TwwQuery;
    pnlControleCont: TPanel;
    Label8: TLabel;
    Label11: TLabel;
    dblkContrib: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    dbrgFormaPagto: TDBRadioGroup;
    dbrgrpPagador: TDBRadioGroup;
    dbspPrioridade: TwwDBSpinEdit;
    dbckTotalPatro: TDBCheckBox;
    dblkpcmbPeriodicidade: TwwDBLookupCombo;
    dbgrdCont: TwwDBGrid;
    Label10: TLabel;
    qryRegra: TwwQuery;
    cmbRegraContrib: TwwDBLookupCombo;
    qryPeriodo: TwwQuery;
    DBCkboxevento: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    cmbRubNormal: TwwDBLookupCombo;
    cmbRubAtraso: TwwDBLookupCombo;
    cmbRubDevolucao: TwwDBLookupCombo;
    qryProvento: TwwQuery;
    GroupBox3: TGroupBox;
    dblkRegraAdmParticip: TwwDBLookupCombo;
    Label12: TLabel;
    dblkRegraAdmBenef: TwwDBLookupCombo;
    Label14: TLabel;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    dblkRegraCancelaDesist: TwwDBLookupCombo;
    dblkRegraCancelaInad: TwwDBLookupCombo;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    dblkRegraPagtoFornec: TwwDBLookupCombo;
    dblkRegraComissaoFornec: TwwDBLookupCombo;
    dblkRegraContribPatro: TwwDBLookupCombo;
    Label19: TLabel;
    dbsNrOpcoes: TwwDBSpinEdit;
    Label20: TLabel;
    dblkCodPortForma: TwwDBLookupCombo;
    Label21: TLabel;
    qryProvDesc: TwwQuery;
    updProvDesc: TUpdateSQL;
    qryAux: TwwQuery;
    dbCboSituacao: TwwDBComboBox;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnBuscaFornecedorClick(Sender: TObject);
    procedure dbckAceitaOpcoesClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnOpcoesClick(Sender: TObject);
    procedure dbrgFormaPagtoClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure cmbRubNormalEnter(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
  private
    iIdFornServ : Integer;

    procedure HabilitaDetalhes;
    function ChecaValor(bValor : Boolean) : Integer;
    function GravaRubricasContrib(var piIdRubNormal,
                                      piIdRubAtraso,
                                      piIdRubDevolu : Integer): boolean;
    { Private declarations }
  public
    OPeracaoMestre  :  TOperacao;
    { Public declarations }
  end;

var
  FrmCadPlanass: TFrmCadPlanass;

implementation

uses
  UDataBase, UMensErro, UAutorizacao, USistema, UAdmAss, UModulo,
  UIntegraBack, DBaseDados, FPedeOpcoesPlano;

{$R *.DFM}

procedure TFrmCadPlanass.FormShow(Sender: TObject);
begin
  inherited;
  iIdFornServ := 0;

  qryProdAss.Close;
  qryProdass.Open;

  qryContrib.Close;
  qryContrib.Open;

  qryRegra.Close;
  qryRegra.ParamByName('IDTIPOREGRA').AsInteger := prmIdTipoRegra;
  qryRegra.Open;

  qryPeriodo.Close;
  qryPeriodo.Open;

  qry.Close;
  qry.ParamByName('IDPLANASS').AsInteger     := -1;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPLANASS').AsInteger := -1;
  qryDet.Open;

  qryProvento.Close;
  qryProvento.Open;

  qryPortForma.Close;
  qryPortForma.Open;

  qryProvDesc.Close;
  qryProvDesc.Open;

  HabilitaDetalhes;
end;

procedure TFrmCadPlanass.btnBuscaFornecedorClick(Sender: TObject);
begin
  inherited;
  msBuscaFornecedor.Executar;

  If msBuscaFornecedor.RetornouValor
   Then Begin
      edtNomeFornecedor.Text := msBuscaFornecedor.ValoresChave[1];
      iIdFornServ            := StrToInt(msBuscaFornecedor.ValoresChave[0]);
      qry.FieldByName('IDFORNSERV').AsInteger := iIdFornServ;
   End;
end;

procedure TFrmCadPlanass.dbckAceitaOpcoesClick(Sender: TObject);
begin
  inherited;
  sbtnOpcoes.Visible  := dbckAceitaOpcoes.Checked;
  Label20.Visible     := dbckAceitaOpcoes.Checked;
  dbsNrOpcoes.Visible := dbckAceitaOpcoes.Checked;
end;

procedure TFrmCadPlanass.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbckAceitaOpcoesClick(Self);
end;

procedure TFrmCadPlanass.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dbckAceitaOpcoesClick(Self);
end;

procedure TFrmCadPlanass.HabilitaDetalhes;
begin
 tbsDet.Enabled   := pnlMestre.Enabled;
 tbsRegra.Enabled := pnlMestre.Enabled;
end;

procedure TFrmCadPlanass.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  HabilitaDetalhes;
  OPeracaoMestre := opAlterar;
end;

procedure TFrmCadPlanass.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  HabilitaDetalhes;
  edtNomeFornecedor.Text := '';
  OPeracaoMestre := opInserir;
  qry.FieldByName('IDPLANASS').AsInteger  := LeUltRegistro(NIL,'PLANASS');
end;

procedure TFrmCadPlanass.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor
   Then Begin
     qry.Close;
     qry.ParamByName('IDPLANASS').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IDPLANASS').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.Open;

     qryFornServAss.Close;
     qryFornServAss.ParamByName('IDPESSOA').AsInteger := qry.FieldByName('IDFORNSERV').AsInteger;
     qryFornServAss.Open;

     edtNomeFornecedor.Text := qryFornServAss.FieldByName('NOME').AsString;
     iIdFornServ            := qry.FieldByName('IDFORNSERV').AsInteger;

     HabilitaDetalhes;
   End
end;

procedure TFrmCadPlanass.CmeCadastroConfirma(Sender: TObject);
begin
  AplicaAlteracoes([qry, qryProvDesc, qryDet]);
  inherited;
  HabilitaDetalhes;
end;

procedure TFrmCadPlanass.sbtnOpcoesClick(Sender: TObject);
begin
  inherited;
  FrmPedeOpcoesPlano := TFrmPedeOpcoesPlano.Create(Application);
  With FrmPedeOpcoesPlano do
   Begin
     If OPeracaoMestre = OpAlterar
      Then Begin
         // Caso a operação seja de edição, atribuir valores
        dblkpcmbRegraValidaOp1.Value := qry.FieldByName('IDREGRAVALOP1').AsString;
        dblkpcmbRegraValidaOp2.Value := qry.FieldByName('IDREGRAVALOP2').AsString;
        dblkpcmbRegraValidaOp3.Value := qry.FieldByName('IDREGRAVALOP3').AsString;
        dblkpcmbRegraValidaOp4.Value := qry.FieldByName('IDREGRAVALOP4').AsString;
        dblkpcmbRegraValidaOp5.Value := qry.FieldByName('IDREGRAVALOP5').AsString;
        dblkpcmbRegraValidaOp6.Value := qry.FieldByName('IDREGRAVALOP6').AsString;
        dblkpcmbRegraValidaOp7.Value := qry.FieldByName('IDREGRAVALOP7').AsString;
        dblkpcmbRegraValidaOp8.Value := qry.FieldByName('IDREGRAVALOP8').AsString;

        dblkpcmbRegraCalcOp1.Value   := qry.FieldByName('IDREGRACALCOP1').AsString;
        dblkpcmbRegraCalcOp2.Value   := qry.FieldByName('IDREGRACALCOP2').AsString;
        dblkpcmbRegraCalcOp3.Value   := qry.FieldByName('IDREGRACALCOP3').AsString;
        dblkpcmbRegraCalcOp4.Value   := qry.FieldByName('IDREGRACALCOP4').AsString;
        dblkpcmbRegraCalcOp5.Value   := qry.FieldByName('IDREGRACALCOP5').AsString;
        dblkpcmbRegraCalcOp6.Value   := qry.FieldByName('IDREGRACALCOP6').AsString;
        dblkpcmbRegraCalcOp7.Value   := qry.FieldByName('IDREGRACALCOP7').AsString;
        dblkpcmbRegraCalcOp8.Value   := qry.FieldByName('IDREGRACALCOP8').AsString;

        edNomeValorBase1.Text        := qry.FieldByName('NOMEVALORBASE1').AsString;
        edNomeValorBase2.Text        := qry.FieldByName('NOMEVALORBASE2').AsString;
        edNomeValorBase3.Text        := qry.FieldByName('NOMEVALORBASE3').AsString;
        edNomeValorBase4.Text        := qry.FieldByName('NOMEVALORBASE4').AsString;
        edNomeValorBase5.Text        := qry.FieldByName('NOMEVALORBASE5').AsString;
        edNomeValorBase6.Text        := qry.FieldByName('NOMEVALORBASE6').AsString;
        edNomeValorBase7.Text        := qry.FieldByName('NOMEVALORBASE7').AsString;
        edNomeValorBase8.Text        := qry.FieldByName('NOMEVALORBASE8').AsString;

        ckFlgObrigaOp1.Checked       := (qry.FieldByName('FLGOBRIGAOP1').AsInteger = 1);
        ckFlgObrigaOp2.Checked       := (qry.FieldByName('FLGOBRIGAOP2').AsInteger = 1);
        ckFlgObrigaOp3.Checked       := (qry.FieldByName('FLGOBRIGAOP3').AsInteger = 1);
        ckFlgObrigaOp4.Checked       := (qry.FieldByName('FLGOBRIGAOP4').AsInteger = 1);
        ckFlgObrigaOp5.Checked       := (qry.FieldByName('FLGOBRIGAOP5').AsInteger = 1);
        ckFlgObrigaOp6.Checked       := (qry.FieldByName('FLGOBRIGAOP6').AsInteger = 1);
        ckFlgObrigaOp7.Checked       := (qry.FieldByName('FLGOBRIGAOP7').AsInteger = 1);
        ckFlgObrigaOp8.Checked       := (qry.FieldByName('FLGOBRIGAOP8').AsInteger = 1);

        ckAlteraOp1.Checked          := (qry.FieldByName('FLGEDITAOP1').AsInteger = 1);
        ckAlteraOp2.Checked          := (qry.FieldByName('FLGEDITAOP2').AsInteger = 1);
        ckAlteraOp3.Checked          := (qry.FieldByName('FLGEDITAOP3').AsInteger = 1);
        ckAlteraOp4.Checked          := (qry.FieldByName('FLGEDITAOP4').AsInteger = 1);
        ckAlteraOp5.Checked          := (qry.FieldByName('FLGEDITAOP5').AsInteger = 1);
        ckAlteraOp6.Checked          := (qry.FieldByName('FLGEDITAOP6').AsInteger = 1);
        ckAlteraOp7.Checked          := (qry.FieldByName('FLGEDITAOP7').AsInteger = 1);
        ckAlteraOp8.Checked          := (qry.FieldByName('FLGEDITAOP8').AsInteger = 1);
      End
      Else Begin
         // Caso a operação seja de inserção, deixar todos os valores nulos
        dblkpcmbRegraValidaOp1.Value := '';
        dblkpcmbRegraValidaOp2.Value := '';
        dblkpcmbRegraValidaOp3.Value := '';
        dblkpcmbRegraValidaOp4.Value := '';
        dblkpcmbRegraValidaOp5.Value := '';
        dblkpcmbRegraValidaOp6.Value := '';
        dblkpcmbRegraValidaOp7.Value := '';
        dblkpcmbRegraValidaOp8.Value := '';

        dblkpcmbRegraCalcOp1.Value   := '';
        dblkpcmbRegraCalcOp2.Value   := '';
        dblkpcmbRegraCalcOp3.Value   := '';
        dblkpcmbRegraCalcOp4.Value   := '';
        dblkpcmbRegraCalcOp5.Value   := '';
        dblkpcmbRegraCalcOp6.Value   := '';
        dblkpcmbRegraCalcOp7.Value   := '';
        dblkpcmbRegraCalcOp8.Value   := '';

        edNomeValorBase1.Text        := '';
        edNomeValorBase2.Text        := '';
        edNomeValorBase3.Text        := '';
        edNomeValorBase4.Text        := '';
        edNomeValorBase5.Text        := '';
        edNomeValorBase6.Text        := '';
        edNomeValorBase7.Text        := '';
        edNomeValorBase8.Text        := '';

        ckFlgObrigaOp1.State         := cbGrayed;
        ckFlgObrigaOp2.State         := cbGrayed;
        ckFlgObrigaOp3.State         := cbGrayed;
        ckFlgObrigaOp4.State         := cbGrayed;
        ckFlgObrigaOp5.State         := cbGrayed;
        ckFlgObrigaOp6.State         := cbGrayed;
        ckFlgObrigaOp7.State         := cbGrayed;
        ckFlgObrigaOp8.State         := cbGrayed;

        ckAlteraOp1.State            := cbGrayed;
        ckAlteraOp2.State            := cbGrayed;
        ckAlteraOp3.State            := cbGrayed;
        ckAlteraOp4.State            := cbGrayed;
        ckAlteraOp5.State            := cbGrayed;
        ckAlteraOp6.State            := cbGrayed;
        ckAlteraOp7.State            := cbGrayed;
        ckAlteraOp8.State            := cbGrayed;
      End;
     // Habilita o item de acordo com a quantidade de opções escolhidas
     dblkpcmbRegraValidaOp1.Enabled := (dbsNrOpcoes.Value >= 1);
     dblkpcmbRegraValidaOp2.Enabled := (dbsNrOpcoes.Value >= 2);
     dblkpcmbRegraValidaOp3.Enabled := (dbsNrOpcoes.Value >= 3);
     dblkpcmbRegraValidaOp4.Enabled := (dbsNrOpcoes.Value >= 4);
     dblkpcmbRegraValidaOp5.Enabled := (dbsNrOpcoes.Value >= 5);
     dblkpcmbRegraValidaOp6.Enabled := (dbsNrOpcoes.Value >= 6);
     dblkpcmbRegraValidaOp7.Enabled := (dbsNrOpcoes.Value >= 7);
     dblkpcmbRegraValidaOp8.Enabled := (dbsNrOpcoes.Value >= 8);

     dblkpcmbRegraCalcOp1.Enabled := (dbsNrOpcoes.Value >= 1);
     dblkpcmbRegraCalcOp2.Enabled := (dbsNrOpcoes.Value >= 2);
     dblkpcmbRegraCalcOp3.Enabled := (dbsNrOpcoes.Value >= 3);
     dblkpcmbRegraCalcOp4.Enabled := (dbsNrOpcoes.Value >= 4);
     dblkpcmbRegraCalcOp5.Enabled := (dbsNrOpcoes.Value >= 5);
     dblkpcmbRegraCalcOp6.Enabled := (dbsNrOpcoes.Value >= 6);
     dblkpcmbRegraCalcOp7.Enabled := (dbsNrOpcoes.Value >= 7);
     dblkpcmbRegraCalcOp8.Enabled := (dbsNrOpcoes.Value >= 8);

     edNomeValorBase1.Enabled := (dbsNrOpcoes.Value >= 1);
     edNomeValorBase2.Enabled := (dbsNrOpcoes.Value >= 2);
     edNomeValorBase3.Enabled := (dbsNrOpcoes.Value >= 3);
     edNomeValorBase4.Enabled := (dbsNrOpcoes.Value >= 4);
     edNomeValorBase5.Enabled := (dbsNrOpcoes.Value >= 5);
     edNomeValorBase6.Enabled := (dbsNrOpcoes.Value >= 6);
     edNomeValorBase7.Enabled := (dbsNrOpcoes.Value >= 7);
     edNomeValorBase8.Enabled := (dbsNrOpcoes.Value >= 8);

     ckFlgObrigaOp1.Enabled := (dbsNrOpcoes.Value >= 1);
     ckFlgObrigaOp2.Enabled := (dbsNrOpcoes.Value >= 2);
     ckFlgObrigaOp3.Enabled := (dbsNrOpcoes.Value >= 3);
     ckFlgObrigaOp4.Enabled := (dbsNrOpcoes.Value >= 4);
     ckFlgObrigaOp5.Enabled := (dbsNrOpcoes.Value >= 5);
     ckFlgObrigaOp6.Enabled := (dbsNrOpcoes.Value >= 6);
     ckFlgObrigaOp7.Enabled := (dbsNrOpcoes.Value >= 7);
     ckFlgObrigaOp8.Enabled := (dbsNrOpcoes.Value >= 8);

     ckAlteraOp1.Enabled := (dbsNrOpcoes.Value >= 1);
     ckAlteraOp2.Enabled := (dbsNrOpcoes.Value >= 2);
     ckAlteraOp3.Enabled := (dbsNrOpcoes.Value >= 3);
     ckAlteraOp4.Enabled := (dbsNrOpcoes.Value >= 4);
     ckAlteraOp5.Enabled := (dbsNrOpcoes.Value >= 5);
     ckAlteraOp6.Enabled := (dbsNrOpcoes.Value >= 6);
     ckAlteraOp7.Enabled := (dbsNrOpcoes.Value >= 7);
     ckAlteraOp8.Enabled := (dbsNrOpcoes.Value >= 8);

     ShowModal;

     // Atribui valores recebidos na tela
     qry.FieldByName('IDREGRAVALOP1').AsString   := dblkpcmbRegraValidaOp1.LookupValue;
     qry.FieldByName('IDREGRAVALOP2').AsString   := dblkpcmbRegraValidaOp2.LookupValue;
     qry.FieldByName('IDREGRAVALOP3').AsString   := dblkpcmbRegraValidaOp3.LookupValue;
     qry.FieldByName('IDREGRAVALOP4').AsString   := dblkpcmbRegraValidaOp4.LookupValue;
     qry.FieldByName('IDREGRAVALOP5').AsString   := dblkpcmbRegraValidaOp5.LookupValue;
     qry.FieldByName('IDREGRAVALOP6').AsString   := dblkpcmbRegraValidaOp6.LookupValue;
     qry.FieldByName('IDREGRAVALOP7').AsString   := dblkpcmbRegraValidaOp7.LookupValue;
     qry.FieldByName('IDREGRAVALOP8').AsString   := dblkpcmbRegraValidaOp8.LookupValue;

     qry.FieldByName('IDREGRACALCOP1').AsString  := dblkpcmbRegraCalcOp1.LookupValue;
     qry.FieldByName('IDREGRACALCOP2').AsString  := dblkpcmbRegraCalcOp2.LookupValue;
     qry.FieldByName('IDREGRACALCOP3').AsString  := dblkpcmbRegraCalcOp3.LookupValue;
     qry.FieldByName('IDREGRACALCOP4').AsString  := dblkpcmbRegraCalcOp4.LookupValue;
     qry.FieldByName('IDREGRACALCOP5').AsString  := dblkpcmbRegraCalcOp5.LookupValue;
     qry.FieldByName('IDREGRACALCOP6').AsString  := dblkpcmbRegraCalcOp6.LookupValue;
     qry.FieldByName('IDREGRACALCOP7').AsString  := dblkpcmbRegraCalcOp7.LookupValue;
     qry.FieldByName('IDREGRACALCOP8').AsString  := dblkpcmbRegraCalcOp8.LookupValue;

     qry.FieldByName('NOMEVALORBASE1').AsString  := edNomeValorBase1.Text;
     qry.FieldByName('NOMEVALORBASE2').AsString  := edNomeValorBase2.Text;
     qry.FieldByName('NOMEVALORBASE3').AsString  := edNomeValorBase3.Text;
     qry.FieldByName('NOMEVALORBASE4').AsString  := edNomeValorBase4.Text;
     qry.FieldByName('NOMEVALORBASE5').AsString  := edNomeValorBase5.Text;
     qry.FieldByName('NOMEVALORBASE6').AsString  := edNomeValorBase6.Text;
     qry.FieldByName('NOMEVALORBASE7').AsString  := edNomeValorBase7.Text;
     qry.FieldByName('NOMEVALORBASE8').AsString  := edNomeValorBase8.Text;

     qry.FieldByName('FLGOBRIGAOP1').AsInteger   := ChecaValor(ckFlgObrigaOp1.Checked);
     qry.FieldByName('FLGOBRIGAOP2').AsInteger   := ChecaValor(ckFlgObrigaOp2.Checked);
     qry.FieldByName('FLGOBRIGAOP3').AsInteger   := ChecaValor(ckFlgObrigaOp3.Checked);
     qry.FieldByName('FLGOBRIGAOP4').AsInteger   := ChecaValor(ckFlgObrigaOp4.Checked);
     qry.FieldByName('FLGOBRIGAOP5').AsInteger   := ChecaValor(ckFlgObrigaOp5.Checked);
     qry.FieldByName('FLGOBRIGAOP6').AsInteger   := ChecaValor(ckFlgObrigaOp6.Checked);
     qry.FieldByName('FLGOBRIGAOP7').AsInteger   := ChecaValor(ckFlgObrigaOp7.Checked);
     qry.FieldByName('FLGOBRIGAOP8').AsInteger   := ChecaValor(ckFlgObrigaOp8.Checked);

     qry.FieldByName('FLGEDITAOP1').AsInteger    := ChecaValor(ckAlteraOp1.Checked);
     qry.FieldByName('FLGEDITAOP2').AsInteger    := ChecaValor(ckAlteraOp1.Checked);
     qry.FieldByName('FLGEDITAOP3').AsInteger    := ChecaValor(ckAlteraOp1.Checked);
     qry.FieldByName('FLGEDITAOP4').AsInteger    := ChecaValor(ckAlteraOp1.Checked);
     qry.FieldByName('FLGEDITAOP5').AsInteger    := ChecaValor(ckAlteraOp1.Checked);
     qry.FieldByName('FLGEDITAOP6').AsInteger    := ChecaValor(ckAlteraOp1.Checked);
     qry.FieldByName('FLGEDITAOP7').AsInteger    := ChecaValor(ckAlteraOp1.Checked);
     qry.FieldByName('FLGEDITAOP8').AsInteger    := ChecaValor(ckAlteraOp1.Checked);
   End;  // With FrmPedeOpcoesPlano do
  FrmPedeOpcoesPlano.Free;
end;

function TFrmCadPlanass.ChecaValor(bValor: Boolean): Integer;
begin
  If bValor
   Then Result := 1
   Else Result := 0;
end;

procedure TFrmCadPlanass.dbrgFormaPagtoClick(Sender: TObject);
begin
  inherited;
  If (dbrgFormaPagto.ItemIndex <> 2) And (qryDet.FieldByName('CODPORTFORMA').AsInteger > 0)
   Then qryDet.FieldByName('CODPORTFORMA').Clear;

  dblkCodPortForma.Enabled := (dbrgFormaPagto.ItemIndex = 1); //Hugo Luna - 01/11/2007
end;

procedure TFrmCadPlanass.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  dblkCodPortForma.Enabled := (dbrgFormaPagto.ItemIndex = 1); //Hugo Luna - 01/11/2007
end;

procedure TFrmCadPlanass.bbtnOkDetClick(Sender: TObject);
begin
  // Crítica dos campos
  If Trim(dblkContrib.Text) = ''
   Then Begin
    MsgDlg('Escolha uma contribuição a ser associada ao plano escolhido.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dblkContrib.SetFocus;
    Exit;
   End;

  If Trim(dblkpcmbPeriodicidade.Text) = ''
   Then Begin
    MsgDlg('Escolha qual será a periodicidade da contribuição escolhida.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dblkpcmbPeriodicidade.SetFocus;
    Exit;
   End;

  If Trim(cmbRegraContrib.Text) = ''
   Then Begin
    MsgDlg('É necessário escolher uma regra para efetuar o cálculo da contribuição.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    cmbRegraContrib.SetFocus;
    Exit;
   End;

  If dbrgFormaPagto.ItemIndex = -1
   Then Begin
    MsgDlg('É necessário escolher a forma de pagamento para a contribuição.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dbrgFormaPagto.SetFocus;
    Exit;
   End;

  If (dblkCodPortForma.Enabled) And (Trim(dblkCodPortForma.Text) = '')
   Then Begin
    MsgDlg('É necessário escolher a forma de cobrança para pagamentos em boleto bancário.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dblkCodPortForma.SetFocus;
    Exit;
   End;

  If dbrgrpPagador.ItemIndex = -1
   Then Begin
    MsgDlg('É necessário escolher quem será o pagador desta contribuição.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dbrgrpPagador.SetFocus;
    Exit;
   End;

  If Trim(dbspPrioridade.Text) = ''
   Then Begin
    MsgDlg('É necessário escolher a prioridade do desconto desta contribuição.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dbspPrioridade.SetFocus;
    Exit;
   End;

  If Trim(cmbRubNormal.Text) = ''
   Then Begin
    MsgDlg('É necessário escolher a rubrica normal para ser associada à contribuição.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    cmbRubNormal.SetFocus;
    Exit;
   End;

  If Trim(cmbRubAtraso.Text) = ''
   Then Begin
    MsgDlg('É necessário escolher a rubrica de atraso para ser associada à contribuição.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    cmbRubAtraso.SetFocus;
    Exit;
   End;

  If Trim(cmbRubDevolucao.Text) = ''
   Then Begin
    MsgDlg('É necessário escolher a rubrica de atraso para ser associada à contribuição.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    cmbRubDevolucao.SetFocus;
    Exit;
   End;

  // Fim da crítica
  If (pgctrlDetalhe.ActivePage = tbsCont) And (qryDet.State = DsInsert)
   Then qryDet.FieldByName('IDPLANASS').AsInteger  := qry.FieldByName('IDPLANASS').AsInteger;
  qryDet.FieldByName('NOMECONTRIBUICAO').AsString  := dblkContrib.Text;

  If dbrgrpPagador.ItemIndex = 0
   Then qryDet.FieldByName('NOMEPAGADOR').AsString := 'PARTICIPANTE'
   Else qryDet.FieldByName('NOMEPAGADOR').AsString := 'PATROCINADORA';

  Case dbrgFormaPagto.ItemIndex Of
   0 :  qryDet.FieldByName('FORMAPAGTO').AsString := 'FOLHA DE ATIVO';
   1 :  qryDet.FieldByName('FORMAPAGTO').AsString := 'BOLETO BANCÁRIO';
   //2 :  qryDet.FieldByName('FORMAPAGTO').AsString := 'FOLHA DE BENEFÍCIO'; //Hugo Luna - 01/11/2007
  End;
  inherited;
end;

function TFrmCadPlanass.GravaRubricasContrib(var piIdRubNormal,
                                                 piIdRubAtraso,
                                                 piIdRubDevolu : Integer): boolean;
var
   sRubricaNormal,
   sRubricaAtraso,
   sRubricaDevolucao,
   sNumPrioridade : string;
begin
   Result := False;

   piIdRubNormal        := -1;
   piIdRubAtraso        := -1;
   piIdRubDevolu        := -1;

   sNumPrioridade := '1';

   //*******************************************************************************
   //********************   RUBRICAS DA PROPRIA CONTRIBUICAO    ********************
   //*******************************************************************************
   sRubricaNormal       := Copy(Trim(dblkContrib.Text)+' - '+Trim(dbeNomePlano.Text)+' - [Normal]',1,130);
   sRubricaAtraso       := Copy(Trim(dblkContrib.Text)+' - '+Trim(dbeNomePlano.Text)+' - [Atrasada]',1,130);
   sRubricaDevolucao    := Copy(Trim(dblkContrib.Text)+' - '+Trim(dbeNomePlano.Text)+' - [Devolvida]',1,130);

   // Gravar Rubrica Normal
   piIdRubNormal := LeUltRegistro(qryAux,'PROVDESC');

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubNormal;
      FieldByName('DESCRICAO').AsString       := sRubricaNormal;
      FieldByName('FLGATRASODEVOL').AsString  := 'N';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;
      FieldByName('FLGDESCONTO').AsInteger       := 1;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;
      FieldByName('FLGESPECIAL').AsInteger       := 0;
      FieldByName('FLGFERIAS').AsInteger         := 0;
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      FieldByName('FLGRESCISAO').AsInteger       := 0;
      FieldByName('FLGSALFAMILIA').AsInteger     := 0;
      FieldByName('FLGTPRUBRICA').AsString       := 'A';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
      Post;

      qryDet.FieldByName('IDPROVENTO').AsInteger := piIdRubNormal;
      cmbRubNormal.SearchField                   := sRubricaNormal;
   end;

   // Gravar Rubrica de Atraso
   piIdRubAtraso := LeUltRegistro(qryAux,'PROVDESC');

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubAtraso;
      FieldByName('DESCRICAO').AsString       := sRubricaAtraso;
      FieldByName('FLGATRASODEVOL').AsString  := 'A';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;
      FieldByName('FLGDESCONTO').AsInteger       := 1;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;
      FieldByName('FLGESPECIAL').AsInteger       := 0;
      FieldByName('FLGFERIAS').AsInteger         := 0;
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      FieldByName('FLGRESCISAO').AsInteger       := 0;
      FieldByName('FLGSALFAMILIA').AsInteger     := 0;
      FieldByName('FLGTPRUBRICA').AsString       := 'A';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
      Post;

      qryDet.FieldByName('IDPROVENTOATRASO').AsInteger := piIdRubAtraso;
      cmbRubAtraso.Text                                := sRubricaAtraso
   end;

   // Gravar rubrica de Devolucao
   piIdRubDevolu := LeUltRegistro(qryAux,'PROVDESC');

   with qryProvDesc do
   begin
      Insert;
      FieldByName('IDPROVENTO').AsInteger     := piIdRubDevolu;
      FieldByName('DESCRICAO').AsString       := sRubricaDevolucao;
      FieldByName('FLGATRASODEVOL').AsString  := 'D';
      FieldByName('FLGCOMPOEREMTOTAL').AsInteger := 0;
      FieldByName('FLGCOMPOESALBENEF').AsInteger := 0;
      FieldByName('FLGCOMPOESALPART').AsInteger  := 0;
      FieldByName('FLGCONSOLIDA').AsInteger      := 0;
      FieldByName('FLGCONSTAFOLHA').AsInteger    := 0;
      FieldByName('FLGDECIMOTERCEIRO').AsInteger := 0;
      FieldByName('FLGDESCONTO').AsInteger       := 0;
      FieldByName('FLGDESCPENSAO').AsInteger     := 0;
      FieldByName('FLGESPECIAL').AsInteger       := 0;
      FieldByName('FLGFERIAS').AsInteger         := 0;
      FieldByName('FLGFGTS').AsInteger           := 0;
      FieldByName('FLGINCIDECONTRIB').AsInteger  := 0;
      FieldByName('FLGINCIDESALPART').AsInteger  := 0;
      FieldByName('FLGINSS').AsInteger           := 0;
      FieldByName('FLGINTERNO').AsInteger        := 1;
      FieldByName('FLGOBRIGAFAVOREC').AsInteger  := 0;
      FieldByName('FLGPRORATA').AsInteger        := 0;
      FieldByName('FLGRAIS').AsInteger           := 0;
      FieldByName('FLGRESCISAO').AsInteger       := 0;
      FieldByName('FLGSALFAMILIA').AsInteger     := 0;
      FieldByName('FLGTPRUBRICA').AsString       := 'A';
      FieldByName('FLGUSO').AsString             := 'P';
      FieldByName('NUMPRIORIDADE').AsInteger     := StrToInt(sNumPrioridade);
      Post;

      qryDet.FieldByName('IDPROVENTODEVOL').AsInteger := piIdRubDevolu;
      cmbRubDevolucao.Text                            := sRubricaDevolucao;
   end;

   Result := True;
end; // GravaRubricasContrib

procedure TFrmCadPlanass.cmbRubNormalEnter(Sender: TObject);
Var
 iIdRubNormal,
 iIdRubAtraso,
 iIdRubDevolu  : Integer;
Begin
  inherited;
  If qryDet.State = dsInsert
   Then Begin
    // Verifica se já foi criada a rubrica
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT 1 FROM PROVDESC');
    qryAux.SQL.Add('WHERE DESCRICAO LIKE '+QuotedStr(Trim(dblkContrib.Text)+' - '+Trim(dbeNomePlano.Text)+' -%'));

    qryAux.Open;

    If qryAux.IsEmpty
     Then Begin
     // Gravar automaticamente rubricas de atraso e devolucao da contribuicao,
     // se assim estiver parametrizado
     if prmFlgRubricaAuto = 1
      Then Begin
        If not GravaRubricasContrib(iIdRubNormal,
                                    iIdRubAtraso,
                                    iIdRubDevolu)
         Then If MsgDlg('Ocorreram problemas na geração das rubricas para cobrança da contribuição. '+
                        ' Deseja continuar gravação da contribuição ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
                Then Abort;
       qryProvento.Close;
       qryProvento.Open;
      End;
     End;
   End;
end;

procedure TFrmCadPlanass.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  If qryDet.FieldByName('IDPLANASS').AsInteger = 0
   Then qryDet.FieldByName('IDPLANASS').AsInteger := qry.FieldByName('IDPLANASS').AsInteger;
end;

end.
