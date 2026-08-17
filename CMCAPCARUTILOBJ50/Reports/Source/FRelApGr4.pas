{===============================================================================
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 24308 - 02/04/2007
{ Descrição    : Criar um flag para rodar o relatorio com as baixas na contabilizações.
================================================================================}
{ Desenvolvedor: Marcus Oliveira
{ Pendência    : 22030 - 31/10/2006
{ Descrição    : Tela de parametro do relatório de AP para VALIA, incluíndo horário
{                das autorizações dos processos RAD e um filtro por lote.
================================================================================}

unit FRelApGr4;
                     
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, ComCtrls, uCtrlParamIntegra,
  uModulo, Db, DBClient, uCMClientDataSet, uCmSqlParams, TREdit;

type
  TfrmRelApGr4 = class(TfrmParamReports_Padrao)
    msDoc: TMontaSelect;
    PageControl: TPageControl;
    tabUnico: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    bbtnSeleciona: TBitBtn;
    MemDocs: TMemo;
    tabMaisdeUm: TTabSheet;
    lblCentroRespon: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    RadioGroup1: TRadioGroup;
    SqlCentroRespon: TCMSqlParams;
    SqlAux: TCMSqlParams;
    CdsCentroRespon: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    dbLote: TDBRealEdit;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    chkContab: TCheckBox;
    chkImprimeExp: TCheckBox;
    chkConsidera: TCheckBox;
    rdgStatusAP: TRadioGroup;
    edtDias: TDBRealEdit;
    cboSitProc: TComboBox;
    Label4: TLabel;
    rdgDataFiltro: TRadioGroup;
    edtInicio: TCMDateTimePicker;
    edtFim: TCMDateTimePicker;
    Label1: TLabel;
    Label5: TLabel;
    ChkListaContab: TCheckBox;
    procedure bbtnSelecionaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkConsideraClick(Sender: TObject);
    procedure chkContabClick(Sender: TObject);
    procedure ChkListaContabExit(Sender: TObject);
  private
       
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelApGr4: TfrmRelApGr4;

implementation
uses
  udatabase, usistema, DBaseDados, umenserro, uString;

{$R *.DFM}

procedure TfrmRelApGr4.bbtnSelecionaClick(Sender: TObject);
begin
  inherited;
   inherited;
   if (msDoc.Executar = MrOk) then
   begin
      Cmp_Padrao.ParamValues[0].AsString  := MsDoc.ValoresChave[0];
      MemDocs.Lines.Add(' Nº Ap: ............ ' + MsDoc.ValoresChave[9]);
      MemDocs.Lines.Add(' Nº Documento: ..... ' + MsDoc.ValoresChave[7]);
      MemDocs.Lines.Add(' Complemento: ...... ' + MsDoc.ValoresChave[1]);
      MemDocs.Lines.Add(' Data Vencimento: .. ' + MsDoc.ValoresChave[2]);
      MemDocs.Lines.Add(' Data Programada: .. ' + MsDoc.ValoresChave[3]);
      MemDocs.Lines.Add(' Operacao: ......... ' + MsDoc.ValoresChave[4]);
      MemDocs.Lines.Add(' Data Emissão: ..... ' + MsDoc.ValoresChave[5]);
      MemDocs.Lines.Add(' Valor: ............ ' + MsDoc.ValoresChave[6]);
      MemDocs.Lines.Add(' Razao Social: ..... ' + MsDoc.ValoresChave[8]);
   end;
end;




procedure TfrmRelApGr4.FormCreate(Sender: TObject);
begin
  inherited;
   PageControl.ActivePage := tabUnico;
   rdgStatusAP.Enabled    := false;
   cboSitProc.ItemIndex   := 0;

   msDoc.Filtro.Add('Documento.RECPAG = ''' + ParamIntegra.RecPag + '''                             ');
   msDoc.Filtro.Add('Documento.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   msDoc.Filtro.Add('Documento.CODTIPDOC in                                                         ' +
     '(SELECT CODTIPDOC                                                              ' +
     ' FROM TIPODOCRECPAG a                                                          ' +
     ' WHERE                                                                         ' +
     '     a.RECPAG = ''' + ParamIntegra.RecPag + ''' and                            ' +
     '     not exists (select 1                                                      ' +
     '                 from UsuarioxTpdocto b                                        ' +
     '                 where                                                         ' +
     '                    recpag = ' + #39 + ParamIntegra.RecPag + #39 + ' and       ' +
     '                    b.idusuario = ' + IntToStr(Sistema.IdUsuario) + ')         ' +
     ' UNION                                                                         ' +
     ' SELECT CODTIPDOC                                                              ' +
     ' FROM TIPODOCRECPAG a                                                          ' +
     ' WHERE a.RECPAG = ''' + ParamIntegra.RecPag + ''' and                          ' +
     '       exists (select 1                                                        ' +
     '               from UsuarioxTpdocto b                                          ' +
     '               where recpag = ' + #39 + ParamIntegra.RecPag + #39 + ' and      ' +
     '                     a.codtipdoc = b.codtipdoc and                             ' +
     '                     b.idusuario = ' + IntToStr(Sistema.IdUsuario) + '))       ');

   if Modulo.CodDocumento = 0 then
   begin
      with SqlCentroRespon do
      begin
        SQL.Text := 'SELECT ' +
          'CODCENTRORESPON, ' +
          'NOME, ' +
          'ANALITICOSINTET, ' +
          'CODCENTROCUSTO ' +
          'FROM ' +
          'CENTRESPON ' +
          'WHERE ' +
          'IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ' and ' +
          'CODCENTRORESPON <> ''9999999999'' ' +
          'ORDER BY ' +
          'CODCENTRORESPON';
        Open;
      end;
   end;

end;




procedure TfrmRelApGr4.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
     0: begin
           if Trim(Cmp_Padrao.ParamValues[0].AsString) = '' then
           begin
              MsgDlg('É necessário informar o documento', 'Aviso', mtWarning, [mbOk], 0);
              ModalResult := mrCancel;
              Exit;
           end;
        end;

     1: begin
           if (((edtInicio.Date = 0) and (edtFim.Date = 0)) and (dbLote.Value = 0))  then
           begin
              MsgDlg('É necessário informar ao menos uma data de filtro', 'Aviso', mtWarning, [mbOk], 0);
              ModalResult := mrCancel;
              Exit;
           end;
        end;
  end;

  Cmp_Padrao.ParamValues[1].AsBoolean  := chkImprimeExp.Checked;
  Cmp_Padrao.ParamValues[2].AsString   := dblcCentroRespon.LookupValue;
  Cmp_Padrao.ParamValues[4].AsString   := IntToStr(RadioGroup1.itemindex);
  Cmp_Padrao.ParamValues[5].AsString   := FloatToStr(dbLote.Value);
  Cmp_Padrao.ParamValues[6].AsBoolean  := chkContab.Checked;
  Cmp_Padrao.ParamValues[10].AsString  := edtInicio.Text;
  Cmp_Padrao.ParamValues[11].AsString  := edtFim.text;
  Cmp_Padrao.ParamValues[12].AsInteger := rdgDataFiltro.ItemIndex;
  Cmp_Padrao.ParamValues[13].AsInteger := cboSitProc.ItemIndex;

  if chkConsidera.Checked then
  begin
     Cmp_Padrao.ParamValues[7].AsBoolean := (rdgStatusAP.ItemIndex = 0);
     Cmp_Padrao.ParamValues[8].AsBoolean := (rdgStatusAP.ItemIndex = 1);
     Cmp_Padrao.ParamValues[9].AsInteger := Trunc(edtDias.Value);
  end
  else
  begin
     Cmp_Padrao.ParamValues[7].AsBoolean := false;
     Cmp_Padrao.ParamValues[8].AsBoolean := false;
  end;
end;




procedure TfrmRelApGr4.chkConsideraClick(Sender: TObject);
begin
  inherited;
  rdgStatusAP.Enabled := chkConsidera.Checked;
  edtDias.Enabled     := chkConsidera.Checked;
end;

procedure TfrmRelApGr4.chkContabClick(Sender: TObject);
begin
  inherited;  //Marcus Oliveira P. 24308 03/04/2007
              //Des/Habilita Não listar contabilizações de baixa de documento
  if chkContab.Checked then
     ChkListaContab.Enabled := True
  else
     ChkListaContab.Enabled := False;
end;

procedure TfrmRelApGr4.ChkListaContabExit(Sender: TObject);
begin
  inherited;
    //Marcus Oliveira P. 24308 03/04/2007
    Cmp_Padrao.ParamValues[14].AsBoolean := ChkListaContab.Checked;
end;

end.
