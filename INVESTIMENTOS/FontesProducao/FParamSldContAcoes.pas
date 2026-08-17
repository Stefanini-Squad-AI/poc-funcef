//********************************************************************************************************
// Data     : 04/07/2007
// Código   : AL_5
// Pendencia: 25246
// Sol      : 42459
// Função   : O Relatório imprimirá os contratos que possuem saldo no dia
//            Se houver a impressão de gráfico o sistema permitirá informar o período
//            Quando não houver saldo na data será impresso somente o cabeçalho
//********************************************************************************************************
// Data     : 28/05/2007
// Código   : AL_4
// Função   : Ao escolher somente o período dava erro no filter. O Filtro já é feito em QryGraf
//********************************************************************************************************
// Data     : 23/03/2007
// Código   : AL_3
// Pendencia: 24844
// Sol      : 56250
// Função   : Exibir o Plano/Patrocinadora ao selecionar o Contrato (Alterei a Qry somente)
//********************************************************************************************************
// Data     : 15/05/2006
// Código   : AL_2
// Pendencia: 22317
// Sol      : 43013
// Função   : Implementação de Liquidação de Contrato sem entrega de ações
//********************************************************************************************************
// Data     : 16/12/2005
// Código   : AL_1
// Função   : Implementação do flag de visibilidade do gráfico
//********************************************************************************************************
unit FParamSldContAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker, FPreview;

type
  TfrmParamSldContAcoes = class(TfrmOkCancelarInv)
    qryContratos: TwwQuery;
    dblContrato: TCMDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    DtInicio: TCMDateTimePicker;
    Label4: TLabel;
    DtFim: TCMDateTimePicker;
    qryContratosIDOPERCONTACOES: TFloatField;
    qryContratosCONTRATO: TStringField;
    chkGrafico: TCheckBox;
    qryContratosPLANPRVCONTABPATRO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkGraficoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamSldContAcoes: TfrmParamSldContAcoes;

implementation

uses FDMRelContSaldos, UOperComum, UmensErro,uDataBase;

{$R *.DFM}

procedure TfrmParamSldContAcoes.FormShow(Sender: TObject);
begin
  qryContratos.Open;
  Caption := 'Relatório';
  inherited;
end;

procedure TfrmParamSldContAcoes.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //AL_5
  if (not chkGrafico.Checked) and  (DtInicio.Text = '') then // Sem grafico data obrigatoria
  begin
     MsgDlg('É necessário informar uma data.','Mensagem do Sistema' ,MtWarning,[mbok],0);
     if DtInicio.CanFocus then
        DtInicio.SetFocus;
  end
  else
  if (chkGrafico.Checked) and (DtInicio.Text <> '') and (DtFim.Text <> '') then // Sem grafico data obrigatoria
  begin
     If DtFim.date < DtInicio.date then
     begin
        MsgDlg('Data Final menor que Data Inicial.','Mensagem do Sistema' ,MtWarning,[mbok],0);
        if DtFim.CanFocus then
           DtFim.SetFocus;
     end
  end
  else
  begin // Fim AL_5
     with OperComum, DMRelContSaldos, DMRelContSaldos.qry do
     begin
        try
           if not chkGrafico.Checked then
              graGrafico.Visible := False
           else graGrafico.Visible := True;
           
           LimpaParametros(qry);
           //AL_5
           LimpaParametros(qrygraf);
           
           if Trim(dblContrato.Text) <> '' then
           begin
              ParamByName('IDOPERCONTACOES').AsInteger := qryContratosIDOPERCONTACOES.AsInteger;
              qryGraf.ParamByName('IDOPERCONTACOES').AsInteger := qryContratosIDOPERCONTACOES.AsInteger;
              lblContrato.Visible := True;
              lblContrato.Caption := 'Contrato: ' + qryContratosCONTRATO.AsString;
           end
           else
              lblContrato.Visible := False;

           lblPeriodo.Caption := '';
           if Trim(DtInicio.Text) <> '' then
           begin
              ParamByName('DATAINI').AsString := DtInicio.Text;
              qryGraf.ParamByName('DATAINI').AsString := DtInicio.Text;
              lblPeriodo.Caption := 'Data Inicio: ' + DtInicio.Text + '  ';
              //AL_5
              if not chkGrafico.Checked then
              begin
                 if DtInicio.Text <> '' then // Com Gráfico
                 begin // Data Final igual a data inicial, pois é a posição no dia
                    ParamByName('DATAFIM').AsString := DtInicio.Text;
                    lblPeriodo.Caption := 'saldo em: ' + DtInicio.Text + '  ';
                 end
              end; // Fim AL_5
           end;
           if Trim(DtFim.Text) <> '' then
           begin
              ParamByName('DATAFIM').AsString := DtFim.Text;
              qryGraf.ParamByName('DATAFIM').AsString := DtFim.Text;
              lblPeriodo.Caption := lblPeriodo.Caption + 'Data Fim: ' + DtFim.Text;
           end;
           Open;
           qryGraf.Open;
              qry.DisableControls;
              //AL_5 - Foi um mal necessário pois não imprime rodapé com qry vazia
              If Qry.IsEmpty then
              begin
                 Qry.Insert;
                 qryIDOPERCONTACOES.AsInteger := LeUltRegistro(nil,'OPERCONTACOES');
                 qryIDOPERCONTACOESAP.AsInteger := qryIDOPERCONTACOES.AsInteger;
                 Qry.Post;
              end;

              TFrmPreview.CreateModalPreview(Application, rpt, rpt.PrinterSetup.DocumentName);
              //AL_5
              Qry.Cancel;

              qry.EnableControls;
          // end

           finally
              LimpaParametros(qry);

           end;
     end; // Fim With
  end; // Fim Critica Data
end;

procedure TfrmParamSldContAcoes.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblContrato.Clear;
  DtInicio.Clear;
  DtFim.Clear;
  if dblContrato.CanFocus then
     dblContrato.SetFocus;
end;

procedure TfrmParamSldContAcoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryContratos.Close;
  //AL_5
  DMRelContSaldos.qryGraf.Close;
  DMRelContSaldos.qry.Close; // Fim AL_5
  inherited;
end;

//AL_5
procedure TfrmParamSldContAcoes.chkGraficoClick(Sender: TObject);
begin
  inherited;
  If chkGrafico.Checked then
  begin
     Label2.caption := 'Data Inicio';
     DtFim.Visible := True;
     Label4.Visible := True;
     If DtFim.CanFocus then
        DtFim.SetFocus;
  end
  else
  begin
     Label2.caption := 'Data';
     DtFim.Text := '';
     DtFim.Visible := False;
     Label4.Visible := False;
     If DtInicio.CanFocus then
        DtInicio.SetFocus;
  end;
end;

end.

