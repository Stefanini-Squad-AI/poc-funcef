unit FEstObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBTables,
  Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook,
  ExtCtrls, OleCtrls, chartfx3, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, fSairAjuda,
  TB97Tlbr;

type
  TfrmEstObjeto = class(TfrmSairAjuda)
    ds2: TwwDataSource;
    tblObjeto: TwwTable;
    ds3: TwwDataSource;
    tblTipObj: TwwTable;
    bbtnGraf: TBitBtn;
    tblGrpObj: TwwTable;
    ds4: TwwDataSource;
    Chart1: TChartfx;
    Chart2: TChartfx;
    procedure FormCreate(Sender: TObject);
    procedure bbtnGrafClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstObjeto: TfrmEstObjeto;
  TAMY : Integer;
  CharVal, CharQtd, CharInd, DESCTB, CharVal2, CharQtd2, DESCTB2, CodObj : Variant;
  MATRIC : Double;
  DataRef : TDateTime;

  YMAX : Double;
  J, TOTQTD, TotProc, QtdOut : Integer;
  TOTVAL, TotOut : Real;

  TituTela1 : Array[1..2] of string = ('de Objetos Reclamados',
             'dos Valores ');
  TituTela2 : Array[1..2] of string = ('Total de Objetos Reclamados: ',
              'Valor Total: ');

implementation

uses FSelEstObj, FSelEstObj2, UValorAtual, uFuncoesUteisRH, uMensErro, uSistema;

{$R *.DFM}



procedure TfrmEstObjeto.FormCreate(Sender: TObject);
var
  IND, IND1, Vez : Integer;
  I1, I2 : Integer;
  I3 : Double;
  S : String;
  ValorReclamado, ValorReal : Double;
begin
  inherited;
  if (frmSelEstObj2.qryProcesso.RecordCount = 0) then
  begin
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    bbtnSairClick(Self);
    exit;
  end;
  tblTipObj.Open;
  if  (frmSelEstObj.rgSelTudo.ItemIndex = 1) or (frmSelEstObj.rgSelTudo.ItemIndex = 3) then
     tblGrpObj.Open;
  tblObjeto.Open;
  TituTela1[2] := 'dos Valores ' +
      frmSelEstObj.rgValor.Items[frmSelEstObj.rgValor.ItemIndex];
  Self.Caption := 'Estatística de Objetos Reclamados nos Processos';
  ModalResult := mrNone;
  TAMY := 0;
  if  (frmSelEstObj.rgSelTudo.ItemIndex > 1) then begin
           TAMY := frmSelEstObj.lstObjeto.Items.Count;
           if  frmSelEstObj.cbxDemais.checked  then  inc(TAMY);
  end;

  if  (frmSelEstObj.rgSelTudo.ItemIndex = 1) then begin
      ds4.Dataset.First;
      while not ds4.Dataset.Eof  do  begin
         TAMY := TAMY + 1;
         ds4.Dataset.Next;
      end;
  end;

  if  (frmSelEstObj.rgSelTudo.ItemIndex = 0) then begin
      ds3.Dataset.First;
      while not ds3.Dataset.Eof  do  begin
         TAMY := TAMY + 1;
         ds3.Dataset.Next;
      end;
  end;

  CodObj := VarArrayCreate([1, TAMY], varInteger);
  DESCTB := VarArrayCreate([1, TAMY], varOleStr);
  IND1 := 0;
  if  (frmSelEstObj.rgSelTudo.ItemIndex = 0) or (frmSelEstObj.rgSelTudo.ItemIndex = 2) then
  begin
      ds3.Dataset.First;
      if (frmSelEstObj.rgSelTudo.ItemIndex = 0) then
      while not ds3.Dataset.Eof  do
      begin
           IND1 := IND1 + 1;
           CodObj[IND1] := tblTipObj.FieldByName('CODTIPOOBJETO').Value;
           DESCTB[IND1] := tblTipObj.FieldByName('DESCRICAO').Value;
           ds3.Dataset.Next;
      end;
      if (frmSelEstObj.rgSelTudo.ItemIndex = 2) then
      begin
         while not ds3.Dataset.Eof  do begin
            for IND := 1  to  TAMY  do begin
               if  (frmSelEstObj.cbxDemais.checked) and (IND = TAMY)  then break;
               if  tblTipObj.FieldByName('DESCRICAO').Value =
                   frmSelEstObj.lstObjeto.Items[IND-1] then begin
                   CodObj[IND] := tblTipObj.FieldByName('CODTIPOOBJETO').Value;
                   DESCTB[IND] := tblTipObj.FieldByName('DESCRICAO').Value;
                   break;
               end;
            end;
            ds3.Dataset.Next;
         end;
         if  frmSelEstObj.cbxDemais.checked  then begin
             CodObj[TAMY] := -1;
             DESCTB[TAMY] := 'Demais Objetos';
         end;
      end;
  end
  else
  begin
      ds4.Dataset.First;
      if (frmSelEstObj.rgSelTudo.ItemIndex = 1) then
      while not ds4.Dataset.Eof  do
      begin
         IND1 := IND1 + 1;
         CodObj[IND1] := tblGrpObj.FieldByName('IDGRUPOOBJETO').Value;
         DESCTB[IND1] := tblGrpObj.FieldByName('DESCRICAO').Value;
         ds4.Dataset.Next;
      end;
      if (frmSelEstObj.rgSelTudo.ItemIndex = 3) then
      begin
          ds4.Dataset.First;
          while not ds4.Dataset.Eof  do
          begin
             for IND := 1  to  TAMY  do
             begin
                if  (frmSelEstObj.cbxDemais.checked) and (IND = TAMY)  then break;
                if  tblGrpObj.FieldByName('DESCRICAO').Value =
                    frmSelEstObj.lstObjeto.Items[IND-1] then begin
                    CodObj[IND] := tblGrpObj.FieldByName('IDGRUPOOBJETO').Value;
                    DESCTB[IND] := tblGrpObj.FieldByName('DESCRICAO').Value;
                    break;
                end;
             end;
             ds4.Dataset.Next;
          end;
          if  frmSelEstObj.cbxDemais.checked  then begin
              CodObj[TAMY] := -1;
              DESCTB[TAMY] := 'Demais Objetos';
          end;
      end;

  end;

  CharQtd := VarArrayCreate([1, TAMY], varInteger);
  CharVal := VarArrayCreate([1, TAMY], varDouble);
  for  IND := 1  to  TAMY  do  begin
        CharQtd[IND] := 0;
        CharVal[IND] := 0;
  end;


  frmSelEstObj2.qryProcesso.First;

 While Not frmSelEstObj2.qryProcesso.Eof Do Begin

   tblObjeto.First;
   While Not tblObjeto.Eof Do Begin

         ValorReclamado := ValorAtual(tblObjeto.FieldByName('VALORRECL').AsFloat,
                              iff(frmSelEstObj2.qryProcesso.FieldByName(iff(Sistema.IdModulo=110,'DATADEMISSAO',iff(Sistema.IdModulo=111,'DATANOTIF','DATADESLIGAMENTO'))).AsString='',
                                  frmSelEstObj2.qryProcesso.FieldByName('DATANOTIF').AsString,
                                  frmSelEstObj2.qryProcesso.FieldByName(iff(Sistema.IdModulo=110,'DATADEMISSAO',iff(Sistema.IdModulo=111,'DATANOTIF','DATADESLIGAMENTO'))).AsString),
                              frmSelEstObj2.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                              frmSelEstObj2.qryProcesso.FieldByName('IDREGRA').AsString,
                              frmSelEstObj2.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                              frmSelEstObj2.qryProcesso.FieldByName('INDTAXACONV').AsInteger);
         ValorReal      := ValorAtual(tblObjeto.FieldByName('VALORSENTENCA').AsFloat,
                              frmSelEstObj2.qryProcesso.FieldByName('DATAEFETENC').AsString,
                              frmSelEstObj2.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                              frmSelEstObj2.qryProcesso.FieldByName('IDREGRA').AsString,
                              frmSelEstObj2.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                              frmSelEstObj2.qryProcesso.FieldByName('INDTAXACONV').AsInteger);


         for  IND := 1  to  TAMY  do  begin
             {Rotina para determinar o ponteiro onde vai somar}
             if  ((frmSelEstObj.rgSelTudo.ItemIndex = 0) or
                  (frmSelEstObj.rgSelTudo.ItemIndex = 2)) and
                 (tblObjeto.FieldByName('CODTIPOOBJETO').Value = CodObj[IND]) then break;
             if  ((frmSelEstObj.rgSelTudo.ItemIndex = 1) or
                  (frmSelEstObj.rgSelTudo.ItemIndex = 3)) then
                 if (tblTipObj.FindKey([tblObjeto.FieldByName('CODTIPOOBJETO').Value])) and
                    (tblTipObj.FieldByName('IDGRUPOOBJETO').Value = CodObj[IND]) then break;
         end;

         if  (frmSelEstObj.cbxDemais.checked) and
             (frmSelEstObj.rgSelTudo.ItemIndex > 1) and
             (IND > TAMY)  then  IND := TAMY;

         if  (IND <= TAMY) and (TAMY > 0)  then  begin
               CharQtd[IND] := CharQtd[IND] + 1;
               if frmSelEstObj2.qryProcesso.FieldByName('FLGSITPROC').Value = 0
               then  CharVal[IND] := CharVal[IND] +
                         ValorReclamado -
                         (frmSelEstObj.rgValor.ItemIndex *
                         (100 - tblObjeto.FieldByName('PERCPROB').Value) *
                          ValorReclamado / 100)
               else  CharVal[IND] := CharVal[IND] +
                         (1 - frmSelEstObj.rgValor.ItemIndex) * ValorReclamado +
                         frmSelEstObj.rgValor.ItemIndex       * ValorReal;
         end;
         tblObjeto.Next;
   end;
   frmSelEstObj2.qryProcesso.Next;
 end;


 if  (frmSelEstObj.rgSelTudo.ItemIndex < 2) and (frmSelEstObj.cbxPercMin.Checked) then
 begin
   TotVal := 0;
   TotQtd := 0;
   for IND := 1  to  TAMY  do
       TotVal := TotVal + CharVal[IND];

   CharInd := VarArrayCreate([1, TAMY], varInteger);
   for IND := 1  to  TAMY  do
     if CharVal[IND] * 100 / TotVal < frmSelEstObj.spedPercMin.Value then
       CharInd[IND] := 0
     else
     begin
       CharInd[IND] := 1;
       inc(TotQtd);
     end;

   if TotQtd < TAMY then
   begin
     DESCTB2  := VarArrayCreate([1, TotQtd + 1], varOleStr);
     CharQtd2 := VarArrayCreate([1, TotQtd + 1], varInteger);
     CharVal2 := VarArrayCreate([1, TotQtd + 1], varDouble);
     IND1 := 0;
     TotOut := 0;
     QtdOut := 0;
     for IND := 1  to  TAMY  do
     begin
        if CharInd[IND] = 1 then
        begin
           inc(IND1);
           DESCTB2[IND1]  := DESCTB[IND];
           CharQtd2[IND1] := CharQtd[IND];
           CharVal2[IND1] := CharVal[IND];
        end
        else
        begin
           TotOut := TotOut + CharVal[IND];
           QtdOut := QtdOut + CharQtd[IND];
        end;
     end;

     DESCTB  := VarArrayCreate([1, TotQtd + 1], varOleStr);
     CharQtd := VarArrayCreate([1, TotQtd + 1], varInteger);
     CharVal := VarArrayCreate([1, TotQtd + 1], varDouble);
     for IND := 1  to  TotQtd  do
     begin
         DESCTB[IND]  := DESCTB2[IND];
         CharQtd[IND] := CharQtd2[IND];
         CharVal[IND] := CharVal2[IND];
     end;
     DESCTB [TotQtd + 1] := 'Demais Objetos';
     CharVal[TotQtd + 1] := TotOut;
     CharQtd[TotQtd + 1] := QtdOut;
     TAMY := TotQtd + 1;
   end;

 end;

   // Gráfico de Quantidades
   Chart1.OpenDataEx(1,1,TAMY);
   Chart1.ChartType := 5;

   Chart1.Decimals  := 0;
   Chart1.Title[2] := 'Estatística ' + TituTela1[1];
   YMAX := 0;

   TOTQTD := 0;
   Chart1.ThisSerie := 0;
   For  Ind := 0  to  (TAMY - 1) do  begin
        Chart1.Value[Ind] := CharQtd[Ind+1];
        TOTQTD := TOTQTD + CharQtd[Ind+1];
        if  Chart1.Value[Ind] > YMAX  then  YMAX := Chart1.Value[Ind];
   end;

  if (TOTQTD = 0) then
  begin
    MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    bbtnSairClick(Self);
    exit;
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
   for  Ind := 0  to (TAMY-1)  do  Chart1.Legend[Ind] := DESCTB[Ind+1];
   for  Ind := 0  to (TAMY-1)  do  Chart2.Legend[Ind] := DESCTB[Ind+1];

   Chart2.Decimals  := 0;
   Chart2.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[2];
   YMAX := 0;

   TOTVAL := 0;
   //TOTQTD := 0;
   Chart2.ThisSerie := 0;
   For  Ind := 0  to  (TAMY - 1) do  begin
        Chart2.Value[Ind] := CharVal[Ind+1];
        TOTVAL := TOTVAL + CharVal[Ind+1];
        if  Chart2.Value[Ind] > YMAX  then  YMAX := Chart2.Value[Ind];
   end;

   S := FloatToStrF(TOTVAL,ffFixed,12,2);

   Chart2.Title[{BOTTOMTIT}3] := TituTela2[2] + S;

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


procedure TfrmEstObjeto.bbtnGrafClick(Sender: TObject);
begin
  inherited;
  Chart1.Visible := not Chart1.Visible;
  Chart2.Visible := not Chart2.Visible;
end;

end.
