unit FTabPesqui;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, Mask, Db,
  DBCtrls, DBTables, Wwtable, Wwdatsrc, Wwquery, TB97, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, FSairAjuda;

type
  TfrmTabPesqui = class(TfrmSairAjuda)
    gbxMedia: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblMenor: TLabel;
    lblMenorR: TLabel;
    lbl1Q: TLabel;
    lbl1QR: TLabel;
    lblModa: TLabel;
    lblModaR: TLabel;
    lblMedia: TLabel;
    lblMediaR: TLabel;
    lblMediana: TLabel;
    lblMedianaR: TLabel;
    lbl3Q: TLabel;
    lbl3QR: TLabel;
    lblMaior: TLabel;
    lblMaiorR: TLabel;
    Label10: TLabel;
    lblFreq: TLabel;
    ds2: TwwDataSource;
    ds3: TwwDataSource;
    ds4: TwwDataSource;
    gbxPesquisa: TGroupBox;
    Label11: TLabel;
    dblcPesq: TwwDBLookupCombo;
    dblcCargo: TwwDBLookupCombo;
    rgExclui: TRadioGroup;
    dblcEntid: TwwDBLookupCombo;
    dbgPesq: TwwDBGrid;
    tblTendencia: TwwTable;
    tblTendenciaIDPESQSALAR: TFloatField;
    tblTendenciaIDCARGO: TFloatField;
    tblTendenciaIDEMPRESAPARTIC: TFloatField;
    tblTendenciaFREQ: TFloatField;
    tblTendenciaMENOR: TFloatField;
    tblTendenciaPRIMQUA: TFloatField;
    tblTendenciaMEDIA: TFloatField;
    tblTendenciaMODA: TFloatField;
    tblTendenciaMEDIANA: TFloatField;
    tblTendenciaTERCQUA: TFloatField;
    tblTendenciaMAIOR: TFloatField;
    tblTendenciaMENOR_R: TFloatField;
    tblTendenciaPRIMQUA_R: TFloatField;
    tblTendenciaMEDIA_R: TFloatField;
    tblTendenciaMODA_R: TFloatField;
    tblTendenciaMEDIANA_R: TFloatField;
    tblTendenciaTERCQUA_R: TFloatField;
    tblTendenciaMAIOR_R: TFloatField;
    ds5: TwwDataSource;
    tblEntid: TwwTable;
    tblDadoPesq: TwwTable;
    tblDadoPesqFREQ: TFloatField;
    tblDadoPesqNOMINAL: TFloatField;
    tblDadoPesqREAL: TFloatField;
    tblDadoPesqIDPESQSALAR: TFloatField;
    tblDadoPesqIDCARGO: TFloatField;
    tblDadoPesqIDEMPRPART: TFloatField;
    tblDadoPesqNUMSEQ: TFloatField;
    qryCargo: TwwQuery;
    qryEntid: TwwQuery;
    qryPesqui: TwwQuery;
    tblAjuste: TwwTable;
    tblAjusteDESCRICAO: TStringField;
    tblAjusteFATOR: TFloatField;
    tblAjusteIDPESQSALAR: TFloatField;
    tblAjusteIDEMPRESAPARTIC: TFloatField;
    lstSalNom: TListBox;
    lstSalReal: TListBox;
    tblTendenciaENTIDADE: TStringField;
    tblTendenciaMENORC: TIntegerField;
    tblTendenciaPRIMQUAC: TIntegerField;
    tblTendenciaMODAC: TIntegerField;
    tblTendenciaMEDIAC: TIntegerField;
    tblTendenciaMEDIANAC: TIntegerField;
    tblTendenciaTERCQUAC: TIntegerField;
    tblTendenciaMAIORC: TIntegerField;
    tblTendenciaMENOR_RC: TIntegerField;
    tblTendenciaPRIMQUA_RC: TIntegerField;
    tblTendenciaMODA_RC: TIntegerField;
    tblTendenciaMEDIA_RC: TIntegerField;
    tblTendenciaMEDIANA_RC: TIntegerField;
    tblTendenciaTERCQUA_RC: TIntegerField;
    tblTendenciaMAIOR_RC: TIntegerField;
    bbtnGrafico: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    edData: TEdit;
    procedure tblTendenciaCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dblcPesqEnter(Sender: TObject);
    procedure rgExcluiClick(Sender: TObject);
    procedure bbtnGraficoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcPesqChange(Sender: TObject);
  public
    Vez: integer;
  end;

var
  frmTabPesqui: TfrmTabPesqui;

implementation

uses uSistema, fTelaAut, fChartPesq;

{$R *.DFM}

procedure TfrmTabPesqui.FormCreate(Sender: TObject);
begin
  tblEntid.Open;
  qryPesqui.Open;
  tblAjuste.Open;
  tblTendencia.Open;
  tblDadoPesq.Open;
  qryCargo.Prepare;
  qryEntid.Prepare;
  inherited;
end;

procedure TfrmTabPesqui.tblTendenciaCalcFields(DataSet: TDataSet);
var
  rFatAjus: real;
begin
  inherited;
  if (tblEntid.FindKey([tblTendencia.FieldByName('IDEMPRESAPARTIC').asFloat])) then
    tblTendencia.FieldByName('ENTIDADE').asString := tblEntid.FieldByName('NOME').asString
  else
    tblTendencia.FieldByName('ENTIDADE').asString := 'Empresa ' +
      tblTendencia.FieldByName('IDEMPRESAPARTIC').asString;

  rFatAjus := 1;
  if (tblTendencia.FieldByName('IDEMPRESAPARTIC').asInteger <> Sistema.IdEmpresa) then
  begin
    tblAjuste.First;
    while not(tblAjuste.EOF) do
    begin
      if (tblTendencia.FieldByName('IDEMPRESAPARTIC').asFloat =
          tblAjuste.FieldByName('IDEMPRESAPARTIC').asFloat) then
      begin
        rFatAjus := tblAjuste.FieldByName('FATOR').asFloat;
        break;
      end;
      tblAjuste.Next;
    end;
  end;
  tblTendencia.FieldByName('MENORC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MENOR').asFloat);
  tblTendencia.FieldByName('PRIMQUAC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('PRIMQUA').asFloat);
  tblTendencia.FieldByName('MEDIAC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MEDIA').asFloat);
  tblTendencia.FieldByName('MODAC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MODA').asFloat);
  tblTendencia.FieldByName('MEDIANAC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MEDIANA').asFloat);
  tblTendencia.FieldByName('TERCQUAC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('TERCQUA').asFloat);
  tblTendencia.FieldByName('MAIORC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MAIOR').asFloat);
  tblTendencia.FieldByName('MENOR_RC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MENOR_R').asFloat);
  tblTendencia.FieldByName('PRIMQUA_RC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('PRIMQUA_R').asFloat);
  tblTendencia.FieldByName('MEDIA_RC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MEDIA_R').asFloat);
  tblTendencia.FieldByName('MODA_RC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MODA_R').asFloat);
  tblTendencia.FieldByName('MEDIANA_RC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MEDIANA_R').asFloat);
  tblTendencia.FieldByName('TERCQUA_RC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('TERCQUA_R').asFloat);
  tblTendencia.FieldByName('MAIOR_RC').asFloat :=  int(rFatAjus *
               tblTendencia.FieldByName('MAIOR_R').asFloat);
end;

procedure TfrmTabPesqui.dblcPesqChange(Sender: TObject);
begin
  if (Trim(dblcPesq.Text) <> '') then
  begin
    qryCargo.Close;
    qryCargo.ParamByName('PESQUISA').asInteger := qryPesqui.FieldByName('IDPESQSALAR').asInteger;
    qryCargo.Open;
    rgExcluiClick(Self);
    edData.Text := qryPesqui.FieldByName('DATAREFPESQ').asString;
  end;
  dblcCargo.Enabled := (Trim(dblcPesq.Text) <> '');  
end;

procedure TfrmTabPesqui.dblcPesqEnter(Sender: TObject);
begin
  dbgPesq.Visible     := false;
  gbxMedia.Visible    := false;
  bbtnGrafico.Enabled := false;
end;

procedure TfrmTabPesqui.rgExcluiClick(Sender: TObject);
begin
  inherited;
  dblcEntid.Visible := (rgExclui.ItemIndex = 1);
  if (rgExclui.ItemIndex = 1) then
  begin
    qryEntid.Close;
    qryEntid.ParamByName('PESQUISA').asInteger := qryPesqui.FieldByName('IDPESQSALAR').asInteger;
    qryEntid.ParamByName('CARGO').asInteger    := qryCargo.FieldByName('IDCARGO').asInteger;
    qryEntid.Open;
  end;

  dblcPesqEnter(rgExclui);
end;

procedure TfrmTabPesqui.bbtnGraficoClick(Sender: TObject);
var
  c: byte;
begin
  for c:=1 to 2 do
  begin
    Vez := c;
    AbrirFormModal(frmChartPesq, TfrmChartPesq);
    frmChartPesq.Free;
  end;
end;

procedure TfrmTabPesqui.bbtnConfirmarClick(Sender: TObject);
var
  iTotFreq, IND, iModaFreq, iTamanho: integer;
  rTotNom, rTotReal, rModaNom, rModaReal, rFatAjus: real;
  sVinteZeros: string[20];
  bTemDados: boolean;
begin
  // Filtra a tabela de Dados de Tendencia
  tblTendencia.wwFilter.Clear;
  tblTendencia.wwFilter.Add('IDPESQSALAR = '+Trim(qryPesqui.FieldByName('IDPESQSALAR').asString));
  tblTendencia.wwFilter.Add('IDCARGO = '+Trim(qryCargo.FieldByName('IDCARGO').asString));
  tblTendencia.FilterActivate;

  tblTendencia.First;
  lstSalNom.Clear;
  lstSalReal.Clear;
  sVinteZeros := '00000000000000000000';
  iTotFreq    := 0;
  iModaFreq   := 0;
  rTotNom     := 0;
  rTotReal    := 0;

  while not(tblTendencia.EOF) do
  begin
    // Filtra a tabela de Dados de Frequencia
    tblDadoPesq.wwFilter.Clear;
    tblDadoPesq.wwFilter.Add('IDPESQSALAR = '+Trim(qryPesqui.FieldByName('IDPESQSALAR').asString));
    tblDadoPesq.wwFilter.Add('IDCARGO = '+Trim(qryCargo.FieldByName('IDCARGO').asString));
    tblDadoPesq.wwFilter.Add('IDEMPRPART = '+Trim(tblTendencia.FieldByName('IDEMPRESAPARTIC').asString));
    tblDadoPesq.FilterActivate;

    tblDadoPesq.First;
    bTemDados := false;
    while not(tblDadoPesq.EOF) do
    begin
      bTemDados := true;
      if ((rgExclui.ItemIndex = 1) and (tblDadoPesqIDEMPRPART.asFloat =
         qryEntid.FieldByName('IDPESSOA').asFloat)) or
        ((rgExclui.ItemIndex = 0) and
         (tblDadoPesqIDEMPRPART.asFloat = Sistema.IdEmpresa)) then
      begin
        tblDadoPesq.Next;
        Continue;
      end;

      iTotFreq := iTotFreq + tblDadoPesqFREQ.asInteger;
      // Considera o Fator de Ajuste
      rFatAjus := 1;
      if (tblDadoPesq.FieldByName('IDEMPRPART').asFloat <> Sistema.IdEmpresa) then
      begin
        tblAjuste.First;
        while not(tblAjuste.EOF) do
        begin
          if (tblDadoPesq.FieldByName('IDEMPRPART').asFloat =
              tblAjuste.FieldByName('IDEMPRESAPARTIC').asFloat) then
          begin
            rFatAjus := tblAjuste.FieldByName('FATOR').asFloat;
            break;
          end;
          tblAjuste.Next;
        end;
      end;

      for IND:=1 to tblDadoPesqFREQ.asInteger do
      begin
        // Criar Listas Classificadas para Sal. Nominal e Real
        iTamanho := Length(FloatToStrF(tblDadoPesqNOMINAL.asFloat * rFatAjus, ffFixed,10,0));

        lstSalNom.Items.Add(Copy(sVinteZeros,1,20-iTamanho) +
          FloatToStrF(tblDadoPesqNOMINAL.asFloat * rFatAjus, ffFixed,10,0));

        iTamanho := Length(FloatToStrF(tblDadoPesqREAL.asFloat * rFatAjus, ffFixed,10,0));

        lstSalReal.Items.Add(copy(sVinteZeros,1,20-iTamanho) +
          FloatToStrF(tblDadoPesqREAL.asFloat * rFatAjus, ffFixed,10,0));
      end;

      rTotNom  := rTotNom  + tblDadoPesqFREQ.asFloat * tblDadoPesqNOMINAL.asFloat * rFatAjus;
      rTotReal := rTotReal + tblDadoPesqFREQ.asFloat * tblDadoPesqREAL.asFloat    * rFatAjus;

      if (tblDadoPesqFREQ.asInteger >= iModaFreq) then
      begin
        rModaNom  := tblDadoPesqNOMINAL.asFloat * rFatAjus;
        rModaReal := tblDadoPesqREAL.asFloat    * rFatAjus;
        iModaFreq := tblDadoPesqFREQ.asInteger;
      end;
      tblDadoPesq.Next;
    end;

    if not(bTemDados) then
    begin
      // Faz a acumulação com dados de tendência
      iTotFreq := iTotFreq + tblTendenciaFREQ.asInteger;
      iTamanho := Length(FloatToStrF(tblTendenciaMENORC.asFloat, ffFixed,10,0));

      lstSalNom.Items.Add(Copy(sVinteZeros,1,20-iTamanho) +
        FloatToStrF(tblTendenciaMENORC.asFloat, ffFixed,10,0));

      iTamanho := Length(FloatToStrF(tblTendenciaMENOR_RC.asFloat, ffFixed,10,0));

      lstSalReal.Items.Add(Copy(sVinteZeros,1,20-iTamanho) +
        FloatToStrF(tblTendenciaMENOR_RC.asFloat, ffFixed,10,0));

      if (tblTendenciaFREQ.asInteger > 1) then
      begin
        iTamanho := Length(FloatToStrF(tblTendenciaMAIORC.asFloat, ffFixed,10,0));

        lstSalNom.Items.Add(Copy(sVinteZeros,1,20-iTamanho) +
          FloatToStrF(tblTendenciaMAIORC.asFloat, ffFixed,10,0));

        iTamanho := Length(FloatToStrF(tblTendenciaMAIOR_RC.asFloat, ffFixed,10,0));

        lstSalReal.Items.Add(copy(sVinteZeros,1,20-iTamanho) +
          FloatToStrF(tblTendenciaMAIOR_RC.asFloat, ffFixed,10,0));
      end;
      if (tblTendenciaFREQ.asInteger > 2) then
        for IND:=3 to tblTendenciaFREQ.asInteger do
        begin
          iTamanho := Length(FloatToStrF(tblTendenciaMEDIAC.asFloat, ffFixed,10,0));

          lstSalNom.Items.Add(Copy(sVinteZeros,1,20-iTamanho) +
            FloatToStrF(tblTendenciaMEDIAC.asFloat, ffFixed,10,0));

          iTamanho := Length(FloatToStrF(tblTendenciaMEDIA_RC.asFloat, ffFixed,10,0));

          lstSalReal.Items.Add(Copy(sVinteZeros,1,20-iTamanho) +
            FloatToStrF(tblTendenciaMEDIA_RC.asFloat, ffFixed,10,0));
        end;

      rTotNom  := rTotNom  + tblTendenciaFREQ.asFloat * tblTendenciaMEDIAC.asFloat;
      rTotReal := rTotReal + tblTendenciaFREQ.asFloat * tblTendenciaMEDIA_RC.asFloat;

      if (tblTendenciaFREQ.asInteger >= iModaFreq) then
      begin
        rModaNom  := tblTendenciaMODAC.asFloat;
        rModaReal := tblTendenciaMODA_RC.asFloat;
        iModaFreq := tblTendenciaFREQ.asInteger;
      end;
    end;
    tblTendencia.Next;
  end;
  tblTendencia.First;

  if (lstSalNom.Items.Count = 0) then
    exit;

  lblFREQ.Caption  := IntToStr(iTotFreq);
  lblMENOR.Caption := IntToStr(StrToInt(lstSalNom.Items[0]));

  IND := Round(lstSalNom.Items.Count/4)-1;
  if (IND < 0) then
    IND := 0;

  lbl1Q.Caption := IntToStr(StrToInt(lstSalNom.Items[IND]));

  IND := Round(lstSalNom.Items.Count/2)-1;
  if (IND < 0) then
    IND := 0;

  lblMEDIANA.Caption := IntToStr(StrToInt(lstSalNom.Items[IND]));

  IND := Round(3*lstSalNom.Items.Count/4)-1;
  if (IND < 0) then
    IND := 0;

  lbl3Q.Caption     := IntToStr(StrToInt(lstSalNom.Items[IND]));
  lblMEDIA.Caption  := FloatToStrF(rTotNom / iTotFreq, ffFixed,10,0);
  lblMODA.Caption   := FloatToStrF(rModaNom, ffFixed,10,0);
  lblMAIOR.Caption  := IntToStr(StrToInt(lstSalNom.Items[lstSalNom.Items.Count-1]));
  lblMENORR.Caption := IntToStr(StrToInt(lstSalReal.Items[0]));

  IND := Round(lstSalReal.Items.Count/4)-1;
  if (IND < 0) then
    IND := 0;

  lbl1QR.Caption := IntToStr(StrToInt(lstSalReal.Items[IND]));

  IND := Round(lstSalReal.Items.Count/2)-1;
  if (IND < 0) then
    IND := 0;

  lblMEDIANAR.Caption := IntToStr(StrToInt(lstSalReal.Items[IND]));

  IND := Round(3*lstSalReal.Items.Count/4)-1;
  if (IND < 0) then
    IND := 0;

  lbl3QR.Caption    := IntToStr(StrToInt(lstSalReal.Items[IND]));
  lblMEDIAR.Caption := FloatToStrF(rTotReal / iTotFreq, ffFixed,10,0);
  lblMODAR.Caption  := FloatToStrF(rModaReal, ffFixed,10,0);
  lblMAIORR.Caption := IntToStr(StrToInt(lstSalReal.Items[lstSalReal.Items.Count - 1]));

  dbgPesq.Visible     := true;
  gbxMedia.Visible    := true;
  bbtnGrafico.Enabled := true;
end;

end.
