unit FImportaSAFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBTables, Wwquery, ExtCtrls, StdCtrls,
  ComCtrls, wwdblook, MAHlpBtn, Buttons, TB97Tlbr, TB97, IvDictio, IvMulti,
  IvEMulti, Mask, wwdbedit, Wwdbspin,uCtrlProcessaContab,uCtrlContaContabil,
  uCtrlContab,uCtrlListTerceiros, DBClient, uCMClientDataSet,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmImportaSAFMT = class(TfrmSairAjuda)
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    opdlgtxt: TOpenDialog;
    Panel3: TPanel;
    lblPlano: TLabel;
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    dblkPlano: TwwDBLookupCombo;
    Label5: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    Label1: TLabel;
    dbspCommit: TwwDBSpinEdit;
    Label6: TLabel;
    cdsPlanoConta: TCMClientDataSet;
    cdsTipoOper: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPlanoPatro: TCMClientDataSet;
    Label7: TLabel;
    Bevel2: TBevel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    Label4: TLabel;
    prbImportar: TProgressBar;
    Animate1: TAnimate;
    Bevel1: TBevel;

    {Procedimentos Delphi}
    procedure btnImportarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    iPlano :Integer;
    sTipoOper :String;
    bTestaConta :Boolean;
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlContaContabil  :TCtrlContaContabil;
    CtrlListTerceiros :TCtrlListTerceiros;
    procedure ProcMensSAF(msg: String);

  public
    { Public declarations }
  end;

var
  frmImportaSAFMT: TfrmImportaSAFMT;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uString;

var
  iContMax :LongInt;
  StlArqTexto :TStringList;

  {$R *.DFM}


procedure TfrmImportaSAFMT.btnImportarClick(Sender: TObject);
var
  iModulo,iPlanoPrev,iPlanoPatro :Integer;
  ArquivoLog  :TextFile;

begin
   iModulo := 1;
   iPlanoPrev  := 0;
   iPlanoPatro := 0;
   if Sistema.UsaPlanoPatro then begin
      if dblcPlanoPrevC.text = '' then begin
         MsgDlg('Plano Previdenciário não preenchido.','Aviso',mtWarning,[mbOk],0);
         dblcPlanoPrevC.SetFocus;
         Exit;
      end;
      if dblcPatroC.text = '' then begin
         MsgDlg('Patrocinadora não preenchida.','Aviso',mtWarning,[mbOk],0);
         dblcPatroC.SetFocus;
         Exit;
      end;
     iPlanoPrev  :=  StrToInt(dblcPlanoPrevC.LookupValue);
     iPlanoPatro :=  StrToInt(dblcPatroC.LookupValue);
   end;

   if dblkPlano.Text <> '' then
   begin
      iPlano :=  StrToInt(dblkPlano.LookupValue);
   end;

   If not CtrlContaContabil.BuscaMascaraConta(iPlano) then
   begin
      MsgDlg('Máscara do Plano de Contas não Cadastrada.','Aviso',mtWarning,[mbOk],0);
      exit;
   end;

   if MsgDlg('Deseja que os dados sejam importados e INTEGRADOS com a Contabilidade?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
      bTestaConta := True;
   end else begin
      bTestaConta := False;
   end;

   mmLog.Lines.Add('---------------------------------------');
   mmLog.Lines.Add('*** Planilhas Processadass ***');
   mmLog.Lines.Add('---------------------------------------');
   mmLog.Lines.Add(' ');

   If CtrlProcessaContab.ImportaSAF(StlArqTexto,sTipoOper, edtPath.text,iModulo,
                                Sistema.IdUsuario,iPlano,iPlanoPrev,iPlanoPatro,
                                Trunc(dbspCommit.Value),iContMax, Sistema.IdEmpresa,Sistema.UsaPlanoPatro,
                                bTestaConta) then
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlProcessaContab.sMensAPS_Log);
   End;

   AssignFile(ArquivoLog,Copy(trim(edtPath.Text),1,Pos('.',trim(edtPath.Text)))+ 'LOG');
   ReWrite(ArquivoLog);
   Try
     WriteLn(ArquivoLog,CtrlProcessaContab.sMensAPS_Log);
   Finally
     CloseFile(ArquivoLog);
   End;

   mmLog.Lines.Add(CtrlProcessaContab.MessageInfo);
   edtPath.Text := '';

end;



procedure TfrmImportaSAFMT.btnSelecionarClick(Sender: TObject);
begin

   inherited;
   mmLog.Clear;
   prbImportar.Position := 0;

   StlArqTexto.Clear;

   //Abre a tela de "Abrir arquivo..."
   Try
      OpDlgTxt.Execute;
      edtPath.Text := OpDlgTxt.FileName;
      StlArqTexto.LoadFromFile(OpDlgTxt.FileName);
   Except
      MsgDlg('Houve um erro na abertura do arquivo texto.','Aviso',mtError,[mbOk],0);
   End;
   prbImportar.Max   := StlArqTexto.Count;
   iContMax          := StlArqTexto.Count;

end;



procedure TfrmImportaSAFMT.FormCreate(Sender: TObject);
begin

   inherited;
  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  iPlano    := CtrlContab.PlanoParam;
  sTipoOper := CtrlContab.TipoOperImp;

  // *** Instancia a classe Contacontabil ***
  CtrlListTerceiros := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsTipoOper.Data   := CtrlListTerceiros.ListTipoOper(False);
  cdsPlanoPrev.Data  := CtrlListTerceiros.ListPlanoPrev;
  cdsPlanoPatro.Data := CtrlListTerceiros.ListPlanoPatro;

  // *** Instancia a classe Contacontabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);


  CdsPlanoConta.Data := CtrlContaContabil.ListPlanosContas(Sistema.IdEmpresa);


  dblkPlano.LookupValue    := IntToStr(iPlano);
  dblkTipoOper.LookupValue := sTipoOper;

  // *** Instancia a classe lancamento ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensSAF);

  StlArqTexto := TStringList.Create;

end;



procedure TfrmImportaSAFMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StlArqTexto.free;
   inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlContaContabil.free;
  CtrlListTerceiros.free;

end;



procedure TfrmImportaSAFMT.ProcMensSAF(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
      mmLog.Lines.Add(msg);

    prbImportar.Position := CtrlProcessaContab.Progresso;
    Application.ProcessMessages;
  End;

end;

end.
