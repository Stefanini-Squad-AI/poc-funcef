unit cRelSeguros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, mCliente, mContrato, Db, DBClient,
  uCMClientDataSet, wwdblook, Provider, DBTables, mSeguradora, mImovelouMestre;

type
  TcfgRelSeguros = class(TfrmParamReports_Padrao)
    rbTipo: TRadioGroup;
    molImovelouMestre1: TmolImovelouMestre;
    molSeguradora1: TmolSeguradora;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelSeguros: TcfgRelSeguros;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, UComunsImobiliario, uVerificaPreenchimento;

procedure TcfgRelSeguros.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cmp_Padrao.ParamByName('idImovel').AsInteger     := molImovelouMestre1.iImovel;
  cmp_Padrao.ParamByName('idSeguradora').AsInteger := molSeguradora1.iSeguradora;
  cmp_Padrao.ParamByName('iTipo').AsInteger        := rbTipo.ItemIndex;
end;


end.
