unit FSelEstDistr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, wwdblook,
  Db, DBTables, Wwtable, Wwdatsrc, Wwquery, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, ExtCtrls;

type
  TfrmSelEstDistr = class(TfrmOkCancelar)
    ds: TwwDataSource;
    qryCargo: TwwQuery;
    rgValor: TRadioGroup;
    rgSelCargo: TRadioGroup;
    gbxCargo: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    lstCargo: TListBox;
    cbxDemais: TCheckBox;
    rgDistribPor: TRadioGroup;
    lstCodCargo: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure dblcCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstCargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgSelCargoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgDistribPorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEstDistr: TfrmSelEstDistr;
  SvItem : Integer;

implementation

uses FSelEstDistr2, FTelaAut, uSistema;

{$R *.DFM}


procedure TfrmSelEstDistr.FormCreate(Sender: TObject);
begin
  inherited;
  qryCargo.Open;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmSelEstDistr.dblcCargoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) and (qryCargo.FieldByName('TITULO').AsString <> '') then
  begin
    lstCargo.Items.Add(qryCargo.FieldByName('TITULO').Value);
    lstCodCargo.Items.Add(qryCargo.FieldByName('CODIGO').AsString);
  end;
end;

procedure TfrmSelEstDistr.lstCargoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstCargo.Items.Count > 0)  then
  begin
      SvItem := lstCargo.ItemIndex;
      lstCargo.Items.Delete(SvItem);
      lstCodCargo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelEstDistr.rgSelCargoClick(Sender: TObject);
begin
  inherited;
  gbxCargo.Visible := (rgSelCargo.ItemIndex = 1);
end;

procedure TfrmSelEstDistr.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (rgSelCargo.ItemIndex = 0) then begin
     lstCodCargo.Clear;
     lstCargo.Clear;
     qryCargo.First;
     while not qryCargo.Eof do begin
        lstCodCargo.Items.Add(qryCargo.FieldByName('CODIGO').AsString);
        lstCargo.Items.Add(qryCargo.FieldByName('TITULO').AsString);
        qryCargo.Next;
     end;
     qryCargo.First;
  end;
  AbrirForm{Modal}(frmSelEstDistr2, TfrmSelEstDistr2, False);
  //frmSelEstObj2.Free;
end;

procedure TfrmSelEstDistr.rgDistribPorClick(Sender: TObject);
begin
  inherited;
  lstCargo.Clear;
  lstCodCargo.Clear;
  gbxCargo.Caption := rgDistribPor.Items[rgDistribPor.ItemIndex];
  if (rgDistribPor.ItemIndex = 0) then // Cargo
  begin
    qryCargo.Close;
    qryCargo.Sql.Clear;
    qryCargo.Sql.Add('SELECT DISTINCT C.TITULO, C.IDCARGO AS CODIGO');
    qryCargo.Sql.Add('FROM CARGO C, FUNCIONARIO F');
    qryCargo.Sql.Add('WHERE F.IDCARGO = C.IDCARGO');
    qryCargo.Sql.Add('ORDER BY UPPER(TITULO)');
    qryCargo.Open;
  end
  else
  if (rgDistribPor.ItemIndex = 1) then // Estab.
  begin
    qryCargo.Close;
    qryCargo.Sql.Clear;
    qryCargo.Sql.Add('SELECT DISTINCT NOME AS TITULO, IDPESSOA AS CODIGO');
    qryCargo.Sql.Add('FROM PESSOA');
    qryCargo.Sql.Add('WHERE (IDGRUPO = ' + IntToStr(Sistema.IdEmpresa) + ') OR');
    qryCargo.Sql.Add('      (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
    qryCargo.Sql.Add('       WHERE  IDGRUPO = ' + IntToStr(Sistema.IdEmpresa) + ')) OR');
    qryCargo.Sql.Add('      (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
    qryCargo.Sql.Add('       WHERE  IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
    qryCargo.Sql.Add('         WHERE  IDGRUPO = ' + IntToStr(Sistema.IdEmpresa) + '))) OR');
    qryCargo.Sql.Add('      (IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
    qryCargo.Sql.Add('        WHERE  IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
    qryCargo.Sql.Add('          WHERE   IDGRUPO IN (SELECT IDPESSOA FROM PESSOA');
    qryCargo.Sql.Add('            WHERE  IDGRUPO = ' + IntToStr(Sistema.IdEmpresa) + '))))');
    qryCargo.Sql.Add('ORDER BY UPPER(TITULO)');
    qryCargo.Open;
  end
  else
  if (rgDistribPor.ItemIndex = 2) then // Segmento
  begin
    qryCargo.Close;
    qryCargo.Sql.Clear;
    qryCargo.Sql.Add('SELECT DISTINCT R.DESCRAMOFORNECEDOR AS TITULO, R.IDRAMOFORNECEDOR AS CODIGO');
    qryCargo.Sql.Add('FROM RAMOFORNECEDOR R, FILIALPESSOA F');
    qryCargo.Sql.Add('WHERE F.IDRAMOFORNECEDOR = R.IDRAMOFORNECEDOR');
    qryCargo.Sql.Add('ORDER BY UPPER(TITULO)');
    qryCargo.Open;
  end
  else
  if (rgDistribPor.ItemIndex = 3) then // Sindicato
  begin
    qryCargo.Close;
    qryCargo.Sql.Clear;
    qryCargo.Sql.Add('SELECT DISTINCT P.NOME AS TITULO, P.IDPESSOA AS CODIGO');
    qryCargo.Sql.Add('FROM PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, SINDICATO S');
    qryCargo.Sql.Add('WHERE S.IDPESSOA = P.IDPESSOA');
    qryCargo.Sql.Add('AND   F.IDPESSOA = PF.IDPESSOA');
    qryCargo.Sql.Add('AND   PF.IDSINDICATO = P.IDPESSOA');
    qryCargo.Sql.Add('ORDER BY UPPER(TITULO)');
    qryCargo.Open;
  end
  else
  if (rgDistribPor.ItemIndex = 4) then // C.Custo
  begin
    qryCargo.Close;
    qryCargo.Sql.Clear;
    qryCargo.Sql.Add('SELECT DISTINCT C.NOME AS TITULO, C.CODCENTROCUSTO AS CODIGO');
    qryCargo.Sql.Add('FROM CENTCUST C, FUNCIONARIO F');
    qryCargo.Sql.Add('WHERE F.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    qryCargo.Sql.Add('AND   F.CODCENTROCUSTO = C.CODCENTROCUSTO');
    qryCargo.Sql.Add('ORDER BY UPPER(TITULO)');
    qryCargo.Open;
  end;
end;

end.
