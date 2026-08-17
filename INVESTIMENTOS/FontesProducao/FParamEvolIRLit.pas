unit FParamEvolIRLit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamEvolIRLit = class(TfrmOkCancelar)
    edData: TCMDateTimePicker;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamEvolIRLit: TfrmParamEvolIRLit;

implementation

{$R *.DFM}
Uses FDmRelatorio;

procedure TfrmParamEvolIRLit.bbtnConfirmarClick(Sender: TObject);
begin
  If Trim(edData.Text) <> '' Then
    Begin
      ModalResult := mrOK;
      DtmRelatorio.qryEvolIRLit.Close;
      DtmRelatorio.qryEvolIRLit.SQL.Clear;
      Case Radiogroup1.ItemIndex Of
        0 : Begin {Analítico}
              DtmRelatorio.ppLabel44.Caption := 'Evolução do IR Litígio - Analítico';
              DtmRelatorio.qryEvolIRLit.SQL.Add('SELECT OL.DESORIGEMLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       IR.DATAFATOGERADOR AS DATAFATOR,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       IR.DESFATOGERADOR,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       IR.VLRIRLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SL.VLRSLDIRLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SL.DATAATUALIZACAO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       TR.DESCTIPRENFIXA');
              DtmRelatorio.qryEvolIRLit.SQL.Add('FROM SALDOIRLITIGIO SL , IRLITIGIO IR ,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('     ORIGEMIRLITIGIO OL , TITRENFIXA TI,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('     TIPOTITRENFIXA TR');
              DtmRelatorio.qryEvolIRLit.SQL.Add('WHERE');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDORIGEMIRLITIGIO = OL.IDORIGEMIRLITIGIO AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDINVESTIMENTO    = TI.IDTITRENFIXA (+) AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDIRLITIGIO       = SL.IDIRLITIGIO AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   TI.CODTIPRENFIXA     = TR.CODTIPRENFIXA(+) AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   SL.DATAATUALIZACAO   = :P_DATAATUALIZACAO');
              DtmRelatorio.qryEvolIRLit.SQL.Add('ORDER BY OL.DESORIGEMLITIGIO, IR.DATAFATOGERADOR,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('         IR.DESFATOGERADOR');
            End;
        1 : Begin {Sintético}
              DtmRelatorio.ppLabel44.Caption := 'Evolução do IR Litígio - Sintético';
              DtmRelatorio.qryEvolIRLit.SQL.Add('SELECT OL.DESORIGEMLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SL.DATAATUALIZACAO AS DATAFATOR,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       '#39'RENDA FIXA'#39' AS DESFATOGERADOR,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SUM(IR.VLRIRLITIGIO) AS VLRIRLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SUM(SL.VLRSLDIRLITIGIO) AS VLRSLDIRLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SL.DATAATUALIZACAO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       TR.DESCTIPRENFIXA');
              DtmRelatorio.qryEvolIRLit.SQL.Add('FROM SALDOIRLITIGIO SL , IRLITIGIO IR ,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('     ORIGEMIRLITIGIO OL , TITRENFIXA TI,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('     TIPOTITRENFIXA TR');
              DtmRelatorio.qryEvolIRLit.SQL.Add('WHERE');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDORIGEMIRLITIGIO = OL.IDORIGEMIRLITIGIO AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDINVESTIMENTO    = TI.IDTITRENFIXA AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDIRLITIGIO       = SL.IDIRLITIGIO AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   TI.CODTIPRENFIXA     = TR.CODTIPRENFIXA AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDORIGEMIRLITIGIO = 1 AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   SL.DATAATUALIZACAO   = :P_DATAATUALIZACAO');
              DtmRelatorio.qryEvolIRLit.SQL.Add('GROUP BY OL.DESORIGEMLITIGIO, SL.DATAATUALIZACAO, TR.DESCTIPRENFIXA');
              DtmRelatorio.qryEvolIRLit.SQL.Add('UNION');
              DtmRelatorio.qryEvolIRLit.SQL.Add('SELECT OL.DESORIGEMLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SL.DATAATUALIZACAO AS DATAFATOR,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       '#39'RENDA VARIAVEL'#39' AS DESFATOGERADOR,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SUM(IR.VLRIRLITIGIO) VLRIRLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SUM(SL.VLRSLDIRLITIGIO) VLRSLDIRLITIGIO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       SL.DATAATUALIZACAO,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('       '#39' '#39' AS DESCTIPRENFIXA');
              DtmRelatorio.qryEvolIRLit.SQL.Add('FROM SALDOIRLITIGIO SL , IRLITIGIO IR ,');
              DtmRelatorio.qryEvolIRLit.SQL.Add('     ORIGEMIRLITIGIO OL');
              DtmRelatorio.qryEvolIRLit.SQL.Add('WHERE');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDORIGEMIRLITIGIO = OL.IDORIGEMIRLITIGIO AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDIRLITIGIO       = SL.IDIRLITIGIO AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   IR.IDORIGEMIRLITIGIO = 2 AND');
              DtmRelatorio.qryEvolIRLit.SQL.Add('   SL.DATAATUALIZACAO   = :P_DATAATUALIZACAO');
              DtmRelatorio.qryEvolIRLit.SQL.Add('GROUP BY OL.DESORIGEMLITIGIO, SL.DATAATUALIZACAO');
            End;
      End;
      DtmRelatorio.qryEvolIRLit.ParamByName('P_DATAATUALIZACAO').AsDate :=  edData.Date;
      DtmRelatorio.qryEvolIRLit.Open;
    End
  Else
    Begin
      MessageDlg('Campo data não preenchido.', mtError, [mbOk], 0);
      edData.SetFocus;
      Exit;
    End;
  inherited;
end;

end.
