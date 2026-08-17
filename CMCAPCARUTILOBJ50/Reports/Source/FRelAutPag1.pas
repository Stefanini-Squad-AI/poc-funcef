{******************************************************************************}
{  Sistema - Contas a Receber                                                    }
{                                                 }
{******************************************************************************

  N. Sol..........: 178983
  N. Kintana......: 1656753
  Data............: 20/07/2012
  Responsável.....: Douglas.Siqueira
  Descrição.......: criação do relatório Aviso de Recebimento - AR
}

Unit FRelAutPag1;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Mask, wwdbedit,
  MontaSelect, Db, DBTables, Wwquery, wwdblook, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, uCMTypes, fParamReports_Padrao,
  CmParamReport, uCtrlParamIntegra, uCmSqlParams, DBClient,
  uCMClientDataSet;

Type
  TFrmRelAutPag1 = Class(TfrmParamReports_Padrao)
    msDoc: TMontaSelect;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lblCentroRespon: TLabel;
    Label1: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    DateEdit1: TCMDateTimePicker;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Label2: TLabel;
    bbtnSeleciona: TBitBtn;
    MemDocs: TMemo;
    CdsCentroRespon: TCMClientDataSet;
    SqlCentroRespon: TCMSqlParams;
    CdsUpd: TCMClientDataSet;
    SqlUpd: TCMSqlParams;
    Procedure bbtnSelecionaClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    doc: String;
  End;

Var
  FrmRelAutPag1: TFrmRelAutPag1;

Implementation

Uses
  udatabase, usistema, DBaseDados, umenserro, uString, DRelatGerencial_AR;

{$R *.DFM}

Procedure TFrmRelAutPag1.bbtnSelecionaClick(Sender: TObject);
Begin
  Inherited;
  If (msDoc.Executar = MrOk) Then
  Begin
    doc := MsDoc.ValoresChave[0];
    MemDocs.Lines.Add(' Nº Ap: ............ ' + MsDoc.ValoresChave[9]);
    MemDocs.Lines.Add(' Nº Documento: ..... ' + MsDoc.ValoresChave[7]);
    MemDocs.Lines.Add(' Complemento: ...... ' + MsDoc.ValoresChave[1]);
    MemDocs.Lines.Add(' Data Vencimento: .. ' + MsDoc.ValoresChave[2]);
    MemDocs.Lines.Add(' Data Programada: .. ' + MsDoc.ValoresChave[3]);
    MemDocs.Lines.Add(' Operacao: ......... ' + MsDoc.ValoresChave[4]);
    MemDocs.Lines.Add(' Data Emissão: ..... ' + MsDoc.ValoresChave[5]);
    MemDocs.Lines.Add(' Valor: ............ ' + MsDoc.ValoresChave[6]);
    MemDocs.Lines.Add(' Razao Social: ..... ' + MsDoc.ValoresChave[8]);
  End;
End;

Procedure TFrmRelAutPag1.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  If (trim(doc) = '') And (trim(dblcCentroRespon.text) = '') And (trim(DateEdit1.text) = '') Then
  Begin
    MsgDlg('Faltam parâmetros para seleção de documentos Selecionar Documento(s).', 'Erro', mtError, [mbOk], 0);
  End
  Else
  Begin
    Cmp_Padrao.ParamValues[0].AsString := Doc;
    Cmp_Padrao.ParamValues[1].AsString := dblcCentroRespon.LookupValue ;
    Cmp_Padrao.ParamValues[2].AsString := DateEdit1.text;
    Cmp_Padrao.ParamValues[3].AsString := IntToStr(RadioGroup1.itemindex);

    dtmRelatorioGerencial_AR.V0:= '';
    dtmRelatorioGerencial_AR.V1:= '' ;
    dtmRelatorioGerencial_AR.V2:= '';
    dtmRelatorioGerencial_AR.V3:= '0';
    dtmRelatorioGerencial_AR.cont:=1;

    IF Doc<>'' THEN
       dtmRelatorioGerencial_AR.V0:= Doc;

    IF dblcCentroRespon.LookupValue <> '' THEN
       dtmRelatorioGerencial_AR.V1:= dblcCentroRespon.LookupValue ;

    IF DateEdit1.text<>'' THEN
       dtmRelatorioGerencial_AR.V2:= DateEdit1.text;

    IF IntToStr(RadioGroup1.itemindex)<>'' THEN
       dtmRelatorioGerencial_AR.V3:= IntToStr(RadioGroup1.itemindex);

  End;
End;

Procedure TFrmRelAutPag1.FormCreate(Sender: TObject);
Begin
  Inherited;
  msDoc.Filtro.Add('Documento.RECPAG = ''' + 'R' + '''');
  msDoc.Filtro.Add('Documento.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  msDoc.Filtro.Add('Documento.CODTIPDOC in ' +
    '   (SELECT CODTIPDOC ' +
    '    FROM TIPODOCRECPAG a ' +
    '    WHERE a.RECPAG = ''' + 'R' + ''' and ' +
    '          not exists (select 1 ' +
    '                      from UsuarioxTpdocto b ' +
    '                      where recpag = ' + #39 + 'R' + #39 + ' and ' +
    '                            b.idusuario = ' + IntToStr(Sistema.IdUsuario) +
    '                      ) ' +
    '    UNION ' +
    '    SELECT CODTIPDOC ' +
    '    FROM TIPODOCRECPAG a ' +
    '    WHERE a.RECPAG = ''' + 'R' + ''' and ' +
    '          exists (select 1 ' +
    '                  from UsuarioxTpdocto b ' +
    '                  where recpag = ' + #39 + 'R' + #39 + ' and ' +
    '                        a.codtipdoc = b.codtipdoc and ' +
    '                        b.idusuario = ' + IntToStr(Sistema.IdUsuario) +
    '                  )' +
    '    )');
  With SqlCentroRespon Do
  Begin
    SQL.Clear;
    SQL.Add('SELECT CODCENTRORESPON, NOME, ANALITICOSINTET, CODCENTROCUSTO  ');
    SQL.Add('FROM CENTRESPON                                                ');
    SQL.Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
    SQL.Add('  AND CODCENTRORESPON <> ''9999999999''                        ');
    SQL.Add('ORDER BY CODCENTRORESPON                                       ');
    open;
  End;
End;

End.

