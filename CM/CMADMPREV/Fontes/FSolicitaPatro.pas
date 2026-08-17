// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 10.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FSolicitaPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmSolicitaPatro = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    StaticText2: TStaticText;
    dbgrdPatro: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sNomePatroSolicit : string;
    iIdPatroSolicit : integer;
  end;

var
  frmSolicitaPatro: TfrmSolicitaPatro;

implementation

uses UAdmPrev;

{$R *.DFM}

procedure TfrmSolicitaPatro.FormShow(Sender: TObject);
begin
  inherited;
  iIdPatroSolicit := -1;
  sNomePatroSolicit := '';

  qryPatro.Close;
  qryPatro.SQL.Clear;
  qryPatro.SQL.Add('  SELECT P.IDPESSOA, P.NOME         '+
                   '  FROM   PESSOA P, PATRO PT         '+
                   '  WHERE  PT.IDPESSOA   = P.IDPESSOA '+
                   '  AND    PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+
                   '  ORDER BY P.NOME ');

  qryPatro.Open;
end;

procedure TfrmSolicitaPatro.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  iIdPatroSolicit   := qryPatro.FieldByName('IdPessoa').AsInteger;
  sNomePatroSolicit := qryPatro.FieldByName('Nome').AsString;
  Close;

end;

procedure TfrmSolicitaPatro.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSolicitaPatro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
end;

end.
