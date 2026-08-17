unit fParamSaldoHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmSaldoHist = class(TfrmOkCancelar)
    Label4: TLabel;
    dblkcmbConta: TwwDBLookupCombo;
    rgrpStatus: TRadioGroup;
    gryConta: TwwQuery;
    gryContaDESCRICAO: TStringField;
    gryContaCODPORTADOR: TFloatField;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    deData: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaldoHist: TfrmSaldoHist;

implementation

uses DRelatoriosCFinan, usistema;

{$R *.DFM}

procedure TfrmSaldoHist.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatoriosCFinan.grySaldoHist.Close;
  dtmRelatoriosCFinan.grySaldoHist.Sql.Text :=
 ' SELECT '+
 '   M.CODPORTADOR, '+
 '   M.HISTPADFINAN, '+
 '   C.DESCRICAO, '+
 '   H.DESCRICAO AS HISTORICO, '+
 '   SUM(DECODE(ENTRADASAIDA,''S'',VALORLANCFINAN*-1,VALORLANCFINAN)) AS VALOR '+
 ' FROM '+
 '   MOVIMFINANC M, '+
 '   PORTADORCONTA C, '+
 '   HISTORICOFINAN H '+
 ' WHERE '+
 '   (M.STATUSCONCILIA <> ''J'') '+
 '   AND (M.DATALANCFINAN <= TO_DATE('''+deData.Text+''',''DD/MM/YYYY'')) ';
   if Trim(dblkcmbConta.text ) <> '' then
     dtmRelatoriosCFinan.grySaldoHist.SQL.add(' AND C.CODPORTADOR = ''' + dblkcmbConta.LookupValue +'''');
   case rgrpStatus.ItemIndex of
      1 : dtmRelatoriosCFinan.grySaldoHist.SQL.add(' AND M.STATUSCONCILIA IN (''I'',''X'')');
      2 : dtmRelatoriosCFinan.grySaldoHist.SQL.add(' AND M.STATUSCONCILIA <> ''C''');
   end;
     dtmRelatoriosCFinan.grySaldoHist.SQL.Add(
 '   AND M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+
 '   AND C.CODPORTADOR = M.CODPORTADOR '+
 '   AND H.HISTPADFINAN = M.HISTPADFINAN '+
 ' GROUP BY '+
 '   M.CODPORTADOR, '+
 '   M.HISTPADFINAN, '+
 '   C.DESCRICAO, '+
 '   H.DESCRICAO '+
 ' ORDER BY '+
 '   C.DESCRICAO, '+
 '   H.DESCRICAO ');
     dtmRelatoriosCFinan.lbDataSaldoHist.caption   := 'Relação dos Saldos das Contas por Histórico em '+deData.Text;
     dtmRelatoriosCFinan.lbStatusSaldoHist.caption := rgrpStatus.Items.strings[rgrpStatus.itemindex];
end;

procedure TfrmSaldoHist.FormActivate(Sender: TObject);
begin
  inherited;
  deData.Text := DateToStr(Date);
  gryConta.Open;
end;

end.
