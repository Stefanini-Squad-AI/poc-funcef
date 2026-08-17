unit fCadRateio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS,
  StdCtrls, TREdit, ExtCtrls, DBCtrls, Wwdbspin, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, Mask, wwdbedit, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, TB97,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls;

type
  TfrmCadRateio = class(TfrmCadastroCS)
    qryEntid: TwwQuery;
    pnlFundoEstab: TPanel;
    Label12: TLabel;
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    dblcEntid: TwwDBLookupCombo;
    Label2: TLabel;
    dbedDataBase: TCMDateTimePicker;
    Label3: TLabel;
    dbspeAno: TwwDBSpinEdit;
    dbrgTipoRateio: TDBRadioGroup;
    Label10: TLabel;
    Label11: TLabel;
    Shape1: TShape;
    pnlData: TPanel;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedPerc1: TDBRealEdit;
    dbedPerc2: TDBRealEdit;
    pnlValor: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbedPerc1V: TDBRealEdit;
    dbedPerc2V: TDBRealEdit;
    dbedVal1: TDBRealEdit;
    dbedVal2: TDBRealEdit;
    dbedVal3: TDBRealEdit;
    dbedVal4: TDBRealEdit;
    dbedPerc3V: TDBRealEdit;
    dbedPerc4V: TDBRealEdit;
    dbedVal5: TDBRealEdit;
    dbedPerc5V: TDBRealEdit;
    dsEstab: TwwDataSource;
    qryEstab: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbrgTipoRateioChange(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AtualizaDados(ID: string);
  end;

var
  frmCadRateio: TfrmCadRateio;

implementation

uses uMensErro, uSistema;

{$R *.DFM}

procedure TfrmCadRateio.FormCreate(Sender: TObject);
begin
  inherited;
  qryEntid.Open;
  AtualizaDados('-1');
end;

procedure TfrmCadRateio.FormShow(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := false;
end;

procedure TfrmCadRateio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    AtualizaDados(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadRateio.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := (qry.IsEmpty) or (qry.State = dsInsert);
end;

procedure TfrmCadRateio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDFILIALPESSOA').asString := qryEstab.FieldByName('IDPESSOA').asString;
  qry.FieldByName('TIPORATEIO').asInteger    := 0;
  qry.FieldByName('PERIODO').asInteger       := 60;
  dbrgTipoRateio.ItemIndex := 0;
end;

procedure TfrmCadRateio.dsStateChange(Sender: TObject);
begin
  inherited;
  if (ds.State in [dsInsert,dsEdit]) then
    dblcEntid.SetFocus;
end;

procedure TfrmCadRateio.dbrgTipoRateioChange(Sender: TObject);
begin
  if (dbrgTipoRateio.ItemIndex = 1) then
    pnlValor.BringToFront
  else
    pnlData.BringToFront;
end;

procedure TfrmCadRateio.bbtnConfirmarClick(Sender: TObject);
var
  Inserindo: boolean;
begin
  if (Trim(dbedDataBase.Text) = '') then
  begin
    MsgDlg('Informe a Data de Cisão ou Incorporação','Aviso',mtInformation,[mbOK],0);
    dbedDataBase.SetFocus;
    exit;
  end;
  Inserindo := (qry.State = dsInsert);
  inherited;
  if (Inserindo) then
  begin
    qry.Close;
    qry.ParamByName('IDPESSOA').asString := qryEstab.FieldByName('IDPESSOA').asString;
    qry.Open;
    bbtnCancelarClick(Sender);
  end;
end;

procedure TfrmCadRateio.AtualizaDados(ID: string);
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').asString := ID;
  qry.Open;

  qryEstab.Close;
  qryEstab.ParamByName('IDPESSOA').asString := ID;
  qryEstab.Open;
end;

end.
