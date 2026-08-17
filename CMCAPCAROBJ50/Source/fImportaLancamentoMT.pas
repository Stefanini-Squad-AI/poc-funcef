// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Rodolpho da Silva
//  Rotina     :
//  Data       : 01/02/2005
//  Pendência  : 18595
//  Descrição  : Correção dos lançamento do CAR, pois não estavam aparecendo
//               as informações de Contas/Caixas x Tipo Cobrança na guia Dados para o Lançamento
//               e na guia Geral o campo Tipos de Cobrança..
//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     :
//  Data       : 27/01/2005
//  Pendência  : 18546
//  Descrição  : Não estava importando os documentos.
//------------------------------------------------------------------------------
//  Autor      : Rodolpho da Silva
//  Rotina     :
//  Data       : 14/01/2005
//  Pendência  : 18324
//  Descrição  : Ativar o flg de importação (FLGIMPORTADO = 'S') definindo
//               os registros como importados.
//------------------------------------------------------------------------------
//  Autor      : Alex Pereira
//  Rotina     :
//  Data       : 02/12/04
//  Pendência  : 17529
//  Descrição  : O Sistema não está importando critério para segregação IDSEGREGACRITER
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     :
//  Data       : 08/09/2004
//  Pendência  : 17529
//  Descrição  : Conversão da tela para utilizar os conceitos do 3 camadas, incluindo:
//               - Critério para segregação
//               - Retirar a opção para contabilizar no momento da importação (futuramente será implementado novamente)
//               - Utilizar o objeto uCtrlDocumento
//------------------------------------------------------------------------------

Unit fImportaLancamentoMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, Buttons, StdCtrls, MAHlpBtn, TB97Tlbr, TB97,
  ExtCtrls, Db, DBTables, wwQuery, IvDictio, IvMulti, IvEMulti,
  uCmControlObject, uCtrlPadroes, 
  uCtrlPeriodo, uCmSqlParams,
  //  Rodolpho da Silva - P: 18933
  uCtrlImportaLancamento, FProgressoDuplo,
  wwriched, DBCtrls, Menus, wwdbdatetimepicker, CMDateTimePicker, Grids,
  Wwdbigrd, Wwdbgrid, DBClient, uCMClientDataSet;


Type
  TfrmImportaLancamentoMT = Class(TfrmOkCancelar)
    opdlgtxt: TOpenDialog;
    ppMenu: TPopupMenu;
    mnuImprimir: TMenuItem;
    PageControl: TPageControl;
    tbArquivoTxt: TTabSheet;
    Label2: TLabel;
    edNomeArqTxt: TEdit;
    Label1: TLabel;
    EdtHist: TEdit;
    spdSelec: TSpeedButton;
    tbsTabela: TTabSheet;
    Panel2: TPanel;
    edtDataIni: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    edtDataFinal: TCMDateTimePicker;
    btSelecionar: TBitBtn;
    Grid: TwwDBGrid;
    Cds: TCMClientDataSet;
    ds: TDataSource;
    edtDescLote: TEdit;
    Label5: TLabel;
    rgTipoData: TRadioGroup;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel1: TPanel;
    mmLogErros: TRichEdit;
    Procedure spdSelecClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    procedure mnuImprimirClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure GridUpdateFooter(Sender: TObject);
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure PageControlChange(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTopRowChanged(Sender: TObject);
  private
    { Private declarations }
    CtrlImportaLancamento : TCtrlImportaLancamento;

  public
      { Public declarations }
      procedure Progresso(vParam : Array of Variant);
  End;

  



Var
  frmImportaLancamentoMT: TfrmImportaLancamentoMT;

Implementation

{$R *.DFM}

Uses uMensErro, uSistema, DBaseDados, uDataBase, uFuncaoGeral, uCtrlParamIntegra;



Procedure TfrmImportaLancamentoMT.spdSelecClick(Sender: TObject);
Begin
  Inherited;
  If OpDlgTxt.Execute Then
  Begin
    edNomeArqTxt.Text := OpDlgTxt.FileName;
    bbtnConfirmar.Enabled := True;
  End
  Else
    bbtnConfirmar.Enabled := False;
End;




Procedure TfrmImportaLancamentoMT.bbtnConfirmarClick(Sender: TObject);
Var
  sArquivoImportacao: TStringList;

Begin
  Inherited;

  try
     sArquivoImportacao := TStringList.Create;
     // Início - Rodolpho da Silva - P: 22118 - 26/09/2006
     if PageControl.ActivePageIndex = 0 then
        sArquivoImportacao.LoadFromFile(edNomeArqTxt.Text)
     else
     begin
        if Trim(edtDescLote.Text) = '' then
        begin
           MsgDlg('Informe a descrição do lote','Aviso',mtWarning,[mbOk],0);
           Exit;
        end;

        if Cds.IsEmpty then
        begin
           MsgDlg('Não há nenhum documento selecionado','Aviso',mtWarning,[mbOk],0);
           Exit;
        end;
     end;
     // Fim - Rodolpho da Silva - P: 22118 - 26/09/2006

        
     bbtnConfirmar.Enabled := false;
     mmLogErros.Lines.Clear;
     mmLogErros.Lines.Add('====================================================');
     mmLogErros.Lines.Add('Início do processo: ' + DateTimeToStr(now));
     mmLogErros.Lines.Add('');
     if not CtrlImportaLancamento.ImportaLancamentos(sArquivoImportacao,
                                                     ParamIntegra.RecPag,
                                                     EdtHist.Text,
                                                     Sistema.UsaPlanoPatro,
                                                     ParamIntegra.PartidaDobrada,
                                                     ParamIntegra.IntegraContab,
                                                     Sistema.IdEspAcesso,
                                                     Sistema.IdUsuario,
                                                     Sistema.IdEmpresa,
                                                     Sistema.IdModulo,
                                                     ParamIntegra.PlanoCentroCusto,
                                                     ParamIntegra.uNidNegoc,
                                                     ParamIntegra.Plano,
                                                     edtDescLote.Text,
                                                     ParamIntegra.PartidaDobrada,
                                                     Cds.Data,
                                                     (PageControl.ActivePageIndex = 1),) then
        MsgDlg(CtrlImportaLancamento.MessageInfo,Sistema.NomeAplicativo,mtError,[mbOk],0)
     else
     begin
        MsgDlg('Processo concluído com sucesso!',Sistema.NomeAplicativo,mtInformation,[mbOk],0);
        Cds.EmptyDataSet;
     end;

  finally
     FreeAndNil(sArquivoImportacao);
     mmLogErros.Lines.Add('');
     mmLogErros.Lines.Add('');
     mmLogErros.Lines.Add('Fim do processo: ' + DateTimeToStr(now));
     mmLogErros.Lines.Add('====================================================');
  end;
End;




Procedure TfrmImportaLancamentoMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'P' Then
  Begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30005;
    bbtnAjuda.HelpContext := 30005;
  End;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

  // Rodolpho da Silva - P: 22484 - 18/09/2006
  PageControl.ActivePageIndex := 0;



  // Rodolpho da Silva - P: 18933 - 13/10/2005
  CtrlImportaLancamento := TCtrlImportaLancamento.Create;
  CtrlImportaLancamento.InitializeAs(Padroes);
  CtrlImportaLancamento.Progresso := Progresso;
  Cds.Data := CtrlImportaLancamento.ListaDocFromTabela(ParamIntegra.RecPag, 0,0,'DATAPROGRAMADA');
End;




Procedure TfrmImportaLancamentoMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  FreeAndNil(CtrlImportaLancamento);
  Inherited;
End;







procedure TfrmImportaLancamentoMT.Progresso(vParam: array of Variant);
//  Legenda do FormProgresso
//   vParam[0] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//    Acima
//-------------------------------------
//   vParam[1]  :  Mínimo de Registros
//   vParam[2]  :  Total de Registros
//   vParam[3]  :  Registro Atual
//   vParam[4]  :  Legenda

//    Abaixo
//-------------------------------------
//   vParam[5]  :  Mínimo de Registros
//   vParam[6]  :  Total de Registros
//   vParam[7]  :  Registro Atual
//   vParam[8]  :  Legenda
//   vParam[9]  :  Mensagens para memo
//   vParam[10] :  Origem do erro  1-Valor nulo, 2-Valor não econtrado

begin

   case vParam[0] of
      0: begin
            frmProgressoDuplo.Min  := 0;
            frmProgressoDuplo.Min2 := 0;
            frmProgressoDuplo.Max  := 100;
            frmProgressoDuplo.Max2 := 100;
            frmProgressoDuplo.MostraFormProgressoDuplo(vParam[4],vParam[8],vParam[1],vParam[5],vParam[2],vParam[6],False,False);
         end;
      1: begin
            frmProgressoDuplo.Legenda  := vParam[4];
            frmProgressoDuplo.Legenda2 := vParam[8];
            frmProgressoDuplo.AndaFormProgressoDuplo(vParam[3],vParam[7]);
         end;
      2: begin
            frmProgressoDuplo.EscondeFormProgressoDuplo;
         end;
   end;

   if Trim(vParam[9]) <> '' then
   case vParam[10] of
      1 : mmLogErros.Lines.Add('--- Registro não informado: ' + vParam[9]);
      2 : mmLogErros.Lines.Add('--- Registro não encontrado/inválido: ' + vParam[9]);
   end;


   Application.ProcessMessages;
   Repaint;
end;




procedure TfrmImportaLancamentoMT.mnuImprimirClick(Sender: TObject);
begin
  inherited;
  mmLogErros.Print('Log de Erros');
end;




procedure TfrmImportaLancamentoMT.btSelecionarClick(Sender: TObject);
var
  sCampoData: string;
begin
  inherited;
  case rgTipoData.ItemIndex of
    0: sCampoData := 'DATAVALIDACAO';
    1: sCampoData := 'DATAVENCTO';
    2: sCampoData := 'DATAPROGRAMADA';
  end;
  mmLogErros.Lines.Clear;

  Cds.Data := CtrlImportaLancamento.ListaDocFromTabela(ParamIntegra.RecPag, edtDataIni.Date,edtDataFinal.Date,sCampoData);
  bbtnConfirmar.Enabled := not (Cds.IsEmpty);
end;




procedure TfrmImportaLancamentoMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByname('VALOR')).DisplayFormat     := '#,##0.00;-#,##0.00';
  TFloatField(DataSet.FieldByname('VLRRATEIO')).DisplayFormat := '#,##0.00;-#,##0.00';
end;




procedure TfrmImportaLancamentoMT.GridUpdateFooter(Sender: TObject);
var
   CdsAux: TClientDataSet;
   rValor: Double;
begin
  inherited;
  try
     CdsAux      := TCMClientDataSet.Create(nil);
     CdsAux.Data := Cds.Data;
     rValor      := 0;

     while not CdsAux.Eof do
     begin
        rValor := rValor + CdsAux.FieldByName('VALOR').AsFloat;
        CdsAux.Next;
     end;
     Grid.ColumnByName('VALOR').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rValor);

  finally
     FreeAndNil(CdsAux);
  end;
end;




procedure TfrmImportaLancamentoMT.GridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;




procedure TfrmImportaLancamentoMT.PageControlChange(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
    0: bbtnConfirmar.Enabled := (edNomeArqTxt.Text <> '');
    1: bbtnConfirmar.Enabled := not (Cds.IsEmpty);
  end;
end;




procedure TfrmImportaLancamentoMT.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TfrmImportaLancamentoMT.GridTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;

End.
