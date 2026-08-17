{ --------------------------------------------------------------------------------------------------
Rotina    : CdsContasBeforePost
Data      : 07/03/2013
Autor     : William Moreira da Silva
Sol       : 227156
Kintana   : 2061700
Descrição : Valor do saldo está sendo exibido incorretamente e ao alterar o valor o saldo
            anterior não está voltando ao original. 
{ --------------------------------------------------------------------------------------------------
Rotina    : btSelContasClick, CmeCadastroConfirma, CmeCadastroApplyInsert, btCalcularRatClick
Data      : 08/05/2013
Autor     : Edilaine Ferraresi
Sol       : 190488
Kintana   : 1909246
Descrição : adequação do rateio e obritatoriedade de sub-despesa
{ --------------------------------------------------------------------------------------------------
Data      : 15/01/2013
Autor     : Edilaine Ferraresi
Sol       : 172383-7762
Kintana   : 1556974
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : retirada do parametro PLANO ORÇAMENTARIO e MÁSCARA da parametrização do módulo
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9361
Nº KINTANA..: 1653184
Data........: 05/06/2012
Responsável.: Vander Campos
Descrição...: Adequação da interface aos padrões de utilização da funcionalidade Especial
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasClick
Nº SOL......: 163910
Nº KINTANA..: 1403215
Data........: 05/01/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusao de novos parametros "Atividade Projeto", "Programa" e "Tipo de Despesa"
Alteracão Form:	inclusão de combos para seleção de parâmetros
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btCalcularRatClick
Nº SOL......: 122291
Nº KINTANA..: 597829
Data........: 23/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Ao calcular rateio verificar se valor é maior que zera.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: MontaSelect, CmeCadastroApplyInsert e CmeCadastroApplyDelete
Nº SOL......: 153584/4161
Nº KINTANA..: 1170663
Data........: 15/01/2011
Responsável.: Brunno Mattos
Descrição...: Adicionado coluna "Operação Compromisso" para ser pesquisado, criação de uma tabela
              associativa para associar o IDOPERACAO ajuste ao IDOPERACAO do compromisso.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: dtp_Dt_ReferenciaClick
Nº SOL......: 151878
Nº KINTANA..: 1121523
Data........: 03/01/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Ao realizar consulta, permitir editar o campo Dt. Referência há todos os registros
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: componente MontaSQL
Nº SOL......: 151868
Nº KINTANA..: 1121411
Data........: 02/01/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Correção da Consulta da Entrada de Dados mostrar somente os campos
              Grupo/Periodo/Exercício
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 151865
Nº KINTANA..: 1121572
Data........: 01/02/2011
Responsável.: Brunno Mattos
Descrição...: Inclusão do período "ANUAL" no combo Período.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasClick
Nº SOL......: 151660
Nº KINTANA..: 1115295
Data........: 27/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para trazer apenas os centros de custos ativos na inclusão
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasClick
Nº SOL......: 151079
Nº KINTANA..: 1103455
Data........: 18/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Retirada a obrigatoriedade do plano de trabalho.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 150183
Nº KINTANA..: 1087556
Data........: 13/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para buscar o plano de trabalho após mudar o exercício.
---------------------------------------------------------------------------------------------------}
unit FSuplemDeduPorGrupoMT;
//==============================================================================
//  Data      : 02/01/2006
//  Autor     : Rodolpho da Silva
//  Pendência : 16462 / 16463
//  Descrição : Criar tela para suplementação/dedução de saldos por grupo de contas
//==============================================================================
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, TREdit, wwdblook, CMDBLookupCombo, uCtrlPlanPrevContabPatro,
  uCtrlPadroes, uCtrlTransacoesPorGrupo, uSistema, uMensErro, uModulo, uDiasUteis,
  uCtrlAlterOrcamento, uCMTypes,
  uCtrlPlanPrevContabil, uCtrlPatro, ComCtrls, wwriched, uCtrlPeriodoOrcamen,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmSuplemDeduPorGrupoMT = class(TFrmCadastroMT)
    Grid: TwwDBGrid;
    CdsCRespon: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    CdsContas: TCMClientDataSet;
    edtDescGrupo: TEdit;
    Label1: TLabel;
    btBuscGrupoOrigem: TSpeedButton;
    Label4: TLabel;
    cboPatroOrigem: TCMDBLookupCombo;
    Label3: TLabel;
    cboPlanoPrevidenciarioOrigem: TCMDBLookupCombo;
    Label20: TLabel;
    Label22: TLabel;
    edtExercicio: TDBRealEdit;
    btSelContas: TBitBtn;
    CdsCCusto: TCMClientDataSet;
    dsContas: TDataSource;
    cboPeriodo: TComboBox;
    rcEditor: TwwDBRichEdit;
    mmObs: TMemo;
    Label5: TLabel;
    pnlTotalContas: TPanel;
    Panel1: TPanel;
    pnlDataReferencia: TPanel;
    lbl1: TLabel;
    btnEditaDtRefer: TButton;
    dtp_Dt_Referencia: TCMDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    btCalcularRat: TSpeedButton;
    cboRatCriter: TCMDBLookupCombo;
    edtVlrRateio: TDBRealEdit;
    CdsRatCriter: TCMClientDataSet;
    Label9: TLabel;
    cboAtivProjeto: TCMDBLookupCombo;
    Label10: TLabel;
    cboPrograma: TCMDBLookupCombo;
    Label8: TLabel;
    cboTipoDespesa: TCMDBLookupCombo;
    cdsAtivProjeto: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    cdsTipoDespesa: TCMClientDataSet;
    lblPlanoOrcamentario: TLabel;
    lblCentroCusto: TLabel;
    lblFornecedoresSubDespesas: TLabel;
    edtFornecedoresSubDespesas: TEdit;
    btBuscForn: TSpeedButton;
    cdsPlanoOrc: TCMClientDataSet;
    cboPlanoOrcamentario: TCMDBLookupCombo;
    cboCentroCusto: TCMDBLookupCombo;
    msGrupo: TMontaSelect;
    msDespesa: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btBuscGrupoOrigemClick(Sender: TObject);
    procedure btSelContasClick(Sender: TObject);
    procedure CdsContasAfterOpen(DataSet: TDataSet);
    procedure GridRowChanged(Sender: TObject);
    procedure CdsContasBeforePost(DataSet: TDataSet);
    procedure GridUpdateFooter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTopRowChanged(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure btnEditaDtReferClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btCalcularRatClick(Sender: TObject);
    procedure btBuscFornClick(Sender: TObject);
  private
    { Private declarations }
    iIdPlanoOrc : integer;   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

    rTotalSaldo,rTotalSuplemen: Double;  // Edilaine - SOL 190488 / KTN 1909246

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;
    CtrlAlterOrcamento      : TCtrlAlterorcamento;
    CtrlPeriodoOrcamen      : TCtrlPeriodoOrcamen;

    CtrlPlanPrevContabil    : TCtrlPlanPrevContabil;
    CtrlPatro               : TCtrlPatro;

    procedure LimparFiltroTela;
    procedure VerificaZeraSaldo;

  public
    { Public declarations }
  end;






var
  FrmSuplemDeduPorGrupoMT: TFrmSuplemDeduPorGrupoMT;

implementation

{$R *.DFM}

procedure TFrmSuplemDeduPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);
  CtrlTransacoesPorGrupo  := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  CtrlAlterOrcamento      := TCtrlAlterorcamento.Create;
  CtrlAlterOrcamento.InitializeAs(Padroes);
  CtrlPeriodoOrcamen      := TCtrlPeriodoOrcamen.Create;
  CtrlPeriodoOrcamen.InitializeAs(Padroes);

  CtrlPlanPrevContabil    := TCtrlPlanPrevContabil.Create;
  CtrlPlanPrevContabil.InitializeAs(Padroes);
  CtrlPatro               := TCtrlPatro.Create;
  CtrlPatro.InitializeAs(Padroes);
  CdsPlano.Data := CtrlTransacoesPorGrupo.ListaPlano;
  CdsPatro.Data := CtrlTransacoesPorGrupo.ListaPatro;

  // Edilaine Ferraresi - SOL 163910 / KTN 1403215
  cdsTipoDespesa.Data     := CtrlTransacoesPorGrupo.ListaTipoDespesa;
  cdsPrograma.Data        := CtrlTransacoesPorGrupo.ListaPrograma;
  cdsAtivProjeto.Data     := CtrlTransacoesPorGrupo.ListaAtividadeProj;
  // Edilaine Ferraresi - SOL 163910 / KTN 1403215  -- fim


  CtrlAlterOrcamento.CdsAlterorcamento := Cds;
  Cds.Data          := CtrlTransacoesPorGrupo.ListaSuplementacoes(-1,-1,-1,-1,-1,-1,-1);
  CdsContas.Data    := Cds.Data;
  //CdsPlanoTrab.Data := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario,Sistema.IdEmpresa,Date); // Alterado por FHBS - SOL: 150183 KTN: 1087556
  CdsCCusto.Data    := CtrlTransacoesPorGrupo.ListaTransfCCusto(Sistema.IdUsuario,Sistema.IdEmpresa);
  CdsCRespon.Data   := CtrlTransacoesPorGrupo.ListaTransfCRespon(Sistema.IdUsuario);

  //Renan Cristiano SOL 152790 KINTANA 1145737
  CdsRatCriter.Data := CtrlTransacoesPorGrupo.ListaReservaRatCriter(Sistema.IdEmpresa);

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento('-1');
  cdsCCusto.Data   := CtrlTransacoesPorGrupo.ListaCentroCusto;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  cboPeriodo.ItemIndex  := 0; {(DiasUteis.ExtraiMes(date));}    // Edilaine - SOL 190488 / KTN 1909246 - setar para anual
  edtExercicio.Text     := IntToStr(DiasUteis.ExtraiAno(date));

  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
  { MontaSelect.Filtro.Add('ALTERORCAMENTO.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
   msGrupo.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
  } // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - comentado

   //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
   cboRatCriter.LookupValue := '-1';
   cboRatCriter.Enabled     := false;

end;




procedure TFrmSuplemDeduPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlTransacoesPorGrupo);
  FreeAndNil(CtrlAlterOrcamento);
  FreeAndNil(CtrlPeriodoOrcamen);
  FreeAndNil (CtrlPlanPrevContabil);
  FreeAndNil (CtrlPatro);
  inherited;
end;




procedure TFrmSuplemDeduPorGrupoMT.btBuscGrupoOrigemClick(Sender: TObject);
begin
  inherited;
  msGrupo.Executar;
  if msGrupo.RetornouValor then
  Begin
    edtDescGrupo.Text := msGrupo.ValoresChave[2] + '-' + msGrupo.ValoresChave[1];

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( msGrupo.ValoresChave[2] );
    cboPlanoOrcamentario.LookupValue := msGrupo.ValoresChave[3];
    if cdsPlanoOrc.FieldByName('ANO').AsString <> '' then
       edtExercicio.Text := cdsPlanoOrc.FieldByName('ANO').AsString;
    edtFornecedoresSubDespesas.text := '';
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    iIdPlanoOrc := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

  End;

end;

procedure TFrmSuplemDeduPorGrupoMT.btSelContasClick(Sender: TObject);
var
  iPlano,iPatro : integer;
  sCentRespon   : string;
  iPrograma     : integer;
  iTipoDespesa  : integer;
  iUnidNegoc    : Integer;

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  ParamEntEsp : TParamEntradaEspecial;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

begin
  inherited;
  if Trim(edtDescGrupo.Text) = '' then
  begin
     MsgDlg('Informe o grupo orçamentário!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  // Alterado por FHBS - SOL: 151079 KTN: 1103455
  //if Trim(cboPlanoTrab.Text) = '' then
  //begin
  //   MsgDlg('Informe o plano de trabalho!','Aviso',mtWarning,[mbOk],0);
  //   Exit;
  //end;
  

  if StrToIntDef(edtExercicio.Text,0) = 0 then
  begin
     MsgDlg('Informe o exercício!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
  iUnidNegoc  := 0;
  sCentRespon := '';
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  // Plano
  if Trim(cboPlanoPrevidenciarioOrigem.Text) <> '' then
     iPlano := StrToIntDef(cboPlanoPrevidenciarioOrigem.LookupValue,-1)
  else
     iPlano := -1;

  // Patro
  if Trim(cboPatroOrigem.Text) <> '' then
     iPatro := StrToIntDef(cboPatroOrigem.LookupValue,-1)
  else
     iPatro := -1;

  if (iPlano <> -1) and (iPatro <> -1) then
    if not CtrlPlanPrevContabPatro.ValidaPlanoPatro (iPatro, iPlano) then begin
      MsgDlg (CtrlPlanPrevContabPatro.MessageInfo, 'Relacionamento Inválido', mtWarning, [mbok], 0);
      exit;
    end;

  // Edilaine Ferraresi - SOL 163910 / KTN 1403215

  // --- Atividade
  if Trim(cboAtivProjeto.Text) <> '' then
     iUnidNegoc := StrToIntDef(cboAtivProjeto.LookupValue,-1);

  // --- Programa
  if Trim(cboPrograma.Text) <> '' then
     iPrograma := StrToIntDef(cboPrograma.LookupValue,-1)
  else
     iPrograma := -1;

  // --- Tipo despesa
  if Trim(cboTipoDespesa.Text) <> '' then
     iTipoDespesa := StrToIntDef(cboTipoDespesa.LookupValue,-1)
  else
     iTipoDespesa := -1;

  // Edilaine Ferraresi - SOL 163910 / KTN 1403215 - fim


  if not CtrlPeriodoOrcamen.PeriodoLiberado((cboPeriodo.ItemIndex),
                                            Trunc(edtExercicio.Value),
                                            Sistema.Idempresa) then
  begin
     MsgDlg('Período BLOQUEADO para lançamentos e alterações!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  { VANDER SOL 172384/9361 KINTANA 1653184 -> Try Finally adicionado para o uso de "ParamEntEsp" }
  ParamEntEsp := TParamEntradaEspecial.Create(TRUE);
  Try
    With ParamEntEsp.Parametros do
    Begin
      iIdPlanoOrc   := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);
      sCodCCusto    := Trim(cboCentroCusto.LookupValue);

      //If MsDespesa.RetornouValor Then    // Edilaine - SOL 190488 / KTN 1909246
      if edtFornecedoresSubDespesas.text <> '' then    // Edilaine - SOL 190488 / KTN 1909246
         iIdSubDespesa := StrToIntDef(msDespesa.ValoresChave[0],  -1);

    End;
    //

    // Edilaine - SOL 190488 / KTN 1909246
    if (ParamEntEsp.Parametros.iIdSubDespesa = -1) and (CtrlTransacoesPorGrupo.GrupoOrcamentarioxSubDespesa(StrToInt(msGrupo.ValoresChave[0]))) then
    begin
       MsgDlg('Esse lançamento deve ser realizado para um dos Fornecedor/Sub-despesa relacionado a esse Grupo Orçamentário!','Aviso',mtWarning,[mbOk],0);
{       cds.EmptyDataSet;
       cdsContas.EmptyDataSet;
       pnlTotalContas.Caption := 'Total de ' + IntToStr(cdsContas.RecordCount) + ' relacionamento(s)';       }
       Exit;
    end;
    // Edilaine - SOL 190488 / KTN 1909246 - fim

    CdsContas.Data := CtrlTransacoesPorGrupo.ListaSuplContas(iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                             Sistema.IdUsuario,
                                                             StrToInt(msGrupo.ValoresChave[0]),
                                                             iUnidNegoc,
                                                             iPlano,
                                                             iPatro,
                                                             (cboPeriodo.ItemIndex),
                                                             StrToInt(edtExercicio.Text),
                                                             Sistema.IdEmpresa,
                                                             iPrograma,    // Edilaine Ferraresi - SOL 163910 / KTN 1403215
                                                             iTipoDespesa, // Edilaine Ferraresi - SOL 163910 / KTN 1403215
                                                             sCentRespon,
                                                             True,
                                                             ParamEntEsp   // VANDER SOL 172384/9361 KINTANA 1653184
                                                             ); // Alterado por FHBS - SOL: 151660 KTN: 1115295


  Finally
    FreeAndNil(ParamEntEsp);
  End;

  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  //Acerta combobox de critério de rateio conforme na Entrada de Dados
  if (CdsContas.RecordCount > 0) then
  begin
    cboRatCriter.LookupValue := FloatToStr(CtrlTransacoesPorGrupo.Retornar_IdCriterio_porGrupoPeriodo(Sistema.IdEmpresa,
                                                                                                    iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                                                    StrToInt(msGrupo.ValoresChave[0]),
                                                                                                    Trim(edtExercicio.text),
                                                                                                    IntToStr(cboPeriodo.itemIndex)));
  end;



  //Ricardo Freitas SOL 151878 KINTANA 1121523
  //Para consultas do tipo ANUAL, temporariamente não aparece
  pnlDataReferencia.Visible  := (cboPeriodo.ItemIndex <> 0) and (CdsContas.RecordCount > 0);
  dtp_Dt_Referencia.DateTime := Now;
end;

procedure TFrmSuplemDeduPorGrupoMT.CdsContasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00;-#,##0.00';
  TFloatField(DataSet.FieldByName('SALDO')).DisplayFormat         := '#,##0.00;-#,##0.00';
  TFloatField(DataSet.FieldByName('SALDO')).ReadOnly              := True;
  TStringField(DataSet.FieldByname('PERIODOORIGEM')).ReadOnly     := True;
  TStringField(DataSet.FieldByname('EXERCICIOORIGEM')).ReadOnly   := True;
  TStringField(DataSet.FieldByname('IDGRUPOORCORIGEM')).ReadOnly  := True;
  TStringField(DataSet.FieldByname('IDCONTAORIGEM')).ReadOnly     := True;
  TStringField(DataSet.FieldByname('NOMECONTAORCAMEN')).ReadOnly  := True;
  TStringField(DataSet.FieldByname('CENTROCUSTO')).ReadOnly       := True;
  TStringField(DataSet.FieldByname('CENTRORESPON')).ReadOnly      := True;
  TStringField(DataSet.FieldByname('OBSALTERORCAMEN')).ReadOnly   := True;
  TIntegerField(DataSet.FieldByname('IDOPERACAO')).ReadOnly       := True;
  TDateTimeField(DataSet.FieldByName('DATAREFERENCIA')).ReadOnly  := True;



  if DataSet.IsEmpty then
     pnlTotalContas.Caption := 'Total de ' + IntToStr(DataSet.RecordCount) + ' relacionamento(s)'
  else
     pnlTotalContas.Caption := 'Total de ' + IntToStr(DataSet.RecordCount) + ' relacionamento(s) para o grupo ' + DataSet.FieldByName('CODGRUPOORC').AsString + ' - ' + DataSet.FieldByName('NOMEGRUPOORCAMEN').AsString;
end;




procedure TFrmSuplemDeduPorGrupoMT.GridRowChanged(Sender: TObject);
var
  bReadOnly: boolean;

begin
  inherited;
  // Controle para evitar que o usuário fique inserindo registro no grid
  bReadOnly := (CmeCadastro.Operacao <> opInserir);
  if CdsContas.FieldByName('VALIDAR').AsString <> 'S' then
    TFloatField((sender as TwwDBGrid).DataSource.DataSet.FieldByName('VALOR')).ReadOnly := True
  else
    TFloatField((sender as TwwDBGrid).DataSource.DataSet.FieldByName('VALOR')).ReadOnly := bReadOnly;
end;




procedure TFrmSuplemDeduPorGrupoMT.CdsContasBeforePost(DataSet: TDataSet);
var
 rValor: Double;
begin
  inherited;
  //if DataSet.FieldByName('VALOR').AsFloat <> 0 then //William Moreira da Silva - SOL 227156 KTN 2061700
  //begin //William Moreira da Silva - SOL 227156 KTN 2061700
     TStringField(DataSet.FieldByName('SALDO')).ReadOnly := False;

     if DataSet.FieldByName('SALDO').OldValue <> null then
        rValor := DataSet.FieldByName('SALDO').OldValue
     else
        rValor := DataSet.FieldByName('SALDO').AsFloat;

     // Informa se é uma suplementação ou dedução
     if DataSet.FieldByName('VALOR').AsFloat < 0 then
        DataSet.FieldByName('FLGTIPOALTER').AsString := 'R'
     else
        DataSet.FieldByName('FLGTIPOALTER').AsString := 'S';

     DataSet.FieldByName('SALDO').AsFloat := rValor + DataSet.FieldByName('VALOR').AsFloat;
     TStringField(DataSet.FieldByName('SALDO')).ReadOnly := True;
  //end; //William Moreira da Silva - SOL 227156 KTN 2061700
end;




procedure TFrmSuplemDeduPorGrupoMT.GridUpdateFooter(Sender: TObject);
var
   //rTotalSaldo,rTotalSuplemen: Double;    // Edilaine - SOL 190488 / KTN 1909246 - colocado como private
   CdsAux: TClientDataSet;
begin
  inherited;
   try
      rTotalSaldo    := 0;
      rTotalSuplemen := 0;
      CdsAux := TCMClientDataSet.Create(nil);

      CdsAux.Data := CdsContas.Data;
      while not CdsAux.Eof do
      begin
         rTotalSaldo    := rTotalSaldo    + CdsAux.FieldByName('SALDO').AsFloat;
         rTotalSuplemen := rTotalSuplemen + CdsAux.FieldByName('VALOR').AsFloat;
         CdsAux.Next;
      end;

      Grid.ColumnByName('SALDO').FooterValue         := FormatFloat('#,##0.00;-#,##0.00',rTotalSaldo);
      Grid.ColumnByName('VALOR').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rTotalSuplemen);

   finally
      FreeAndNil(CdsAux);
   end;
end;





procedure TFrmSuplemDeduPorGrupoMT.GridExit(Sender: TObject);
begin
  inherited;
  case CdsContas.State of
     dsEdit   : CdsContas.Post;
     dsInsert : CdsContas.Cancel;
  end;
end;




procedure TFrmSuplemDeduPorGrupoMT.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
     if not(Highlight) then
     begin
       if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
       begin
         ABrush.color := clwhite
       end
       else
       begin
         ABrush.Color := $00C0FFFF; //Amarelo Bebê
       end;
     end;
   end
   else
   begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
   end;
end;



procedure TFrmSuplemDeduPorGrupoMT.GridTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TFrmSuplemDeduPorGrupoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  LimparFiltroTela;
  Cds.Cancel;
end;




procedure TFrmSuplemDeduPorGrupoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);

var
  sFlgTipoAlter: string;
  rValor: Double;
  //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui iIdOperacaoCompromisso
  iIdOperacao, iIdOperacaoCompromisso, iIdOperacaoAjuste: integer;
  Dt: TDateTime;
  sMensagemErro : string;   // Edilaine - SOL 190488 / KTN 1909246
begin

  try
     CdsContas.DisableControls;
     CdsContas.First;
     rValor := 0;


     TStringField(Cds.FieldByName('OBSALTERORCAMEN')).ReadOnly := False;
     while not CdsContas.Eof do
     begin
        if CdsContas.FieldByName('VALOR').AsFloat <> 0 then
        begin
           if CdsContas.FieldByName('VALOR').AsFloat > 0 then
           begin
              sFlgTipoAlter := 'S';
              rValor        := CdsContas.FieldByName('VALOR').AsFloat;
           end
           else
           begin
              sFlgTipoAlter := 'R';
              rValor        := (CdsContas.FieldByName('VALOR').AsFloat * -1);
           end;

           Cds.Append;
           if Trim(mmObs.Lines.Text) = '' then
              Cds.FieldByName('OBSALTERORCAMEN').AsString := CdsContas.FieldByName('OBSALTERORCAMEN').AsString
           else
              Cds.FieldByName('OBSALTERORCAMEN').AsString := mmObs.Lines.Text;

           Cds.FieldByName('IDPLANOORCAMEN').AsInteger   := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
           Cds.FieldByName('IDGRUPOORCORIGEM').AsInteger := CdsContas.FieldByName('IDGRUPOORCORIGEM').AsInteger;
           Cds.FieldByName('EXERCICIOORIGEM').AsInteger  := CdsContas.FieldByName('EXERCICIOORIGEM').AsInteger;
           Cds.FieldByName('PERIODOORIGEM').AsInteger    := CdsContas.FieldByName('PERIODOORIGEM').AsInteger;
           Cds.FieldByName('IDPESSOA').AsInteger         := Sistema.IdEmpresa;
           Cds.FieldByName('IDCONTAORIGEM').AsString     := CdsContas.FieldByName('IDCONTAORIGEM').AsString;
           Cds.FieldByName('VALOR').AsFloat              := rValor;
           Cds.FieldByName('DATAREFERENCIA').AsDateTime  := CdsContas.FieldByName('DATAREFERENCIA').AsDateTime;
           Cds.FieldByName('FLGTIPOALTER').AsString      := sFlgTipoAlter;
           // Edilaine - SOL 190488 / KTN 1909246
           Cds.FieldByName('VLRSOLICITADO').AsFloat         := rValor;
           Cds.FieldByName('IDDESPESAORCORIGEM').AsInteger  := CdsContas.FieldByName('IDDESPESAORC').AsInteger;
           Cds.FieldByName('IDDESPESAORCDESTINO').AsInteger := -1;
           // Edilaine - SOL 190488 / KTN 1909246

           Cds.Post;
        end;

        CdsContas.Next;
     end;


     // controlar a transação do processo todo por aqui
     CtrlTransacoesPorGrupo.StartTransaction;              // Edilaine - SOL 190488 / KTN 1909246
     sMensagemErro := '';                                  // Edilaine - SOL 190488 / KTN 1909246

     // Edilaine - SOL 190488 / KTN 1909246
     {A tela deve somente realizar a operação de dedução ou suplementação}
     //Brunno Mattos KTN 1159883  SOL 153584 Inicio - Efetua um compromisso a partir da suplementação
     //ultimo argumento indica que esta sendo chamado a partir da suplementação e por estar fazendo uma suplementação
     //dispensa a verificação do saldo.
     {Accept := CtrlTransacoesPorGrupo.AplicarReservaCompromissoPorGrupo(CdsContas.Data,'C',
                                                                        Modulo.sPermiteSaldoNeg,
                                                                        Sistema.IdModulo,
                                                                        Sistema.IdEmpresa,
                                                                        iIdPlanoOrc,  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                        null,
                                                                        iIdOperacao,
                                                                        False,
                                                                        True);
     if not Accept then
     begin
        MsgDlg('Não foi possível efetuar a suplementação/dedução de saldos entre grupo de contas orçamentárias.','Erro',mtError,[mbOk],0);
        Exit;
     end;

     //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui iIdOperacaoCompromisso
     iIdOperacaoCompromisso := iIdOperacao;
     //Brunno Mattos KTN 1159883  SOL 153584 Fim
     }  // Edilaine - SOL 190488 / KTN 1909246 - fim

     Accept := CtrlAlterOrcamento.GravaSuplemeDeducaoPorGrupo(iIdPlanoOrc {Modulo.iPlanoOrc}, iIdOperacao);  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
     if not Accept then
     begin
        sMensagemErro := 'Não foi possível efetuar a suplementação/dedução de saldos entre grupo de contas orçamentárias.' + #13 +
                         'Motivo: ' + CtrlAlterorcamento.MessageInfo;
     end;

     // Edilaine - SOL 190488 / KTN 1909246
     {A tela deve somente realizar a operação de dedução ou suplementação}
     //Brunno Mattos SOL 153584/4161  KTN 1170663 Inicio
     //iIdOperacaoAjuste := iIdOperacao;
     //Accept := CtrlAlterOrcamento.GravouCompromissoXAjuste(iIdOperacaoCompromisso, iIdOperacao);
     //if not Accept then
     //   MsgDlg('Não foi possível associar a suplementação/dedução ao compromisso.','Erro',mtError,[mbOk],0)
     //else
     begin
       iIdOperacaoAjuste := iIdOperacao;

       CtrlTransacoesPorGrupo.Commit;  // Edilaine - SOL 190488 / KTN 1909246

       // Edilaine - SOL 190488 / KTN 1909246
       MsgDlg('Foi gerado para o ajuste realizado o número de operação '+ IntToStr(iIdOperacaoAjuste) + '.' ,'Informação',mtInformation,[mbOk],0);
       //       'e para o compromisso desse ajuste, foi gerado o número de operação ' + IntToStr(iIdOperacaoCompromisso) + '.' ,'Informação',mtInformation,[mbOk],0);
       // Edilaine - SOL 190488 / KTN 1909246 - fim

       //Brunno Mattos SOL 153584/4161  KTN 1170663 Fim
       CdsContas.EnableControls;
       //Ricardo de Freitas - 151907 Puxa a data de referencia diretamente do
       //cds pois a data poderá ter sido editada
       Dt := Grid.DataSource.DataSet.fieldbyname('DATAREFERENCIA').Asdatetime;
       Cds.Data := CtrlTransacoesPorGrupo.ListaSuplementacoes(iIdPlanoOrc, {Modulo.iPlanoOrc,}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                             (cboPeriodo.ItemIndex),
                                                              Trunc(edtExercicio.Value),
                                                              StrToInt(msGrupo.ValoresChave[0]),
                                                              Sistema.IdEmpresa,
                                                              iIdOperacao,
                                                              Dt);
       CdsContas.Data := Cds.Data;
       LimparFiltroTela;

     end;

     // Edilaine - SOL 190488 / KTN 1909246
     if not Accept then
     begin
       CtrlTransacoesPorGrupo.Rollback;

       MsgDlg(sMensagemErro,'Erro',mtError,[mbOk],0);
     end;
     // Edilaine - SOL 190488 / KTN 1909246 - fim

  finally
     TStringField(Cds.FieldByName('OBSALTERORCAMEN')).ReadOnly := True;
     CmeCadastro.AtualizaBotoes(self);

     inherited;
  end;
end;




procedure TFrmSuplemDeduPorGrupoMT.bbtnConfirmarClick(Sender: TObject);
begin
  //Ricardo Freitas SOL 151868 KINTANA 1121523
  Grid.RefreshDisplay;
  pnlDataReferencia.Visible := false;
  CmeCadastro.RepetirInsert := False;
  inherited;
end;


procedure TFrmSuplemDeduPorGrupoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    //Ricardo Freitas SOL 151868 KINTANA 1121523 Inicio
    edtExercicio.Value   := StrToInt(MontaSelect.ValoresChave[1]);
    cboPeriodo.ItemIndex := StrToInt(MontaSelect.ValoresChave[0]);
    edtDescGrupo.Text    := MontaSelect.ValoresChave[5]+'-'+MontaSelect.ValoresChave[6];
    mmObs.Lines.Text     := MontaSelect.ValoresChave[7];
    //Ricardo Freitas SOL 151868 KINTANA 1121523 Fim

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    cdsPlanoOrc.Data                 := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( MontaSelect.ValoresChave[5] );
    cboPlanoOrcamentario.LookupValue := MontaSelect.ValoresChave[9];
    edtFornecedoresSubDespesas.text  := CtrlTransacoesPorGrupo.GetFornecedorSubDespesa( StrToInt(MontaSelect.ValoresChave[8]) );
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    iIdPlanoOrc := StrToIntDef(MontaSelect.ValoresChave[9], -1);   // Edilaine - SOL 190488 / KTN 1909246

     Cds.Data := CtrlTransacoesPorGrupo.ListaSuplementacoes(iIdPlanoOrc, {Modulo.iPlanoOrc,}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                            StrToInt(MontaSelect.ValoresChave[0]),
                                                            StrToInt(MontaSelect.ValoresChave[1]),
                                                            StrToInt(MontaSelect.ValoresChave[2]),
                                                            Sistema.IdEmpresa,
                                                            StrToInt(MontaSelect.ValoresChave[4]),
                                                            StrToDate(MontaSelect.ValoresChave[3]));
     CdsContas.Data := Cds.Data;
  end;
end;




procedure TFrmSuplemDeduPorGrupoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
var
  iIdOperacao : Integer; //Brunno Mattos SOL 153584/4161  KTN 1170663
  sMensagemErro : string;   // Edilaine - SOL 190488 / KTN 1909246
begin
  inherited;

  Cds.First;
  //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui if
  if Cds.FieldByName('IDOPERACAO').AsString <> '' then
     iIdOperacao := Cds.FieldByName('IDOPERACAO').AsInteger;
  while not Cds.Eof do
     Cds.Delete;

  // Controle de transação dos processos
  CtrlTransacoesPorGrupo.StartTransaction;              // Edilaine - SOL 190488 / KTN 1909246
  sMensagemErro := '';                                  // Edilaine - SOL 190488 / KTN 1909246

  // Edilaine - SOL 190488 / KTN 1909246
  {tela deve somente realizar a operação de dedução ou suplementação }
  //Brunno Mattos SOL 153584/4161  KTN 1170663 Inicio
  //Realiza exclusão da tabela COMPROMISSOXAJUSTE
  {Accept := CtrlAlterOrcamento.ExcluiCompromissoXAjuste(iIdOperacao);
  if not Accept then
  begin
    MsgDlg('Não foi possível efetuar exclusão do vínculo entre suplementação/dedução e compromisso.','Erro',mtError, [mbOk], 0);
    Exit;
  end;

  //Seta FLGSTATUS do compromisso = 'C"(Cancelada)
  Accept := CtrlTransacoesPorGrupo.CancelaReservaCompromisso(CdsContas.Data,
                                                             'C',
                                                             False,
                                                             Sistema.IdEmpresa,
                                                             True);
  if not Accept then
  begin
    MsgDlg('Não foi possível cancelar os compromissos. ' +
           'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0);
    Exit;
  end;
  }  // Edilaine - SOL 190488 / KTN 1909246 - fim comentario

  //Realiza exclusão da tabela RESERVAORCAMEN e atualiza SALDOORCADO
  {Accept := CtrlTransacoesPorGrupo.ExluirReservasCompromissoPorGrupo(CdsContas.Data,
                                                                     'C',
                                                                     Sistema.IdEmpresa,
                                                                     Modulo.iPlanoOrc);
  if not Accept then
  begin
    MsgDlg('Não foi possível efetuar exclusão do compromisso gerado a partir deste ajuste','Erro',mtError, [mbOk], 0);
    Exit;
  end; }

  //Brunno Mattos SOL 153584/4161  KTN 1170663 Fim

  Accept := CtrlAlterOrcamento.ExcluiSuplemeDeducaoPorGrupo(iIdPlanoOrc {Modulo.iPlanoOrc});   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
  if not Accept then
     sMensagemErro := 'Não foi possível efetuar exclusão da suplementação/dedução de saldos entre grupo de contas orçamentárias.' + #13 +   // Edilaine - SOL 190488 / KTN 1909246
                      'Motivo: ' + CtrlAlterorcamento.MessageInfo
     //MsgDlg('Não foi possível efetuar exclusão da suplementação/dedução de saldos entre grupo de contas orçamentárias.' + #13 +
     //       'Motivo: ' + CtrlAlterorcamento.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
    CtrlTransacoesPorGrupo.Commit;  // Edilaine - SOL 190488 / KTN 1909246

    CdsContas.EmptyDataSet;
  end;


  // Edilaine - SOL 190488 / KTN 1909246
  if not Accept then
  begin
    CtrlTransacoesPorGrupo.Rollback;

    MsgDlg(sMensagemErro,'Erro',mtError,[mbOk],0);
  end;
  // Edilaine - SOL 190488 / KTN 1909246 - fim


  CmeCadastro.AtualizaBotoes(self);

end;




procedure TFrmSuplemDeduPorGrupoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlDataReferencia.Visible := false;
  Cds.EmptyDataSet;
  CdsContas.EmptyDataSet;
  LimparFiltroTela;
end;




procedure TFrmSuplemDeduPorGrupoMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  Cds.Data       := CtrlTransacoesPorGrupo.ListaSuplementacoes(-1,-1,-1,-1,-1,-1,-1);
  CdsContas.Data := Cds.Data;
end;




procedure TFrmSuplemDeduPorGrupoMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  // Edilaine - SOL 190488 / KTN 1909246
  if (rTotalSuplemen = 0) then
  begin
     Application.MessageBox('Favor informar o valor total de rateio.','Atenção',48);
     Abort;
  end;
  
  inherited;
  Accept := not (CdsContas.IsEmpty);
  if not Accept then
     MsgDlg('Não há nenhum grupo selecionado!','Aviso',mtWarning,[mbOk],0);
end;




procedure TFrmSuplemDeduPorGrupoMT.GridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  if AFieldName <> 'OBSALTERORCAMEN' then
     CdsContas.IndexFieldNames := AFieldName;
end;

procedure TFrmSuplemDeduPorGrupoMT.LimparFiltroTela;
begin
   edtDescGrupo.Clear;
   cboPatroOrigem.Clear;
   cboPlanoPrevidenciarioOrigem.Clear;
   cboAtivProjeto.clear;
   cboPrograma.clear;
   cboTipoDespesa.clear;
   mmObs.Lines.Clear;

   //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
   cboPlanoOrcamentario.Clear;
   cboCentroCusto.Clear;
   edtFornecedoresSubDespesas.Clear;
   //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

   edtVlrRateio.Value   := 0;    // Edilaine - SOL 190488 / KTN 1909246
   cboPeriodo.ItemIndex := 0;    // Edilaine - SOL 190488 / KTN 1909246
end;


procedure TFrmSuplemDeduPorGrupoMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.IsEmpty then
     pnlTotalContas.Caption := 'Total de ' + IntToStr(DataSet.RecordCount) + ' relacionamento(s)'
  else
     pnlTotalContas.Caption := 'Total de ' + IntToStr(DataSet.RecordCount) + ' relacionamento(s) para o grupo ' + DataSet.FieldByName('CODGRUPOORC').AsString + ' - ' + DataSet.FieldByName('NOMEGRUPOORCAMEN').AsString;
end;

procedure TFrmSuplemDeduPorGrupoMT.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
var
  sSQL,sSQLUnion: TStrings;
  iOrderBy: integer;
begin
  inherited;
  try
     sSQL      := TStringList.Create;
     sSQLUnion := TStringList.Create;

     sSQL.Text      := sqlText;
     sSQLUnion.Text := sqlText;

     sSQLUnion.Strings[2]  := 'GRUPOORCAMEN.NOMEGRUPOORCAMEN || '' - Anual'' AS C1, ';
     sSQLUnion.Strings[3]  := '0 AS C2, ';
     //sSQLUnion.Strings[10]  := '0 AS C9, '; //Renan Cristiano SOL 152790 KINTANA 1145737 inicio
     sSQLUnion.Strings[11]  := '0 AS C10, '; //Renan Cristiano SOL 152790 KINTANA 1145737 inicio

     //Brunno 153584/4161 inicio
     sSQLUnion.Strings[5]  := 'to_date(to_char(ALTERORCAMENTO.DATAREFERENCIA, ''yyyy''), ''yyyy'') as C4,';
{
     sSQLUnion.Strings[13] := 'to_date(to_char(ALTERORCAMENTO.DATAREFERENCIA, ''yyyy''), ''yyyy'') as C12,';

     sSQLUnion.Strings[17] := '''0'' as C16';
}
     sSQLUnion.Strings[14] := 'to_date(to_char(ALTERORCAMENTO.DATAREFERENCIA, ''yyyy''), ''yyyy'') as C13,';

     sSQLUnion.Strings[18] := '''0'' as C17,';
     //Brunno 153584/4161 fim

     if pos('ALTERORCAMENTO.IDOPERACAO', strListParams.Text) = 0 Then
     begin
          sSQLUnion.Strings[8]  := '0 as C7,';
          sSQLUnion.Strings[9]  := '0 as C8,';
          //sSQLUnion.Strings[14] := '0 as C13,';
          sSQLUnion.Strings[15] := '0 as C14,';
     end;

     iOrderBy := (sSQL.Count - 1);

     sSQL.Strings[iOrderBy] := '';
     sSQLUnion.Strings[iOrderBy] := ' ORDER BY C0 ASC, C3, C2 ';

     sqlText := sSQL.Text + ' UNION ' + #13#10 + sSQLUnion.Text;

  finally
     FreeAndNil(sSQL);
     FreeAndNil(sSQLUnion);
  end;
end;

//Ricardo Freitas SOL 151878 KINTANA 1121523
procedure TFrmSuplemDeduPorGrupoMT.btnEditaDtReferClick(Sender: TObject);
var
   bEditar:Boolean;
begin
  inherited;

  bEditar := true;

  //Mensal
  if cboPeriodo.ItemIndex <> 0 then
  begin
       if dtp_Dt_Referencia.DateTime <  StrToDateTime('01/' + FormatFloat('00',cboPeriodo.ItemIndex)+'/' + Trim(edtExercicio.Text))then
       begin
          bEditar := false;
       end;
  end;

  if not bEditar then
     Application.MessageBox('Data de referência inválida.','Atenção',48);

  if bEditar then
     CtrlTransacoesPorGrupo.EditarDatasReferencia(grid.DataSource.Dataset, StrToDateTime(FormatDatetime('dd/mm/yyyy',dtp_Dt_Referencia.Datetime)));

end;

procedure TFrmSuplemDeduPorGrupoMT.bbtnCancelarClick(Sender: TObject);
begin
  pnlDataReferencia.Visible := false;
  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  LimparFiltroTela;
  inherited;
end;

procedure TFrmSuplemDeduPorGrupoMT.btCalcularRatClick(Sender: TObject);
var
 sValor: string;
 iIdSubDespesa : integer;  // Edilaine - SOL 190488 / KTN 1909246
begin
  //Ricardo SOL 122291 KINTANA 597829
  if (edtVlrRateio.Value = 0) then
  begin
     Application.MessageBox('Favor informar o valor total de rateio.','Atenção',48);
     Exit;
  end;

  Grid.RefreshDisplay;

  inherited;
  if CmeCadastro.Operacao = opInserir then
  begin
     if not CtrlTransacoesPorGrupo.CalcularRateio(CdsContas,
                                                  StrToIntDef(cboRatCriter.LookupValue,-1),
                                                  Sistema.IdEmpresa,
                                                  edtVlrRateio.Value,
                                                  '',
                                                  StrToIntDef(cboPlanoPrevidenciarioOrigem.LookupValue,-1),
                                                  StrToIntDef(cboPatroOrigem.LookupValue,-1),
                                                  cboAtivProjeto.text,  {'',}                 // Edilaine - SOL 190488 / KTN 1909246
                                                  '',
                                                  //Ricardo SOL 159248 KTN 1337823
                                                  cboPrograma.Text,   {'', //Programa}        // Edilaine - SOL 190488 / KTN 1909246
                                                  cboTipoDespesa.Text {'', //Tipo de Despesa} // Edilaine - SOL 190488 / KTN 1909246
                                                  //Ricardo SOL 159248 KTN 1337823 - fim

                                                  false,  {True,}                             // Edilaine - SOL 190488 / KTN 1909246
                                                  cboPeriodo.ItemIndex,
                                                  StrToIntDef(edtExercicio.Text, 0)) then
        MsgDlg('Não foi possível efetuar o rateio. ' + #13 +
               'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0)
     else
     begin
       // É necessário fazer isto somente para
       //atualizar o valor totalizador do grid
       CdsContas.Edit;
       CdsContas.Post;
       // Ajusta os centavos divergentes devido ao rateio
       if Grid.ColumnByName('VALOR').FooterValue <> edtVlrRateio.Text then
       begin
          sValor := StringReplace(Grid.ColumnByName('VALOR').FooterValue,'.','',[rfReplaceAll]);
          CdsContas.Edit;
          CdsContas.FieldByName('VALOR').AsFloat := (CdsContas.FieldByName('VALOR').AsFloat + (edtVlrRateio.Value - StrToFloat(sValor)));
          CdsContas.Post;
       end;
     end;
   end;

   VerificaZeraSaldo;
end;

procedure TFrmSuplemDeduPorGrupoMT.VerificaZeraSaldo;
var
    sSaldo, rValor:double;

begin
     //Ricardo SOL: 151907 - KINTANA Zera valores caso o saldo total for zerado no rateio
     sSaldo := 0;

     if (Trim(Grid.ColumnByName('SALDO').FooterValue) <> '') then
        sSaldo := StrToCurr(Trim(StringReplace(Grid.ColumnByName('SALDO').FooterValue,'.','',[rfReplaceAll])));

     if (sSaldo = 0) then
     begin
         cdsContas.BeforePost := nil;
         cdsContas.First;

         while not cdsContas.eof Do
         begin
              cdsContas.Edit;
              cdsContas.FieldByName('SALDO').ReadOnly := false;
              cdsContas.FieldByName('SALDO').AsFloat := 0;
              cdsContas.Post;
              cdsContas.Next;
         end;

         cdsContas.First;
         cdsContas.FieldByName('SALDO').ReadOnly := true;
         cdsContas.BeforePost := nil;

     end;
     Application.ProcessMessages;
end;




procedure TFrmSuplemDeduPorGrupoMT.btBuscFornClick(Sender: TObject);
begin
  inherited;
  MsDespesa.Filtro.Clear;
  MsDespesa.Filtro.Add('D.IDFORNECEDOR = P.IDPESSOA(+) ');

  if (Trim(edtDescGrupo.text) <> '') then
     MsDespesa.Filtro.Add('D.IDGRUPOORCAMEN = ' + Quotedstr( msGrupo.ValoresChave[0]) );

  if cboCentroCusto.LookupValue <> '' then   // listando despesas que tenham o c. custo selecionado
     MsDespesa.Filtro.Add('(D.IDDESPESAORC in (SELECT DC.IDDESPESAORC FROM DESPESAORCXCCUSTO DC WHERE DC.CODCENTROCUSTO = '+QuotedStr(cboCentroCusto.LookupValue)+') )');

  MsDespesa.Executar;
  Repaint;

  edtFornecedoresSubDespesas.text := '';
  If MsDespesa.RetornouValor Then
  begin
    if MsDespesa.ValoresChave[3] <> '' then
       edtFornecedoresSubDespesas.text := MsDespesa.ValoresChave[3] + '/';
    edtFornecedoresSubDespesas.text := edtFornecedoresSubDespesas.text + MsDespesa.ValoresChave[2];
     {
    if not cds.IsEmpty then
       Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,-1);
     }
  end;
end;

end.
