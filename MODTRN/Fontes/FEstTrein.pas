unit FEstTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3, Wwquery,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEstTrein = class(TfrmSelPessoal)
    ds2: TwwDataSource;
    tblHsttrn: TwwTable;
    tblCurso: TwwTable;
    ds3: TwwDataSource;
    tblGrptr: TwwTable;
    tblCargo2: TwwTable;
    tblHsttrnIDCURSO: TFloatField;
    tblHsttrnDATREINI: TDateTimeField;
    tblHsttrnDATREFIM: TDateTimeField;
    tblHsttrnDATPLINI: TDateTimeField;
    tblHsttrnDATPLFIM: TDateTimeField;
    tblHsttrnDUR_TEOR: TFloatField;
    tblHsttrnDUR_PRAT: TFloatField;
    tblHsttrnDUR_TOT: TFloatField;
    tblHsttrnFLGCONTROLE: TFloatField;
    tblHsttrnFLGAVALCURS: TFloatField;
    tblHsttrnAVALCURSO: TFloatField;
    tblHsttrnFLGAVALTEOR: TFloatField;
    tblHsttrnAVALTEOR: TFloatField;
    tblHsttrnFLGAVALPRAT: TFloatField;
    tblHsttrnAVALPRAT: TFloatField;
    tblHsttrnVALOR: TFloatField;
    tblHsttrnDESP_VIAG: TFloatField;
    tblHsttrnDESP_ESTAD: TFloatField;
    tblHsttrnDESP_OUTR: TFloatField;
    tblHsttrnTOT_CUSTO: TFloatField;
    tblHsttrnIDPESSOA: TFloatField;
    tblHsttrnIDENTIDINSTR: TFloatField;
    tblHsttrnNUMSEQ: TFloatField;
    bbtnGraf: TBitBtn;
    tblEstab2: TwwQuery;
    Chart2: TChartfx;
    Chart1: TChartfx;
    procedure FormCreate(Sender: TObject);
    procedure tblHsttrnCalcFields(DataSet: TDataSet);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnGrafClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstTrein: TfrmEstTrein;
  VEZ, J, TOTHOR, TOTVAL, TAM, TamY, SVTAM: integer;
  CharHor, CharVal, CODFIL, CODGRP, DESCTB, TEMVAL: variant;
  MATRIC, YMAX: double;
  Ano, Mes, Dia: word;
  MesCurto: array[1..12] of string[3] = ('Jan','Fev','Mar'
             ,'Abr','Mai','Jun','Jul','Ago','Set','Out'
             ,'Nov','Dez');
  TituTela1: array[1..2] of string = ('das Horas de','do Investimento em');
  TituTela2: array[1..2] of string = ('Total de Horas: ','Custo Total: ');

implementation

uses fSelEstTrein, uSistema;

{$R *.DFM}

procedure TfrmEstTrein.FormCreate(Sender: TObject);
begin
  inherited;
  tblEstab2.ParamByName('IdEmpresaProp').Value := Sistema.IdEmpresa;
  tblHsttrn.Open;

  if (frmSelEstTrein.rgTipoEst.ItemIndex = 0) then
  begin
    tblEstab2.Open;
    ds3.Dataset := tblEstab2;
  end
  else
  begin
    tblCargo2.Open;
    tblCurso.Open;
    tblGrptr.Open;
    ds3.Dataset := tblGrptr;
  end;
  rgSequencia.Visible   := false;
  cbxCandidatos.Enabled := false;
end;

procedure TfrmEstTrein.tblHsttrnCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblHsttrnTOT_CUSTO.Value := tblHsttrnVALOR.Value + tblHsttrnDESP_VIAG.Value +
    tblHsttrnDESP_ESTAD.Value + tblHsttrnDESP_OUTR.Value;
end;

procedure TfrmEstTrein.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult         := mrNone;
  rgSequencia.Visible := false;
  Chart1.Visible      := false;
  Chart2.Visible      := false;
  bbtnGraf.Visible    := false;
end;

procedure TfrmEstTrein.bbtnGrafClick(Sender: TObject);
begin
  inherited;
  Chart1.Visible := not(Chart1.Visible);
  Chart2.Visible := not(Chart2.Visible);
end;

procedure TfrmEstTrein.bbtnConfirmarClick(Sender: TObject);
var
  IND, IND1, I, I1, I2: integer;
  I3: double;
  S: string;
begin
  inherited;
  ModalResult := mrNone;
  TAM  := 12;
  TamY := 0;
  if (frmSelEstTrein.rgTipoEst.ItemIndex = 0) and (rgSelEstab.ItemIndex = 1) then
    TamY := lstEstab.Items.Count
  else
  begin
    ds3.Dataset.First;
    while not(ds3.Dataset.EOF) do
    begin
      TamY := TamY + 1;
      ds3.Dataset.Next;
    end;
  end;

  if (frmSelEstTrein.rgTipoEst.ItemIndex = 0) then
    CODFIL := VarArrayCreate([1, TamY], varInteger)
  else
    CODGRP := VarArrayCreate([1, TamY], varOleStr);

  DESCTB := VarArrayCreate([1, TamY], varOleStr);
  TEMVAL := VarArrayCreate([1, TamY], varOleStr);
  IND1   := 0;
  if (frmSelEstTrein.rgTipoEst.ItemIndex = 0) and (rgSelEstab.ItemIndex = 1) then
  begin
    for IND:=1 to TamY do
    begin
      CODFIL[IND] := StrToInt(lstCodEstab.Items[IND-1]);
      DESCTB[IND] := lstEstab.Items[IND-1];
    end;
  end
  else
  begin
    ds3.Dataset.First;
    while not(ds3.Dataset.EOF) do
    begin
      IND1 := IND1 + 1;
      if (frmSelEstTrein.rgTipoEst.ItemIndex = 0) then
      begin
        CODFIL[IND1] := tblEstab2.FieldByName('IDPESSOA').Value;
        DESCTB[IND1] := tblEstab2.FieldByName('NOME').Value;
      end
      else
      begin
        CODGRP[IND1] := tblGrptr.FieldByName('CODGRPTREIN').Value;
        DESCTB[IND1] := tblGrptr.FieldByName('DESCGRPTREIN').Value;
      end;
      ds3.Dataset.Next;
    end;
  end;

  DecodeDate(Date, Ano, Mes, Dia);
  if (frmSelEstTrein.rgFreq.ItemIndex = 0) and (frmSelEstTrein.spedAno1.Value = Ano) then
    TAM := Mes;

  if (frmSelEstTrein.rgFreq.ItemIndex = 1) then
    TAM := frmSelEstTrein.spedAno2.Value - frmSelEstTrein.spedAno1.Value + 1;

  CharHor := VarArrayCreate([1, TamY, 1, TAM], varInteger);
  for I1:=1 to TamY do
    for I2:=1 to TAM do
      CharHor[I1,I2] := 0;

  CharVal := VarArrayCreate([1, TamY, 1, TAM], varInteger);

  for I1:=1 to TamY do
    for I2:=1 to TAM do
      CharVal[I1,I2] := 0;

  while not(tblPessoal.EOF) do
  begin
    tblHsttrn.First;
    while not(tblHsttrn.EOF) do
    begin
      DecodeDate(tblHsttrnDATREFIM.Value, Ano, Mes, Dia);

      if (Ano >= frmSelEstTrein.spedAno1.Value) and
         (Ano <= frmSelEstTrein.spedAno2.Value) and
         ((frmSelEstTrein.rgFreq.ItemIndex = 1) or (Mes <= TAM)) and
         (tblHsttrnFLGCONTROLE.Value = 1) then
      begin
        for IND:=1 to TamY do
        begin
          // Rotina para determinar o ponteiro onde vai somar
          if (frmSelEstTrein.rgTipoEst.ItemIndex = 0) and
             (tblPessoal.FieldByName('IDESTAB').Value = CODFIL[IND]) then
            break;

          if (frmSelEstTrein.rgTipoEst.ItemIndex = 1) and
             (tblCargo2.FieldByName('CODGRPTREIN').Value = CODGRP[IND]) then
            break;

          if (frmSelEstTrein.rgTipoEst.ItemIndex = 2) and
             (tblCurso.FieldByName('CODGRPTREIN').Value = CODGRP[IND]) then
            break;
        end;
        if (TamY > 0) and (IND <= TamY) then
          if (frmSelEstTrein.rgFreq.ItemIndex = 0) then
          begin
            CharHor[IND,MES] := CharHor[IND,MES] + tblHsttrnDUR_TOT.Value;
            CharVal[IND,MES] := CharVal[IND,MES] + tblHsttrnTOT_CUSTO.Value;
          end
          else
          begin
            CharHor[IND,Ano - frmSelEstTrein.spedAno1.Value + 1] :=
              CharHor[IND,Ano - frmSelEstTrein.spedAno1.Value + 1] +
              tblHsttrnDUR_TOT.Value;
            CharVal[IND,Ano - frmSelEstTrein.spedAno1.Value + 1] :=
              CharVal[IND,Ano - frmSelEstTrein.spedAno1.Value + 1] +
              tblHsttrnTOT_CUSTO.Value;
          end;
      end;
      tblHsttrn.Next;
    end;
    tblPessoal.Next;
  end;

  for VEZ:=1 to 2 do
  begin
    SVTAM := TAM;
    I2    := 0;
    for I1:=0 to (TamY - 1) do
      TEMVAL[I1+1] := ' ';
     for I1:=0 to (TamY - 1) do
    begin
      SVTAM := TAM;
      for I:=0 to (SVTAM - 1) do
      begin
        if ((VEZ = 1) and (CharHor[I1+1,I+1] > 0)) or ((VEZ = 2) and (CharVal[I1+1,I+1] > 0)) then
        begin
          TEMVAL[I1+1] := 'S';
          I2 := I2 + 1;
          break;
        end;
      end;
    end;

    if (VEZ = 1) then
    begin
      Chart1.OpenDataEx({COD_VALUES}1,I2,TAM);
      Chart1.ChartType := 2;
      if (frmSelEstTrein.rgFreq.ItemIndex = 0) then
        for I:=0 to (SVTAM-1) do
          Chart1.Legend[I] := MesCurto[I+1];

      if (frmSelEstTrein.rgFreq.ItemIndex = 1) then
        for I:=0 to (SVTAM-1)  do
        begin
          str(frmSelEstTrein.spedAno1.Value + I, S);
          Chart1.Legend[I] := S;
        end;

        Chart1.Decimals  := 0;
        Chart1.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[VEZ] + ' Treinamento ' +
        frmSelEstTrein.rgTipoEst.Items[frmSelEstTrein.rgTipoEst.ItemIndex];
    end;

    if (VEZ = 2) then
    begin
      Chart2.OpenDataEx({COD_VALUES}1,I2,TAM);
      Chart2.ChartType := 2;
      if (frmSelEstTrein.rgFreq.ItemIndex = 0) then
        for I:=0 to (SVTAM-1) do Chart2.Legend[I] := MesCurto[I+1];

      if (frmSelEstTrein.rgFreq.ItemIndex = 1) then
        for  I := 0  to  (SVTAM-1)  do
        begin
          str(frmSelEstTrein.spedAno1.Value + I, S);
          Chart2.Legend[I] := S;
        end;

      Chart2.Decimals  := 0;
      Chart2.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[VEZ] + ' Treinamento ' +
        frmSelEstTrein.rgTipoEst.Items[frmSelEstTrein.rgTipoEst.ItemIndex];
    end;

    YMAX   := 0;
    I2     := 0;
    TOTHOR := 0;
    TOTVAL := 0;
    for I1:=0 to (TamY - 1) do
    begin
      if (TEMVAL[I1+1] = 'S') then
      begin
        if (VEZ = 1) then
        begin
          Chart1.ThisSerie  := I2;
          Chart1.SerLeg[I2] := DESCTB[I1+1];
        end;

        if (VEZ = 2) then
        begin
          Chart2.ThisSerie  := I2;
          Chart2.SerLeg[I2] := DESCTB[I1+1];
        end;

        I2 := I2 + 1;
        SVTAM := TAM;
        for I:=0 to (SVTAM - 1) do
        begin
          if (VEZ = 1) then
            Chart1.Value[I] := CharHor[I1+1,I+1]
          else
            Chart2.Value[I] := CharVal[I1+1,I+1];

          if (VEZ = 1) then
            TOTHOR := TOTHOR + CharHor[I1+1,I+1]
          else
            TOTVAL := TOTVAL + CharVal[I1+1,I+1];

          if (VEZ = 1) then
            if (Chart1.Value[I] > YMAX) then
              YMAX := Chart1.Value[I];

          if (VEZ = 2) then
            if (Chart2.Value[I] > YMAX) then
              YMAX := Chart2.Value[I];
        end;
      end;
    end;

    if (VEZ = 1) then
    begin
      str(TOTHOR,S);
      Chart1.Title[{BOTTOMTIT}3] := TituTela2[VEZ] + S;
    end
    else
    begin
      str(TOTVAL,S);
      Chart2.Title[{BOTTOMTIT}3] := TituTela2[VEZ] + S;
    end;

    I3 := 1;
    while (YMAX > I3) do
      I3 := I3*10;
    I3 := int(I3 / 20);      {Escala de Y}

    if (VEZ = 1) then
    begin
      Chart1.Adm[1] := YMAX;    {Valor Máximo de Y}
      Chart1.Adm[4] := I3;      {Escala de Y}
      Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
      Chart1.Visible := true;
    end
    else
    begin
      Chart2.Adm[1] := YMAX;    {Valor Máximo de Y}
      Chart2.Adm[4] := I3;      {Escala de Y}
      Chart2.CloseData({COD_VALUES}1);   {Close the VALUES channel}
      Chart2.Visible := false;
    end;
  end;

  bbtnGraf.Visible := true;
end;

end.
