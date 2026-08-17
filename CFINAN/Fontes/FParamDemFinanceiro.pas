unit FParamDemFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CMDBLookupCombo, Db, DBTables, Wwquery;

type
  TfrmParamDemFinanceiro = class(TfrmOkCancelar)
    Label3: TLabel;
    dblcBanco: TCMDBLookupCombo;
    qryPortador: TwwQuery;
    Label1: TLabel;
    dtpDataFinal: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamDemFinanceiro: TfrmParamDemFinanceiro;

implementation

uses DRelatDemFinanceiro,uSistema,uMensErro;

{$R *.DFM}

procedure TfrmParamDemFinanceiro.FormCreate(Sender: TObject);
begin
   inherited;
   qryPortador.Close;
   qryPortador.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryPortador.Open;
end;

procedure TfrmParamDemFinanceiro.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if (dtpDataFinal.Text = '') then
    begin
       MsgDlg('A Data Final não pode ser deixada em branco.','Erro',mtError,[mbOk],0);
       Exit;
    end;

   with dtmRelatDemFinanceiro do
   begin
      dDataFinal:=dtpDataFinal.Date;

      qryDemFinan.Close;
      qryDemFinan.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
      qryDemFinan.ParamByName('DataFinal').AsDate:=dtpDataFinal.Date;

      qryDemFinan.ParamByName('CodPortador').AsFloat:=0;
      qryDemFinan.ParamByName('TodosBancos').AsString:='';
      if Trim(dblcBanco.Text)<>'' then
         qryDemFinan.ParamByName('CodPortador').AsFloat:=StrToFloat(dblcBanco.LookupValue)
      else
         qryDemFinan.ParamByName('TodosBancos').AsString:='Todos';

      qryDemFinan.Open;
      qryDemFinan.First;
   end;
end;

end.
