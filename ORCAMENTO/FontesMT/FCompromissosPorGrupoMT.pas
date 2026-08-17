{
--------------------------------------------------------------------------------------------------
Data      : 15/01/2013
Autor     : Edilaine Ferraresi
Sol       : 172383-7762
Kintana   : 1556974
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : retirada do parametro PLANO ORÇAMENTARIO e MÁSCARA da parametrização do módulo
--------------------------------------------------------------------------------------------------
 Rotina......: VerificaZeraSaldo
 Nº SOL......: 202785-14192
 Nº KINTANA..: 1967043
 Data........: 25/03/2013
 Responsável.: Thiago melo
 Descrição...: - Alteração do idreservaorcamen ao carregar registro
--------------------------------------------------------------------------------------------------
 Rotina......: DFM
 Nº SOL......: 1772792
 Nº KINTANA..: 179255/11104
 Data........: 28/02/2013
 Responsável.: Felipe Santos
 Descrição...: - Alteração na montaSelect
--------------------------------------------------------------------------------------------------
 Rotina......: DFM, Grids
 Nº SOL......: 190039
 Nº KINTANA..: 1795556
 Data........: 11/09/2012
 Responsável.: Vander Campos
 Descrição...: - Alterações nas grids retirando o campo saldo da conta
--------------------------------------------------------------------------------------------------
 Rotina......: MontaSelect
 Nº SOL......: 190040
 Nº KINTANA..: 1795475
 Data........: 11/09/2012
 Responsável.: Vander Campos
 Descrição...: - Alterações no monta select
--------------------------------------------------------------------------------------------------
 Nº SOL......: 172384/9603
 Nº KINTANA..: 1661662
 Data........: 25/06/2012
 Responsável.: Vander Campos
 Descrição...: - Integração com o Planejamento Orçamentário
--------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9361
Nº KINTANA..: 1653184
Data........: 05/06/2012
Responsável.: Vander Campos
Descrição...: Adequação da interface aos padrões de utilização da funcionalidade Especial
--------------------------------------------------------------------------------------------------
Rotina......: Todo Form (*.pas) / (*.dfm)
Nº SOL......: 163903
Nº KINTANA..: 1403195
Data........: 09/12/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Adicionado parâmetros de Atividade de Projeto, Tipo de Despesa e Programa
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
Rotina......: MontaSelect
Nº SOL......: 153584/4161
Nº KINTANA..: 1170663
Data........: 15/01/2011
Responsável.: Brunno Mattos
Descrição...: Adicionado coluna "Operação Ajuste" para ser pesquisado.
---------------------------------------------------------------------------------------------------}
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
Rotina......: VerificarSaldoZerado
Nº SOL......: 151907
Nº KINTANA..: XXXXXX
Data........: 04/01/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Zerar valores das reservas caso o saldo total for zerado no rateio
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
{---------------------------------------------------------------------------------------------------
Rotina......: btSelContasClick,
Nº SOL......: 151865
Nº KINTANA..: 1121572
Data........: 01/02/2011
Responsável.: Brunno Mattos
Descrição...: Inclusão de período "ANUAL" no combo Período e ajuste das rotinas
              que apresentam os relacionamentos.
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
//Pendência 26595 - 06/12/2007 - Alteração dos filtros da query do montaselect
unit FCompromissosPorGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CMDBLookupCombo, uMensErro,
  uCtrlTransacoesPorGrupo, uSistema, uModulo, uData, 
  uString, uCtrlPlanPrevContabil, uCtrlPatro, uCtrlPadroes, Grids,
  Wwdbigrd, Wwdbgrid, TREdit, uCtrlPlanPrevContabPatro, DBGrids,
  uCMTypes,uDiasUteis, wwriched, uCtrlPeriodoOrcamen, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, uCmSqlParams;


type
  TFrmCompromissosPorGrupoMT = class(TFrmCadastroMT)
    PageControl: TPageControl;
    tbsCompSemReserv: TTabSheet;
    tbsCompComReserv: TTabSheet;
    CdsPlano: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    Label1: TLabel;
    edtDescGrupo: TEdit;
    btBuscGrupo: TSpeedButton;
    Label4: TLabel;
    cboPatro: TCMDBLookupCombo;
    Label3: TLabel;
    cboPlanoPrevidenciario: TCMDBLookupCombo;
    btSelContas: TBitBtn;
    pnlBottom: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    btCalcularRat: TSpeedButton;
    cboRatCriter: TCMDBLookupCombo;
    edtVlrRateio: TDBRealEdit;
    GridCompSemRes: TwwDBGrid;
    CdsRatCriter: TCMClientDataSet;
    PgCompComReserva: TPageControl;
    tbsCompComReserva: TTabSheet;
    tbsReservas: TTabSheet;
    GridGrupoComReserva: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    GridResXComp: TwwDBGrid;
    pnlBotoes: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    CdsResxComp: TCMClientDataSet;
    CdsResDisp: TCMClientDataSet;
    dsResxComp: TDataSource;
    dsResDisp: TDataSource;
    btIncluir: TSpeedButton;
    btExcluir: TSpeedButton;
    wwDBGrid1: TwwDBGrid;
    Label20: TLabel;
    cboPeriodo: TComboBox;
    Label22: TLabel;
    edtExercicio: TDBRealEdit;
    mmObs: TMemo;
    Label5: TLabel;
    btCancelar: TToolbarButton97;
    pnlTotalContas: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ImageList: TImageList;
    btInverteSel: TSpeedButton;
    btMarcaTodos: TSpeedButton;
    rcEditor: TwwDBRichEdit;
    pnlDataReferencia: TPanel;
    lbl1: TLabel;
    btn1: TButton;
    dtp_Dt_Referencia: TCMDateTimePicker;
    CdsResDispTotal: TCMClientDataSet;
    CdsResxCompTotal: TCMClientDataSet;
    cboAtividadeProjeto: TCMDBLookupCombo;
    lbl2: TLabel;
    cboPrograma: TCMDBLookupCombo;
    lbl3: TLabel;
    cboTipoDespesa: TCMDBLookupCombo;
    lbl4: TLabel;
    cdsPrograma: TCMClientDataSet;
    cdsAtividadeProj: TCMClientDataSet;
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
    procedure btSelContasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCompSemResCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridCompSemResTopRowChanged(Sender: TObject);
    procedure GridCompSemResRowChanged(Sender: TObject);
    procedure GridCompSemResUpdateFooter(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure CdsBeforePost(DataSet: TDataSet);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure btCalcularRatClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure PgCompComReservaChange(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure CdsResDispAfterOpen(DataSet: TDataSet);
    procedure wwDBGrid1UpdateFooter(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btExcluirClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure GridCompSemResTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btCancelarClick(Sender: TObject);
    procedure btMarcaTodosClick(Sender: TObject);
    procedure btInverteSelClick(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure GridCompSemResCellChanged(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btBuscFornClick(Sender: TObject);
    procedure cboPlanoOrcamentarioChange(Sender: TObject);    // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
  private
    { Private declarations }
     iIdPlanoOrc : integer;   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

     CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;
     CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
     CtrlPlanPrevContabil    : TCtrlPlanPrevContabil;
     CtrlPatro               : TCtrlPatro;
     CtrlPeriodoOrcamen      : TCtrlPeriodoOrcamen;


     procedure LimparFiltrosTela;
     procedure VerificaZeraSaldo;

  public
    { Public declarations }
    bPodeEditarDtReferencia:Boolean;
  end;


var
  FrmCompromissosPorGrupoMT: TFrmCompromissosPorGrupoMT;

implementation

Uses uFuncoesOrcamento;

{$R *.DFM}

procedure TFrmCompromissosPorGrupoMT.btBuscGrupoClick(Sender: TObject);
begin
  inherited;
  msGrupo.Executar;
  if msGrupo.RetornouValor then
  begin
    edtDescGrupo.Text := msGrupo.ValoresChave[2] + '-' + msGrupo.ValoresChave[1];

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( msGrupo.ValoresChave[2] );
    cboPlanoOrcamentario.LookupValue := msGrupo.ValoresChave[3];
    if cdsPlanoOrc.FieldByName('ANO').AsString <> '' then
       edtExercicio.Text := cdsPlanoOrc.FieldByName('ANO').AsString;
    edtFornecedoresSubDespesas.text := '';
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    iIdPlanoOrc := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);     // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
  end;
end;


procedure TFrmCompromissosPorGrupoMT.btSelContasClick(Sender: TObject);
var
   iUnidNegoc,iIdPlano,iIdPatro, iNumReserva,idPrograma,idTipoDespesa: integer;
   sCodCentRespon, sFiltro: string;

   CdsPossuiReservaAux : TClientDataSet;

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  ParamEntEsp : TParamEntradaEspecial;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

begin
  inherited;
  CdsPossuiReservaAux := TClientDataSet.Create(nil); //Brunno
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
  begin
     if not CtrlPlanPrevContabPatro.ValidaPlanoPatro (iIdPatro, iIdPlano) then begin
       MsgDlg (CtrlPlanPrevContabPatro.MessageInfo, 'Relacionamento Inválido', mtWarning, [mbok], 0);
       exit;
     end;
  end;


  //Ricardo SOL 163903 KTN 1403195
  if Trim(cboAtividadeProjeto.Text) <> '' then
     iUnidNegoc := StrToInt(cboAtividadeProjeto.LookupValue)
  else
     iUnidNegoc := -1;

  if Trim(cboPrograma.Text) <> '' then
     idPrograma := StrToInt(cboPrograma.LookupValue)
  else
     idPrograma := -1;

  if Trim(cboTipoDespesa.Text) <> '' then
     idTipoDespesa := StrToInt(cboTipoDespesa.LookupValue)
  else
     idTipoDespesa := -1;
  //Ricardo SOL 163903 KTN 1403195 - fim

  //Brunno Mattos - KTN 1121572 - SOL 151865 Inicio
  {if not CtrlPeriodoOrcamen.PeriodoLiberado('1/' +
                                            IntToStr(cboPeriodo.ItemIndex + 1) + '/' +
                                            FloatToStr(edtExercicio.Value),
                                            Sistema.Idempresa) then }
  if not CtrlPeriodoOrcamen.PeriodoLiberado('1/' +
                                            IntToStr(cboPeriodo.ItemIndex) + '/' +
                                            FloatToStr(edtExercicio.Value),
                                            Sistema.Idempresa) then
  begin
     //Brunno Mattos - KTN 1121522 - SOL 151908 Inicio
     //Se o período estiver bloqueado, carrego o CdsPossuiReservaAux para verificar se há reservas disponíveis
     //se houver reservas disponíveis, podem ser realizados compromissos a partir de reserva. Antes
     //a mensagem aparecia independente de haver ou não reserva.

     CdsPossuiReservaAux.Close;

     CdsPossuiReservaAux.Data := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(Sistema.IdEmpresa,
                                                                        StrToInt(msGrupo.ValoresChave[0]),
                                                                        iIdPlanoOrc,  {Modulo.iPlanoOrc,}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                        (cboPeriodo.ItemIndex),
                                                                        Trunc(edtExercicio.Value),False);

     if CdsPossuiReservaAux.IsEmpty then
      begin
        MsgDlg('Período BLOQUEADO para lançamentos e alterações!','Aviso',mtWarning,[mbOk],0);
        Exit;
      end
     else
      begin
        btCalcularRat.Enabled := False;
      end;
  end;
  btCalcularRat.Enabled := True;


  // Só faz a crítica de saldo caso o parâmetro obrigue os processos com saldo
 if Modulo.sPermiteSaldoNeg = 'N' then
  begin
     if not CtrlTransacoesPorGrupo.VerificaSaldoGrupo(StrToInt(msGrupo.ValoresChave[0]),
                                                      (cboPeriodo.ItemIndex),
                                                       Trunc(edtExercicio.Value),
                                                       Sistema.IdEmpresa,
                                                       iIdPlanoOrc {Modulo.iPlanoOrc}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                       ) then
     begin
         //Brunno Mattos - KTN 1121522 - SOL 151908 Adicionei cdsResDisp.data e  if cdsResDisp.IsEmpty
        CdsPossuiReservaAux.Close;

        CdsPossuiReservaAux.Data := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(Sistema.IdEmpresa,
                                                                      StrToInt(msGrupo.ValoresChave[0]),
                                                                      iIdPlanoOrc, {Modulo.iPlanoOrc,}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                      (cboPeriodo.ItemIndex),
                                                                      Trunc(edtExercicio.Value), False);
        if CdsPossuiReservaAux.IsEmpty then
        begin
               MsgDlg('Não há saldo lançado para este grupo orçamentário neste período/exercício','Aviso',mtWarning,[mbOk],0);
               Exit;
          end
        else
          begin
               if (PageControl.ActivePage <> tbsCompComReserv) then
               begin
                  MsgDlg('Saldo insuficiente, realize o compromisso a partir de reserva(s).','Aviso',mtWarning,[mbOk],0);
                  Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('C','',-1,-1,-1,-1,-1,-1,-1);
               end;
               PgCompComReserva.ActivePageIndex := 0;
               btCalcularRat.Enabled := False;
        end;
     end;
  end; 

  //Brunno Mattos - KTN 1121522 - SOL 151908 inclui if, pois só carrega Cds quando
  //estiver efetivando compromisso a partir de reserva, visto que pode ser um grupo orçamentário
  //sem saldo, que possua apenas reserva
 if (CtrlTransacoesPorGrupo.VerificaSaldoGrupo(StrToInt(msGrupo.ValoresChave[0]),
                                                      (cboPeriodo.ItemIndex),
                                                       Trunc(edtExercicio.Value),
                                                       Sistema.IdEmpresa,
                                                       iIdPlanoOrc {Modulo.iPlanoOrc}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                       ))
      Or (PageControl.ActivePage = tbsCompComReserv) then
  begin

    { VANDER SOL 172384/9361 KINTANA 1653184 -> Try Finally adicionado para o uso de "ParamEntEsp" }
    ParamEntEsp := TParamEntradaEspecial.Create(TRUE);
    Try
      With ParamEntEsp.Parametros do
      Begin
        iIdPlanoOrc   := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);
        sCodCCusto    := Trim(cboCentroCusto.LookupValue);

        If MsDespesa.RetornouValor Then
           iIdSubDespesa := StrToIntDef(msDespesa.ValoresChave[0],  -1);

        With ParamEntEsp.ReservaOrcamentaria do
          if Trim(mmObs.Text) <> '' Then
             ObsReserva := mmObs.Text;
           
      End;
      //

      Cds.Data := CtrlTransacoesPorGrupo.ListaContas(iIdPlanoOrc, {Modulo.iPlanoOrc,}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEmpresa,
                                                   StrToInt(msGrupo.ValoresChave[0]),
                                                   iUnidNegoc,
                                                   iIdPlano,
                                                   iIdPatro,
                                                   (cboPeriodo.ItemIndex),
                                                   Trunc(edtExercicio.Value),
                                                   sCodCentRespon,
                                                   Sistema.NomeUsuario,
                                                   True,
                                                   //Ricardo SOL 163903 KTN 1403195
                                                   idPrograma,
                                                   idTipoDespesa,
                                                   //Ricardo SOL 163903 KTN 1403195 - fim
                                                   ParamEntEsp   // VANDER SOL 172384/9361 KINTANA 1653184
                                                   ); // Alterado por FHBS - SOL: 151660 KTN: 1115295

    Finally
      FreeAndNil(ParamEntEsp);
    End;
  end;

  //  Aqui, é atribuido uma numeração de compromisso "virtual" somente para controle
  //de algumas rotinas da tela, pois a real numeração será aplicada no método
  //CtrlTransacoesPorGrupo.AplicarReservaCompromissoPorGrupo.
  if not (Cds.IsEmpty) then
  begin
     try
        iNumReserva := 0;
        Cds.DisableControls;
        TIntegerField(CDs.FieldByName('NUMRESERVA')).ReadOnly := false;

        while not Cds.Eof do
        begin
           Inc(iNumReserva);
           Cds.Edit;
           Cds.FieldByName('NUMRESERVA').AsInteger := iNumReserva;
           Cds.Next;
        end;

        Cds.First;
     finally
        TIntegerField(CDs.FieldByName('NUMRESERVA')).ReadOnly := True;
        Cds.EnableControls;
        FreeAndNil(CdsPossuiReservaAux);
     end;
  end;

  // Se for compromissos através de reservas, lista as reservas disponíveis ao grupo
  if PageControl.ActivePageIndex = 1  then
  begin
     //Brunno Mattos - KTN 1121522 - SOL 151908 Inicio
     sFiltro := 'EXERCICIO       = ' + Cds.FieldByName('EXERCICIO').AsString;
     //Se for anual filtra apenas pelo exercicio
     if cboPeriodo.ItemIndex <> 0 then
       sFiltro := sFiltro +
                'AND PERIODO         = ' + Cds.FieldByName('PERIODO').AsString    ;
  end;
  
     if not CdsResDisp.IsEmpty then
     begin
       CdsResDisp.Filtered := False;
       CdsResDisp.Filter   := sFiltro;
       CdsResDisp.Filtered := True;
     end;
     //Brunno Mattos - KTN 1121522 - SOL 151908 Fim
     //CdsResDisp.EmptyDataSet;
     CdsResDisp.Data := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(Sistema.IdEmpresa,
                                                                        StrToInt(msGrupo.ValoresChave[0]),
                                                                        iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                        (cboPeriodo.ItemIndex),
                                                                        Trunc(edtExercicio.Value), False);

     //Renan SOL 151908/3903 Kintana 1155437 Inicio
     CdsResDispTotal.Data := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(Sistema.IdEmpresa,
                                                                        StrToInt(msGrupo.ValoresChave[0]),
                                                                        iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                        (cboPeriodo.ItemIndex),
                                                                        Trunc(edtExercicio.Value), True);
     //Renan SOL 151908/3903 Kintana 1155437 Fim



  //Brunno Mattos - KTN 1121522 - SOL 151908
  if not CdsResDisp.IsEmpty then
     pnlBotoes.Enabled := True;


  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  //Acerta combobox de critério de rateio conforme na Entrada de Dados
  if (cds.RecordCount > 0) then
  begin
    cboRatCriter.LookupValue := FloatToStr(CtrlTransacoesPorGrupo.Retornar_IdCriterio_porGrupoPeriodo(Sistema.IdEmpresa,
                                                                                                    iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                                                    StrToInt(msGrupo.ValoresChave[0]),
                                                                                                    Trim(edtExercicio.text),
                                                                                                    IntToStr(cboPeriodo.itemIndex)));
  end;

  //Ricardo Freitas SOL 151878 KINTANA 1121523
  //Para consultas do tipo ANUAL, temporariamente não aparece
  pnlDataReferencia.Visible  := (cboPeriodo.ItemIndex <> 0) and (cds.RecordCount > 0);
  dtp_Dt_Referencia.DateTime := Now;
end;




procedure TFrmCompromissosPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo  := TCtrlTransacoesPorGrupo.Create;
  CtrlPlanPrevContabil    := TCtrlPlanPrevContabil.Create;
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPatro               := TCtrlPatro.Create;
  CtrlPeriodoOrcamen      := TCtrlPeriodoOrcamen.Create;

  CtrlTransacoesPorGrupo.InitializeAs(padroes);
  CtrlPlanPrevContabil.InitializeAs(Padroes);
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);
  CtrlPatro.InitializeAs(Padroes);
  CtrlPeriodoOrcamen.InitializeAs(Padroes);

  Cds.Data          := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('C','',-1,-1,-1,-1,-1,-1,-1);
  CdsPlano.Data     := CtrlTransacoesPorGrupo.ListaPlano;
  CdsPatro.Data     := CtrlTransacoesPorGrupo.ListaPatro;
  //CdsPlanoTrab.Data := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario, Sistema.IdEmpresa, Date); // Alterado por FHBS - SOL: 150183 KTN: 1087556
  CdsRatCriter.Data := CtrlTransacoesPorGrupo.ListaReservaRatCriter(Sistema.IdEmpresa);
  CdsResxComp.Data  := CtrlTransacoesPorGrupo.ListaResxComp(Sistema.IdEmpresa,0);
  CdsResxCompTotal.Data  := CtrlTransacoesPorGrupo.ListaResxComp(Sistema.IdEmpresa,0); //Renan
  CdsResDisp.Data   := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(-1,-1,-1,-1,-1,False);
  CdsResDispTotal.Data   := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(-1,-1,-1,-1,-1,False); //Renan


  PageControl.ActivePageIndex := 0;
  //msGrupo.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
  cboPeriodo.ItemIndex := (DiasUteis.ExtraiMes(date) );
  edtExercicio.Value   := DiasUteis.ExtraiAno(date);

  //Ricardo SOL 163903 KTN 1403195
  cdsPrograma.Data     := CtrlTransacoesPorGrupo.ListaPrograma;
  cdsTipoDespesa.Data  := CtrlTransacoesPorGrupo.ListaTipoDespesa;
  cdsAtividadeProj.Data := CtrlTransacoesPorGrupo.ListaAtividadeProj;
  //Ricardo SOL 163903 KTN 1403195 - fim

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento('-1');
  cdsCCusto.Data   := CtrlTransacoesPorGrupo.ListaCentroCusto;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  cboRatCriter.LookupValue := '-1';
  cboRatCriter.Enabled     := false;
end;




procedure TFrmCompromissosPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlTransacoesPorGrupo);
   FreeAndNil(CtrlPlanPrevContabil);
   FreeAndNil(CtrlPatro);
   FreeAndNil(CtrlPeriodoOrcamen);

   //Ricardo SOL 163903 KTN 1403195
   cdsPrograma.Close;
   cdsTipoDespesa.Close;
   cdsAtividadeProj.Close;
   //Ricardo SOL 163903 KTN 1403195 - fim

   inherited;
end;



procedure TFrmCompromissosPorGrupoMT.GridCompSemResCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

     //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
     if (Cds.RecordCount <> 0) and (Cds.FieldByName('VALOR').Asfloat > 0) then
        ABrush.Color := $00E4D2C2;
     //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

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




procedure TFrmCompromissosPorGrupoMT.GridCompSemResTopRowChanged(
  Sender: TObject);
begin
  inherited;
  (Sender as TwwDBGrid).Invalidate;
end;




procedure TFrmCompromissosPorGrupoMT.GridCompSemResRowChanged(
  Sender: TObject);
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




procedure TFrmCompromissosPorGrupoMT.GridCompSemResUpdateFooter(
  Sender: TObject);
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
    (sender as TwwDBGrid).ColumnByName('VALOR').FooterValue := FormatFloat('#,##0.00',rVlrReservaTotal);
    (sender as TwwDBGrid).ColumnByName('SALDO').FooterValue      := FormatFloat('#,##0.00',rVlrSaldoTotal);
  finally
     FreeAndNil(CdsAux);
  end;
end;




procedure TFrmCompromissosPorGrupoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin

    //Ricardo Freitas SOL 151868 KINTANA 1121523 Inicio
    edtExercicio.Value   := StrToInt(MontaSelect.ValoresChave[2]);
    cboPeriodo.ItemIndex := StrToInt(MontaSelect.ValoresChave[1]);
    edtDescGrupo.Text    := MontaSelect.ValoresChave[6]+'-'+MontaSelect.ValoresChave[7];
    mmObs.Lines.Text     := MontaSelect.ValoresChave[8];
    //Ricardo Freitas SOL 151868 KINTANA 1121523 Fim

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    cdsPlanoOrc.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( MontaSelect.ValoresChave[6] ); {[3]}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
    cboPlanoOrcamentario.LookupValue := MontaSelect.ValoresChave[10]; {[5]}                               // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
    edtFornecedoresSubDespesas.text := CtrlTransacoesPorGrupo.GetFornecedorSubDespesa( StrToInt(MontaSelect.ValoresChave[9]) ); {[6]} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    iIdPlanoOrc := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

     if Trim(MontaSelect.ValoresChave[4]) = 'SR' then
        // Sem Reserva
        PageControl.ActivePageIndex := 0
     else
        // Com Reserva
        PageControl.ActivePageIndex := 1;

        Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('C',
                                                                           MontaSelect.ValoresChave[5],
                                                                           iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                           Sistema.IdEmpresa,
                                                                           StrToInt(MontaSelect.ValoresChave[0]),
                                                                           StrToInt(MontaSelect.ValoresChave[1]),
                                                                           //INICIO - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
                                                                           0,
                                                                           //StrToIntDef(MontaSelect.ValoresChave[6],0),
                                                                           //FIM - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
                                                                           StrToInt(MontaSelect.ValoresChave[2]),
                                                                           StrToDateDef(MontaSelect.ValoresChave[3],0)//VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
                                                                           );

        //Ricardo SOL: 151907 - KINTANA Zera valores caso o saldo total for zerado no rateio
        VerificaZeraSaldo;
  end;
end;


procedure TFrmCompromissosPorGrupoMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TDateTimeField(CDs.FieldByName('DATAREFERENCIA')).ReadOnly := True;
  TFloatField(CDs.FieldByName('VALOR')).EditFormat           := '#,##0.00';
  TFloatField(CDs.FieldByName('VALOR')).DisplayFormat        := '#,##0.00';
  TFloatField(CDs.FieldByName('SALDO')).DisplayFormat        := '#,##0.00';
  TFloatField(CDs.FieldByName('SALDO')).ReadOnly             := True;
  TStringField(CDs.FieldByName('IDCONTAORCAMEN')).ReadOnly   := True;
  TIntegerField(CDs.FieldByName('PERIODO')).ReadOnly         := True;
  TIntegerField(CDs.FieldByName('EXERCICIO')).ReadOnly       := True;
  TStringField(CDs.FieldByName('CENTRORESPON')).ReadOnly     := True;
  TStringField(CDs.FieldByName('CENTROCUSTO')).ReadOnly      := True;

  TStringField(CDs.FieldByName('PLANO')).ReadOnly            := True;
  TStringField(CDs.FieldByName('PATRO')).ReadOnly            := True;
  TStringField(CDs.FieldByName('DESCRESERVA')).ReadOnly      := True;
  TIntegerField(CDs.FieldByName('NUMRESERVA')).ReadOnly      := True;
  TIntegerField(CDs.FieldByName('IDOPERACAO')).ReadOnly      := True;

  btCancelar.Enabled := ((not (Cds.IsEmpty)) and
                         (CmeCadastro.Operacao <> opInserir) and
                         (Cds.FieldByName('FLGRESERVA').AsString = 'A')  );
  TStringField(Cds.FieldByName('VALIDAR')).Visible           := btCancelar.Enabled;
  btMarcaTodos.Visible                                       := btCancelar.Enabled;
  btInverteSel.Visible                                       := btCancelar.Enabled;

  TStringField(CDs.FieldByName('OBSRESERVA')).ReadOnly      := True;
  TStringField(CDs.FieldByName('USUARIO')).ReadOnly         := True;

  if Cds.IsEmpty then
     pnlTotalContas.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' compromisso(s)'
  else
     pnlTotalContas.Caption := 'Total de ' + IntToStr(Cds.RecordCount) + ' compromisso(s) para o grupo ' + Cds.FieldByName('CODGRUPOORC').AsString + ' - '  + Cds.FieldByName('NOMEGRUPOORCAMEN').AsString;
end;

procedure TFrmCompromissosPorGrupoMT.CdsBeforePost(DataSet: TDataSet);
var
 rValor: Double;
begin
   inherited;
   // Só faz a simulação do saldo se for um compromisso sem reserva
   if PageControl.ActivePageIndex = 0 then
   begin
      //Ricardo de Freitas - 151907 Só executa se há saldo
      if (DataSet.FieldByName('SALDO').AsFloat > 0) then
      begin
        TStringField(DataSet.FieldByName('SALDO')).ReadOnly := False;

        if DataSet.FieldByName('SALDO').OldValue <> null then
           rValor := DataSet.FieldByName('SALDO').OldValue
        else
           rValor := DataSet.FieldByName('SALDO').AsFloat;

        DataSet.FieldByName('SALDO').AsFloat := rValor - DataSet.FieldByName('VALOR').AsFloat;
        TStringField(DataSet.FieldByName('SALDO')).ReadOnly := True;
      end;
   end;
end;

procedure TFrmCompromissosPorGrupoMT.CmeCadastroApplyInsert(
  sender: TObject; var Accept: Boolean);
var
  bCompromissoComReserva: boolean;
  iIdOperacao: integer;
  Dt:TDateTime;
begin
   inherited;

   TRY

     //Ricardo de Freitas - 151907 Desvincula Evento BeforePost
     Cds.BeforePost := nil;

     if Trim(mmObs.Lines.Text) <> '' then
     begin
        try
           Cds.DisableControls;
           Cds.First;
           TStringField(Cds.FieldByName('OBSRESERVA')).ReadOnly := False;

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


    bCompromissoComReserva := (PageControl.ActivePageIndex = 1);
    Accept := CtrlTransacoesPorGrupo.AplicarReservaCompromissoPorGrupo(Cds.Data,'C',
                                                                       Modulo.sPermiteSaldoNeg,
                                                                       Sistema.IdModulo,
                                                                       Sistema.IdEmpresa,
                                                                       iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                       CdsResxComp.Data,
                                                                       iIdOperacao,
                                                                       bCompromissoComReserva);
    if not Accept then
       MsgDlg('Não foi possível inserir compromissos orçamentários para as contas do grupo. ' + #13 +
              'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Aviso',mtError,[mbOk],0)
    else
    begin
       //Ricardo de Freitas - 151907 Puxa a data de referencia diretamente do
       //cds pois a data poderá ter sido editada
       Dt := Cds.fieldbyname('DATAREFERENCIA').Asdatetime;

       Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('C',
                                                                          'A',
                                                                          iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                          Sistema.IdEmpresa,
                                                                          StrToInt(msGrupo.ValoresChave[0]),
                                                                          (cboPeriodo.ItemIndex),
                                                                          iIdOperacao,
                                                                          Trunc(edtExercicio.Value),
                                                                          Dt);
       LimparFiltrosTela;
    end;
  finally
    //Ricardo de Freitas - 151907 Desvincula Evento BeforePost
    Cds.BeforePost := CdsBeforePost;
  end;

end;




procedure TFrmCompromissosPorGrupoMT.CmeCadastroApplyDelete(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTransacoesPorGrupo.ExluirReservasCompromissoPorGrupo(Cds.Data,'C',
                                                                     Sistema.IdEmpresa,
                                                                     iIdPlanoOrc, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                     (PageControl.ActivePageIndex = 1));
  if not Accept then
  begin
     MsgDlg('Houve um erro ao tentar excluir os compromissos do grupo. ' + #13 +
            'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0);
     Exit;
  end
  else
  begin
     Cds.EmptyDataSet;
     LimparFiltrosTela;
  end;
end;




procedure TFrmCompromissosPorGrupoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   LimparFiltrosTela;

  CmeCadastro.RepetirInsert := False;

  if (Cds.RecordCount <> 0) then
  begin
     Cds.Data         := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('C','',-1,-1,-1,-1,-1,-1,-1);
     CdsResxComp.Data := CtrlTransacoesPorGrupo.ListaResxComp(Sistema.IdEmpresa,-1);
     CdsResxCompTotal.Data := CtrlTransacoesPorGrupo.ListaResxComp(Sistema.IdEmpresa,-1); //Renan
     CdsResDisp.Data  := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(Sistema.IdEmpresa,-1,-1,-1,-1,False);
     CdsResDispTotal.Data  := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(Sistema.IdEmpresa,-1,-1,-1,-1,False); //Renan
  end;
end;




procedure TFrmCompromissosPorGrupoMT.btCalcularRatClick(Sender: TObject);
var
 sValor: string;
begin

  //Ricardo SOL 122291 KINTANA 597829
  if (edtVlrRateio.Value = 0) then
  begin
     Application.MessageBox('Favor informar o valor total de rateio.','Atenção',48);
     Exit;
  end;

  //Ricardo Freitas SOL 151868 KINTANA 1121523
  GridCompSemRes.RefreshDisplay;
  GridGrupoComReserva.RefreshDisplay;

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
       if GridCompSemRes.ColumnByName('VALOR').FooterValue <> edtVlrRateio.Text then
       begin
          sValor := StringReplace(GridCompSemRes.ColumnByName('VALOR').FooterValue,'.','',[rfReplaceAll]);
          Cds.Edit;
          Cds.FieldByName('VALOR').AsFloat := (Cds.FieldByName('VALOR').AsFloat + (edtVlrRateio.Value - StrToFloat(sValor)));
          Cds.Post;
       end;
     end;
   end;
   
   //Ricardo SOL: 151907 - KINTANA Zera valores caso o saldo total for zerado no rateio
   VerificaZeraSaldo;
end;

procedure TFrmCompromissosPorGrupoMT.PageControlChange(Sender: TObject);
begin
  inherited;
   Cds.Data         := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('C','',-1,-1,-1,-1,-1,-1,-1);
   PgCompComReserva.ActivePageIndex := 0;
   CdsResDisp.Data  := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(-1,-1,-1,-1,-1,False);
   CdsResDispTotal.Data  := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(-1,-1,-1,-1,-1,False); //Renan
   CdsResxComp.Data := CtrlTransacoesPorGrupo.ListaResxComp(-1,0);
   CdsResxCompTotal.Data := CtrlTransacoesPorGrupo.ListaResxComp(-1,0); //Renan
end;




procedure TFrmCompromissosPorGrupoMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
var
  rParams : tParametros;   // VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
begin
  inherited;
  Accept := not (Cds.IsEmpty);
  if not Accept then
     MsgDlg('Não há nenhum grupo orçamentário selecionado!','Aviso',mtWarning,[mbOk],0);

  // VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
  if CmeCadastro.Operacao = opInserir then
  begin

    rParams.iIdPlanoOrc    := StrToIntDef(cboPlanoOrcamentario.LookupValue, -1);     // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
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

    if (TRIM(cboAtividadeProjeto.Text) <> '')  then
       rParams.iUnidNegoc  := cdsAtividadeProj.Fieldbyname('UNIDNEGOC').Asinteger;

    // testa se sub-despesa selecionada faz parte do grupo orçamentario
    if not CtrlTransacoesPorGrupo.ValidaSubDespesa(StrToInt(msGrupo.ValoresChave[0]), rParams) then
    begin
       MsgDlg(CtrlTransacoesPorGrupo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
       Accept := false;
    end;
  end;
  // VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
end;




procedure TFrmCompromissosPorGrupoMT.PgCompComReservaChange(
  Sender: TObject);
var
   sFiltro: string;

begin
  inherited;
  // Aba de reservas
  if PgCompComReserva.ActivePageIndex = 1 then
  begin
     if not (Cds.IsEmpty) then
     begin
        // Se o usuário estiver consultando o registro
        if CmeCadastro.Operacao <> opInserir then
        begin
           // Lista as reservas que compõe o compromisso
           CdsResxComp.Filtered := False;
           CdsResDisp.Filtered  := False;
           CdsResxComp.Data     := CtrlTransacoesPorGrupo.ListaResxCompEfetuado(Sistema.IdEmpresa,Cds.FieldByName('IDRESERVAORCAMEN').AsInteger);
           CdsResDisp.Data      := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(-1,-1,-1,-1,-1,False); //RENAN
           CdsResDispTotal.Data := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(-1,-1,-1,-1,-1,False); //RENAN
           // Desabilita os botões
           pnlBotoes.Enabled    := False;
        end
        else 
        // Se o usuário estiver inserindo
        begin
           // Fltra todas as reservas que ainda não estão sendo utilizadas
           //===================================================================
           // 1- Varre todo o Cds de reserva associadas ao compromisso a efetuar,
           // para filtras somente as reservas disponíveis

           //Brunno Mattos - KTN 1121522 - SOL 151908
           sFiltro := 'EXERCICIO       = ' + Cds.FieldByName('EXERCICIO').AsString;
           //Se for anual filtra apenas pelo exercicio
           if cboPeriodo.ItemIndex <> 0 then
             sFiltro := sFiltro +
                      'AND PERIODO         = ' + Cds.FieldByName('PERIODO').AsString    ;



           CdsResxComp.DisableControls;
           CdsResxComp.First;
           while not CdsResxComp.Eof do
           begin
              sFiltro := sFiltro +  ' AND NUMRESERVA <> ' + CdsResxComp.FieldByName('IDRESERVA').AsString;
              CdsResxComp.Next;
           end;
           CdsResxComp.EnableControls;
           CdsResxComp.First;
           // 2- Filtra as reservas que ainda não estão sendo utilizadas
           //por nenhum registros
           CdsResDisp.Filtered := False;
           CdsResDisp.Filter   := sFiltro;
           CdsResDisp.Filtered := True;
           // Habilita os botões
           pnlBotoes.Enabled := True;
        end;
     end;
  end;
end;




procedure TFrmCompromissosPorGrupoMT.btIncluirClick(Sender: TObject);
var
  iIdOperacao: Integer;
begin
  inherited;
  //Renan
  iIdOperacao := CdsResDispTotal.FieldByName('IDOPERACAO').AsInteger;

  CdsResDisp.Filtered := False;
  CdsResDisp.Filter := 'IDOPERACAO = ' + IntToStr(iIdOperacao) ;
  CdsResDisp.Filtered := True;

  if ((not (CdsResDisp.IsEmpty)) and (not (Cds.IsEmpty))) then
  begin
    //Renan
    While Not(CdsResDisp.IsEmpty) do
    begin
       TStringField(CdsResxComp.FieldByName('OBSRESERVA')).ReadOnly := False;   //Renan
       CdsResxComp.Append;
       CdsResxComp.FieldByName('IDPESSOA').AsInteger         := CdsResDisp.FieldByName('IDPESSOA').AsInteger;
       CdsResxComp.FieldByName('NUMRESERVA').AsInteger       := CdsResDisp.FieldByName('NUMRESERVA').AsInteger;
       CdsResxComp.FieldByName('IDRESERVA').AsInteger        := CdsResDisp.FieldByName('NUMRESERVA').AsInteger;
       CdsResxComp.FieldByName('IDOPERACAO').AsInteger       := CdsResDisp.FieldByName('IDOPERACAO').AsInteger;//Brunno Mattos - KTN 1121522 - SOL 151908
       CdsResxComp.FieldByName('NOME').AsString              := CdsResDisp.FieldByName('NOME').AsString;//Brunno Mattos - KTN 1121522 - SOL 151908
       CdsResxComp.FieldByName('IDCOMPROMISSO').AsInteger    := Cds.FieldByName('NUMRESERVA').AsInteger;
       CdsResxComp.FieldByName('CENTROCUSTO').AsString       := CdsResDisp.FieldByName('CENTROCUSTO').AsString;
       CdsResxComp.FieldByName('IDCONTAORCAMEN').AsString    := CdsResDisp.FieldByName('IDCONTAORCAMEN').AsString;
       CdsResxComp.FieldByName('VLRRESERVA').AsFloat         := CdsResDisp.FieldByName('VLRRESERVA').AsFloat;
       CdsResxComp.FieldByName('GRUPO').AsString             := CdsResDisp.FieldByName('GRUPO').AsString;
       CdsResxComp.FieldByName('CODCENTROCUSTO').AsString    := CdsResDisp.FieldByName('CODCENTROCUSTO').AsString;
       CdsResxComp.FieldByName('CODCENTRORESPON').AsString   := CdsResDisp.FieldByName('CODCENTRORESPON').AsString;
       CdsResxComp.FieldByName('IDPATRO').AsInteger          := CdsResDisp.FieldByName('IDPATRO').AsInteger;
       CdsResxComp.FieldByName('IDPLANOPREV').AsInteger      := CdsResDisp.FieldByName('IDPLANOPREV').AsInteger;
       CdsResxComp.FieldByName('PERIODO').AsInteger          := CdsResDisp.FieldByName('PERIODO').AsInteger;
       CdsResxComp.FieldByName('EXERCICIO').AsInteger        := CdsResDisp.FieldByName('EXERCICIO').AsInteger;
       CdsResxComp.FieldByName('IDRESERVA').AsInteger        := CdsResDisp.FieldByName('IDRESERVAORCAMEN').AsInteger;
       CdsResxComp.FieldByName('OBSRESERVA').AsString        := CdsResDisp.FieldByName('OBSRESERVA').AsString;
       //Renan inicio
       CdsResxComp.FieldByName('IDGRUPOORCAMEN').AsString    := CdsResDisp.FieldByName('IDGRUPOORCAMEN').AsString;
       CdsResxComp.FieldByName('IDPLANOORCAMEN').AsString    := CdsResDisp.FieldByName('IDPLANOORCAMEN').AsString;
       //Renan Fim

       //Brunno Mattos - KTN 1121522 - SOL 151908 Inicio
       Cds.Locate('IDCONTAORCAMEN', CdsResDisp.FieldByName('IDCONTAORCAMEN').AsString,[]);
       //Brunno Mattos - KTN 1121522 - SOL 151908 Fim

       CdsResxComp.Post; 
       CdsResDisp.Delete;

       TStringField(CdsResxComp.FieldByName('OBSRESERVA')).ReadOnly := True;  //Renan

       Cds.Edit;
       Cds.FieldByName('VALOR').AsFloat := Cds.FieldByName('VALOR').AsFloat + CdsResxComp.FieldByName('VLRRESERVA').AsFloat;
       Cds.Post;

       CdsResDisp.Next;  //Renan
  end;   

    //Renan SOL 151908/3903 Kintana 1155437 Inicio
    if Not(CdsResxComp.Eof) then
    begin
      CdsResxCompTotal.Append;
      CdsResxCompTotal.FieldByName('IDOPERACAO').AsInteger := CdsResDispTotal.FieldByName('IDOPERACAO').AsInteger;
      CdsResxCompTotal.FieldByName('VLRRESERVA').AsFloat := CdsResDispTotal.FieldByName('VLRRESERVA').AsFloat;
      CdsResxCompTotal.FieldByName('GRUPO').AsString := CdsResDispTotal.FieldByName('GRUPO').AsString;
      CdsResxCompTotal.FieldByName('PERIODO').AsInteger := CdsResDispTotal.FieldByName('PERIODO').AsInteger;
      CdsResxCompTotal.FieldByName('EXERCICIO').AsInteger := CdsResDispTotal.FieldByName('EXERCICIO').AsInteger;
      TStringField(CdsResxCompTotal.FieldByName('OBSRESERVA')).ReadOnly := False;
      CdsResxCompTotal.FieldByName('OBSRESERVA').AsString := CdsResDispTotal.FieldByName('OBSRESERVA').AsString;
      TStringField(CdsResxCompTotal.FieldByName('OBSRESERVA')).ReadOnly := True;      
      CdsResxCompTotal.Post;
end;

    if CdsResDisp.IsEmpty then
    begin
       CdsResDisp.Filtered := False;
       CdsResDispTotal.Delete;
    end;

    if CdsResDisp.IsEmpty then
       btIncluir.Enabled := False;
    if not CdsResxComp.IsEmpty then
       btExcluir.Enabled := True;
    //Renan SOL 151908/3903 Kintana 1155437 Fim
  end;
end;

procedure TFrmCompromissosPorGrupoMT.CdsResDispAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VLRRESERVA')).DisplayFormat := '#,##0.00;-#,##0.00';
  TStringField(DataSet.FieldByName('OBSRESERVA')).ReadOnly     := True;
end;




procedure TFrmCompromissosPorGrupoMT.wwDBGrid1UpdateFooter(
  Sender: TObject);
var
  CdsAux: TClientDataSet;
  rTotal: Double;
begin
  inherited;
  try
     CdsAux          := TCMClientDataSet.Create(nil);
     rTotal          := 0;
     CdsAux.Data     := TClientDataSet((sender as TwwDBGrid).DataSource.DataSet).Data;
     CdsAux.Filtered := False;
     CdsAux.Filter   := TClientDataSet((sender as TwwDBGrid).DataSource.DataSet).Filter;
     CdsAux.Filtered := True;

     while not CdsAux.Eof do
     begin
        rTotal := rTotal + CdsAux.FieldByName('VLRRESERVA').AsFloat;
        CdsAux.Next;
     end;

     (sender as TwwDBGrid).ColumnByName('VLRRESERVA').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rTotal);
  finally
      FreeAndNil(CdsAux);
  end;
end;




procedure TFrmCompromissosPorGrupoMT.wwDBGrid1TitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  if AFieldName <> 'OBSRESERVA' then
     CdsResDisp.IndexFieldNames := AFieldName;
end;




procedure TFrmCompromissosPorGrupoMT.btExcluirClick(Sender: TObject);
var
  iIdOperacao: Integer;
begin
  inherited;
  //Renan
  iIdOperacao := CdsResxCompTotal.FieldByName('IDOPERACAO').AsInteger;

  CdsResxComp.Filtered := False;
  CdsResxComp.Filter := 'IDOPERACAO = ' + IntToStr(iIdOperacao) ;
  CdsResxComp.Filtered := True;

  if ((not (CdsResxComp.IsEmpty)) and (not (Cds.IsEmpty))) then
  begin
    //Renan
    While Not(CdsResxComp.IsEmpty) do
    begin
       TStringField(CdsResDisp.FieldByName('OBSRESERVA')).ReadOnly := False;
       CdsResDisp.Append;
       CdsResDisp.FieldByName('NUMRESERVA').AsInteger       := CdsResxComp.FieldByName('NUMRESERVA').AsInteger;
       CdsResDisp.FieldByName('CENTROCUSTO').AsString       := CdsResxComp.FieldByName('CENTROCUSTO').AsString;
       CdsResDisp.FieldByName('VLRRESERVA').AsFloat         := CdsResxComp.FieldByName('VLRRESERVA').AsFloat;
       CdsResDisp.FieldByName('IDOPERACAO').AsInteger       := CdsResxComp.FieldByName('IDOPERACAO').AsInteger;//Brunno Mattos - KTN 1121522 - SOL 151908
       CdsResDisp.FieldByName('NOME').AsString              := CdsResxComp.FieldByName('NOME').AsString;//Brunno Mattos - KTN 1121522 - SOL 151908
       CdsResDisp.FieldByName('IDCONTAORCAMEN').AsString    := CdsResxComp.FieldByName('IDCONTAORCAMEN').AsString;
       CdsResDisp.FieldByName('GRUPO').AsString             := CdsResxComp.FieldByName('GRUPO').AsString;
       CdsResDisp.FieldByName('CODCENTROCUSTO').AsString    := CdsResxComp.FieldByName('CODCENTROCUSTO').AsString;
       CdsResDisp.FieldByName('CODCENTRORESPON').AsString   := CdsResxComp.FieldByName('CODCENTRORESPON').AsString;
       CdsResDisp.FieldByName('IDPATRO').AsInteger          := CdsResxComp.FieldByName('IDPATRO').AsInteger;
       CdsResDisp.FieldByName('IDPLANOPREV').AsInteger      := CdsResxComp.FieldByName('IDPLANOPREV').AsInteger;
       CdsResDisp.FieldByName('PERIODO').AsInteger          := CdsResxComp.FieldByName('PERIODO').AsInteger;
       CdsResDisp.FieldByName('EXERCICIO').AsInteger        := CdsResxComp.FieldByName('EXERCICIO').AsInteger;
       CdsResDisp.FieldByName('IDRESERVAORCAMEN').AsInteger := CdsResxComp.FieldByName('IDRESERVA').AsInteger;
       CdsResDisp.FieldByName('OBSRESERVA').AsString        := CdsResxComp.FieldByName('OBSRESERVA').AsString;
       //Renan inicio
       CdsResDisp.FieldByName('IDPESSOA').AsString          := CdsResxComp.FieldByName('IDPESSOA').AsString;
       CdsResDisp.FieldByName('IDGRUPOORCAMEN').AsString    := CdsResxComp.FieldByName('IDGRUPOORCAMEN').AsString;
       CdsResDisp.FieldByName('IDPLANOORCAMEN').AsString    := CdsResxComp.FieldByName('IDPLANOORCAMEN').AsString;
       //Renan Fim

       //Brunno Mattos - KTN 1121522 - SOL 151908 Inicio
       Cds.Locate('IDCONTAORCAMEN', CdsResxComp.FieldByName('IDCONTAORCAMEN').AsString,[]);
       //Brunno Mattos - KTN 1121522 - SOL 151908 Fim

       CdsResDisp.Post;
       CdsResxComp.Delete;
       TStringField(CdsResDisp.FieldByName('OBSRESERVA')).ReadOnly := True;

       Cds.Edit;
       Cds.FieldByName('VALOR').AsFloat := Cds.FieldByName('VALOR').AsFloat - CdsResDisp.FieldByName('VLRRESERVA').AsFloat;
       Cds.Post;

       CdsResxComp.Next; //Renan

    end;
    //Renan Inicio
    if Not(CdsResDisp.Eof) then
    begin
      CdsResDispTotal.Insert;
      CdsResDispTotal.FieldByName('IDOPERACAO').AsInteger := CdsResxCompTotal.FieldByName('IDOPERACAO').AsInteger;
      CdsResDispTotal.FieldByName('VLRRESERVA').AsFloat := CdsResxCompTotal.FieldByName('VLRRESERVA').AsFloat;
      CdsResDispTotal.FieldByName('GRUPO').AsString := CdsResxCompTotal.FieldByName('GRUPO').AsString;
      CdsResDispTotal.FieldByName('PERIODO').AsInteger := CdsResxCompTotal.FieldByName('PERIODO').AsInteger;
      CdsResDispTotal.FieldByName('EXERCICIO').AsInteger := CdsResxCompTotal.FieldByName('EXERCICIO').AsInteger;
      TStringField(CdsResDispTotal.FieldByName('OBSRESERVA')).ReadOnly := False;
      CdsResDispTotal.FieldByName('OBSRESERVA').AsString := CdsResxCompTotal.FieldByName('OBSRESERVA').AsString;
      TStringField(CdsResDispTotal.FieldByName('OBSRESERVA')).ReadOnly := True;
      CdsResDispTotal.Post;
    end;

    if CdsResxComp.IsEmpty then
    begin
       CdsResxComp.Filtered := False;
       CdsResxCompTotal.Delete;
    end;

     //Habilita botão excluir apenas quando tiver registros para excluir
     if CdsResxComp.IsEmpty then
        btExcluir.Enabled := False;
     if not CdsResDisp.IsEmpty then
        btIncluir.Enabled := True;
    //Renan Fim
  end;
end;




procedure TFrmCompromissosPorGrupoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data         := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('C','',-1,-1,-1,-1,-1,-1,-1);
  CdsResxComp.Data := CtrlTransacoesPorGrupo.ListaResxComp(-1,-1);
  CdsResxCompTotal.Data := CtrlTransacoesPorGrupo.ListaResxComp(-1,-1); //Renan
  CdsResDisp.Data  := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(-1,-1,-1,-1,-1,False);
  CdsResDispTotal.Data  := CtrlTransacoesPorGrupo.ListaReservasDisponiveis(-1,-1,-1,-1,-1,False); //RENAN
  LimparFiltrosTela;
end;



procedure TFrmCompromissosPorGrupoMT.GridCompSemResTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  if AFieldName <> 'OBSRESERVA' then
     Cds.IndexFieldNames := AFieldName;
end;

procedure TFrmCompromissosPorGrupoMT.LimparFiltrosTela;
begin
   cboPeriodo.ItemIndex := (DiasUteis.ExtraiMes(date));
   edtExercicio.Value   := DiasUteis.ExtraiAno(date);
   cboRatCriter.Clear;
   edtVlrRateio.Value := 0;
   mmObs.Lines.Clear; //Brunno Mattos - KTN 1121518 - SOL 151906
   uFuncoesOrcamento.ClearFilters(Self,pnlFundo);//VANDER SOL 172384/9361 KINTANA 1653184
end;

procedure TFrmCompromissosPorGrupoMT.btCancelarClick(Sender: TObject);
begin
  inherited;
  with TCMClientDataSet.Create(nil) do
  try
     Data     := Cds.Data;
     Filter   := 'VALIDAR = ''S''';
     Filtered := true;
              
     if MsgDlg('Deseja realmente cancelar os ' + IntToStr(RecordCount) + ' compromissos(s) selecionado(s)?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
        if not CtrlTransacoesPorGrupo.CancelaReservaCompromisso(Cds.Data,'C',(PageControl.ActivePageIndex = 1),Sistema.IdEmpresa) then
           MsgDlg('Não foi possível cancelar os compromissos. ' +
                  'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0)
        else
        begin
           Cds.Data := CtrlTransacoesPorGrupo.ListaReservaCompromissoEfetuado('C','',-1,-1,-1,-1,-1,-1,-1);
           MsgDlg('Processo concluído com sucesso!','Aviso',mtInformation,[mbOk],0);
        end;
     end;

  finally
     Free;
     btCancelar.Down := False;
  end;
end;




procedure TFrmCompromissosPorGrupoMT.btMarcaTodosClick(Sender: TObject);
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




procedure TFrmCompromissosPorGrupoMT.btInverteSelClick(Sender: TObject);
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

procedure TFrmCompromissosPorGrupoMT.MontaSelectBeforeOpenCds(var sqlText: String; strListParams: TStringList);
Const
  QtdItems      = 9;
  OrigemDestino : Array[1..QtdItems] of          // Origem                              - Destino
                  Array[1..2       ] Of String = (
                                                  ('GRUPOORCAMEN.NOMEGRUPOORCAMEN'      , 'GRUPOORCAMEN.NOMEGRUPOORCAMEN || '' - Anual'''),
                                                  ('RESERVAORCAMEN.PERIODO'             , '0'),
                                                  ('RESERVAORCAMEN.DATAREFERENCIA'      , 'TO_DATE(TO_CHAR(RESERVAORCAMEN.DATAREFERENCIA, ''yyyy''), ''yyyy'')'),
                                                  ('DECODE(RXC.IDCOMPROMISSO'           , #39 + 'SR' + #39),
                                                  ('RESERVAORCAMEN.FLGRESERVA'          , #39 + '0' + #39),
                                                  ('COMPROMISSOXAJUSTE.IDOPERACAOAJUSTE',             '0'),
                                                  ('RESERVAORCAMEN.PERIODO'             ,             '0'),
                                                  ('DECODE(RXC.IDCOMPROMISSO'           , #39 + '0' + #39),
                                                  ('RESERVAORCAMEN.OBSRESERVA'          , #39 + '0' + #39)
                                                 );
var
  sSQL,sSQLUnion: TStrings;
  iOrderBy: integer;

  //
  I,J : Integer;
begin
  inherited;
  try
     sSQL      := TStringList.Create;
     sSQLUnion := TStringList.Create;

     sSQL.Text      := sqlText;
     sSQLUnion.Text := sqlText;

     For I := 3 to sSQLUnion.Count - 1 do
       if Pos('FROM', UpperCase(sSQLUnion.Strings[I])) > 0 Then
          Break
       Else
         For J := 1 to QtdItems do
           if Pos(OrigemDestino[J,1], sSQLUnion.Strings[I]) > 0 Then
              sSQLUnion.Strings[I] := OrigemDestino[J,2] + ' AS C' + IntToStr(I-2) +', ';



     {sSQLUnion.Strings[3]  := 'GRUPOORCAMEN.NOMEGRUPOORCAMEN || '' - Anual'' AS C1, ';
     sSQLUnion.Strings[4]  := '0 AS C2, ';
     //Brunno i
     sSQLUnion.Strings[6]  := 'to_date(to_char(RESERVAORCAMEN.DATAREFERENCIA, ''yyyy''), ''yyyy'') as C4,';
     sSQLUnion.Strings[7]  := '''0'' as C5,';
     sSQLUnion.Strings[8]  := '''0'' as C6,';
     //
     sSQLUnion.Strings[12] := '0 as C10,';
     sSQLUnion.Strings[14] := 'to_date(to_char(RESERVAORCAMEN.DATAREFERENCIA, ''yyyy''), ''yyyy'') as C12,';
     sSQLUnion.Strings[15] := '''0'' as C13,';
     sSQLUnion.Strings[16] := '''0'' as C14,';
     sSQLUnion.Strings[20] := '''0'' as C18';

     //if AnsiContainsStr(frase, 'PHP') then
     //if not AnsiContainsStr(strListParams.Text, 'IDOPERACAO') Then

     if pos('RESERVAORCAMEN.IDOPERACAO', strListParams.Text) = 0 Then
     begin
        sSQLUnion.Strings[9]  := '0 as C7,';
        sSQLUnion.Strings[10] := '0 as C8,';
        sSQLUnion.Strings[17] := '0 as C15,';
     end;}

     //Brunno f

     iOrderBy := (sSQL.Count - 1);

     sSQL.Strings[iOrderBy] := '';
     sSQLUnion.Strings[iOrderBy] := ' ORDER BY C0 ASC, C3, C2 ';

     sqlText := sSQL.Text + ' UNION ' + #13#10 + sSQLUnion.Text;
  finally
     FreeAndNil(sSQL);
     FreeAndNil(sSQLUnion);
  end;
end;


procedure TFrmCompromissosPorGrupoMT.GridCompSemResCellChanged(
  Sender: TObject);
begin
  inherited;
end;

//Ricardo Freitas SOL 151878 KINTANA 1121523
procedure TFrmCompromissosPorGrupoMT.btn1Click(Sender: TObject);
var
   bEditar:Boolean;
begin
  inherited;

  bEditar := true;

  //Mensal
  if cboPeriodo.ItemIndex <> 0 then
  begin
       if dtp_Dt_Referencia.DateTime <   StrToDateTime('01/' + FormatFloat('00',cboPeriodo.ItemIndex)+'/' + Trim(edtExercicio.Text))then
       begin
          bEditar := false;
       end;
  end;

  if not bEditar then
     Application.MessageBox('Data de referência inválida.','Atenção',48);

  if bEditar then
     CtrlTransacoesPorGrupo.EditarDatasReferencia(cds, StrToDateTime(FormatDatetime('dd/mm/yyyy',dtp_Dt_Referencia.Datetime)));
end;

procedure TFrmCompromissosPorGrupoMT.bbtnConfirmarClick(Sender: TObject);
begin
  pnlDataReferencia.Visible := false;
  inherited;

end;

procedure TFrmCompromissosPorGrupoMT.bbtnCancelarClick(Sender: TObject);
begin
  pnlDataReferencia.Visible := false;
  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  LimparFiltrosTela;
  inherited;
end;

//Ricardo SOL: 151907 - KINTANA Zera valores caso o saldo total for zerado no rateio
procedure TFrmCompromissosPorGrupoMT.VerificaZeraSaldo;
var
    sSaldo:double;
begin
     //Ricardo SOL: 151907 - KINTANA Zera valores caso o saldo total for zerado no rateio
     sSaldo := 0;

     if  PageControl.ActivePageIndex = 0 then
     begin
          if (Trim(GridCompSemRes.ColumnByName('SALDO').FooterValue) <> '') then
             sSaldo := StrToCurr(Trim(StringReplace(GridCompSemRes.ColumnByName('SALDO').FooterValue,'.','',[rfReplaceAll])));
     end
     else
     begin
          if (Trim(GridGrupoComReserva.ColumnByName('SALDO').FooterValue) <> '') then
             sSaldo := StrToFloat(Trim(StringReplace(GridCompSemRes.ColumnByName('VALOR').FooterValue,'.','',[rfReplaceAll])));
     end;

     if (sSaldo = 0) then
     begin
         cds.BeforePost := nil;
         cds.First;

         while not cds.eof Do
         begin
              cds.Edit;
              cds.FieldByName('SALDO').ReadOnly := false;
              // Thiago Melo SOL 202785-14192 ktn 1967043 INI
              CDs.Fields[5].ReadOnly := False;
              // Thiago Melo SOL 202785-14192 ktn 1967043 FIM

              cds.FieldByName('SALDO').AsFloat := 0;
              // Thiago Melo SOL 202785-14192 ktn 1967043 INI
              CDs.Fields[5].AsString := Cds.FieldByName('IDRESERVAORCAMEN').AsString;
              // Thiago Melo SOL 202785-14192 ktn 1967043 FIM

              cds.Post;
              cds.Next;
         end;
         
         cds.First;
         cds.FieldByName('SALDO').ReadOnly := true;
         // Thiago Melo SOL 202785-14192 ktn 1967043 INI
         CDs.Fields[5].ReadOnly := True;
         // Thiago Melo SOL 202785-14192 ktn 1967043 FIM
         cds.BeforePost := CdsBeforePost;
     end;
     Application.ProcessMessages;
end;

procedure TFrmCompromissosPorGrupoMT.btBuscFornClick(Sender: TObject);
begin
  inherited;
  MsDespesa.Filtro.Clear;
  MsDespesa.Filtro.Add('D.IDFORNECEDOR = P.IDPESSOA(+) ');

  if Trim(edtDescGrupo.text) <> '' then
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
      {
procedure TFrmCompromissosPorGrupoMT.ClearFilters;
Var
  I : Integer;
begin

  For i := 0 To Self.ComponentCount - 1 do
    if (TWinControl(Self.Components[I]).Parent = pnlFundo)  Then
       if (Self.Components[I].ClassType = TCMDBLookupCombo)  Then
          TCMDBLookupCombo(Self.Components[I]).LookupValue := '';

end;
       }
procedure TFrmCompromissosPorGrupoMT.cboPlanoOrcamentarioChange(
  Sender: TObject);
begin
  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
  if cdsPlanoOrc.FieldByName('ANO').AsString <> '' then
     edtExercicio.Text := cdsPlanoOrc.FieldByName('ANO').AsString;
end;

end.
