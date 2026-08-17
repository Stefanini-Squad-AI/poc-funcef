unit fProcuraPessoaDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  StdCtrls, MontaSelect, Db, wwdblook, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, DBClient, uCMClientDataSet, uCtrlListTerceirosRH;

type
  TfrmProcuraPessoaDoc = class(TfrmSairAjuda)
    bbtnProcurar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    dblckTipoDoc: TwwDBLookupCombo;
    gbxTipoProcura: TRadioGroup;
    CdsTipoDoc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxTipoProcuraClick(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    MontaSelect: TMontaSelect;
  public
    sIdPessoa, sNomePessoa, TabelaSubTipo, FiltroSubTipo: string;
  end;

var
  frmProcuraPessoaDoc: TfrmProcuraPessoaDoc;

implementation

uses uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmProcuraPessoaDoc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocPessoa;
  dblckTipoDoc.LookUpValue := CdsTipoDoc.FieldByName('NOMEDOCUMENTO').asString;
end;

procedure TfrmProcuraPessoaDoc.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmProcuraPessoaDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  inherited; Para não destruir o Form agora
end;

procedure TfrmProcuraPessoaDoc.gbxTipoProcuraClick(Sender: TObject);
begin
  dblckTipoDoc.Visible := (gbxTipoProcura.ItemIndex = 0);
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
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Tabelas.Add('PESSOAFISICA');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Tabelas.Add('DOCPESSOA');

  if (TabelaSubTipo <> '') then
    MontaSelect.Tabelas.Add(TabelaSubTipo);

  MontaSelect.Colunas.Clear;
  MontaSelect.Colunas.Add('PESSOA.NOME');
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Colunas.Add('PESSOAFISICA.DATANASC');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Colunas.Add('DOCPESSOA.NUMDOCUMENTO');

  MontaSelect.Descricao.Clear;
  MontaSelect.Descricao.Add('Nome da Pessoa');
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Descricao.Add('Data de Nascimento');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Descricao.Add(dblckTipoDoc.Text);

  MontaSelect.Larguras.Clear;
  MontaSelect.Larguras.Add('50');
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Larguras.Add('10');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Larguras.Add('18');

  MontaSelect.Mascaras.Clear;
  MontaSelect.Mascaras.Add('');
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Mascaras.Add('');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Mascaras.Add(CdsTipoDoc.FieldByName('MASCARA').asString+';0;_');

  MontaSelect.SensivelACaixa.Clear;
  MontaSelect.SensivelACaixa.Add('N');
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.SensivelACaixa.Add('N');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.SensivelACaixa.Add('S');

  MontaSelect.TipodeDado.Clear;
  MontaSelect.TipodeDado.Add('C');
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.TipodeDado.Add('D');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.TipodeDado.Add('C');

  MontaSelect.Filtro.Clear;
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Filtro.Add('DOCPESSOA.IDDOCUMENTO = ' +CdsTipoDoc.FieldByName('IDDOCUMENTO').asString);
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'A') then
    MontaSelect.Filtro.Add('PESSOA.TIPO           = ' +QuotedStr(CdsTipoDoc.FieldByName('FISICAJURIDICA').asString));
  if (CdsTipoDoc.FieldByName('FISICAJURIDICA').asString <> 'J') then
    MontaSelect.Filtro.Add('PESSOAFISICA.IDPESSOA = PESSOA.IDPESSOA');
  if (gbxTipoProcura.ItemIndex = 0) then
    MontaSelect.Filtro.Add('PESSOA.IDPESSOA       = DOCPESSOA.IDPESSOA');

  if (FiltroSubTipo <> '') then
    MontaSelect.Filtro.Add(FiltroSubTipo);

  if (MontaSelect.Executar = mrOk) and (MontaSelect.RetornouValor) then
  begin
    ModalResult := mrOk;
    sIdPessoa := MontaSelect.ValoresChave[0];
    sNomePessoa := MontaSelect.ValoresChave[1];
  end
  else
  begin
    ModalResult := mrNone;
    sIdPessoa := '';
    sNomePessoa := '';
  end;

  if (MontaSelect <> nil) then
  begin
    MontaSelect.Free;
    MontaSelect := nil;
  end;
end;

end.
