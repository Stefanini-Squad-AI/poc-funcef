unit fSelTreinColetivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Spin, TEdNum, ComCtrls,
  uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport;

type
  TfrmSelTreinColetivo = class(TfrmSelPessoalMT)
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    ListaCodFunc: TStringList;
  end;

var
  frmSelTreinColetivo: TfrmSelTreinColetivo;

implementation

{$R *.DFM}

procedure TfrmSelTreinColetivo.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCodFunc := TStringList.Create;
end;

procedure TfrmSelTreinColetivo.FormDestroy(Sender: TObject);
begin
  ListaCodFunc.Free;
  inherited;   
end;

procedure TfrmSelTreinColetivo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ListaCodFunc.Clear;
  CdsPrincipal.First;
  while not (CdsPrincipal.EOF) do
  begin
    ListaCodFunc.Add(CdsPrincipal.FieldByName('IDPESSOA').asString);
    CdsPrincipal.Next;
  end;          
end;

end.
