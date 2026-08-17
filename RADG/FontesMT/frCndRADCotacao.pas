unit frCndRADCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCondRad, Db, ImgList, TB97Tlbr, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, wwdblook, Buttons, TB97, ExtCtrls, CMDBLookupCombo, DBClient,
  uCMClientDataSet;

type
  TframeCndRADCotacao = class(TframeCondRAD)
    cdsGrupoProd: TCMClientDataSet;
    Label7: TLabel;
    dblkpGrupoProd: TCMDBLookupCombo;
  private
    { Private declarations }
  public

    procedure OnCreate; override;
    function Valida : boolean; override;

  end;

var
  frameCndRADCotacao: TframeCndRADCotacao;

implementation

{$R *.DFM}

{ TframeCndRADCotacao }

procedure TframeCndRADCotacao.OnCreate;
begin
  inherited;
  cdsGrupoProd.Data := CtrlRadEtapaCond.LookupGrupoProd;
end;

function TframeCndRADCotacao.Valida: boolean;
begin
  cdsCondicoes.FieldByName('DESCGRUPOPROD').AsString := dblkpGrupoProd.Text;
  Result := True;
end;

end.
