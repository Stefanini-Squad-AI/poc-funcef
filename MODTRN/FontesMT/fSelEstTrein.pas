unit fSelEstTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  fSelPessoalMT, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, uCtrlGrpTrein,
  uCtrlCargo, uCtrlSelEstTrein, uCtrlPessoaFilialPessoa, uCtrlTipCurso;

type
  TfrmSelEstTrein = class(TfrmSelPessoalMT)
    tbshGrafico: TTabSheet;
    rgFreq: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    spedAno1: TSpinEdit;
    spedAno2: TSpinEdit;
    rgTipoEst: TRadioGroup;
    pgctrlGrafico: TPageControl;
    tbshGrafico1: TTabSheet;
    Chart1: TChartfx;
    tbshGrafico2: TTabSheet;
    Chart2: TChartfx;
    CdsHistorico: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgFreqClick(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGrpTrein: TCtrlGrpTrein;
    CtrlCargo: TCtrlCargo;
    CtrlSelEstTrein: TCtrlSelEstTrein;
    CtrlTipCurso: TCtrlTipCurso;

    procedure HabilitarBtOk;
  end;

var
  frmSelEstTrein: TfrmSelEstTrein;

implementation

uses uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmSelEstTrein.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia: word;
begin
  inherited;
  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGrpTrein := TCtrlGrpTrein.Create;
  CtrlGrpTrein.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlTipCurso := TCtrlTipCurso.Create;
  CtrlTipCurso.InitializeAs(Padroes);

  CtrlSelEstTrein := TCtrlSelEstTrein.Create;
  CtrlSelEstTrein.InitializeAs(Padroes);

  DecodeDate(Date, Ano, Mes, Dia);
  spedAno1.Value := Ano;
  spedAno2.Value := Ano;
  spedAno1.MaxValue := Ano;
  spedAno2.MaxValue := Ano;

  rgSequencia.Visible := false;
  cbxCandidatos.Enabled := false;
  IrPaginaResult := false;
  pgctrlGrafico.ActivePageIndex := 0;
end;

procedure TfrmSelEstTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGrpTrein);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlTipCurso);
  FreeAndNil(CtrlSelEstTrein);
  inherited;
end;

procedure TfrmSelEstTrein.rgFreqClick(Sender: TObject);
begin
  HabilitarBtOk;
end;

procedure TfrmSelEstTrein.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  rgSequencia.Visible := false;
end;

procedure TfrmSelEstTrein.bbtnConfirmarClick(Sender: TObject);
const
  TITULO1: array[1..2] of string = ('das Horas de', 'do Investimento em');
  TITULO2: array[1..2] of string = ('Total de Horas: ', 'Custo Total: ');
var
  c, I, I1, I2: integer;
  I3: double;
  S, sListaIdFuncSel: string;
  iNumVez, J, iQuantTotal, iValorTotal, iQuantTotal2, iValorTotal2, iTamX, iTamY, iSvTam: integer;
  CharHor, CharVal, ListaCodigo, ListaDescricao, TemValor: variant;
  YMax: double;
  Ano, Mes, Dia: word;
  _CdsTipoEstat: TCMClientDataSet;
begin
  _CdsTipoEstat := TCMClientDataSet.Create(Application);
  try
    frmAguarde.Mostra('Selecionando Dados...');
    frmAguarde.Min := 0;
    frmAguarde.Pos := 0;
    frmAguarde.Update;
    inherited;
    frmAguarde.Update;
    frmAguarde.Max := CdsPrincipal.RecordCount + 1;

    if (rgTipoEst.ItemIndex = 0) then
      dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListEstabDaEmpresa(Sistema.IdEmpresa)
    else if (rgTipoEst.ItemIndex = 3) then
      dmCds.Cds.Data := CtrlTipCurso.ListGeral(0)
    else if (rgTipoEst.ItemIndex <> 4) then
      dmCds.Cds.Data := CtrlGrpTrein.ListGrpTrein;

    iTamX := 12;
    if (rgTipoEst.ItemIndex = 0) and (rgSelEstab.ItemIndex = 1) then
      iTamY := lstEstab.Items.Count
    else if (rgTipoEst.ItemIndex = 4) then
      iTamY := 2
    else
      iTamY := dmCds.Cds.RecordCount;

    if (rgTipoEst.ItemIndex in [0,4]) then
      ListaCodigo := VarArrayCreate([1, iTamY], varDouble)
    else
      ListaCodigo := VarArrayCreate([1, iTamY], varOleStr);

    ListaDescricao := VarArrayCreate([1, iTamY], varOleStr);
    TemValor := VarArrayCreate([1, iTamY], varOleStr);

    if (rgTipoEst.ItemIndex = 0) and (rgSelEstab.ItemIndex = 1) then
    begin
      for c:=1 to iTamY do
      begin
        ListaCodigo[c] := StrToInt(lstCodEstab.Items[c-1]);
        ListaDescricao[c] := lstEstab.Items[c-1];
      end;
    end
    else if (rgTipoEst.ItemIndex = 4) then
    begin
      ListaCodigo[1] := 1;
      ListaDescricao[1] := 'Programado';
      ListaCodigo[2] := 2;
      ListaDescricao[2] := 'Realizado';
    end
    else
    begin
      dmCds.Cds.First;
      for c:=1 to dmCds.Cds.RecordCount do
      begin
        if (rgTipoEst.ItemIndex = 0) then
        begin
          ListaCodigo[c] := dmCds.Cds.FieldByName('IDPESSOA').asFloat;
          ListaDescricao[c] := dmCds.Cds.FieldByName('NOME').asString;
        end
        else if (rgTipoEst.ItemIndex = 3) then
        begin
          ListaCodigo[c] := dmCds.Cds.FieldByName('IDTIPOCURSO').asFloat;
          ListaDescricao[c] := dmCds.Cds.FieldByName('DESCRICAO').asString;
        end
        else if (rgTipoEst.ItemIndex in [1,2]) then
        begin
          ListaCodigo[c] := dmCds.Cds.FieldByName('CODGRPTREIN').asString;
          ListaDescricao[c] := dmCds.Cds.FieldByName('DESCGRPTREIN').asString;
        end;
        dmCds.Cds.Next;
      end;
    end;

    DecodeDate(Date, Ano, Mes, Dia);
    if (rgFreq.ItemIndex = 0) and (spedAno1.Value = Ano) then
      iTamX := Mes;

    if (rgFreq.ItemIndex = 1) then
      iTamX := spedAno2.Value - spedAno1.Value + 1;

    CharHor := VarArrayCreate([1, iTamY, 1, iTamX], varInteger);
    CharVal := VarArrayCreate([1, iTamY, 1, iTamX], varInteger);

    for I1:=1 to iTamY do
      for I2:=1 to iTamX do
      begin
        CharHor[I1,I2] := 0;
        CharVal[I1,I2] := 0;
      end;

    // Seleção dos Dados
    while not(CdsPrincipal.EOF) do
    begin
      if (rgTipoEst.ItemIndex = 1) then
        _CdsTipoEstat.Data := CtrlCargo.ListCargo(CdsPrincipal.FieldByName('IDCARGO').asFLoat);

      CdsHistorico.Data := CtrlSelEstTrein.ListHistorico(
        CdsPrincipal.FieldByName('IDPESSOA').asFloat,
        spedAno1.Value, spedAno2.Value, rgTipoEst.ItemIndex);

      while not(CdsHistorico.EOF) do
      begin
        DecodeDate(CdsHistorico.FieldByName('DATREFIM').asDateTime, Ano, Mes, Dia);
        if (rgFreq.ItemIndex = 1) or (Mes <= iTamX) then
        begin
          for c:=1 to iTamY do
          begin
            // Rotina para determinar o ponteiro onde vai somar
            if (rgTipoEst.ItemIndex = 0) and
               (CdsPrincipal.FieldByName('IDESTAB').asFloat = ListaCodigo[c]) then
              break
            else
            if (rgTipoEst.ItemIndex = 1) and
               (_CdsTipoEstat.FieldByName('CODGRPTREIN').asString = ListaCodigo[c]) then
              break
            else
            if (rgTipoEst.ItemIndex = 2) and
               (CdsHistorico.FieldByName('CODGRPTREIN').asString = ListaCodigo[c]) then
              break
            else
            if (rgTipoEst.ItemIndex = 3) and
               (CdsHistorico.FieldByName('IDTIPOCURSO').asString = ListaCodigo[c]) then
              break
            else
            if (rgTipoEst.ItemIndex = 4) and
               (CdsHistorico.FieldByName('TIPOCALC').asFloat = ListaCodigo[c]) then
              break;
          end;

          if (iTamY > 0) and (c <= iTamY) then
            if (rgFreq.ItemIndex = 0) then
            begin
              CharHor[c,MES] := CharHor[c,MES] + CdsHistorico.FieldByName('DUR_TOT').asInteger;
              CharVal[c,MES] := CharVal[c,MES] + CdsHistorico.FieldByName('TOT_CUSTO').asInteger;
            end
            else
            begin
              CharHor[c,Ano-spedAno1.Value+1] := CharHor[c,Ano-spedAno1.Value+1] +
                CdsHistorico.FieldByName('DUR_TOT').asInteger;

              CharVal[c,Ano-spedAno1.Value+1] := CharVal[c,Ano-spedAno1.Value+1] +
                CdsHistorico.FieldByName('TOT_CUSTO').asInteger;
            end;
        end;
        CdsHistorico.Next;
      end;
      CdsPrincipal.Next;

      if (rgTipoEst.ItemIndex = 1) then
        _CdsTipoEstat.Data := CtrlCargo.ListCargo(CdsPrincipal.FieldByName('IDCARGO').asFLoat);

      frmAguarde.Pos := frmAguarde.Pos + 1;
      frmAguarde.Update;
    end;

    frmAguarde.Mostra('Gerando Gráfico...');
    frmAguarde.Update;

    for iNumVez:=1 to 2 do
    begin
      iSvTam := iTamX;
      I2 := 0;

      for I1:=0 to iTamY-1 do
        TemValor[I1+1] := ' ';

      for I1:=0 to iTamY-1 do
      begin
        iSvTam := iTamX;
        for I:=0 to iSvTam-1 do
        begin
          if ((iNumVez = 1) and (CharHor[I1+1,I+1] > 0)) or
             ((iNumVez = 2) and (CharVal[I1+1,I+1] > 0)) then
          begin
            TemValor[I1+1] := 'S';
            I2 := I2 + 1;
            break;
          end;
        end;
      end;

      case (iNumVez) of
        1 :
        begin
          Chart1.OpenDataEx(1,I2,iTamX);
          Chart1.ChartType := 2;

          case (rgFreq.ItemIndex) of
            0 : for I:=0 to iSvTam-1 do
                  Chart1.Legend[I] := MesCurto[I+1];
            1 : for I:=0 to iSvTam-1 do
                  Chart1.Legend[I] := IntToStr(spedAno1.Value + I);
          end;

          Chart1.Decimals := 0;
          Chart1.Title[2] := 'Estatística ' +TITULO1[iNumVez]+ ' Treinamento ' +
            rgTipoEst.Items[rgTipoEst.ItemIndex];
        end;
        2 :
        begin
          Chart2.OpenDataEx(1,I2,iTamX);
          Chart2.ChartType := 2;

          case (rgFreq.ItemIndex) of
            0 : for I:=0 to iSvTam-1 do
                  Chart2.Legend[I] := MesCurto[I+1];
            1 : for I:=0 to iSvTam-1 do
                  Chart2.Legend[I] := IntToStr(spedAno1.Value + I);
          end;

          Chart2.Decimals := 0;
          Chart2.Title[2] := 'Estatística ' +TITULO1[iNumVez]+ ' Treinamento ' +
            rgTipoEst.Items[rgTipoEst.ItemIndex];
        end;
      end;

      YMax := 0;
      I2 := 0;
      iQuantTotal := 0;
      iValorTotal := 0;
      iQuantTotal2 := 0;
      iValorTotal2 := 0;
      for I1:=0 to iTamY-1 do
      begin
        if (TemValor[I1+1] = 'S') then
        begin
          case (iNumVez) of
            1 :
            begin
              Chart1.ThisSerie := I2;
              Chart1.SerLeg[I2] := ListaDescricao[I1+1];
            end;
            2 :
            begin
              Chart2.ThisSerie := I2;
              Chart2.SerLeg[I2] := ListaDescricao[I1+1];
            end;
          end;  

          I2 := I2 + 1;
          iSvTam := iTamX;
          for I:=0 to iSvTam-1 do
          begin
            case (iNumVez) of
              1 :
              begin
                Chart1.Value[I] := CharHor[I1+1,I+1];
                if (rgTipoEst.ItemIndex < 4) then
                  iQuantTotal := iQuantTotal + CharHor[I1+1,I+1]
                else
                begin
                  if (I1 = 0) then
                    iQuantTotal := iQuantTotal + CharHor[I1+1,I+1]
                  else
                    iQuantTotal2 := iQuantTotal2 + CharHor[I1+1,I+1];
                end;
                if (Chart1.Value[I] > YMax) then
                  YMax := Chart1.Value[I];
              end;
              2 :
              begin
                Chart2.Value[I] := CharVal[I1+1,I+1];
                if (rgTipoEst.ItemIndex < 4) then
                  iValorTotal := iValorTotal + CharVal[I1+1,I+1]
                else
                begin
                  if (I1 = 0) then
                    iValorTotal := iValorTotal + CharVal[I1+1,I+1]
                  else
                    iValorTotal2 := iValorTotal2 + CharVal[I1+1,I+1];
                end;
                if (Chart2.Value[I] > YMax) then
                  YMax := Chart2.Value[I];
              end;
            end;
          end;
        end;
      end;

      case (iNumVez) of
        1 : Chart1.Title[3] := TITULO2[iNumVez] + IntToStr(iQuantTotal) +
            FU.IFF(rgTipoEst.ItemIndex < 4, '', ' vs '+ IntToStr(iQuantTotal2));
        2 : Chart2.Title[3] := TITULO2[iNumVez] + IntToStr(iValorTotal) +
            FU.IFF(rgTipoEst.ItemIndex < 4, '', ' vs '+ IntToStr(iValorTotal2));
      end;  

      I3 := 1;
      while (YMax > I3) do
        I3 := I3*10;

      I3 := Int(I3 / 20); // Escala de Y

      case (iNumVez) of
        1 :
        begin
          Chart1.Adm[1] := YMax; // Valor Máximo de Y
          Chart1.Adm[4] := I3; // Escala de Y
          Chart1.CloseData(1);
        end;
        2 :
        begin
          Chart2.Adm[1] := YMax; // Valor Máximo de Y
          Chart2.Adm[4] := I3; // Escala de Y
          Chart2.CloseData(1);
        end;
      end;
    end;

    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
    frmAguarde.Apaga;
    pgctrlGrafico.ActivePageIndex := 0;
    ExecutarIrPaginaResult;
  finally
    _CdsTipoEstat.Free;
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmSelEstTrein.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled :=
    ((rgFreq.ItemIndex = 0) and (spedAno1.Value = spedAno2.Value)) or
    ((rgFreq.ItemIndex = 1) and (spedAno1.Value <= spedAno2.Value) and
     (spedAno1.Value > spedAno2.Value-12));
end;

end.
