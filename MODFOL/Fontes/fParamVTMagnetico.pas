// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fParamVTMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Spin,
  ExtCtrls, checklst, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, fSairAjuda,
  CMDateTimePicker;

type
  TfrmParamVTMagnetico = class(TfrmSairAjuda)
    qryVTMagnetico: TwwQuery;
    svdlgDialogo: TOpenDialog;
    qryEstab: TwwQuery;
    qryParamRH: TwwQuery;
    ToolbarSep972: TToolbarSep97;
    rbtnGerar: TBitBtn;
    gbxEstab: TGroupBox;
    chklstEstab: TCheckListBox;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    gbxIndentFunc: TGroupBox;
    cmbIdentFunc: TComboBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxDiasMin: TGroupBox;
    speDias: TSpinEdit;
    gbxDesconta: TGroupBox;
    chkbFerias: TCheckBox;
    chkbFaltas: TCheckBox;
    chkbFeriados: TCheckBox;
    gbxQuantDias: TGroupBox;
    spedQuantDias: TSpinEdit;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    pnlHorario: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryVTMagneticoAfterOpen(DataSet: TDataSet);
    procedure qryVTMagneticoAfterScroll(DataSet: TDataSet);
    procedure qryVTMagneticoBeforeOpen(DataSet: TDataSet);
    procedure rbtnGerarClick(Sender: TObject);
    procedure chklstEstabDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure dtedInicioChange(Sender: TObject);
  private
    iInicio, iFim: integer;  
    wMes, wAno, wHora, wMin, wSeg, wMSeg: word;
    ListaEstab, ListaRubricas: TStringList;

    procedure HabilitaBtOk;    
    function  VerificaOpcoesOk: boolean;
    function  fValidaDadosVTMag(cTipo:char; sDado:string; wTamanho:word): string;
  end;

var
  frmParamVTMagnetico: TfrmParamVTMagnetico;

implementation

uses uSistema, uMensErro, uFuncoesUteis, uDiasUteis, fAguarde, UsoGeralRH, FPrincipal;

{$R *.DFM}

procedure TfrmParamVTMagnetico.FormCreate(Sender: TObject);
begin
  inherited;
  ListaEstab := TStringList.Create;
  ListaRubricas := TStringList.Create;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    if (Pos(',',sUsuXfilial) > 0) then
      qryEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND'
    else
      qryEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
  end;

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;
  qryParamRH.Open;

  // Monta ChekListBox dos Estabelecimentos
  chklstEstab.Items.Clear;
  while not(qryEstab.EOF) do
  begin
    ListaEstab.Add(qryEstab.FieldByName('CODIGO').asString);
    chklstEstab.Items.Add(qryEstab.FieldByName('NOME').asString);
    qryEstab.Next;
  end;

  // Pego a data default da tabela de parâmetros
  dtedInicio.Date := ProxMes(qryParamRH.FieldByName('NORMALINI').asDateTime);
  dtedFim.Date := ProxMes(qryParamRH.FieldByName('NORMALFIM').asDateTime);
  pnlHorario.Caption := '';
  cmbIdentFunc.ItemIndex := 0;
  cmbOrderBy.ItemIndex := 2;
end;

procedure TfrmParamVTMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaEstab.Free;
  ListaRubricas.Free;

  qryParamRH.Close;
  qryEstab.Close;
  inherited;
end;

procedure TfrmParamVTMagnetico.chklstEstabDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamVTMagnetico.qryVTMagneticoBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra('Processando Dados ...');
  frmAguarde.Pos := 0;
end;

procedure TfrmParamVTMagnetico.qryVTMagneticoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := qryVTMagnetico.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TfrmParamVTMagnetico.qryVTMagneticoAfterScroll(DataSet: TDataSet);
begin
  if (frmAguarde.Pos >= qryVTMagnetico.RecordCount) then
    frmAguarde.Pos := 0
  else
    frmAguarde.Pos := frmAguarde.Pos+1;
  frmAguarde.Update;
end;

procedure TfrmParamVTMagnetico.dtedInicioChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamVTMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamVTMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;

  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamVTMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);

  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamVTMagnetico.rbtnGerarClick(Sender: TObject);
label
  Inicio;
var
  rRestoDivisao, rRazao, rTotHoras, rHora1, rHora2, rResto: real;
  iPrimeiraDif, iSegundaDif, iDiaTrabalhado, iTipoFerias,
  iDiaSemanaInicio, iDiaMes, iTipoHorario, iDiasFerias,
  iFlgReg, iTotDiasDesc,
  iIdRubricaIndiv: LongInt;
  sCodRubClt: string;
  dInicioFerias, dFimFerias, dInicial, dFinal, dDataInicio: TDateTime;

  dInicio, dFim: TDateTime;
  iPosicao,
  iADom, iASeg, iATer, iAQua, iAQui, iASex, iASab,
  iDom,  iSeg,  iTer,  iQua,  iQui,  iSex,  iSab,
  iTotDiasMes, iIDCidades: integer;

  bCtrlLoop, bArqAberto: boolean;
  sMatricula,
  sNumLinha,
  sModulo,
  sMatr_Func,
  sQuery,
  sInscr_Estab, sInscr_Estab2,
  sAnoMes: string;
  rQtdeTotVales,       // Quantidade de vales transporte total de um estabelecimento
  rQtdeVales,
  rValTotCompra: real; // Valor total da compra de vales transportes de um estabelecimento
  wNumSequencia,       // Nº de sequência do registro no meio magnético (arquivo texto)
  wQtdeRegTip2,        // Quantidade de registros tipo 2 de um estabelecimento
  wQtdeFunc   : word;  // Quantidade de funcionários de um estabelecimento
  iIDEmpresa  : integer; // Guarda o estabelecimento a ser pesquisado
  byNumSubArquivos, // Guarda o número do estabelecimento atualmente posicionado
  c,k         : byte; // contadores
  bmRegistro  : TBookMark;
  fValesTransp: TextFile;

{->}function Val_UsoDoEmpregador07: str25;
    begin
      case (cmbIdentFunc.ItemIndex) of
        0 : Val_UsoDoEmpregador07 := fValidaDadosVTMag('A', AbreviaNome (25, qryVTMagnetico.FieldByName('FUNC_NOME').asString), 25);
        1 : Val_UsoDoEmpregador07 := fValidaDadosVTMag('A', AbreviaNome (25, qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString), 25);
       else Val_UsoDoEmpregador07 := Replicate (' ', 25);
      end;
{->}end;

{->}procedure GravaRegistroTrailer;
    begin
      Write(fValesTransp,
        // 01-Nº de sequência do registro no meio
        fValidaDadosVTMag('N', IntToStr(wNumSequencia), 5)+
        // 02-Inscrição do responsável (CGC/CEI; CPF)
        fValidaDadosVTMag('N',qryVTMagnetico.FieldByName('INSCR_ESTAB').asString, 14)+
        // 03-Tipo Fixo 1
        '3'+
        // 04-Quantidade de registros tipo 2
        fValidaDadosVTMag('N', IntToStr(wQtdeRegTip2), 5)+
        // 05-Quantidade de vales
        fValidaDadosVTMag('N', IntToStr(Round(rQtdeTotVales)), 9)+
        // 06-Valor da compra
        fValidaDadosVTMag('V', Float2String(rValTotCompra), 15)+
        // Brancos
        Replicate (' ',133)+
        // 07-Para uso do empregador
        Replicate (' ', 25)+CR_LF);
{->}end;

{->}function LimitaEspacoEmDisco (sMsg: string): boolean;
    begin
      Result := false;

      // Gravo o registro 3, o trailer e fecho o arquivo para que seja escolhido outro
      GravaRegistroTrailer;
      Write(fValesTransp, Replicate('9', 207));
      CloseFile (fValesTransp);
      frmAguarde.Apaga;

      if (MsgDlg (sMsg, 'Aviso...', mtInformation,[mbOK,mbCancel],0) = mrCancel) then
        exit;

      if not(svdlgDialogo.Execute) then
        exit;

      // Verifica se o arquivo existe na pasta escolhida
      if (FileExists(svdlgDialogo.FileName)) then
        if (MsgDlg ('O arquivo já existe na pasta especificada. Você deseja SOBRESCREVÊ-LO ?','Aviso',mtConfirmation,[mbOK,mbCancel],0) = mrCancel) then
          exit;

      frmAguarde.Show;

      Result := true;
{->}end;

{->}procedure ProcessaDadosFunc;
    var
      cont: word;
    begin
      // Inicio variáveis....
      // Inteiras
      iPrimeiraDif     := 0; iSegundaDif     := 0;
      iFlgReg          := 0;
      iDiaSemanaInicio := 0; iDiaTrabalhado  := 0;
      iDiaMes          := 0; iTipoHorario    := 0;
      iTipoFerias      := 0; iDiasFerias     := 0;
      iTotDiasDesc     := 0; iIdRubricaIndiv := 0;
      iADom:=0; iASeg:=0; iATer:=0; iAQua:=0; iAQui:=0; iASex:=0; iASab:=0;
      // Reais
      rRazao    := 0; rRestoDivisao := 0; rHora1 := 0; rHora2 := 0;
      rTotHoras := 0; rResto        := 0;
      // String
      sMatricula := ''; sNumLinha  := ''; sModulo := ''; sCodRubClt := '';
      // Datas
      dInicioFerias := 0; dFimFerias := 0;
      // Booleanas
      bCtrlLoop := true;

      // Lê valores iniciais para a seleção dos registros corretos
      sMatricula    := qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString;
      dInicioFerias := qryVTMagnetico.FieldByName('FUNC_INICIOFERIAS').asDateTime;
      dFimFerias    := qryVTMagnetico.FieldByName('FUNC_FIMFERIAS').asDateTime;
      bmRegistro    := qryVTMagnetico.GetBookMark;
      dInicial      := dInicio;
      dFinal        := dFim;

      // *********** NOVA PARTE (INICIO)
      iDom:=0; iSeg:=0; iTer:=0; iQua:=0; iQui:=0; iSex:=0; iSab:=0;

      iTotDiasMes := Round(dFim - dInicio);
      dDataInicio := dInicio;
      iIDCidades  := qryVTMagnetico.FieldByName('IDCIDADES').asInteger;

      // Verifica o total de dias da semana
      if (chkbFeriados.Checked) then
      begin
        if (spedQuantDias.Value > 0) then
          iSeg := spedQuantDias.Value
        else
        begin
          for cont:=0 to iTotDiasMes do
          begin
            if not(DiasUteis.Feriado(dDataInicio+cont, iIDCidades, qryVTMagnetico.FieldByName('IDPAIS').asInteger,
                           qryVTMagnetico.FieldByName('UF_ESTAB').asString, false,true)) or
                 (((dDataInicio+cont) >= qryVTMagnetico.FieldByName('FUNC_INICIOFERIAS').asDateTime) and
                  ((dDataInicio+cont) <= qryVTMagnetico.FieldByName('FUNC_FIMFERIAS').asDateTime)) then
            begin
              case DayOfWeek(dDataInicio+cont) of
                1 : Inc(iDom);
                2 : Inc(iSeg);
                3 : Inc(iTer);
                4 : Inc(iQua);
                5 : Inc(iQui);
                6 : Inc(iSex);
                7 : Inc(iSab);
              end;
            end;
          end;
        end;
      end
      else
      begin
        if (spedQuantDias.Value > 0) then
           iSeg := spedQuantDias.Value
        else
          for Cont:=0 to iTotDiasMes do
          begin
            case DayOfWeek(dDataInicio + Cont) of
              1 : Inc(iDom);
              2 : Inc(iSeg);
              3 : Inc(iTer);
              4 : Inc(iQua);
              5 : Inc(iQui);
              6 : Inc(iSex);
              7 : Inc(iSab);
            end;
          end;
      end;

      // ***********************************************************************
      // Verifica se o funcionário está em período de férias nas datas indicadas
      // ***********************************************************************
      // Se estiver NÃO em período de férias
      if (dInicioFerias = 0)                           or (dFimFerias = 0) or
         (dInicioFerias = StrToDateTime('31/12/1899')) or (dFimFerias = StrToDateTime('31/12/1899')) or
         (dFimFerias    < dInicial) then
      begin
        // Calcula Diferenças
        iPrimeiraDif := Round((dInicial - qryVTMagnetico.FieldByName('FUNC_DATAREF').asDateTime)+1);
        iSegundaDif  := Round((dFinal   - qryVTMagnetico.FieldByName('FUNC_DATAREF').asDateTime)+1);
        iDiaMes      := Round((dFinal   - dInicial));
        // Pega dia da semana da data de contratação do funcionário
        iDiaSemanaInicio := DayOfWeek(qryVTMagnetico.FieldByName('FUNC_DATAREF').asDateTime);
        iTipoHorario     := qryVTMagnetico.FieldByName('FUNC_TIPOHORARIO').asInteger;
      end
      else
      if (chkbFerias.Checked) then
      begin
        // **********
        // Caso 1 e 4
        // Guarda este tipo e calcula o número de dias de férias, se FOR ESCALA.
        if (dInicioFerias >= dInicial) and (dFimFerias <= dFinal) then
        begin
          iTipoFerias := 1;
          // Quantidade de Dias da Semana em que o indivíduo ficou de Férias
          if (qryVTMagnetico.FieldByName('FUNC_ESCALA').asFloat > 0) then // Se for ESCALA
          else // Se NÃO for escala
          begin
            while (dInicioFerias <= dFimFerias) do
            begin
              case DayOfWeek(dInicioFerias) of
                1 : Inc(iADom);
                2 : Inc(iASeg);
                3 : Inc(iATer);
                4 : Inc(iAQua);
                5 : Inc(iAQui);
                6 : Inc(iASex);
                7 : Inc(iASab);
              end;
              dInicioFerias := dInicioFerias+1;
            end;
          end;
          dInicioFerias := qryVTMagnetico.FieldByName('FUNC_INICIOFERIAS').asDateTime;
        end
        else
        // ******
        // Caso 2
        // Se as férias TERMINAREM antes do último dia do mês, guarda este tipo e calcula
        // o nº de dias de férias
        if (dInicioFerias < dInicial) and (dFimFerias <= dFinal) then
        begin
          iTipoFerias := 2;
          iDiasFerias := Round(dFimFerias - dInicial) + 1;
          dInicial    := dFimFerias + 1;
        end
        else
        // ******
        // Caso 3
        // Se as férias COMEÇAREM antes do último dia do mês, guarda este tipo e calcula
        // o nº de dias de férias
        if (dInicioFerias >= dInicial) and (dFimFerias > dFinal) then
        begin
          iTipoFerias := 3;
          iDiasFerias := Round(dInicioFerias - dInicial) + 1;
          dFinal      := dInicioFerias - 1;
        end;
        // Calcula Diferenças
        iPrimeiraDif := Round((dInicial - qryVTMagnetico.FieldByName('FUNC_DATAREF').asDateTime)+1);
        iSegundaDif  := Round((dFinal   - qryVTMagnetico.FieldByName('FUNC_DATAREF').asDateTime)+1);
        iDiaMes      := Round((dFinal   - dInicial));
        // Pega dia da semana da data de contratação do funcionário
        iDiaSemanaInicio := DayOfWeek(qryVTMagnetico.FieldByName('FUNC_DATAREF').asDateTime);
        iTipoHorario     := qryVTMagnetico.FieldByName('FUNC_TIPOHORARIO').asInteger;
      end;

      // **********************
      // Testa tipos de horário
      // **********************

      // Se for por Escala
      if (qryVTMagnetico.FieldByName('FUNC_ESCALA').asInteger > 1) then
      begin
        if (iTipoHorario = 1) then // ESCALA VARIÁVEL
        begin
          if (frmPrincipal.iIDContraCheque = 2) then   // Só para a REFER
            iDiaTrabalhado := iDiaMes + 1 // Só para a REFER
          else
          begin
            for cont:=0 to iDiaMes do // FOR para todos os dias do mês
            begin
              // Por que ?!?!?!? Pergunte ao Eugênio : FrmRegHoras
              if (cont = 0) then // Para o primeiro elemento faça...
              begin
                rTotHoras := qryVTMagnetico.FieldByName('FUNC_ESCALA').Value;
                rHora1    := ((dInicial -
                               qryVTMagnetico.FieldByName('FUNC_DATAREF').Value)*24 mod rTotHoras)+
                               qryVTMagnetico.FieldByName('FUNC_HORASFOLGA1').Value;

                if (rHora1 >= 24) and (rTotHoras - rHora1 < qryVTMagnetico.FieldByName('FUNC_HORASSERVICO').Value) then
                  rResto := qryVTMagnetico.FieldByName('FUNC_HORASSERVICO').Value + rHora1 - rTotHoras;
              end;

              if (rResto > 0) then
              begin
                rHora2 := rResto;
                rHora1 := 0;
              end
              else
              if (rResto = 0) then
              begin
                rHora1 := rHora2 + qryVTMagnetico.FieldByName('FUNC_HORASFOLGA').Value;
                if (rHora1 > 24) then
                  rHora1 := rHora1 - 24;
              end;

              if (rHora1 < 24) then
              begin
                if (rResto <= 0) then
                begin
                  rHora2         := rHora1 + qryVTMagnetico.FieldByName('FUNC_HORASSERVICO').Value;
                  Inc(iDiaTrabalhado);
                end;

                if (rHora2 > 24) then
                begin
                  rResto := rHora2 - 24;
                  rHora2 := 24;
                end
                else
                  rResto := 0;

                rHora1 := 0;
              end
              else
              begin
                rHora1 := rHora1 - 24;
                rResto := -1;
              end;
            end; // FOR para todos os dias do mês
          end;
          // Testa se está em período de férias
          if (iTipoFerias = 1) then
            iDiaTrabalhado := Round(((((iDiaMes+1)-((dFimFerias-dInicioFerias)+1))*iDiaTrabalhado)/(iDiaMes+1)));
        end
        else // ESCALA FIXA
        begin
          // Calcula a RAZÃO
          rRazao := qryVTMagnetico.FieldByName('FUNC_HORASFOLGA').asInteger / 24;
          if (rRazao < Round(rRazao)) then
            rRazao := Round(rRazao) - 1;
          rRazao := rRazao + 1;

          // Faz variação para contagem de dias trabalhados
          for cont:=iPrimeiraDif to iSegundaDif do
          begin
            // Pega o Resto da Divisão
            rRestoDivisao := (Round((qryVTMagnetico.FieldByName('FUNC_DATAREF').asDateTime+cont)-(dInicial)) mod Round(rRazao));
            // Testa se o dia SERÁ ou NÃO trabalhado
            if (rRestoDivisao = 0) then
              Inc(iDiaTrabalhado);
          end;
        end;
      end
      else // Se NÃO for por escala
      begin
        // Marca o Registro da Query para posterior Retorno
        iDiaTrabalhado := 0;
        sNumLinha      := qryVTMagnetico.FieldByName('NUMLINHA').asString;

        if (iTipoFerias = 0) then // Se NÃO ESTIVER em férias
        begin
          // Totaliza os dias trabalhados do funcionário atual
          while (sMatricula = qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString) and
                (sNumLinha  = qryVTMagnetico.FieldByName('NUMLINHA').asString)  and
                (not qryVTMagnetico.EOF) do
          begin
            // Contabiliza os Dias Trabalhados
            case (qryVTMagnetico.FieldByName('DIASEMANA').asInteger) of
              1 : Inc (iDiaTrabalhado, iDom);
              2 : Inc (iDiaTrabalhado, iSeg);
              3 : Inc (iDiaTrabalhado, iTer);
              4 : Inc (iDiaTrabalhado, iQua);
              5 : Inc (iDiaTrabalhado, iQui);
              6 : Inc (iDiaTrabalhado, iSex);
              7 : Inc (iDiaTrabalhado, iSab);
            end;
            qryVTMagnetico.Next;
          end;
          if (iDiaTrabalhado <= 0) then
            iDiaTrabalhado := 0;
        end
        else // Se ESTIVER em período de férias
        begin
          // Marca o Registro da Query para posterior Retorno
          iDiaTrabalhado := 0;
          sNumLinha      := qryVTMagnetico.FieldByName('NUMLINHA').asString;

          // Loop para Calcular um Período Quebrado do Mês ( não inteiro ) Ex.: 18/03/99 a 31/03/99
          while (sMatricula = qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString) and
                (sNumLinha  = qryVTMagnetico.FieldByName('NUMLINHA').asString)  and
                (not qryVTMagnetico.EOF) do
          begin
            // Contabiliza os Dias Trabalhados - Dias de Férias
            case (qryVTMagnetico.FieldByName('DIASEMANA').asInteger) of
              1 : iDiaTrabalhado := (iDiaTrabalhado + iDom) - iADom;
              2 : iDiaTrabalhado := (iDiaTrabalhado + iSeg) - iASeg;
              3 : iDiaTrabalhado := (iDiaTrabalhado + iTer) - iATer;
              4 : iDiaTrabalhado := (iDiaTrabalhado + iQua) - iAQua;
              5 : iDiaTrabalhado := (iDiaTrabalhado + iQui) - iAQui;
              6 : iDiaTrabalhado := (iDiaTrabalhado + iSex) - iASex;
              7 : iDiaTrabalhado := (iDiaTrabalhado + iSab) - iASab;
            end;
            qryVTMagnetico.Next;
          end;
          if (iDiaTrabalhado <= 0) then
            iDiaTrabalhado := 0;
        end;
      end; // Se NÃO for por escala

      // Faz os descontos dos dias de faltas e/ou afastamentos
      qryVTMagnetico.GoToBookMark (bmRegistro);
      ListaRubricas.Clear;
      sCodRubClt := qryVTMagnetico.FieldByName('CODRUBCLT').AsString;
      while (sMatricula = qryVTMagnetico.FieldByName('FUNC_MATRICULA').AsString) and
            (not qryVTMagnetico.EOF) and
            (chkbFaltas.Checked) do
      begin
        if (sCodRubClt <> '') and not(ListaRubricas.Find(sCodRubClt, iPosicao)) then
        begin
          // Total de Dias de Faltas Abonadas
          if (sCodRubClt = '00006') then
          begin
            ListaRubricas.Add(sCodRubClt);
            iTotDiasDesc := iTotDiasDesc - qryVTMagnetico.FieldByName('VALOR').AsInteger;
          end
          else
          if (sCodRubClt = '00001') or // Total de Dias de Faltas
             (sCodRubClt = '00024') or // Total de Dias de Afastamento por Doença
             (sCodRubClt = '00034') or // Total de Dias de Suspensão
             (sCodRubClt = '00039') or // Total de Dias de Afastamento pelo INSS por Doença
             (sCodRubClt = '00041') or // Total de Dias de Licença Remunerada
             (sCodRubClt = '00043') or // Total de Dias de Licença Não Remunerada
             (sCodRubClt = '00570') or // Total de Dias de Afastamento Maternidade
             (sCodRubClt = '00571') or // Total de Dias de Afastamento Paternidade
             (sCodRubClt = '00574') or // Total de Dias de Afastamento por Natmorte
             (sCodRubClt = '00696') or // Total de Dias de Afastamento Militar
             (sCodRubClt = '00697') then // Total de Dias de Afastamento pelo INSS (Acidente de Trabalho)
          begin
            ListaRubricas.Add(sCodRubClt);
            iTotDiasDesc := iTotDiasDesc + qryVTMagnetico.FieldByName('VALOR').AsInteger;
          end;
        end;
        sCodRubClt := qryVTMagnetico.FieldByName('CODRUBCLT').AsString;
        qryVTMagnetico.Next;
      end;

      // Dias Trabalhados - (Afastamentos, Faltas, etc.)
      iDiaTrabalhado := iDiaTrabalhado - iTotDiasDesc;

      if (iDiaTrabalhado < speDias.Value) then
        iDiaTrabalhado := 0;

      qryVTMagnetico.GoToBookMark (bmRegistro);
      qryVTMagnetico.FreeBookMark (bmRegistro);

      // *****************************************************
      // Processa Query colocando os somatórios nas variáveis:
      // iQtdeVales, iQtdeTotVales e rVlrTotVales
      // *****************************************************
      while (sMatricula = qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString) and not(qryVTMagnetico.EOF) do
      begin
        rQtdeVales := 0;
        sNumLinha   := qryVTMagnetico.FieldByName('NUMLINHA').asString;
        sModulo     := qryVTMagnetico.FieldByName('FUNC_MODULO').asString;

        // Calcula a quantidade de vales para este funcionário no mês escolhido
        rQtdeVales := Round(iDiaTrabalhado * qryVTMagnetico.FieldByName('FUNC_QTDE_VALES').asFloat)+
                      Round(qryVTMagnetico.FieldByName('DIASEXTRA').asInteger *
                            qryVTMagnetico.FieldByName('FUNC_QTDE_VALES').asFloat);

        Inc (wNumSequencia);
        // Gravo o registro no arquivo
        Write(fValesTransp,
          // 01-Nº de sequência do registro no meio
          fValidaDadosVTMag('N', IntToStr(wNumSequencia),5)+
          // 02-Inscrição do responsável (CGC/CEI; CPF)
          fValidaDadosVTMag('N', qryVTMagnetico.FieldByName('INSCR_ESTAB').asString, 14)+
          // 03-Tipo Fixo 1
          '2'+
          // 04-Módulo
          qryVTMagnetico.FieldByName('FUNC_MODULO').asString+
          // 05-Quantidade de vales
          fValidaDadosVTMag('N', IntToStr(Round(rQtdeVales)), 9)+
          // 06-Valor da tarifa
          fValidaDadosVTMag('V', Float2String(qryVTMagnetico.FieldByName('FUNC_VLR_TARIFA').asFloat), 8)+
          // Brancos
          Replicate (' ',144)+
          // 07-Para uso do empregador
          Val_UsoDoEmpregador07+CR_LF);

        // Atualizo valores de totalização
        Inc(wQtdeRegTip2);
        rQtdeTotVales := rQtdeTotVales + rQtdeVales;
        rValTotCompra := rValTotCompra + (rQtdeVales * qryVTMagnetico.FieldByName('FUNC_VLR_TARIFA').asFloat);

        // Vai para o ultimo registro da linha de transporte
        while (sMatricula = qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString) and
              (sNumLinha  = qryVTMagnetico.FieldByName('NUMLINHA').asString)  and
              (not qryVTMagnetico.EOF) do
          qryVTMagnetico.Next;
      end;
{->}end;
begin
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
    exit;

  // Estabelecimentos selecionados
  CriaListaOpcoes (chklstEstab, ListaEstab, sQuery, ',', false);

  // Inicializa variáveis globais do método
  bArqAberto    := false;
  wNumSequencia := 0;

  sAnoMes     := RetornaAnoMes(StrToDate(IncData(dtedInicio.Text,0,-1,0)));
  dInicio     := dtedInicio.Date;
  dFim        := dtedFim.Date;

  // Pego o ano e o mês da data inicial informada
  wMes := StrToInt(Copy(dtedInicio.Text,4,2));
  wAno := StrToInt(Copy(dtedInicio.Text,7,4));

  qryVTMagnetico.Close;
  with (qryVTMagnetico.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('   PJ.IDPESSOA,');
    Add('   PJ.NOME AS NOME_ESTAB,');
    Add('   PJ.NUMDOCUMENTO AS INSCR_ESTAB,');
    Add('   RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('     RTRIM(E.COMPLEMENTO)) AS END_ESTAB,');
    Add('   RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP_ESTAB,');
    Add('   RTRIM(E.BAIRRO) AS BAIRRO_ESTAB,');
    Add('   CIDADES.IDCIDADES,');
    Add('   RTRIM(CIDADES.NOME) AS CIDADE_ESTAB,');
    Add('   ES.CODESTADO AS UF_ESTAB,');
    Add('   CATCNAE.IDCATCNAE AS ATIV_PRINC_ESTAB,');
    Add('   TEL.DDD AS DDD_ESTAB,');
    Add('   TEL.NUMERO AS TEL_ESTAB,');
    Add('   FUNC.MATRICULA AS FUNC_MATRICULA,');
    Add('   PF.NOME AS FUNC_NOME,');
    Add('   DECODE(LT.TIPOLINHATRANSP, ''Ônibus'', ''O'', ''Onibus'', ''O'', ''Bonde'' , ''O'',');
    Add('     ''Metrô'', ''M'', ''Metro'', ''M'', ''Barca'', ''B'', ''Trem'', ''T'', '' '') AS FUNC_MODULO,');
    Add('   LP.QTDDIARIA AS FUNC_QTDE_VALES,');
    Add('   LT.VLRLINHATRANSP AS FUNC_VLR_TARIFA,');
    // PARTE NOVA (INICIO)
    Add('   CIDADES.IDPAIS,');
    Add('   FUNC.DATAREFHORARIO AS FUNC_DATAREF,');
    Add('   FUNC.CODCENTROCUSTO AS FUNC_CENTROCUSTO,');
    Add('   CC.NOME AS FUNC_NOMECENTROCUSTO,');
    Add('  (HT.HORASFOLGA1 + HT.HORASSERVICO + HT.HORASFOLGA2) AS FUNC_ESCALA,');
    Add('   HT.HORASSERVICO AS FUNC_HORASSERVICO,');
    Add('  (HT.HORASFOLGA1 + HT.HORASFOLGA2) AS FUNC_HORASFOLGA,');
    Add('   HT.FLGTIPOHORARIO AS FUNC_TIPOHORARIO,');
    Add('   HT.HORASFOLGA1 AS FUNC_HORASFOLGA1,');
    Add('   HT.JORNADAMENSAL AS FUNC_JORNADAMENSAL,');
    Add('   decode(PFFERIAS.INIGOZOFERIAS,Null,PFFERIAS.INIGOZOFERIAS, ');
    Add('   greatest(PFFERIAS.INIGOZOFERIAS,To_Date('+QuotedStr(DateTimeToStr(dInicio))+',''dd/mm/yyyy''))) AS FUNC_INICIOFERIAS,');
    Add('   decode(PFFERIAS.FIMGOZOFERIAS,Null,PFFERIAS.FIMGOZOFERIAS, ');
    Add('   least(PFFERIAS.FIMGOZOFERIAS,To_Date('+QuotedStr(DateTimeToStr(dFim))+',''dd/mm/yyyy''))) AS FUNC_FIMFERIAS,');
    Add('   SF.TIPOSIT AS FUNC_SITUACAO,');
    Add('   LT.NUMLINHATRANSP AS NUMLINHA,');
    Add('   TS.IDDIASEMANA AS DIASEMANA,');
    Add('   TD.INICIOEXPEDIENTE AS FUNC_INICIOEXPEDIENTE,');
    Add('   TD.FINALEXPEDIENTE AS FUNC_FINALEXPEDIENTE,');
    Add('   DIASACUMULADOS.CODRUBCLT,');
    Add('   NVL(EXTRA.DIASEXTRAS,0) AS DIASEXTRA,');
    Add('   NVL(DIASACUMULADOS.VALORPROVENTO,0) AS VALOR');
    // ---------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, TELENDPESS TEL, FUNCIONARIO FUNC,');
    Add('  CIDADES, LINHAXPESS LP, LINHATRANSP LT, TURNOSEM TS, TURNODIA TD,');
    Add('  CATCNAE, CENTCUST CC, ESTADO ES, HORATRAB HT, SITFUNC SF, FILIALPESSOA FP,');
    // ---------------------------------------------------------------------------- //
    Add('  (SELECT H.IDPESSOA, H.VALORPROVENTO, P.CODRUBCLT');
    Add('   FROM   HISTRUBSAL H, PROVDESC P');
    Add('   WHERE (P.CODRUBCLT LIKE (''00%'')) AND');
    Add('         (H.MES        = '+QuotedStr(sAnoMes)+') AND');
    Add('         (P.IDPROVENTO = H.IDRUBRICA)) DIASACUMULADOS,');
    // ---------------------------------------------------------------------------- //
    Add('  (SELECT FE.IDPESSOA, FE.INIGOZOFERIAS, FE.FIMGOZOFERIAS');
    Add('   FROM FERIAS FE');
    Add('   WHERE ((FE.INIGOZOFERIAS >= To_Date('+QuotedStr(DateTimeToStr(dInicio))+',''dd/mm/yyyy'')) AND');
    Add('          (FE.INIGOZOFERIAS <= To_Date('+QuotedStr(DateTimeToStr(dFim))   +',''dd/mm/yyyy''))) OR');
    Add('         ((FE.FIMGOZOFERIAS >= To_Date('+QuotedStr(DateTimeToStr(dInicio))+',''dd/mm/yyyy'')) AND');
    Add('          (FE.FIMGOZOFERIAS <= To_Date('+QuotedStr(DateTimeToStr(dFim))   +',''dd/mm/yyyy'')))) PFFERIAS,');
    // --------------------------------------------------------------------------------- //
    // SUB-SELECT PARA DIAS EXTRAS DE TRABALHO NO PERIODO
    Add('  (SELECT IDPESSOA, COUNT(*) AS DIASEXTRAS');
    Add('   FROM   DIAEXTRATRAB');
    Add('   WHERE  DIATRAB BETWEEN To_Date('+QuotedStr(DateTimeToStr(dInicio))+',''dd/mm/yyyy'') AND');
    Add('                          To_Date('+QuotedStr(DateTimeToStr(dFim))   +',''dd/mm/yyyy'')');
    Add('   GROUP BY IDPESSOA) EXTRA');
    // --------------------------------------------------------------------------------- //
    Add('WHERE');
    if (Pos(',',sQuery) > 0) then
    begin
      Add('   (PJ.IDPESSOA        IN (' +sQuery+ ')) AND');
      Add('   (FUNC.IDESTAB       IN (' +sQuery+ ')) AND');
    end
    else
    begin
      Add('   (PJ.IDPESSOA         = ' +sQuery+ ') AND');
      Add('   (FUNC.IDESTAB        = ' +sQuery+ ') AND');
    end;

    Add('   (SF.TIPOSIT          = ''A'') AND');
    Add('   (SF.IDSITFUNC        = FUNC.IDSITFUNC) AND');
    Add('   (PJ.IDPESSOA         = FUNC.IDESTAB) AND');
    Add('   (FUNC.IDPESSOA       = PF.IDPESSOA) AND');
    Add('   (HT.IDHORARIO        = FUNC.IDHORARIO) AND');
    Add('   (FUNC.IDPESSOA       = LP.IDPESSOA) AND');
    Add('   (LP.IDLINHATRANSP    = LT.IDLINHATRANSP) AND');
    Add('   (PJ.IDPESSOA         = FP.IDFILIALPESSOA) AND');
    Add('   (PJ.IDPESSOA         = E.IDPESSOA) AND');
    Add('   (E.IDENDERECO        = TEL.IDENDERECO) AND');
    Add('   (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
    Add('   (CIDADES.IDESTADO    = ES.IDESTADO)  AND');
    Add('   (FUNC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND');
    Add('   (TS.IDTURNODIARIO    = TD.IDTURNODIARIO(+)) AND');
    Add('   (HT.IDHORARIO        = TS.IDHORARIO(+)) AND');
    Add('   (FP.IDCATCNAE        = CATCNAE.IDCATCNAE(+)) AND');
    Add('   (PF.IDPESSOA         = PFFERIAS.IDPESSOA(+)) AND');
    Add('   (PF.IDPESSOA         = DIASACUMULADOS.IDPESSOA(+)) AND');
    Add('   (PF.IDPESSOA         = EXTRA.IDPESSOA(+))');
    Add('ORDER BY');
    // Ordeno os dados de acordo com a escolha
    case (cmbOrderBy.ItemIndex) of
      0 : Add('   INSCR_ESTAB, FUNC_NOME, FUNC_MODULO, NUMLINHA');
      1 : Add('   INSCR_ESTAB, FUNC_CENTROCUSTO, FUNC_NOME, FUNC_MODULO, NUMLINHA');
      2 : Add('   INSCR_ESTAB, FUNC_CENTROCUSTO, FUNC_MATRICULA, FUNC_MODULO, NUMLINHA');
      3 : Add('   INSCR_ESTAB, FUNC_MATRICULA, FUNC_MODULO, NUMLINHA');
    end;
    //SaveToFile ('C:\QRY.TXT');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\QRY.TXT'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  qryVTMagnetico.Open;

  // Processa dados para a geração do arquivo, se estes existirem
  if not(qryVTMagnetico.IsEmpty) then
  begin
    try
      qryVTMagnetico.First;
      Inicio:
      // Associa e Cria/Recria o arquivo de Vale Transporte
      AssignFile (fValesTransp, svdlgDialogo.FileName);
      ReWrite    (fValesTransp);
      bArqAberto       := true;
      byNumSubArquivos := 1;

      // Loop para gerar o subarquivo de todos os estabelecimentos selecionados
      repeat
        // Inicializa variáveis locais (valoes específicos para oestabelecimento atual)
        wNumSequencia := 1;
        wQtdeRegTip2  := 0;
        rQtdeTotVales := 0;
        rValTotCompra := 0;
        wQtdeFunc     := 1;
        sInscr_Estab  := Trim(qryVTMagnetico.FieldByName('INSCR_ESTAB').asString);

        // Procuro saber quantos empregados para este estabelecimento existem na Query
        bmRegistro := qryVTMagnetico.GetBookMark;
        sMatr_Func := Trim(qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString);
        repeat
          qryVTMagnetico.Next;
          if (sMatr_Func  <> Trim(qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString)) and
             (sInscr_Estab = Trim(qryVTMagnetico.FieldByName('INSCR_ESTAB').asString)) then
          begin
            Inc(wQtdeFunc);
            sMatr_Func := Trim(qryVTMagnetico.FieldByName('FUNC_MATRICULA').asString);
          end;
        until (qryVTMagnetico.EOF) or (sInscr_Estab <> Trim(qryVTMagnetico.FieldByName('INSCR_ESTAB').asString));

        qryVTMagnetico.GoToBookMark (bmRegistro);
        qryVTMagnetico.FreeBookMark (bmRegistro);

        // Inicio a gravação dos registros

        // ***************
        // Registro Tipo 1
        // ***************
        Write(fValesTransp,
          // 01-Nº de sequência do registro no meio
          fValidaDadosVTMag('N', IntToStr(wNumSequencia),5)+
          // 02-Inscrição do responsável (CGC/CEI; CPF)
          fValidaDadosVTMag('N', qryVTMagnetico.FieldByName('INSCR_ESTAB').asString, 14)+
          // 03-Tipo Fixo 1
          '1       '+
          // 04-Nome do responsável (Razão social)
          fValidaDadosVTMag('A', qryVTMagnetico.FieldByName('NOME_ESTAB').asString, 40)+
          // 05-Endereço
          fValidaDadosVTMag('A', qryVTMagnetico.FieldByName('END_ESTAB').asString, 38)+
          // 06-Mes/Ano de referência
          PoeZero(wMes)+IntToStr(wAno)+
          // 07-Quantidade de funcionários
          fValidaDadosVTMag('N', IntToStr(wQtdeFunc), 5)+
          // 08-Cep Ex.: 00000000 (se não houver informação)
          fValidaDadosVTMag('N', qryVTMagnetico.FieldByName('CEP_ESTAB').asString, 8)+
          // 09-Bairro
          fValidaDadosVTMag('A', qryVTMagnetico.FieldByName('BAIRRO_ESTAB').asString, 17)+
          // 10-Cidade
          fValidaDadosVTMag('A', qryVTMagnetico.FieldByName('CIDADE_ESTAB').asString, 20)+
          // 11-UF
          fValidaDadosVTMag('A', qryVTMagnetico.FieldByName('UF_ESTAB').asString, 2)+
          // 12-Atividade principal
          fValidaDadosVTMag('N', qryVTMagnetico.FieldByName('ATIV_PRINC_ESTAB').asString, 4)+
          // 13-DDD
          fValidaDadosVTMag('N', qryVTMagnetico.FieldByName('DDD_ESTAB').asString, 4)+
          // 14-Complemento
          fValidaDadosVTMag('N', qryVTMagnetico.FieldByName('TEL_ESTAB').asString, 7)+
          // 15-Ramal
          Replicate (' ', 4)+
          // 16-Para uso do empregador
          Replicate (' ', 25)+CR_LF);

        // ***************
        // Registro Tipo 2
        // ***************
        repeat
          ProcessaDadosFunc;
          sInscr_Estab2 := Trim(qryVTMagnetico.FieldByName('INSCR_ESTAB').asString);
        until (qryVTMagnetico.EOF) or (sInscr_Estab <> sInscr_Estab2);

        // Acerto o ponteiro da query
        if not(qryVTMagnetico.EOF) then
          qryVTMagnetico.Prior;

        // ***************
        // Registro Tipo 3
        // ***************
        Inc(wNumSequencia);
        GravaRegistroTrailer;

        if not(qryVTMagnetico.EOF) then
        begin
          // Próximo estabelecimento
          qryVTMagnetico.Next;
          // Número do próximo subarquivo
          Inc(byNumSubArquivos);
        end;
      until (qryVTMagnetico.EOF) or (byNumSubArquivos >= 33);

      // ********************
      // TAPE MARK do arquivo
      // ********************
      Write(fValesTransp, Replicate('9', 207));
      // Se o arquivo possui mais que 32 estabelecimentos gere o restante em outro arquivo
      if (byNumSubArquivos >= 33) then
      begin
        // Gravo o registro tipo 3, o trailer e fecho o arquivo para que seja escolhido outro
        CloseFile (fValesTransp);
        frmAguarde.Apaga;
        if (MsgDlg (' Somente é possível a gravação de 32 estabelecimentos por arquivo !'+
                    'Escolha um outro meio para que o restante dos dados sejam gravados.',
                    'Aviso...', mtInformation,[mbOK,mbCancel],0) = mrCancel) then  exit;
        svdlgDialogo.Execute;
        if not(VerificaOpcoesOk) then
          exit;
        frmAguarde.Show;
        GoTo Inicio;
      end;

      DecodeTime(Time,wHora,wMin,wSeg,wMSeg);
      iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

      frmAguarde.Apaga;
      ShowMessage ('Arquivo VALE.TXT gerado com sucesso !');
    except
      DecodeTime(Time,wHora,wMin,wSeg,wMSeg);
      iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
    
      ShowMessage ('Erro durante a criação em '+svdlgDialogo.FileName);
    end;
  end
  else
  begin
    DecodeTime(Time,wHora,wMin,wSeg,wMSeg);
    iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

    ShowMessage ('Não há dados a serem processados !');
  end;

  // Finalizo o método adequadamente
  qryVTMagnetico.Close;
  if (bArqAberto) then
    CloseFile (fValesTransp);

  pnlHorario.Caption := 'Tempo de Processamento: ' +TempoDecorrido(iFim - iInicio);
end;

function TfrmParamVTMagnetico.VerificaOpcoesOk: boolean;
var
  iFile: integer;
begin
  Result := false;

  frmAguarde.Apaga;

  //svdlgDialogo.FileName := 'C:\VALE\VALE.TXT';
  svdlgDialogo.FileName := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\VALE\VALE.TXT';//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  // Abro o diálogo de seleção do arquivo
  //iFile := FileCreate('C:\VALE\VALE.TST');
  iFile := FileCreate(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\VALE\VALE.TST');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  if (iFile = -1) then
  begin
    //if (MsgDlg('Pasta C:\VALE\ não foi encontrada! Deseja criá-la ?','Aviso', mtInformation,[mbYes,mbNo],0) = mrYes) then
    if (MsgDlg('Pasta'+Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\VALE\ não foi encontrada! Deseja criá-la ?','Aviso', mtInformation,[mbYes,mbNo],0) = mrYes) then //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      //CreateDir ('C:\VALE\')
      CreateDir (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\VALE\')//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    else
    if not(svdlgDialogo.Execute) then
      exit;
  end;
  FileClose (iFile);
  //DeleteFile('C:\VALE\VALE.TST');
  DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\VALE\VALE.TST');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  // Verifica se o arquivo existe na pasta escolhida
  if (FileExists(svdlgDialogo.FileName)) then
    if (MsgDlg ('O arquivo já existe na pasta especificada! Deseja SOBRESCREVÊ-LO ?','Aviso',mtConfirmation,[mbYes,mbNo],0) = mrNo) then
      exit;

  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iInicio := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

  Result := true;
end;

// *************************************************************************************
// Valida os dados do VALE TRANSPORTE MAGNÉTICO
// Parâmetros: sTipo    - A (alfanumérico), N (numérico), V (valor)
//             sDado    - Dado a ser validado
//             wTamanho - Tamanho de retorno da string validada
// *************************************************************************************
function TfrmParamVTMagnetico.fValidaDadosVTMag(cTipo:char; sDado:string; wTamanho:word): string;
var
  sTemp: string;
  c, wMax: word;
begin
  // Faz Validação básica para a utilização da Função
  if not(cTipo in ['A','N','V']) then
  begin
    MsgDlg ('Erro na Função fValidaDadosVTMag. Não foi indicado o tipo do dados ou o mesmo não é válido','Aviso', mtInformation,[mbOK,mbHelp],0);
    exit;
  end;

  // Verifica se o tamanho é válido
  if (wTamanho = 0) then
  begin
    MsgDlg ('Erro na Função fValidaDadosVTMag. O Tamanho de retorno do Dado a ser tratado inválido.','Aviso', mtInformation,[mbOK,mbHelp],0);
    exit;
  end;

  // Inicializa Variáveis
  sTemp := '';
  cTipo := UpCase(cTipo);
  sDado := Trim(sDado);

  // ******************************
  // Faz tratamento das informações
  // ******************************
  wMax := wTamanho;
  case (cTipo) of
    'A' : // Campos alfanuméricos
    begin
      try
        sDado := UpperCase (NormalizaString(ConverteCar(sDado)));
        sTemp := Alinha(Copy(sDado,1,wMax), wTamanho, 'E', ' ');
      except
        sTemp := Replicate(' ', wTamanho);
      end;
    end;

    'N','V' : // Campos Numéricos e de Valor
    begin
      try
        // Atribuo o maior tamanho verificável possível
        if (wTamanho > Length(sDado)) then
          wMax := Length(sDado);

        for c:=1 to length(sDado) do
          if (sDado[c] in ['0'..'9']) then
            sTemp := sTemp+sDado[c];

        sTemp := Alinha(Copy(sTemp,1,wMax), wTamanho, 'D', '0');
      except
        sTemp := Replicate('0', wTamanho);
      end;
    end;
  end;
  Result := sTemp;
end;

procedure TfrmParamVTMagnetico.HabilitaBtOk;
var
  c: integer;
  bSelEstab: boolean;
begin
  bSelEstab := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bSelEstab := true;
      break;
    end;

  rbtnGerar.Enabled := (bSelEstab) and (Trim(dtedInicio.Text) <> '') and
    (Trim(dtedFim.Text) <> '');
end;

end.
