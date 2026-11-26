unit FParamComparaTx;
{*******************************************************************************
Rotina...........: criação do relatório
Nº WO ...........: 8964
Data da Alteração: 23/07/2024
Responsável......: Helen V Bianchi
Descrição........: Desenvolvimento do Relatorio Comparação dos valores de
               contribuição descontados na folha de benefícios
********************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, dxCntner,
  dxExEdtr, dxEdLib, CheckLst,  wwdbdatetimepicker,
  CMDateTimePicker, uCtrlGlobalRH,  wwdblook, Db, DBClient, uCMClientDataSet,
   Mask, Wwdatsrc, DBTables, Wwquery;



type
  TfrmParamComparaTx = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    qryHistorico: TwwQuery;
    GBReferencia2: TGroupBox;
    EdtReferencia: TMaskEdit;
    lblhistorico: TLabel;
    dblkcmpHistorico: TwwDBLookupCombo;
    qryHistoricoIDHSTFOLHABENEF: TFloatField;
    qryHistoricoHISTORICO: TStringField;
    qryHistoricoMESREFERENCIA: TStringField;
    dsHistorico: TwwDataSource;
    qryHistoricoDATAPREVPAGTO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtReferenciaExit(Sender: TObject);
  private
    { Private declarations }

    function  ValidaDados : boolean;

  public
    { Public declarations }
  end;

var
  frmParamComparaTx: TfrmParamComparaTx;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, DRelatGerencial;


{$R *.DFM}

procedure TfrmParamComparaTx.FormCreate(Sender: TObject);
begin
  inherited;
  EdtReferencia.text := FormatDateTime('YYYY/MM',Date - 30);
  qryHistorico.Close;
  qryHistorico.ParamByName('MESREFERENCIA').AsString:= EdtReferencia.Text;//QuotedStr(EdtReferencia.Text);
  qryHistorico.Open;
  if not qryHistorico.eof then
       dblkcmpHistorico.Enabled := True;
end;

procedure TfrmParamComparaTx.bbtnConfirmarClick(Sender: TObject);
begin
   if not(ValidaDados) then
      exit;

  frmAguarde.Mostra(' Processando as Informações do Relatório... ');
  frmAguarde.Repaint;

  dtmRelatorioGerencial.qryRelCompara.Close;
  dtmRelatorioGerencial.qryRelCompara.ParamByName('IDHSTFOLHABENEF').asInteger := qryHistoricoIDHSTFOLHABENEF.asInteger;
  dtmRelatorioGerencial.qryRelCompara.ParamByName('MES').asString              := qryHistoricoMESREFERENCIA.asString;
  dtmRelatorioGerencial.qryRelCompara.ParamByName('DATACONCESSAO').asstring  := (qryHistoricoDATAPREVPAGTO.asString);
  dtmRelatorioGerencial.qryRelCompara.open;

  dtmRelatorioGerencial.lblPeriodo.Caption := EdtReferencia.Text ;
  dtmRelatorioGerencial.lblVersao.Caption  := qryHistoricoHISTORICO.AsString ;

  frmAguarde.Apaga;

end;

function TfrmParamComparaTx.ValidaDados : boolean;
begin
   result := true;
  if (EdtReferencia.text = '    /  ') then
  begin
        MsgDlg ('Obrigatório o preenchimento de Mês de Referencia.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        EdtReferencia.SetFocus;
        result := false;
        exit;
  end;
  if (dblkcmpHistorico.Text = '') then
  begin
    MsgDlg ('Pelo menos uma Versão de Folha deve ser selecionada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblkcmpHistorico.SetFocus;
    result := false;
    exit;
  end;
end;

procedure TfrmParamComparaTx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryHistorico.Close;

end;

procedure TfrmParamComparaTx.EdtReferenciaExit(Sender: TObject);
begin
  inherited;
  if  EdtReferencia.Text <> '    /  ' then
  begin
    qryHistorico.Close;
    qryHistorico.ParamByName('MESREFERENCIA').AsString:= (EdtReferencia.Text);
    qryHistorico.Open;
    if not qryHistorico.eof then
    begin
       dblkcmpHistorico.Enabled := True;
       dblkcmpHistorico.setFocus;
    end
    else
    begin
       MsgDlg('Não existem Versão com o Mês Referencia solicitado','Erro',mtError,[mbOk,mbHelp],0);
       dblkcmpHistorico.Enabled := False;
       EdtReferencia.setFocus;
    end ;
  end;
end;

end.
