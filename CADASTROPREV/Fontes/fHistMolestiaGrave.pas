unit fHistMolestiaGrave;

{Alterações:
--------------------------------------------------------------------------------------------------
Pendência   : SOL 128874 KINTANA 695343
Responsável : Fanuel Junior
Data        : 19/10/2010
Descrição   : Criação do formulario Historico de Molestia Grave
--------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery;

type
  TfrmHistMolestiaGrave = class(TForm)
    wwDBGrid1: TwwDBGrid;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    qryHistMolestiaGrave: TwwQuery;
    dsHistMolestiaGrave: TwwDataSource;
    procedure bbtnSairClick(Sender: TObject);
  private
    FIdpessoa :Integer;
    procedure exibirQueryHistorico;
    { Private declarations }
  public
    property IdPessoa : Integer read FIdPessoa;
    constructor Create(AOwner: TComponent; AIdPessoa : Integer);
    { Public declarations }
  end;

var
  frmHistMolestiaGrave: TfrmHistMolestiaGrave;

implementation

{$R *.DFM}

constructor TfrmHistMolestiaGrave.Create(AOwner: TComponent;
  AIdPessoa: Integer);
   begin
      inherited Create(AOwner);
      FIdPessoa := AIdPessoa;
      exibirQueryHistorico;
   end;

procedure TfrmHistMolestiaGrave.exibirQueryHistorico;
   begin
      qryHistMolestiaGrave.Close;
      qryHistMolestiaGrave.SQL.Clear;
      qryHistMolestiaGrave.SQL.Add ('SELECT DTINICIO,');
      qryHistMolestiaGrave.SQL.Add ('DTFINAL');
      qryHistMolestiaGrave.SQL.Add ('FROM HSTMOLESTIAGRAVE ');
      qryHistMolestiaGrave.SQL.Add ('WHERE IDPESSOA = ' + IntToStr(FIdPessoa));
      qryHistMolestiaGrave.Open;
   end;


procedure TfrmHistMolestiaGrave.bbtnSairClick(Sender: TObject);
begin
Close;
end;

end.
