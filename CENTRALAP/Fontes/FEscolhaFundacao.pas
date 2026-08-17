unit FEscolhaFundacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, FPRINCIPAL;

type
  TfrmEscolhaFundacao = class(TfrmOkCancelar)
    qryFundacao: TwwQuery;
    Label1: TLabel;
    dblkpcmbFundacao: TwwDBLookupCombo;
    qryFundacaoIDPESSOA: TFloatField;
    qryFundacaoNOME: TStringField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolhaFundacao: TfrmEscolhaFundacao;

implementation

{$R *.DFM}

procedure TfrmEscolhaFundacao.FormShow(Sender: TObject);
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.Open;
end;

end.
