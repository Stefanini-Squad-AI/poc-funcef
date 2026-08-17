unit FEstProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3, Wwquery,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, FSairAjuda, IvEMulti;

type
  TfrmEstProcesso = class(TfrmSairAjuda)
    Chart1: TChartfx;
    Chart2: TChartfx;
    bbtnGraf: TBitBtn;
    ds2: TwwDataSource;
    tblObjeto: TwwTable;
    procedure bbtnGrafClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstProcesso: TfrmEstProcesso;
  TAM, TAMY, SVTAM : Integer;
  CharHor : Variant;
  CharVal : Variant;
  Ano, Mes, Dia, Ano1, Mes1, Dia1 : Word;
  YMAX : Double;
  VEZ, J, TOTHOR, TOTVAL : Integer;
  MesCurto : Array[1..12] of string[3] = ('Jan','Fev','Mar'
             ,'Abr','Mai','Jun','Jul','Ago','Set','Out'
             ,'Nov','Dez');
  TituTela1 : Array[1..2] of string = ('da Quantidade de','do Custo dos');
  TituTela2 : Array[1..2] of string = ('Quantidade Total: ','Custo Total: ');

implementation

uses FSelEstProc, UValorAtual, uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmEstProcesso.bbtnGrafClick(Sender: TObject);
begin
  inherited;
  Chart1.Visible := not Chart1.Visible;
  Chart2.Visible := not Chart2.Visible;
end;

procedure TfrmEstProcesso.FormCreate(Sender: TObject);
var
  IND, IND1 : Integer;
  I, I1, I2 : Integer;
  I3 : Double;
  S : String;
  bAnual : Boolean;
  ValorReclamado, ValorReal : Double;
begin
  inherited;
  tblObjeto.Open;
  DecodeDate(frmSelEstProc.EdDataNot1.Date, Ano, Mes, Dia);
  DecodeDate(frmSelEstProc.EdDataNot2.Date, Ano1, Mes1, Dia1);
  ModalResult := mrNone;
  bAnual := True;
  TAM := Ano1-Ano+1;
  if  TAM > 12  then  TAM := 12
  else  if  TAM = 1  then begin
     TAM := Mes1-Mes+1;
     bAnual := False;
  end;
  TAMY := 3;

  CharHor := VarArrayCreate([1, TAMY, 1, TAM], varInteger);
  for  I1 := 1  to  TAMY  do  for  I2 := 1  to  TAM  do
       CharHor[I1,I2] := 0;
  CharVal := VarArrayCreate([1, TAMY, 1, TAM], varInteger);
  for  I1 := 1  to  TAMY  do  for  I2 := 1  to  TAM  do
       CharVal[I1,I2] := 0;
  frmSelEstProc.qryProcesso.First;
 While Not frmSelEstProc.qryProcesso.Eof Do Begin

     if  frmSelEstProc.qryProcesso.FieldByName('DATANOTIF').Value <> Null  then
          DecodeDate(frmSelEstProc.qryProcesso.FieldByName('DATANOTIF').Value, Ano, Mes, Dia)
     else DecodeDate(Date, Ano, Mes, Dia);
     if  (frmSelEstProc.qryProcesso.FieldByName('DATAEFETENC').Value <> Null)  and
         (frmSelEstProc.qryProcesso.FieldByName('FLGSITPROC').AsInteger = 1)   and
         (frmSelEstProc.rgDataEncer.ItemIndex = 1) then
          DecodeDate(frmSelEstProc.qryProcesso.FieldByName('DATAEFETENC').Value, Ano, Mes, Dia);

     if  (bAnual)  and  (Ano1-Ano+1 > TAM) then begin
         frmSelEstProc.qryProcesso.Next;
         Continue;
     end;

     if  bAnual  then  IND := TAM+Ano-Ano1  else  IND := TAM+Mes-Mes1;

     IND1 := frmSelEstProc.qryProcesso.FieldByName('FLGSITPROC').AsInteger + 1;
     CharHor[3,IND] := CharHor[3,IND] + 1;
     CharHor[IND1,IND] := CharHor[IND1,IND] + 1;

     tblObjeto.First;
     While Not tblObjeto.Eof Do Begin

           ValorReclamado := ValorAtual(tblObjeto.FieldByName('VALORRECL').AsFloat,
                              iff(frmSelEstProc.qryProcesso.FieldByName('DATADESLIGAMENTO').AsString='',
                                  frmSelEstProc.qryProcesso.FieldByName('DATANOTIF').AsString,
                                  frmSelEstProc.qryProcesso.FieldByName('DATADESLIGAMENTO').AsString),
                              frmSelEstProc.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                              frmSelEstProc.qryProcesso.FieldByName('IDREGRA').AsString,
                              frmSelEstProc.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                              frmSelEstProc.qryProcesso.FieldByName('INDTAXACONV').AsInteger);
           ValorReal      := ValorAtual(tblObjeto.FieldByName('VALORSENTENCA').AsFloat,
                              frmSelEstProc.qryProcesso.FieldByName('DATAEFETENC').AsString,
                              frmSelEstProc.qryProcesso.FieldByName('MOEDAPROCTRAB').AsString,
                              frmSelEstProc.qryProcesso.FieldByName('IDREGRA').AsString,
                              frmSelEstProc.qryProcesso.FieldByName('NUMPROCTRAB').AsString,
                              frmSelEstProc.qryProcesso.FieldByName('INDTAXACONV').AsInteger);



           if  IND1 <> 2  then begin
                CharVal[1,IND] := CharVal[1,IND] +
                           ValorReclamado -
                           ((100 - tblObjeto.FieldByName('PERCPROB').AsFloat) *
                            ValorReclamado / 100);
                CharVal[2,IND] := CharVal[2,IND] +  ValorReclamado;
           end
           else  CharVal[3,IND] := CharVal[3,IND] +  ValorReal;
           tblObjeto.Next;
     end;
     frmSelEstProc.qryProcesso.Next;
 end;

 for  VEZ := 1  to  2  do begin
   SVTAM := TAM;
   I2 := 3;

   if  VEZ = 1  then begin
       Chart1.OpenDataEx({COD_VALUES}1,I2,TAM);
       Chart1.ChartType := 2;
       if  (not bAnual)  then
           for  I := 1  to  TAM  do  Chart1.Legend[I-1] := MesCurto[Mes1-TAM+I];
       if  (bAnual)  then
           for  I := 1  to  TAM  do
           begin
             str(Ano1-TAM+I, S);
             Chart1.Legend[I-1] := S;
           end;

       Chart1.Decimals  := 0;
       Chart1.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[VEZ] + ' Processos';

   end;
   if  VEZ = 2  then begin
       Chart2.OpenDataEx({COD_VALUES}1,I2,TAM);
       Chart2.ChartType := 2;
       if  (not bAnual)  then
           for  I := 1  to  TAM  do  Chart2.Legend[I-1] := MesCurto[Mes1-TAM+I];

       if  (bAnual)  then
           for  I := 1  to  TAM  do
           begin
             str(Ano1-TAM+I, S);
             Chart2.Legend[I-1] := S;
           end;

       Chart2.Decimals  := 0;
       Chart2.Title[{TOPTIT}2] := 'Estatística ' + TituTela1[VEZ] + ' Processos';

   end;
   YMAX := 0;
   I2 := 0;
   TOTHOR := 0;
   TOTVAL := 0;
   For  I1 := 0  to  (TAMY - 1) do
      begin

             if  VEZ = 1  then begin
                 Chart1.ThisSerie := I1;
                 if  I1 = 0  then
                     Chart1.SerLeg[I1]  := 'Abertos';
                 if  I1 = 1  then
                     Chart1.SerLeg[I1]  := 'Encerrados';
                 if  I1 = 2  then
                     Chart1.SerLeg[I1]  := 'Total';
             end;
             if  VEZ = 2  then begin
                 Chart2.ThisSerie := I1;
                 if  I1 = 0  then
                    Chart2.SerLeg[I1]  := 'Risco Provável';
                 if  I1 = 1  then
                    Chart2.SerLeg[I1]  := 'Risco Máximo';
                 if  I1 = 2  then
                    Chart2.SerLeg[I1]  := 'Encerrados';
             end;

             SVTAM := TAM;
             For  I := 0  to  (SVTAM - 1) do
                begin
                  if VEZ =1 then Chart1.Value[I] := CharHor[I1+1,I+1]
                            else Chart2.Value[I] := CharVal[I1+1,I+1];
                  if VEZ =1 then
                            begin
                               if I1 = 2 then TOTHOR := TOTHOR + CharHor[I1+1,I+1];
                            end
                            else TOTVAL := TOTVAL + CharVal[I1+1,I+1];
                  if VEZ =1 then
                     if  Chart1.Value[I] > YMAX  then
                         YMAX := Chart1.Value[I];
                  if VEZ =2 then
                     if  Chart2.Value[I] > YMAX  then
                         YMAX := Chart2.Value[I];
                end;

      end;
   if  VEZ = 1  then  begin
       str(TOTHOR,S);
       Chart1.Title[{BOTTOMTIT}3] := TituTela2[VEZ] + S;
   end
   else  begin
       str(TOTVAL,S);
       Chart2.Title[{BOTTOMTIT}3] := TituTela2[VEZ] + S;
   end;


   I3 := 1;
   while  YMAX > I3  do  I3 := I3*10;
   I3 := int(I3 / 20);      {Escala de Y}

   if  VEZ = 1  then  begin
       Chart1.Adm[1] := YMAX;    {Valor Máximo de Y}
       Chart1.Adm[4] := I3;      {Escala de Y}
       Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
       Chart1.Visible := True;
   end
   else begin
       Chart2.Adm[1] := YMAX;    {Valor Máximo de Y}
       Chart2.Adm[4] := I3;      {Escala de Y}
       Chart2.CloseData({COD_VALUES}1);   {Close the VALUES channel}
       Chart2.Visible := False;
   end;
 end;

 bbtnGraf.Visible := True;
 bbtnGraf.Visible := True;

end;

end.
