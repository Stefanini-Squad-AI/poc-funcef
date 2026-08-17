unit FRegistraOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit,
  Db, DBTables, Wwquery, TREdit, wwdblook, Spin, Wwtable, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  MontaSelect, DBCtrls;

type
  TfrmRegistraOcorr = class(TfrmOkCancelar)
    dblcTipo: TwwDBLookupCombo;
    Label5: TLabel;
    redLicenca: TRealEdit;
    Label4: TLabel;
    wwDBEdit1: TwwDBEdit;
    qryTipoOcorr: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    gbxDatas: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    dtedDataIni: TCMDateTimePicker;
    dtedDataFim: TCMDateTimePicker;
    gbxExaminador: TGroupBox;
    bbtnProcMedico: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    edCID: TEdit;
    bbtnBuscaCID: TBitBtn;
    MontaSelectCID: TMontaSelect;
    redAvaliacao: TRealEdit;
    edAvaliador: TEdit;
    edCODCID: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcMedicoClick(Sender: TObject);
    procedure bbtnBuscaCIDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sIdExaminador : String;
  public
    { Public declarations }
  end;

var
  frmRegistraOcorr: TfrmRegistraOcorr;

implementation

uses FCadFunc, USistema, uMensErro, fProcuraPessoaDoc, dBaseDados, uDataBase,
     uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmRegistraOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);

  redLicenca.Value := 0;
  sIdExaminador := '';

  if (dtedDataIni.Text <> '') and (dtedDataFim.Text <> '') then
     redLicenca.Value := dtedDataFim.Date - dtedDataIni.Date;

  if not qryTipoOcorr.Active then qryTipoOcorr.Open;
end;

procedure TfrmRegistraOcorr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frmProcuraPessoaDoc);
  inherited;
end;

procedure TfrmRegistraOcorr.bbtnConfirmarClick(Sender: TObject);
var
  iNumSeq : Integer;
  sSql    : String;
begin
  inherited;
  if (dblcTipo.Text = '')  then
  begin
    MsgDlg('Informe o Tipo de Ocorrência.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcTipo.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  sSql := 'SELECT NUMSEQ FROM HSTASMED ';
  sSql := sSql + ' WHERE IDPESSOA = ' + frmCadFunc.qry.FieldByName('IDPESSOA').AsString;
  sSql := sSql + ' AND CODTIPOOCMED = ' + qryTipoOcorr.FieldByName('CODTIPOOCMED').AsString;
  sSql := sSql + ' AND TO_CHAR(DATAREAL,''DD/MM/YYYY'') = ' + QuotedStr(dtedDataIni.Text);
  if FazQuery(dtmBaseDados.qry, sSql) then
  begin
    MsgDlg('Já existe esse Tipo de Ocorrência nessa data.' + CR_LF +
           'Verifique no módulo Medicina do Trabalho.',
           'Aviso', mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;

  sSql := 'SELECT MAX(NUMSEQ) AS NUMSEQ FROM HSTASMED ';
  sSql := sSql + ' WHERE IDPESSOA = ' + frmCadFunc.qry.FieldByName('IDPESSOA').AsString;
  sSql := sSql + ' AND CODTIPOOCMED = ' + qryTipoOcorr.FieldByName('CODTIPOOCMED').AsString;

  dtmBaseDados.qry.Sql.Clear;
  dtmBaseDados.qry.Sql.Add(sSql);
  dtmBaseDados.qry.Open;
  iNumSeq := dtmBaseDados.qry.FieldByName('NUMSEQ').AsInteger + 1;

  dtmBaseDados.qry.Sql.Clear;
  sSql := 'INSERT INTO HSTASMED (IDPESSOA,CODTIPOOCMED,NUMSEQ,DATAREAL, ';
  sSql := sSql + 'EXAMINADOR,CODCID,AVALIACAO,LICENCA,IDEXAMINADOR) ';
  sSql := sSql + 'VALUES(' + frmCadFunc.qry.FieldByName('IDPESSOA').AsString;
  sSql := sSql + ',' + qryTipoOcorr.FieldByName('CODTIPOOCMED').AsString;
  sSql := sSql + ',' + IntToStr(iNumSeq);
  sSql := sSql + ',TO_DATE('+ QuotedStr(dtedDataIni.Text) + ',''DD/MM/YYYY'')';
  sSql := sSql + ',' + QuotedStr(trim(edAvaliador.Text));
  sSql := sSql + ',' + iff(edCODCID.Text = '', 'NULL', QuotedStr(edCODCID.Text));
  sSql := sSql + ',' + FloatToStr(redAvaliacao.Value);
  sSql := sSql + ',' + FloatToStr(redLicenca.Value);
  sSql := sSql + ',' + iff(sIdExaminador = '', 'NULL', sIdExaminador);
  sSql := sSql + ')';

  dtmBaseDados.qry.Sql.Add(sSql);
  dtmBaseDados.qry.ExecSql;

end;

procedure TfrmRegistraOcorr.bbtnProcMedicoClick(Sender: TObject);
begin
  inherited;
  if (frmProcuraPessoaDoc.ShowModal = mrOk) then
  begin
     sIdExaminador    := frmProcuraPessoaDoc.sIDPessoa;
     edAvaliador.Text := frmProcuraPessoaDoc.sNomePessoa;
  end;

end;

procedure TfrmRegistraOcorr.bbtnBuscaCIDClick(Sender: TObject);
begin
  inherited;
  MontaSelectCID.Executar;
  if (MontaSelectCID.ValoresChave.Count > 0) and (MontaSelectCID.ValoresChave[0] <> '') then
  begin
     edCODCID.Text := MontaSelectCID.ValoresChave[0];
     edCID.Text    := MontaSelectCID.ValoresChave[1];
  end;
end;

end.
