unit FEstProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  OleCtrls, chartfx3, Wwquery, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, fSairAjuda,
  uRegra, IvEMulti;

type
  TfrmEstProcesso = class(TfrmSairAjuda)
    Chart1: TChartfx;
    Chart2: TChartfx;
    bbtnGraf: TBitBtn;
    ds2: TwwDataSource;
    tblObjeto: TwwTable;
    qryIn: TwwQuery;
    Regra: TRegra;
    procedure bbtnGrafClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmEstProcesso: TfrmEstProcesso;
  Vez, J, TotHor, TotVal, Tam, TamY, SvTam: integer;
  CharHor, CharVal: variant;
  Ano, Mes, Dia, Ano1, Mes1, Dia1: word;
  YMax: double;
  MesCurto: array[1..12] of string[3] = (
    'Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez');
  TituTela1: array[1..2] of string = ('da Quantidade de','do Custo dos');
  TituTela2: array[1..2] of string = ('Quantidade Total: ','Custo Total: ');

implementation

uses fSelEstProc, uValorAtual;

{$R *.DFM}

procedure TfrmEstProcesso.FormCreate(Sender: TObject);
var
  Ind, Ind1, I, I1, I2: integer;
  ValorReclamado, ValorReal, I3: double;
  S: string;
  bAnual: boolean;
begin
  inherited;
  // Atribuo componentes Regra do Form para o Cálculo
  compRegra  := Regra;
  qryInRegra := qryIn;

  tblObjeto.Open;
  DecodeDate(frmSelEstProc.EdDataNot1.Date, Ano, Mes, Dia);
  DecodeDate(frmSelEstProc.EdDataNot2.Date, Ano1, Mes1, Dia1);
  ModalResult := mrNone;
  bAnual := True;
  Tam := Ano1-Ano+1;
  if (Tam > 12) then
    Tam := 12
  else
  if (Tam = 1) then
  begin
    Tam    := Mes1-Mes+1;
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

  frmSelEstProc.qryProcesso.First;
  while not(frmSelEstProc.qryProcesso.EOF) do
  begin
    if (Trim(frmSelEstProc.qryProcesso.FieldByName('DATADEMISSAO').asString) <> '') then
      DecodeDate(frmSelEstProc.qryProcesso.FieldByName('DATADEMISSAO').Value, Ano, Mes, Dia)
    else
    if (Trim(frmSelEstProc.qryProcesso.FieldByName('DATANOTIF').asString) <> '') then
      DecodeDate(frmSelEstProc.qryProcesso.FieldByName('DATANOTIF').Value, Ano, Mes, Dia)
    else
      DecodeDate(Date, Ano, Mes, Dia);

    if (Trim(frmSelEstProc.qryProcesso.FieldByName('DATAEFETENC').asString) <> '') and
       (frmSelEstProc.qryProcesso.FieldByName('FLGSITPROC').asInteger = 1)  and
       (frmSelEstProc.rgDataEncer.ItemIndex = 1) then
      DecodeDate(frmSelEstProc.qryProcesso.FieldByName('DATAEFETENC').Value, Ano, Mes, Dia);

    if (bAnual) and (Ano1-Ano+1 > Tam) then
    begin
      frmSelEstProc.qryProcesso.Next;
      Continue;
    end;

    if (bAnual) then
      Ind := Tam+Ano-Ano1  else  Ind := Tam+Mes-Mes1;

    Ind1 := frmSelEstProc.qryProcesso.FieldByName('FLGSITPROC').asInteger + 1;
    CharHor[3,Ind]    := CharHor[3,Ind] + 1;
    CharHor[Ind1,Ind] := CharHor[Ind1,Ind] + 1;

    tblObjeto.First;
    while not(tblObjeto.EOF) do
    begin
      ValorReclamado := ValorAtual(tblObjeto.FieldByName('VALORRECL').asFloat,
        Trim(frmSelEstProc.qryProcesso.FieldByName('DATADEMISSAO').asString),
        frmSelEstProc.qryProcesso.FieldByName('MOEDAPROCTRAB').asString,
        frmSelEstProc.qryProcesso.FieldByName('IDREGRA').asString,
        frmSelEstProc.qryProcesso.FieldByName('NUMPROCTRAB').asString,
        frmSelEstProc.qryProcesso.FieldByName('INDTAXACONV').asInteger);
      ValorReal := ValorAtual(tblObjeto.FieldByName('VALORSENTENCA').asFloat,
        Trim(frmSelEstProc.qryProcesso.FieldByName('DATAEFETENC').asString),
        frmSelEstProc.qryProcesso.FieldByName('MOEDAPROCTRAB').asString,
        frmSelEstProc.qryProcesso.FieldByName('IDREGRA').asString,
        frmSelEstProc.qryProcesso.FieldByName('NUMPROCTRAB').asString,
        frmSelEstProc.qryProcesso.FieldByName('INDTAXACONV').asInteger);

      if (Ind1 <> 2) then
      begin
        CharVal[1,Ind] := CharVal[1,Ind] + ValorReclamado -
          ((100 - tblObjeto.FieldByName('PERCPROB').asFloat) * ValorReclamado / 100);
        CharVal[2,Ind] := CharVal[2,Ind] +  ValorReclamado;
      end
      else
        CharVal[3,Ind] := CharVal[3,Ind] +  ValorReal;
      tblObjeto.Next;
    end;
    frmSelEstProc.qryProcesso.Next;
  end;

  for Vez:=1 to 2 do
  begin
    SvTam := Tam;
    I2 := 3;

    if (Vez = 1) then
    begin
      Chart1.OpenDataEx({COD_VALUES}1,I2,Tam);
      Chart1.ChartType := 2;
      if not(bAnual) then
        for I:=1 to Tam do
          Chart1.Legend[I-1] := MesCurto[Mes1-Tam+I];
      if (bAnual) then
        for I:=1 to Tam do
        begin
          str(Ano1-Tam+I, S);
          Chart1.Legend[I-1] := S;
        end;

      Chart1.Decimals := 0;
      Chart1.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[Vez] + ' Processos';
    end;

    if (Vez = 2) then
    begin
      Chart2.OpenDataEx({COD_VALUES}1,I2,Tam);
      Chart2.ChartType := 2;
      if not(bAnual) then
        for I:=1 to Tam do
          Chart2.Legend[I-1] := MesCurto[Mes1-Tam+I];

      if (bAnual) then
        for I:=1 to Tam do
        begin
          str(Ano1-Tam+I, S);
          Chart2.Legend[I-1] := S;
        end;

      Chart2.Decimals  := 0;
      Chart2.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[Vez] + ' Processos';
    end;
    YMax := 0;
    I2 := 0;
    TOTHOR := 0;
    TOTVAL := 0;
    for I1:=0 to (TamY-1) do
    begin
      if (Vez = 1) then
      begin
        Chart1.ThisSerie := I1;
        case (I1) of
          0 : Chart1.SerLeg[I1] := 'Abertos';
          1 : Chart1.SerLeg[I1] := 'Encerrados';
          2 : Chart1.SerLeg[I1] := 'Total';
        end;
      end;

      if (Vez = 2) then
      begin
        Chart2.ThisSerie := I1;
        case (I1) of
          0 : Chart2.SerLeg[I1]  := 'Risco Provável';
          1 : Chart2.SerLeg[I1]  := 'Risco Máximo';
          2 : Chart2.SerLeg[I1]  := 'Encerrados';
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
            TOTHOR := TOTHOR + CharHor[I1+1,I+1];
        end
        else
          TOTVAL := TOTVAL + CharVal[I1+1,I+1];

        if (Vez = 1) then
          if (Chart1.Value[I] > YMax) then
            YMax := Chart1.Value[I];

        if (Vez = 2) then
          if (Chart2.Value[I] > YMax) then
            YMax := Chart2.Value[I];
      end;
    end;

    if (Vez = 1) then
    begin
      str(TOTHOR,S);
      Chart1.Title[{BOTTOMTIT}3] := TituTela2[Vez] + S;
    end
    else
    begin
      str(TOTVAL,S);
      Chart2.Title[{BOTTOMTIT}3] := TituTela2[Vez] + S;
    end;

    I3 := 1;
    while (YMax > I3) do
      I3 := I3*10;
    I3 := int(I3 / 20);      {Escala de Y}

    if (Vez = 1) then
    begin
      Chart1.Adm[1] := YMax;    {Valor Máximo de Y}
      Chart1.Adm[4] := I3;      {Escala de Y}
      Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
      Chart1.Visible := True;
    end
    else
    begin
      Chart2.Adm[1] := YMax;    {Valor Máximo de Y}
      Chart2.Adm[4] := I3;      {Escala de Y}
      Chart2.CloseData({COD_VALUES}1);   {Close the VALUES channel}
      Chart2.Visible := false;
    end;
  end;

  bbtnGraf.Visible := true;
  bbtnGraf.Visible := true;
end;

procedure TfrmEstProcesso.bbtnGrafClick(Sender: TObject);
begin
  inherited;
  Chart1.Visible := not Chart1.Visible;
  Chart2.Visible := not Chart2.Visible;
end;

end.
