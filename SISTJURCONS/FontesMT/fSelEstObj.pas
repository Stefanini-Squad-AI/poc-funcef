unit fSelEstObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoCons,
  DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, ComCtrls, checklst, Buttons, wwdbdatetimepicker, Db, DBClient,
  CMDateTimePicker, uCmSqlParams, uCMClientDataSet, CmParamReport, TREdit, OleCtrls, chartfx3,
  uCtrlTipObjeto, uCtrlGrpObjeto, uCtrlProcessoTrab, uCtrlCustomProcTrab, ColorCheckListBox;

type
  TfrmSelEstObj = class(TfrmSelProcessoCons)
    tbshGrafico: TTabSheet;
    rgValor: TRadioGroup;
    rgSelTudo: TRadioGroup;
    gbxPercMin: TGroupBox;
    Label16: TLabel;
    cbxPercMin: TCheckBox;
    spedPercMin: TSpinEdit;
    gbxDemaisObjetos: TGroupBox;
    cbxIncluirDemaisObjetos: TCheckBox;
    pgctrlGrafico: TPageControl;
    tbshQuantidade: TTabSheet;
    tbshValor: TTabSheet;
    Chart1: TChartfx;
    Chart2: TChartfx;
    chklstDemaisObjetos: TColorCheckListBox;
    CdsTipObj: TCMClientDataSet;
    CdsGrpObj: TCMClientDataSet;
    CdsObj: TCMClientDataSet;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure rgSelTudoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
  private
    CtrlTipObjeto: TCtrlTipObjeto;
    CtrlGrpObjeto: TCtrlGrpObjeto;
    CtrlProcessoTrab: TCtrlProcessoTrab;
    CtrlCustomProcTrab: TCtrlCustomProcTrab;

    ListaCodDemaisObjetos: TStringList;
  end;

var
  frmSelEstObj: TfrmSelEstObj;

implementation

uses uSistema, uMensErro, uCtrlPadroes, dCds, fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmSelEstObj.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCodDemaisObjetos := TStringList.Create;

  CtrlTipObjeto := TCtrlTipObjeto.Create;
  CtrlTipObjeto.InitializeAs(Padroes);

  CtrlGrpObjeto := TCtrlGrpObjeto.Create;
  CtrlGrpObjeto.InitializeAs(Padroes);

  CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
    Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlProcessoTrab.InitializeAs(Padroes);

  CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa);
  CtrlCustomProcTrab.InitializeAs(Padroes);

  IrPaginaResult := false;
  case (Sistema.IdModulo) of
    MODCON   : HelpContext := 760029;
    PROCJUD  : HelpContext := 1110023;
    PROCPREV : HelpContext := 1100022;
    SISTJURCONS : HelpContext := 7190029;
  end;
end;

procedure TfrmSelEstObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlTipObjeto.Free;
  CtrlGrpObjeto.Free;
  CtrlProcessoTrab.Free;
  CtrlCustomProcTrab.Free;
  ListaCodDemaisObjetos.Free;
  inherited;
end;

procedure TfrmSelEstObj.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstDemaisObjetos.Items.Count-1 do
    chklstDemaisObjetos.Checked[c] := true;
  chklstDemaisObjetos.Repaint;
end;

procedure TfrmSelEstObj.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstDemaisObjetos.Items.Count-1 do
    chklstDemaisObjetos.Checked[c] := not(chklstDemaisObjetos.Checked[c]);
  chklstDemaisObjetos.Repaint;
end;

procedure TfrmSelEstObj.rgSelTudoClick(Sender: TObject);
begin
  gbxPercMin.Visible := (rgSelTudo.ItemIndex < 2);
  gbxDemaisObjetos.Visible := (rgSelTudo.ItemIndex > 1);
  if (rgSelTudo.ItemIndex > 1) then
  begin
    case (rgSelTudo.ItemIndex) of
      2 : dmCds.Cds.Data := CtrlTipObjeto.ListTipObjeto;
      3 : dmCds.Cds.Data := CtrlGrpObjeto.ListGrpObjeto;
    end;
    ListaCodDemaisObjetos.Clear;
    chklstDemaisObjetos.Items.BeginUpdate;
    chklstDemaisObjetos.Clear;
    dmCds.Cds.First;
    while not(dmCds.Cds.EOF) do
    begin
      case (rgSelTudo.ItemIndex) of
        2 : ListaCodDemaisObjetos.Add(dmCds.Cds.FieldByName('CODTIPOOBJETO').asString);
        3 : ListaCodDemaisObjetos.Add(dmCds.Cds.FieldByName('IDGRUPOOBJETO').asString);
      end;
      chklstDemaisObjetos.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
      dmCds.Cds.Next;
    end;
    chklstDemaisObjetos.Items.EndUpdate;
    chklstDemaisObjetos.SetFocus;
  end;
end;

procedure TfrmSelEstObj.bbtnConfirmarClick(Sender: TObject);
var
  sListaCodDemaisObj, sDataHist, sNomeCampo: string;
  DataRef1, DataRef2: TDateTime;
  J, iTotQtd, TotProc, QtdOut, iTamY, c, Ind1, Vez, I1, I2: integer;
  iYMax, I3, ValorReclamado, ValorReal: double;
  TotVal, TotOut: real;
  TituTela1, TituTela2: array[1..2] of string;
  CharVal, CharQtd, CharInd, DescObj, DescObj2, CharVal2, CharQtd2, CodObj: Variant;
begin
  FU.CriaListaOpcoes(chklstDemaisObjetos, ListaCodDemaisObjetos, sListaCodDemaisObj, ',', false);
  if (rgSelTudo.ItemIndex in [2,3]) and (sListaCodDemaisObj = '') then
  begin
    MsgDlg('Objetos devem ser selecionados.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    exit;
  end;

  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  inherited;

  if not(bSelOk) then
  begin
    frmAguarde.Apaga;
    exit;
  end;

  if (CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Não há dados a exibidos com os parâmetros selecionados.', 'Aviso',
      mtWarning, [mbOk, mbHelp], 0);
    exit;
  end;

  frmAguarde.Mostra('Montando Gráfico...');
  frmAguarde.Max := CdsProcesso.RecordCount;
  frmAguarde.Update;

  sNomeCampo := 'DATANOTIF';

  try
    TituTela1[1] := 'de Objetos Reclamados';
    TituTela1[2] := 'dos Valores ' + rgValor.Items[rgValor.ItemIndex];
    TituTela2[1] := 'Total de Objetos Reclamados: ';
    TituTela2[2] := 'Valor Total: ';

    case (rgSelTudo.ItemIndex) of
      0 : CdsTipObj.Data := CtrlTipObjeto.ListTipObjeto;
      1 : CdsGrpObj.Data := dmCds.Cds.Data;
      2 : CdsTipObj.Data := dmCds.Cds.Data;
      3 : CdsGrpObj.Data := CtrlGrpObjeto.ListGrpObjeto;
    end;

    if ((rgSelTudo.ItemIndex in [1,3]) and (CdsGrpObj.IsEmpty)) or
       ((rgSelTudo.ItemIndex in [0,2]) and (CdsTipObj.IsEmpty)) then
    begin
      frmAguarde.Apaga;
      MsgDlg('Não há dados a exibidos com os parâmetros selecionados.', 'Aviso',
        mtWarning, [mbOk, mbHelp], 0);
      exit;
    end;

    // Cálcular o número de linhas do gráfico
    case (rgSelTudo.ItemIndex) of
      0 : iTamY := CdsTipObj.RecordCount;
      1 : iTamY := CdsGrpObj.RecordCount;
      2,3 :
      begin
        iTamY := FU.ContaCaracter(sListaCodDemaisObj, ',') + 1;
        if (cbxIncluirDemaisObjetos.Checked) then
          Inc(iTamY);
      end;
    end;

    // Montar a lista contendo a Descrição dos ítens do gráfico
    CodObj := VarArrayCreate([1, iTamY], varInteger);
    DescObj := VarArrayCreate([1, iTamY], varOleStr);
    case (rgSelTudo.ItemIndex) of
      0 :
      begin
        CdsTipObj.First;
        for c:=1 to CdsTipObj.RecordCount do
        begin
          CodObj[c] := CdsTipObj.FieldByName('CODTIPOOBJETO').asInteger;
          DescObj[c] := CdsTipObj.FieldByName('DESCRICAO').asString;
          CdsTipObj.Next;
        end;
      end;
      1 :
      begin
        CdsGrpObj.First;
        for c:=1 to CdsGrpObj.RecordCount do
        begin
          CodObj[c] := CdsGrpObj.FieldByName('IDGRUPOOBJETO').asInteger;
          DescObj[c] := CdsGrpObj.FieldByName('DESCRICAO').asString;
          CdsGrpObj.Next;
        end;
      end;
      2 :
      begin
        Ind1 := 0;
        for c:=0 to chklstDemaisObjetos.Items.Count-1 do
        begin
          if (chklstDemaisObjetos.Checked[c]) then
          begin
            if (CdsTipObj.Locate('DESCRICAO', chklstDemaisObjetos.Items[c], [])) then
            begin
              Inc(Ind1);
              CodObj[Ind1] := CdsTipObj.FieldByName('CODTIPOOBJETO').asInteger;
              DescObj[Ind1] := CdsTipObj.FieldByName('DESCRICAO').asString;
            end;
          end;
        end;

        if (cbxIncluirDemaisObjetos.Checked) then
        begin
          CodObj[iTamY] := -1;
          DescObj[iTamY] := 'Demais Objetos';
        end;
      end;
      3 :
      begin
        Ind1 := 0;
        for c:=0 to chklstDemaisObjetos.Items.Count-1 do
        begin
          if (chklstDemaisObjetos.Checked[c]) then
          begin
            if (CdsGrpObj.Locate('DESCRICAO', chklstDemaisObjetos.Items[c], [])) then
            begin
              Inc(Ind1);
              CodObj[Ind1] := CdsGrpObj.FieldByName('IDGRUPOOBJETO').asInteger;
              DescObj[Ind1] := CdsGrpObj.FieldByName('DESCRICAO').asString;
            end;
          end;
        end;

        if (cbxIncluirDemaisObjetos.Checked) then
        begin
          CodObj[iTamY] := -1;
          DescObj[iTamY] := 'Demais Objetos';
        end;
      end;
    end;

    // Cálculo da Quantidade e Valor de cada ítem
    CharQtd := VarArrayCreate([1, iTamY], varInteger);
    CharVal := VarArrayCreate([1, iTamY], varDouble);
    for c:=1 to iTamY do
    begin
      CharQtd[c] := 0;
      CharVal[c] := 0;
    end;

    CdsProcesso.First;
    while not(CdsProcesso.EOF) do
    begin
      sDataHist := FU.IFF(CdsProcesso.FieldByName(sNomeCampo).asString='',
        CdsProcesso.FieldByName('DATANOTIF').asString,
        CdsProcesso.FieldByName(sNomeCampo).asString);

      if (sDataHist = '') then
        DataRef1 := 0
      else
        DataRef1 := StrToDate(Copy(sDataHist,1,Length(ShortDateFormat)));

      if (CdsProcesso.FieldByName('DATAEFETENC').asString = '') then
        DataRef2 := 0
      else
        DataRef2 := StrToDate(Copy(CdsProcesso.FieldByName('DATAEFETENC').asString,1,Length(ShortDateFormat)));

      CdsObj.Data := CtrlProcessoTrab.ListObjeto(CdsProcesso.FieldByName('NUMPROCTRAB').asFloat);
      while not(CdsObj.EOF) do
      begin
        ValorReclamado := CtrlCustomProcTrab.GetValorAtual(
          CdsObj.FieldByName('VALORRECL').asFloat,
          DataRef1,
          CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
          CdsProcesso.FieldByName('IDREGRA').asFloat,
          CdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
          CdsProcesso.FieldByName('INDTAXACONV').asInteger);

        ValorReal := CtrlCustomProcTrab.GetValorAtual(
          CdsObj.FieldByName('VALORSENTENCA').asFloat,
          DataRef2,
          CdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
          CdsProcesso.FieldByName('IDREGRA').asFloat,
          CdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
          CdsProcesso.FieldByName('INDTAXACONV').asInteger);

        // Determinar o ponteiro onde vai somar
        for c:=1 to iTamY do
        begin
          if (rgSelTudo.ItemIndex in [0,2]) and
             (CdsObj.FieldByName('CODTIPOOBJETO').asInteger = CodObj[c]) then
            break;

          if (rgSelTudo.ItemIndex in [1,3]) and
             (CdsTipObj.Locate('CODTIPOOBJETO', CdsObj.FieldByName('CODTIPOOBJETO').asString, [])) and
             (CdsTipObj.FieldByName('IDGRUPOOBJETO').asInteger = CodObj[c]) then
            break;
        end;

        if (cbxIncluirDemaisObjetos.Checked) and
           (rgSelTudo.ItemIndex in [2,3]) and (c > iTamY) then
          c := iTamY;

        if (c <= iTamY) and (iTamY > 0) then
        begin
          CharQtd[c] := CharQtd[c] + 1;

          if (CdsProcesso.FieldByName('FLGSITPROC').asInteger = 0) then
            CharVal[c] := CharVal[c] + ValorReclamado - (rgValor.ItemIndex *
              (100 - CdsObj.FieldByName('PERCPROB').asFloat) * ValorReclamado / 100)
          else
            CharVal[c] := CharVal[c] + (1 - rgValor.ItemIndex) * ValorReclamado +
              rgValor.ItemIndex * ValorReal;
        end;
        CdsObj.Next;
      end;
      CdsProcesso.Next;
      frmAguarde.Pos := frmAguarde.Pos + 1;
    end;

    if (rgSelTudo.ItemIndex in [0,1]) and (cbxPercMin.Checked) then
    begin
      CharInd := VarArrayCreate([1, iTamY], varInteger);

      TotVal := 0;
      for c:=1 to iTamY do
        TotVal := TotVal + CharVal[c];

      iTotQtd := 0;
      for c:=1 to iTamY do
      begin
        if (CharVal[c]*100/TotVal < spedPercMin.Value) then
          CharInd[c] := 0
        else
        begin
          CharInd[c] := 1;
          Inc(iTotQtd);
        end;
      end;  

      if (iTotQtd < iTamY) then
      begin
        DescObj2 := VarArrayCreate([1, iTotQtd+1], varOleStr);
        CharQtd2 := VarArrayCreate([1, iTotQtd+1], varInteger);
        CharVal2 := VarArrayCreate([1, iTotQtd+1], varDouble);

        Ind1 := 0;
        TotOut := 0;
        QtdOut := 0;
        for c:=1 to iTamY do
        begin
          if (CharInd[c] = 1) then
          begin
            Inc(Ind1);
            DescObj2[Ind1] := DescObj[c];
            CharQtd2[Ind1] := CharQtd[c];
            CharVal2[Ind1] := CharVal[c];
          end
          else
          begin
            TotOut := TotOut + CharVal[c];
            QtdOut := QtdOut + CharQtd[c];
          end;
        end;

        DescObj := VarArrayCreate([1, iTotQtd+1], varOleStr);
        CharQtd := VarArrayCreate([1, iTotQtd+1], varInteger);
        CharVal := VarArrayCreate([1, iTotQtd+1], varDouble);
        for c:=1 to iTotQtd do
        begin
          DescObj[c] := DescObj2[c];
          CharQtd[c] := CharQtd2[c];
          CharVal[c] := CharVal2[c];
        end;
      
        DescObj[iTotQtd+1] := 'Demais Objetos';
        CharVal[iTotQtd+1] := TotOut;
        CharQtd[iTotQtd+1] := QtdOut;
        iTamY := iTotQtd + 1;
      end;
    end;

    // Montar Gráfico de Quantidades
    Chart1.OpenDataEx(1,1,iTamY);
    Chart1.ChartType := 5;
    for c:=0 to iTamY-1 do
      Chart1.Legend[c] := DescObj[c+1];

    Chart1.Decimals := 0;
    Chart1.Title[2] := 'Estatística ' + TituTela1[1];
    iYMax := 0;

    iTotQtd := 0;
    Chart1.ThisSerie := 0;
    for c:=0 to iTamY-1 do
    begin
      Chart1.Value[c] := CharQtd[c+1];
      iTotQtd := iTotQtd + CharQtd[c+1];

      if (Chart1.Value[c] > iYMax) then
        iYMax := Chart1.Value[c];
    end;

    if (iTotQtd = 0) then
    begin
      frmAguarde.Apaga;
      MsgDlg('Não há dados a exibidos com os parâmetros selecionados.', 'Aviso',
        mtWarning, [mbOk, mbHelp], 0);
      exit;
    end;

    Chart1.Title[3] := TituTela2[1] + IntToStr(iTotQtd);

    I3 := 1;
    while (iYMax > I3) do
      I3 := I3*10;

    I3 := Int(I3 / 20); // Escala de Y

    Chart1.Adm[1] := iYMax; // Valor Máximo de Y
    Chart1.Adm[4] := I3; // Escala de Y
    Chart1.CloseData(1);

    // Montar Gráfico de Valores
    Chart2.OpenDataEx(1,1,iTamY);
    Chart2.ChartType := 5;
    for c:=0 to iTamY-1 do
      Chart2.Legend[c] := DescObj[c+1];

    Chart2.Decimals := 0;
    Chart2.Title[2] := 'Estatística ' + TituTela1[2];
    iYMax := 0;

    TotVal := 0;
    Chart2.ThisSerie := 0;
    for c:=0 to iTamY-1 do
    begin
      Chart2.Value[c] := CharVal[c+1];
      TotVal := TotVal + CharVal[c+1];

      if (Chart2.Value[c] > iYMax) then
        iYMax := Chart2.Value[c];
    end;

    Chart2.Title[3] := TituTela2[2] + FloatToStrF(TotVal,ffFixed,12,2);

    I3 := 1;
    while (iYMax > I3) do
      I3 := I3*10;

    I3 := Int(I3 / 20); // Escala de Y

    Chart2.Adm[1] := iYMax; // Valor Máximo de Y
    Chart2.Adm[4] := I3; // Escala de Y
    Chart2.CloseData(1);
  except
    on E: Exception do
      MsgDlg(E.Message, 'Erro', mtError, [mbOk,mbHelp], 0);
  end;

  frmAguarde.Apaga;
  ExecutarIrPaginaResult;
  pgctrlGrafico.ActivePageIndex := 0;
end;

end.
