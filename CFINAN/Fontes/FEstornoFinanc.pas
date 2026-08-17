unit FEstornoFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, Buttons, TB97, ExtCtrls,uLancFinanc,
  uLancContab, TB97Tlbr, IvDictio, IvMulti, IvEMulti, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEstornoFinan = class(TfrmSairAjuda)
    deDataEstorno: TCMDateTimePicker;
    lblDataEstorno: TLabel;
    bbtnConfirmaEstorno: TBitBtn;
    procedure bbtnConfirmaEstornoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstornoFinan: TfrmEstornoFinan;

implementation

{$R *.DFM}
uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema, FMovimFinanc,uFuncaoGeral,UIntegraBack;

procedure TfrmEstornoFinan.bbtnConfirmaEstornoClick(Sender: TObject);
var liCodLancFinanc,liPeriodo,liExercicio,liRetFuncao,liEmpresa : Integer;
    sMens:String;
begin
  inherited;
  if trim(deDataEstorno.Text)='' then
  Begin
     MsgDlg('Obrigatório preencher a data do estorno','Erro',mtError,[mbOk],0);
     deDataEstorno.SetFocus;
     exit;
  end;
  if (IntegraBack.Contabilidade = 'S')  then//and (qry.FieldByName('IDMODULO').AsInteger = 9) then
  Begin
     liEmpresa:=Sistema.IdEmpresa;
     //Testa se o período contábil está aberto ou fechado.
     liRetFuncao:=TestaPeriodo(True,'BASEDADOS',deDataEstorno.Text,IntToStr(Sistema.IdModulo),liExercicio,
                               liPeriodo,liEmpresa,sMens);
     if liRetFuncao <> 0 then
     Begin
        deDataEstorno.SetFocus;
        exit;
     end;
  end;
  try
    StartTransacao;
    liCodLancFinanc:=frmMovimFinanc.iCodLancFinanc;
    LancFinanc.EstornoFinanceiro(deDataEstorno.Text,Modulo.sNaoIdent,liCodLancFinanc,0);
    if liCodLancFinanc = -1 then
       abort;
    CommitTransacao;
    MsgDlg('Estorno Efetuado com Sucesso','Aviso',mtWarning,[mbOk],0);
    FuncaoGeral.TiraIcone;
    bbtnSairClick(Self);
  except
    MsgDlg('Estorno Não Efetuado','Erro',mtError,[mbOk],0);
    FuncaoGeral.TiraIcone;
    deDataEstorno.SetFocus;
    RollBackTransacao;
    raise;
  end;
end;

procedure TfrmEstornoFinan.FormActivate(Sender: TObject);
begin
  inherited;
  deDataEstorno.Text := DateToStr(Date);
  deDataEstorno.SetFocus;
end;

end.
