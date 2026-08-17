// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 10.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FSolicitaPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, DBTables,
  Wwquery, MAHlpBtn, Buttons, TB97, ExtCtrls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti;

type
  TfrmSolicitaPlano = class(TfrmOkCancelar)
    qryPlanPrev: TwwQuery;
    StaticText1: TStaticText;
    dbgrdPlanPatro: TwwDBGrid;
    dsPlanPrev: TwwDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbgrdPlanPatroDblClick(Sender: TObject);
    procedure dbgrdPlanPatroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSolicitaPlano: TfrmSolicitaPlano;

implementation

uses
    UAdmPrev, USistema;

{$R *.DFM}

procedure TfrmSolicitaPlano.FormCreate(Sender: TObject);
var
  sSql: string;
begin
  inherited;
  sSql := ' SELECT PLANPREV.NOME, PLANPREV.IDPLANOPREV '+
          ' FROM   PLANPREV                            '+
          ' WHERE  PLANPREV.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO P '+ 
          '                                 WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)          +
          '                                 AND     PLP.IDPESSJUR = P.IDPESSOA )                    ';
  sSql := sSql + ' ORDER BY PLANPREV.NOME ';

  qryPlanPrev.Close;
  qryPlanPrev.Sql.Clear;
  qryPlanPrev.Sql.Add(sSql);
  qryPlanPrev.Open;
end;

procedure TfrmSolicitaPlano.FormShow(Sender: TObject);
begin
  inherited;
  sIdPlano   := '';
  sNomePlano := '';

end;

procedure TfrmSolicitaPlano.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sIdPlano   := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
  sNomePlano := qryPlanPrev.FieldByName('NOME').AsString;
  Close;
end;

procedure TfrmSolicitaPlano.dbgrdPlanPatroDblClick(Sender: TObject);
begin
// Temporario(Acess violation)
  inherited;
  sIdPlano   := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
  sNomePlano := qryPlanPrev.FieldByName('NOME').AsString;
  Close;
end;

procedure TfrmSolicitaPlano.dbgrdPlanPatroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then
     begin
          sIdPlano   := qryPlanPrev.FieldByName('IDPLANOPREV').AsString;
          sNomePlano := qryPlanPrev.FieldByName('NOME').AsString;
          Close;
     end;
end;

procedure TfrmSolicitaPlano.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSolicitaPlano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryPlanPrev.Close;
end;

end.
