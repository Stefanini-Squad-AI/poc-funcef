unit FEstDistr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3,
  TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, FSairAjuda, TB97Tlbr;

type
  TfrmEstDistr = class(TfrmSairAjuda)
    ds2: TwwDataSource;
    tblObjeto: TwwTable;
    ds3: TwwDataSource;
    Chart1: TChartfx;
    Chart2: TChartfx;
    bbtnGraf: TBitBtn;
    qryCargo: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnGrafClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstDistr: TfrmEstDistr;
  TAMY : Integer;
  CharVal, CharVal1 : Variant;
  CharQtd, CharQtd1 : Variant;
  CodObj : Variant;
  DESCTB, DESCTB1   : Variant;
  MATRIC : Double;
  DataRef : TDateTime;
  LstTudo, LstCod : TStrings;
  YMAX : Double;
  J, TOTQTD : Integer;
  TOTVAL : Real;

  TituTela1 : Array[1..2] of string = ('da Distribuição de Processos',
             'dos Valores ');
  TituTela2 : Array[1..2] of string = ('Total de Processos: ',
              'Valor Total: ');

implementation

uses FSelEstDistr, FSelEstDistr2, UValorAtual, uFuncoesUteisRH, uMensErro;

{$R *.DFM}



procedure TfrmEstDistr.FormCreate(Sender: TObject);
var
  IND, IND1, Vez : Integer;
  I1, I2 : Integer;
  I3 : Double;
  S : String;
  ValorReclamado, ValorReal, ValorProcesso : Double;
begin
  inherited;

  tblObjeto.Open;
  TituTela1[2] := 'dos Valores ' +
      frmSelEstDistr.rgValor.Items[frmSelEstDistr.rgValor.ItemIndex];

  ModalResult := mrNone;
  TAMY := 0;
  TAMY := frmSelEstDistr.lstCargo.Items.Count;
  if  (frmSelEstDistr.cbxDemais.checked) and (frmSelEstDistr.rgSelCargo.ItemIndex = 1)
      then  inc(TAMY);

  DESCTB := VarArrayCreate([1, TAMY], varOleStr);
  IND1 := 0;

  for IND := 1  to  TAMY  do begin
        if  (frmSelEstDistr.cbxDemais.checked) and
            (frmSelEstDistr.rgSelCargo.ItemIndex = 1) and
            (IND = TAMY)  then break;
        DESCTB[IND] := frmSelEstDistr.lstCargo.Items[IND-1];
  end;
  if  (frmSelEstDistr.cbxDemais.checked) and
      (frmSelEstDistr.rgSelCargo.ItemIndex = 1)  then
        DESCTB[TAMY] := 'Demais ' + frmSelEstDistr.rgDistribPor.Items[frmSelEstDistr.rgDistribPor.ItemIndex];

  CharQtd := VarArrayCreate([1, TAMY], varInteger);
  CharVal := VarArrayCreate([1, TAMY], varDouble);
  LstTudo := TStringList.Create;
  LstCod  := TStringList.Create;
  LstTudo.Clear;
  LstCod.Clear;

  for  IND := 1  to  TAMY  do  begin
        CharQtd[IND] := 0;
        CharVal[IND] := 0;
        LstTudo.Add(DESCTB[IND]);
        if  (frmSelEstDistr.cbxDemais.checked) and (IND = TAMY) and
            (frmSelEstDistr.rgSelCargo.ItemIndex = 1)  then
           LstCod.Add('XXXXXX')
        else
           LstCod.Add(frmSelEstDistr.lstCodCargo.Items[IND-1]);
  end;

  frmSelEstDistr2.qryProcesso.First;

 While Not frmSelEstDistr2.qryProcesso.Eof Do Begin
   ValorProcesso := 0;

   {Rotina para determinar o ponteiro onde vai somar}
   if (frmSelEstDistr.rgDistribPor.ItemIndex = 0) then
     IND := lstCod.IndexOf(frmSelEstDistr2.qryProcesso.FieldByName('IDCARGO').AsString) + 1
   else if (frmSelEstDistr.rgDistribPor.ItemIndex = 1) then
     IND := lstCod.IndexOf(frmSelEstDistr2.qryProcesso.FieldByName('IDESTAB').AsString) + 1
   else if (frmSelEstDistr.rgDistribPor.ItemIndex = 2) then
     IND := lstCod.IndexOf(frmSelEstDistr2.qryProcesso.FieldByName('IDRAMOFORNECEDOR').AsString) + 1
   else if (frmSelEstDistr.rgDistribPor.ItemIndex = 3) then
     IND := lstCod.IndexOf(frmSelEstDistr2.qryProcesso.FieldByName('IDSINDICATO').AsString) + 1
   else if (frmSelEstDistr.rgDistribPor.ItemIndex = 4) then
     IND := lstCod.IndexOf(frmSelEstDistr2.qryProcesso.FieldByName('CODCENTROCUSTO_1').AsString) + 1;

   if  (frmSelEstDistr.cbxDemais.checked) and
       (frmSelEstDistr.rgSelCargo.ItemIndex = 1) and
       (IND = 0)  then  IND := TAMY;

   if  (IND <= TAMY) and (TAMY > 0) and (IND > 0) then  begin

       CharQtd[IND] := CharQtd[IND] + 1;

       tblObjeto.First;
       While Not tblObjeto.Eof Do Begin
             ValorReclamado := ValorAtual(tblObjeto.FieldByName('VALORRECL').AsFloat,
                              iff(frmSelEstDistr2.qryProcesso.FieldByName('DATADESLIGAMENTO').AsString='',
                                  frmSelEstDistr2.qryProcesso.FieldByName('DATANOTIF').AsString,
                                  frmSelEstDistr2.qryProcesso.FieldByName('DATADESLIGAMENTO').AsString),
                              frmSelEstDistr2.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                              frmSelEstDistr2.qryProcesso.FieldByName('IDREGRA').AsString,
                              frmSelEstDistr2.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                              frmSelEstDistr2.qryProcesso.FieldByName('INDTAXACONV').AsInteger);
             ValorReal      := ValorAtual(tblObjeto.FieldByName('VALORSENTENCA').AsFloat,
                              frmSelEstDistr2.qryProcesso.FieldByName('DATAEFETENC').AsString,
                              frmSelEstDistr2.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                              frmSelEstDistr2.qryProcesso.FieldByName('IDREGRA').AsString,
                              frmSelEstDistr2.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                              frmSelEstDistr2.qryProcesso.FieldByName('INDTAXACONV').AsInteger);


             if frmSelEstDistr2.qryProcesso.FieldByName('FLGSITPROC').Value = 0
             then  ValorProcesso := ValorProcesso +
                       ValorReclamado -
                       (frmSelEstDistr.rgValor.ItemIndex *
                       (100 - tblObjeto.FieldByName('PERCPROB').Value) *
                        ValorReclamado / 100)
             else  ValorProcesso := ValorProcesso +
                       (1 - frmSelEstDistr.rgValor.ItemIndex) * ValorReclamado +
                       frmSelEstDistr.rgValor.ItemIndex       * ValorReal;



             tblObjeto.Next;
       end;
       CharVal[IND] := CharVal[IND] + ValorProcesso;
   end;
   frmSelEstDistr2.qryProcesso.Next;
 end;

 IND1 := 0;
 for  IND := 1  to  TAMY  do
      if  CharQtd[IND] = 0 then IND1 := IND1 + 1;

 Vez  := TAMY;
 TAMY := TAMY - IND1;

  if (TAMY = 0) then
  begin
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    bbtnSairClick(Self);
    exit;
  end;


 DESCTB1  := VarArrayCreate([1, TAMY], varOleStr);
 CharQtd1 := VarArrayCreate([1, TAMY], varInteger);
 CharVal1 := VarArrayCreate([1, TAMY], varDouble);

 IND1 := 0;
 for  IND := 1  to  Vez  do
      if  CharQtd[IND] > 0 then begin
          IND1 := IND1 + 1;
          DESCTB1[IND1]  := DESCTB[IND];
          CharQtd1[IND1] := CharQtd[IND];
          CharVal1[IND1] := CharVal[IND];
      end;


   // Gráfico de Quantidades
   Chart1.OpenDataEx({COD_VALUES}1,1,TAMY);
   Chart1.ChartType := 5;
   //for  Ind := 0  to (TAMY-1)  do  Chart1.Legend[Ind] := DESCTB[Ind+1];

   Chart1.Decimals  := 0;
   Chart1.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[1];
   YMAX := 0;

   //TOTVAL := 0;
   TOTQTD := 0;
   Chart1.ThisSerie := 0;
   For  Ind := 0  to  (TAMY - 1) do  begin
        Chart1.Value[Ind] := CharQtd1[Ind+1];
        TOTQTD := TOTQTD + CharQtd1[Ind+1];
        if  Chart1.Value[Ind] > YMAX  then  YMAX := Chart1.Value[Ind];
   end;

   S := IntToStr(TOTQTD);

   Chart1.Title[{BOTTOMTIT}3] := TituTela2[1] + S;

   I3 := 1;
   while  YMAX > I3  do  I3 := I3*10;
   I3 := int(I3 / 20);      {Escala de Y}

   Chart1.Adm[1] := YMAX;    {Valor Máximo de Y}
   Chart1.Adm[4] := I3;      {Escala de Y}

   Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
   Chart1.Visible := True;

   // Gráfico de Valores
   Chart2.OpenDataEx({COD_VALUES}1,1,TAMY);
   Chart2.ChartType := 5;
   for  Ind := 0  to (TAMY-1)  do  Chart1.Legend[Ind] := DESCTB1[Ind+1];
   for  Ind := 0  to (TAMY-1)  do  Chart2.Legend[Ind] := DESCTB1[Ind+1];

   Chart2.Decimals  := 0;
   Chart2.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[2];
   YMAX := 0;

   TOTVAL := 0;
   //TOTQTD := 0;
   Chart2.ThisSerie := 0;
   For  Ind := 0  to  (TAMY - 1) do  begin
        Chart2.Value[Ind] := CharVal1[Ind+1];
        TOTVAL := TOTVAL + CharVal1[Ind+1];
        if  Chart2.Value[Ind] > YMAX  then  YMAX := Chart2.Value[Ind];
   end;

   S := FloatToStrF(TOTVAL,ffFixed,12,2);

   Chart2.Title[{BOTTOMTIT}3] := TituTela2[2] + S + ' em ' + IntToStr(TotQtd) + ' Processos';

   I3 := 1;
   while  YMAX > I3  do  I3 := I3*10;
   I3 := int(I3 / 20);      {Escala de Y}

   Chart2.Adm[1] := YMAX;    {Valor Máximo de Y}
   Chart2.Adm[4] := I3;      {Escala de Y}

   Chart2.CloseData({COD_VALUES}1);   {Close the VALUES channel}
   Chart2.Visible := False;

   bbtnGraf.Visible := True;
   bbtnGraf.Visible := True;


end;

procedure TfrmEstDistr.bbtnGrafClick(Sender: TObject);
begin
  inherited;
  Chart1.Visible := not Chart1.Visible;
  Chart2.Visible := not Chart2.Visible;
end;

procedure TfrmEstDistr.FormDestroy(Sender: TObject);
begin
  inherited;
  LstTudo.Free;
end;

end.
