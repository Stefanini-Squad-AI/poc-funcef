unit FEstatCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3, Wwquery,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEstatCad = class(TfrmSelPessoal)
    Chart1: TChartfx;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstatCad: TfrmEstatCad;
  TipoEstat : Integer;

implementation

uses FSelEstat;

{$R *.DFM}

procedure TfrmEstatCad.FormCreate(Sender: TObject);
begin
  inherited;
  rgSequencia.Visible := False;
  cbxCandidatos.Enabled := False;
  TipoEstat := frmSelEstat.rgTipoEstat.ItemIndex;
  if TipoEstat = 0 then gbxSexo.Enabled := False;
  if TipoEstat = 1 then gbxEstCivil.Enabled := False;
  if TipoEstat = 2 then gbxGrauInstr.Enabled := False;
  if TipoEstat = 3 then gbxTempAdm.Enabled := False;
  if TipoEstat = 4 then gbxCep.Enabled := False;
  if TipoEstat = 5 then gbxIdade.Enabled := False;
  if TipoEstat = 6 then gbxSalario.Enabled := False;
  if TipoEstat = 7 then rgSelSindi.Enabled := False;
end;

procedure TfrmEstatCad.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  rgSequencia.Visible := False;
  Chart1.Visible := False;
end;

procedure TfrmEstatCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEstatCad.bbtnConfirmarClick(Sender: TObject);
var
  TAM, TotPes, I2 : Integer;
  YMAX, VALSAL, TotVal : Double;
  MINMAX : array[1..8,1..8] of integer;
  CODIGOS : Variant;
  S : String;
begin
  inherited;
  ModalResult := mrNone;

  TotPes:=0; TotVal:=0; TAM:=0;

  {This function sets the data to display}
   if  TipoEstat = 0  then
       begin
         {Open the VALUES channel specifying n2 Serie and n3 Points}
         Chart1.OpenDataEx({COD_VALUES}1,1,2);
         TAM := 2;
         Chart1.Legend[0] := 'Feminino';
         Chart1.Legend[1] := 'Masculino';
       end;
   if  TipoEstat = 1  then
       begin
         TAM := 5;
         Chart1.OpenDataEx({COD_VALUES}1,1,5);
         Chart1.Legend[0] := 'Solteiro';
         Chart1.Legend[1] := 'Casado';
         Chart1.Legend[2] := 'Div./Desq.';
         Chart1.Legend[3] := 'Viúvo';
         Chart1.Legend[4] := 'Outro';
       end;

   if  TipoEstat = 2  then
       begin
         qryGrauInstr.First;
         While Not qryGrauInstr.Eof Do
            Begin
               TAM := TAM + 1;
               qryGrauInstr.Next;
            end;
         Chart1.OpenDataEx({COD_VALUES}1,1,TAM);
         CODIGOS := VarArrayCreate([0,TAM-1],varInteger);
         qryGrauInstr.First;
         TAM := 0;
         While Not qryGrauInstr.Eof Do
            Begin
               Chart1.Legend[TAM] :=
                       qryGrauInstr.FieldByName('DESCRICAO').Value;
               CODIGOS[TAM] := qryGrauInstr.FieldByName('IDGRINSTR').Value;
               TAM := TAM + 1;
               qryGrauInstr.Next;
            end;
       end;

  if  (TipoEstat > 2)  and
      (TipoEstat < 7)  then
       begin
          TAM := 0;
          if  frmSelEstat.ednMax1.Text <> ''  then  TAM := TAM + 1;
          if  frmSelEstat.ednMax2.Text <> ''  then  TAM := TAM + 1;
          if  frmSelEstat.ednMax3.Text <> ''  then  TAM := TAM + 1;
          if  frmSelEstat.ednMax4.Text <> ''  then  TAM := TAM + 1;
          if  frmSelEstat.ednMax5.Text <> ''  then  TAM := TAM + 1;
          if  frmSelEstat.ednMax6.Text <> ''  then  TAM := TAM + 1;
          if  frmSelEstat.ednMax7.Text <> ''  then  TAM := TAM + 1;
          if  frmSelEstat.ednMax8.Text <> ''  then  TAM := TAM + 1;
          Chart1.OpenDataEx({COD_VALUES}1,1,TAM);
          if  frmSelEstat.ednMax1.Text <> ''  then
             begin
                Chart1.Legend[0] := frmSelEstat.ednMin1.Text + ' a ' + frmSelEstat.ednMax1.Text;
                Val(frmSelEstat.ednMin1.Text, MINMAX[1,1], J);
                Val(frmSelEstat.ednMax1.Text, MINMAX[2,1], J);
             end;
          if  frmSelEstat.ednMax2.Text <> ''  then
             begin
                Chart1.Legend[1] := frmSelEstat.ednMin2.Text + ' a ' + frmSelEstat.ednMax2.Text;
                Val(frmSelEstat.ednMin2.Text, MINMAX[1,2], J);
                Val(frmSelEstat.ednMax2.Text, MINMAX[2,2], J);
             end;
          if  frmSelEstat.ednMax3.Text <> ''  then
             begin
                Chart1.Legend[2] := frmSelEstat.ednMin3.Text + ' a ' + frmSelEstat.ednMax3.Text;
                Val(frmSelEstat.ednMin3.Text, MINMAX[1,3], J);
                Val(frmSelEstat.ednMax3.Text, MINMAX[2,3], J);
             end;
          if  frmSelEstat.ednMax4.Text <> ''  then
             begin
                Chart1.Legend[3] := frmSelEstat.ednMin4.Text + ' a ' + frmSelEstat.ednMax4.Text;
                Val(frmSelEstat.ednMin4.Text, MINMAX[1,4], J);
                Val(frmSelEstat.ednMax4.Text, MINMAX[2,4], J);
             end;
          if  frmSelEstat.ednMax5.Text <> ''  then
             begin
                Chart1.Legend[4] := frmSelEstat.ednMin5.Text + ' a ' + frmSelEstat.ednMax5.Text;
                Val(frmSelEstat.ednMin5.Text, MINMAX[1,5], J);
                Val(frmSelEstat.ednMax5.Text, MINMAX[2,5], J);
             end;
          if  frmSelEstat.ednMax6.Text <> ''  then
             begin
                Chart1.Legend[5] := frmSelEstat.ednMin6.Text + ' a ' + frmSelEstat.ednMax6.Text;
                Val(frmSelEstat.ednMin6.Text, MINMAX[1,6], J);
                Val(frmSelEstat.ednMax6.Text, MINMAX[2,6], J);
             end;
          if  frmSelEstat.ednMax7.Text <> ''  then
             begin
                Chart1.Legend[6] := frmSelEstat.ednMin7.Text + ' a ' + frmSelEstat.ednMax7.Text;
                Val(frmSelEstat.ednMin7.Text, MINMAX[1,7], J);
                Val(frmSelEstat.ednMax7.Text, MINMAX[2,7], J);
             end;
          if  frmSelEstat.ednMax8.Text <> ''  then
             begin
                Chart1.Legend[7] := frmSelEstat.ednMin8.Text + ' a ' + frmSelEstat.ednMax8.Text;
                Val(frmSelEstat.ednMin8.Text, MINMAX[1,8], J);
                Val(frmSelEstat.ednMax8.Text, MINMAX[2,8], J);
             end;

       end;
  if  TipoEstat = 7  then
       begin
         tblSindic.First;
         TAM := 0;
         While Not tblSindic.Eof Do
            Begin
               TAM := TAM + 1;
               tblSindic.Next;
            end;
         Chart1.OpenDataEx({COD_VALUES}1,1,TAM);
         CODIGOS := VarArrayCreate([0,TAM-1],varInteger);
         tblSindic.First;
         TAM := 0;
         While Not tblSindic.Eof Do
            Begin
               Chart1.Legend[TAM] :=
                      tblSindic.FieldByName('NOME').Value;
               CODIGOS[TAM] := tblSindic.FieldByName('IDPESSOA').Value;
               TAM := TAM + 1;
               tblSindic.Next;
            end;
       end;
  if  TipoEstat = 8  then
       begin
         {Open the VALUES channel specifying n2 Serie and n3 Points}
         Chart1.OpenDataEx({COD_VALUES}1,1,2);
         TAM := 2;
         Chart1.Legend[0] := 'Direto';
         Chart1.Legend[1] := 'Indireto';
       end;

   Chart1.ThisSerie := 0;
   Chart1.Decimals  := 0;
   Chart1.Title[{TOPTIT}2] := 'Estatística por ' +
             trim(frmSelEstat.rgTipoEstat.Items[TipoEstat]);

   For  I2 := 0  to  (TAM - 1) do
   	  Chart1.Value[I2] := 0;

  Screen.cursor:= crHourGlass;

  {Rotina de acumulação dos registros de Pessoal}

  ds.Dataset.First;

  While Not ds.Dataset.Eof Do begin
        TotPes := TotPes + 1;
        if  TipoEstat = 0  then  //Sexo
            begin
                if  (tblPessoal.FieldByName('SEXO').Value = 'F')
                then  Chart1.Value[0] := Chart1.Value[0] + 1
                else  Chart1.Value[1] := Chart1.Value[1] + 1;
            end;

        if  TipoEstat = 1  then  //Estado Civil
            begin
                if  (tblPessoal.FieldByName('ESTCIVIL').Value = 'S')
                then  Chart1.Value[0] := Chart1.Value[0] + 1;
                if  (tblPessoal.FieldByName('ESTCIVIL').Value = 'C')
                then  Chart1.Value[1] := Chart1.Value[1] + 1;
                if  (tblPessoal.FieldByName('ESTCIVIL').Value = 'D')
                then  Chart1.Value[2] := Chart1.Value[2] + 1;
                if  (tblPessoal.FieldByName('ESTCIVIL').Value = 'V')
                then  Chart1.Value[3] := Chart1.Value[3] + 1;
                if  (tblPessoal.FieldByName('ESTCIVIL').Value = 'O')
                then  Chart1.Value[4] := Chart1.Value[4] + 1;
            end;

        if  TipoEstat = 2  then  //Escolaridade
            For  I2 := 0  to  (TAM - 1) do
              if CODIGOS[I2] =
                tblPessoal.FieldByName('IDGRINSTR').Value  then
                 begin
                    Chart1.Value[I2] := Chart1.Value[I2] + 1;
                    break;
                 end;

        if  TipoEstat = 3  then  //Tempo de Casa
            begin
               for  I2 := 0  to  (TAM-1)  do
                  if  (int((Date + 1 -
                       tblPessoal.FieldByName('DATAADMISSAO').Value)/
                       365.25) >= MINMAX[1,I2+1])  and
                      (int((Date + 1 -
                       tblPessoal.FieldByName('DATAADMISSAO').Value)/
                       365.25) <= MINMAX[2,I2+1])  then  begin
                       Chart1.Value[I2] := Chart1.Value[I2] + 1;
                       TotVal := TotVal + int((Date + 1 -
                         tblPessoal.FieldByName('DATAADMISSAO').Value)/
                         365.25)
                  end;
            end;

        if  TipoEstat = 4  then  begin//CEP da Residência
            VAL1 := 0;
            if  tblPessoal.FieldByName('CEP').AsString  <> '' then
                VAL1 := round(StrToInt(tblPessoal.FieldByName('CEP').AsString) / 1000);

            for  I2 := 0  to  (TAM-1)  do
                 if  (VAL1  >=  MINMAX[1,I2+1])  and
                      (VAL1  <=  MINMAX[2,I2+1])  then
                       Chart1.Value[I2] := Chart1.Value[I2] + 1;
        end;

        if  TipoEstat = 5  then  //Idade
            begin
               for  I2 := 0  to  (TAM-1)  do
                  if  (int((Date + 1 -
                       tblPessoal.FieldByName('DATANASC').Value)/
                       365.25) >= MINMAX[1,I2+1])  and
                      (int((Date + 1 -
                       tblPessoal.FieldByName('DATANASC').Value)/
                       365.25) <= MINMAX[2,I2+1])  then  begin
                       Chart1.Value[I2] := Chart1.Value[I2] + 1;
                       TotVal := TotVal + int((Date + 1 -
                         tblPessoal.FieldByName('DATANASC').Value)/
                         365.25)
                  end;
            end;

        if  TipoEstat = 6  then  //Salário
            begin
               VALSAL := tblPessoal.FieldByName('SALARIOATUAL').Value;
               if  tblPessoal.FieldByName('TIPOPAGAMENTO').Value = 'D'  then
                   VALSAL := VALSAL * 30;
               if  tblPessoal.FieldByName('TIPOPAGAMENTO').Value = 'H'  then
                   VALSAL := VALSAL * 220; //tblPessoalHorario;
               for  I2 := 0  to  (TAM-1)  do
                  if  (VALSAL >= MINMAX[1,I2+1])  and
                      (VALSAL <= MINMAX[2,I2+1])  then begin
                       Chart1.Value[I2] := Chart1.Value[I2] + 1;
                       TotVal := TotVal + VALSAL;
                  end;
            end;

        if  TipoEstat = 7  then  //Sindicato
            For  I2 := 0  to  (TAM - 1) do
              if CODIGOS[I2] =
                 tblPessoal.FieldByName('IDSINDICATO').Value  then
                 begin
                    Chart1.Value[I2] := Chart1.Value[I2] + 1;
                    break;
                 end;

        if  TipoEstat = 8  then  //Tipo de Função (D/I)
            begin
                if  (tblPessoal.FieldByName('TIPOMAODEOBRA').Value = 'D')
                then  Chart1.Value[0] := Chart1.Value[0] + 1
                else  Chart1.Value[1] := Chart1.Value[1] + 1;
            end;


        ds.Dataset.Next;
     end;

   Screen.cursor:= crDefault;
   str(TotPes,S);
   Chart1.Title[{BOTTOMTIT}3] := 'Total de Pessoas: ' + S;
   if  (TotPes > 0) and
       ((TipoEstat = 3) or (TipoEstat = 5) or (TipoEstat = 6)) then
        Chart1.Title[{BOTTOMTIT}3] := Chart1.Title[{BOTTOMTIT}3] +
           '  com Média de ' + trim(FloatToStrF(TotVal/TotPes,ffFixed,12,2));

   {Close the VALUES channel}
   YMAX := 0;
   for I2 := 0  to  TAM - 1  do
       if  Chart1.Value[I2] > YMAX  then  YMAX := Chart1.Value[I2];
   Chart1.Adm[1] := YMAX;
	Chart1.CloseData({COD_VALUES}1);
   Chart1.Visible := True;

end;

end.
