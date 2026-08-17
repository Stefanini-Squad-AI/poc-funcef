unit FParamConferDocReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBTables, Wwquery;

type
  TfrmParamConferDocReg = class(TfrmOkCancelar)
    gpPeriodo: TGroupBox;
    Label1: TLabel;
    dtpDataInicial: TCMDateTimePicker;
    dtpDataFinal: TCMDateTimePicker;
    grpContaBancaria: TGroupBox;
    dblcContas: TwwDBLookupCombo;
    rgpDocumentos: TRadioGroup;
    qryContas: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gpPeriodoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamConferDocReg: TfrmParamConferDocReg;

implementation

uses DRelatoriosCFinan,USistema,UMensErro;

{$R *.DFM}

procedure TfrmParamConferDocReg.FormCreate(Sender: TObject);
begin
   inherited;
   qryContas.Close;
   qryContas.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryContas.Open;
end;

procedure TfrmParamConferDocReg.bbtnConfirmarClick(Sender: TObject);
begin
   with dtmRelatoriosCFinan do
   begin
      qryConferDocRegular.Close;

      if rgpDocumentos.ItemIndex=0 then
         qryConferDocRegular.ParamByName('Marcado').AsString:='N'
      else
         qryConferDocRegular.ParamByName('Marcado').AsString:='S';

      qryConferDocRegular.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;

      if dblcContas.Text<>'' then
       begin
          qryConferDocRegular.ParamByName('CodPortador').AsFloat:=StrToFloat(dblcContas.LookupValue);
          qryConferDocRegular.ParamByName('TodasContas').AsString:='N';
       end
      else
       begin
          qryConferDocRegular.ParamByName('CodPortador').AsFloat:=0;
          qryConferDocRegular.ParamByName('TodasContas').AsString:='S';
       end;

      if (dtpDataInicial.Text<>'') then
       begin
          qryConferDocRegular.ParamByName('DataInicial').AsString:=dtpDataInicial.Text;
          qryConferDocRegular.ParamByName('DataFinal').AsString:=dtpDataFinal.Text;
          qryConferDocRegular.ParamByName('TodasDatas').AsString:='N';
       end
      else
       begin
          qryConferDocRegular.ParamByName('DataInicial').AsString:='01/01/2001';
          qryConferDocRegular.ParamByName('DataFinal').AsString:='01/01/2001';
          qryConferDocRegular.ParamByName('TodasDatas').AsString:='S';
       end;

      qryConferDocRegular.Open;
      qryConferDocRegular.First;
   end;
   inherited;   
end;

procedure TfrmParamConferDocReg.gpPeriodoExit(Sender: TObject);
begin
   if ActiveControl=bbtnSair then Exit;

   if dtpDataInicial.Text='' then dtpDataFinal.Text:='';
   if dtpDataInicial.Date>dtpDataFinal.Date then
    begin
       MsgDlg('Data Inicial não pode ser maior que a data Final.','Erro',mtError,[mbOk],0);
       dtpDataFinal.SetFocus;
    end;
end;

end.
