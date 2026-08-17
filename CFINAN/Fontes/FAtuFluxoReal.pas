unit FAtuFluxoReal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdblook, ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmAtuFluxoReal = class(TfrmSairAjuda)
    pnlDatas: TPanel;
    gbDatas: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dedInicial: TCMDateTimePicker;
    dedFinal: TCMDateTimePicker;
    prgBarAtuFluxo: TProgressBar;
    pnlComentario: TPanel;
    mmComentario: TMemo;
    bbtnAtualizaFluxo: TBitBtn;
    qryRateioFinanc: TwwQuery;
    qryParamGlobal: TwwQuery;
    qryFluxoReal: TwwQuery;
    qryAux: TwwQuery;
    qryPortador: TwwQuery;
    procedure bbtnAtualizaFluxoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuFluxoReal: TfrmAtuFluxoReal;
  acm:real;
  iMoedaCorrente,moe : Integer;

implementation

{$R *.DFM}
uses uMensErro,uDataBase, DBaseDados,uSistema,ULancFinanc;

procedure TfrmAtuFluxoReal.FormActivate(Sender: TObject);
begin
  inherited;
  qryPortador.Close;
  qryPortador.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryPortador.Open;
end;

procedure TfrmAtuFluxoReal.bbtnAtualizaFluxoClick(Sender: TObject);
var
   sSql:String;
begin
  inherited;
  bbtnAtualizaFluxo.Enabled := false;
  prgBarAtuFluxo.Visible := true;
  try
    StartTransacao;
    qryParamGlobal.Close;
    qryParamGlobal.SQL.Clear;
    qryParamGlobal.SQL.Text := 'SELECT MOEDACORRENTE '+
                               'FROM PARAMGLOBAL WHERE IDPESSOA = ' + InttoStr(Sistema.IdEmpresa);
    qryParamGlobal.Open;
    //
    iMoedaCorrente:=qryParamGlobal.FieldByName('MOEDACORRENTE').AsInteger;
    qryFluxoReal.Close;
    qryFluxoReal.SQL.Clear;
    qryFluxoReal.SQL.Text := 'DELETE FLUXOREAL WHERE DATACFLOAT >= TO_DATE (''' + dedInicial.text + ''',''dd/mm/yyyy'') AND DATACFLOAT <= TO_DATE (''' + dedFinal.text + ''',''dd/mm/yyyy'') AND IDPESSOA = '+IntToStr(Sistema.IdEmpresa);
    qryFluxoReal.ExecSQL;
    //
    sSql:='SELECT R.*, M.DATALANCFINAN '+
          'FROM RATEIOFINANC R, MOVIMFINANC M, PORTADORCONTA C WHERE '+
          '(M.CODLANCFINANC = R.CODLANCFINANC) AND (M.DATALANCFINAN <= TO_DATE (''' + dedFinal.text + ''',''dd/mm/yyyy'')) AND  '+
          '(M.DATALANCFINAN >= TO_DATE (''' + dedInicial.text + ''',''dd/mm/yyyy'')) AND (R.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND '+
          '(M.CODPORTADOR = C.CODPORTADOR) AND '+
          '((C.FLGGRAVAFLUXO = ''S'') OR (C.FLGGRAVAFLUXO IS NULL))';
    //
    qryRateioFinanc.close;
    qryRateioFinanc.SQL.Clear;
    qryRateioFinanc.SQL.Text :=sSql;
    qryRateioFinanc.open;
    qryRateioFinanc.First;
    prgBarAtuFluxo.Max := qryRateioFinanc.RecordCount;
    while (not qryRateioFinanc.EOF)do
    Begin
       prgBarAtuFluxo.Stepit;
       if qryRateioFinanc.fieldbyname('MOECODIGO').asInteger <> 0 then
       Begin
          moe:=qryRateioFinanc.fieldbyname('MOECODIGO').asInteger;
          acm:=qryRateioFinanc.fieldbyname('VALOROUTRAMOEDA').asFloat;
       end
       else
       Begin
          moe:=iMoedaCorrente;
          acm:=qryRateioFinanc.fieldbyname('VALOR').asFloat;
       end;
       LancFinanc.GravaFluxoReal(qryAux,qryFluxoReal,
                                 qryRateioFinanc.fieldbyname('CODCENTRORESPON').asString,
                                 qryRateioFinanc.fieldbyname('DATALANCFINAN').asString,
                                 qryRateioFinanc.fieldbyname('CODTIPRECDES').asString,
                                 qryRateioFinanc.fieldbyname('RECPAG').asString,moe,
                                 qryRateioFinanc.FieldByName('UNIDNEGOC').AsInteger,acm,
                                 qryRateioFinanc.fieldbyname('CODCENTROCUSTO').asString,
                                 qryRateioFinanc.fieldbyname('IDPROGRAMA').AsFloat,
                                 qryRateioFinanc.fieldbyname('IDPATRO').AsFloat,
                                 qryRateioFinanc.fieldbyname('IDPLANOPREV').AsFloat,
                                 qryRateioFinanc.fieldbyname('CODTIPDOC').AsFloat);
       qryRateioFinanc.Next;
    end;
    CommitTransacao;
    prgBarAtuFluxo.Visible := false;
    MsgDlg('Geração Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
    bbtnSairClick(Self);
  except
     MsgDlg('Problemas na Geração do Fluxo Real','Erro',mtError,[mbOk],0);
     RollBackTransacao;
     raise;
  end;
  prgBarAtuFluxo.Visible := false;
  bbtnAtualizaFluxo.Enabled := True;
end;

end.
