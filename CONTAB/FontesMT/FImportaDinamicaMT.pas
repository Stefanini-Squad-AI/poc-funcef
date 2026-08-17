unit FImportaDinamicaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBTables, Wwquery, ExtCtrls, StdCtrls,
  ComCtrls, wwdblook, MAHlpBtn, Buttons, TB97Tlbr, TB97, IvDictio, IvMulti,
  IvEMulti,uCtrlProcessaContab,uCtrlContaContabil,uCtrlContab,uCtrlListTerceiros,
  DBClient, uCMClientDataSet,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmImportaDinamicaMT = class(TfrmSairAjuda)
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    opdlgtxt: TOpenDialog;
    Panel4: TPanel;
    cdsPlanoConta: TCMClientDataSet;
    cdsTipoOper: TCMClientDataSet;
    Bevel2: TBevel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    prbImportar: TProgressBar;
    Animate1: TAnimate;
    Label4: TLabel;
    Label1: TLabel;
    edtPath: TEdit;
    btnSelecionar: TBitBtn;
    lblPlano: TLabel;
    Label5: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    dblkPlano: TwwDBLookupCombo;
    chkHist: TCheckBox;

    {Procedimentos Delphi}
    procedure btnImportarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    iPlano :Integer;
    sTipoOper :String;
    bTestaConta :Boolean;
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlContaContabil  :TCtrlContaContabil;
    CtrlListTerceiros  :TCtrlListTerceiros;
    procedure ProcMensDI(msg: String);

  public
    { Public declarations }
  end;

var
  frmImportaDinamicaMT: TfrmImportaDinamicaMT;

implementation


{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,uSistema,uString;
var
  StlArqTexto :TStringList;
  iContMax :LongInt;


{ -----------------------------------------------------------------------------}
{                                                                              }
{ Importação de Lançamentos Externos - TELA REFEITA                            }
{                                                                              }
{ Autor : Antônio Jorge M.Rodrigues                                            }
{ Data de Início  : 22/03/99                                                   }
{ Data de Término : 22/03/99                                                   }
{ Última Revisão  : 22/03/99 (Veronica Almeida                                 }
{                                                                              }
{ -----------------------------------------------------------------------------}



procedure TfrmImportaDinamicaMT.btnImportarClick(Sender: TObject);
var
  iModulo :Integer;
  ArquivoLog : TextFile;
begin
   if dblkPlano.Text <> '' then
   begin
      iPlano :=  StrToInt(dblkPlano.LookupValue);
   end;

   If not CtrlContaContabil.BuscaMascaraConta(iPlano) then
   begin
      MsgDlg('Máscara do Plano de Contas não Cadastrada.','Aviso',mtWarning,[mbOk],0);
      exit;
   end;

   iModulo := 1;
   if MsgDlg('Deseja que os dados sejam importados e INTEGRADOS com a Contabilidade?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
      bTestaConta := True;
   end else begin
      bTestaConta := False;
   end;

   mmLog.Lines.Clear;
   mmLog.Lines.Add('----------------------------------------------------');
   mmLog.Lines.Add('******** Planilhas Geradas ************');
   mmLog.Lines.Add('----------------------------------------------------');
   mmLog.Lines.Add(' ');


   If CtrlProcessaContab.ImportaFolhaDinamica(StlArqTexto,sTipoOper, edtPath.text,iModulo,
                                          Sistema.IdUsuario,iPlano, iContMax,
                                          Sistema.IdEmpresa,Sistema.UsaPlanoPatro,
                                          bTestaConta,chkHist.Checked) then
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   End;
   btnImportar.enabled := False;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlProcessaContab.sMensAPS_Log);
   End;

   AssignFile(ArquivoLog,Copy(trim(edtPath.Text),1,Pos('.',trim(edtPath.Text)))+ 'LOG');
   ReWrite(ArquivoLog);
   Try
     WriteLn(ArquivoLog,CtrlProcessaContab.sMensAPS);
   Finally
     CloseFile(ArquivoLog);
   End;

   mmLog.Lines.Add(CtrlProcessaContab.MessageInfo);
   edtPath.Text := '';
end;



procedure TfrmImportaDinamicaMT.btnSelecionarClick(Sender: TObject);
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



procedure TfrmImportaDinamicaMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensDI);

  StlArqTexto := TStringList.Create;

end;



procedure TfrmImportaDinamicaMT.ProcMensDI(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
      mmLog.Lines.Add(msg);

    prbImportar.Position := CtrlProcessaContab.Progresso;
    Application.ProcessMessages;
  End;
end;

procedure TfrmImportaDinamicaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlContaContabil.free;
  CtrlListTerceiros.free;
  StlArqTexto.free;


end;

end.
