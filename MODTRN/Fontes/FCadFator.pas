unit fCadFator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro,
  ImgList, wwdblook;

type
  TfrmCadFator = class(TFrmCadastroGridCS)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    qryGrupoFator: TwwQuery;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
  private
  public
    { Public declarations }
  end;

var
  frmCadFator: TfrmCadFator;

implementation

{$R *.DFM}

uses uDataBase;

procedure TfrmCadFator.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDFATORAVAL', StrToInt(MontaSelect.ValoresChave[0]), []);
end;

procedure TfrmCadFator.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dbedCodigo.Text := IntToStr(LeUltRegistro(Nil,'FATORAVALCURSO'));
end;

end.
