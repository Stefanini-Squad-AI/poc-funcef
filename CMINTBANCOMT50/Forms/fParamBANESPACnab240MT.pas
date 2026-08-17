{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Banespa            }
{   BANESPA REMESSA                                     }
{   IDMODELOSCNAB = 55/R                                }
{                                                       }
{ Analista Responsável: Andre Tavares                   }
{ Atualizado Em: 06/10/2005                             }
{                                                       }
{*******************************************************}
            
unit fParamBANESPACnab240MT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Spin, TREdit, fcOutlookList,
  fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
  ImgList, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, Db,
  DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmParamBANESPACnab240MT = class(TfrmOkCancelar)
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
    rgTipo: TRadioGroup;
    ReNumConvenio: TEdit;
    sqlConvenio: TCMSqlParams;
    cdsConvenio: TCMClientDataSet;
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
  frmParamBANESPACnab240MT: TfrmParamBANESPACnab240MT;

implementation

Uses uCobBanespaCNAB240, uSistema, uIntBancoManager, uString;

{$R *.DFM}

procedure TfrmParamBANESPACnab240MT.bbtnConfirmarClick(Sender: TObject);
Var
  sMensagemAux : TMensagensCnab;
begin
  inherited;
  If DtCredito.Text = '' Then DtCredito.Date := Date;

  With IntBancoManager do
  Begin
    CobBANESPACnab240.NumConvenio        := Zd(ReNumConvenio.Text,15);
    CobBANESPACnab240.DataCredito        := RemoveBarras2(DtCredito.Text);
    CobBANESPACnab240.Carteira           := Copy(CmbCarteira.Text,1,1);
    CobBANESPACnab240.FormaCadTit        := Copy(RgFormaCad.Items[RgFormaCad.ItemIndex],1,1);
    CobBANESPACnab240.TipodeDocumento    := Copy(RgTipoDoc.Items[RgTipoDoc.ItemIndex],1,1);
    CobBANESPACnab240.IdentEmissao       := Copy(CmbEmissao.Text,1,1);
    CobBANESPACnab240.IdentDistrib       := Copy(RgDistribuicao.Items[RgDistribuicao.ItemIndex],1,1);
    CobBANESPACnab240.Aceite             := Copy(RgAceite.Items[RgAceite.ItemIndex],1,1);
    CobBANESPACnab240.CodJuros           := Copy(CmbCodJuros.Text,1,1);
    CobBANESPACnab240.CodDesconto        := Copy(CmbCodDesc.Text,1,1);
    CobBANESPACnab240.CodProtesto        := Copy(CmbProtesto.Text,1,1);
    CobBANESPACnab240.NumDiasProtesto    := Zd(SpNumDiasProtesto.Text,2);
    CobBANESPACnab240.CodDevolve         := Copy(CmbBaixaDevol.Text,1,1);
    CobBANESPACnab240.NumDiasBaixa       := Zd(SpNumDiasBaixa.Text,3);
    CobBANESPACnab240.NumContrato        := Zd(ReContrato.Text,10);
    CobBANESPACnab240.CodDesconto2       := FuncaoGeral.Decode(CmbCodDesc2.Text,'','0',Copy(CmbCodDesc2.Text,1,1));
    CobBANESPACnab240.DataDesconto2      := RemoveBarras2(DtDesc2.Text);
    CobBANESPACnab240.ValorDesconto2     := ZD(RemoveVirgulas(ReValDesc2.Value,2),15);
    CobBANESPACnab240.CodDesconto3       := FuncaoGeral.Decode(CmbCodDesc3.Text,'','0',Copy(CmbCodDesc3.Text,1,1));
    CobBANESPACnab240.DataDesconto3      := RemoveBarras2(DtDesc3.Text);
    CobBANESPACnab240.ValorDesconto3     := ZD(RemoveVirgulas(ReValDesc3.Value,2),15);
    CobBANESPACnab240.CodMulta           := FuncaoGeral.Decode(CmbMulta.Text,'','0',Copy(CmbMulta.Text,1,1));
    CobBANESPACnab240.DataMulta          := RemoveBarras2(DtMulta.Text);
    CobBANESPACnab240.ValorMulta         := ZD(RemoveVirgulas(ReValMulta.Value,2),15);;
    CobBANESPACnab240.TipoImpressao      := Copy(CmbTipoImpressao.Text,1,1);
    CobBANESPACnab240.NumLInhaImpressao  := ZD(SpeNumLinhas.Text,2);
    CobBANESPACnab240.MensagemImpressao  := AE(EdtMesnCnab.Text,140);
    CobBANESPACnab240.Tipocaracter       := FuncaoGeral.Decode(cmbTipChar.Text,'','00',Copy(cmbTipChar.Text,1,2));
    CobBANESPACnab240.EspecieTitulo      := Copy(CmEspecie.Text,1,2);
    sMensagemAux[0]              := AE(EdtMens1.Text,40);
    sMensagemAux[1]              := AE(EdtMens2.Text,40);
    sMensagemAux[2]              := AE(EdtMens3.Text,40);
    sMensagemAux[3]              := AE(EdtMens4.Text,40);
    CobBANESPACnab240.MensagensCnab      := sMensagemAux;
    CobBANESPACnab240.MensagemImpressao  := AE(EdtMesnCnab.Text,140);
    CobBANESPACnab240.CarteiraConvenio   := AE(' ',2);
    CobBANESPACnab240.VariacaoConvenio   := AE(' ',3);
    CobBANESPACnab240.TipoCobranca       := IntToStr(rgTipo.ItemIndex);

    GravaParamIntBanco(['NUMCONVENIO',
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
                         '  ',
                         '   ',
                         IntToStr(rgTipo.ItemIndex)])
  End;

  ModalResult:=mrOk;
end;

procedure TfrmParamBANESPACnab240MT.FormCreate(Sender: TObject);
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


  With IntBancoManager do
  Begin
   sqlConvenio.prepare;
   sqlConvenio.paramByName('codportforma').asInteger := IntBancoManager.CodigoPortadorForma;
   sqlConvenio.Open;
   ReNumConvenio.Text := cdsConvenio.fieldByName('NUMEMPRESABANCO').asString;
//   ReNumConvenio.Text           := BuscaParamIntBanco('NUMCONVENIO','N');
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
   rgTipo.ItemIndex             := strToIntDef(BuscaParamIntBanco('TIPOCOBRANCA','N'), -1);

//   mskCartNum.Text              := BuscaParamIntBanco('CARTCONVENIO','S');
//   mskVariacao.Text             := BuscaParamIntBanco('VARCONVENIO','S');
  End;
End;

procedure TfrmParamBANESPACnab240MT.CmbTipoImpressaoChange(Sender: TObject);
begin
  inherited;
  Case CmbTipoImpressao.ItemIndex of
  0: SpeNumLinhas.MaxValue := 36;
  1: SpeNumLinhas.MaxValue := 24;
  End;
end;

procedure TfrmParamBANESPACnab240MT.fcListPrametrosItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  NtbCnab.PageIndex := Item.Index;
end;

end.
