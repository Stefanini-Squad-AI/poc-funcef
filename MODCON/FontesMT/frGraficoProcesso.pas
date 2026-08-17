unit frGraficoProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, OleCtrls, chartfx3,
  ComCtrls, Db, DBClient, uCMClientDataSet, uCtrlProcessoTrab, uCtrlCustomProcTrab;

type
  TframeGraficoProcesso = class(TFrame)
    pgctrlGrafico: TPageControl;
    tbshQuant: TTabSheet;
    tbshCusto: TTabSheet;
    CdsObj: TCMClientDataSet;
    Chart1: TChartfx;
    Chart2: TChartfx;
  private
    FCtrlProcessoTrab: TCtrlProcessoTrab;
    FCtrlCustomProcTrab: TCtrlCustomProcTrab;
    FCdsProcesso: TCMClientDataSet;
    FConsiderarDataEncerramento: boolean;
    FDataNot1, FDataNot2: string;
  public
    procedure GerarGrafico;

    property CdsProcesso: TCMClientDataSet read FCdsProcesso write FCdsProcesso;
    property DataNot1: string read FDataNot1 write FDataNot1;
    property DataNot2: string read FDataNot2 write FDataNot2;
    property ConsiderarDataEncerramento: boolean read FConsiderarDataEncerramento write FConsiderarDataEncerramento;
    property CtrlProcessoTrab: TCtrlProcessoTrab read FCtrlProcessoTrab write FCtrlProcessoTrab;
    property CtrlCustomProcTrab: TCtrlCustomProcTrab read FCtrlCustomProcTrab write FCtrlCustomProcTrab;
  end;

implementation

uses uSistema, fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

procedure TframeGraficoProcesso.GerarGrafico;
const
  TITULO1: array[1..2] of string = ('da Quantidade de', 'do Custo dos');
  TITULO2: array[1..2] of string = ('Quantidade Total:', 'Custo Total:');
var
  CharHor, CharVal: variant;
  DataHist1, DataHist2: TDateTime;
  bAnual: boolean;
  sNomeCampo: string;
  wAno, wMes, wDia, wAno1, wMes1, wDia1: word;
  dYMax, dValorReclamado, dValorReal, I3: double;
  Vez, J, TotHor, TotVal, Tam, TamY, SvTam, Ind, Ind1, I, I1, I2: integer;
begin
  frmAguarde.Max := FCdsProcesso.RecordCount;
  frmAguarde.Update;

  if (Sistema.IdModulo = PROCPREV) then
    sNomeCampo := 'DATADEMISSAO'
  else
  if (Sistema.IdModulo = PROCJUD) or (Sistema.IdModulo = 719) then
    sNomeCampo := 'DATANOTIF'
  else
    sNomeCampo := 'DATADESLIGAMENTO';

  if (DataNot1 <> '') then
    DecodeDate(StrToDate(DataNot1), wAno, wMes, wDia)
  else
  begin
    wAno := 0;
    wMes := 0;
    wDia := 0;
  end;

  if (DataNot2 <> '') then
    DecodeDate(StrToDate(DataNot2), wAno1, wMes1, wDia1)
  else
  begin
    wAno1 := 0;
    wMes1 := 0;
    wDia1 := 0;
  end;

  bAnual := true;
  Tam := wAno1-wAno+1;
  if (Tam > 12) then
    Tam := 12
  else
  if (Tam = 1) then
  begin
    Tam := wMes1-wMes+1;
    bAnual := false;
  end;
  TamY := 3;

  CharHor := VarArrayCreate([1, TamY, 1, Tam], varInteger);
  for I1:=1 to TamY do
    for I2:=1 to Tam do
      CharHor[I1,I2] := 0;

  CharVal := VarArrayCreate([1, TamY, 1, Tam], varInteger);
  for I1:=1 to TamY do
    for I2:=1 to Tam do
      CharVal[I1,I2] := 0;

  FCdsProcesso.First;
  while not(FCdsProcesso.EOF) do
  begin
    if (Sistema.IdModulo = PROCPREV) and
       (FCdsProcesso.FieldByName('DATADEMISSAO').asString <> '') then
      DecodeDate(FCdsProcesso.FieldByName('DATADEMISSAO').asDateTime, wAno, wMes, wDia)
    else
    if (FCdsProcesso.FieldByName('DATANOTIF').asString <> '') then
      DecodeDate(FCdsProcesso.FieldByName('DATANOTIF').asDateTime, wAno, wMes, wDia)
    else
      DecodeDate(Date, wAno, wMes, wDia);

    if (FCdsProcesso.FieldByName('DATAEFETENC').asString <> '') and
       (FCdsProcesso.FieldByName('FLGSITPROC').asInteger = 1) and
       (FConsiderarDataEncerramento) then
      DecodeDate(FCdsProcesso.FieldByName('DATAEFETENC').asDateTime, wAno, wMes, wDia);

    if (bAnual) and (wAno1-wAno+1 > Tam) then
    begin
      FCdsProcesso.Next;
      frmAguarde.Pos := frmAguarde.Pos + 1;
      frmAguarde.Update;
      continue;
    end;

    if (bAnual) then
      Ind := Tam+wAno-wAno1
    else
      Ind := Tam+wMes-wMes1;

    Ind1 := FCdsProcesso.FieldByName('FLGSITPROC').asInteger + 1;
    CharHor[3,Ind] := CharHor[3,Ind] + 1;
    CharHor[Ind1,Ind] := CharHor[Ind1,Ind] + 1;

    if (FCdsProcesso.FieldByName(sNomeCampo).asString = '') then
    begin
      DataHist1 := 0;
      if (Sistema.IdModulo = MODCON) and
         (FCdsProcesso.FieldByName('DATANOTIF').asString <> '') then
        DataHist1 := StrToDate(Copy(FCdsProcesso.FieldByName('DATANOTIF').asString,1,Length(ShortDateFormat)));
    end
    else
      DataHist1 := StrToDate(Copy(FCdsProcesso.FieldByName(sNomeCampo).asString,1,Length(ShortDateFormat)));

    if (FCdsProcesso.FieldByName('DATAEFETENC').asString = '') then
      DataHist2 := 0
    else
      DataHist2 := StrToDate(Copy(FCdsProcesso.FieldByName('DATAEFETENC').asString,1,Length(ShortDateFormat)));

    CdsObj.Data := FCtrlProcessoTrab.ListObjeto(CdsProcesso.FieldByName('NUMPROCTRAB').asFloat);
    while not(CdsObj.EOF) do
    begin
      dValorReclamado :=
        FCtrlCustomProcTrab.GetValorAtual(
          CdsObj.FieldByName('VALORRECL').asFloat,
          DataHist1,
          FCdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
          FCdsProcesso.FieldByName('IDREGRA').asFloat,
          FCdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
          FCdsProcesso.FieldByName('INDTAXACONV').asInteger);
          
      dValorReal :=
        FCtrlCustomProcTrab.GetValorAtual(
          CdsObj.FieldByName('VALORSENTENCA').asFloat,
          DataHist2,
          FCdsProcesso.FieldByName('MOEDAPROCTRAB').asInteger,
          FCdsProcesso.FieldByName('IDREGRA').asFloat,
          FCdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
          FCdsProcesso.FieldByName('INDTAXACONV').asInteger);

      if (Ind1 <> 2) then
      begin
        CharVal[1,Ind] := CharVal[1,Ind] + dValorReclamado -
          ((100 - CdsObj.FieldByName('PERCPROB').asFloat) * dValorReclamado / 100);
        CharVal[2,Ind] := CharVal[2,Ind] +  dValorReclamado;
      end
      else
        CharVal[3,Ind] := CharVal[3,Ind] +  dValorReal;

      CdsObj.Next;
    end;
    FCdsProcesso.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;

  for Vez:=1 to 2 do
  begin
    I2 := 3;

    case (Vez) of
      1 :
      begin
        Chart1.OpenDataEx(1,I2,Tam);
        Chart1.ChartType := 2;
        if not(bAnual) then
          for I:=1 to Tam do
            Chart1.Legend[I-1] := MesCurto[wMes1-Tam+I];

        if (bAnual) then
          for I:=1 to Tam do
            Chart1.Legend[I-1] := IntToStr(wAno1-Tam+I);

        Chart1.Decimals := 0;
        Chart1.Title[2] := 'Estatística ' +TITULO1[Vez]+ ' Processos';
      end;
      2 :
      begin
        Chart2.OpenDataEx(1,I2,Tam);
        Chart2.ChartType := 2;
        if not(bAnual) then
          for I:=1 to Tam do
            Chart2.Legend[I-1] := MesCurto[wMes1-Tam+I];

        if (bAnual) then
          for I:=1 to Tam do
            Chart2.Legend[I-1] := IntToStr(wAno1-Tam+I);

        Chart2.Decimals := 0;
        Chart2.Title[2] := 'Estatística ' +TITULO1[Vez]+ ' Processos';
      end;
    end;
    
    dYMax := 0;
    TotHor := 0;
    TotVal := 0;
    for I1:=0 to (TamY-1) do
    begin
      case (Vez) of
        1 :
        begin
          Chart1.ThisSerie := I1;
          case (I1) of
            0 : Chart1.SerLeg[I1] := 'Abertos';
            1 : Chart1.SerLeg[I1] := 'Encerrados';
            2 : Chart1.SerLeg[I1] := 'Total';
          end;
        end;
        2 :
        begin
          Chart2.ThisSerie := I1;
          case (I1) of
            0 : Chart2.SerLeg[I1] := 'Risco Provável';
            1 : Chart2.SerLeg[I1] := 'Risco Máximo';
            2 : Chart2.SerLeg[I1] := 'Encerrados';
          end;
        end;
      end;
      
      SvTam := Tam;
      for I:=0 to (SvTam-1) do
      begin
        if (Vez = 1) then
          Chart1.Value[I] := CharHor[I1+1,I+1]
        else
          Chart2.Value[I] := CharVal[I1+1,I+1];

        if (Vez = 1) then
        begin
          if (I1 = 2) then
            TotHor := TotHor + CharHor[I1+1,I+1];
        end
        else
          TotVal := TotVal + CharVal[I1+1,I+1];

        if (Vez = 1) then
          if (Chart1.Value[I] > dYMax) then
            dYMax := Chart1.Value[I];

        if (Vez = 2) then
          if (Chart2.Value[I] > dYMax) then
            dYMax := Chart2.Value[I];
      end;
    end;

    if (Vez = 1) then
      Chart1.Title[3] := TITULO2[Vez] + IntToStr(TotHor)
    else
      Chart2.Title[3] := TITULO2[Vez] + IntToStr(TotVal);

    I3 := 1;
    while (dYMax > I3) do
      I3 := I3*10;
    I3 := Int(I3 / 20); // Escala de Y

    if (Vez = 1) then
    begin
      Chart1.Adm[1] := dYMax; // Valor Máximo de Y
      Chart1.Adm[4] := I3;    // Escala de Y
      Chart1.CloseData(1);
    end
    else
    begin
      Chart2.Adm[1] := dYMax; // Valor Máximo de Y
      Chart2.Adm[4] := I3;    // Escala de Y
      Chart2.CloseData(1);
    end;
  end;

  frmAguarde.Apaga;
end;

end.
