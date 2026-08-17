{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Felipe Azevedo dos Santos
// Data..........: 27/05/2013
// Nº SOL........: 190485
// Nº KINTANA....: 1929913
// Rotina........: *.DFM
// Descrição.....: Inserção do filtro imprimir Valores sem
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 08/11/2011
// Nº SOL........: 166068
// Nº KINTANA....: 1448134
// Rotina........: *.DFM
// Descrição.....: Remodelação do layout de impresão para se adequar para o novo layout.
                   Desabilitada a opção de impressão de valores zerados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 08/11/2011
// Nº SOL........: 168226
// Nº KINTANA....: 1480502
// Rotina........: (*.DFM)
// Descrição.....: Alteração do groupbox de considerar valores (*.DFM)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 21/10/2011
// Nº SOL........: 166066
// Nº KINTANA....: 1461858
// Rotina........: dblkExercicioClick
// Descrição.....: Filtrar os grupo orçamentários conforme ano
                   Caso selecionar "Orçado" em Imprimir Valores, deverá desconsiderar a opção
                   considerar valores, para poder sair valores negativos orçados no relatório
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

unit fRParamRelatGrupoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ComCtrls, CMDBLookupCombo, Mask,
  wwdbedit, Wwdbspin, wwdblook, uFuncoesOrcamento, mPlanoOrcamentarioMT,
  MontaSelect, ImgList, CMProcuraMask, Spin, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid;

type
  
  TfrmRParamRelatGrupoMT = class(TfrmParamReports_Padrao)
    cdsCCustoDisp: TCMClientDataSet;
    cdsAtivProjDisp: TCMClientDataSet;
    cdsPlanoDisp: TCMClientDataSet;
    cdsPatroDisp: TCMClientDataSet;
    cdsProgramaDisp: TCMClientDataSet;
    cdsTipoDespesaDisp: TCMClientDataSet;
    cdsTipoDespesaSel: TCMClientDataSet;
    cdsProgramaSel: TCMClientDataSet;
    cdsPatroSel: TCMClientDataSet;
    cdsPlanoSel: TCMClientDataSet;
    cdsAtivProjSel: TCMClientDataSet;
    cdsCCustoSel: TCMClientDataSet;
    dsTipoDespesaSel: TDataSource;
    dsProgramaSel: TDataSource;
    dsPatroSel: TDataSource;
    dsPlanoSel: TDataSource;
    dsAtivProjSel: TDataSource;
    dsCCustoSel: TDataSource;
    dsCCustoDisp: TDataSource;
    dsAtivProjDisp: TDataSource;
    dsPlanoDisp: TDataSource;
    dsPatroDisp: TDataSource;
    dsProgramaDisp: TDataSource;
    dsTipoDespesaDisp: TDataSource;
    SqlAux: TCMSqlParams;
    sqlPeriodoOrcado: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    sqlGrupoFim: TCMSqlParams;
    sqlGrupoIni: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    cdsGrupoIni: TCMClientDataSet;
    cdsGrupoFim: TCMClientDataSet;
    cdsPeriodoFim: TCMClientDataSet;
    cdsPeriodoOrcado: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    imgBotoes: TImageList;
    dlgOpenXls: TOpenDialog;
    Splitter1: TSplitter;
    pgcCompo: TPageControl;
    tbsCentroCusto: TTabSheet;
    lblRotuloCentroCusto: TLabel;
    Panel1: TPanel;
    lblCCustoSel: TLabel;
    GridCCustoSel: TwwDBGrid;
    Panel2: TPanel;
    lblCCustoDisp: TLabel;
    GridCCustoDisp: TwwDBGrid;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    btnCCDisponiveis: TToolButton;
    btnCCSelecionados: TToolButton;
    btnCCDisponiveisTodos: TToolButton;
    btnCCSelecionadosTodos: TToolButton;
    BtnCCRefresh: TToolButton;
    tbsAtividade: TTabSheet;
    Panel4: TPanel;
    lblAtivProjDisp: TLabel;
    GridAtivProjDisp: TwwDBGrid;
    Panel9: TPanel;
    lblAtivProjSel: TLabel;
    GridAtivProjSel: TwwDBGrid;
    Panel14: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    tbsPlanoPrev: TTabSheet;
    Panel5: TPanel;
    lblPlanoDisp: TLabel;
    GridPlanoDisp: TwwDBGrid;
    Panel10: TPanel;
    lblPlanoSel: TLabel;
    GridPlanoSel: TwwDBGrid;
    Panel15: TPanel;
    ToolBar3: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    tbsPatro: TTabSheet;
    Panel6: TPanel;
    lblPatroDisp: TLabel;
    GridPatroDisp: TwwDBGrid;
    Panel11: TPanel;
    lblPatroSel: TLabel;
    GridPatroSel: TwwDBGrid;
    Panel16: TPanel;
    ToolBar4: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    tbsPrograma: TTabSheet;
    Panel7: TPanel;
    lblProgramaDisp: TLabel;
    GridProgramaDisp: TwwDBGrid;
    Panel12: TPanel;
    lblProgramaSel: TLabel;
    GridProgramaSel: TwwDBGrid;
    Panel17: TPanel;
    ToolBar5: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    tbsTipoDespesa: TTabSheet;
    Panel8: TPanel;
    lblTipoDespesaDisp: TLabel;
    GridTipoDespesaDisp: TwwDBGrid;
    Panel13: TPanel;
    lblTipoDespesaSel: TLabel;
    GridTipoDespesaSel: TwwDBGrid;
    Panel18: TPanel;
    ToolBar6: TToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    Panel19: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    rgSinal: TRadioGroup;
    rgUsuXCCCR: TRadioGroup;
    rdgpNegativos: TRadioGroup;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    dblkPeriodoFim: TwwDBLookupCombo;
    dblkPeriodoProjOrcado: TwwDBLookupCombo;
    dblcCenario: TwwDBLookupCombo;
    dblcMoeda: TwwDBLookupCombo;
    spnGrau: TSpinEdit;
    pnlExcel: TPanel;
    lblExcel: TLabel;
    chkExcel: TCheckBox;
    edtExcel: TEdit;
    btnSelecionaExcel: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    tsCentroResponsabilidade: TTabSheet;
    pnl1: TPanel;
    lblCResponsabilidadeDisp: TLabel;
    GridCRespDisp: TwwDBGrid;
    pnl2: TPanel;
    lblCResponsabilidadeSel: TLabel;
    GridCRespSel: TwwDBGrid;
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    cdsCRespDisp: TCMClientDataSet;
    dsCRespDisp: TDataSource;
    cdsCRespSel: TCMClientDataSet;
    dsCRespSel: TDataSource;
    rgImpValores: TRadioGroup;
    cboCODCENTRORESPON: TwwDBLookupCombo;
    cboCODCENTRORESPON1: TwwDBLookupCombo;
    chkValoresZerados: TCheckBox;
    cboGrupoInicial: TCMProcuraMask;
    cboGrupoFinal: TCMProcuraMask;
    MontaSelectGrupoIni: TMontaSelect;
    MontaSelectGrupoFim: TMontaSelect;
    grbVlrSem: TGroupBox;
    chkSuplementacao: TCheckBox;
    chkDeducao: TCheckBox;
    chkTodos: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure chkExcelClick(Sender: TObject);
    procedure btnSelecionaExcelClick(Sender: TObject);
    procedure btnCCDisponiveisClick(Sender: TObject);
    procedure btnCCSelecionadosClick(Sender: TObject);
    procedure btnCCDisponiveisTodosClick(Sender: TObject);
    procedure btnCCSelecionadosTodosClick(Sender: TObject);
    procedure BtnCCRefreshClick(Sender: TObject);
    procedure GridCCustoDispTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormShow(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenClick(Sender: TObject);
    procedure dblkExercicioExit(Sender: TObject);
    procedure rgImpValoresClick(Sender: TObject);
    procedure chkSuplementacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState); // Felipe A. Santos SOL 190485 KTN 1929913
    procedure chkSuplementacaoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer); // Felipe A. Santos
    procedure chkDeducaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);  // Felipe A. Santos SOL 190485 KTN 1929913
    procedure chkDeducaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer); // Felipe A. Santos
    procedure chkTodosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState); // Felipe A. Santos  SOL 190485 KTN 1929913
    procedure chkTodosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);  // Felipe A. Santos SOL 190485 KTN 1929913
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
  frmRParamRelatGrupoMT: TfrmRParamRelatGrupoMT;

implementation

uses UCtrlOrcamento, UModulo, USistema, UMensErro, UData, UFuncaoGeral;

{$R *.DFM}


{ TfrmRParamRelatGrupoMT }

procedure TfrmRParamRelatGrupoMT.PreencheParam;
var
   sSQL:string;
begin
      //Centro de Responsabilidade
      sSQL :=  ' select CODCENTRORESPON, ' +
               ' trim(NOME) || decode(ANALITICOSINTET,''S'','' *'','''') || decode(ATIVO, ''S'', '''', '' (Inativo)'') as NOME '     + #13 +
               ' from CENTRESPON ' +
               ' where IDPLANCRESPON = 3 ' +
               ' order by NOME,CODCENTRORESPON ';

      cdsCRespDisp.DATA := RetornaDatapacket(sSQL);
      cdsCRespSel.Data  := cdsCRespDisp.Data;
      cdsCRespSel.EmptyDataSet;

      //Centro de Custo
      sSQL :=  ' select CODCENTROCUSTO, ' +
               ' trim(NOME) || decode(STATUSGRUPOCDC,''S'','' *'','''') || decode(ATIVO, ''S'', '''', '' (Inativo)'') as NOME '     + #13 +
               ' from CENTCUST ' +
               ' where IDPLANCENTCUST = 3 ' + 
               //' where ATIVO = '  + QuotedStr('S')  +   ' and STATUSGRUPOCDC = ' + QuotedStr('A') +
               ' order by NOME,CODCENTROCUSTO ';

      cdsCCustoDisp.DATA := RetornaDatapacket(sSQL);
      cdsCCustoSel.Data  := cdsCCustoDisp.Data;
      cdsCCustoSel.EmptyDataSet;

      //Atividade / Projeto
      sSQL :=  ' SELECT ' +
               ' trim(NOME) || decode(UNETIPO,' + QuotedStr('S') + ',' +    QuotedStr('*') +   ',' + QuotedStr('') + ') as ATIVIDADEPROJETO' + #13 +
               ', U.UNIDNEGOC ' +
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

procedure TfrmRParamRelatGrupoMT.Totaliza;
begin
     lblCResponsabilidadeDisp.Caption := 'Disponível ('  + IntToStr(cdsCRespDisp.RecordCount) + ')';
     lblCResponsabilidadeSel.Caption  := 'Selecionado (' + IntToStr(cdsCRespSel.RecordCount) + ')';

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

function TfrmRParamRelatGrupoMT.RetornaDatapacket(
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

function TfrmRParamRelatGrupoMT.VerificaPreenchimento: boolean;
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
     if (StrToInt(dblkPeriodoProjOrcado.LookupValue) < StrToInt(dblkPeriodoFim.LookupValue)) then
     begin
          Application.MessageBox('O período final orçado deverá ser maior do que o período final.', 'Aviso',64);
          dblkPeriodoProjOrcado.SetFocus;
          Exit;
     end;
  end;


  //Posição Inicial e Final do código de Grupo
  if (sePosIni1.Value <> 0) and (sePosFim1.Value = 0)  then
  begin
     Application.MessageBox('Foi informado a posição inicial, porém faltou a quantidade de dígitos.', 'Aviso',64);
     sePosFim1.SetFocus;
     Exit;
  end;

  if (sePosFim1.Value <> 0) and (sePosIni1.Value = 0)  then
  begin
     Application.MessageBox('Foi informado a quantidade de dígitos, porém faltou a posição inicial.', 'Aviso',64);
     sePosIni1.SetFocus;
     Exit;
  end;

  {if chkExcel.checked then
  begin
       if Trim(edtExcel.Text) = '' then
       begin
          Application.MessageBox('para exportar para o excel deverá informar o caminho do arquivo.', 'Aviso',64);
          btnSelecionaExcel.SetFocus;
          Exit;
       end;
  end;}

  //Tudo OK
  result := True;
end;

procedure TfrmRParamRelatGrupoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

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
    24 - Tipo de Valores
    25 - Imprimir Valores sem // Felipe A. Santos SOL 190485 KTN 1929913
    26 - Nome do Filtro Valores Sem // Felipe A. Santos SOL 190485 KTN 1929913
    }

    //Preenche Parâmetros do Relatório
    Cmp_Padrao.ParamValues[0].AsString  := molPlanoOrcamentario.cboPlanoOrcamen.LookupValue; //Plano Orçamentário
    Cmp_Padrao.ParamValues[1].AsString  := dblkExercicio.LookupValue; //Exercício

    Cmp_Padrao.ParamValues[2].AsString   := dblkPeriodoIni.LookupValue; //Período Inicial
    Cmp_Padrao.ParamValues[3].AsString   := dblkPeriodoFim.LookupValue; //Período Final

    //Período Orçado
    if trim(dblkPeriodoProjOrcado.Text) <> '' then
       Cmp_Padrao.ParamValues[4].AsString   := dblkPeriodoProjOrcado.LookupValue //Período orçado
    else
       Cmp_Padrao.ParamValues[4].AsString   := '0'; //Período orçado

    //Grupo Inicial
    Cmp_Padrao.ParamValues[5].AsString   := cboGrupoInicial.EditText;

    //Grupo Final
    Cmp_Padrao.ParamValues[6].AsString   := cboGrupoFinal.EditText;

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
    Cmp_Padrao.ParamValues[9].AsString := '';
    if not cdsCRespSel.IsEmpty then
    begin
        cdsCRespSel.first;
        while not cdsCRespSel.eof Do
        begin
             Cmp_Padrao.ParamValues[9].AsString := Cmp_Padrao.ParamValues[9].AsString +
                                                 Quotedstr(cdsCRespSel.fieldbyname('CODCENTRORESPON').AsString) + ',';
             cdsCRespSel.Next;
        end;
    end
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

    //Usuário por centro de Custa\Responsabilidade
    Cmp_Padrao.ParamValues[15].AsString := InttoStr(rgUsuXCCCR.ItemIndex);

    //Imprimir Valores Zeradoss
    if chkValoresZerados.Checked then
       Cmp_Padrao.ParamValues[16].AsString := 'S' //Sim
    else
       Cmp_Padrao.ParamValues[16].AsString := 'N'; //Não

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
             Cmp_Padrao.ParamValues[17].AsString := Cmp_Padrao.ParamValues[17].AsString +
                                                 Quotedstr(cdsCCustoSel.fieldbyname('CODCENTROCUSTO').AsString) + ',';
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
             Cmp_Padrao.ParamValues[18].AsString := Cmp_Padrao.ParamValues[18].AsString +
                                                 Quotedstr(cdsAtivProjSel.fieldbyname('UNIDNEGOC').AsString) + ',';
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
             Cmp_Padrao.ParamValues[19].AsString := Cmp_Padrao.ParamValues[19].AsString +
                                                 Quotedstr(cdsPlanoSel.fieldbyname('IDPLANOPREV').AsString) + ',';
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
             Cmp_Padrao.ParamValues[20].AsString := Cmp_Padrao.ParamValues[20].AsString +
                                                 Quotedstr(cdsPatroSel.fieldbyname('IDPESSOA').AsString) + ',';
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
             Cmp_Padrao.ParamValues[21].AsString := Cmp_Padrao.ParamValues[21].AsString +
                                                 Quotedstr(cdsProgramaSel.fieldbyname('IDPROGRAMAORCAMEN').AsString) + ',';
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
             Cmp_Padrao.ParamValues[22].AsString := Cmp_Padrao.ParamValues[22].AsString +
                                                 Quotedstr(cdsTipoDespesaSel.fieldbyname('IDTIPO_DEPESAORCAMEN').AsString) + ',';
             cdsTipoDespesaSel.Next;
        end;
    end
    else
        Cmp_Padrao.ParamValues[22].AsString := '';

    //Retira vírgula final
    if Cmp_Padrao.ParamValues[9].AsString <> '' then
       Cmp_Padrao.ParamValues[9].AsString := Copy(Trim(Cmp_Padrao.ParamValues[9].AsString),1,Length(Trim(Cmp_Padrao.ParamValues[9].AsString)) - 1);

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
    if (chkExcel.Checked) {and (Trim(edtExcel.Text) <> '')} then
       Cmp_Padrao.ParamValues[23].AsString := 'S' //Trim(edtExcel.Text)
    else
       Cmp_Padrao.ParamValues[23].AsString := '';
    //Ricardo SOL 160740 KTN 1358934 - fim


    if rgImpValores.Visible then
       Cmp_Padrao.ParamValues[24].AsInteger := rgImpValores.ItemIndex;


    //Ricardo SOL: 166066 Nº KINTANA: 1461858
    //Caso selecionar "Orçado" em Imprimir Valores, deverá desconsiderar a opção
    //considerar valores, para poder sair valores negativos orçados no relatório
    if rgImpValores.Visible then
    begin
      if rgImpValores.ItemIndex = 0 then
      begin
           Cmp_Padrao.ParamValues[13].AsString := '2';
      end;
    end;

    // Felipe A. Santos SOL 190485 KTN 1929913

    // parametros para filtrar o valor orcado do relatório
    if chkSuplementacao.Checked then
       Cmp_Padrao.ParamValues[25].AsString := 'S'
    else if chkDeducao.Checked then
       Cmp_Padrao.ParamValues[25].AsString := 'R'
    else if chkTodos.Checked then
       Cmp_Padrao.ParamValues[25].AsString := 'T'
    else
       Cmp_Padrao.ParamValues[25].AsString := '';
         
    // Nome do Filtro Valores Sem
    if chkSuplementacao.Checked then
       Cmp_Padrao.ParamValues[26].AsString := 'Suplementações'
    else if chkDeducao.Checked then
       Cmp_Padrao.ParamValues[26].AsString := 'Deduções'
    else if chkTodos.Checked then
       Cmp_Padrao.ParamValues[26].AsString := 'Todos'
    else
       Cmp_Padrao.ParamValues[26].AsString := '';


    // Felipe A. Santos SOL 190485 KTN 1929913 - Fim


    ModalResult := mrOK;
end;

procedure TfrmRParamRelatGrupoMT.dblkExercicioClick(Sender: TObject);
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

    //Ricardo SOL: 166066 Nº KINTANA: 1461858
    if MontaSelectGrupoIni.Filtro.Count > 1 then
       MontaSelectGrupoIni.Filtro[1] := 'PLANOORCAMENTARIO.ANO = ' +  Trim(dblkExercicio.text)
    else
        MontaSelectGrupoIni.Filtro.Add('PLANOORCAMENTARIO.ANO = ' +  Trim(dblkExercicio.text));

    if MontaSelectGrupoFim.Filtro.Count > 1 then
       MontaSelectGrupoFim.Filtro[1] := 'PLANOORCAMENTARIO.ANO = ' +  Trim(dblkExercicio.text)
    else
        MontaSelectGrupoFim.Filtro.Add('PLANOORCAMENTARIO.ANO = ' +  Trim(dblkExercicio.text));
    //Ricardo SOL: 166066 Nº KINTANA: 1461858 - fim

  end
  else
  begin
    dblkPeriodoIni.Enabled        := false;
    dblkPeriodoFim.Enabled        := false;
    dblkPeriodoProjOrcado.Enabled := false;
  end;

  Application.ProcessMessages;

end;

procedure TfrmRParamRelatGrupoMT.chkExcelClick(Sender: TObject);
begin
  inherited;
  {lblExcel.Visible          :=  chkExcel.Checked;
  edtExcel.Visible          :=  chkExcel.Checked;
  btnSelecionaExcel.Visible :=  chkExcel.Checked;}
  Application.ProcessMessages;

end;

procedure TfrmRParamRelatGrupoMT.btnSelecionaExcelClick(Sender: TObject);
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

procedure TfrmRParamRelatGrupoMT.btnCCDisponiveisClick(Sender: TObject);
var
   strcampo1,strcampo2:string;
   cdsDisp,cdsSel:TClientDataSet;
begin
  inherited;

  case pgcCompo.ActivePageIndex of

    //Responsabilidade
    0:Begin
       strcampo1 := 'CODCENTRORESPON';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCRespDisp;
       cdsSel    := cdsCRespSel;
    end;

    //Custo
    1:Begin
       strcampo1 := 'CODCENTROCUSTO';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCCustoDisp;
       cdsSel    := cdsCCustoSel;
    end;

    //Atividade
    2:Begin
       strcampo1 := 'UNIDNEGOC';
       strcampo2 := 'ATIVIDADEPROJETO';
       cdsDisp   := cdsAtivProjDisp;
       cdsSel    := cdsAtivProjSel;
    end;

    //Plano
    3:Begin
       strcampo1 := 'IDPLANOPREV';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPlanoDisp;
       cdsSel    := cdsPlanoSel;
    end;

    //Patrocinador
    4:Begin
       strcampo1 := 'IDPESSOA';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPatroDisp;
       cdsSel    := cdsPatroSel;

    end;

    //Programa
    5:Begin
       strcampo1 := 'IDPROGRAMAORCAMEN';
       strcampo2 := 'PROGRAMA';
       cdsDisp   := cdsProgramaDisp;
       cdsSel    := cdsProgramaSel;

    end;

    //Tipo de Despesa
    6:Begin
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

procedure TfrmRParamRelatGrupoMT.btnCCSelecionadosClick(Sender: TObject);
var
   strcampo1,strcampo2:string;
   cdsDisp,cdsSel:TClientDataSet;
begin
  inherited;

  case pgcCompo.ActivePageIndex of

    //Responsabilidade
    0:Begin
       strcampo1 := 'CODCENTRORESPON';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCRespDisp;
       cdsSel    := cdsCRespSel;
    end;
    
    //Custo
    1:Begin
       strcampo1 := 'CODCENTROCUSTO';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCCustoDisp;
       cdsSel    := cdsCCustoSel;
    end;

    //Atividade
    2:Begin
       strcampo1 := 'UNIDNEGOC';
       strcampo2 := 'ATIVIDADEPROJETO';
       cdsDisp   := cdsAtivProjDisp;
       cdsSel    := cdsAtivProjSel;
    end;

    //Plano
    3:Begin
       strcampo1 := 'IDPLANOPREV';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPlanoDisp;
       cdsSel    := cdsPlanoSel;
    end;

    //Patrocinador
    4:Begin
       strcampo1 := 'IDPESSOA';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPatroDisp;
       cdsSel    := cdsPatroSel;

    end;

    //Programa
    5:Begin
       strcampo1 := 'IDPROGRAMAORCAMEN';
       strcampo2 := 'PROGRAMA';
       cdsDisp   := cdsProgramaDisp;
       cdsSel    := cdsProgramaSel;

    end;

    //Tipo de Despesa
    6:Begin
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

procedure TfrmRParamRelatGrupoMT.btnCCDisponiveisTodosClick(
  Sender: TObject);
var
   strcampo1,strcampo2:string;
   cdsDisp,cdsSel:TClientDataSet;
begin
  inherited;

  case pgcCompo.ActivePageIndex of

    //Responsabilidade
    0:Begin
       strcampo1 := 'CODCENTRORESPON';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCRespDisp;
       cdsSel    := cdsCRespSel;
    end;

    //Custo
    1:Begin
       strcampo1 := 'CODCENTROCUSTO';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCCustoDisp;
       cdsSel    := cdsCCustoSel;
    end;

    //Atividade
    2:Begin
       strcampo1 := 'UNIDNEGOC';
       strcampo2 := 'ATIVIDADEPROJETO';
       cdsDisp   := cdsAtivProjDisp;
       cdsSel    := cdsAtivProjSel;
    end;

    //Plano
    3:Begin
       strcampo1 := 'IDPLANOPREV';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPlanoDisp;
       cdsSel    := cdsPlanoSel;
    end;

    //Patrocinador
    4:Begin
       strcampo1 := 'IDPESSOA';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPatroDisp;
       cdsSel    := cdsPatroSel;

    end;

    //Programa
    5:Begin
       strcampo1 := 'IDPROGRAMAORCAMEN';
       strcampo2 := 'PROGRAMA';
       cdsDisp   := cdsProgramaDisp;
       cdsSel    := cdsProgramaSel;

    end;

    //Tipo de Despesa
    6:Begin
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

procedure TfrmRParamRelatGrupoMT.btnCCSelecionadosTodosClick(
  Sender: TObject);
var
   strcampo1,strcampo2:string;
   cdsDisp,cdsSel:TClientDataSet;
begin
  inherited;

  case pgcCompo.ActivePageIndex of

    //Responsabilidade
    0:Begin
       strcampo1 := 'CODCENTRORESPON';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCRespDisp;
       cdsSel    := cdsCRespSel;
    end;

    //Custo
    1:Begin
       strcampo1 := 'CODCENTROCUSTO';
       strcampo2 := 'NOME';
       cdsDisp   := cdsCCustoDisp;
       cdsSel    := cdsCCustoSel;
    end;

    //Atividade
    2:Begin
       strcampo1 := 'UNIDNEGOC';
       strcampo2 := 'ATIVIDADEPROJETO';
       cdsDisp   := cdsAtivProjDisp;
       cdsSel    := cdsAtivProjSel;
    end;

    //Plano
    3:Begin
       strcampo1 := 'IDPLANOPREV';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPlanoDisp;
       cdsSel    := cdsPlanoSel;
    end;

    //Patrocinador
    4:Begin
       strcampo1 := 'IDPESSOA';
       strcampo2 := 'NOME';
       cdsDisp   := cdsPatroDisp;
       cdsSel    := cdsPatroSel;

    end;

    //Programa
    5:Begin
       strcampo1 := 'IDPROGRAMAORCAMEN';
       strcampo2 := 'PROGRAMA';
       cdsDisp   := cdsProgramaDisp;
       cdsSel    := cdsProgramaSel;

    end;

    //Tipo de Despesa
    6:Begin
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

procedure TfrmRParamRelatGrupoMT.BtnCCRefreshClick(Sender: TObject);
begin
  inherited;
  PreencheParam();
end;

procedure TfrmRParamRelatGrupoMT.GridCCustoDispTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  if (Sender as TwwDBGrid).DataSource  <> nil then
     if (Sender as TwwDBGrid).DataSource.DataSet <> nil then
      if (Sender as TwwDBGrid).DataSource.DataSet.Active then
         if (Sender as TwwDBGrid).DataSource.DataSet.ClassType = TCMClientDataSet then
            ((Sender as TwwDBGrid).DataSource.DataSet as TCMClientDataSet).IndexFieldNames := AFieldName;
end;

procedure TfrmRParamRelatGrupoMT.FormShow(Sender: TObject);
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
    cdsGrupoIni.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;

  //Grupo Final
  with sqlGrupoFim do begin
    cdsGrupoFim.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;

  PreencheParam();
  //Ricardo SOL: 166066 Nº KINTANA: 1461858
  rgImpValoresClick(rgImpValores);


  Application.ProcessMessages;

end;


procedure TfrmRParamRelatGrupoMT.molPlanoOrcamentariocboPlanoOrcamenClick(
  Sender: TObject);
begin
  inherited;
  //Filtras os Grupos

  TRY
    Screen.Cursor := crHourGlass;

    //Grupo Inicial
    with sqlGrupoIni do begin
      cdsGrupoIni.Close;
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
      Open;
    end;

    //Grupo Final
    with sqlGrupoFim do begin
      cdsGrupoFim.Close;
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
      Open;
    end;
    
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmRParamRelatGrupoMT.dblkExercicioExit(Sender: TObject);
begin
  inherited;
  //Ricardo SOL: 166066 Nº KINTANA: 1461858
  if (dblkExercicio.text) = '' then
  begin
    Application.MessageBox('Favor informar o ano','Aviso',64);

    if dblkExercicio.CanFocus then
       dblkExercicio.SetFocus;
  end;
  //Ricardo SOL: 166066 Nº KINTANA: 1461858 - fim
end;

procedure TfrmRParamRelatGrupoMT.rgImpValoresClick(Sender: TObject);
begin
  inherited;
  //Ricardo SOL: 166066 Nº KINTANA: 1461858
  rgSinal.Visible :=  (rgImpValores.ItemIndex <> 0);
  //Ricardo SOL: 166066 Nº KINTANA: 1461858 - fim

  // Felipe A. Santos
  if (rgImpValores.ItemIndex = 1) then
  begin
       grbVlrSem.Enabled := False;
       chkSuplementacao.Checked := False;
       chkDeducao.Checked := False;
       chkTodos.Checked := False;
  end
  else
  begin
      grbVlrSem.Enabled := True
  end;
  // Felipe A. Santos - Fim
end;

// Felipe A. Santos SOL 190485 KTN 1929913
procedure TfrmRParamRelatGrupoMT.chkSuplementacaoKeyUp(Sender: TObject;
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

procedure TfrmRParamRelatGrupoMT.chkSuplementacaoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    if (chkDeducao.Checked) then
     chkDeducao.Checked := False
  else if (chkTodos.Checked) then
      chkTodos.Checked := False;
end;

procedure TfrmRParamRelatGrupoMT.chkDeducaoKeyUp(Sender: TObject;
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

procedure TfrmRParamRelatGrupoMT.chkDeducaoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   if (chkSuplementacao.Checked) then
     chkSuplementacao.Checked := False
  else if (chkTodos.Checked) then
      chkTodos.Checked := False;
end;

procedure TfrmRParamRelatGrupoMT.chkTodosKeyUp(Sender: TObject;
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

procedure TfrmRParamRelatGrupoMT.chkTodosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (chkSuplementacao.Checked) then
     chkSuplementacao.Checked := False
  else if (chkDeducao.Checked) then
      chkDeducao.Checked := False;
end;
// Felipe A. Santos SOL 190485 KTN 1929913 - FIM
end.
