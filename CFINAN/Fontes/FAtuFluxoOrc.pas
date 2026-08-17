unit FAtuFluxoOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmAtuFluxoOrc = class(TfrmSairAjuda)
    pnlComentario: TPanel;
    mmComentario: TMemo;
    pnlDatas: TPanel;
    gbDatas: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dedInicial: TCMDateTimePicker;
    dedFinal: TCMDateTimePicker;
    prgBarAtuFluxo: TProgressBar;
    bbtnAtualizaFluxo: TBitBtn;
    qryFluxoPrev: TwwQuery;
    qryFluxoOrc: TwwQuery;
    procedure bbtnAtualizaFluxoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuFluxoOrc: TfrmAtuFluxoOrc;

implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,UAutorizacao,uSistema,UFuncaoGeral;

procedure TfrmAtuFluxoOrc.bbtnAtualizaFluxoClick(Sender: TObject);
var
sValorCorrente,sSql:String;
iIdFluxoOrcado : LongInt;
begin
  inherited;
  bbtnAtualizaFluxo.Enabled := false;
  prgBarAtuFluxo.Visible := true;
  try
    StartTransacao;
    qryFluxoOrc.Close;
    qryFluxoOrc.SQL.Clear;
    qryFluxoOrc.SQL.Text := 'DELETE FLUXOORCADO WHERE DATAPROGRAMADA >= TO_DATE (''' + dedInicial.text + ''',''dd/mm/yyyy'') AND DATAPROGRAMADA <= TO_DATE (''' + dedFinal.text + ''',''dd/mm/yyyy'') AND PRAZO = ''C'' AND IDPESSOA = '+IntToStr(Sistema.IdEmpresa);
    qryFluxoOrc.ExecSQL;
    qryFluxoPrev.close;
    qryFluxoPrev.SQL.Clear;
    qryFluxoPrev.SQL.Text := 'SELECT * FROM FLUXOPREVISTO WHERE DATAPROGRAMADA <= TO_DATE (''' + dedFinal.text + ''',''dd/mm/yyyy'') AND  '+
                             'DATAPROGRAMADA >= TO_DATE (''' + dedInicial.text + ''',''dd/mm/yyyy'') AND IDPESSOA = '+IntToStr(Sistema.IdEmpresa);
    qryFluxoPrev.open;
    if qryFluxoPrev.IsEmpty then
    Begin
       MsgDlg('Não existe nenhum Lançamento no Fluxo Previsto neste Período','Erro',mtError,[mbOk],0);
       Abort;
    end;
    qryFluxoPrev.First;
    prgBarAtuFluxo.Max := qryFluxoPrev.RecordCount;
    while (not qryFluxoPrev.EOF)do
    Begin
       prgBarAtuFluxo.Stepit;
       sValorCorrente:=FuncaoGeral.OraNumero(qryFluxoPrev.fieldbyname('VALOR').asFloat);
       qryFluxoOrc.SQL.Clear;
       iIdFluxoOrcado:=LeUltRegistro(Nil,'FLUXOORCADO');
       sSql :='';
       sSql := 'INSERT INTO FLUXOORCADO(IDFLUXOORCADO,IDPESSOA,DATAPROGRAMADA,CODTIPRECDES,RECPAG,UNIDNEGOC,'+
               'CODCENTRORESPON,CODCENTROCUSTO,IDEMPRESA,PRAZO,VALOR,CODTIPDOC) VALUES ('+
               IntToStr(iIdFluxoOrcado)+','+IntToStr(Sistema.IdEmpresa);
       sSql := sSql+', TO_DATE (''' +qryFluxoPrev.fieldbyname('DATAPROGRAMADA').asString+ ''',''dd/mm/yyyy'')';
       sSql := sSql+',''' +qryFluxoPrev.fieldbyname('CODTIPRECDES').asString+ '''';
       sSql := sSql+',''' +qryFluxoPrev.fieldbyname('RECPAG').asString+ '''';
       sSql := sSql+','+qryFluxoPrev.fieldbyname('UNIDNEGOC').asString;
       sSql := sSql+',''' +qryFluxoPrev.fieldbyname('CODCENTRORESPON').asString+ '''';
       If qryFluxoPrev.fieldbyname('CODCENTROCUSTO').IsNull Then begin
          sSql := sSql+',NULL';
          sSql := sSql+',NULL';
       end else begin
          sSql := sSql+','''+qryFluxoPrev.fieldbyname('CODCENTROCUSTO').asString+ '''';
          sSql := sSql+','+qryFluxoPrev.fieldbyname('IDEMPRESA').asString;
       end;
       sSql := sSql+',''C''';
       if qryFluxoPrev.fieldbyname('CODTIPDOC').AsFloat<>0 then
          sSql := sSql+','+sValorCorrente+','+
                  FloatToStr(qryFluxoPrev.fieldbyname('CODTIPDOC').AsFloat)+')'
       else
          sSql := sSql+','+sValorCorrente+',null)';


       qryFluxoOrc.SQL.Text:=sSql;
       qryFluxoOrc.ExecSQL;
       qryFluxoPrev.Next;
    end;
    CommitTransacao;
    prgBarAtuFluxo.Visible := false;
    MsgDlg('Geração Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
    bbtnSairClick(Self);
  except
     MsgDlg('Problemas na Geração do Fluxo Orçado','Erro',mtError,[mbOk],0);
     RollBackTransacao;
     raise;
  end;
  prgBarAtuFluxo.Visible := false;
  bbtnAtualizaFluxo.Enabled := True;

end;

end.
