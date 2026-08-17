unit fBrwPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, Db,
  DBTables, Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn, Buttons, TB97,
  TB97Tlbr, ComCtrls, uAutorizacao, IvDictio, IvMulti, wwdbdatetimepicker, DBClient, IvEMulti,
  CMDateTimePicker, uCMClientDataSet, uCmSqlParams, fSelPessoalMT, Grids, Wwdbigrd, Wwdbgrid,
  CmParamReport;

type
  TfrmBrwPess = class(TfrmSelPessoalMT)
    dbgrPessoal: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
  end;

var
  frmBrwPess: TfrmBrwPess;

implementation

uses uSistema, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmBrwPess.FormCreate(Sender: TObject);
begin
  inherited;
  case (Sistema.IdModulo) of
    MODBAS : HelpContext := 690018;
    MODFOL : HelpContext := 210081;
  end;
end;

end.
