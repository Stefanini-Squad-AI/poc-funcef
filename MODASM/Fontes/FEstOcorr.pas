unit FEstOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3, Wwquery,
  TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEstOcorr = class(TfrmSelPessoal)
    ds3: TwwDataSource;
    Chart1: TChartfx;
    Chart2: TChartfx;
    ds2: TwwDataSource;
    tblHstasm: TwwTable;
    qryTabOcorr: TwwQuery;
    bbtnGraf: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnGrafClick(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstOcorr: TfrmEstOcorr;
  TAM, TAMY, SVTAM : Integer;
  CharQtd : Variant;
  CharTot : Variant;
  CODOCO : Variant;
  DESCTB : Variant;
  TEMVAL : Variant;
  Ano, Mes, Dia : Word;
  YMAX : Double;
  YMAX2 : Double;
  J, TOTHOR, TOTVAL : Integer;
  MesCurto : Array[1..12] of string[3] = ('Jan','Fev','Mar'
             ,'Abr','Mai','Jun','Jul','Ago','Set','Out'
             ,'Nov','Dez');
  TituTela : Array[1..1] of string = ('Número de Ocorrências: ');

implementation

uses FSelEstOcorr;

{$R *.DFM}


procedure TfrmEstOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  ds3.Dataset.Open;
  ds2.Dataset.Open;
end;

procedure TfrmEstOcorr.bbtnGrafClick(Sender: TObject);
begin
  inherited;
  Chart1.Visible := not Chart1.Visible;
  Chart2.Visible := not Chart2.Visible;
end;

procedure TfrmEstOcorr.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  rgSequencia.Visible := False;
  Chart1.Visible := False;
  Chart2.Visible := False;
  bbtnGraf.Visible := False;
end;



procedure TfrmEstOcorr.bbtnConfirmarClick(Sender: TObject);
var
  I, I1, I2 : Integer;
  I3 : Double;
  S, S1, S2 : String;
  IND, IND1 : Integer;
begin
  inherited;
  ModalResult := mrNone;
  TAM := 12;
  TAMY := 0;
  if  (frmSelEstOcorr.rgSelTudo.ItemIndex = 1)
  then TAMY := frmSelEstOcorr.lstOcorr.Items.Count
  else begin
       ds3.Dataset.First;
       while not ds3.Dataset.Eof  do begin
             TAMY := TAMY + 1;
             ds3.Dataset.Next;
       end;
  end;

  CODOCO := VarArrayCreate([1, TAMY], varInteger);
  DESCTB := VarArrayCreate([1, TAMY], varOleStr);
  TEMVAL := VarArrayCreate([1, TAMY], varOleStr);
  IND1 := 0;
  if  (frmSelEstOcorr.rgSelTudo.ItemIndex = 1)  then  begin
      for IND := 1  to  TAMY  do begin
          qryTabOcorr.Close;
          qryTabOcorr.SQL.Clear;
          qryTabOcorr.SQL.Add('Select * from TIPOCMED ');
          qryTabOcorr.SQL.Add('where DESCRTIPOOCMED = ');
          qryTabOcorr.SQL.Add(char(39) +
                    frmSelEstOcorr.lstOcorr.Items[IND-1] + char(39));
          qryTabOcorr.SQL.Add(' order by DESCRTIPOOCMED');
          qryTabOcorr.Open;
          CODOCO[IND] := qryTabOcorr.FieldByName('CODTIPOOCMED').Value;
          DESCTB[IND] := qryTabOcorr.FieldByName('DESCRTIPOOCMED').Value;
      end;
  end
  else begin
       ds3.Dataset.First;
       while not ds3.Dataset.Eof  do begin
          IND1 := IND1 + 1;
          CODOCO[IND1] := qryTabOcorr.FieldByName('CODTIPOOCMED').Value;
          DESCTB[IND1] := qryTabOcorr.FieldByName('DESCRTIPOOCMED').Value;
          ds3.Dataset.Next;
       end;
  end;

  DecodeDate(Date, Ano, Mes, Dia);
  if  (frmSelEstOcorr.rgFreq.ItemIndex = 0)  and
      (frmSelEstOcorr.spedAno1.Value = Ano)  then  TAM := Mes;
  if  (frmSelEstOcorr.rgFreq.ItemIndex = 1)  then
      TAM := frmSelEstOcorr.spedAno2.Value - frmSelEstOcorr.spedAno1.Value + 1;
  CharQtd := VarArrayCreate([1, TAMY, 1, TAM], varInteger);
  CharTot := VarArrayCreate([1, TAMY], varInteger);
  tblPessoal.Filtered := False;
  tblPessoal.First;
  tblPessoal.Filtered := True;

  While Not tblPessoal.Eof Do begin
      tblHstasm.First;
      while  (not tblHstasm.Eof) do begin
         if  tblHstasm.FieldByName('DATAREAL').Value = Null then begin
             tblHstasm.Next;
             Continue;
         end;
         DecodeDate(tblHstasm.FieldByName('DATAREAL').Value, Ano, Mes, Dia);
         if (Ano >= frmSelEstOcorr.spedAno1.Value) and
            (Ano <= frmSelEstOcorr.spedAno2.Value) then
         begin
            for  IND := 1  to  TAMY  do
              {Rotina para determinar o ponteiro onde vai somar}
              if  (tblHstasm.FieldByName('CODTIPOOCMED').Value = CODOCO[IND]) then
                   break;

            if  IND <= TAMY  then  begin
              if  (frmSelEstOcorr.rgFreq.ItemIndex = 0)  then
                   CharQtd[IND,MES] := CharQtd[IND,MES] + 1
              else
                   CharQtd[IND,Ano - frmSelEstOcorr.spedAno1.Value + 1] :=
                   CharQtd[IND,Ano - frmSelEstOcorr.spedAno1.Value + 1] + 1;
              CharTot[IND] := CharTot[IND] + 1;
            end;
         end;
         tblHstasm.Next;
      end;
      tblPessoal.Next;
  end;


   SVTAM := TAM;
   I2 := 0;
   For  I1 := 0  to  (TAMY - 1) do  TEMVAL[I1+1] := ' ';
   For  I1 := 0  to  (TAMY - 1) do
      begin
        SVTAM := TAM;
        For  I := 0  to  (SVTAM - 1) do
          begin
       	    if (CharQtd[I1+1,I+1] > 0)  then
               begin
                  TEMVAL[I1+1] := 'S';
                  I2 := I2 + 1;
                  break;
               end;
          end;
      end;

   // Preparar os gráficos
      if I2 = 0  then  I2 := 1; // Para enganar o 'bug'
      Chart1.OpenDataEx({COD_VALUES}1,I2,TAM);
      Chart1.ChartType := 2;

      if  (frmSelEstOcorr.rgFreq.ItemIndex = 0)  then
        for  I := 0  to  (SVTAM-1)  do  Chart1.Legend[I] := MesCurto[I+1];
      if  (frmSelEstOcorr.rgFreq.ItemIndex = 1)  then
        for  I := 0  to  (SVTAM-1)  do
           begin
             str(frmSelEstOcorr.spedAno1.Value + I, S);
             Chart1.Legend[I] := S;
           end;


   Chart1.Decimals  := 0;

   str(frmSelEstOcorr.spedAno1.Value, S1);
   str(frmSelEstOcorr.spedAno2.Value, S2);
   if S1 <> S2  then  S := S1 + ' a ' + S2  else  S := S1;
   Chart1.Title[{TOPTIT}2] := 'Estatística de Ocorrências Médicas ' +
               ' (' + S + ')';

   YMAX := 0;
   I2 := 0;
   TOTHOR := 0;
   TOTVAL := 0;
   For  I1 := 0  to  (TAMY - 1) do
      begin
        if  TEMVAL[I1+1] = 'S'  then
           begin
             Chart1.ThisSerie := I2;
             Chart1.SerLeg[I2]  := DESCTB[I1+1];
             I2 := I2 + 1;
             SVTAM := TAM;
             For  I := 0  to  (SVTAM - 1) do
                begin
                  Chart1.Value[I] := CharQtd[I1+1,I+1];
                  TOTHOR := TOTHOR + CharQtd[I1+1,I+1];
                  if  Chart1.Value[I] > YMAX  then  YMAX := Chart1.Value[I];
                end;
           end;
      end;

   str(TOTHOR,S1);
   Chart1.Title[{BOTTOMTIT}3] :=  TituTela[1] + S1;

   if  TOTHOR = 0 then  // Para enganar o 'bug'
       for  I := 0  to  (SVTAM-1)  do  Chart1.Value[I] := 0;

   I3 := 1;
   while  YMAX > I3  do  I3 := I3*10;
   I3 := int(I3 / 20);      {Escala de Y}

   Chart1.Adm[1] := YMAX;    {Valor Máximo de Y}
   Chart1.Adm[4] := I3;      {Escala de Y}

   Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
   Chart1.Visible := True;

   Chart2.OpenDataEx({COD_VALUES}1,1,TAMY);
   Chart2.ChartType := 5;
   for  I := 0  to  (TAMY-1)  do  Chart2.Legend[I] := DESCTB[I+1];
   Chart2.Decimals  := 0;
   Chart2.Title[{TOPTIT}2] := 'Estatística de Ocorrências Médicas ' +
               ' (' + S + ')';

   For  I1 := 0  to  (TAMY - 1) do
      begin
         Chart2.ThisSerie := 0;
         Chart2.Value[I1] := CharTot[I1+1];
         TOTVAL := TOTVAL + CharTot[I1+1];
         if  Chart2.Value[I1] > YMAX2  then  YMAX2 := Chart2.Value[I1];
      end;

   str(TOTVAL,S2);
   Chart2.Title[{BOTTOMTIT}3] :=  TituTela[1] + S2;

   I3 := 1;
   while  YMAX2 > I3  do  I3 := I3*10;
   I3 := int(I3 / 20);      {Escala de Y}

   Chart2.Adm[1] := YMAX2;    {Valor Máximo de Y}
   Chart2.Adm[4] := I3;      {Escala de Y}
   Chart2.CloseData({COD_VALUES}1);   {Close the VALUES channel}
   Chart2.Visible := False;

   bbtnGraf.Visible := True;
end;

end.
