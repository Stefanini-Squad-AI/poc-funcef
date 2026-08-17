unit FCadPesqTend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, wwdblook, Mask, DBCtrls, TREdit, FCadastroCS;

type
  TfrmCadPesqTend = class(TfrmCadastroCS)
    gbxPesquisa: TGroupBox;
    dbedCodPesqui: TDBEdit;
    dbedData: TDBEdit;
    dbedCodCargo: TDBEdit;
    dblcPesquisa: TwwDBLookupCombo;
    dblcCargo: TwwDBLookupCombo;
    dblcEntid: TwwDBLookupCombo;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbedMenor: TDBRealEdit;
    dbedMenorR: TDBRealEdit;
    dbedPrimQ: TDBRealEdit;
    dbedPrimQR: TDBRealEdit;
    dbedModa: TDBRealEdit;
    dbedModaR: TDBRealEdit;
    dbedMedia: TDBRealEdit;
    dbedMediaR: TDBRealEdit;
    dbedMediana: TDBRealEdit;
    dbedMedianaR: TDBRealEdit;
    dbedTercQ: TDBRealEdit;
    dbedTercQR: TDBRealEdit;
    dbedMaior: TDBRealEdit;
    dbedMaiorR: TDBRealEdit;
    Label10: TLabel;
    dbedFreq: TDBEdit;
    qryPesqui: TwwQuery;
    qryCargo: TwwQuery;
    qryEntid: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnGraficoClick(Sender: TObject);
    procedure dblcPesquisaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPesqTend: TfrmCadPesqTend;

implementation

uses uMensErro, fColetaSal, fTelaAut, fChartDado, uSistema, uDataBase;

{$R *.DFM}

procedure TfrmCadPesqTend.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESQSALAR').asInteger   := -1;
  qry.ParamByName('IDCARGO').asInteger       := -1;
  qry.ParamByName('IDEMPRESAPARTIC').asFloat := -1;
  qry.Open;

  qryPesqui.Open;
  qryCargo.Open;
  qryEntid.Open;

end;

procedure TfrmCadPesqTend.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    qry.Close;
    qry.ParamByName('IDPESQSALAR').asInteger     := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDCARGO').asInteger         := StrToInt(MontaSelect.ValoresChave[1]);
    qry.ParamByName('IDEMPRESAPARTIC').asFloat   := StrToFloat(MontaSelect.ValoresChave[2]);
    qry.Open;
  end;

end;

procedure TfrmCadPesqTend.sbtnGraficoClick(Sender: TObject);
begin
  inherited;
   if (dbedMaior.Value = 0) then exit;

   frmChartDado := TFrmChartDado.Create(Application);
   frmChartDado.edCodEntid.Text := FloatToStr(qry.FieldByName('IDEMPRESAPARTIC').AsFloat);
   frmChartDado.dsTend := ds;
   frmChartDado.dsTend.Dataset := qry;
   frmChartDado.EditPesq.Text := trim(dblcPesquisa.Text) +
                            ' - ' + trim(dbedData.Text);
   frmChartDado.EditCargo.Text := dblcCargo.Text;
   frmChartDado.EditEntid.Text := dblcEntid.Text;
   frmChartDado.ShowModal;
   frmChartDado.Free;
end;

procedure TfrmCadPesqTend.dblcPesquisaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (qry.State in [dsInsert, dsEdit]) then
     qry.FieldByName('DATAREFPESQ').Value := qryPesqui.FieldByName('DATAREFPESQ').Value;
end;

procedure TfrmCadPesqTend.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  gbxPesquisa.Enabled := False;
end;

procedure TfrmCadPesqTend.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  gbxPesquisa.Enabled := True;
end;

procedure TfrmCadPesqTend.dsStateChange(Sender: TObject);
begin
  inherited;
  qryEntid.Close;
  with qryEntid.SQL do
  begin
    if (qry.State = dsInsert) then    // Nao traz as empresas prop.
    begin
      dblcEntid.Text := '';
      Clear;
      Add('SELECT P.NOME, T.IDPESSOA');
      Add('FROM PESSOA P, TERCEIRO T');
      Add('WHERE P.IDPESSOA = T.IDPESSOA');
      Add('ORDER BY 1');
    end
    else
    begin
      Clear;
      Add('SELECT P.NOME, T.IDPESSOA');
      Add('FROM PESSOA P, TERCEIRO T');
      Add('WHERE P.IDPESSOA = T.IDPESSOA');
      Add('UNION');
      Add('SELECT NOMEEMPRESA AS NOME, IDPESSOA');
      Add('FROM EMPRESAPROP');
      Add('ORDER BY 1');
    end;
  end;
  qryEntid.Open;
end;

end.
