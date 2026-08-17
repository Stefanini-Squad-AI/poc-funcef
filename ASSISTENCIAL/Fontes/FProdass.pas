unit FProdass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, DBCtrls, Mask, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TFrmProdass = class(TFrmCadastroGridCS)
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    DBNome: TDBEdit;
    DBDescricao: TDBMemo;
    DBIdProdass: TDBEdit;
    qryAux: TwwQuery;
    GroupBoxPerc: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    wwDBCBIof: TwwDBComboBox;
    wwDBCBProLabore: TwwDBComboBox;
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdass: TFrmProdass;

implementation

uses UMensErro, UDataBase;

{$R *.DFM}

procedure TFrmProdass.sbtnApagarClick(Sender: TObject);
var sSql : string;
begin
  qryAux.Close;
  sSql := 'SELECT IDPLANASS  FROM  PLANASS ' +
          ' WHERE (IDPRODASS = '+ qry.FieldByName('IdPRODASS').AsString+')';
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  try
    qryAux.Open;
  except
    on E: EDBEngineError do begin
      MostrarErro(E);
      Exit;
    end; {on}
  end; {try .. except}
  if not qryAux.IsEmpty then begin
    MsgDlg('O produto não pode ser apagado por ter planos ligados a ele !','Informação', mtInformation, [mbOk], 0);
    CmeCadastro.AtualizaBotoes(self);
    Exit;
  end;
  inherited;
end;

procedure TFrmProdass.CmeCadastroFind(Sender: TObject);
begin
  if MontaSelect.RetornouValor then
    qry.Locate('IDPRODASS',MontaSelect.ValoresChave[0],[loPartialKey]) ;
end;

procedure TFrmProdass.qryBeforePost(DataSet: TDataSet);
begin
  if qry.State in [dsinsert] then
    qry.FieldByName('IDPRODASS').AsInteger := LeUltRegistro(nil,'PRODASS');
  inherited;
end;

procedure TFrmProdass.bbtnConfirmarClick(Sender: TObject);
begin
  if ds.DataSet.State <> dsBrowse then
  begin
    if DBNome.Text = '' then
    begin
      MsgDlg('É preciso digitar o nome do produto !', 'Erro', mtError, [mbOk,mbHelp], 0);
      Exit;
    end;
  end;
  inherited;
end;

end.
