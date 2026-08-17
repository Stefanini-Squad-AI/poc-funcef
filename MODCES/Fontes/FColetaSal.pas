unit fColetaSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal, Db,
  DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Wwquery,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlCalcRub;

type
  TfrmColetaSal = class(TfrmSelPessoal)
    lstSalReal: TListBox;
    lstSalNom: TListBox;
    lstQtdeSal: TListBox;
    ds2: TwwDataSource;
    tblHstben: TwwQuery;
    tblHstbenDESCRICAO: TStringField;
    tblHstbenANOMESINICIO: TStringField;
    tblHstbenPARCELAS: TFloatField;
    tblHstbenNUMOCORRENCIAS: TFloatField;
    tblHstbenVALORC: TFloatField;
    tblHstbenFLGPERMANENTE: TFloatField;
    tblHstbenIDREGRACALCULO: TFloatField;
    tblHstbenVALORRUBRICA: TFloatField;
    tblHstbenIDRUBRICA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlCalcRub: TCtrlCalcRub;
  end;

var
  frmColetaSal: TfrmColetaSal;
  RegRegra, RegPessoa: String;

implementation

uses fCadPesqEmpr, uFuncoesUteis, dBaseDados;

{$R *.DFM}

procedure TfrmColetaSal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.Initialize(dtmBaseDados.dbBaseDados, true);

  rgSequencia.Visible := false;
  cbxCandidatos.Enabled := false;
  lstCodCargo.Items.Add(frmCadPesqEmpr.dbedCodCargo.Text);
  lstCargo.Items.Add(frmCadPesqEmpr.dblcCargo.Text);
  dblcCargo.SelText := frmCadPesqEmpr.dblcCargo.Text;
  rgSelCargo.ItemIndex := 1;
  rgSelCargo.Enabled := false;
end;

procedure TfrmColetaSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCalcRub);
  inherited;
end;

procedure TfrmColetaSal.bbtnConfirmarClick(Sender: TObject);
var
  c, iAux: Integer;
  rValBeneficio: real;
  dValCalc: double;
  bNaoTem: boolean;
begin
  tblHstben.Close;
  inherited;
  tblHstben.Open;
  while not(tblPessoal.EOF) do
  begin
    rValBeneficio := 0;
    if (tblPessoal.FieldByName('SALARIOATUAL').IsNull) then
      Valor := 0
    else
      Valor := ds.Dataset.FieldByName('SALARIOATUAL').asFloat;

    if (tblPessoal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
      Valor := Valor * 30
    else
    if (tblPessoal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
      Valor := Valor * tblPessoal.FieldByName('JORNADAMENSAL').asInteger;

    // Aqui entra a rotina de cálculo do benefício em rValBeneficio
    tblHstben.First;
    while not(tblHstben.EOF) do
    begin
      if (tblHstben.FieldByName('ANOMESINICIO').asString <= RetornaAnoMes(Date)) and
         ((tblHstben.FieldByName('NUMOCORRENCIAS').asInteger <>
           tblHstben.FieldByName('PARCELAS').asInteger) or
          (tblHstben.FieldByName('FLGPERMANENTE').asInteger = 1)  or
          (tblHstben.FieldByName('IDREGRACALCULO').asFloat = -99)) then
      begin
        if (tblHstBen.FieldByName('VALORRUBRICA').IsNull) then
          dValCalc := 0
        else
          dValCalc := tblHstBen.FieldByName('VALORRUBRICA').asFloat;

        if not(tblHstben.FieldByName('IdRegraCalculo').IsNull) and
          (tblHstben.FieldByName('IDREGRACALCULO').asFloat <> -99) then
        begin
          RegRegra := tblHstben.FieldByName('IdRegraCalculo').asString;
          RegPessoa := tblPessoal.FieldByName('IDPESSOA').asString;
          CtrlCalcRub.CalcBeneficioRegra(RegRegra, RegPessoa, dValCalc);
        end;

        rValBeneficio := rValBeneficio + dValCalc;
      end;
      tblHstben.Next;
    end;

    rValBeneficio := Valor + rValBeneficio;   // Soma Salário com Benefício
    bNaoTem := True;
    if (lstSalNom.Items.Count > 0) then
      for c:=0 to lstSalNom.Items.Count-1 do
      begin
        if (FloatToStrF(Valor, ffFixed,12,2) = lstSalNom.Items[c]) and
           (FloatToStrF(rValBeneficio,ffFixed,12,2) = lstSalReal.Items[c]) then
        begin
          iAux := StrToInt(lstQtdeSal.Items[c]) + 1;
          lstQtdeSal.Items[c] := IntToStr(iAux);
          bNaoTem := false;
          break;
        end;
      end;

    if (bNaoTem) then
    begin
      lstSalNom.Items.Add(FloatToStrF(Valor, ffFixed,12,2));
      lstSalReal.Items.Add(FloatToStrF(rValBeneficio, ffFixed,12,2));
      lstQtdeSal.Items.Add('1');
    end;
    tblPessoal.Next;
  end;
end;

end.
