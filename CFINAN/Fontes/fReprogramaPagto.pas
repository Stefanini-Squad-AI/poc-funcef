unit fReprogramaPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, Mask, wwdbedit, Wwdbspin;

type
  TFrmReprogramaPagto = class(TfrmOkCancelar)
    EdtDataLancto: TCMDateTimePicker;
    CmbPais: TCMDBLookupCombo;
    CmEstado: TCMDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QryPais: TwwQuery;
    QryEstado: TwwQuery;
    QryEstadoIDESTADO: TFloatField;
    QryEstadoNOMEESTADO: TStringField;
    QryEstadoCODESTADO: TStringField;
    QryPaisIDPAIS: TFloatField;
    QryPaisNOMEPAIS: TStringField;
    Label4: TLabel;
    CmbDiaSemana: TComboBox;
    EdtDiasUteis: TwwDBSpinEdit;
    Label5: TLabel;
    Label6: TLabel;
    CMBCidade: TCMDBLookupCombo;
    QryCidade: TwwQuery;
    QryCidadeIDCIDADES: TFloatField;
    QryCidadeNOME: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmbPaisChange(Sender: TObject);
  private
    function GetDataLancDocImposto(dData: TDateTime): TDateTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReprogramaPagto: TFrmReprogramaPagto;

implementation

Uses uDiasUteis;

{$R *.DFM}

function TFrmReprogramaPagto.GetDataLancDocImposto(dData:TDateTime):TDateTime;
Var
  iDiaSemanaData, _iDiaSemanaLancto, _iDiasUteisLancto, _iCodPais, _iCodCidade :Integer;
  DataFeriado :TDateTime;
  bExisteFeriado :Boolean;
  _sEstado :String;
Begin
   _iDiaSemanaLancto := CmbDiaSemana.ItemIndex + 1;
   _iDiasUteisLancto := Trunc(EdtDiasUteis.Value);
   _iCodPais := StrToInt(CmbPais.LookupValue);
   _iCodCidade := StrToInt(CMBCidade.LookupValue);
   _sEstado := CmEstado.LookupValue;

   //SE O NÚMERO DE DIAS ÚTEIS ENTRE A DATADOLANÇAMENTO E A "DATA DO DIA DA SEMANA" DO
   //LANCAMENTO FOR >= DIASUTEISLANCTO LANCA DOCUMENTO PARA A "DATA DO DIA DA SEMANA"
   //SENAO LANÇA PARA "DATA DO DIA DA SEMANA" + 7
   iDiaSemanaData := DayOfWeek(dData) - 1;

   If (_iDiaSemanaLancto - iDiaSemanaData) < _iDiasUteisLancto Then
      Result := dData + (_iDiaSemanaLancto - iDiaSemanaData) + 7
   Else
   Begin
      Result  := dData + (_iDiaSemanaLancto - iDiaSemanaData);
      If (DiasUteis.ContaDiasNaoUteis(dData,Result,_iCodCidade,_iCodPais, _sEstado,True,True,False) > _iDiasUteisLancto) Then
         Result  := Result + 7;
   End;

   //SE A DATA RESULTANTE FOR UM FERIADO EXTRAORDINÁRIO CONSIDERA O PRIMEIRO DIA
   //ÚTIL POSTERIOR COMO DATA RESULTANTE
   //SE A DATA RESULTANTE FOR UM FERIADO NORMAL CONSIDERA O PRIMEIRO DIA
   //ÚTIL ANTERIOR COMO DATA RESULTANTE
   //O TESTE É PERSISTIDO ATÉ SE ENCONTRAR UMA DATA ÚTIL PARA O LANÇAMENTO

   DataFeriado := Result;
   bExisteFeriado := True;

   While bExisteFeriado Do
   Begin
     bExisteFeriado := False;
     If DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False) Then
     Begin
        DataFeriado := DiasUteis.UltDiaUtilAnterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
        bExisteFeriado := True;
     End
     Else
     Begin
        If DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,True) Then
        Begin
           DataFeriado := DiasUteis.PrimeiroDiaUtilPosterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
           bExisteFeriado := True;
        End;
     End;

     If ((DataFeriado - _iDiasUteisLancto) < dData) Then DataFeriado := Result + 7;
   End;

   If (Result <> DataFeriado) Then Result := DataFeriado;
End;


procedure TFrmReprogramaPagto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ShowMessage('A CPMF será lançada dia ' + DateToStr(GetDataLancDocImposto(EdtDataLancto.Date)));
end;

procedure TFrmReprogramaPagto.CmbPaisChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled :=
                            ((CmbPais.Text <> '') And
                             (CmEstado.Text <> '') And
                             (CMBCidade.Text <> '') And
                             (CmbDiaSemana.Text <> '') And
                             (EdtDataLancto.Text <> ''))
end;

end.
