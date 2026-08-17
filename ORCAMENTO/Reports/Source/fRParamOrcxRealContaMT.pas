{ --------------------------------------------------------------------------------------------------
// Autor.........: Felipe Azevedo dos Santos
// Data..........: 27/05/2013
// Nº SOL........: 190485
// Nº KINTANA....: 1929913
// Rotina........: MontaSQLPorRelatorio
// Descrição.....: inserção do filtro imprimir valores sem
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
// Autor.........: Marcio Sanches Spinosa
// Data..........: 18/04/2012
// Nº SOL........: 172383/9181
// Nº KINTANA....: 1640404
// Rotina........: MontaSQLPorRelatorio
// Descrição.....: Alteração em selects para que apareçam os grupos sinteticos
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 24/08/2011
// Nº SOL........: 160740
// Nº KINTANA....: 1358934
// Rotina........: Tudo
// Descrição.....: Reformulação da Tela adicionado novos parãmetros.
---------------------------------------------------------------------------------------------------}
unit fRParamOrcxRealContaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, Mask, wwdbedit, Wwdbspin, ComCtrls, TREdit,
  wwdblook, mPlanoOrcamentarioMT, CMProcuraMask, Spin, Grids, DBGrids,
  MontaSelect, Wwdbigrd, Wwdbgrid, ToolWin, ImgList;

type
  TfrmRParamOrcxRealContaMT = class(TfrmParamReports_Padrao)
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label1: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label4: TLabel;
    dblcCentRespConta: TwwDBLookupCombo;
    rgSinal: TRadioGroup;
    rgUsuXCCCR: TRadioGroup;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    cdsCenRespConta: TCMClientDataSet;
    sqlCenRespConta: TCMSqlParams;
    cdsGrupIni: TCMClientDataSet;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoFim: TCMClientDataSet;
    sqlGrupoFim: TCMSqlParams;
    rdgpNegativos: TRadioGroup;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    dblkPeriodoFim: TwwDBLookupCombo;
    Label10: TLabel;
    dblkPeriodoProjOrcado: TwwDBLookupCombo;
    Label14: TLabel;
    dblcCenario: TwwDBLookupCombo;
    Label15: TLabel;
    chkValoresZerados: TCheckBox;
    dblcMoeda: TwwDBLookupCombo;
    Label16: TLabel;
    spnGrau: TSpinEdit;
    pnlExcel: TPanel;
    chkExcel: TCheckBox;
    lblExcel: TLabel;
    edtExcel: TEdit;
    btnSelecionaExcel: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    sqlPeriodoOrcado: TCMSqlParams;
    cdsPeriodoOrcado: TCMClientDataSet;
    DBedtGrupo: TCMProcuraMask;
    MontaSelectGrupoIni: TMontaSelect;
    DBedtGrupoFinal: TCMProcuraMask;
    MontaSelectGrupoFim: TMontaSelect;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    Label7: TLabel;
    pgcCompo: TPageControl;
    tbsCentroCusto: TTabSheet;
    lblRotuloCentroCusto: TLabel;
    tbsAtividade: TTabSheet;
    tbsPlanoPrev: TTabSheet;
    tbsPatro: TTabSheet;
    tbsPrograma: TTabSheet;
    tbsTipoDespesa: TTabSheet;
    Panel1: TPanel;
    lblCCustoSel: TLabel;
    Panel2: TPanel;
    lblCCustoDisp: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    lblAtivProjDisp: TLabel;
    Panel5: TPanel;
    lblPlanoDisp: TLabel;
    Panel6: TPanel;
    lblPatroDisp: TLabel;
    Panel7: TPanel;
    lblProgramaDisp: TLabel;
    Panel8: TPanel;
    lblTipoDespesaDisp: TLabel;
    Panel9: TPanel;
    lblAtivProjSel: TLabel;
    Panel10: TPanel;
    lblPlanoSel: TLabel;
    Panel11: TPanel;
    lblPatroSel: TLabel;
    Panel12: TPanel;
    lblProgramaSel: TLabel;
    Panel13: TPanel;
    lblTipoDespesaSel: TLabel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    SqlAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    cdsCCustoDisp: TCMClientDataSet;
    cdsCCustoSel: TCMClientDataSet;
    cdsAtivProjDisp: TCMClientDataSet;
    cdsAtivProjSel: TCMClientDataSet;
    cdsPlanoDisp: TCMClientDataSet;
    cdsPlanoSel: TCMClientDataSet;
    cdsPatroDisp: TCMClientDataSet;
    cdsPatroSel: TCMClientDataSet;
    cdsProgramaDisp: TCMClientDataSet;
    cdsProgramaSel: TCMClientDataSet;
    cdsTipoDespesaDisp: TCMClientDataSet;
    cdsTipoDespesaSel: TCMClientDataSet;
    dsCCustoDisp: TDataSource;
    dsAtivProjDisp: TDataSource;
    dsPlanoDisp: TDataSource;
    dsPatroDisp: TDataSource;
    dsProgramaDisp: TDataSource;
    dsTipoDespesaDisp: TDataSource;
    dsCCustoSel: TDataSource;
    dsAtivProjSel: TDataSource;
    dsPlanoSel: TDataSource;
    dsPatroSel: TDataSource;
    dsProgramaSel: TDataSource;
    dsTipoDespesaSel: TDataSource;
    GridCCustoDisp: TwwDBGrid;
    GridCCustoSel: TwwDBGrid;
    GridAtivProjDisp: TwwDBGrid;
    GridAtivProjSel: TwwDBGrid;
    GridPlanoDisp: TwwDBGrid;
    GridPlanoSel: TwwDBGrid;
    GridPatroDisp: TwwDBGrid;
    GridPatroSel: TwwDBGrid;
    GridProgramaDisp: TwwDBGrid;
    GridProgramaSel: TwwDBGrid;
    GridTipoDespesaDisp: TwwDBGrid;
    GridTipoDespesaSel: TwwDBGrid;
    dlgOpenXls: TOpenDialog;
    imgBotoes: TImageList;
    ToolBar1: TToolBar;
    btnCCDisponiveis: TToolButton;
    btnCCSelecionados: TToolButton;
    btnCCDisponiveisTodos: TToolButton;
    btnCCSelecionadosTodos: TToolButton;
    BtnCCRefresh: TToolButton;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolBar3: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolBar4: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolBar5: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolBar6: TToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    Splitter1: TSplitter;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    chkTodos: TCheckBox;
    chkDeducao: TCheckBox;
    chkSuplementacao: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure chkExcelClick(Sender: TObject);
    procedure btnSelecionaExcelClick(Sender: TObject);
    procedure btnCCDisponiveisClick(Sender: TObject);
    procedure btnCCSelecionadosClick(Sender: TObject);
    procedure btnCCDisponiveisTodosClick(Sender: TObject);
    procedure btnCCSelecionadosTodosClick(Sender: TObject);
    procedure BtnCCRefreshClick(Sender: TObject);
    procedure GridCCustoDispTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure chkSuplementacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkSuplementacaoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure chkDeducaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkDeducaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chkTodosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkTodosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure PreencheParam;
    procedure Totaliza;
  public
    { Public declarations }
    function VerificaPreenchimento:boolean;
    function RetornaDatapacket(sSQL:string):oleVariant;
  end;

var
  frmRParamOrcxRealContaMT: TfrmRParamOrcxRealContaMT;

implementation

uses uMensErro, uSistema, uData;

{$R *.DFM}

procedure TfrmRParamOrcxRealContaMT.FormCreate(Sender: TObject);
begin
  inherited;

  //Preenche as combo-boxes
  pgcCompo.ActivePageIndex := 0;

  //Período
  with sqlExercicio do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    Open;
  end;

  //Plano orçamentário
  with molPlanoOrcamentario,sqlPlanoOrcamen do
  begin
     Prepare;
     Open;
  end;

  //Período Inicial
  with sqlPeriodoIni do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;

  //Período Final
  with sqlPeriodoFim do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;

  //Período Orçado
  with sqlPeriodoOrcado do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;

  //Grupo Inicial
  with sqlGrupoIni do begin
    Prepare;
    Open;
  end;

  with sqlGrupoIni do begin
    cdsGrupIni.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;

  //Grupo Final
  with sqlGrupoFim do begin
    Prepare;
    Open;
  end;

  with sqlGrupoFim do begin
    cdsGrupoFim.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;

  //Centro de Custo Inicial
  {with sqlCCustoIni  do begin
    Prepare;
    ParamByName('IDEMPRESA').asInteger := sistema.idEmpresa;
    Open;
  end;}

  //Centro de Custo Final
  {with sqlCCustoFim  do begin
    Prepare;
    ParamByName('IDEMPRESA').asInteger := sistema.idEmpresa;
    Open;
  end;}

  //Centro de Responsabilidade
  with sqlCenRespConta do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;


  PreencheParam();

  {with sqlPlanoPrev do begin
    Prepare;
    Open;
  end;
  with sqlPatro do begin
    Prepare;
    Open;
  end;

  with sqlAtivProj do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;
  }

  Application.ProcessMessages;
end;

procedure TfrmRParamOrcxRealContaMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
  //Preenche a combo-box de períodos

  if Trim(dblkExercicio.text) <> '' then
  begin

    //Período Início
    with sqlPeriodoIni do
    begin
      cdsPeriodoIni.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;

    //Período Final
    with sqlPeriodoFim do
    begin
      cdsPeriodoFim.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;

    //Período Final Orçado
    with sqlPeriodoOrcado do
    begin
      cdsPeriodoOrcado.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;

    dblkPeriodoIni.Enabled        := true;
    dblkPeriodoFim.Enabled        := true;
    dblkPeriodoProjOrcado.Enabled := true;
  end
  else
  begin
    dblkPeriodoIni.Enabled        := false;
    dblkPeriodoFim.Enabled        := false;
    dblkPeriodoProjOrcado.Enabled := false;
  end;

  Application.ProcessMessages;

end;

procedure TfrmRParamOrcxRealContaMT.bbtnConfirmarClick(Sender: TObject);
begin

    //Realizar Validações
    if not VerificaPreenchimento then
    begin
       ModalResult := mrNone;
       exit;
    end;

    Inherited;

    //Parametros de Relatório
    {
    00 - Plano orçamentário
    01 - Exercício
    02 - Período Inicial
    03 - Período Final
    04 - Período Orçado
    05 - Grupo Inicial
    06 - Grupo Final
    07 - Posição Inicial de Grupo
    08 - Posição Final de Grupo
    09 - Centro de Responsabilidade
    10 - Moeda
    11 - Grau
    12 - Cenário
    13 - Considerar Valores
    14 - Indicar valore negativos por
    15 - Usuário por centro de
    16 - Imprimir Valores Zerados
    17 - Centro de Custa
    18 - Atividade / projeto
    19 - Plano Previdenciário
    20 - Patrocinadora
    21 - Programa
    22 - Tipo de Despesa
    23 - Caminho do Excel
    24 - Parametro24
    25 - Parametro25
    26 - Parametro26
    27 - Parametro27
    28 - Parametro28
    29 - Parametro29
    30 - Imprimir Valores Sem
    31 - Nome do Filtro Valores Sem
    }

    //Preenche Parâmetros do Relatório
    Cmp_Padrao.ParamValues[0].AsString  := molPlanoOrcamentario.cboPlanoOrcamen.LookupValue; //Plano Orçamentário
    Cmp_Padrao.ParamValues[1].AsString  := dblkExercicio.LookupValue; //Exercício

    // Felipe A. Santos SOL 190485 Kintana 1929913 - início
    {
    Cmp_Padrao.ParamValues[2].AsString   := dblkPeriodoIni.LookupValue; //Período Inicial
    Cmp_Padrao.ParamValues[3].AsString   := dblkPeriodoFim.LookupValue; //Período Final
     }
    Cmp_Padrao.ParamValues[2].AsInteger   := StrToInt(dblkPeriodoIni.LookupValue); //Período Inicial
    Cmp_Padrao.ParamValues[3].AsInteger   := StrToInt(dblkPeriodoFim.LookupValue); //Período Final
    // Felipe A. Santos SOL 190485 Kintana 1929913 - fim

    //Período Orçado
    if trim(dblkPeriodoProjOrcado.Text) <> '' then
       Cmp_Padrao.ParamValues[4].AsString   := dblkPeriodoProjOrcado.LookupValue //Período orçado
    else
       Cmp_Padrao.ParamValues[4].AsString   := '0'; //Período orçado

    //Grupo Inicial
    if trim(DBedtGrupo.DadoExibido) <> '' then
       Cmp_Padrao.ParamValues[5].AsString   := DBedtGrupo.DadoExibido //Grupo Inicial
    else
       Cmp_Padrao.ParamValues[5].AsString   := ''; //Grupo Inicial

    //Grupo Final
    if trim(DBedtGrupoFinal.DadoExibido) <> '' then
       Cmp_Padrao.ParamValues[6].AsString   := DBedtGrupoFinal.DadoExibido//Grupo Final
    else
       Cmp_Padrao.ParamValues[6].AsString   := ''; //Grupo Final

    //Posição Inicial do código de Grupo
    if sePosIni1.Value <> 0 then
       Cmp_Padrao.ParamValues[7].AsString  :=  FloatToStr(sePosIni1.Value)
    else
       Cmp_Padrao.ParamValues[7].AsString  := '0';

    //Posição Final do código de Grupo
    if sePosFim1.Value <> 0 then
       Cmp_Padrao.ParamValues[8].AsString  := FloatToStr(sePosFim1.Value)
    else
       Cmp_Padrao.ParamValues[8].AsString  := '0';

    //Centro de Responsabilidade
    if dblcCentRespConta.LookupValue <> '' then
       Cmp_Padrao.ParamValues[9].AsString := dblcCentRespConta.LookupValue
    else
       Cmp_Padrao.ParamValues[9].AsString := '';

    //Moeda
    if dblcMoeda.LookupValue <> '' then
       Cmp_Padrao.ParamValues[10].AsString := dblcMoeda.LookupValue
    else
       Cmp_Padrao.ParamValues[10].AsString := '';

    Cmp_Padrao.ParamValues[11].AsString :=   FloattoStr(spnGrau.Value); //Grau

    //Cenário
    if dblcCenario.LookupValue <> '' then
       Cmp_Padrao.ParamValues[12].AsString := dblcCenario.LookupValue
    else
       Cmp_Padrao.ParamValues[12].AsString := '';

    //Considerar Valores
    Cmp_Padrao.ParamValues[13].AsString := InttoStr(rgSinal.ItemIndex);

    //Indicar valore negativos por
    Cmp_Padrao.ParamValues[14].AsString := InttoStr(rdgpNegativos.ItemIndex);

    //Usuário por centro de
    Cmp_Padrao.ParamValues[15].AsString := InttoStr(rgUsuXCCCR.ItemIndex);

     // Marcio SOL 172383/9181 / KTN : 1640404 - Inicio - Comentário do grupo de linhas
    //Imprimir Valores Zeradoss
{    if chkValoresZerados.Checked then
       Cmp_Padrao.ParamValues[16].AsString := 'S' //Sim
    else
       Cmp_Padrao.ParamValues[16].AsString := 'N'; //Não}


    if chkValoresZerados.Checked then
       Cmp_Padrao.ParamValues[16].AsString := '1' //Sim
    else
       Cmp_Padrao.ParamValues[16].AsString := '0'; //Não
   // Marcio SOL 172383/9181 / KTN : 1640404 - Fim

    //Parâmetros
    Cmp_Padrao.ParamValues[17].AsString := '';
    Cmp_Padrao.ParamValues[18].AsString := '';
    Cmp_Padrao.ParamValues[19].AsString := '';
    Cmp_Padrao.ParamValues[20].AsString := '';
    Cmp_Padrao.ParamValues[21].AsString := '';
    Cmp_Padrao.ParamValues[22].AsString := '';

    //Centro de Custa
    if not cdsCCustoSel.IsEmpty then
    begin
        cdsCCustoSel.first;
        while not cdsCCustoSel.eof Do
        begin
             Cmp_Padrao.ParamValues[17].AsString := Cmp_Padrao.ParamValues[17].AsString + cdsCCustoSel.fieldbyname('CODCENTROCUSTO').AsString + ',';
             cdsCCustoSel.Next;
        end;
    end
    else
        Cmp_Padrao.ParamValues[17].AsString := '';

    //Atividade / projeto
    if not cdsAtivProjSel.IsEmpty then
    begin
        cdsAtivProjSel.first;
        while not cdsAtivProjSel.eof Do
        begin
             Cmp_Padrao.ParamValues[18].AsString := Cmp_Padrao.ParamValues[18].AsString + cdsAtivProjSel.fieldbyname('UNIDNEGOC').AsString + ',';
             cdsAtivProjSel.Next;
        end;
    end
    else
        Cmp_Padrao.ParamValues[18].AsString := '';

    //Plano Previdenciário
    if not cdsPlanoSel.IsEmpty then
    begin
        cdsPlanoSel.first;
        while not cdsPlanoSel.eof Do
        begin
             Cmp_Padrao.ParamValues[19].AsString := Cmp_Padrao.ParamValues[19].AsString + cdsPlanoSel.fieldbyname('IDPLANOPREV').AsString + ',';
             cdsPlanoSel.Next;
        end;
    end
    else
        Cmp_Padrao.ParamValues[19].AsString := '';

    //Patrocinadora
    if not cdsPatroSel.IsEmpty then
    begin
        cdsPatroSel.first;
        while not cdsPatroSel.eof Do
        begin
             Cmp_Padrao.ParamValues[20].AsString := Cmp_Padrao.ParamValues[20].AsString + cdsPatroSel.fieldbyname('IDPESSOA').AsString + ',';
             cdsPatroSel.Next;
        end;
    end
    else
        Cmp_Padrao.ParamValues[20].AsString := '';

    //Programa
    if not cdsProgramaSel.IsEmpty then
    begin
        cdsProgramaSel.first;
        while not cdsProgramaSel.eof Do
        begin
             Cmp_Padrao.ParamValues[21].AsString := Cmp_Padrao.ParamValues[21].AsString + cdsProgramaSel.fieldbyname('IDPROGRAMAORCAMEN').AsString + ',';
             cdsProgramaSel.Next;
        end;
    end
    else
        Cmp_Padrao.ParamValues[21].AsString := '';

    //Tipo de Despesa
    if not cdsTipoDespesaSel.IsEmpty then
    begin
        cdsTipoDespesaSel.first;
        while not cdsTipoDespesaSel.eof Do
        begin
             Cmp_Padrao.ParamValues[22].AsString := Cmp_Padrao.ParamValues[22].AsString + cdsTipoDespesaSel.fieldbyname('IDTIPO_DEPESAORCAMEN').AsString + ',';
             cdsTipoDespesaSel.Next;
        end;
    end
    else
        Cmp_Padrao.ParamValues[22].AsString := '';

    //Retira vírgula final
    if Cmp_Padrao.ParamValues[17].AsString <> '' then
       Cmp_Padrao.ParamValues[17].AsString := Copy(Trim(Cmp_Padrao.ParamValues[17].AsString),1,Length(Trim(Cmp_Padrao.ParamValues[17].AsString)) - 1);

    if Cmp_Padrao.ParamValues[18].AsString <> '' then
       Cmp_Padrao.ParamValues[18].AsString := Copy(Trim(Cmp_Padrao.ParamValues[18].AsString),1,Length(Trim(Cmp_Padrao.ParamValues[18].AsString)) - 1);

    if Cmp_Padrao.ParamValues[19].AsString <> '' then
       Cmp_Padrao.ParamValues[19].AsString := Copy(Trim(Cmp_Padrao.ParamValues[19].AsString),1,Length(Trim(Cmp_Padrao.ParamValues[19].AsString)) - 1);

    if Cmp_Padrao.ParamValues[20].AsString <> '' then
       Cmp_Padrao.ParamValues[20].AsString := Copy(Trim(Cmp_Padrao.ParamValues[20].AsString),1,Length(Trim(Cmp_Padrao.ParamValues[20].AsString)) - 1);

    if Cmp_Padrao.ParamValues[21].AsString <> '' then
       Cmp_Padrao.ParamValues[21].AsString := Copy(Trim(Cmp_Padrao.ParamValues[21].AsString),1,Length(Trim(Cmp_Padrao.ParamValues[21].AsString)) - 1);

    if Cmp_Padrao.ParamValues[22].AsString <> '' then
       Cmp_Padrao.ParamValues[22].AsString := Copy(Trim(Cmp_Padrao.ParamValues[22].AsString),1,Length(Trim(Cmp_Padrao.ParamValues[22].AsString)) - 1);

    //Caminho do Excel
    if (chkExcel.Checked) and (Trim(edtExcel.Text) <> '') then
       Cmp_Padrao.ParamValues[23].AsString := Trim(edtExcel.Text)
    else
       Cmp_Padrao.ParamValues[23].AsString := '';
    //Ricardo SOL 160740 KTN 1358934 - fim

    // Felipe A. Santos SOL 190485 Kintana 1929913 - inicio

    // parâmetros
    Cmp_Padrao.ParamValues[24].AsString := '';
    Cmp_Padrao.ParamValues[25].AsInteger := 0;
    Cmp_Padrao.ParamValues[26].AsString := '';
    Cmp_Padrao.ParamValues[27].AsString := '';
    Cmp_Padrao.ParamValues[28].AsString := '';
    Cmp_Padrao.ParamValues[28].AsString := '';
    Cmp_Padrao.ParamValues[29].AsString := '';

    // parametros para filtrar o valor orcado do relatório
    if chkSuplementacao.Checked then
       Cmp_Padrao.ParamValues[30].AsString := 'R'
    else if chkDeducao.Checked then
       Cmp_Padrao.ParamValues[30].AsString := 'S'
    else if chkTodos.Checked then
       Cmp_Padrao.ParamValues[30].AsString := 'T'
    else
       Cmp_Padrao.ParamValues[30].AsString := '';
    // Felipe A. Santos SOL 190485 Kintana 1929913 - Fim
     
End;
//************************************************
procedure TfrmRParamOrcxRealContaMT.molPlanoOrcamentariocboPlanoOrcamenCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with sqlGrupoIni do begin
    cdsGrupIni.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;
  with sqlGrupoFim do begin
    cdsGrupoFim.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;
end;

procedure TfrmRParamOrcxRealContaMT.chkExcelClick(Sender: TObject);
begin
  inherited;
  lblExcel.Visible          :=  chkExcel.Checked;
  edtExcel.Visible          :=  chkExcel.Checked;
  btnSelecionaExcel.Visible :=  chkExcel.Checked;
  Application.ProcessMessages;
end;

function TfrmRParamOrcxRealContaMT.RetornaDatapacket(
  sSQL: string): oleVariant;
begin
     TRY
        SqlAux.SQL.Clear;
        SqlAux.SQL.Text := Trim(sSQL);
        SqlAux.Prepare;
        SqlAux.Open;

        Result := cdsAux.Data;

     FINALLY
        cdsAux.Close;
     END;
end;

procedure TfrmRParamOrcxRealContaMT.Preencheparam;
var
   sSQL:string;
begin
      //Centro de Custo
      sSQL :=  ' select CODCENTROCUSTO, ' +
               ' trim(NOME) || decode(STATUSGRUPOCDC,''S'','' *'','''') || decode(ATIVO, ''S'', '''', '' (Inativo)'') as NOME '     + #13 +
               ' from CENTCUST ' +
               //' where ATIVO = '  + QuotedStr('S')  +   ' and STATUSGRUPOCDC = ' + QuotedStr('A') +
               ' order by NOME,CODCENTROCUSTO ';

      cdsCCustoDisp.DATA := RetornaDatapacket(sSQL);
      cdsCCustoSel.Data  := cdsCCustoDisp.Data;
      cdsCCustoSel.EmptyDataSet;

      //Atividade / Projeto
      sSQL :=  ' SELECT U.NOME AS ATIVIDADEPROJETO, U.UNIDNEGOC ' +
               ' from UNIDNEGOCIO U ORDER BY U.NOME ';

      cdsAtivProjDisp.DATA := RetornaDatapacket(sSQL);
      cdsAtivProjSel.Data  := cdsAtivProjDisp.Data;
      cdsAtivProjSel.EmptyDataSet;

      //Plano Previdenciário
      sSQL :=  ' select IDPLANOPREV, NOME from PLANPREVCONTABIL ' +
               //' where ATIVO = '  + QuotedStr('S')  +
               ' order by NOME';
      cdsPlanoDisp.DATA := RetornaDatapacket(sSQL);
      cdsPlanoSel.Data  := cdsPlanoDisp.Data;
      cdsPlanoSel.EmptyDataSet;

      //Patrocinadora
      sSQL := ' select P.IDPESSOA, P.NOME from PATRO PT, PESSOA P ' +
              ' where P.IDPESSOA = PT.IDPESSOA order by P.NOME ';
      cdsPatroDisp.DATA   := RetornaDatapacket(sSQL);
      cdsPatroSel.Data    := cdsPatroDisp.Data;
      cdsPatroSel.EmptyDataSet;

      //Programa
      sSQL := ' select P.IDPROGRAMAORCAMEN, P.DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA ' +
              ' from CM.PROGRAMAORCAMEN P order by P.DESCRICAO_PROGRAMAORCAMEN ';
      cdsProgramaDisp.DATA   := RetornaDatapacket(sSQL);
      cdsProgramaSel.Data    := cdsProgramaDisp.Data;
      cdsProgramaSel.EmptyDataSet;


      //Tipo de Despesa
      sSQL := ' select TD.IDTIPO_DEPESAORCAMEN, TD.DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' +
              ' from CM.TIPO_DESPESAORCAMEN TD order by TD.DESCRICAO_TIPO_DEPESAOCAMEN';
      cdsTipoDespesaDisp.DATA   := RetornaDatapacket(sSQL);
      cdsTipoDespesaSel.Data    := cdsTipoDespesaDisp.Data;
      cdsTipoDespesaSel.EmptyDataSet;

      Totaliza();

end;

procedure TfrmRParamOrcxRealContaMT.btnSelecionaExcelClick(
  Sender: TObject);
begin
  inherited;
  if dlgOpenXls.Execute then
  begin
       edtExcel.Text := Trim(dlgOpenXls.FileName);
  end
  else
  begin
       edtExcel.Clear;
       chkExcel.Checked := false;
  end;
end;

procedure TfrmRParamOrcxRealContaMT.btnCCDisponiveisClick(Sender: TObject);
var
   strcampo1,strcampo2:string;
   cdsDisp,cdsSel:TClientDataSet;
begin
  inherited;

  case pgcCompo.ActivePageIndex of

    //Custo
    0:Begin
       strcampo1 := 'CODCENTROCUSTO';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCCustoDisp;
       cdsSel    := cdsCCustoSel;
    end;

    //Atividade
    1:Begin
       strcampo1 := 'UNIDNEGOC';
       strcampo2 := 'ATIVIDADEPROJETO';
       cdsDisp   := cdsAtivProjDisp;
       cdsSel    := cdsAtivProjSel;
    end;

    //Plano
    2:Begin
       strcampo1 := 'IDPLANOPREV';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPlanoDisp;
       cdsSel    := cdsPlanoSel;
    end;

    //Patrocinador
    3:Begin
       strcampo1 := 'IDPESSOA';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPatroDisp;
       cdsSel    := cdsPatroSel;

    end;

    //Programa
    4:Begin
       strcampo1 := 'IDPROGRAMAORCAMEN';
       strcampo2 := 'PROGRAMA';
       cdsDisp   := cdsProgramaDisp;
       cdsSel    := cdsProgramaSel;

    end;

    //Tipo de Despesa
    5:Begin
       strcampo1 := 'IDTIPO_DEPESAORCAMEN';
       strcampo2 := 'TIPODESPESA';
       cdsDisp   := cdsTipoDespesaDisp;
       cdsSel    := cdsTipoDespesaSel;
    end;
  end;


  if cdsDisp.IsEmpty then
     exit;

  //Vincular
  cdsSel.Append;
  cdsSel.fieldbyname(strcampo1).AsString := cdsDisp.fieldbyname(strcampo1).AsString;
  cdsSel.fieldbyname(strcampo2).AsString := cdsDisp.fieldbyname(strcampo2).AsString;
  cdsSel.Post;

  cdsDisp.Delete;

  Totaliza();
end;


procedure TfrmRParamOrcxRealContaMT.btnCCSelecionadosClick(
  Sender: TObject);
var
   strcampo1,strcampo2:string;
   cdsDisp,cdsSel:TClientDataSet;
begin
  inherited;

  case pgcCompo.ActivePageIndex of

    //Custo
    0:Begin
       strcampo1 := 'CODCENTROCUSTO';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCCustoDisp;
       cdsSel    := cdsCCustoSel;
    end;

    //Atividade
    1:Begin
       strcampo1 := 'UNIDNEGOC';
       strcampo2 := 'ATIVIDADEPROJETO';
       cdsDisp   := cdsAtivProjDisp;
       cdsSel    := cdsAtivProjSel;
    end;

    //Plano
    2:Begin
       strcampo1 := 'IDPLANOPREV';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPlanoDisp;
       cdsSel    := cdsPlanoSel;
    end;

    //Patrocinador
    3:Begin
       strcampo1 := 'IDPESSOA';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPatroDisp;
       cdsSel    := cdsPatroSel;

    end;

    //Programa
    4:Begin
       strcampo1 := 'IDPROGRAMAORCAMEN';
       strcampo2 := 'PROGRAMA';
       cdsDisp   := cdsProgramaDisp;
       cdsSel    := cdsProgramaSel;

    end;

    //Tipo de Despesa
    5:Begin
       strcampo1 := 'IDTIPO_DEPESAORCAMEN';
       strcampo2 := 'TIPODESPESA';
       cdsDisp   := cdsTipoDespesaDisp;
       cdsSel    := cdsTipoDespesaSel;
    end;
  end;


  if cdsSel.IsEmpty then
     exit;

  //Desvincular
  cdsDisp.Append;
  cdsDisp.fieldbyname(strcampo1).AsString := cdsSel.fieldbyname(strcampo1).AsString;
  cdsDisp.fieldbyname(strcampo2).AsString := cdsSel.fieldbyname(strcampo2).AsString;
  cdsDisp.Post;

  cdsSel.Delete;

  Totaliza();
end;

procedure TfrmRParamOrcxRealContaMT.btnCCDisponiveisTodosClick(
  Sender: TObject);
var
   strcampo1,strcampo2:string;
   cdsDisp,cdsSel:TClientDataSet;
begin
  inherited;

  case pgcCompo.ActivePageIndex of

    //Custo
    0:Begin
       strcampo1 := 'CODCENTROCUSTO';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCCustoDisp;
       cdsSel    := cdsCCustoSel;
    end;

    //Atividade
    1:Begin
       strcampo1 := 'UNIDNEGOC';
       strcampo2 := 'ATIVIDADEPROJETO';
       cdsDisp   := cdsAtivProjDisp;
       cdsSel    := cdsAtivProjSel;
    end;

    //Plano
    2:Begin
       strcampo1 := 'IDPLANOPREV';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPlanoDisp;
       cdsSel    := cdsPlanoSel;
    end;

    //Patrocinador
    3:Begin
       strcampo1 := 'IDPESSOA';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPatroDisp;
       cdsSel    := cdsPatroSel;

    end;

    //Programa
    4:Begin
       strcampo1 := 'IDPROGRAMAORCAMEN';
       strcampo2 := 'PROGRAMA';
       cdsDisp   := cdsProgramaDisp;
       cdsSel    := cdsProgramaSel;

    end;

    //Tipo de Despesa
    5:Begin
       strcampo1 := 'IDTIPO_DEPESAORCAMEN';
       strcampo2 := 'TIPODESPESA';
       cdsDisp   := cdsTipoDespesaDisp;
       cdsSel    := cdsTipoDespesaSel;
    end;
  end;


  if cdsDisp.IsEmpty then
     exit;

  //Vincular TUDO
  cdsDisp.First;

  while not cdsDisp.IsEmpty do
  begin

      cdsSel.Append;
      cdsSel.fieldbyname(strcampo1).AsString := cdsDisp.fieldbyname(strcampo1).AsString;
      cdsSel.fieldbyname(strcampo2).AsString := cdsDisp.fieldbyname(strcampo2).AsString;
      cdsSel.Post;

      cdsDisp.Delete;
  end;
  Totaliza();
end;

procedure TfrmRParamOrcxRealContaMT.btnCCSelecionadosTodosClick(
  Sender: TObject);
var
   strcampo1,strcampo2:string;
   cdsDisp,cdsSel:TClientDataSet;
begin
  inherited;

  case pgcCompo.ActivePageIndex of

    //Custo
    0:Begin
       strcampo1 := 'CODCENTROCUSTO';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCCustoDisp;
       cdsSel    := cdsCCustoSel;
    end;

    //Atividade
    1:Begin
       strcampo1 := 'UNIDNEGOC';
       strcampo2 := 'ATIVIDADEPROJETO';
       cdsDisp   := cdsAtivProjDisp;
       cdsSel    := cdsAtivProjSel;
    end;

    //Plano
    2:Begin
       strcampo1 := 'IDPLANOPREV';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPlanoDisp;
       cdsSel    := cdsPlanoSel;
    end;

    //Patrocinador
    3:Begin
       strcampo1 := 'IDPESSOA';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPatroDisp;
       cdsSel    := cdsPatroSel;

    end;

    //Programa
    4:Begin
       strcampo1 := 'IDPROGRAMAORCAMEN';
       strcampo2 := 'PROGRAMA';
       cdsDisp   := cdsProgramaDisp;
       cdsSel    := cdsProgramaSel;

    end;

    //Tipo de Despesa
    5:Begin
       strcampo1 := 'IDTIPO_DEPESAORCAMEN';
       strcampo2 := 'TIPODESPESA';
       cdsDisp   := cdsTipoDespesaDisp;
       cdsSel    := cdsTipoDespesaSel;
    end;
  end;


  if cdsSel.IsEmpty then
     exit;

  //Desvincular TUDO
  cdsSel.First;

  while not cdsSel.IsEmpty Do
  begin

     cdsDisp.Append;
     cdsDisp.fieldbyname(strcampo1).AsString := cdsSel.fieldbyname(strcampo1).AsString;
     cdsDisp.fieldbyname(strcampo2).AsString := cdsSel.fieldbyname(strcampo2).AsString;
     cdsDisp.Post;

     cdsSel.Delete;
  end;

  Totaliza();

end;

procedure TfrmRParamOrcxRealContaMT.BtnCCRefreshClick(Sender: TObject);
begin
  inherited;
  PreencheParam();
end;

procedure TfrmRParamOrcxRealContaMT.Totaliza;
begin
     lblCCustoDisp.Caption      := 'Disponível ('  + IntToStr(cdsCCustoDisp.RecordCount) + ')';
     lblCCustoSel.Caption       := 'Selecionado (' + IntToStr(cdsCCustoSel.RecordCount) + ')';

     lblAtivProjDisp.Caption    := 'Disponível ('  + IntToStr(cdsAtivProjDisp.RecordCount) + ')';
     lblAtivProjSel.Caption     := 'Selecionado (' + IntToStr(cdsAtivProjSel.RecordCount) + ')';

     lblPlanoDisp.Caption       := 'Disponível ('  + IntToStr(cdsPlanoDisp.RecordCount) + ')';
     lblPlanoSel.Caption        := 'Selecionado (' + IntToStr(cdsPlanoSel.RecordCount) + ')';

     lblPatroDisp.Caption       := 'Disponível ('  + IntToStr(cdsPatroDisp.RecordCount) + ')';
     lblPatroSel.Caption        := 'Selecionado (' + IntToStr(cdsPatroSel.RecordCount) + ')';

     lblProgramaDisp.Caption    := 'Disponível ('  + IntToStr(cdsProgramaDisp.RecordCount) + ')';
     lblProgramaSel.Caption     := 'Selecionado (' + IntToStr(cdsProgramaSel.RecordCount) + ')';

     lblTipoDespesaDisp.Caption := 'Disponível ('  + IntToStr(cdsTipoDespesaDisp.RecordCount) + ')';
     lblTipoDespesaSel.Caption  := 'Selecionado (' + IntToStr(cdsTipoDespesaSel.RecordCount) + ')';

     Application.ProcessMessages;
end;

function TfrmRParamOrcxRealContaMT.VerificaPreenchimento: boolean;
begin
  //Validações
  result := false;

  If ( trim( dblkExercicio.Value ) = '' ) Then
  Begin
      Application.MessageBox('Informe um exercício.','Aviso',64);
      dblkExercicio.SetFocus;
      Exit;
  End;

  if Trim(molPlanoOrcamentario.cboPlanoOrcamen.text) = '' then
  begin
       Application.MessageBox('Informe um Plano Orçamentário.','Aviso',64);
       molPlanoOrcamentario.cboPlanoOrcamen.SetFocus;
       Exit;
  end;

  If ( trim( dblkPeriodoIni.Value ) = '' ) Then
  Begin
      Application.MessageBox('Informe um período inicial.', 'Aviso',64);
      dblkPeriodoIni.SetFocus;
      Exit;
  End;

  If ( trim( dblkPeriodoFim.Value ) = '' ) Then
  Begin
      Application.MessageBox('Informe um período final.', 'Aviso',64);
      dblkPeriodoFim.SetFocus;
      Exit;
  End;

  if dblkPeriodoProjOrcado.Value <> '' then
  begin
     if (dblkPeriodoProjOrcado.LookupValue <= dblkPeriodoFim.LookupValue) then
     begin
          Application.MessageBox('O período final orçado deverá ser maior do que o período final.', 'Aviso',64);
          dblkPeriodoProjOrcado.SetFocus;
          Exit;
     end;
  end;

  if chkExcel.checked then
  begin
       if Trim(edtExcel.Text) = '' then
       begin
          Application.MessageBox('para exportar para o excel deverá informar o caminho do arquivo.', 'Aviso',64);
          btnSelecionaExcel.SetFocus;
          Exit;
       end;
  end;

  //Tudo OK
  result := True;
end;

procedure TfrmRParamOrcxRealContaMT.GridCCustoDispTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  if (Sender as TwwDBGrid).DataSource  <> nil then
     if (Sender as TwwDBGrid).DataSource.DataSet <> nil then
      if (Sender as TwwDBGrid).DataSource.DataSet.Active then
         if (Sender as TwwDBGrid).DataSource.DataSet.ClassType = TCMClientDataSet then
            ((Sender as TwwDBGrid).DataSource.DataSet as TCMClientDataSet).IndexFieldNames := AFieldName;
end;

procedure TfrmRParamOrcxRealContaMT.chkSuplementacaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 32 then
  begin
      if (chkDeducao.Checked) then
         chkDeducao.Checked := False
      else if (chkTodos.Checked) then
          chkTodos.Checked := False;
  end;  
end;

procedure TfrmRParamOrcxRealContaMT.chkSuplementacaoMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if (chkDeducao.Checked) then
     chkDeducao.Checked := False
  else if (chkTodos.Checked) then
      chkTodos.Checked := False;
end;

procedure TfrmRParamOrcxRealContaMT.chkDeducaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 32 then
  begin
      if (chkSuplementacao.Checked) then
         chkSuplementacao.Checked := False
      else if (chkTodos.Checked) then
          chkTodos.Checked := False;
  end;
end;

procedure TfrmRParamOrcxRealContaMT.chkDeducaoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (chkSuplementacao.Checked) then
    chkSuplementacao.Checked := False
  else if (chkTodos.Checked) then
    chkTodos.Checked := False;
end;

procedure TfrmRParamOrcxRealContaMT.chkTodosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 32 then
  begin
      if (chkSuplementacao.Checked) then
         chkSuplementacao.Checked := False
      else if (chkDeducao.Checked) then
          chkDeducao.Checked := False;
  end;
end;

procedure TfrmRParamOrcxRealContaMT.chkTodosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (chkSuplementacao.Checked) then
    chkSuplementacao.Checked := False
  else if (chkDeducao.Checked) then
    chkDeducao.Checked := False;
end;

End.
