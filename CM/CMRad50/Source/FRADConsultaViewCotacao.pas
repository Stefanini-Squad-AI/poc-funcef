unit FRADConsultaViewCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBClient, uCMClientDataSet, StdCtrls, DBCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TfrmRADConsultaViewCotacao = class(TfrmSairAjuda)
    PlnDescProd: TPanel;
    Panel1: TPanel;
    plnItem: TPanel;
    Splitter1: TSplitter;
    PgItem: TPageControl;
    TabPrazoEnt: TTabSheet;
    GrdPrazoEnt: TwwDBGrid;
    TabPrazoPag: TTabSheet;
    GrdPrazoPag: TwwDBGrid;
    TabAgreg: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    TabObsItem: TTabSheet;
    memObsItem: TDBMemo;
    GrdItem: TwwDBGrid;
    cdsCotacao: TCMClientDataSet;
    dsCotacao: TwwDataSource;
    cdsPrazoPgto: TCMClientDataSet;
    dsPrazoPgto: TwwDataSource;
    cdsImpostos: TCMClientDataSet;
    dsImpostos: TwwDataSource;
    cdsPrazoEntrega: TCMClientDataSet;
    dsPrazoEntrega: TwwDataSource;
  private
    FCodProcesso: integer;
    FIdProcxArt: integer;
    procedure SetCodProcesso(const Value: integer);
    procedure SetIdProcxArt(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property CodProcesso: integer read FCodProcesso write SetCodProcesso;
    property IdProcxArt: integer read FIdProcxArt write SetIdProcxArt;
  end;

var
  frmRADConsultaViewCotacao: TfrmRADConsultaViewCotacao;

implementation

{$R *.DFM}

{ TfrmRADConsultaViewCotacao }

procedure TfrmRADConsultaViewCotacao.SetCodProcesso(const Value: integer);
begin
  FCodProcesso := Value;
end;

procedure TfrmRADConsultaViewCotacao.SetIdProcxArt(const Value: integer);
begin
  FIdProcxArt := Value;
end;

end.
