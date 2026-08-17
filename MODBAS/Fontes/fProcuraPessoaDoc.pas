unit fProcuraPessoaDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, MontaSelect, Db, DBTables, Wwquery, wwdblook,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls;

type
  TfrmProcuraPessoaDoc = class(TfrmSairAjuda)
    bbtnProcurar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    dsTipoDoc: TwwDataSource;
    dblckcmbTipoDoc: TwwDBLookupCombo;
    qryTipoDoc: TwwQuery;
    gbxTipoProcura: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxTipoProcuraClick(Sender: TObject);
  private
    MontaSelect: TMontaSelect;
  public
    sIDPessoa, sNomePessoa: string;
  end;

var
  frmProcuraPessoaDoc: TfrmProcuraPessoaDoc;

implementation

{$R *.DFM}

procedure TfrmProcuraPessoaDoc.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipoDoc.Open;
  dblckcmbTipoDoc.LookUpValue := qryTipoDoc.FieldByName('NOMEDOCUMENTO').asString;
end;

procedure TfrmProcuraPessoaDoc.FormDestroy(Sender: TObject);
begin
  qryTipoDoc.Close;
  inherited;
end;

procedure TfrmProcuraPessoaDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  inherited; Para não destruir o Form agora
end;

procedure TfrmProcuraPessoaDoc.gbxTipoProcuraClick(Sender: TObject);
begin
  dblckcmbTipoDoc.Visible := gbxTipoProcura.ItemIndex = 0;
end;

procedure TfrmProcuraPessoaDoc.bbtnProcurarClick(Sender: TObject);
begin
  if (MontaSelect <> nil) then
  begin
    MontaSelect.Free;
    MontaSelect := nil;
  end;

  MontaSelect := TMontaSelect.Create(Self);
  MontaSelect.Caption := 'Seleciona Pessoa por Documento';
  MontaSelect.DataBaseName := 'BaseDados';

  MontaSelect.CamposChave.Clear;
  MontaSelect.CamposChave.Add('PESSOA.IDPESSOA');
  MontaSelect.CamposChave.Add('PESSOA.NOME');

  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PESSOA');
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Tabelas.Add('PESSOAFISICA');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Tabelas.Add('DOCPESSOA');

  MontaSelect.Colunas.Clear;
  MontaSelect.Colunas.Add('PESSOA.NOME');
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Colunas.Add('PESSOAFISICA.DATANASC');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Colunas.Add('DOCPESSOA.NUMDOCUMENTO');

  MontaSelect.Descricao.Clear;
  MontaSelect.Descricao.Add('Nome da Pessoa');
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Descricao.Add('Data de Nascimento');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Descricao.Add(dblckcmbTipoDoc.Text);

  MontaSelect.Larguras.Clear;
  MontaSelect.Larguras.Add('50');
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Larguras.Add('10');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Larguras.Add('18');

  MontaSelect.Mascaras.Clear;
  MontaSelect.Mascaras.Add('');
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Mascaras.Add('');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Mascaras.Add(qryTipoDoc.FieldByName('MASCARA').asString+';0;_');

  MontaSelect.SensivelACaixa.Clear;
  MontaSelect.SensivelACaixa.Add('N');
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.SensivelACaixa.Add('N');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.SensivelACaixa.Add('S');

  MontaSelect.TipodeDado.Clear;
  MontaSelect.TipodeDado.Add('C');
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.TipodeDado.Add('D');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.TipodeDado.Add('C');

  MontaSelect.Filtro.Clear;
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Filtro.Add('DOCPESSOA.IDDOCUMENTO = ' +qryTipoDoc.FieldByName('IDDOCUMENTO').asString);
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'A') then
    MontaSelect.Filtro.Add('PESSOA.TIPO           = ' +QuotedStr(qryTipoDoc.FieldByName('FISICAJURIDICA').asString));
  if (qryTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Filtro.Add('PESSOAFISICA.IDPESSOA = PESSOA.IDPESSOA');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Filtro.Add('PESSOA.IDPESSOA       = DOCPESSOA.IDPESSOA');

  if (MontaSelect.Executar = mrOk) and (MontaSelect.RetornouValor) then
  begin
    ModalResult := mrOk;
    sIDPessoa   := MontaSelect.ValoresChave[0];
    sNomePessoa := MontaSelect.ValoresChave[1];
  end
  else
  begin
    ModalResult := mrNone;
    sIDPessoa   := '';
    sNomePessoa := '';
  end;

  if (MontaSelect <> nil) then
  begin
    MontaSelect.Free;
    MontaSelect := nil;
  end;
end;

end.
