unit FConsultaBuscaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, uCmSqlParams, DBClient,
  uCMClientDataSet, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, uCtrlConsultaBusca, uSistema,
  uMensErro;

type
  TfrmConsultaBusca = class(TfrmOkCancelar)
    pcValoresNegativos: TPageControl;
    tbsAcerto: TTabSheet;
    Panel1: TPanel;
    edCPF: TEdit;
    Label1: TLabel;
    wwDBGrid1: TwwDBGrid;
    cdsBuscaDados: TCMClientDataSet;
    SqlBuscaDados: TCMSqlParams;
    dsBuscaDados: TwwDataSource;
    cdsInforme: TCMClientDataSet;
    sqlInforme: TCMSqlParams;
    dsInforme: TwwDataSource;
    btnFiltra: TBitBtn;
    Label2: TLabel;
    edtDataRef: TEdit;
    udAcerto: TUpDown;
    cbIdFolha: TComboBox;
    cbIdPessoa: TComboBox;
    cbData: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnLimpa: TBitBtn;
    Label6: TLabel;
    edNome: TEdit;
    Label7: TLabel;
    edNascimento: TEdit;
    Bevel1: TBevel;
    Label8: TLabel;
    cbIdInforme: TComboBox;
    procedure btnFiltraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbIdFolhaChange(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);

  private
    { Private declarations }
    CtrlConsultaBusca : TCtrlConsultaBusca;
    procedure MontaFiltros;
    procedure LimpaCombo(const IdCombo: Integer);
    function AcertaCPF(const pCPF: String): String;

  public
    { Public declarations }
  end;

var
  frmConsultaBusca: TfrmConsultaBusca;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmConsultaBusca.btnFiltraClick(Sender: TObject);
begin
  inherited;
  edCPF.Text := AcertaCPF(edCPF.Text);
  cdsBuscaDados.Data := CtrlConsultaBusca.ListConsultaBusca(edtDataRef.Text,edCPF.text);
  MontaFiltros;
end;

function TFrmConsultaBusca.AcertaCPF(const pCPF : String) : String;
var i : Integer;
    sCPF : String;
begin
  sCPF := Trim(pCPF);
  for i := 1 to length(sCPF) do
  begin
    If sCPF[i] in ['0'..'9'] then
     Result := REsult + sCPF[i]
  end;
end;

Procedure TFrmConsultaBusca.MontaFiltros;
var oCds : TCmClientDataSet;
       Procedure AjustaCombo(const oCombo : TComboBox;const oCds : TCMClientDataSet);
       begin
         oCds.First;
         oCombo.Items.Clear;
         While Not oCds.Eof do
         begin
           oCombo.Items.Add(oCds.Fields[0].asString);
           oCds.Next;
         end;
         oCds.Close;
       end;
begin
  oCds := TCmClientDataSet.Create(NIl);
  Try

    oCds.Data := CtrlConsultaBusca.BuscaNome(edCPF.text);
    edNome.TExt := oCds.FieldByName('Nome').asString;
    edNascimento.Text := oCds.FieldByName('DataNasc').asString;

    oCds.Data := CtrlConsultaBusca.MontaFiltroIdPessoa(edtDataRef.Text,edCPF.Text);
    AjustaCombo(cbIdPessoa,oCds);
    oCds.Data := CtrlConsultaBusca.MontaFiltroIdFolha(edtDataRef.Text,edCPF.Text);
    AjustaCombo(cbIdFolha,oCds);
    oCds.Data := CtrlConsultaBusca.MontaFiltroMes(edtDataRef.Text,edCPF.Text);
    AjustaCombo(cbData,oCds);
    oCds.Data := CtrlConsultaBusca.MontaFiltroIdInforme(edtDataRef.Text,edCPF.Text);
    AjustaCombo(cbIdInforme,oCds);
  finally
    oCds.Close;
    FreeAndNil(oCds);
  end;

end;

procedure TfrmConsultaBusca.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlConsultaBusca := TCtrlConsultaBusca.Create;
  CtrlConsultaBusca.Initialize(DtmBaseDados.dbBaseDados,
                            True,
                            Sistema.ConnectionType,
                            Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,
                            False,
                            nil);
  udAcerto.Position  := StrToInt(FormatDateTime('YYYY', Date));
end;

procedure TfrmConsultaBusca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlConsultaBusca.Free;
end;

procedure TfrmConsultaBusca.FormShow(Sender: TObject);
begin
  inherited;
  sqlInforme.Open;
end;

procedure TfrmConsultaBusca.cbIdFolhaChange(Sender: TObject);
var sFiltro : String;
    oCombo : TComboBox;
begin
  inherited;
  oCombo := TComboBox(Sender);
  If oCombo.ItemIndex > -1 then
  begin
    Case oCombo.Tag Of
     0 : sFiltro := 'IdBenefIrrf = '     + oCombo.items[oCombo.ItemIndex];
     1 : sFiltro := 'IdHstFolhaBenef = ' + oCombo.items[oCombo.ItemIndex];
     2 : sFiltro := 'DataPagamento = '   + QuotedStr(oCombo.items[oCombo.ItemIndex]);
     3 : sFiltro := 'IdInforme = '       + oCombo.items[oCombo.ItemIndex]
    end;
    LimpaCombo(oCombo.Tag);
    cdsBuscaDados.Filter := sFiltro;
    cdsBuscaDados.Filtered := True;
    btnLimpa.Enabled := True;
  end;
end;

Procedure TfrmConsultaBusca.LimpaCombo(const IdCombo: Integer);
var i : Integer;
begin
  i := 0;
  while i < 4 do
  begin
    Case i Of
      0 : If i <> IdCombo then cbIdPessoa.ItemIndex  := -1;
      1 : If i <> IdCombo then cbIdFolha.ItemIndex   := -1;
      2 : If i <> IdCombo then cbData.ItemIndex      := -1;
      3 : If i <> IdCombo then cbIdInforme.ItemIndex := -1;
    end;
    Inc(i);
  end;
end;

procedure TfrmConsultaBusca.btnLimpaClick(Sender: TObject);
begin
  inherited;
  btnLimpa.Enabled := False;
  cdsBuscaDados.Filtered := False;
  CdsBuscaDados.Filter := '';
  LimpaCombo(-1);
end;

end.
