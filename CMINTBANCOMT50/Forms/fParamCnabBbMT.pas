{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Banco do Brasil    }
{   BANCO DO BRASIL REMESSA                             }
{   IDMODELOSCNAB = 7/R                                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit fParamCnabBbMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Spin, TREdit, fcOutlookList,
  fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
  ImgList, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask;

type
  TfrmParamCnabBbMT = class(TfrmOkCancelar)
    fcObParametros: TfcOutlookBar;
    fcListPrametros: TfcOutlookList;
    fcObParametrosfcShapeBtn1: TfcShapeBtn;
    ImgCnab: TImageList;
    NtbCnab: TNotebook;
    Label1: TLabel;
    DtCredito: TCMDateTimePicker;
    Label2: TLabel;
    CmbCarteira: TComboBox;
    RgFormaCad: TRadioGroup;
    RgTipoDoc: TRadioGroup;
    RgDistribuicao: TRadioGroup;
    Label3: TLabel;
    CmbEmissao: TComboBox;
    RgAceite: TRadioGroup;
    Label6: TLabel;
    CmbProtesto: TComboBox;
    SpNumDiasProtesto: TSpinEdit;
    Label7: TLabel;
    Label8: TLabel;
    CmbBaixaDevol: TComboBox;
    SpNumDiasBaixa: TSpinEdit;
    Label9: TLabel;
    Label10: TLabel;
    ReContrato: TRealEdit;
    Label11: TLabel;
    CmbCodDesc2: TComboBox;
    LblCodDesc3: TLabel;
    CmbCodDesc3: TComboBox;
    Label13: TLabel;
    CmbMulta: TComboBox;
    Label14: TLabel;
    Label12: TLabel;
    DtDesc2: TCMDateTimePicker;
    ReValDesc2: TRealEdit;
    Label15: TLabel;
    Label16: TLabel;
    DtDesc3: TCMDateTimePicker;
    Label17: TLabel;
    ReValDesc3: TRealEdit;
    Label18: TLabel;
    DtMulta: TCMDateTimePicker;
    Label19: TLabel;
    ReValMulta: TRealEdit;
    Label20: TLabel;
    CmbTipoImpressao: TComboBox;
    Label21: TLabel;
    SpeNumLinhas: TSpinEdit;
    Label22: TLabel;
    cmbTipChar: TComboBox;
    Label23: TLabel;
    EdtMesnCnab: TEdit;
    EdtMens3: TEdit;
    EdtMens4: TEdit;
    Label24: TLabel;
    Label26: TLabel;
    Label4: TLabel;
    CmbCodJuros: TComboBox;
    Label5: TLabel;
    CmbCodDesc: TComboBox;
    EdtMens1: TEdit;
    Label25: TLabel;
    Label27: TLabel;
    EdtMens2: TEdit;
    Label28: TLabel;
    Bevel1: TBevel;
    Label29: TLabel;
    CmEspecie: TComboBox;
    Label30: TLabel;
    mskCartNum: TMaskEdit;
    Label31: TLabel;
    Label32: TLabel;
    mskVariacao: TEdit;
    rgTipo: TRadioGroup;
    ReNumConvenio: TRealEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmbTipoImpressaoChange(Sender: TObject);
    procedure fcListPrametrosItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCnabBbMT: TfrmParamCnabBbMT;

implementation

Uses uCnabBbMT, uSistema, uString, uIntBancoManager;

{$R *.DFM}

procedure TfrmParamCnabBbMT.bbtnConfirmarClick(Sender: TObject);
Var
  sMensagemAux : TMensagensCnab;
begin
  inherited;
  If DtCredito.Text = '' Then DtCredito.Date := Date;

  CnabBb.NumConvenio        := Zd(ReNumConvenio.Text,9);
  CnabBb.DataCredito        := RemoveBarras2(DtCredito.Text);
  CnabBb.Carteira           := Copy(CmbCarteira.Text,1,1);
  CnabBb.FormaCadTit        := Copy(RgFormaCad.Items[RgFormaCad.ItemIndex],1,1);
  CnabBb.TipodeDocumento    := Copy(RgTipoDoc.Items[RgTipoDoc.ItemIndex],1,1);
  CnabBb.IdentEmissao       := Copy(CmbEmissao.Text,1,1);
  CnabBb.IdentDistrib       := Copy(RgDistribuicao.Items[RgDistribuicao.ItemIndex],1,1);
  CnabBb.Aceite             := Copy(RgAceite.Items[RgAceite.ItemIndex],1,1);
  CnabBb.CodJuros           := Copy(CmbCodJuros.Text,1,1);
  CnabBb.CodDesconto        := Copy(CmbCodDesc.Text,1,1);
  CnabBb.CodProtesto        := Copy(CmbProtesto.Text,1,1);
  CnabBb.NumDiasProtesto    := Zd(SpNumDiasProtesto.Text,2);
  CnabBb.CodDevolve         := Copy(CmbBaixaDevol.Text,1,1);
  CnabBb.NumDiasBaixa       := Zd(SpNumDiasBaixa.Text,3);
  CnabBb.NumContrato        := Zd(ReContrato.Text,10);
  CnabBb.CodDesconto2       := FuncaoGeral.Decode(CmbCodDesc2.Text,'','0',Copy(CmbCodDesc2.Text,1,1));
  CnabBb.DataDesconto2      := RemoveBarras2(DtDesc2.Text);
  CnabBb.ValorDesconto2     := ZD(RemoveVirgulas(ReValDesc2.Value,2),15);
  CnabBb.CodDesconto3       := FuncaoGeral.Decode(CmbCodDesc3.Text,'','0',Copy(CmbCodDesc3.Text,1,1));
  CnabBb.DataDesconto3      := RemoveBarras2(DtDesc3.Text);
  CnabBb.ValorDesconto3     := ZD(RemoveVirgulas(ReValDesc3.Value,2),15);
  CnabBb.CodMulta           := FuncaoGeral.Decode(CmbMulta.Text,'','0',Copy(CmbMulta.Text,1,1));
  CnabBb.DataMulta          := RemoveBarras2(DtMulta.Text);
  CnabBb.ValorMulta         := ZD(RemoveVirgulas(ReValMulta.Value,2),15);;
  CnabBb.TipoImpressao      := Copy(CmbTipoImpressao.Text,1,1);
  CnabBb.NumLInhaImpressao  := ZD(SpeNumLinhas.Text,2);
  CnabBb.MensagemImpressao  := AE(EdtMesnCnab.Text,140);
  CnabBb.Tipocaracter       := FuncaoGeral.Decode(cmbTipChar.Text,'','00',Copy(cmbTipChar.Text,1,2));
  CnabBb.EspecieTitulo      := Copy(CmEspecie.Text,1,2);
  sMensagemAux[0]           := AE(EdtMens1.Text,40);
  sMensagemAux[1]           := AE(EdtMens2.Text,40);
  sMensagemAux[2]           := AE(EdtMens3.Text,40);
  sMensagemAux[3]           := AE(EdtMens4.Text,40);
  CnabBb.MensagensCnab      := sMensagemAux;
  CnabBb.MensagemImpressao  := AE(EdtMesnCnab.Text,140);
  CnabBb.CarteiraConvenio   := AE(mskCartNum.Text,2);
  CnabBb.VariacaoConvenio   := AE(mskVariacao.Text,3);
  CnabBb.TipoCobranca       := IntToStr(rgTipo.ItemIndex);

  if not IntBancoManager.GravaParamIntBanco(['NUMCONVENIO',
                                             'DATACREDITO',
                                             'CARTEIRA',
                                             'FORMACADTIT',
                                             'TIPODEDOCUMENTO',
                                             'IDENTEMISSAO',
                                             'IDENTDISTRIB',
                                             'ACEITE',
                                             'CODJUROS',
                                             'CODDESCONTO',
                                             'CODPROTESTO',
                                             'NUMDIASPROTESTO',
                                             'CODDEVOLVE',
                                             'NUMDIASBAIXA',
                                             'NUMCONTRATO',
                                             'CODDESCONTO2',
                                             'DATADESCONTO2',
                                             'VALORDESCONTO2',
                                             'CODDESCONTO3',
                                             'DATADESCONTO3',
                                             'VALORDESCONTO3',
                                             'CODMULTA',
                                             'DATAMULTA',
                                             'VALORMULTA',
                                             'TIPOIMPRESSAO',
                                             'NUMLINHAIMPRESSAO',
                                             'MENSAGEMIMPRESSAO',
                                             'TIPOCARACTER',
                                             'ESPECIETITULO',
                                             'MENSAGEM1',
                                             'MENSAGEM2',
                                             'MENSAGEM3',
                                             'MENSAGEM4',
                                             'CARTCONVENIO',
                                             'VARCONVENIO',
                                             'TIPOCOBRANCA'],
                                             [ReNumConvenio.Text,
                                              dtCredito.Text,
                                              IntToStr(CmbCarteira.ItemIndex),
                                              IntToStr(rgFormaCad.ItemIndex),
                                              IntToStr(rgTipoDoc.ItemIndex),
                                              IntToStr(CmbEmissao.ItemIndex),
                                              IntToStr(RgDistribuicao.ItemIndex),
                                              IntToStr(RgAceite.ItemIndex),
                                              IntToStr(CmbCodJuros.ItemIndex),
                                              IntToStr(CmbCodDesc.ItemIndex),
                                              IntToStr(CmbProtesto.ItemIndex),
                                              SpNumDiasProtesto.Text,
                                              IntToStr(CmbBaixaDevol.ItemIndex),
                                              SpNumDiasBaixa.Text,
                                              ReContrato.Text,
                                              IntToStr(CmbCodDesc2.ItemIndex),
                                              DtDesc2.Text,
                                              ReValDesc2.Text,
                                              IntToStr(CmbCodDesc3.ItemIndex),
                                              DtDesc3.Text,
                                              ReValDesc3.Text,
                                              IntToStr(CmbMulta.ItemIndex),
                                              DtMulta.Text,
                                              ReValMulta.Text,
                                              IntToStr(CmbTipoImpressao.ItemIndex),
                                              SpeNumLinhas.Text,
                                              EdtMesnCnab.Text,
                                              IntToStr(cmbTipChar.ItemIndex),
                                              IntToStr(CmEspecie.ItemIndex),
                                              EdtMens1.Text,
                                              EdtMens2.Text,
                                              EdtMens3.Text,
                                              EdtMens4.Text,
                                              mskCARTNum.Text,
                                              mskVariacao.Text,
                                              IntToStr(rgTipo.ItemIndex)]) then
        raise Exception.Create(IntBancoManager.MessageInfo);

  ModalResult := mrOk;
end;

procedure TfrmParamCnabBbMT.FormCreate(Sender: TObject);
begin
  inherited;
  DtCredito.Date             := Date;
  CmbCarteira.ItemIndex      := 0;
  CmbEmissao.ItemIndex       := 0;
  CmbCodDesc.ItemIndex       := 0;
  CmbCodJuros.ItemIndex      := 0;
  CmbProtesto.ItemIndex      := 0;
  CmbBaixaDevol.ItemIndex    := 0;
  CmbTipoImpressao.ItemIndex := 0;
  CmEspecie.ItemIndex        := 0;

  with IntBancoManager do
  begin
     ReNumConvenio.Text           := BuscaParamIntBanco('NUMCONVENIO','N');
     dtCredito.Date               := StrToDate(BuscaParamIntBanco('DATACREDITO','D'));
     CmbCarteira.ItemIndex        := StrToInt(BuscaParamIntBanco('CARTEIRA','N'));
     rgFormaCad.ItemIndex         := StrToInt(BuscaParamIntBanco('FORMACADTIT','N'));
     rgTipoDoc.ItemIndex          := StrToInt(BuscaParamIntBanco('TIPODEDOCUMENTO','N'));
     CmbEmissao.ItemIndex         := StrToInt(BuscaParamIntBanco('IDENTEMISSAO','N'));
     RgDistribuicao.ItemIndex     := StrToInt(BuscaParamIntBanco('IDENTDISTRIB','N'));
     RgAceite.ItemIndex           := StrToInt(BuscaParamIntBanco('ACEITE','N'));
     CmbCodJuros.ItemIndex        := StrToInt(BuscaParamIntBanco('CODJUROS','N'));
     CmbCodDesc.ItemIndex         := StrToInt(BuscaParamIntBanco('CODDESCONTO','N'));
     CmbProtesto.ItemIndex        := StrToInt(BuscaParamIntBanco('CODPROTESTO','N'));
     SpNumDiasProtesto.Value      := StrToInt(BuscaParamIntBanco('NUMDIASPROTESTO','N'));
     CmbBaixaDevol.ItemIndex      := StrToInt(BuscaParamIntBanco('CODDEVOLVE','N'));
     SpNumDiasBaixa.Value         := StrToInt(BuscaParamIntBanco('NUMDIASBAIXA','N'));
     ReContrato.Text              := BuscaParamIntBanco('NUMCONTRATO','N');
     CmbCodDesc2.ItemIndex        := StrToInt(BuscaParamIntBanco('CODDESCONTO2','N'));
     DtDesc2.Date                 := StrToDate(BuscaParamIntBanco('DATADESCONTO2','D'));
     ReValDesc2.Text              := BuscaParamIntBanco('VALORDESCONTO2','N');
     CmbCodDesc3.ItemIndex        := StrToInt(BuscaParamIntBanco('CODDESCONTO3','N'));
     DtDesc3.Date                 := StrToDate(BuscaParamIntBanco('DATADESCONTO3','D'));
     ReValDesc3.Text              := BuscaParamIntBanco('VALORDESCONTO3','N');
     CmbMulta.ItemIndex           := StrToInt(BuscaParamIntBanco('CODMULTA','N'));
     DtMulta.Date                 := StrToDate(BuscaParamIntBanco('DATAMULTA','D'));
     ReValMulta.Text              := BuscaParamIntBanco('VALORMULTA','N');
     CmbTipoImpressao.ItemIndex   := StrToInt(BuscaParamIntBanco('TIPOIMPRESSAO','N'));
     SpeNumLinhas.value           := StrToInt(BuscaParamIntBanco('NUMLINHAIMPRESSAO','N'));
     EdtMesnCnab.Text             := BuscaParamIntBanco('MENSAGEMIMPRESSAO','S');
     cmbTipChar.ItemIndex         := StrToInt(BuscaParamIntBanco('TIPOCARACTER','N'));
     CmEspecie.ItemIndex          := StrToInt(BuscaParamIntBanco('ESPECIETITULO','N'));
     EdtMens1.Text                := BuscaParamIntBanco('MENSAGEM1','S');
     EdtMens2.Text                := BuscaParamIntBanco('MENSAGEM2','S');
     EdtMens3.Text                := BuscaParamIntBanco('MENSAGEM3','S');
     EdtMens4.Text                := BuscaParamIntBanco('MENSAGEM4','S');
     mskCartNum.Text              := BuscaParamIntBanco('CARTCONVENIO','S');
     mskVariacao.Text             := BuscaParamIntBanco('VARCONVENIO','S');
  end;
End;

procedure TfrmParamCnabBbMT.CmbTipoImpressaoChange(Sender: TObject);
begin
  inherited;
  Case CmbTipoImpressao.ItemIndex of
  0: SpeNumLinhas.MaxValue := 36;
  1: SpeNumLinhas.MaxValue := 24;
  End;
end;

procedure TfrmParamCnabBbMT.fcListPrametrosItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  NtbCnab.PageIndex := Item.Index;
end;

end.









