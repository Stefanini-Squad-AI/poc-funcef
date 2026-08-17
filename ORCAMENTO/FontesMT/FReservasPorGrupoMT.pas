{--------------------------------------------------------------------------------------------------
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
Nº SOL......: 163904
Nº KINTANA..: 1403198
Data........: 06/01/2012
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
Rotina......: FormCreate,btSelContasClick
Nº SOL......: 153918
Nº KINTANA..: 1166699
Data........: 01/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Acertar combobox de critério de rateio grupo\periodo definido na Entrada de
              Dados Especial.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btCalcularRatClick
Nº SOL......: 153803
Nº KINTANA..: 1163260
Data........: 28/02/2011
Responsável.: Brunno Mattos
Descrição...: Adicionei mais três parâmetros ao chamar função CalcularRateio
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btCalcularRatClick
Nº SOL......: 151907
Nº KINTANA..: XXXXXX
Data........: 04/01/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Zera valores caso o saldo total for zerado no rateio
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
              Grupo/Periodo/Exercício e retirada de joins nas tabelas PESSOA,
              PLANPREVCONTABIL,PLANOTRABALHOORC pois eram desnecessários por causa
              de performance
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
Rotina......: AfterOpen
Nº SOL......: 151868
Nº KINTANA..: 1121523
Data........: 01/01/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Permitir editar o campo data referência diretamente no grid.
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
unit FReservasPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo, wwdbdatetimepicker,
  CMDateTimePicker, TREdit, uCtrlPlanPrevContabPatro,
  uCtrlPadroes, uCtrlTransacoesPorGrupo, uSistema, uModulo, uMensErro, uData,
  uString, uCtrlPlanPrevContabil, uCtrlPatro, uDiasUteis, uCmTypes,
  ComCtrls, wwriched, uCtrlPeriodoOrcamen;

type
  TFrmReservasPorGrupoMT = class(TFrmCadastroMT)
    CdsPatro: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    grid: TwwDBGrid;
    pnlBottom: TPanel;
    Label1: TLabel;
    edtDescGrupo: TEdit;
    btBuscGrupo: TSpeedButton;
    Label4: TLabel;
    cboPatro: TCMDBLookupCombo;
    Label3: TLabel;
    cboPlanoPrevidenciario: TCMDBLookupCombo;
    btSelContas: TBitBtn;
    CdsRatCriter: TCMClientDataSet;
    Label6: TLabel;
    cboRatCriter: TCMDBLookupCombo;
    Label7: TLabel;
    edtVlrRateio: TDBRealEdit;
    btCalcularRat: TSpeedButton;
    btCancelar: TToolbarButton97;
    Label20: TLabel;
    cboPeriodo: TComboBox;
    edtExercicio: TDBRealEdit;
    Label22: TLabel;
    Label5: TLabel;
    mmObs: TMemo;
    rcEditor: TwwDBRichEdit;
    pnlTotalContas: TPanel;
    btMarcaTodos: TSpeedButton;
    btInverteSel: TSpeedButton;
    pnlDataReferencia: TPanel;
    lbl1: TLabel;
    btnEditaDtRefer: TButton;
    dtp_Dt_Referencia: TCMDateTimePicker;
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
    cdsCCusto: TCMClientDataSet;
    cboCentroCusto: TCMDBLookupCombo;
    msGrupo: TMontaSelect;
    msDespesa: TMontaSelect;
    Shape1: TShape;
    Label2: TLabel;
    procedure btBuscGrupoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSelContasClick(Sender: TObject);
    procedure btCalcularRatClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure gridUpdateFooter(Sender: TObject);
    procedure gridRowChanged(Sender: TObject);
    procedure CdsBeforePost(DataSet: TDataSet);
    procedure gridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure gridTopRowChanged(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure gridExit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure gridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure btCancelarClick(Sender: TObject);
    procedure btMarcaTodosClick(Sender: TObject);
    procedure btInverteSelClick(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure btnEditaDtReferClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btBuscFornClick(Sender: TObject);
  private
    { Private declarations }
    iIdPlanoOrc : integer;   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;
    CtrlPlanPrevContabil    : TCtrlPlanPrevContabil;
    CtrlPatro               : TCtrlPatro;
    CtrlPeriodoOrcamen      : TCtrlPeriodoOrcamen;

    procedure LimparFiltrosTela;
    procedure VerificaZeraSaldo;

  public
    { Public declarations }
  end;




var
  FrmReservasPorGrupoMT: TFrmReservasPorGrupoMT;

implementation

uses FEntDadosPorGrupoMT, uFuncoesOrcamento;

{$R *.DFM}

procedure TFrmReservasPorGrupoMT.btBuscGrupoClick(Sender: TObject);
begin
  inherited;
  msGrupo.Executar;
  if msGrupo.RetornouValor then
  begin
    edtDescGrupo.Text         := msGrupo.ValoresChave[2] + '-' + msGrupo.ValoresChave[1];

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( msGrupo.ValoresChave[2] );
    cboPlanoOrcamentario.LookupValue := msGrupo.ValoresChave[3];
    if cdsPlanoOrc.FieldByName('ANO').AsString <> '' then
       edtExercicio.Text := cdsPlanoOrc.FieldByName('ANO').AsString;
    edtFornecedoresSubDespesas.text := '';
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    iIdPlanoOrc := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

  end;
end;

procedure TFrmReservasPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlTransacoesPorGrupo  := TCtrlTransacoesPorGrupo.Create;
  CtrlPlanPrevContabil    := TCtrlPlanPrevContabil.Create;
  CtrlPatro               := TCtrlPatro.Create;
  CtrlPeriodoOrcamen      := TCtrlPeriodoOrcamen.Create;

  CtrlPlanPrevContabPatro.InitializeAs(Padroes);
  CtrlTransacoesPorGrupo.InitializeAs(padroes);
  CtrlPlanPrevContabil.InitializeAs(Padroes);
  CtrlPatro.InitializeAs(Padroes);
  CtrlPeriodoOrcamen.InitializeAs(Padroes);

  // Edilaine Ferraresi - SOL 163904 / KTN 1403198
  cdsTipoDespesa.Data     := CtrlTransacoesPorGrupo.ListaTipoDespesa;
  cdsPrograma.Data        := CtrlTransacoesPorGrupo.ListaPrograma;
  cdsAtivProjeto.Data     := CtrlTransacoesPorGrupo.ListaAtividadeProj;
  // Edilaine Ferraresi - SOL 163904 / KTN 1403198 - fim

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento('-1');
  cdsCCusto.Data   := CtrlTransacoesPorGrupo.ListaCentroCusto;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  Cds.Data          := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('R','',-1,-1,-1,-1,-1,-1,-1);
  CdsPlano.Data     := CtrlTransacoesPorGrupo.ListaPlano;
  CdsPatro.Data     := CtrlTransacoesPorGrupo.ListaPatro;
  //CdsPlanoTrab.Data := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario,Sistema.IdEmpresa,Date); // Alterado por FHBS - SOL: 150183 KTN: 1087556
  CdsRatCriter.Data := CtrlTransacoesPorGrupo.ListaReservaRatCriter(Sistema.IdEmpresa);

  //msGrupo.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

  cboPeriodo.ItemIndex  := (DiasUteis.ExtraiMes(date));
  edtExercicio.Value    := DiasUteis.ExtraiAno(date);

  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  cboRatCriter.LookupValue := '-1';
  cboRatCriter.Enabled     := false;
end;




procedure TFrmReservasPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlTransacoesPorGrupo);
  FreeAndNil(CtrlPlanPrevContabil);
  FreeAndNil(CtrlPatro);
  FreeAndNil(CtrlPeriodoOrcamen);
  inherited;
end;




procedure TFrmReservasPorGrupoMT.btSelContasClick(Sender: TObject);
var
   iUnidNegoc,iIdPlano,iIdPatro: integer;
   iPrograma     : integer;
   iTipoDespesa  : integer;
   sCodCentRespon: string;

   //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
   ParamEntEsp : TParamEntradaEspecial;
   //FIM    - VANDER SOL 172384/9361 KINTANA 1653184
begin
  inherited;

  if Trim(edtDescGrupo.Text) = '' then
  begin
     MsgDlg('Informe um grupo de contas orçamentárias!','Aviso',mtWarning,[mbOK],0);
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
  iUnidNegoc     := 0;
  sCodCentRespon := '';
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184  


  if Trim(cboPlanoPrevidenciario.Text) <> '' then
     iIdPlano := StrToInt(cboPlanoPrevidenciario.LookupValue)
  else
     iIdPlano := -1;

  if Trim(cboPatro.Text) <> '' then
     iIdPatro := StrToInt(cboPatro.LookupValue)
  else
     iIdPatro := -1;

  if (iIdPlano <> -1) and (iIdPatro <> -1) then
    if not CtrlPlanPrevContabPatro.ValidaPlanoPatro (iIdPatro, iIdPlano) then begin
      MsgDlg (CtrlPlanPrevContabPatro.MessageInfo, 'Relacionamento Inválido', mtWarning, [mbok], 0);
      exit;
    end;

  // Edilaine Ferraresi - SOL 163904 / KTN 1403198

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

  // Edilaine Ferraresi - SOL 163904 / KTN 1403198 - fim

  if not CtrlPeriodoOrcamen.PeriodoLiberado('1/' +
                                            IntToStr(cboPeriodo.ItemIndex) + '/' +
                                            FloatToStr(edtExercicio.Value),
                                            Sistema.Idempresa) then
  begin
     MsgDlg('Período BLOQUEADO para lançamentos e alterações!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;


  // Só faz a crítica de saldo caso o parâmetro obrigue os processos com saldo
  if Modulo.sPermiteSaldoNeg = 'N' then
  begin
     if not CtrlTransacoesPorGrupo.VerificaSaldoGrupo(StrToInt(msGrupo.ValoresChave[0]),
                                                      (cboPeriodo.ItemIndex),
                                                       Trunc(edtExercicio.Value),
                                                       Sistema.IdEmpresa,
                                                       iIdPlanoOrc {Modulo.iPlanoOrc} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                       ) then
     begin
        MsgDlg('Não há saldo lançado para este grupo orçamentário neste período/exercício','Aviso',mtWarning,[mbOk],0);
        Exit;
     end;
  end;


  { VANDER SOL 172384/9361 KINTANA 1653184 -> Try Finally adicionado para o uso de "ParamEntEsp" }
  ParamEntEsp := TParamEntradaEspecial.Create(TRUE);
  Try
    With ParamEntEsp.Parametros do
    Begin
      iIdPlanoOrc   := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);
      sCodCCusto    := Trim(cboCentroCusto.LookupValue);
      //iIdSubDespesa := StrToIntDef(edtFornecedoresSubDespesas.Text,  -1);
      If MsDespesa.RetornouValor Then
         iIdSubDespesa := StrToIntDef(msDespesa.ValoresChave[0],  -1);

      With ParamEntEsp.ReservaOrcamentaria do
        if Trim(mmObs.Text) <> '' Then
           ObsReserva := mmObs.Text;

    End;
    //
    Cds.Data := CtrlTransacoesPorGrupo.ListaContas(iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEmpresa,
                                                   StrToInt(msGrupo.ValoresChave[0]),
                                                   iUnidNegoc,
                                                   iIdPlano,
                                                   iIdPatro,
                                                   (cboPeriodo.ItemIndex),
                                                   Trunc(edtExercicio.Value),
                                                   sCodCentRespon,
                                                   '      ',
                                                   True,
                                                   iPrograma,    // Edilaine Ferraresi - SOL 163904 / KTN 1403198
                                                   iTipoDespesa, // Edilaine Ferraresi - SOL 163904 / KTN 1403198
                                                   ParamEntEsp   // VANDER SOL 172384/9361 KINTANA 1653184
                                                   ); // Alterado por FHBS - SOL: 151660 KTN: 1115295);
    //
  Finally
    FreeAndNil(ParamEntEsp);
  End;


  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  //Acerta combobox de critério de rateio conforme na Entrada de Dados
  if (cds.RecordCount > 0) then
  begin
    cboRatCriter.LookupValue := FloatToStr(CtrlTransacoesPorGrupo.Retornar_IdCriterio_porGrupoPeriodo(Sistema.IdEmpresa,
                                                                                                    iIdPlanoorc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                                                    StrToInt(msGrupo.ValoresChave[0]),
                                                                                                    Trim(edtExercicio.text),
                                                                                                    IntToStr(cboPeriodo.itemIndex)));
  end;

  //Ricardo Freitas SOL 151878 KINTANA 1121523
  //Para consultas do tipo ANUAL, temporariamente não aparece
  pnlDataReferencia.Visible  := (cboPeriodo.ItemIndex <> 0) and (cds.RecordCount > 0);
  dtp_Dt_Referencia.DateTime := Now;
end;


procedure TFrmReservasPorGrupoMT.btCalcularRatClick(Sender: TObject);
var
  sValor: string;
  sSaldo :Double;
begin

  //Ricardo SOL 122291 KINTANA 597829
  if (edtVlrRateio.Value = 0) then
  begin
     Application.MessageBox('Favor informar o valor total de rateio.','Atenção',48);
     Exit;
  end;

  //Ricardo Freitas SOL 151868 KINTANA 1121523
  Grid.RefreshDisplay;
  inherited;
  if CmeCadastro.Operacao = opInserir then
  begin
     if not CtrlTransacoesPorGrupo.CalcularRateio(Cds,
                                                  StrToIntDef(cboRatCriter.LookupValue,-1),
                                                  Sistema.IdEmpresa,
                                                  edtVlrRateio.Value,
                                                  '',
                                                  StrToIntDef(cboPlanoPrevidenciario.LookupValue,-1),
                                                  StrToIntDef(cboPatro.LookupValue,-1),
                                                  '',
                                                  '',
                                                  //Ricardo SOL 159248 KTN 1337823
                                                  '', //Programa
                                                  '', //Tipo de Despesa
                                                  //Ricardo SOL 159248 KTN 1337823 - fim
                                                  //Brunno Mattos SOL 153803 KINTANA 1163260 adicionei três últimos parâmetros
                                                  True,
                                                  cboPeriodo.ItemIndex,
                                                  StrToIntDef(edtExercicio.Text, 0)) then



        MsgDlg('Não foi possível efetuar o rateio. ' + #13 +
               'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0)
     else
     begin
       // É necessário fazer isto somente para
       //atualizar o valor totalizador do grid
       Cds.Edit;
       Cds.Post;

       // Ajusta os centavos divergentes devido ao rateio
       if Grid.ColumnByName('VALOR').FooterValue <> edtVlrRateio.Text then
       begin
          sValor := StringReplace(Grid.ColumnByName('VALOR').FooterValue,'.','',[rfReplaceAll]);
          Cds.Edit;
          Cds.FieldByName('VALOR').AsFloat := (Cds.FieldByName('VALOR').AsFloat + (edtVlrRateio.Value - StrToFloat(sValor)));
          Cds.Post;
       end;
     end;
  end;

  //Ricardo SOL: 151907 - KINTANA 
  VerificaZeraSaldo;

end;




procedure TFrmReservasPorGrupoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTransacoesPorGrupo.ExluirReservasCompromissoPorGrupo(Cds.Data,'R',
                                                                     Sistema.IdEmpresa,
                                                                     iIdPlanoOrc {Modulo.iPlanoOrc}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                     );
  if not Accept then
  begin
     MsgDlg('Houve um erro ao tentar excluir as reservas do grupo. ' + #13 +
            'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0);
     Exit;
  end
  else
  begin
     Cds.EmptyDataSet;
     LimparFiltrosTela;
  end;
end;




procedure TFrmReservasPorGrupoMT.CDsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  //Ricardo Freitas SOL 151868 KINTANA 1121523 - Comentado TDateTimeField(CDs.FieldByName('DATAREFERENCIA')).ReadOnly := True;
  TDateTimeField(CDs.FieldByName('DATAREFERENCIA')).ReadOnly := false;
  TFloatField(CDs.FieldByName('VALOR')).EditFormat      := '#,##0.00';
  TFloatField(CDs.FieldByName('VALOR')).DisplayFormat   := '#,##0.00';
  TFloatField(CDs.FieldByName('SALDO')).DisplayFormat        := '#,##0.00';
  TFloatField(CDs.FieldByName('SALDO')).ReadOnly             := True;
  TStringField(CDs.FieldByName('IDCONTAORCAMEN')).ReadOnly   := True;
  TIntegerField(CDs.FieldByName('PERIODO')).ReadOnly         := True;
  TIntegerField(CDs.FieldByName('EXERCICIO')).ReadOnly       := True;
  TStringField(CDs.FieldByName('CENTRORESPON')).ReadOnly     := True;
  TStringField(CDs.FieldByName('CENTROCUSTO')).ReadOnly      := True;
  TIntegerField(Cds.FieldByName('IDOPERACAO')).ReadOnly      := True;

  TStringField(CDs.FieldByName('PLANO')).ReadOnly            := True;
  TStringField(CDs.FieldByName('PATRO')).ReadOnly            := True;
  TStringField(CDs.FieldByName('DESCRESERVA')).ReadOnly      := True;
  TStringField(CDs.FieldByName('NUMRESERVA')).ReadOnly       := True;

  TStringField(CDs.FieldByName('OBSRESERVA')).ReadOnly      := True;
  TStringField(CDs.FieldByName('USUARIO')).ReadOnly         := True;

  btCancelar.Enabled := ((not (Cds.IsEmpty)) and
                         (CmeCadastro.Operacao <> opInserir) and
                         (Cds.FieldByName('FLGRESERVA').AsString = 'A')  );

  TStringField(Cds.FieldByName('VALIDAR')).Visible := btCancelar.Enabled;
  btMarcaTodos.Visible := btCancelar.Enabled;
  btInverteSel.Visible := btCancelar.Enabled;

  if Cds.IsEmpty then
     pnlTotalContas.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' reserva(s)'
  else
     pnlTotalContas.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' reserva(s) para o grupo ' + Cds.FieldByName('CODGRUPOORC').AsString + ' - ' + Cds.FieldByName('NOMEGRUPOORCAMEN').AsString;
end;




procedure TFrmReservasPorGrupoMT.gridUpdateFooter(Sender: TObject);
var
   CdsAux: TClientDataSet;
   rVlrReservaTotal,rVlrSaldoTotal: double;

begin
  inherited;
  try
    CdsAux           := TClientDataSet.Create(nil);
    CdsAux.Data      := Cds.Data;
    rVlrReservaTotal := 0;
    rVlrSaldoTotal   := 0;
    while not CdsAux.Eof do
    begin
       rVlrReservaTotal := rVlrReservaTotal + CdsAux.FieldByName('VALOR').AsFloat;
       rVlrSaldoTotal   := rVlrSaldoTotal + CdsAux.FieldByName('SALDO').AsFloat;
       CdsAux.Next;
    end;
    Grid.ColumnByName('VALOR').FooterValue := FormatFloat('#,##0.00',rVlrReservaTotal);
    Grid.ColumnByName('SALDO').FooterValue      := FormatFloat('#,##0.00',rVlrSaldoTotal);

  finally
     FreeAndNil(CdsAux);
  end;
end;



procedure TFrmReservasPorGrupoMT.gridRowChanged(Sender: TObject);
begin
  inherited;
  // Controle para evitar que o usuário consiga inserir
  // um registro indevido no grid
  case (Cds.FieldByName('VALIDAR').AsString + 'X')[1] of
     'S',
     'N': begin
             TFloatField(Cds.FieldByName('VALOR')).ReadOnly    := not (CmeCadastro.Operacao = opInserir);
             TStringField(Cds.FieldByName('VALIDAR')).ReadOnly := False;
          end;
  else
     TFloatField(CDs.FieldByName('VALOR')).ReadOnly    := True;
     TStringField(CDs.FieldByName('VALIDAR')).ReadOnly := True;
  end;
end;




procedure TFrmReservasPorGrupoMT.CDsBeforePost(DataSet: TDataSet);
var
 rValor: Double;
begin
   inherited;
   TStringField(DataSet.FieldByName('SALDO')).ReadOnly := False;

   if DataSet.FieldByName('SALDO').OldValue <> null then
      rValor := DataSet.FieldByName('SALDO').OldValue
   else
      rValor := DataSet.FieldByName('SALDO').AsFloat;

   DataSet.FieldByName('SALDO').AsFloat := rValor - DataSet.FieldByName('VALOR').AsFloat;
   TStringField(DataSet.FieldByName('SALDO')).ReadOnly := True;
end;




procedure TFrmReservasPorGrupoMT.gridCalcCellColors(Sender: TObject;
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

       //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
       if (Cds.RecordCount <> 0) and (Cds.FieldByName('VALOR').Asfloat > 0) then
          ABrush.Color := $00E4D2C2;
       //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

     end;
   end
   else
   begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
   end;

   //Não dá para pegar pelo FIELDNAME, pois vem vazio '';
   if Field.DisplayName = 'Status' then
   case (Cds.FieldByName('FLGRESERVA').AsString + 'X')[1] of
      'A': ABrush.Color := $00A6FFA6;
      'E': ABrush.Color := $00C7C7C7;
      'C': ABrush.Color := $00594DF9;
      'U': ABrush.Color := $0040FFFF;
   end;
end;




procedure TFrmReservasPorGrupoMT.gridTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TFrmReservasPorGrupoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    //Ricardo Freitas SOL 151868 KINTANA 1121523 Inicio
    edtExercicio.Value   := StrToInt(MontaSelect.ValoresChave[2]);
    cboPeriodo.ItemIndex := StrToInt(MontaSelect.ValoresChave[1]);
    edtDescGrupo.Text    := MontaSelect.ValoresChave[6]+'-'+MontaSelect.ValoresChave[7];
    mmObs.Lines.Text     :=  MontaSelect.ValoresChave[8];

    //Ricardo Freitas SOL 151868 KINTANA 1121523 Fim

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( MontaSelect.ValoresChave[3] );
    cboPlanoOrcamentario.LookupValue := MontaSelect.ValoresChave[5];
    edtFornecedoresSubDespesas.text := CtrlTransacoesPorGrupo.GetFornecedorSubDespesa( StrToInt(MontaSelect.ValoresChave[6]) );
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    iIdPlanoOrc := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

    Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('R',
                                                                       MontaSelect.ValoresChave[4],
                                                                       iIdPlanoOrc, {Modulo.iPlanoOrc,}   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                       Sistema.IdEmpresa,
                                                                       StrToInt(MontaSelect.ValoresChave[0]),
                                                                       StrToInt(MontaSelect.ValoresChave[1]),
                                                                       StrToInt(MontaSelect.ValoresChave[5]),
                                                                       StrToInt(MontaSelect.ValoresChave[2]),
                                                                       StrToDate(MontaSelect.ValoresChave[3]));

    //Ricardo SOL: 151907 - KINTANA 
    VerificaZeraSaldo;
  end;
end;




procedure TFrmReservasPorGrupoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
var
  iIdOperacao: integer;
  Dt: TDateTime;  
begin
  inherited;
   if Trim(mmObs.Lines.Text) <> '' then
   begin
      try
         Cds.DisableControls;
         Cds.First;
         TStringField(CDs.FieldByName('OBSRESERVA')).ReadOnly := False;

         while not Cds.Eof do
         begin
            Cds.Edit;
            Cds.FieldByName('OBSRESERVA').AsString := mmObs.Lines.Text;
            Cds.Post;
            Cds.Next;
         end;

      finally
         Cds.EnableControls;
         TStringField(CDs.FieldByName('OBSRESERVA')).ReadOnly := True;
      end;
   end;


   Accept := CtrlTransacoesPorGrupo.AplicarReservaCompromissoPorGrupo(Cds.Data,
                                                                      'R',
                                                                      Modulo.sPermiteSaldoNeg,
                                                                      Sistema.IdModulo,
                                                                      Sistema.IdEmpresa,
                                                                      iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                      null,
                                                                      iIdOperacao,
                                                                      False);
   if not Accept then
      MsgDlg('Não foi possível inserir reservas orçamentárias para as contas do grupo. Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Aviso',mtError,[mbOk],0)
   else
   begin
      //Ricardo de Freitas - 151907 Puxa a data de referencia diretamente do
      //cds pois a data poderá ter sido editada
      Dt := Cds.fieldbyname('DATAREFERENCIA').Asdatetime;

      Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('R',
                                                                         'A',
                                                                         iIdPlanoOrc, {Modulo.iPlanoOrc,}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                         Sistema.IdEmpresa,
                                                                         StrToInt(msGrupo.ValoresChave[0]),
                                                                         (cboPeriodo.ItemIndex),
                                                                         iIdOperacao,
                                                                         Trunc(edtExercicio.Value),
                                                                         Dt);


      LimparFiltrosTela;
   end;
end;




procedure TFrmReservasPorGrupoMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
  rParams : tParametros;   // VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
begin
  Accept := (Cds.RecordCount <> 0);
  if not Accept then
     MsgDlg('Não há nenhum grupo selecionado!','Aviso',mtWarning,[mbOk],0);
  inherited;

  // VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
  if CmeCadastro.Operacao = opInserir then
  begin
    rParams.iIdPlanoOrc    := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
    rParams.iExercicio     := Trunc(edtExercicio.Value);
    rParams.iPeriodo       := cboPeriodo.ItemIndex;
    rParams.iUnidNegoc     := 0;
    rParams.sCodCentRespon := '';
    rParams.iIdPlano       := -1;
    rParams.iIdPatro       := -1;
    rParams.sCodCCusto     := '';
    rParams.iIdSubDespesa  := -1;
    rParams.iIdPrograma    := -1;
    rParams.iIdTIpoDespesa := -1;

    if Trim(cboPlanoPrevidenciario.Text) <> '' then
       rParams.iIdPlano := StrToInt(cboPlanoPrevidenciario.LookupValue);

    if cboCentroCusto.Text <> '' then
       rParams.sCodCCusto := cboCentroCusto.LookupValue;

    if edtFornecedoresSubDespesas.Text <> '' then
       rParams.iIdSubDespesa := StrToInt(msDespesa.ValoresChave[0]);

    if Trim(cboPatro.Text) <> '' then
       rParams.iIdPatro := StrToInt(cboPatro.LookupValue);

    if Trim(cboPrograma.Text) <> '' then
       rParams.iIdPrograma := StrToInt(cboPrograma.LookupValue);

    if Trim(cboTipoDespesa.Text) <> '' then
       rParams.iIdTIpoDespesa := StrToInt(cboTipoDespesa.LookupValue);

    if (TRIM(cboAtivProjeto.Text) <> '')  then
       rParams.iUnidNegoc  := cdsAtivProjeto.Fieldbyname('UNIDNEGOC').Asinteger;

    // testa se sub-despesa selecionada faz parte do grupo orçamentario
    if not CtrlTransacoesPorGrupo.ValidaSubDespesa(StrToInt(msGrupo.ValoresChave[0]), rParams) then
    begin
       MsgDlg(CtrlTransacoesPorGrupo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
       Accept := false;
    end;
  end;
  // VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662

end;




procedure TFrmReservasPorGrupoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  LimparFiltrosTela;
  CmeCadastro.RepetirInsert := False;
  Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('R','',-1,-1,-1,-1,-1,-1,-1);
end;



procedure TFrmReservasPorGrupoMT.gridExit(Sender: TObject);
begin
  inherited;
  case Cds.State of
     dsInsert: Cds.Cancel;
     dsEdit  : Cds.Post;
  end;

end;




procedure TFrmReservasPorGrupoMT.LimparFiltrosTela;
begin
   edtDescGrupo.Clear;
   cboPatro.Clear;
   cboPlanoPrevidenciario.Clear;
   cboAtivProjeto.clear;
   cboPrograma.clear;
   cboTipoDespesa.clear;
   cboPeriodo.ItemIndex := (DiasUteis.ExtraiMes(date));
   edtExercicio.Value   := DiasUteis.ExtraiAno(date);
   cboRatCriter.Clear;
   edtVlrRateio.Value := 0;
   mmObs.Lines.Clear; //Brunno Mattos - KTN 1121518 - SOL 151906

   //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
   cboPlanoOrcamentario.Clear;
   cboCentroCusto.Clear;
   edtFornecedoresSubDespesas.Clear;
   //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

   iIdPlanoOrc := -1;   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

   uFuncoesOrcamento.ClearFilters(Self,pnlFundo);//VANDER SOL 172384/9603

end;




procedure TFrmReservasPorGrupoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('R','',-1,-1,-1,-1,-1,-1,-1);
  LimparFiltrosTela;
end;




procedure TFrmReservasPorGrupoMT.gridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  if AFieldName <> 'OBSRESERVA' then
     Cds.IndexFieldNames := AFieldName;
end;




procedure TFrmReservasPorGrupoMT.btCancelarClick(Sender: TObject);
begin
  inherited;
  with TCMClientDataSet.Create(nil) do
  try
     Data     := Cds.Data;
     Filter   := 'VALIDAR = ''S''';
     Filtered := true;
              
     if MsgDlg('Deseja realmente cancelar as ' + IntToStr(RecordCount) + ' reserva(s) selecionada(s)?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
        if not CtrlTransacoesPorGrupo.CancelaReservaCompromisso(Cds.Data,'R',False,Sistema.IdEmpresa) then
           MsgDlg('Não foi possível cancelar as reservas. ' +
                  'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0)
        else
        begin
           Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('R','',-1,-1,-1,-1,-1,-1,-1);
           MsgDlg('Processo concluído com sucesso!','Aviso',mtInformation,[mbOk],0);
        end;
     end;

  finally
     Free;
     btCancelar.Down := False;
  end;
end;




procedure TFrmReservasPorGrupoMT.btMarcaTodosClick(Sender: TObject);
begin
  inherited;
  try
     Cds.DisableControls;
     TStringField(Cds.FieldByName('VALIDAR')).ReadOnly := False;
     Cds.First;
     while not Cds.Eof do
     begin
        Cds.Edit;
        Cds.FieldByName('VALIDAR').AsString := 'S';
        Cds.Post;
        Cds.Next;
     end;

  finally
     Cds.EnableControls;
     Cds.First;
  end;
end;




procedure TFrmReservasPorGrupoMT.btInverteSelClick(Sender: TObject);
begin
  inherited;
  try
     Cds.DisableControls;
     TStringField(CDs.FieldByName('VALIDAR')).ReadOnly := False;
     Cds.First;
     while not Cds.Eof do
     begin
        Cds.Edit;
        if (Cds.FieldByName('VALIDAR').AsString = 'S') then
           Cds.FieldByName('VALIDAR').AsString := 'N'
        else
           Cds.FieldByName('VALIDAR').AsString := 'S';
        Cds.Post;
        Cds.Next;
     end;

  finally
     Cds.EnableControls;
     Cds.First;
  end;
end;

procedure TFrmReservasPorGrupoMT.MontaSelectBeforeOpenCds(
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

     sSQLUnion.Strings[3]  := 'GRUPOORCAMEN.NOMEGRUPOORCAMEN || '' - Anual'' AS C1, ';
     sSQLUnion.Strings[4]  := '0 AS C2, ';
     sSQLUnion.Strings[10]  := '0 AS C4, ';

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
procedure TFrmReservasPorGrupoMT.btnEditaDtReferClick(Sender: TObject);
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

procedure TFrmReservasPorGrupoMT.bbtnConfirmarClick(Sender: TObject);
begin
  pnlDataReferencia.Visible := false;
  inherited;

end;

procedure TFrmReservasPorGrupoMT.bbtnCancelarClick(Sender: TObject);
begin
  pnlDataReferencia.Visible := false;
  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  LimparFiltrosTela;
  inherited;

end;

//Ricardo SOL: 151907 - KINTANA Zera valores caso o saldo total for zerado no rateio
procedure TFrmReservasPorGrupoMT.VerificaZeraSaldo;
var
   sSaldo:double;
begin
   //Ricardo SOL: 151907 - KINTANA Zera valores caso o saldo total for zerado no rateio
   sSaldo := 0;

   if (Trim(grid.ColumnByName('SALDO').FooterValue) <> '') then
      sSaldo := StrToFloat(Trim(StringReplace(grid.ColumnByName('SALDO').FooterValue,'.','',[rfReplaceAll])));

   if (sSaldo = 0) then
   begin
       cds.BeforePost := nil;
       cds.First;

       while not cds.eof Do
       begin
            cds.Edit;
            cds.FieldByName('SALDO').ReadOnly := false;
            cds.FieldByName('SALDO').AsFloat := 0;
            cds.Post;
            cds.Next;
       end;

       cds.First;
       cds.FieldByName('SALDO').ReadOnly := true;
       cds.BeforePost := CdsBeforePost;
   end;

   Application.ProcessMessages;
end;

procedure TFrmReservasPorGrupoMT.btBuscFornClick(Sender: TObject);
begin
  inherited;

  MsDespesa.Filtro.Clear;
  MsDespesa.Filtro.Add('D.IDFORNECEDOR = P.IDPESSOA(+) ');

  if (Trim(edtDescGrupo.text) <> '') AND (msGrupo.RetornouValor) then
     MsDespesa.Filtro.Add('D.IDGRUPOORCAMEN = '+Quotedstr( msGrupo.ValoresChave[0]) );

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
