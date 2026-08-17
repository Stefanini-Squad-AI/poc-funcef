unit fEstatCad;

interface                 

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  OleCtrls, chartfx3, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBClient, 
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, uCMClientDataSet, CmParamReport;

type
  TfrmEstatCad = class(TfrmSelPessoalMT)
    Chart1: TChartfx;
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    TipoEstat: integer;
    TituloGrafico: string;
    ValMinFaixa, ValMaxFaixa: array [1..8] of double;
  end;

var
  frmEstatCad: TfrmEstatCad;

implementation

{$R *.DFM}

procedure TfrmEstatCad.FormShow(Sender: TObject);
begin
  inherited;
  rgSequencia.Visible := false;
  cbxCandidatos.Enabled := false;
  case (TipoEstat) of
    0 : gbxSexo.Enabled := false;
    1 : gbxEstCivil.Enabled := false;
    2 : gbxGrauInstr.Enabled := false;
    3 : gbxTempAdm.Enabled := false;
    4 : gbxCep.Enabled := false;
    5 : gbxIdade.Enabled := false;
    6 : gbxSalario.Enabled := false;
    7 : rgSelSindi.Enabled := false;
  end;
end;

procedure TfrmEstatCad.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  rgSequencia.Visible := false;
end;

procedure TfrmEstatCad.bbtnConfirmarClick(Sender: TObject);
var
  c: byte;
  ValorCEP, iNumColunas, TotPessoas, I2: integer;
  YMax, ValSal, TotVal: double;
  MinMax : array[1..8, 1..8] of double;
  Codigos: variant;
begin
  inherited;
  ModalResult := mrNone;
  TotVal := 0;
  iNumColunas := 0;
  // Atribuir as legendas de acordo com o tipo de gráfico a ser feito
  case (TipoEstat) of
    0 : // Sexo
    begin
      Chart1.OpenDataEx(1, 1, 2);
      iNumColunas := 2;
      Chart1.Legend[0] := 'Feminino';
      Chart1.Legend[1] := 'Masculino';
    end;

    1 : // Estado Civil
    begin
      iNumColunas := 5;
      Chart1.OpenDataEx(1, 1, 5);
      Chart1.Legend[0] := 'Solteiro';
      Chart1.Legend[1] := 'Casado';
      Chart1.Legend[2] := 'Div./Desq.';
      Chart1.Legend[3] := 'Viúvo';
      Chart1.Legend[4] := 'Outro';
    end;

    2 : // Escolaridade
    begin
      CdsGrauInstr.First;
      while not(CdsGrauInstr.EOF) do
      begin
        Inc(iNumColunas);
        CdsGrauInstr.Next;
      end;

      Chart1.OpenDataEx(1, 1, iNumColunas);
      Codigos := VarArrayCreate([0,iNumColunas-1], varDouble);
      iNumColunas := 0;
      CdsGrauInstr.First;
      while not(CdsGrauInstr.EOF) do
      begin
        Chart1.Legend[iNumColunas] := CdsGrauInstr.FieldByName('DESCRICAO').asString;
        Codigos[iNumColunas] := CdsGrauInstr.FieldByName('IDGRINSTR').asFloat;
        Inc(iNumColunas);
        CdsGrauInstr.Next;
      end;
    end;

    3..6 : // Tempo de Casa + Faixa de CEP + Faixa Etária + Faixa de Salário
    begin
      iNumColunas := 0;
      for c:=1 to 8 do
        if (ValMaxFaixa[c] <> 0) then
          Inc(iNumColunas);

      Chart1.OpenDataEx(1, 1, iNumColunas);

      for c:=1 to 8 do
        if (ValMaxFaixa[c] <> 0) then
        begin
          Chart1.Legend[c-1] := FloatToStr(ValMinFaixa[c]) +' a '+ FloatToStr(ValMaxFaixa[c]);
          MinMax[1, c] := ValMinFaixa[c];
          MinMax[2, c] := ValMaxFaixa[c];
        end;
    end;

    7 : // Sindicato
    begin
      if not(CdsSindicato.Active) then
        sqlSindicato.Open;

      CdsSindicato.First;
      iNumColunas := 0;
      while not(CdsSindicato.EOF) do
      begin
        Inc(iNumColunas);
        CdsSindicato.Next;
      end;

      Chart1.OpenDataEx(1, 1, iNumColunas);
      Codigos := VarArrayCreate([0,iNumColunas-1], varDouble);
      iNumColunas := 0;
      CdsSindicato.First;
      while not(CdsSindicato.EOF) do
      begin
        Chart1.Legend[iNumColunas] := CdsSindicato.FieldByName('NOME').asString;
        Codigos[iNumColunas] := CdsSindicato.FieldByName('IDPESSOA').asFloat;
        Inc(iNumColunas);
        CdsSindicato.Next;
      end;
    end;

    8 : // Tipo de Função
    begin
      Chart1.OpenDataEx(1, 1, 2);
      iNumColunas := 2;
      Chart1.Legend[0] := 'Direto';
      Chart1.Legend[1] := 'Indireto';
    end;
  end;

  Chart1.ThisSerie := 0;
  Chart1.Decimals := 0;
  Chart1.Title[2] := 'Estatística por ' + TituloGrafico;

  for I2:=0 to iNumColunas-1 do
    Chart1.Value[I2] := 0;

  // Acumula os registros de Pessoal
  TotPessoas := 0;
  CdsPrincipal.First;
  while not(CdsPrincipal.EOF) do
  begin
    Inc(TotPessoas);

    case (TipoEstat) of
      0 : // Sexo
      begin
        if (CdsPrincipal.FieldByName('SEXO').asString = 'F') then
          Chart1.Value[0] := Chart1.Value[0] + 1
        else
          Chart1.Value[1] := Chart1.Value[1] + 1;
      end;

      1 : // Estado Civil
      begin
        if (CdsPrincipal.FieldByName('ESTCIVIL').asString = 'S') then
          Chart1.Value[0] := Chart1.Value[0] + 1
        else
        if (CdsPrincipal.FieldByName('ESTCIVIL').asString = 'C') then
          Chart1.Value[1] := Chart1.Value[1] + 1
        else
        if (CdsPrincipal.FieldByName('ESTCIVIL').asString = 'D') then
          Chart1.Value[2] := Chart1.Value[2] + 1
        else
        if (CdsPrincipal.FieldByName('ESTCIVIL').asString = 'V') then
          Chart1.Value[3] := Chart1.Value[3] + 1
        else
        if (CdsPrincipal.FieldByName('ESTCIVIL').asString = 'O') then
          Chart1.Value[4] := Chart1.Value[4] + 1;
      end;

      2 : // Escolaridade
      begin
        for I2:=0 to iNumColunas-1 do
          if (Codigos[I2] = CdsPrincipal.FieldByName('IDGRINSTR').asFloat) then
          begin
            Chart1.Value[I2] := Chart1.Value[I2] + 1;
            break;
          end;
      end;

      3 : // Tempo de Casa
      begin
        for I2:=0 to iNumColunas-1 do
          if (int((Date + 1 - CdsPrincipal.FieldByName('DATAADMISSAO').asDateTime) /
              365.25) >= MinMax[1, I2+1]) and
             (int((Date + 1 - CdsPrincipal.FieldByName('DATAADMISSAO').asDateTime) /
              365.25) <= MinMax[2, I2+1]) then
          begin
            Chart1.Value[I2] := Chart1.Value[I2] + 1;
            TotVal := TotVal + int((Date + 1 -
              CdsPrincipal.FieldByName('DATAADMISSAO').asDateTime) / 365.25);
          end;
      end;

      4 : // CEP da Residência
      begin
        ValorCEP := 0;
        if (CdsPrincipal.FieldByName('CEP').asString  <> '') then
          ValorCEP := Round(StrToInt(CdsPrincipal.FieldByName('CEP').asString) / 1000);

        for I2:=0 to iNumColunas-1 do
          if (ValorCEP >= MinMax[1,I2+1]) and (ValorCEP <= MinMax[2,I2+1]) then
            Chart1.Value[I2] := Chart1.Value[I2] + 1;
      end;

      5 : // Idade
      begin
        for I2:=0 to iNumColunas-1 do
          if (int((Date + 1 - CdsPrincipal.FieldByName('DATANASC').asDateTime) /
              365.25) >= MinMax[1, I2+1]) and
             (int((Date + 1 - CdsPrincipal.FieldByName('DATANASC').asDateTime) /
              365.25) <= MinMax[2, I2+1]) then
          begin
            Chart1.Value[I2] := Chart1.Value[I2] + 1;
            TotVal := TotVal + int((Date + 1 -
              CdsPrincipal.FieldByName('DATANASC').Value) / 365.25);
          end;
      end;

      6 : // Salário
      begin
        ValSal := CdsPrincipal.FieldByName('SALARIOATUAL').asFloat;
        if (CdsPrincipal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
          ValSal := ValSal * 30
        else
        if (CdsPrincipal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
          ValSal := ValSal * 220; //tblPessoalHorario;

        for I2:=0 to iNumColunas-1 do
          if (ValSal >= MinMax[1, I2+1]) and (ValSal <= MinMax[2, I2+1]) then
          begin
            Chart1.Value[I2] := Chart1.Value[I2] + 1;
            TotVal := TotVal + ValSal;
          end;
      end;

      7 : // Sindicato
      begin
        for I2:=0 to iNumColunas-1 do
          if (Codigos[I2] = CdsPrincipal.FieldByName('IDSINDICATO').asFloat) then
          begin
            Chart1.Value[I2] := Chart1.Value[I2] + 1;
            break;
          end;
      end;

      8 : // Tipo de Função (D/I)
      begin
        if (CdsPrincipal.FieldByName('TIPOMAODEOBRA').asString = 'D') then
          Chart1.Value[0] := Chart1.Value[0] + 1
        else
          Chart1.Value[1] := Chart1.Value[1] + 1;
      end;
    end;
    CdsPrincipal.Next;
  end;

  Chart1.Title[3] := 'Total de Pessoas: ' + IntToStr(TotPessoas);
  if (TotPessoas > 0) and (TipoEstat in [3,5,6]) then
    Chart1.Title[3] := Chart1.Title[3] +'  com Média de '+
      Trim(FloatToStrF(TotVal / TotPessoas, ffFixed, 12, 2));

  YMax := 0;
  for I2:=0 to iNumColunas-1 do
    if (Chart1.Value[I2] > YMax) then
      YMax := Chart1.Value[I2];

  Chart1.Adm[1] := YMax;
  Chart1.CloseData(1);
  Chart1.Visible := true;
end;

end.
