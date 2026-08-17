{*******************************************************************************
RESPONSÁVEL.: William Santana
Nº SOL......: 199707
Nº KINTANA..: 1922320
Data........: 09/08/2013
Descrição...: Alteração na forma de Correção das Faixas Salariais.
********************************************************************************
RESPONSÁVEL.: Thiago Melo
Nº SOL......: 218333
Nº KINTANA..: 2049280
Data........: 14/10/2013
Descrição...: Corrigir os erros na funcionalidade de Cadastro de Faixas Salariais
********************************************************************************

RESPONSÁVEL.: Marcio Sanches Spinosa
Nº SOL......: 149111
Nº KINTANA..: 1066131
Data........: 12/12/2012
Descrição...: Inclusão do campo CODFAIXAPCDS, alteração e inclusão de dados
********************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
********************************************************************************
}

unit fCadFaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cmseldlg, wwidlg,
  Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, DBTables, Wwtable, Wwquery, TB97, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, MontaSelect, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlFaixaSal,
  uCtrlListTerceirosRH, uCtrlIntegraPrevRH, uCMTypes;

type
  TfrmCadFaixa = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TwwDBEdit;
    Label2: TLabel;
    dbdtedDataEfet: TCMDateTimePicker;
    lblTit9: TLabel;
    dbredVal9: TDBRealEdit;
    lblTit8: TLabel;
    dbredVal8: TDBRealEdit;
    lblTit7: TLabel;
    dbredVal7: TDBRealEdit;
    lblTit6: TLabel;
    dbredVal6: TDBRealEdit;
    lblTit5: TLabel;
    dbredVal5: TDBRealEdit;
    lblTit4: TLabel;
    dbredVal4: TDBRealEdit;
    lblTit3: TLabel;
    dbredVal3: TDBRealEdit;
    lblTit2: TLabel;
    dbredVal2: TDBRealEdit;
    lblTit1: TLabel;
    dbredVal1: TDBRealEdit;
    pnlHistFaixa: TPanel;
    lblHistFaixa: TLabel;
    ToolbarSep972: TToolbarSep97;
    bbtnHistFaixa: TToolbarButton97;
    CdsHistFaixa: TCMClientDataSet;
    dsHistFaixa: TwwDataSource;
    bvFx1: TBevel;
    lblTit10: TLabel;
    dbredVal10: TDBRealEdit;
    lblTit19: TLabel;
    lblTit18: TLabel;
    lblTit17: TLabel;
    lblTit16: TLabel;
    lblTit15: TLabel;
    lblTit14: TLabel;
    lblTit13: TLabel;
    lblTit12: TLabel;
    lblTit11: TLabel;
    dbredVal19: TDBRealEdit;
    dbredVal18: TDBRealEdit;
    dbredVal17: TDBRealEdit;
    dbredVal16: TDBRealEdit;
    dbredVal15: TDBRealEdit;
    dbredVal14: TDBRealEdit;
    dbredVal13: TDBRealEdit;
    dbredVal12: TDBRealEdit;
    dbredVal11: TDBRealEdit;
    bvFx2: TBevel;
    lblTit20: TLabel;
    dbredVal20: TDBRealEdit;
    dbedCodFaixaPCS: TwwDBEdit;

    Label3: TLabel;
    dbGridHistFaixa: TwwDBGrid;
    fltfldCdsHistFaixaNIVEL1: TFloatField;
    fltfldCdsHistFaixaNIVEL2: TFloatField;
    fltfldCdsHistFaixaNIVEL3: TFloatField;
    fltfldCdsHistFaixaNIVEL4: TFloatField;
    strngfldCdsHistFaixaIDNIVEL: TFloatField;
    dtmfldCdsHistFaixaDATAEFETIVACAO: TDateTimeField;    //William Santana SOL: 199707 - KINTANA: 1922320
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnHistFaixaClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbGridHistFaixaCellChanged(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbGridHistFaixaDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure CdsHistFaixaAfterOpen(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);

                                                          
  private
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;

    procedure Sel(IdFaixaSalarial: integer);
    function  GravarRegistro: boolean;
    procedure MostraDadosFaixaSal(iFaixa : integer); // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    procedure ConfiguraTela(iFaixa : integer); // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  end;

var
  frmCadFaixa: TfrmCadFaixa;

  Valor: TComponent;         //William Santana SOL: 199707 - KINTANA: 1922320
  EditaFaixaNivel: Boolean;   //William Santana SOL: 199707 - KINTANA: 1922320

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadFaixa.FormCreate(Sender: TObject);
var
  c, iNumSteps: integer;
  txt : string;
 begin
  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);
  CtrlFaixaSal.Cds := Cds;
  CtrlFaixaSal.CdsFaixaNivel := CdsHistFaixa; //William Santana SOL: 199707 - KINTANA: 1922320

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  bbtnHistFaixa.Visible := (CtrlFaixaSal.TipoEmpresa = 'P');
  ToolbarSep972.Visible := bbtnHistFaixa.Visible;
  Sel(-1);

  with (CtrlFaixaSal.DbParamRH) do
  begin
    LoadFromDb;
    iNumSteps := FieldByName('NUMSTEPS').asInteger;
    inherited;
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    MostraDadosFaixaSal(iNumSteps);
    ConfiguraTela(iNumSteps);
    {
    lblTit1.Visible := (iNumSteps >= 1);
    lblTit2.Visible := (iNumSteps >= 2);
    lblTit3.Visible := (iNumSteps >= 3);
    lblTit4.Visible := (iNumSteps >= 4);
    lblTit5.Visible := (iNumSteps >= 5);
    lblTit6.Visible := (iNumSteps >= 6);
    lblTit7.Visible := (iNumSteps >= 7);
    lblTit8.Visible := (iNumSteps >= 8);
    lblTit9.Visible := (iNumSteps >= 9);

    dbredVal1.Visible := (iNumSteps >= 1);
    dbredVal2.Visible := (iNumSteps >= 2);
    dbredVal3.Visible := (iNumSteps >= 3);
    dbredVal4.Visible := (iNumSteps >= 4);
    dbredVal5.Visible := (iNumSteps >= 5);
    dbredVal6.Visible := (iNumSteps >= 6);
    dbredVal7.Visible := (iNumSteps >= 7);
    dbredVal8.Visible := (iNumSteps >= 8);
    dbredVal9.Visible := (iNumSteps >= 9);

    lblTit1.Caption := FieldByName('TITSTEP1').asString;
    lblTit2.Caption := FieldByName('TITSTEP2').asString;
    lblTit3.Caption := FieldByName('TITSTEP3').asString;
    lblTit4.Caption := FieldByName('TITSTEP4').asString;
    lblTit5.Caption := FieldByName('TITSTEP5').asString;
    lblTit6.Caption := FieldByName('TITSTEP6').asString;
    lblTit7.Caption := FieldByName('TITSTEP7').asString;
    lblTit8.Caption := FieldByName('TITSTEP8').asString;
    lblTit9.Caption := FieldByName('TITSTEP9').asString;
    }
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim

    for c:=1 to FieldByName('NUMSTEPS').asInteger do
    begin
      MontaSelect.Colunas.Add('FAIXASAL.STEP'+IntToStr(c));  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
      MontaSelect.Descricao.Add(CtrlFaixaSal.DbParamRH.FieldByName('TITSTEP'+IntToStr(c)).asString);
      MontaSelect.Larguras.Add('10');
      MontaSelect.Mascaras.Add(' ');
      MontaSelect.SensivelACaixa.Add('N');
      MontaSelect.TipodeDado.Add('C');
      MontaSelect.OperComparador.Add('-1'); // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
    end;
  end;

  bbtnHistFaixa.Visible := (Sistema.TipoEmpresa = 'P');

  case (Sistema.IdModulo) of
    MODCES : HelpContext := 740008;
    MODFOL : HelpContext := 210017;
  end;
 
 end;

procedure TfrmCadFaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlIntegraPrevRH);
  inherited;
end;

procedure TfrmCadFaixa.CmeCadastroFind(Sender: TObject);
var
  iNumSteps : integer; // Edilaine Ferraresi - SOL 171426 / KTN 1537613
begin
//  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
    
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    iNumSteps := CtrlFaixaSal.DbParamRH.FieldByName('NUMSTEPS').asInteger;
    MostraDadosFaixaSal(iNumSteps);
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 -fim
  end;
end;

procedure TfrmCadFaixa.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadFaixa.CmeCadastroConfirma(Sender: TObject);
var
  bOk: boolean;
begin
  inherited;
  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (bbtnHistFaixa.Visible) then
  begin
    frmAguarde.Mostra('Atualizando o Histórico das Faixas');
    frmAguarde.Pos := 0;

    bOk := CtrlIntegraPrevRH.AtualizaFaixasSalariais(Sistema.IdEmpresa);
    frmAguarde.Apaga;
    
    if (bOk) then
      CdsHistFaixa.Data := CtrlListTerceirosRH.ListFaixaNivel(
        Cds.FieldByName('IDFAIXASALARIAL').asFloat, Sistema.IdEmpresa)
    else
      raise Exception.Create(CtrlIntegraPrevRH.MessageInfo);
  end;
end;

procedure TfrmCadFaixa.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //nherited;
end;

procedure TfrmCadFaixa.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFaixa.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFaixa.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFaixa.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadFaixa.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (pnlHistFaixa.Visible) then
    lblHistFaixa.Caption := 'Histórico da Faixa ' + Cds.FieldByName('IDFAIXASALARIAL').asString;
end;

procedure TfrmCadFaixa.bbtnHistFaixaClick(Sender: TObject);
var
 iNumSteps : integer;
begin
  pnlHistFaixa.Visible := not(pnlHistFaixa.Visible);
  //William Santana SOL: 199707 - KINTANA: 1922320
  dbGridHistFaixaCellChanged(Self);
  iNumSteps := CtrlFaixaSal.DbParamRH.FieldByName('NUMSTEPS').asInteger;
  ConfiguraTela(iNumSteps);
  //END - William Santana SOL: 199707 - KINTANA: 1922320
end;

procedure TfrmCadFaixa.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
  i: Integer; //William Santana SOL: 199707 - KINTANA: 1922320
begin

  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbdtedDataEfet.Text) = '') then
  begin
    MsgDlg('Preencha a Data de Efetivação.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbdtedDataEfet.SetFocus;
  end
  else
  begin
    //William Santana SOL: 199707 - KINTANA: 1922320
      CdsHistFaixa.First;
      CdsHistFaixa.DisableControls;
      while not(CdsHistFaixa.Eof)  do
      begin
       if not(CtrlFaixaSal.DataFaixaSalMaior) and
        (not(not(pnlHistFaixa.Visible) and        
             (Cds.FieldByName('DATAEFETIV').AsString = CdsHistFaixa.FieldByName('DATAEFETIVACAO').AsString))
             )then
          CtrlFaixaSal.CorrigeFaixaNivel;

       if EditaFaixaNivel then
       CdsHistFaixa.Edit;
       begin
        for i := 1 to 20 do
        begin
           if CdsHistFaixa.FieldByName('NIVEL'+inttostr(i)).OldValue <>
                    CdsHistFaixa.FieldByName('NIVEL'+inttostr(i)).NewValue or
              CdsHistFaixa.FieldByName('DATAEFETIVACAO').OldValue <>
                    CdsHistFaixa.FieldByName('DATAEFETIVACAO').NewValue
                     then
             CtrlFaixaSal.AlterarHistFaixa(i,Cds.FieldByName('IDFAIXASALARIAL').asString,
                          CdsHistFaixa.FieldByName('NIVEL'+inttostr(i)).asString,
                          CdsHistFaixa.FieldByName('DATAEFETIVACAO').asString);
        end;
       end;
       CdsHistFaixa.Next;
      end;

    //END - William Santana SOL: 199707 - KINTANA: 1922320

     bInserindo := (Cds.State = dsInsert);
     inherited;
     if not(bInserindo) then
       CmeCadastroFind(Sender);

     //William Santana SOL: 199707 - KINTANA: 1922320
     CdsHistFaixa.Data := CtrlListTerceirosRH.ListFaixaNivel(
        Cds.FieldByName('IDFAIXASALARIAL').asFloat , Sistema.IdEmpresa);
     CdsHistFaixa.EnableControls;
     //END - William Santana SOL: 199707 - KINTANA: 1922320
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadFaixa.Sel(IdFaixaSalarial: integer);
begin
  Cds.Data := CtrlFaixaSal.ListFaixaSal(IdFaixaSalarial);

  if (bbtnHistFaixa.Visible) then
    CdsHistFaixa.Data := CtrlListTerceirosRH.ListFaixaNivel(
     Cds.FieldByName('IDFAIXASALARIAL').asFloat , Sistema.IdEmpresa);
end;

function TfrmCadFaixa.GravarRegistro: boolean;
begin
  Result := CtrlFaixaSal.Gravar;
  if not(Result) then
  begin
    //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
//    raise Exception.Create(CtrlFaixaSal.MessageInfo);
    if (pos('XPKFAIXASAL',CtrlFaixaSal.MessageInfo) > 0) then begin
      ShowMessage('Código já existente. ');
      // Thiago Melo SOL 218333 Kintana 2049280
      Cds.Close;
      bbtnCancelarClick(Self);
      CmeCadastro.AtualizaBotoes(Self);
      Sel(-1);
      // Thiago Melo SOL 218333 Kintana 2049280
    end
    else if (Pos('Cannot delete or modify', CtrlFaixaSal.MessageInfo) > 0) then  // Thiago Melo SOL 218333 Kintana 2049280
      ShowMessage('Não é possível excluir o registro.');
    //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim
  end;
end;


procedure TfrmCadFaixa.MostraDadosFaixaSal(iFaixa: integer);
Var
  iInd, iTag  : integer;
begin
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  // se inserir nova faixa, colocar na TAG do label e edit o no. correspondente a faixa
  // para que o 'for' abaixo possa ter efeito sobre o item novo
  for iInd := 0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[iInd] is TLabel) and (TLabel(Self.Components[iInd]).Tag > 0) then
    begin
      iTag := TLabel(Self.Components[iInd]).Tag;
      TLabel(Self.Components[iInd]).Visible := (TLabel(Self.Components[iInd]).Tag <= iFaixa);
      TLabel(Self.Components[iInd]).Caption := CtrlFaixaSal.DbParamRH.FieldByName('TITSTEP'+IntToStr(iTag)).asString;
    end;

    if (Self.Components[iInd] is TDBRealEdit) then
       TDBRealEdit(Self.Components[iInd]).Visible := (TDBRealEdit(Self.Components[iInd]).Tag <= iFaixa);
  end;
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
end;


procedure TfrmCadFaixa.ConfiguraTela(iFaixa: integer);
   procedure Centraliza(var ALeft : integer; var  ATop : integer; AWidth, AHeight: Integer; bConteudo : boolean);
   var
     Rect: TRect;
     OurWidth: Integer;
     OurHeight: Integer;
   begin
     if not bConteudo then  // posiciona o form tela MDI na área útil
     begin
       // Obtem o retângulo da área cliente MDI
       Windows.GetWindowRect(Application.MainForm.ClientHandle, Rect);

       // Calcular largura e altura da área cliente
       OurWidth := Rect.Right - Rect.Left;
       OurHeight := Rect.Bottom - Rect.Top;
     end
     else  // posiciona o conteudo dentro do form MDI
     begin
       OurWidth  := Self.width;
       OurHeight := Self.Height;
     end;

     // Calcula a nova posição
     ALeft := (OurWidth - AWidth) div 2;
     ATop := (OurHeight - AHeight) div 2;
   end;
Var
  ALeft, ATop : integer;
begin
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  if (iFaixa >= 11) and (not bvFx2.visible) then
  begin
    Self.Width    := 600;
    bvFx2.visible := true;
    //William Santana SOL: 199707 - KINTANA: 1922320
    lblHistFaixa.Width := 556;
    dbGridHistFaixa.Width := 556;
    pnlHistFaixa.Width := 569;
    //END - William Santana SOL: 199707 - KINTANA: 1922320
    repaint;
  end
  else if (iFaixa <= 10) and (bvFx2.visible) then
  begin
    Self.Width    := 380;
    bvFx2.visible := false;
    //William Santana SOL: 199707 - KINTANA: 1922320
    lblHistFaixa.Width := 336;
    dbGridHistFaixa.Width := 336;
    pnlHistFaixa.Width := 349;
    //END - William Santana SOL: 199707 - KINTANA: 1922320
    repaint;
  end;

  //William Santana SOL: 199707 - KINTANA: 1922320
  if  (not pnlHistFaixa.visible) then
    Self.Height    := 373
  else
    Self.Height    := 553;
                                                                
  repaint;
  //END - William Santana SOL: 199707 - KINTANA: 1922320

  Centraliza(aLeft, aTop, self.width, self.Height, false);
  Self.Top  := aTop;
  Self.Left := aLeft;

 //William Santana SOL: 199707 - KINTANA: 1922320 {não usa mais esse trecho}
 // Centraliza(aLeft, aTop, pnlHistFaixa.width, pnlHistFaixa.Height, true);
 // pnlHistFaixa.Top  := aTop;
 // pnlHistFaixa.Left := aLeft;
 //END- William Santana SOL: 199707 - KINTANA: 1922320

  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
end;
//Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
procedure TfrmCadFaixa.sbtnApagarClick(Sender: TObject);
var
faixaSal : Integer; // Thiago Melo SOL 218333 Kintana 2049280
begin
//William Santana SOL: 199707 - KINTANA: 1922320
  faixaSal := Cds.FieldByName('IDFAIXASALARIAL').AsInteger;  // Thiago Melo SOL 218333 Kintana 2049280
  if (pnlHistFaixa.Visible) then
   {and ((CdsHistFaixa.RecordCount = 1) or
   (Cds.FieldByName('dataefetiv').AsDateTime <> CdsHistFaixa.FieldByName('dataefetivacao').AsDateTime)) then }
   begin
    if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
     begin
      //verifica se o registro a ser apagado está sendo usado em outro cadastro associativo
      // caso esteja sendo usado, não deixa apagar
      if CtrlFaixaSal.VerificaSePodeApagar(Cds.FieldByName('IDFAIXASALARIAL').AsFloat, CdsHistFaixa.FieldByName('DATAEFETIVACAO').AsString) then
       CtrlFaixaSal.ApagarHistFaixa
      else
       ShowMessage('Não é possível excluir o registro. ');

      //Esse caso é para garantir que o regitro da FAIXASAL fique sempre com o maior valor da FAIXANIVEL
      Sel(faixaSal);

      CdsHistFaixa.first;
      if Cds.FieldByName('DATAEFETIV').AsDateTime > CdsHistFaixa.FieldByName('DATAEFETIVACAO').AsDateTime then
      begin
         CtrlFaixaSal.CorrigeFaixaSal;
         Sel(faixaSal);
      end;             
     end;
   end
  else
   begin
   //END - Wlliam Santana SOL: 199707 - KINTANA: 1922320

    inherited;
    if CmeCadastro.Operacao <> opApagar then
    Begin
     // Thiago Melo SOL 218333 Kintana 2049280
     //Sel(-1);
     Sel(faixaSal);
     // Thiago Melo SOL 218333 Kintana 2049280
     CmeCadastro.AtualizaBotoes(Self);
    end;
   end;
  CmeCadastro.AtualizaBotoes(Self);

end;
//Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim

//William Santana SOL: 199707 - KINTANA: 1922320

procedure TfrmCadFaixa.dbGridHistFaixaCellChanged(Sender: TObject);
var
    i: Integer;
begin
  inherited;
  if not(pnlHistFaixa.Visible) then
   begin
     for i:= 1 to 20 do
     begin
      Valor := FindComponent('dbredVal'+IntToStr(i));
       if Valor is TDBRealEdit then
        begin
         (Valor as TDBRealEdit).DataField  := '';
         (Valor as TDBRealEdit).DataSource := ds;
         (Valor as TDBRealEdit).DataField  := 'STEP'+IntToStr(i);
        end;
        dbdtedDataEfet.DataField := '';
        dbdtedDataEfet.DataSource := ds;
        dbdtedDataEfet.DataField := 'DATAEFETIV';
     end;
   end
  else 
   begin
    for i:= 1 to 20 do
     begin
       CdsHistFaixa.Edit;
       Valor := FindComponent('dbredVal'+IntToStr(i));
        if Valor is TDBRealEdit then
       begin
         (Valor as TDBRealEdit).DataField  := '';
         (Valor as TDBRealEdit).DataSource := dsHistFaixa;
         (Valor as TDBRealEdit).DataField  := 'NIVEL'+IntToStr(i);
       end;
         dbdtedDataEfet.DataField := '';
         dbdtedDataEfet.DataSource := dsHistFaixa;
         dbdtedDataEfet.DataField := 'DATAEFETIVACAO';
     end;
   end;
end;

procedure TfrmCadFaixa.sbtnAlterarClick(Sender: TObject);
begin
   EditaFaixaNivel := True;
   CdsHistFaixa.Edit;
   dbedCodigo.Enabled := False;
   inherited;
end;

procedure TfrmCadFaixa.dbGridHistFaixaDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
   dbGridHistFaixa.fields[1].Alignment:= taCenter  ;
   dbGridHistFaixa.fields[0].Alignment:= taRightJustify  ;
end;
                   

procedure TfrmCadFaixa.CdsHistFaixaAfterOpen(DataSet: TDataSet);
var
  i: integer;
begin
  inherited;
   for i:= 1 to 20 do
   TFloatField(CdsHistFaixa.FieldByName('nivel'+inttostr(i))).DisplayFormat  := ',0.00 ';

end;

procedure TfrmCadFaixa.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dbedCodigo.Enabled := True;
  EditaFaixaNivel := False;
  if (bbtnHistFaixa.Visible) then
    CdsHistFaixa.Data := CtrlListTerceirosRH.ListFaixaNivel(
     Cds.FieldByName('IDFAIXASALARIAL').asFloat , Sistema.IdEmpresa);
end;
 //END- William Santana SOL: 199707 - KINTANA: 1922320

end.
