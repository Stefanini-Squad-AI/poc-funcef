unit FMovimentacaoDependentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls;

type
  TfrmMovimentacaoDependentes = class(TfrmParamReports_Padrao)
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
  frmMovimentacaoDependentes: TfrmMovimentacaoDependentes;

implementation

uses
  dMovimentacaoDependentes, UMensErro;

{$R *.DFM}

procedure TfrmMovimentacaoDependentes.bbtnConfirmarClick(Sender: TObject);
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

  with dtmMovimentacaoDependentes do begin
    qryConsulta.Close;
    qryConsulta.SQL.Clear;
    qryConsulta.SQL.Add('SELECT P.NOME,');
    qryConsulta.SQL.Add('       TO_CHAR(D.TRGDTINCLUSAO,''DD/MM/YYYY'') AS DATAOPERACAO,');
    qryConsulta.SQL.Add('       ''Inclusão'' AS OPERACAO');
    qryConsulta.SQL.Add('  FROM DEPENTIT D');
    qryConsulta.SQL.Add('INNER JOIN PESSOA P ON');
    qryConsulta.SQL.Add('P.IDPESSOA = D.IDPESSOA');
    qryConsulta.SQL.Add('WHERE (TO_DATE(TO_CHAR(D.TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN :DATAINICIAL AND :DATAFINAL)');
    qryConsulta.SQL.Add('  AND D.TRGUSERINCLUSAO = ''CM_WEB_AUTO''');
    qryConsulta.SQL.Add('UNION ALL');
    qryConsulta.SQL.Add('SELECT P.NOME,');
    qryConsulta.SQL.Add('       TO_CHAR(D.TRGDTALTERACAO,''DD/MM/YYYY'') AS DATAOPERACAO,');
    qryConsulta.SQL.Add('       ''Alteração'' AS OPERACAO');
    qryConsulta.SQL.Add('  FROM DEPENTIT D');
    qryConsulta.SQL.Add('INNER JOIN PESSOA P ON');
    qryConsulta.SQL.Add('P.IDPESSOA = D.IDPESSOA');
    qryConsulta.SQL.Add('WHERE (TO_DATE(TO_CHAR(D.TRGDTALTERACAO,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN :DATAINICIAL AND :DATAFINAL)');
    qryConsulta.SQL.Add('  AND D.TRGDTALTERACAO > D.TRGDTINCLUSAO');
    qryConsulta.SQL.Add('  AND D.TRGUSERALTERACAO = ''CM_WEB_AUTO''');
    qryConsulta.SQL.Add('UNION ALL');
    qryConsulta.SQL.Add('SELECT P.NOME,');
    qryConsulta.SQL.Add('       TO_CHAR(D.TRGDTALTERACAO,''DD/MM/YYYY'') AS DATAOPERACAO,');
    qryConsulta.SQL.Add('       ''Cancelamento'' AS OPERACAO');
    qryConsulta.SQL.Add('  FROM DEPENTIT D');
    qryConsulta.SQL.Add('INNER JOIN PESSOA P ON');
    qryConsulta.SQL.Add('P.IDPESSOA = D.IDPESSOA');
    qryConsulta.SQL.Add('WHERE (TO_DATE(TO_CHAR(D.TRGDTALTERACAO,''DD/MM/YYYY''),''DD/MM/YYYY'') BETWEEN :DATAINICIAL AND :DATAFINAL)');
    qryConsulta.SQL.Add('  AND D.TRGDTALTERACAO > D.TRGDTINCLUSAO');
    qryConsulta.SQL.Add('  AND D.DATACANCELA IS NOT NULL');
    qryConsulta.SQL.Add('  AND D.TRGUSERALTERACAO = ''CM_WEB_AUTO''');
    qryConsulta.SQL.Add(' ORDER BY OPERACAO');
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
