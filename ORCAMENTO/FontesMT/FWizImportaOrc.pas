// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FWizImportaOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Mask, wwdbedit, Wwdbspin, uCtrlParamImportOrc, uCtrlPadroes, Db,
  Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, uMensErro, Menus, uCtrlSaldoOrcado,
  Grids, Wwdbigrd, Wwdbgrid, usistema, umodulo, wwriched, fProgresso, ppDB,
  ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, FPreview,

  uCtrlBlqEntDados;

type
  TfrmWizImportaOrc = class(TfrmWizardMT)
    Panel1: TPanel;
    spExercicioDest: TwwDBSpinEdit;
    Label3: TLabel;
    chkSobrescreve: TCheckBox;
    Panel2: TPanel;
    spLinIni: TwwDBSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbedJan: TwwDBEdit;
    dbedFev: TwwDBEdit;
    dbedMar: TwwDBEdit;
    dbedAbr: TwwDBEdit;
    dbedMai: TwwDBEdit;
    dbedJun: TwwDBEdit;
    dbedJul: TwwDBEdit;
    dbedAgo: TwwDBEdit;
    dbedSet: TwwDBEdit;
    dbedOut: TwwDBEdit;
    dbedNov: TwwDBEdit;
    dbedDez: TwwDBEdit;
    dbEdCodConta: TwwDBEdit;
    Label15: TLabel;
    cds: TCMClientDataSet;
    Ds: TwwDataSource;
    sqlSaldoOrc: TCMSqlParams;
    edtCaminho: TEdit;
    lblCaminho: TLabel;
    bitBtnAbrir: TBitBtn;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Salvar1: TMenuItem;
    Imprimir1: TMenuItem;
    OpenDialog1: TOpenDialog;
    cdsSaldoOrc: TCMClientDataSet;
    dsSaldoOrc: TwwDataSource;
    dbGrdSaldoOrcado: TwwDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    meErros: TwwDBRichEdit;
    ppFundacao: TppBDEPipeline;
    cdsFundacao: TCMClientDataSet;
    dsFundacao: TwwDataSource;
    sqlFundacao: TCMSqlParams;
    ppRApura: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText9: TppDBText;
    ppLabel19: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel9: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLabel309: TppLabel;
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppLabel10: TppLabel;
    ppBDEApura: TppBDEPipeline;
    PopupMenu2: TPopupMenu;
    Imprimir2: TMenuItem;
    ppLabel3: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure bitBtnAbrirClick(Sender: TObject);
    procedure dbGrdSaldoOrcadoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbGrdSaldoOrcadoDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Imprimir2Click(Sender: TObject);
    procedure ppRApuraBeforePrint(Sender: TObject);
    procedure ppShape1Print(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure cdsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    iordem: integer;
    bGravado : boolean;
    CtrlBlqEntDados: TCtrlBlqEntDados;
  public
    { Public declarations }
    procedure Progresso(vParam: array of Variant);
  end;

var
  frmWizImportaOrc : TfrmWizImportaOrc;
  CtrlSaldoOrcado    : TCtrlSaldoOrcado;
  CtrlParamImportOrc : TCtrlParamImportOrc;

implementation

{$R *.DFM}

procedure TfrmWizImportaOrc.FormCreate(Sender: TObject);
begin
  inherited;
  bGravado := false;
  CtrlSaldoOrcado := TCtrlSaldoOrcado.Create;
  CtrlSaldoOrcado.InitializeAs(Padroes);
  CtrlSaldoorcado.CdsSaldoorcado := cdsSaldoOrc;
  CtrlSaldoOrcado.Progresso := Progresso;

  CtrlParamImportOrc := TCtrlParamImportOrc.Create;
  CtrlParamImportOrc.InitializeAs(Padroes);

  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(Padroes);

  CtrlParamImportOrc.CdsParamImportOrc := cds;
  spExercicioDest.Text := formatDateTime('YYYY', date);
  spExercicioDest.Value := spExercicioDest.Value + 1;
  spLinIni.Value := 1;
  cds.data := CtrlParamImportOrc.GetParam;

  if cds.IsEmpty then
    cds.Insert
  else
    cds.Edit;

  cds.fieldByName('IDPARAMIMPORTORC').asInteger := 1;

  edtCaminho.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

end;

procedure TfrmWizImportaOrc.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlBlqEntDados);
  CtrlParamImportOrc.Free;
  CtrlSaldoOrcado.Free;
  inherited;
end;

procedure TfrmWizImportaOrc.btnContinuarClick(Sender: TObject);
var
 iMes: integer;

begin
  bGravado := false;
  if spExercicioDest.value <= 0 then
  begin
    MsgDlg( 'O campo "Exercício" deve ser preenchido.', 'Erro', mtError, [ mbOk ], 0 );
    spExercicioDest.SetFocus;
    Abort;
  end;


  for iMes := 1 to 12 do
  begin
     if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,
                                             iMes,trunc(spExercicioDest.value)) then
     begin
        MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
        Exit;
     end;
  end;


  if spLinIni.value <= 0 then
  begin
    MsgDlg( 'O campo "Linha Inic. da planilha" deve ser preenchido.', 'Erro', mtError, [ mbOk ], 0 );
    spExercicioDest.SetFocus;
    Abort;
  end;

  if trim(dbEdCodConta.Text) = '' then
  begin
    MsgDlg( 'O campo "Coluna Cód. Conta" deve ser preenchido.', 'Erro', mtError, [ mbOk ], 0 );
    dbEdCodConta.SetFocus;
    Abort;
  end;


  //if (trim(edtCaminho.Text) = '') or (trim(edtCaminho.Text) = 'C:\') then
  if (trim(edtCaminho.Text) = '') or (trim(edtCaminho.Text) = Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)) then//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  begin
    MsgDlg( 'O campo "Caminho completo da planilha" deve ser preenchido.', 'Erro', mtError, [ mbOk ], 0 );
    edtCaminho.SetFocus;
    Abort;
  end;

  cds.Post;
  if not CtrlParamImportOrc.Grava then
  begin
    MsgDlg( CtrlParamImportOrc.MessageInfo, 'Erro', mtError, [ mbOk ], 0 );
    abort;
  end;

  inherited;

  btnConfirmar.Enabled := false;
  bbtnSair.Enabled := false;

  cdsSaldoOrc.Close;
  cdsSaldoOrc.data := CtrlSaldoOrcado.ImportaPlanilha(trim(edtCaminho.Text), trunc(spLinIni.value),
                                       trim(dbEdCodConta.text), trim(dbedJan.text),
                                       trim(dbedFev.text), trim(dbedMar.text),
                                       trim(dbedAbr.text), trim(dbedMai.text),
                                       trim(dbedJun.text), trim(dbedJul.text),
                                       trim(dbedAgo.text), trim(dbedSet.text),
                                       trim(dbedOut.text), trim(dbedNov.text),
                                       trim(dbedDez.text), trunc(spExercicioDest.Value),
                                       sistema.Idempresa, modulo.iPlanoOrc, sistema.idusuario);
  TFloatField(cdsSaldoOrc.fieldByName('VLRORCADO')).DisplayFormat := '#,##0.00';
  cdsSaldoOrc.EnableControls;

  btnConfirmar.Enabled := (not cdsSaldoOrc.IsEmpty) and (not CtrlSaldoOrcado.bCancelaImportacao);
  bbtnSair.Enabled := true;
end;

procedure TfrmWizImportaOrc.btnVoltarClick(Sender: TObject);
begin
  inherited;
  cds.Edit;
  btnConfirmar.Enabled := false;
  bGravado := false;
end;

procedure TfrmWizImportaOrc.bitBtnAbrirClick(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    edtCaminho.text := OpenDialog1.FileName;
  end;
  edtCaminho.Repaint;
end;

procedure TfrmWizImportaOrc.dbGrdSaldoOrcadoTitleButtonClick(Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;
begin
  inherited;

  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  cdsSaldoOrc.IndexName := '';
  cdsSaldoOrc.IndexDefs.Clear;
  IndexDef := cdsSaldoOrc.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  cdsSaldoOrc.IndexName := IndexDef.Name;
  cdsSaldoOrc.First;

end;


procedure TfrmWizImportaOrc.dbgrdSaldoOrcadoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if (cdsSaldoOrc.Active) then
  begin
    dbgrdSaldoOrcado.Canvas.Font.Color := clBlack;
    if ( cdsSaldoOrc.RecNo mod 2 ) = 0 then
      dbgrdSaldoOrcado.Canvas.Brush.Color := $EEEEEE
    else
      dbgrdSaldoOrcado.Canvas.Brush.Color := clWhite;

    dbgrdSaldoOrcado.DefaultDrawDataCell( Rect, Field, State );
  end;
end;


procedure TfrmWizImportaOrc.Progresso(vParam: array of Variant);
begin
//  Legenda do FormProgresso
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//   vParam[2] :  Mínimo de Registros  (em cima)
//   vParam[3] :  Total de Registros   (em cima)
//   vParam[4] :  Registro Atual       (em cima)
//   vParam[5] :  Legenda              (em cima)

//   vParam[6] :  Mínimo de Registros  (em baixo)
//   vParam[7] :  Total de Registros   (em baixo)
//   vParam[8] :  Registro Atual       (em baixo)
//   vParam[9] :  Legenda              (em baixo)
//   vParam(10]:  Retorno de mensagem/resultado

  // Desabilita todos os formulários com exceção de FrmProgress

   if CtrlSaldoOrcado.bCancelaImportacao then
   begin
     vParam[6] := '';
     meErros.Text := 'Processo cancelado pelo usuário.';
     cdsSaldoOrc.Close;
     btnConfirmar.Enabled := false;
   end;

   case vParam[1] of
      // -------------------------------------------------------------------------------------------
      0:
      begin
         meErros.Text := '';

         frmprogresso.MostraFormprogresso(vParam[0], true, true true, vParam[2], vParam[3]);

      end;
      // -------------------------------------------------------------------------------------------
      1:
      begin
         frmprogresso.Max  := vParam[3];

         frmprogresso.lblProgress.Caption := vParam[0];
         frmprogresso.AndaFormprogresso(vParam[4], vParam[3]);
      end;
      // -------------------------------------------------------------------------------------------
      2:
      begin
         frmprogresso.EscondeFormprogresso;
         if Trim(vParam[6]) <> '' then
           meErros.Text := meErros.Text + vParam[6];
      end;
   end;

   CtrlSaldoOrcado.bCancelaImportacao := frmprogresso.Cancelou;
end;


procedure TfrmWizImportaOrc.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if MsgDlg('Deseja realmente gravar o orçamento gerado?', 'Gravação do orçamento', mtWarning, [mbYes,mbNo], 0) = IdYes then
  begin
    btnConfirmar.Enabled := false;
    if chkSobrescreve.Checked then // se sobrescreve entao deleta para inserir novamente
    begin
      cdsSaldoOrc.DisableControls;
      cdsSaldoOrc.First;
      CtrlSaldoorcado.StartTransaction;

      try // exclui os registros já existentes para serem reescritos
        while not cdsSaldoOrc.eof do
        begin
            CtrlSaldoorcado.Exclui(cdsSaldoOrc.fieldByName('IDCONTAORCAMEN').asString,
                                   cdsSaldoOrc.fieldByName('PERIODO').asInteger,
                                   cdsSaldoOrc.fieldByName('EXERCICIO').asInteger,
                                   cdsSaldoOrc.fieldByName('IDPESSOA').asInteger,
                                   cdsSaldoOrc.fieldByName('IDPLANOORCAMEN').asInteger);
            cdsSaldoOrc.next;
        end;//while

        CtrlSaldoorcado.Commit;
      except
        CtrlSaldoorcado.Rollback;
        MsgDlg('Gravação do orçamento não efetuada. ERRO:'+ CtrlSaldoorcado.MessageInfo +#13#10, 'Gravação do orçamento', mtError, [mbOK], 0);
        abort;
      end;
      cdsSaldoOrc.EnableControls;
    end;

    //inclui os novos registros
    bGravado := CtrlSaldoorcado.AplicaOperacaoSaldoOrcado;

    if bGravado then
    begin
      btnConfirmar.Enabled := false;
      MsgDlg('Orçamento gravado com sucesso.', 'Gravação do orçamento', mtWarning, [mbOK], 0);
      meErros.Lines.add('Orçamento gravado com sucesso.');
    end
    else
    begin
      MsgDlg('Gravação do orçamento não efetuada. ERRO:'+ CtrlSaldoorcado.MessageInfo +#13#10, 'Gravação do orçamento', mtError, [mbOK], 0);
      meErros.Lines.add('Gravação do orçamento não efetuada. ERRO:'+ CtrlSaldoorcado.MessageInfo);
      bGravado := false;
    end;
  end;

end;

procedure TfrmWizImportaOrc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
  if bGravado then
    inherited
  else if (MsgDlg('A importação não foi gravada. Deseja realmente sair ?', 'Importação do orçamento', mtWarning, [mbYes,mbNo], 0) = IdYes) then
    inherited
  else begin
    action := caNone;
  end;
end;

procedure TfrmWizImportaOrc.Imprimir2Click(Sender: TObject);
begin
  inherited;
  cdsSaldoOrc.DisableControls;
  TFrmPreview.CreateModalPreview(Application, ppRApura, 'Apuração orçametária');
  cdsSaldoOrc.EnableControls;
end;

procedure TfrmWizImportaOrc.ppRApuraBeforePrint(Sender: TObject);
begin
  inherited;
  cdsFundacao.Close;
  sqlFundacao.Open;
end;

procedure TfrmWizImportaOrc.ppShape1Print(Sender: TObject);
begin
  inherited;
  ppShape1.visible := not ppShape1.visible;
end;

procedure TfrmWizImportaOrc.Salvar1Click(Sender: TObject);
begin
  inherited;
  meErros.PlainText := true;
  saveDialog1.Execute;
  if trim(saveDialog1.FileName) <> '' then
    meErros.Lines.saveToFile(saveDialog1.FileName);
end;

procedure TfrmWizImportaOrc.Imprimir1Click(Sender: TObject);
begin
  inherited;
  meErros.Print('');
end;

procedure TfrmWizImportaOrc.cdsBeforePost(DataSet: TDataSet);
begin
  inherited;
 if DataSet.FieldByName('IDMODULO').IsNull then
      DataSet.FieldByName('IDMODULO').Value := Sistema.IdModulo;
end;

end.
