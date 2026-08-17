unit FMovimentacaoTempoServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls;

type
  TfrmMovimentacaoTempoServico = class(TfrmParamReports_Padrao)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtDataInicial: TCMDateTimePicker;
    edtDataFinal: TCMDateTimePicker;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentacaoTempoServico: TfrmMovimentacaoTempoServico;

implementation

uses
  dMovimentacaoTempoServico, UMensErro;

{$R *.DFM}

procedure TfrmMovimentacaoTempoServico.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (edtDataInicial.DateTime <= 0) or (edtDataFinal.DateTime <= 0) then begin
    MsgDlg('Informe o período de pesquisa.','Erro',mtError,[mbOk],0);
    edtDataInicial.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  if (edtDataInicial.DateTime > edtDataFinal.DateTime) then begin
    MsgDlg('Data inicial não pode ser maior que data final.','Erro',mtError,[mbOk],0);
    edtDataInicial.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  with dtmMovimentacaoTempoServico do begin
    qryConsulta.Close;
    qryConsulta.SQL.Clear;
    qryConsulta.SQL.Add('SELECT P.NOME, HTS.EMPRESA, HTS.DTINICIO, HTS.DTFIM');
    qryConsulta.SQL.Add('  FROM HSTTEMPOSERVICO HTS');
    qryConsulta.SQL.Add(' INNER JOIN PESSOA P ON P.IDPESSOA = HTS.IDPESSOA');
    qryConsulta.SQL.Add(' WHERE (TO_DATE(TO_CHAR(HTS.DTINICIO,''DD/MM/YYYY''),''DD/MM/YYYY'') >= :DATAINICIAL)');
    qryConsulta.SQL.Add('   AND (TO_DATE(TO_CHAR(HTS.DTFIM,''DD/MM/YYYY''),''DD/MM/YYYY'') <= :DATAFINAL)');
    qryConsulta.SQL.Add(' ORDER BY HTS.EMPRESA');
    qryConsulta.ParamByName('DATAINICIAL').AsDateTime := edtDataInicial.DateTime;
    qryConsulta.ParamByName('DATAFINAL').AsDateTime := edtDataFinal.DateTime;  
    qryConsulta.Open;

    if (qryConsulta.Recordcount = 0) then begin
      MsgDlg('Não existem registros a serem impressos.','Erro',mtError,[mbOk],0);
      edtDataInicial.SetFocus;
      Self.ModalResult := mrNone;
      Exit;
    end;
  end;
end;

end.
