{--------------------------------------------------------------------------------
  Desenvolvedor: Monica Gonzaga
  SOL / Kintana: 203289 / 1966419
  Alteração....: Incluso uma '/' na data de cobranca.
--------------------------------------------------------------------------------  }

unit CRelHistXTmpDesc;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, CheckLst, fcCombo, fcColorCombo, Mask, wwdbedit,
   Wwdbspin, wwdblook, Db, DBTables, Wwquery;

type
   TcfgRelHistXTmpDesc = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      qryTmpDesc: TwwQuery;
      qryHistMov: TwwQuery;
      qryTmpDescERRO: TStringField;
      qryTmpDescREFERENCIA: TStringField;
      qryTmpDescCONTRATO: TFloatField;
      qryTmpDescCOBRANCA: TStringField;
      qryTmpDescRUBRICA: TFloatField;
      qryTmpDescVALOR: TFloatField;
      qryHistMovERRO: TStringField;
      qryHistMovREFERENCIA: TStringField;
      qryHistMovCONTRATO: TFloatField;
      qryHistMovCOBRANCA: TStringField;
      qryHistMovRUBRICA: TFloatField;
      qryHistMovVALOR: TFloatField;
    procedure FormShow(Sender: TObject);


   private { Private declarations }

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public { Public declarations }

   end;



var
  cfgRelHistXTmpDesc: TcfgRelHistXTmpDesc;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UFuncoesEmptmo,
   UDiasUteis,
   USistema,
   uMensErro,
   dRelHistXTmpDesc;


procedure TcfgRelHistXTmpDesc.MontaQuery;
begin
   inherited;

   with dtmRelHistXTmpDesc do begin

      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraRelatorio;
end;



procedure TcfgRelHistXTmpDesc.FiltraRelatorio;
begin

   dtmRelHistXTmpDesc.qryDivergencia.Open;

   with qryTmpDesc do begin
      ParamByName('PANOMESCOBRANCA').AsString  := FormatFloat('0000',DBspnAno.Value) + '/' + FormatFloat('00',cboMes.ItemIndex + 1);    //Monica Gonzaga SOL203289 KINTANA1966419
      ParamByName('PHMEANOCOBRANCA').AsInteger := Trunc(DBspnAno.Value);
      ParamByName('PHMEMESCOBRANCA').AsInteger := cboMes.ItemIndex + 1;
      Open;
      while not eof do begin
         dtmRelHistXTmpDesc.qryDivergencia.Insert;
         dtmRelHistXTmpDesc.qryDivergenciaERRO.AsString       := FieldByName('ERRO').AsString;
         dtmRelHistXTmpDesc.qryDivergenciaREFERENCIA.AsString := FieldByName('REFERENCIA').AsString;
         dtmRelHistXTmpDesc.qryDivergenciaCONTRATO.AsFloat  := FieldByName('CONTRATO').AsFloat;
         dtmRelHistXTmpDesc.qryDivergenciaCOBRANCA.AsString   := FieldByName('COBRANCA').AsString;
         dtmRelHistXTmpDesc.qryDivergenciaRUBRICA.AsInteger   := FieldByName('RUBRICA').AsInteger;
         dtmRelHistXTmpDesc.qryDivergenciaVALOR.AsCurrency    := FieldByName('VALOR').AsCurrency;
         dtmRelHistXTmpDesc.qryDivergencia.Post;
         Next;
      end;
      Close;
   end;

   with qryHistMov do begin
      ParamByName('PANOMESCOBRANCA').AsString  := FormatFloat('0000',DBspnAno.Value) + '/' + FormatFloat('00',cboMes.ItemIndex + 1);   //Monica Gonzaga SOL203289 KINTANA1966419
      ParamByName('PHMEANOCOBRANCA').AsInteger := Trunc(DBspnAno.Value);
      ParamByName('PHMEMESCOBRANCA').AsInteger := cboMes.ItemIndex + 1;
      Open;
      while not eof do begin
         dtmRelHistXTmpDesc.qryDivergencia.Insert;
         dtmRelHistXTmpDesc.qryDivergenciaERRO.AsString       := FieldByName('ERRO').AsString;
         dtmRelHistXTmpDesc.qryDivergenciaREFERENCIA.AsString := FieldByName('REFERENCIA').AsString;
         dtmRelHistXTmpDesc.qryDivergenciaCONTRATO.AsFloat := FieldByName('CONTRATO').AsFloat;
         dtmRelHistXTmpDesc.qryDivergenciaCOBRANCA.AsString   := FieldByName('COBRANCA').AsString;
         dtmRelHistXTmpDesc.qryDivergenciaRUBRICA.AsInteger   := FieldByName('RUBRICA').AsInteger;
         dtmRelHistXTmpDesc.qryDivergenciaVALOR.AsCurrency    := FieldByName('VALOR').AsCurrency;
         dtmRelHistXTmpDesc.qryDivergencia.Post;
         Next;
      end;
      Close;
   end;
end;



procedure TcfgRelHistXTmpDesc.FormShow(Sender: TObject);
begin
  inherited;
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);
end;

end.
