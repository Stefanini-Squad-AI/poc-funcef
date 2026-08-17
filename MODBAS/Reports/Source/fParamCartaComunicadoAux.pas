unit fParamCartaComunicadoAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT, Db,
  DBTables, Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn, Buttons, TB97,
  TB97Tlbr, ComCtrls, uAutorizacao, IvDictio, IvMulti, wwdbdatetimepicker, DBClient, IvEMulti,
  CMDateTimePicker, uCMClientDataSet, uCmSqlParams, CmParamReport;

type
  TfrmParamCartaComunicadoAux = class(TfrmSelPessoalMT)
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);    
  public
    IdPessoaSel: string;
  end;

var
  frmParamCartaComunicadoAux: TfrmParamCartaComunicadoAux;

implementation

{$R *.DFM}

procedure TfrmParamCartaComunicadoAux.FormCreate(Sender: TObject);
begin
  inherited;
  IdPessoaSel := '-1';
end;

procedure TfrmParamCartaComunicadoAux.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  while not(CdsPrincipal.EOF) do
  begin
    if (IdPessoaSel = '-1') then
      IdPessoaSel := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      IdPessoaSel := IdPessoaSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;
end;

end.
