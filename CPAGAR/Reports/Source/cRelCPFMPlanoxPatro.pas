unit cRelCPFMPlanoxPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CMDBLookupCombo, uCmSqlParams, Db, DBClient, uMensErro, uSistema, uCMClientDataSet;

type
  TcfgRelCPMFPlanoxPatro = class(TfrmOkCancelar)
    edtDataProg: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cboPlano: TCMDBLookupCombo;
    cboPatro: TCMDBLookupCombo;
    Label4: TLabel;
    cboBanco: TCMDBLookupCombo;
    Bevel1: TBevel;
    CdsPlano: TCMClientDataSet;
    SqlPlano: TCMSqlParams;
    CdsPatro: TCMClientDataSet;
    SqlPatro: TCMSqlParams;
    CdsPortConta: TCMClientDataSet;
    SQLPortConta: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelCPMFPlanoxPatro: TcfgRelCPMFPlanoxPatro;

implementation

uses dRelCPMFPlanoxPatro;


{$R *.DFM}

procedure TcfgRelCPMFPlanoxPatro.FormCreate(Sender: TObject);
begin
  inherited;
  //  Abre o cds plano
  SqlPlano.Prepare;
  SqlPlano.Open;

  //  Abre o cds banco
  SQLPortConta.Prepare;
  SQLPortConta.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SQLPortConta.Open;

  //  Abre o cds patro
  SqlPatro.Prepare;
  SqlPatro.Open;
end;



procedure TcfgRelCPMFPlanoxPatro.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if edtDataProg.Text = '' then
  begin
     MsgDlg('É necessário informar uma data programada!',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
     if edtDataProg.CanFocus then edtDataProg.SetFocus;
     ModalResult := mrNo;
  end
  else
  begin
     //  Abre a qry do relatório
     DtmRelCPMFPlanoxPatro.SqlCPMFPlano.Prepare;
     DtmRelCPMFPlanoxPatro.SqlCPMFPlano.ParamByName('DATAPROG').AsDate := edtDataProg.Date; //andre tavares 05/05/2006
     //  Passa o parâmetro do plano, se houver
     if cboPlano.Text <> '' then
     begin
        dtmRelCPMFPlanoxPatro.SqlCPMFPlano.ParamByName('IDPLANOPREV').AsInteger := CdsPlano.FieldByName('IDPLANOPREV').AsInteger;
        dtmRelCPMFPlanoxPatro.ppLbPlano.Caption := 'Plano:   ' + cboPlano.Text;
     end
     else
     begin
        dtmRelCPMFPlanoxPatro.ppLbPlano.Caption := 'Plano:   Todos';
        dtmRelCPMFPlanoxPatro.SqlCPMFPlano.ParamByName('IDPLANOPREV').AsString := '';
     end;

     //  Passa o parâmetro da patro, se houver
     if cboPatro.Text <> '' then
     begin
       dtmRelCPMFPlanoxPatro.SqlCPMFPlano.ParamByName('IDPATRO').AsInteger     := CdsPatro.FieldByName('IDPATRO').AsInteger;
       dtmRelCPMFPlanoxPatro.ppLbPatro.Caption := 'Patrocinadora:   ' + cboPatro.Text;
     end
     else
     begin
       dtmRelCPMFPlanoxPatro.ppLbPatro.Caption := 'Patrocinadora:   Todas';
       dtmRelCPMFPlanoxPatro.SqlCPMFPlano.ParamByName('IDPATRO').AsString := '';
     end;

     //  Passa o parâmetro da conta bancária, se houver
     if cboBanco.Text <> '' then
     begin
        dtmRelCPMFPlanoxPatro.SqlCPMFPlano.ParamByName('CODPORTADOR').AsInteger :=  CdsPortConta.FieldByName('CODPORTADOR').AsInteger;
        dtmRelCPMFPlanoxPatro.ppLbContaBancaria.Caption := 'Conta bancária:   ' + cboBanco.Text;
     end
     else
     begin
        dtmRelCPMFPlanoxPatro.ppLbContaBancaria.Caption := 'Conta bancária:   Todas';
        dtmRelCPMFPlanoxPatro.SqlCPMFPlano.ParamByName('CODPORTADOR').AsString := '';
     end;
     DtmRelCPMFPlanoxPatro.SqlCPMFPlano.Open;

     //  Abre a qry com o logo da empresa
     DtmRelCPMFPlanoxPatro.SqlLogoEmpresa.Prepare;
     DtmRelCPMFPlanoxPatro.SqlLogoEmpresa.Open;

     //  Escrevendo o título do relatório
     dtmRelCPMFPlanoxPatro.ppLbTituloRelatorio.Caption := 'Valor de CPMF por Plano x Patro ';
     dtmRelCPMFPlanoxPatro.ppLbPeriodo.Caption         := 'Data programada:  ' + edtDataProg.Text;
  end;

end;

end.
