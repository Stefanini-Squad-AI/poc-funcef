unit FEstCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3, Wwquery,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEstCusto = class(TfrmSelPessoal)
    Chart1: TChartfx;
    qryCargo2: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstCusto: TfrmEstCusto;
  VEZ, J, TOTHOR, TOTVAL, TAM, TamY, SVTAM: integer;
  CharVal, CODIGO, DESCTB, TOTAIS: variant;
  MATRIC, YMAX: double;
  Ano, Mes, Dia: word;
  MesCurto: array[1..12] of string[3] = ('Jan','Fev','Mar'
             ,'Abr','Mai','Jun','Jul','Ago','Set','Out'
             ,'Nov','Dez');
  TituTela1: array[1..2] of string = ('das Horas de','do Investimento em');
  TituTela2: array[1..2] of string = ('Total de Horas: ','Custo Total: ');

implementation

uses fSelEstCusto, uSistema, dBaseDados, uFuncoesUteisRH, fAguarde;

{$R *.DFM}

procedure TfrmEstCusto.FormCreate(Sender: TObject);
begin
  inherited;
  rgSequencia.Visible   := false;
  cbxCandidatos.Enabled := false;

  if (frmSelEstCusto.rgTipoEst.ItemIndex = 2) or (frmSelEstCusto.rgTipoEst.ItemIndex = 3) then
  begin
    dtmBaseDados.qry.Close;
    dtmBaseDados.qry.Sql.Clear;
    with dtmBaseDados.qry.Sql do
    begin
      if (frmSelEstCusto.rgTipoEst.ItemIndex = 3) then
         Add('SELECT IDGRINSTR AS CODIGO,  DESCRICAO FROM GRINSTR ORDER BY IDGRINSTR')
      else
         Add('SELECT CODGRPFUNC AS CODIGO, DESCGRPFUNC AS DESCRICAO ' +
             'FROM GRUPFUNC ORDER BY DESCRICAO');
    end;
    dtmBaseDados.qry.Open;
  end;

end;

procedure TfrmEstCusto.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult         := mrNone;
  rgSequencia.Visible := false;
  Chart1.Visible      := false;

end;

procedure TfrmEstCusto.bbtnConfirmarClick(Sender: TObject);
var
  IND, IND1, I, I1, I2: integer;
  I3: double;
  S: string;
  MINMAX : array[1..8,1..8] of integer;
begin
  inherited;
  if (frmSelEstCusto.rgTipoEst.ItemIndex = 2) then
     qryCargo2.Open;

  Chart1.Visible := False;
  frmAguarde.Mostra('Estatística de Custos de RH');
  frmAguarde.Pos := 0;
  ModalResult := mrNone;
  TAM  := 8;
  TamY := 0;
  if (frmSelEstCusto.rgTipoEst.ItemIndex = 0) then
    TamY := 2
  else
  if (frmSelEstCusto.rgTipoEst.ItemIndex = 1) then
    TamY := 7
  else
  if ((frmSelEstCusto.rgTipoEst.ItemIndex = 2) or (frmSelEstCusto.rgTipoEst.ItemIndex = 3)) then
    TamY := dtmBaseDados.qry.RecordCount
  else
  begin
    if frmSelEstCusto.ednMax8.Text <> '' then
       TamY := 8
    else
    if frmSelEstCusto.ednMax7.Text <> '' then
       TamY := 7
    else
    if frmSelEstCusto.ednMax6.Text <> '' then
       TamY := 6
    else
    if frmSelEstCusto.ednMax5.Text <> '' then
       TamY := 5
    else
    if frmSelEstCusto.ednMax4.Text <> '' then
       TamY := 4
    else
    if frmSelEstCusto.ednMax3.Text <> '' then
       TamY := 3
    else
    if frmSelEstCusto.ednMax2.Text <> '' then
       TamY := 2
    else
       TamY := 1;

    MINMAX[1,1] := StrToIntDef(frmSelEstCusto.ednMin1.Text,0);
    MINMAX[2,1] := StrToIntDef(frmSelEstCusto.ednMax1.Text,0);
    MINMAX[1,2] := StrToIntDef(frmSelEstCusto.ednMin2.Text,0);
    MINMAX[2,2] := StrToIntDef(frmSelEstCusto.ednMax2.Text,0);
    MINMAX[1,3] := StrToIntDef(frmSelEstCusto.ednMin3.Text,0);
    MINMAX[2,3] := StrToIntDef(frmSelEstCusto.ednMax3.Text,0);
    MINMAX[1,4] := StrToIntDef(frmSelEstCusto.ednMin4.Text,0);
    MINMAX[2,4] := StrToIntDef(frmSelEstCusto.ednMax4.Text,0);
    MINMAX[1,5] := StrToIntDef(frmSelEstCusto.ednMin5.Text,0);
    MINMAX[2,5] := StrToIntDef(frmSelEstCusto.ednMax5.Text,0);
    MINMAX[1,6] := StrToIntDef(frmSelEstCusto.ednMin6.Text,0);
    MINMAX[2,6] := StrToIntDef(frmSelEstCusto.ednMax6.Text,0);
    MINMAX[1,7] := StrToIntDef(frmSelEstCusto.ednMin7.Text,0);
    MINMAX[2,7] := StrToIntDef(frmSelEstCusto.ednMax7.Text,0);
    MINMAX[1,8] := StrToIntDef(frmSelEstCusto.ednMin8.Text,0);
    MINMAX[2,8] := StrToIntDef(frmSelEstCusto.ednMax8.Text,0);
  end;

  CODIGO := VarArrayCreate([1, TamY], varOleStr);
  DESCTB := VarArrayCreate([1, TamY], varOleStr);

  IND1   := 0;
  if (frmSelEstCusto.rgTipoEst.ItemIndex = 0) then
  begin
    CODIGO[1] := 'M';
    DESCTB[1] := 'Masculino';
    CODIGO[2] := 'F';
    DESCTB[2] := 'Feminino';
  end
  else
  if (frmSelEstCusto.rgTipoEst.ItemIndex = 1) then
  begin
    CODIGO[1] := 'E';
    DESCTB[1] := 'Efetivo';
    CODIGO[2] := 'S';
    DESCTB[2] := 'Efetivo Especial';
    CODIGO[3] := 'T';
    DESCTB[3] := 'Temporário';
    CODIGO[4] := 'G';
    DESCTB[4] := 'Estagiário';
    CODIGO[5] := '3';
    DESCTB[5] := 'Terceiro';
    CODIGO[6] := 'P';
    DESCTB[6] := 'Prop/Dir s/ Vinc';
    CODIGO[7] := 'A';
    DESCTB[7] := 'Autônomo';
  end
  else
  if (frmSelEstCusto.rgTipoEst.ItemIndex = 4) then
  begin
    if TamY >= 1 then
    begin
      CODIGO[1] := '1';
      DESCTB[1] := frmSelEstCusto.ednMin1.Text + '-' + frmSelEstCusto.ednMax1.Text;
    end;
    if TamY >= 2 then
    begin
      CODIGO[2] := '2';
      DESCTB[2] := frmSelEstCusto.ednMin2.Text + '-' + frmSelEstCusto.ednMax2.Text;
    end;
    if TamY >= 3 then
    begin
      CODIGO[3] := '3';
      DESCTB[3] := frmSelEstCusto.ednMin3.Text + '-' + frmSelEstCusto.ednMax3.Text;
    end;
    if TamY >= 4 then
    begin
      CODIGO[4] := '4';
      DESCTB[4] := frmSelEstCusto.ednMin4.Text + '-' + frmSelEstCusto.ednMax4.Text;
    end;
    if TamY >= 5 then
    begin
      CODIGO[5] := '5';
      DESCTB[5] := frmSelEstCusto.ednMin5.Text + '-' + frmSelEstCusto.ednMax5.Text;
    end;
    if TamY >= 6 then
    begin
      CODIGO[6] := '6';
      DESCTB[6] := frmSelEstCusto.ednMin6.Text + '-' + frmSelEstCusto.ednMax6.Text;
    end;
    if TamY >= 7 then
    begin
      CODIGO[7] := '7';
      DESCTB[7] := frmSelEstCusto.ednMin7.Text + '-' + frmSelEstCusto.ednMax7.Text;
    end;
    if TamY >= 8 then
    begin
      CODIGO[8] := '8';
      DESCTB[8] := frmSelEstCusto.ednMin8.Text + '-' + frmSelEstCusto.ednMax8.Text;
    end;
  end
  else
  begin
    dtmBaseDados.qry.First;
    while not(dtmBaseDados.qry.EOF) do
    begin
      IND1 := IND1 + 1;
      CODIGO[IND1] := dtmBaseDados.qry.FieldByName('CODIGO').AsString;
      DESCTB[IND1] := dtmBaseDados.qry.FieldByName('DESCRICAO').AsString;
      dtmBaseDados.qry.Next;
    end;
  end;

  CharVal := VarArrayCreate([1, TamY, 1, TAM], varDouble);
  TOTAIS  := VarArrayCreate([1, TamY], varDouble);

  for I1:=1 to TamY do
  begin
    TOTAIS[I1] := 0;
    for I2:=1 to TAM do
      CharVal[I1,I2] := 0;
  end;

  while not(tblPessoal.EOF) do
  begin
    frmSelEstCusto.qryVariavelMensal.Close;
    frmSelEstCusto.qryVariavelMensal.ParamByName('IDPESSOA').AsString :=
         tblPessoal.FieldByName('IDPESSOA').AsString;
    frmSelEstCusto.qryVariavelMensal.Open;
    if not frmSelEstCusto.qryVariavelMensal.IsEmpty then
    begin
        for IND:=1 to TamY do
        begin
          // Rotina para determinar o ponteiro onde vai somar
          if (frmSelEstCusto.rgTipoEst.ItemIndex = 0) and
             (tblPessoal.FieldByName('SEXO').AsString = CODIGO[IND]) then
            break;

          if (frmSelEstCusto.rgTipoEst.ItemIndex = 1) and
             (tblPessoal.FieldByName('TIPOCONTRATO').AsString = CODIGO[IND]) then
            break;

          if (frmSelEstCusto.rgTipoEst.ItemIndex = 2) and
             (qryCargo2.FieldByName('CODGRPFUNC').AsString = CODIGO[IND]) then
            break;

          if (frmSelEstCusto.rgTipoEst.ItemIndex = 3) and
             (tblPessoal.FieldByName('IDGRINSTR').AsString = CODIGO[IND]) then
            break;

          // FAIXA ETÁRIA
          if (frmSelEstCusto.rgTipoEst.ItemIndex = 4) then
              if  (int((Date + 1 -
                   tblPessoal.FieldByName('DATANASC').Value)/
                   365.25) >= MINMAX[1,IND])  and
                   (int((Date + 1 -
                   tblPessoal.FieldByName('DATANASC').Value)/
                   365.25) <= MINMAX[2,IND])  then
                   break;

        end;
        if (IND >= 1)  and  (IND <= TamY) then
          for IND1:=1 to Tam do
          begin
           CharVal[IND,IND1] := CharVal[IND,IND1] +
             frmSelEstCusto.qryVariavelMensal.FieldByName('VAL_COL' + IntToStr(IND1)).AsFloat;
           TOTAIS[IND] := TOTAIS[IND] +
             frmSelEstCusto.qryVariavelMensal.FieldByName('VAL_COL' + IntToStr(IND1)).AsFloat;
          end;



    end;

    tblPessoal.Next;
  end;

  SVTAM := TAMY;

  for IND:=1 to TamY do
    if TOTAIS[IND] = 0  then  dec(SvTam);


  Chart1.OpenDataEx({COD_VALUES}1,SvTam,TAM);
  Chart1.ChartType := 2;


  Chart1.Legend[0] := frmSelEstCusto.regTituloLinha[1].Linha1 + ' ' + frmSelEstCusto.regTituloLinha[1].Linha2;
  Chart1.Legend[1] := frmSelEstCusto.regTituloLinha[2].Linha1 + ' ' + frmSelEstCusto.regTituloLinha[2].Linha2;
  Chart1.Legend[2] := frmSelEstCusto.regTituloLinha[3].Linha1 + ' ' + frmSelEstCusto.regTituloLinha[3].Linha2;
  Chart1.Legend[3] := frmSelEstCusto.regTituloLinha[4].Linha1 + ' ' + frmSelEstCusto.regTituloLinha[4].Linha2;
  Chart1.Legend[4] := frmSelEstCusto.regTituloLinha[5].Linha1 + ' ' + frmSelEstCusto.regTituloLinha[5].Linha2;
  Chart1.Legend[5] := frmSelEstCusto.regTituloLinha[6].Linha1 + ' ' + frmSelEstCusto.regTituloLinha[6].Linha2;
  Chart1.Legend[6] := frmSelEstCusto.regTituloLinha[7].Linha1 + ' ' + frmSelEstCusto.regTituloLinha[7].Linha2;
  Chart1.Legend[7] := frmSelEstCusto.regTituloLinha[8].Linha1 + ' ' + frmSelEstCusto.regTituloLinha[8].Linha2;

  Chart1.Decimals  := 0;
  Chart1.Title[{TOPTIT}2] := 'Estatística de Custos de RH';

  YMAX   := 0;
  TOTVAL := 0;
  I2     := 0;
  for I1:=0 to (TamY - 1) do
  begin
      if TOTAIS[I1+1] <> 0  then
      begin
        Chart1.ThisSerie  := I2;
        Chart1.SerLeg[I2] := DESCTB[I1+1];
        I2 := I2 + 1;
        for I:=0 to (TAM - 1) do
        begin
          Chart1.Value[I] := CharVal[I1+1,I+1];

          TOTVAL := TOTVAL + CharVal[I1+1,I+1];

          if (Chart1.Value[I] > YMAX) then
              YMAX := Chart1.Value[I];
        end;
      end;
  end;

  str(TOTVAL,S);
  Chart1.Title[{BOTTOMTIT}3] := 'Mês de Referência : '+
    MesExtensoAno(frmSelEstCusto.speAno.Text +'/'+ PoeZero(frmSelEstCusto.cmbMes.ItemIndex+1)) +
    '   -   Valor Total: ' + S;
  I3 := 1;
  while (YMAX > I3) do
    I3 := I3*10;
  I3 := int(I3 / 20);      {Escala de Y}

  Chart1.Adm[1] := YMAX;    {Valor Máximo de Y}
  Chart1.Adm[4] := I3;      {Escala de Y}
  Chart1.CloseData({COD_VALUES}1);   {Close the VALUES channel}
  frmAguarde.Apaga;
  if TOTVAL <> 0  then
     Chart1.Visible := true
  else
     ShowMessage('Não Há Dados a Serem Exibidos !');


end;

end.
