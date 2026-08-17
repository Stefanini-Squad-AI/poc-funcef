unit FTesteData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Spin, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, ComCtrls,
  Db, DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker,
  FSairAjudaImob;

type
  TfrmTesteData = class(TFrmSairAjudaImob)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Label28: TLabel;
    Label40: TLabel;
    Label27: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    spnSomaDias: TSpinEdit;
    edtDataSoma: TCMDateTimePicker;
    BitBtn12: TBitBtn;
    edtDataResultSoma: TCMDateTimePicker;
    BitBtn11: TBitBtn;
    edtDataResultSomaUtil: TCMDateTimePicker;
    spnAnoEne: TSpinEdit;
    spnMesEne: TSpinEdit;
    BitBtn10: TBitBtn;
    edtEnesimo: TCMDateTimePicker;
    spnDiaEne: TSpinEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    edtFeriados: TRealEdit;
    BitBtn2: TBitBtn;
    edtDomingos: TRealEdit;
    edtSabados: TRealEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    edtDiasUteis: TRealEdit;
    BitBtn5: TBitBtn;
    qryLookEstado: TwwQuery;
    qryLookEstadoCODESTADO: TStringField;
    qryLookEstadoIDPAIS: TFloatField;
    qryLookEstadoNOMEESTADO: TStringField;
    qryLookPais: TwwQuery;
    qryLookPaisNOMEPAIS: TStringField;
    qryLookPaisIDPAIS: TFloatField;
    Label9: TLabel;
    Label15: TLabel;
    edtDiaUtilApos: TCMDateTimePicker;
    Label17: TLabel;
    edtDiaUtilAntes: TCMDateTimePicker;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    qryLookCidade: TwwQuery;
    qryLookCidadeNOME: TStringField;
    qryLookCidadeIDCIDADES: TFloatField;
    qryLookCidadeCODESTADO: TStringField;
    qryLookCidadeIDPAIS: TFloatField;
    qryLookCidadeCODMUNICIPIO: TStringField;
    Label13: TLabel;
    edtDias: TRealEdit;
    BitBtn15: TBitBtn;
    GroupBox1: TGroupBox;
    lblBissexto: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    lblFeriado: TLabel;
    Label14: TLabel;
    lblDiaUtil: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    spnBissexto: TSpinEdit;
    edtDataFeriado: TCMDateTimePicker;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    edtDataDiaUtil: TCMDateTimePicker;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    spnMesUltDia: TSpinEdit;
    spnAnoUltDia: TSpinEdit;
    edtUltDia: TCMDateTimePicker;
    edtUltDiaUtil: TCMDateTimePicker;
    Label1: TLabel;
    DBcboPais: TwwDBLookupCombo;
    DBcboEstado: TwwDBLookupCombo;
    Label7: TLabel;
    DBcboCidade: TwwDBLookupCombo;
    Label8: TLabel;
    Label10: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    Label11: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    spnSomaMeses: TSpinEdit;
    BitBtn1: TBitBtn;
    edtDataResultSomaMeses: TCMDateTimePicker;
    Label29: TLabel;
    Label30: TLabel;
    spnSomaAnos: TSpinEdit;
    BitBtn16: TBitBtn;
    edtDataResultSomaAnos: TCMDateTimePicker;
    GroupBox4: TGroupBox;
    Label31: TLabel;
    edtIntervaloDias: TRealEdit;
    btnIntervaloDias: TBitBtn;
    edtIntervaloMeses: TRealEdit;
    btnIntervaloMeses: TBitBtn;
    Label32: TLabel;

    // procedimentos definidos
    function IntervaloMeses(dDataIni, dDataFim: TDateTime): integer;
    function IntervaloDias(dDataIni, dDataFim: TDateTime): integer;

    // outros procedimentos
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBcboPaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboEstadoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboCidadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure spnBissextoChange(Sender: TObject);
    procedure spnBissextoExit(Sender: TObject);
    procedure spnBissextoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure btnIntervaloDiasClick(Sender: TObject);
    procedure btnIntervaloMesesClick(Sender: TObject);


  private { Private declarations }
   iCidade, iPais: integer;
   sEstado: string;

  public { Public declarations }

  end;



var
  frmTesteData: TfrmTesteData;



implementation
{$R *.DFM}
uses
  USistema, UMensErro, UDatabase, DBaseDados, UModulo, UDocumento, UIntegraBack, UDiasInUteis;



function TfrmTesteData.IntervaloMeses(dDataIni, dDataFim: TDateTime): integer;
var
   iMeses            : integer;
   dPrimeiroDiaIni   : TDateTime;
   dPrimeiroDiaFim   : TDateTime;
begin
   Result := -1;
   if dDataFim >= dDataIni then begin

      // 1º) Verifica se as datas estão no mesmo mês
      if ( DiasInUteis.ExtraiAno(dDataFim) = DiasInUteis.ExtraiAno(dDataIni) ) and ( DiasInUteis.ExtraiMes(dDataFim) = DiasInUteis.ExtraiMes(dDataIni) ) then begin
         iMeses := 0;
      end else begin

         dPrimeiroDiaIni   := EncodeDate(DiasInUteis.ExtraiAno(dDataIni), DiasInUteis.ExtraiMes(dDataIni), 1);
         dPrimeiroDiaFim   := EncodeDate(DiasInUteis.ExtraiAno(dDataFim), DiasInUteis.ExtraiMes(dDataFim), 1);

         // 2º) Verifica se as datas estão em meses contíguos
         if DiasInUteis.SomaMeses(dPrimeiroDiaIni, 1) = dPrimeiroDiaFim then begin

            iMeses := 0;

         end else begin

            // 3º) Soma meses até que as datas coincidam
            iMeses := 2;
            while not(DiasInUteis.SomaMeses(dPrimeiroDiaIni, iMeses) = dPrimeiroDiaFim) do inc(iMeses);
            iMeses := iMeses - 1;

         end;
      end;


      Result := iMeses;
   end;
end;



function TfrmTesteData.IntervaloDias(dDataIni, dDataFim: TDateTime): integer;
begin
   Result := -1;

   if dDataFim >= dDataIni then Result := trunc(dDataFim) - trunc(dDataIni);
end;



procedure TfrmTesteData.BitBtn6Click(Sender: TObject);
begin
   inherited;
   lblFeriado.Visible := DiasInUteis.Feriado(edtDataFeriado.Date, iCidade, iPais, sEstado, True, False);
end;



procedure TfrmTesteData.BitBtn7Click(Sender: TObject);
begin
   lblDiaUtil.Visible := DiasInUteis.DiaUtil(edtDataDiaUtil.Date, iCidade, iPais, sEstado, True, False, False);
end;



procedure TfrmTesteData.BitBtn2Click(Sender: TObject);
begin
   inherited;
   edtFeriados.Value := DiasInUteis.ContaFeriados(edtDataIni.Date, edtDataFim.Date, iCidade, iPais, sEstado, True, False);
end;




procedure TfrmTesteData.BitBtn3Click(Sender: TObject);
begin
   inherited;
   edtDomingos.Value := DiasInUteis.ContaDomingos(edtDataIni.Date, edtDataFim.Date, iCidade, iPais,
                        sEstado, True, False, False);
end;



procedure TfrmTesteData.BitBtn5Click(Sender: TObject);
begin
   inherited;
   edtDiasUteis.Value := DiasInUteis.IntervaloDiasUteis(edtDataIni.Date, edtDataFim.Date, iCidade, iPais, sEstado, True, False, False);
end;



procedure TfrmTesteData.BitBtn4Click(Sender: TObject);
begin
   inherited;
   edtSabados.Value := DiasInUteis.ContaSabados(edtDataIni.Date, edtDataFim.Date, iCidade, iPais,
                        sEstado, True, False, False);
end;



procedure TfrmTesteData.BitBtn8Click(Sender: TObject);
begin
   inherited;
   edtUltDia.Date := DiasInUteis.UltDiaMes(spnAnoUltDia.Value, spnMesUltDia.Value);
end;



procedure TfrmTesteData.BitBtn9Click(Sender: TObject);
begin
   inherited;
   edtUltDiaUtil.Date := DiasInUteis.UltDiaUtilMes(spnAnoUltDia.Value, spnMesUltDia.Value, iCidade, iPais, sEstado, True, False, False);
end;



procedure TfrmTesteData.BitBtn13Click(Sender: TObject);
begin
   inherited;
   edtDiaUtilApos.Date := DiasInUteis.PrimeiroDiaUtilPosterior(edtDataSoma.Date, iCidade, iPais, sEstado, True, False, False);
end;



procedure TfrmTesteData.BitBtn14Click(Sender: TObject);
begin
   inherited;
   edtDiaUtilAntes.Date := DiasInUteis.UltDiaUtilAnterior(edtDataSoma.Date, iCidade, iPais, sEstado, True, False, False);
end;



procedure TfrmTesteData.FormShow(Sender: TObject);
begin
   inherited;

   qryLookPais.Open;
   iPais := -1;

   qryLookEstado.Open;
   sEstado  := '';

   qryLookCidade.Open;
end;



procedure TfrmTesteData.DBcboPaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

//   qryLookEstado.Close;
//   qryLookCidade.Close;

   if DBcboPais.LookupValue <> '' then begin
      iPais := StrToInt(DBcboPais.LookupValue);
//      with qryLookEstado do begin
//         ParamByName('PAIS').asInteger := iPais;
//         Open;
//      end;
   end else begin
      iPais := -1;
   end;
end;



procedure TfrmTesteData.DBcboEstadoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if ( (DBcboPais.LookupValue <> '') and (DBcboEstado.LookupValue <> '') ) then begin
      sEstado  := DBcboEstado.LookupValue;
//      with qryLookCidade do begin
//         Close;
//         ParamByName('PAIS').asInteger    := iPais;
//         ParamByName('ESTADO').asString   := sEstado;
//         Open;
//      end;
   end else begin
      sEstado  := '';
   end;
end;



procedure TfrmTesteData.DBcboCidadeCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if DBcboCidade.LookupValue <> '' then begin
      iCidade := StrToInt(DBcboCidade.LookupValue);
   end else begin
      iCidade := -1;
   end;
end;



procedure TfrmTesteData.BitBtn15Click(Sender: TObject);
begin
   inherited;
   edtDias.Value := DiasInUteis.IntervaloDias(edtDataIni.Date, edtDataFim.Date);
end;



procedure TfrmTesteData.BitBtn12Click(Sender: TObject);
begin
   inherited;
   edtDataResultSoma.Date := DiasInUteis.SomaDias(edtDataSoma.Date, spnSomaDias.Value);
end;



procedure TfrmTesteData.BitBtn11Click(Sender: TObject);
begin
   inherited;
   edtDataResultSomaUtil.Date := DiasInUteis.SomaDiasUteis(edtDataSoma.Date, spnSomaDias.Value,
                                 iCidade, iPais, sEstado, True, False, False);
end;



procedure TfrmTesteData.BitBtn10Click(Sender: TObject);
begin
   inherited;
   edtEnesimo.Date := DiasInUteis.EnesimoDiaUtilMes(spnAnoEne.Value, spnMesEne.Value, spnDiaEne.Value,
                      iCidade, iPais, sEstado, True, False, False);
end;



procedure TfrmTesteData.spnBissextoChange(Sender: TObject);
begin
   inherited;
   lblBissexto.Visible := DiasInUteis.AnoBissexto(spnBissexto.Value);
end;



procedure TfrmTesteData.spnBissextoExit(Sender: TObject);
begin
   inherited;
   lblBissexto.Visible := DiasInUteis.AnoBissexto(spnBissexto.Value);
end;



procedure TfrmTesteData.spnBissextoClick(Sender: TObject);
begin
   inherited;
   lblBissexto.Visible := DiasInUteis.AnoBissexto(spnBissexto.Value);
end;



procedure TfrmTesteData.BitBtn1Click(Sender: TObject);
begin
   inherited;
//   edtDataResultSomaMeses.Date := SomaMeses(edtDataSoma.Date, spnSomaMeses.Value);
end;



procedure TfrmTesteData.BitBtn16Click(Sender: TObject);
begin
   inherited;
//   edtDataResultSomaAnos.Date := SomaAnos(edtDataSoma.Date, spnSomaAnos.Value);
end;



procedure TfrmTesteData.btnIntervaloDiasClick(Sender: TObject);
begin
   inherited;
   edtIntervaloDias.Value  := IntervaloDias(edtDataIni.Date, edtDataFim.Date);
end;



procedure TfrmTesteData.btnIntervaloMesesClick(Sender: TObject);
begin
   inherited;
   edtIntervaloMeses.Value  := IntervaloMeses(edtDataIni.Date, edtDataFim.Date);
end;



end.


