{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES ------------------------------------
--------------------------------------------------------------------------------
N. Solicitação: WO 3524
Dt Alteração..: 25/10/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Adequação na funcionalidade de alteração de dados de NF,
                permitindo corrigir o tipo da Nota Fiscal e o serviço atrelado.
--------------------------------------------------------------------------------
}
unit FAtualizaNFS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, TREdit,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ImgList, MontaSelect, DBCtrls, Mask, wwdbedit, Db, DBClient,
  uCMClientDataSet, uCtrlLancDocCapCar, uCtrlPadroes, uCtrlDocumento,
  uCtrlParamIntegra, uSistema, CMProcura, Wwdatsrc;

type
  TfrmAtualizaNFS = class(TfrmOkCancelar)
    pnlSelDoc: TPanel;
    pnlDadosDoc: TPanel;
    lblNumNotaFiscal: TLabel;
    lblNumSerie: TLabel;
    lblValorBruto: TLabel;
    edtValorBruto: TRealEdit;
    lblDataEmissao: TLabel;
    dtpNFSDataEmissao: TCMDateTimePicker;
    lblDadosAdicionais: TLabel;
    grpGpDocumento: TGroupBox;
    lblSisOrigem: TLabel;
    lblFornCli: TLabel;
    lblDataProg: TLabel;
    lblDocCompl: TLabel;
    btnSelDoc: TBitBtn;
    MontaSelect: TMontaSelect;
    ilLista: TImageList;
    edtNumNotaFiscal: TEdit;
    edtNumSerie: TEdit;
    mmNFSObs: TMemo;
    cmProcListaServicos: TCMProcura;
    lblAtivProdServ: TLabel;
    msListaServico: TMontaSelect;
    rgTipoNF: TRadioGroup;
    ds: TwwDataSource;
    cds: TCMClientDataSet;
    chkSimples: TCheckBox;
    procedure btnSelDocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure edtNumNotaFiscalChange(Sender: TObject);
    procedure cmProcListaServicosValidaDados(Sender: TObject);
    procedure rgTipoNFClick(Sender: TObject);
  private
    { Private declarations }
    CtrlLancDocCapCar : TCtrlLancDocCapCar;
    CtrlDocumento: TCtrlDocumento;
    fCodDocumento: Integer;
    _CodNaturezaREINF : Integer;
    _IdServico: Integer; 
    function VerificaCampoObrigatorios(var pMsgErro: string): Boolean;
    procedure LimpaCampos;
    procedure HabilitaCampos(pHabilita: Boolean);
  public
    { Public declarations }
  end;

var
  frmAtualizaNFS: TfrmAtualizaNFS;

implementation

{$R *.DFM}

procedure TfrmAtualizaNFS.btnSelDocClick(Sender: TObject);
begin
  inherited;

  if MontaSelect.Executar = MrOk then
  begin
    fCodDocumento := StrToInt(MontaSelect.ValoresChave[0]);

    //Cássio Rovaroto - SIG nº 88813 - Início
    if MontaSelect.ValoresChave[6] = EmptyStr then
      edtNumNotaFiscal.Text := MontaSelect.ValoresChave[1]
    else
      edtNumNotaFiscal.Text := MontaSelect.ValoresChave[6];
    //Cássio Rovaroto - SIG nº 88813 - Fim

    edtNumSerie.Text := MontaSelect.ValoresChave[7];
    edtValorBruto.Value := CtrlDocumento.GetValorBrutoDoc(fCodDocumento);
    mmNFSObs.Text := MontaSelect.ValoresChave[9];

    if MontaSelect.ValoresChave[8] <> EmptyStr then
      dtpNFSDataEmissao.Date := StrToDate(MontaSelect.ValoresChave[8])
    else
      dtpNFSDataEmissao.Date := CtrlDocumento.GetDataEmissaoDoc(fCodDocumento);

    rgTipoNF.Enabled := True;
    if MontaSelect.ValoresChave[10] <> EmptyStr then
    begin
      cds.Data := CtrlLancDocCapCar.GetDadosServico(MontaSelect.ValoresChave[10]);

      if not cds.IsEmpty then
      begin
        _IdServico := cds.FieldByName('NFSSERVICO').asInteger;
         msListaServico.RepeteConsulta := False;
         rgTipoNF.ItemIndex := 1;
      end
      else
        rgTipoNF.ItemIndex := 0;
      cds.Edit;
    end
    else
      rgTipoNF.ItemIndex := 0;

    if MontaSelect.ValoresChave[11] = 'S' then
      chkSimples.Checked := True
    else
      chkSimples.Checked := False;


    if ParamIntegra.RecPag = 'R' then
      LblFornCli.Caption := 'Cliente: ' + MontaSelect.ValoresChave[4]
    Else
      LblFornCli.Caption := 'Fornecedor: ' + MontaSelect.ValoresChave[4];

    LblDocCompl.Caption := 'Doc\Compl: ' + MontaSelect.ValoresChave[1] + ' ' + MontaSelect.ValoresChave[2];
    LblDataProg.Caption := 'Data Prog: ' + MontaSelect.ValoresChave[3];
    LblSisOrigem.Caption := 'Sistema de Origem: ' + MontaSelect.ValoresChave[5];

    HabilitaCampos(True);
  end;
end;

procedure TfrmAtualizaNFS.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlLancDocCapCar := TCtrlLancDocCapCar.Create();
  CtrlLancDocCapCar.InitializeAs(Padroes);

  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitializeAs(Padroes);

  MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag+'''');
  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = '+IntToStr(Sistema.IDEmpresa));

  _IdServico := -1;
  _CodNaturezaREINF := -1;

  HabilitaCampos(False);
end;

procedure TfrmAtualizaNFS.bbtnConfirmarClick(Sender: TObject);
var
  sMsg: String;
begin
  sMsg:= EmptyStr;

  if not VerificaCampoObrigatorios(sMsg) then
  begin
    MessageDlg('Necessário preenchimento: ' + sMsg, mtConfirmation, [mbOK], 0);
    Exit;
  end
  else
    if not CtrlLancDocCapCar.SetDadosNFS(fCodDocumento,
                                         edtNumNotaFiscal.Text,
                                         edtNumSerie.Text,
                                         mmNFSOBS.Text,
                                         dtpNFSDataEmissao.Text,
                                         _IdServico,
                                         chkSimples.Checked) then
    begin
      MessageDlg('Erro ao atualizar o documento.', mtInformation, [mbOK], 0);
      Exit;
    end
    else
    begin
      MessageDlg('Atualização realizada com sucesso.', mtInformation, [mbOK], 0);
      LimpaCampos;
      cds.Close;

      if MontaSelect.RetornouValor then
        MontaSelect.Cancela;
      btnSelDoc.SetFocus;
    end;
      
  inherited;
end;

function TfrmAtualizaNFS.VerificaCampoObrigatorios(
  var pMsgErro: string): Boolean;
begin
  Result := True;
  if edtNumNotaFiscal.Text = EmptyStr then
  begin
    pMsgErro := 'Necessário indicar o Número da Nota Fiscal.';
    edtNumNotaFiscal.SetFocus;
    Result := False;
    Exit;
  end;

  if dtpNFSDataEmissao.Text = EmptyStr then
  begin
    pMsgErro := 'Necessário indicar a Data de Emissão.';
    edtNumNotaFiscal.SetFocus;
    Result := False;
    Exit;
  end;

  if rgTipoNF.ItemIndex < 0 then
  begin
    pMsgErro := 'Defina o tipo da Nota Fiscal.';
    Result := False;
    Exit;
  end;

  if (rgTipoNF.ItemIndex = 1) and (_IdServico = -1) then
  begin
    pMsgErro := 'Defina o tipo de serviço relacionado à Nota Fiscal.';
    Result := False;
    Exit;
  end;

end;

procedure TfrmAtualizaNFS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  LimpaCampos;
  cds.Cancel;
  btnSelDoc.SetFocus;
end;

procedure TfrmAtualizaNFS.LimpaCampos;
begin
  edtNumNotaFiscal.Text := EmptyStr;
  edtNumSerie.Text := EmptyStr;
  edtValorBruto.Value := 0;
  dtpNFSDataEmissao.Text := EmptyStr;
  mmNFSObs.Text := EmptyStr;
  cmProcListaServicos.Text := EmptyStr;

  if ParamIntegra.RecPag ='R' then
    LblFornCli.caption  := 'Cliente:'
  else
    lblFornCli.Caption   := 'Fornecedor:';

  lblSisOrigem.Caption := 'Sistema de Origem:';
  lblDocCompl.Caption  := 'Doc\Compl:';
  lblDataProg.Caption  := 'Data Prog:';


  HabilitaCampos(False);
end;

procedure TfrmAtualizaNFS.HabilitaCampos(pHabilita: Boolean);
begin
    edtNumNotaFiscal.Enabled := pHabilita;
    edtNumSerie.Enabled := pHabilita;
    dtpNFSDataEmissao.Enabled := pHabilita;
    mmNFSObs.Enabled := pHabilita;
    bbtnConfirmar.Enabled := pHabilita;
    bbtnCancelar.Enabled := pHabilita;
    rgTipoNF.Enabled := pHabilita;
    cmProcListaServicos.Enabled := pHabilita;
    chkSimples.Enabled := pHabilita;
end;

procedure TfrmAtualizaNFS.bbtnSairClick(Sender: TObject);
begin
  if (edtNumNotaFiscal.Text <> EmptyStr) or
     (edtNumSerie.Text <> EmptyStr) or
     (dtpNFSDataEmissao.Text <> EmptyStr) or
     (mmNFSObs.Text <> EmptyStr) then
  begin
    if MessageDlg('Deseja realmente cancelar a atualização e sair?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end;
  inherited;
end;

procedure TfrmAtualizaNFS.edtNumNotaFiscalChange(Sender: TObject);
begin
  inherited;
  if (edtNumNotaFiscal.Text <> EmptyStr) or
     (edtNumSerie.Text <> EmptyStr) or
     (dtpNFSDataEmissao.Text <> EmptyStr) or
     (mmNFSObs.Text <> EmptyStr) then
    bbtnCancelar.Enabled := True
  else
    bbtnCancelar.Enabled := False;
end;

procedure TfrmAtualizaNFS.cmProcListaServicosValidaDados(Sender: TObject);
begin
  inherited;
  if msListaServico.RetornouValor then
  begin
    cds.FieldByName('NFSSERVICO').AsInteger := StrToInt(msListaServico.ValoresChave[0]);
    _IdServico:= StrToInt(msListaServico.ValoresChave[0]);
    _CodNaturezaREINF := StrToInt(msListaServico.ValoresChave[1]);
  end;
end;

procedure TfrmAtualizaNFS.rgTipoNFClick(Sender: TObject);
begin
  inherited;
  if (rgTipoNF.ItemIndex = 0) then
  begin
    cmProcListaServicos.Text := EmptyStr;
    _IdServico:= -1;
    _CodNaturezaREINF := -1;
    cmProcListaServicos.Enabled := False;
  end
  else
    cmProcListaServicos.Enabled := True;
end;

end.
