unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TrayIcon, Menus, AppEvnts, ImgList, ComCtrls, StdCtrls, ToolWin, ExtCtrls,
  ActnList, EditReg, Buttons, BfDialogs, BrowseFolder, uCmExecuteFile, uProcuraDir,
  DBTables, Db, Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, ZipMstr, JclMapi;
Const
  HKEY_SOFTWARE_ROOT = 'Software\CM\ProjectBuilder50\';
  HKEY_SOFTWARE_ROOT_PATH = HKEY_SOFTWARE_ROOT + 'Paths';
  HKEY_SOFTWARE_ROOT_DPLS = HKEY_SOFTWARE_ROOT + 'Dpls';
  HKEY_SOFTWARE_ROOT_OBJ =  HKEY_SOFTWARE_ROOT + 'Obj';
  HKEY_SOFTWARE_ROOT_PARAMS = HKEY_SOFTWARE_ROOT + 'Params';
  ISTOLLFOLDERFILE = '\Inno Setup\Compil32.Exe';
  DCC32FOLDERFILE = '\Dcc32\DCC32.EXE';
  INSTALACMFOLDER = '\InstalaCM\';
  INSTALACMFILE = INSTALACMFOLDER + 'InstalaCM.iss';
  ATUALIZACMFOLDER = '\AtualizaCM\';
  ATUALIZAOBJCMFOLDER = '\AtualizaOBJCM\';
  ATUALIZACMFILE = ATUALIZACMFOLDER + 'AtualizaCM.iss';
  ATUALIZAOBJCMFILE = ATUALIZAOBJCMFOLDER + 'AtualizaObjCM.iss';
  PADROESCMFOLDER = '\PadroesCM\';
  PADROESCMFILE = PADROESCMFOLDER + 'PadroesCM.iss';
  ATUALIZAFRONTCMFOLDER = '\AtualizaFrontCM\';
  ATUALIZAFRONTCMFILE = ATUALIZAFRONTCMFOLDER + 'AtualizaFrontCM.iss';
  SYSTEM32_PATH = 'C:\WinNt\System32';
  WORK_BASE_DIR = 'D:\';
  PADROESCM5_PATH = WORK_BASE_DIR + 'ProjetosCM5\CM\Packages';
  PADROESCM5C_PATH = 'C:\ProjetosCM5\CM\Packages';
  PADROESCM5C_ROOTPATH = 'C:\ProjetosCM5\CM';
  USA_CMBACK = 001;
  USA_COBRCM = 010;
  USA_REGRA = 100;
  //PATH_HIST_FONTES = '\\cmbkp\Versoes-Delphi-Prev\';
  PATH_HIST_FONTES = '\\Cmapl\VersaoCMPrev\Bkp\';

type
  TStatusOperacao = (soInProgress, soFail, soOk);

  TFrmPrincipal = class(TForm)
    TIcon: TTrayIcon;
    PpmPrincipal: TPopupMenu;
    MnuApptitle: TMenuItem;
    N1: TMenuItem;
    MnuExibirAplicao: TMenuItem;
    MnuMinimizarAplicao: TMenuItem;
    N2: TMenuItem;
    MnuBuildAll: TMenuItem;
    MnuBuildProjects: TMenuItem;
    MnuBuildInstal: TMenuItem;
    MnuBackup: TMenuItem;
    N3: TMenuItem;
    MnuSair: TMenuItem;
    AppPrincipal: TApplicationEvents;
    ImlListaPkg: TImageList;
    AclPrincipal: TActionList;
    AclInserir: TAction;
    AclExcuir: TAction;
    AclMoveDown: TAction;
    AclMoveUp: TAction;
    DlgPkg: TOpenDialog;
    ActSave: TAction;
    DlgPath: TProcuraDirDlg;
    LiberaVersoFTP1: TMenuItem;
    PgPBuilder: TPageControl;
    TbsParametros: TTabSheet;
    TbsCompilacao: TTabSheet;
    CkbCompPadroes: TCheckBox;
    CkbCompilaModulos: TCheckBox;
    CknGeraBeta: TCheckBox;
    CkbComplFront: TCheckBox;
    CkbLiberaFtp: TCheckBox;
    CkbMensErro: TCheckBox;
    Bevel1: TBevel;
    ReMensCompilador: TRichEdit;
    PnlResOper: TPanel;
    PnlStatusComp: TPanel;
    PnlDescResOper: TPanel;
    LblCompPadroes: TLabel;
    LblCompModulos: TLabel;
    LblLiberaFtp: TLabel;
    LblGeraPadroes: TLabel;
    LblCompFront: TLabel;
    LblExibeMens: TLabel;
    BtnExecute: TBitBtn;
    ActMarcarTodos: TAction;
    ActInverterSelecao: TAction;
    CkbGeraInst: TCheckBox;
    CkbCopiaInst: TCheckBox;
    LblCopiaInstal: TLabel;
    LblGeraInstal: TLabel;
    PnlCompl: TPanel;
    LblCompl: TListBox;
    PnlErro: TPanel;
    LbErro: TListBox;
    TbsArquivos: TTabSheet;
    Label1: TLabel;
    PnlCtrls: TPanel;
    ToolBar1: TToolBar;
    BtnInserir: TToolButton;
    BtnExclui: TToolButton;
    ToolButton3: TToolButton;
    BtnDown: TToolButton;
    BtnUp: TToolButton;
    ToolButton2: TToolButton;
    BtnMarcarTodos: TToolButton;
    BtnInverterSele: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    LblPadroesRede: TLabel;
    LblFontesRede: TLabel;
    LblPadroesLocal: TLabel;
    LblFontesLocal: TLabel;
    LblInstRede: TLabel;
    LblInstLocal: TLabel;
    BtnPadroesRede: TSpeedButton;
    BtnFontesRede: TSpeedButton;
    BtnInstRede: TSpeedButton;
    Label2: TLabel;
    EdtPadroesRede: TEditReg;
    EdtFontesRede: TEditReg;
    EdtInstRede: TEditReg;
    EdtPadroesLocal : TEditReg;
    EdtFontesLocal: TEditReg;
    EdtInstLocal: TEditReg;
    EdtversaoPadrao: TEditReg;
    BtnInstLocal: TSpeedButton;
    BtnFontesLocal: TSpeedButton;
    BtnPadroesLocal: TSpeedButton;
    Bevel2: TBevel;
    LblExecsRede: TLabel;
    EdtExecRede: TEditReg;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    qryModulo: TwwQuery;
    qryModuloIDMODULO: TFloatField;
    qryModuloNOMEMODULO: TStringField;
    qryModuloNOMEPROJETO: TStringField;
    qryModuloVERSAO: TStringField;
    qryModuloCOMPILADO: TStringField;
    qryModuloCOPIAFONTES: TDateTimeField;
    qryModuloDPL: TFloatField;
    qryModuloFLGGRUPODESENV: TStringField;
    qryModuloUSURESPONSAVEL: TStringField;
    qryModuloGERENTEPROJETO: TStringField;
    qryModuloEMAIL: TStringField;
    qryModuloEMAILGERENTE: TStringField;
    updModulo: TUpdateSQL;
    dbSAD: TDatabase;
    GrdModulo: TwwDBGrid;
    DsModulo: TwwDataSource;
    ActRefresh: TAction;
    ZipExtrFontes: TZipMaster;
    QryDirModulo: TwwQuery;
    Panel1: TPanel;
    ToolBar2: TToolBar;
    BtnSelAll: TToolButton;
    BtnInvSel: TToolButton;
    ToolButton16: TToolButton;
    BtnRefresh: TToolButton;
    TbsVersoesFuncef: TTabSheet;
    Label3: TLabel;
    Label5: TLabel;
    LbAssoc: TListBox;
    LbLiberado: TListBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    BtnTransFere: TBitBtn;
    LblProgress: TLabel;
    EdtDestino: TEditReg;
    MemLog: TMemo;
    CkbCopyInstal: TCheckBox;
    CkbVersoes: TCheckBox;
    CkbFontes: TCheckBox;
    Bevel3: TBevel;
    TmrCompilacao: TTimer;
    CkbAutomatico: TCheckBox;
    CkbSendMail: TCheckBox;
    QryDirModuloDIRFONTES: TMemoField;
    QryDirModuloLISTABPL: TMemoField;
    QryDirBpl: TwwQuery;
    QryDirBplDIRFONTES: TMemoField;
    CkbCompilaDll: TCheckBox;
    PgPackage: TPageControl;
    TbsPadroes: TTabSheet;
    TbsObj: TTabSheet;
    LvPackages: TListView;
    LstvObj: TListView;
    Label7: TLabel;
    EdtObjNegocio: TEditReg;
    CkbCompilaSemPadrao: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MnuMinimizarAplicaoClick(Sender: TObject);
    procedure MnuSairClick(Sender: TObject);
    procedure AppPrincipalMinimize(Sender: TObject);
    procedure AclInserirUpdate(Sender: TObject);
    procedure AclExcuirExecute(Sender: TObject);
    procedure AclMoveDownExecute(Sender: TObject);
    procedure AclMoveUpExecute(Sender: TObject);
    procedure AclInserirExecute(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
    procedure BtnPadroesRedeClick(Sender: TObject);
    procedure CkbCompPadroesClick(Sender: TObject);
    procedure BtnExecuteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActMarcarTodosExecute(Sender: TObject);
    procedure ActInverterSelecaoExecute(Sender: TObject);
    procedure ActRefreshExecute(Sender: TObject);
    procedure ZipExtrFontesProgress(Sender: TObject; ProgrType: ProgressType;
      Filename: String; FileSize: Integer);
    procedure MnuExibirAplicaoClick(Sender: TObject);
    procedure BtnSelAllClick(Sender: TObject);
    procedure BtnInvSelClick(Sender: TObject);
    procedure BtnTransFereClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure TmrCompilacaoTimer(Sender: TObject);
  private
    { Private declarations }
    bCompilouPadrao: Boolean;
    bCompilouObj: Boolean;

    bSoBplFront: Boolean;
    CmExecuteFile: TCmExecuteFile;
    procedure LogErro(sMensagem: String);
    Function CompilaPadroes(sDpl,sPathDpl :String):Boolean;
    Function GeraInstaladores:Boolean;
    Function ExecutaArquivo(sNomeArquivo, sParams, sLogFileName,
             sCompilador: String; bRun, bDpl, bSaveLog: Boolean) :Boolean;
    Function CopiaInstaladores:Boolean;
    Function CopyFiles(sPathOrigem, SPathDestino, sMascara :String) :Boolean;
    Procedure SetStatusLabel(lbl :TLabel; Status:TStatusOperacao);
    function CompilaModulo(sNomeZcm: String; buildAll :Boolean): Boolean;
    function ExtraiFontes(sNomeZcm: String): Boolean;
    function IsBpl(sNomeZcm: String): Boolean;
    function CopiaExe: boolean;
    function BackupFontes(sNomeZcm :String):Boolean;
    procedure SendMail(bError: Boolean; sNomeZcm:string);
    function GetNomeLog(sNomeZcm: String): String;
    function GetNomeDpr: String;
    function GetPathDpr: string;
    function GetExtensaoProjeto: String;
    function GetCompPasta: String;
    procedure CriaDiretorio(sPathName :String; bDelTree :Boolean = False);
    function AchaETroca(const sOldStr, sNewStr, sStr: String): String;
    function GetBplList: string;
    function GetBplListPath: string;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.DFM}

Uses uCmRegister,  JclFileUtils, JclShell, uString, inifiles, uCMOracleInt, JclStrings;

Function TFrmPrincipal.GetBplList:string;
Begin
   With QryDirModulo Do
   Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      Params[0].AsFloat := qryModuloIDMODULO.AsFloat;
      Open;
   End;

   Result := QryDirModuloLISTABPL.AsString;
End;

Function TFrmPrincipal.GetBplListPath:string;
Var
   sAux: String;
Begin
   Result := '';

   With QryDirBpl Do
   Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      Params[0].AsFloat := qryModuloIDMODULO.AsFloat;
      Open;

       While Not Eof Do
       Begin
          Result := Result + ';' + QryDirBplDIRFONTES.AsString;
          Next;
       End;

       If Trim(Result) <> '' Then
       Begin
          Result := Result + ';';
          sAux := Result;

          Result := AchaETroca('C:\', WORK_BASE_DIR,sAux);
       End;
   End;
End;

Function TFrmPrincipal.GetPathDpr:string;
Begin
   With QryDirModulo Do
   Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      Params[0].AsFloat := qryModuloIDMODULO.AsFloat;
      Open;
   End;

   If pos(';',QryDirModuloDIRFONTES.AsString) = 0 Then
      Result := PathAddSeparator(QryDirModuloDIRFONTES.AsString)
   Else
      Result := PathAddSeparator(Copy(QryDirModuloDIRFONTES.AsString,1,pos(';',QryDirModuloDIRFONTES.AsString) - 1));

   Result := WORK_BASE_DIR + Copy(Result,4,Length(Result));
End;

Function TFrmPrincipal.GetNomeDpr:String;
Begin
   Result := GetPathDpr + Trim(qryModuloNOMEPROJETO.AsString) + '.Dpr';
End;


procedure TFrmPrincipal.FormCreate(Sender: TObject);
Var
  CmRegister :TCmRegister;
  ListFiles :TStringList;
  X: Integer;

  procedure LoadDplList(Lstv: TListView; sChave: String);
  Var
    X, iNumDpl :Integer;
    LIntem :TListItem;
    sAux :String;
  Begin
    iNumDpl := StrToIntDef(CmRegister.LerStringReg(HKEY_CURRENT_USER,sChave,'NumDpl','0'),12);

    For X:=0 To iNumDpl - 1 Do
    Begin
       sAux := CmRegister.LerStringReg(HKEY_CURRENT_USER,sChave,'Dpl' + IntToStr(X + 1),'');
       LIntem := Lstv.Items.Add;
       LIntem.Caption := Copy(sAux,1,Pos('#',sAux)-1);
       sAux := Copy(sAux,Pos('#',sAux)+1,Length(sAux));
       LIntem.SubItems.Add(Copy(sAux,1,Pos('#',sAux)-1));
       sAux := Copy(sAux,Pos('#',sAux)+1,Length(sAux));
       LIntem.SubItems.Add(sAux);
    End;
  End;

begin
  TCMOracleInt.AddAlias('PREVSEGUR','CMDB1A','1521','PREVSUPR',True);
  Application.ProcessMessages;

  Try
    dbSAD.Connected := True;
  except
    On E:Exception Do
    Begin
       Application.MessageBox(Pchar('Erro conectar com o serviço CmSegur' + (#13+#10) + E.Message),
                              'Erro!',Mb_IconStop);

       Halt;
    End;
  End;

  If qryModulo.Active Then qryModulo.Close;
  qryModulo.Open;

  CmExecuteFile := TCmExecuteFile.Create;

  PgPBuilder.ActivePage := TbsArquivos;

  EdtversaoPadrao.RegPath := HKEY_SOFTWARE_ROOT_PARAMS;
  EdtversaoPadrao.RegKey := 'HKEY_CURRENT_USER';

  EdtPadroesRede.RegPath := HKEY_SOFTWARE_ROOT_PATH;
  EdtPadroesRede.RegKey := 'HKEY_CURRENT_USER';

  EdtFontesRede.RegPath := HKEY_SOFTWARE_ROOT_PATH;
  EdtFontesRede.RegKey := 'HKEY_CURRENT_USER';

  EdtInstRede.RegPath := HKEY_SOFTWARE_ROOT_PATH;
  EdtInstRede.RegKey := 'HKEY_CURRENT_USER';

  EdtPadroesLocal.RegPath := HKEY_SOFTWARE_ROOT_PATH;
  EdtPadroesLocal.RegKey := 'HKEY_CURRENT_USER';

  EdtFontesLocal.RegPath := HKEY_SOFTWARE_ROOT_PATH;
  EdtFontesLocal.RegKey := 'HKEY_CURRENT_USER';

  EdtInstLocal.RegPath := HKEY_SOFTWARE_ROOT_PATH;
  EdtInstLocal.RegKey := 'HKEY_CURRENT_USER';

  EdtExecRede.RegPath := HKEY_SOFTWARE_ROOT_PATH;
  EdtExecRede.RegKey := 'HKEY_CURRENT_USER';

  EdtDestino.RegPath := HKEY_SOFTWARE_ROOT_PATH;
  EdtDestino.RegKey := 'HKEY_CURRENT_USER';

  Application.ShowMainForm := False;
  TIcon.ToolTip := Application.Title;
  TIcon.Icon := Application.Icon;
  TIcon.Active := True;
  MnuApptitle.Caption := Application.Title + ' v5.01.01';
  Caption := MnuApptitle.Caption;

  CmRegister := TCmRegister.Create;
  Try
     LoadDplList(LvPackages, HKEY_SOFTWARE_ROOT_DPLS);
     LoadDplList(LstvObj, HKEY_SOFTWARE_ROOT_OBJ);

     CkbCompPadroes.Checked := CmRegister.LerBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'CompilaPadrao',True);
     CkbCompilaModulos.Checked := CmRegister.LerBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'CompilaModulos',True);
     CkbLiberaFtp.Checked := CmRegister.LerBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'LiberaFtp',True);
     CknGeraBeta.Checked := CmRegister.LerBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'GeraBeta',False);
     CkbComplFront.Checked := CmRegister.LerBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'ComplFront',False);
     CkbMensErro.Checked := CmRegister.LerBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'MensErro',False);
     CkbGeraInst.Checked := CmRegister.LerBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'GeraInstal',False);
     CkbCopiaInst.Checked := CmRegister.LerBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'CopiaInstal',False);

  Finally
     CmRegister.Free;
  End;

  LblCompPadroes.Enabled := CkbCompPadroes.Checked;
  LblCompModulos.Enabled := CkbCompilaModulos.Checked;
  LblLiberaFtp.Enabled := CkbLiberaFtp.Checked;
  LblGeraPadroes.Enabled := CknGeraBeta.Checked;
  LblCompFront.Enabled := CkbComplFront.Checked;
  LblExibeMens.Enabled := CkbMensErro.Checked;
  LblCopiaInstal.Enabled := CkbCopiaInst.Checked;
  LblGeraInstal.Enabled := CkbGeraInst.Checked;

  ActRefresh.Execute;

  ListFiles := TStringList.Create;
  Try
    TStringList(ListFiles).Sorted := True;
    BuildFileList(PATH_HIST_FONTES + '\*.zcm',0,ListFiles);
    For X := 0 To ListFiles.Count - 1 Do
       If LbLiberado.Items.IndexOf(Copy(ListFiles[x],1,Pos('_',ListFiles[x]) - 1)) = -1 Then
          LbLiberado.Items.Add(Copy(ListFiles[x],1,Pos('_',ListFiles[x]) - 1));
  finally
    ListFiles.Free;
  End;

  If FileExists(EdtDestino.Text + '\FilesFuncef.Dat') Then
     LbAssoc.Items.LoadFromFile(EdtDestino.Text + '\FilesFuncef.Dat');

  TmrCompilacao.Enabled := (True And CkbAutomatico.Checked);

  If EdtObjNegocio.Text = '' Then EdtObjNegocio.Text := '1';
end;

procedure TFrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  With qryModulo Do
  Begin
     If Active Then
     Begin
        If State In [DsEdit,DsInsert] Then Cancel;
        If UpdatesPending then CancelUpdates;
        Close;
     End;
  End;

  With QryDirModulo Do
  Begin
     Close;
     If Prepared Then Unprepare;
  End;

  If (LbAssoc.Items.count > 0) And
     (EdtDestino.Text <> '') Then
     LbAssoc.Items.SaveToFile(EdtDestino.Text + '\FilesFuncef.Dat');

  TIcon.Active := False;
  Application.Terminate;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := Not Visible;
end;

procedure TFrmPrincipal.MnuMinimizarAplicaoClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TFrmPrincipal.MnuSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.AppPrincipalMinimize(Sender: TObject);
begin
  Visible := False;
end;

procedure TFrmPrincipal.AclInserirUpdate(Sender: TObject);
Var
  iCountLista :Integer;
begin
  If PgPackage.ActivePageIndex = 0 Then
  Begin
     iCountLista := LvPackages.Items.Count;

     AclExcuir.Enabled := (LvPackages.Selected <> nil);
     AclMoveDown.Enabled := BtnExclui.Enabled And (LvPackages.Selected.Index <>  iCountLista - 1);
     AclMoveUp.Enabled := BtnExclui.Enabled And (LvPackages.Selected.Index <>  0);
     ActSave.Enabled := (iCountLista > 0);
     ActMarcarTodos.Enabled := (iCountLista > 1);
     ActInverterSelecao.Enabled := (iCountLista > 1);
     ActRefresh.Enabled := qryModulo.Active;
  End
  Else
  Begin
     iCountLista := LstvObj.Items.Count;

     AclExcuir.Enabled := (LstvObj.Selected <> nil);
     AclMoveDown.Enabled := BtnExclui.Enabled And (LstvObj.Selected.Index <>  iCountLista - 1);
     AclMoveUp.Enabled := BtnExclui.Enabled And (LstvObj.Selected.Index <>  0);
     ActSave.Enabled := (iCountLista > 0);
     ActMarcarTodos.Enabled := (iCountLista > 1);
     ActInverterSelecao.Enabled := (iCountLista > 1);
     ActRefresh.Enabled := qryModulo.Active;
  End;
end;

procedure TFrmPrincipal.AclExcuirExecute(Sender: TObject);
begin
  If PgPackage.ActivePageIndex = 0 Then
     LvPackages.Items.Delete(LvPackages.Selected.Index)
  Else
     LstvObj.Items.Delete(LstvObj.Selected.Index);
end;

procedure TFrmPrincipal.AclMoveDownExecute(Sender: TObject);
  procedure MoveDown(Lstv: TListView);
  Var
    iOldIndex :Integer;
    lItem :TListItem;
  Begin
    iOldIndex := Lstv.Selected.Index;
    lItem := Lstv.Items.Insert(iOldIndex + 2);
    lItem.Assign(Lstv.Items[iOldIndex]);
    lItem.Selected := True;
    Lstv.Items.Delete(iOldIndex);
  End;

begin
  If PgPackage.ActivePageIndex = 0 Then
     MoveDown(LvPackages)
  Else
     MoveDown(LstvObj);
end;

procedure TFrmPrincipal.AclMoveUpExecute(Sender: TObject);

  procedure MoveUp(Lstv: TListView);
  Var
    iOldIndex :Integer;
    lItem :TListItem;
  Begin
     iOldIndex := Lstv.Selected.Index;
     lItem := Lstv.Items.Insert(iOldIndex - 1);
     lItem.Assign(Lstv.Items[iOldIndex + 1]);
     Lstv.Items.Delete(iOldIndex + 1);
     lItem.Selected := True;
  End;

begin
  If PgPackage.ActivePageIndex = 0 Then
     MoveUp(LvPackages)
  Else
     MoveUp(LstvObj);
end;

procedure TFrmPrincipal.AclInserirExecute(Sender: TObject);
Var
  lItem :TListItem;
begin
  If DlgPkg.Execute Then
  Begin
    If PgPackage.ActivePageIndex = 0 Then
       lItem := LvPackages.Items.Add
    Else
       lItem := LstvObj.Items.Add;    

    lItem.Caption := ExtractFileName(DlgPkg.FileName);
    lItem.SubItems.Add('');
    lItem.SubItems.Add(ExtractFilePath(DlgPkg.FileName));
  End;
end;

procedure TFrmPrincipal.ActSaveExecute(Sender: TObject);

  procedure SaveLista(Lstv: TListView; sChave: String);
  Var
     X :Integer;
     CmRegister :TCmRegister;
  Begin
     CmRegister := TCmRegister.Create;

     Try
        CmRegister.EscreverStringReg(HKEY_CURRENT_USER, sChave, 'NumDpl',IntToStr(Lstv.Items.Count));
        For X:=0 To Lstv.Items.Count - 1 Do
          CmRegister.EscreverStringReg(HKEY_CURRENT_USER, sChave,'Dpl' + IntToStr(X + 1),Lstv.Items[x].Caption + '#' + Lstv.Items[x].SubItems[0] + '#' + Lstv.Items[x].SubItems[1])
     Finally
        CmRegister.Free;
     End;
  End;
begin
  SaveLista(LvPackages, HKEY_SOFTWARE_ROOT_DPLS);
  SaveLista(LstvObj, HKEY_SOFTWARE_ROOT_OBJ);
end;

procedure TFrmPrincipal.BtnPadroesRedeClick(Sender: TObject);
begin
  Case (Sender As TSpeedButton).Tag Of
    0: DlgPath.Title := LblPadroesRede.Caption;
    1: DlgPath.Title := LblFontesRede.Caption;
    2: DlgPath.Title := LblInstRede.Caption;
    3: DlgPath.Title := LblPadroesLocal.Caption;
    4: DlgPath.Title := LblFontesLocal.Caption;
    5: DlgPath.Title := LblInstLocal.Caption;
    6: DlgPath.Title := LblExecsRede.Caption;
  End;

  If DlgPath.Execute Then
     Case (Sender As TSpeedButton).Tag  Of
       0: EdtPadroesRede.Text := DlgPath.Directory;
       1: EdtFontesRede.Text := DlgPath.Directory;
       2: EdtInstRede.Text := DlgPath.Directory;
       3: EdtPadroesLocal.Text := DlgPath.Directory;
       4: EdtFontesLocal.Text := DlgPath.Directory;
       5: EdtInstLocal.Text := DlgPath.Directory;
       6: EdtExecRede.Text := DlgPath.Directory;
     End;
end;

procedure TFrmPrincipal.CkbCompPadroesClick(Sender: TObject);
Var
  CmRegister :TCmRegister;
begin
  CmRegister := TCmRegister.Create;
  Try
    Case (Sender As TCheckBox).Tag Of
      0:
      Begin
        CmRegister.EscreverBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'CompilaPadrao',CkbCompPadroes.Checked);
        LblCompPadroes.Enabled := CkbCompPadroes.Checked;
      End;
      1:
      Begin
        CmRegister.EscreverBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'CompilaModulos',CkbCompilaModulos.Checked);
        LblCompModulos.Enabled := CkbCompilaModulos.Checked;
      End;
      2:
      Begin
        CmRegister.EscreverBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'LiberaFtp',CkbLiberaFtp.Checked);
        LblLiberaFtp.Enabled := CkbLiberaFtp.Checked;
      End;
      3:
      Begin
        CmRegister.EscreverBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'GeraBeta',CknGeraBeta.Checked);
        LblGeraPadroes.Enabled := CknGeraBeta.Checked;
      End;
      4:
      Begin
        CmRegister.EscreverBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'ComplFront',CkbComplFront.Checked);
        LblCompFront.Enabled := CkbComplFront.Checked;
      End;
      5:
      Begin
        CmRegister.EscreverBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'MensErro',CkbMensErro.Checked);
        LblExibeMens.Enabled := CkbMensErro.Checked;
      End;
      6:
      Begin
        CmRegister.EscreverBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'GeraInstal',CkbGeraInst.Checked);
        LblGeraInstal.Enabled := CkbGeraInst.Checked;
      End;
      7:
      Begin
        CmRegister.EscreverBooleanReg(HKEY_CURRENT_USER,HKEY_SOFTWARE_ROOT_PARAMS,'CopiaInstal',CkbCopiaInst.Checked);
        LblCopiaInstal.Enabled := CkbCopiaInst.Checked;
      End;


    End;
  Finally
    CmRegister.Free;
  End;
end;

function TFrmPrincipal.CompilaPadroes(sDpl,sPathDpl :String): Boolean;
  Procedure ChangeDofCfg(sPathDpl,sDpl, sExtensao: String);
  Var
     ListFile :TStrings;
     X, iPosPath :Integer;
     sAux :String;
     bMudouCfg :Boolean;
  Begin
     ListFile := TStringList.Create;
     Try
        ListFile.LoadFromFile(sPathDpl + Copy(sDpl,1,Pos('.',sDpl)) + sExtensao);
        bMudouCfg := False;

        For X:=0 To ListFile.Count -1 Do
        Begin
            sAux := ListFile[x];         {ProjetosCM5\CM\Packages}

            sAux := AchaETroca('C:\', WORK_BASE_DIR, sAux);
            sAux := AchaETroca('E:\', WORK_BASE_DIR, sAux);
            sAux := AchaETroca('"E:\winnt\system32"','"' + WORK_BASE_DIR + 'ProjetosCM5\Cm\Packages"',sAux);

            iPosPath := Pos(UpperCase('-LE'),UpperCase(sAux));
            If iPosPath <> 0 Then
               sAux := '-LE"' + WORK_BASE_DIR + 'ProjetosCM5\Cm\Packages"';

            iPosPath := Pos(UpperCase('-LN'),UpperCase(sAux));
            If iPosPath <> 0 Then
               sAux := '-LN"' + WORK_BASE_DIR + 'ProjetosCM5\Cm\Packages"';

            sAux := AchaETroca('D:\ARQUIVOS DE PROGRAMAS\BORLAND\DELPHI5\LIB','C:\ARQUIVOS DE PROGRAMAS\BORLAND\DELPHI5\LIB',sAux);
            sAux := AchaETroca('E:\ARQUIVOS DE PROGRAMAS\BORLAND\DELPHI5\LIB','C:\ARQUIVOS DE PROGRAMAS\BORLAND\DELPHI5\LIB',sAux);

            ListFile[x] := sAux;
        End;

        ListFile.SaveToFile(sPathDpl + Copy(sDpl,1,Pos('.',sDpl)) + sExtensao);
     Finally
        ListFile.Free;
     End;
  End;
Var
  sParams, sFileAltBpl :String;
begin
   PnlStatusComp.Caption := 'Compilando ' + sDpl;
   Application.ProcessMessages;

   ChangeDofCfg(sPathDpl,sDpl,'dof');
   ChangeDofCfg(sPathDpl,sDpl,'cfg');

   If (Pos(UpperCase('CMObjFront'),UpperCase(sDpl)) <> 0) Then
     sParams := ' -U' + WORK_BASE_DIR + 'ProjetosCM5\FrontOffice\ObjetosQry\Controle;' + WORK_BASE_DIR + 'ProjetosCM5\FrontOffice\ObjetosQry\Dominio;' + WORK_BASE_DIR + 'ProjetosCM5\FrontOffice\ObjetosQry\Interface'
   Else
     sParams := '';

   Result := ExecutaArquivo(sPathDpl + sDpl,'',
             PathAddSeparator(ExtractFilePath(Application.ExeName)) + 'Log\' +  sDpl + '.log',
             EdtPadroesLocal.Text + DCC32FOLDERFILE,True,True,True);

   If Result Then
   Begin
      sFileAltBpl :=  Copy(sDpl,1,Pos('.',sDpl)) + 'Alt';

      If FileExists(sPathDpl + sFileAltBpl) Then
         if not CopyFile(PChar(sPathDpl + sFileAltBpl),
                         PChar(PathAddSeparator(EdtExecRede.Text)+ 'Alt\'+sFileAltBpl), false) then
         begin
           PnlErro.Color := clRed;
           LogErro('Copiando ' + sPathDpl + sFileAltBpl + ' >> ' + PathAddSeparator(EdtExecRede.Text)+ 'Alt\'+sFileAltBpl);
         end;
   End;
end;

procedure TFrmPrincipal.BtnExecuteClick(Sender: TObject);
Var
   X, y, iNumErroModulo :Integer;
   bContinue :Boolean;
   LstFile :TStrings;
   bAchouBpl, bCompilaDll :Boolean;
begin
   Try
     TmrCompilacao.Enabled := False;
     QryModulo.DisableControls;

     PnlErro.Color := clGray;
     LblCompPadroes.Color := clBlack;
     LblCompModulos.Font.Color := clBlack;
     LblLiberaFtp.Font.Color := clBlack;
     LblGeraPadroes.Font.Color := clBlack;
     LblCompFront.Font.Color := clBlack;
     LblExibeMens.Font.Color := clBlack;
     LblCopiaInstal.Font.Color := clBlack;
     LblGeraInstal.Font.Color := clBlack;

     LbErro.Items.Clear;
     LblCompl.Items.Clear;
     ReMensCompilador.Lines.Clear;
     bContinue := True;
     bCompilaDll := (CkbCompilaDll.Checked);

     //Verifica se as Dpl's foram liberas, copia e marca para compilação
     If  { (Not bCompilaDll) And } CkbCompPadroes.Checked Then
     Begin
        LstFile := TStringList.Create;
        Try
          BuildFileList(EdtFontesRede.Text + '\*.zcm',faAnyFile,LstFile);

          For X:=0 To LstFile.Count - 1 Do
              If IsBpl(LstFile[x]) Then
              Begin
                 bContinue := ExtraiFontes(EdtFontesRede.Text + '\' + LstFile[x]);

                 If bContinue Then
                 Begin
                    bContinue := BackupFontes(EdtFontesRede.Text + '\' + LstFile[x]);

                    If bContinue Then
                    Begin
                       //Testa se o package liberado está na lista para compilação, caso contrário não compila
                       //pois dependende da ordem de compilaçaõ dos projetos
                       For y:=0 To LvPackages.Items.Count - 1 Do
                       Begin
                          bContinue := UpperCase(LvPackages.Items[y].Caption) = UpperCase(qryModuloNOMEPROJETO.AsString+ '.dpk');

                          If bContinue Then Break;
                       End;

                       If bContinue Then
                       Begin
                          bAchouBpl := False;

                          For y:=0 To LvPackages.Items.Count - 1 Do
                          Begin
                             If Not bAchouBpl Then
                                bAchouBpl := UpperCase(LvPackages.Items[y].Caption) = UpperCase(qryModuloNOMEPROJETO.AsString+ '.dpk');

                             If bAchouBpl And (Not LvPackages.Items[y].Checked) Then
                                LvPackages.Items[y].Checked := True;
                          End;
                       End
                       Else
                       Begin
                         {** Procura na lista dos objetos de negócio **}

                         For y:=0 To LstvObj.Items.Count - 1 Do
                         Begin
                            bContinue := UpperCase(LstvObj.Items[y].Caption) = UpperCase(qryModuloNOMEPROJETO.AsString+ '.dpk');

                            If bContinue Then Break;
                         End;

                         If bContinue Then
                         Begin
                            bAchouBpl := False;

                            For y:=0 To LstvObj.Items.Count - 1 Do
                            Begin
                               If Not bAchouBpl Then
                                  bAchouBpl := UpperCase(LstvObj.Items[y].Caption) = UpperCase(qryModuloNOMEPROJETO.AsString+ '.dpk');

                               If bAchouBpl And (Not LstvObj.Items[y].Checked) Then
                                  LstvObj.Items[y].Checked := True;
                            End;
                         End
                         Else
                         Begin
                           PnlErro.Color := clRed;
                           LogErro('O Package ' + qryModuloNOMEPROJETO.AsString + ' não foi adicionado a lista de compilação!');
                           Break;
                         End;
                       End;
                    End;
                 End
                 Else
                   Break;
              End;
         finally
          LstFile.Free;
        End;
     End;

     bCompilouPadrao := False;
     bCompilouObj := False;

     //Compila Padroes
     If {(Not bCompilaDll) And } bContinue And CkbCompPadroes.Checked Then
     Begin
       SetStatusLabel(LblCompPadroes,soInProgress);

       Actrefresh.Execute;

       bSoBplFront := False;

       For X:=0 To LvPackages.Items.Count - 1 Do
           If LvPackages.Items[x].Checked Then
           Begin
              //If (X < 13) Then bSoBplFront := False;
              bCompilouPadrao := True;
              bContinue := CompilaPadroes(LvPackages.Items[x].Caption,LvPackages.Items[x].SubItems[1]);
              If Not bContinue Then break;
           End;

       if bContinue then
          For X:=0 To LstvObj.Items.Count - 1 Do
          Begin
              If bCompilouPadrao Then LstvObj.Items[x].Checked := True;

              If LstvObj.Items[x].Checked Then
              Begin
                 //If (X < 13) Then bSoBplFront := False;
                 bCompilouObj := True;
                 bContinue := CompilaPadroes(LstvObj.Items[x].Caption,LstvObj.Items[x].SubItems[1]);
                 If Not bContinue Then break;
              End;
          End;

       If bContinue Then
        Begin
           bContinue := CopyFiles(PathAddSeparator(EdtPadroesLocal.Text) + 'Packages',SYSTEM32_PATH,'*.Bpl');
           If bContinue Then
           Begin
              bContinue := CopyFiles(PathAddSeparator(EdtPadroesLocal.Text) + 'Packages',PADROESCM5C_PATH,'*.Bpl');

              If bContinue Then
                 bContinue := CopyFiles(PathAddSeparator(EdtPadroesLocal.Text) + 'Packages',PADROESCM5C_PATH,'*.Dcp');
           End;
        End;

        If bContinue Then
        Begin
           With qryModulo Do
           Begin
             First;
             While Not Eof Do
             Begin
               Edit;

               If (qryModuloDPL.AsFloat = 1) Then
                  qryModuloCOMPILADO.AsString := 'S'
               Else
                  //If CkbGeraInst.Checked Then
                  qryModuloCOMPILADO.AsString := 'N';

               Post;
               Next;
             End;
             First;
           End;

           SetStatusLabel(LblCompPadroes,soOk);
        End
        Else
           SetStatusLabel(LblCompPadroes,soFail);
     End;

     //Gera Instaladores
     If {(Not bCompilaDll) And } bContinue And CkbGeraInst.Checked Then
     Begin
        SetStatusLabel(LblGeraInstal,soInProgress);

        bContinue := GeraInstaladores;
        If bContinue Then
           SetStatusLabel(LblGeraInstal,soOk)
        Else
           SetStatusLabel(LblGeraInstal,soFail);
     End;

     //Copia Instaladores
     If {(Not bCompilaDll) And } bContinue And CkbCopiaInst.Checked Then
     Begin
        SetStatusLabel(LblCopiaInstal,soInProgress);

        bContinue := CopiaInstaladores;
        If bContinue Then
           SetStatusLabel(LblCopiaInstal,soOk)
        Else
           SetStatusLabel(LblCopiaInstal,soFail);
     End;

     //Compila\Copia Modulos
     iNumErroModulo := 0;
     If bContinue And CkbCompilaModulos.Checked Then
     Begin
        LstFile := TStringList.Create;
        Try
          //If (Not bCompilaDll) Then
          //Begin
          BuildFileList(EdtFontesRede.Text + '\*.zcm',faAnyFile,LstFile);
          For X:=0 To LstFile.Count - 1 Do
             If Not IsBpl(LstFile[x]) Then
             Begin
                If (Not bSoBplFront) Or
                   (bSoBplFront And (qryModuloFLGGRUPODESENV.AsString = 'F')) Then
                Begin
                   bContinue := CompilaModulo(EdtFontesRede.Text + '\' + LstFile[x], false);

                   If bContinue Then
                   Begin
                      bContinue := CopiaExe;

                      If bContinue Then
                      Begin
                         bContinue := BackupFontes(EdtFontesRede.Text + '\' + LstFile[x]);

                         If bContinue Then
                         Begin
                           qryModulo.Edit;
                           qryModuloCOMPILADO.AsString := 'S';
                           qryModulo.Post;
                         End;
                      End;
                   End;
                End;
             End;
          //End;

          //Compila Módulo 'desmarcados'
          With qryModulo Do
          Begin
             First;
             While Not Eof Do
             Begin
                 If (qryModuloDPL.AsFloat <> 1) And
                    (qryModuloCOMPILADO.AsString = 'N') And
                    (FileExists(GetNomeDpr)) Then
                 Begin
                   bContinue := CompilaModulo(EdtFontesRede.Text + '\' + qryModuloNOMEMODULO.AsString, True);

                   If bContinue Then
                   Begin
                      bContinue := CopiaExe;

                      If bContinue Then
                      Begin
                        Edit;
                        qryModuloCOMPILADO.AsString := 'S';
                        Post;
                      End;
                   End;
                 End;

                 Next;
             End;
          End;

          If Not bContinue Then Inc(iNumErroModulo);
        finally
          LstFile.Free;
        End;

        bContinue := (iNumErroModulo = 0);
     End;

     If qryModulo.State In [DsEdit,DsInsert] Then qryModulo.Post;
     dbSAD.ApplyUpdates([qryModulo]);

     If bContinue Then
        PnlStatusComp.Caption := 'Operação encerra com sucesso. Aguardando Comando...'
     Else
        PnlStatusComp.Caption := 'Operação encerrada com erros, Verifique. Aguardando Comando...';

     QryModulo.EnableControls;
     Application.ProcessMessages;
     TmrCompilacao.Enabled := (True And CkbAutomatico.Checked);
   Except
     QryModulo.EnableControls;
     Application.ProcessMessages;
     TmrCompilacao.Enabled := (True And CkbAutomatico.Checked);
     Raise;
   End;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
   CmExecuteFile.Free;
end;

procedure TFrmPrincipal.ActMarcarTodosExecute(Sender: TObject);
Var
  X :Integer;
begin
   If PgPackage.ActivePageIndex = 0 Then
   Begin
      For X:=0 To LvPackages.Items.Count - 1 Do
         LvPackages.Items[x].Checked := True;
   End
   Else
   Begin
      For X:=0 To LstvObj.Items.Count - 1 Do
          LstvObj.Items[x].Checked := True;
   End;
end;

procedure TFrmPrincipal.ActInverterSelecaoExecute(Sender: TObject);
Var
  X :Integer;
begin
   If PgPackage.ActivePageIndex = 0 Then
   Begin
      For X:=0 To LvPackages.Items.Count - 1 Do
         LvPackages.Items[x].Checked := Not LvPackages.Items[x].Checked;
   End
   Else
   Begin
      For X:=0 To LstvObj.Items.Count - 1 Do
          LstvObj.Items[x].Checked := Not LstvObj.Items[x].Checked
   End;
end;

function TFrmPrincipal.GeraInstaladores: Boolean;
  Function ComplInstal(sNomeInstal, sNomePathInstal :String):Boolean;
  Var
    FileInt :TIniFile;
  Begin
     If bSoBplFront And (Pos('FRONT',UpperCase(sNomeInstal))=0) Then
       Result := True
     Else
     Begin

       FileInt := TIniFile.Create(EdtInstLocal.Text +  sNomePathInstal);
       Try
         If (UpperCase('AtualizaObjCM.Exe') = UpperCase(sNomeInstal)) Then
         Begin
           EdtObjNegocio.Text := IntToStr(StrToIntDef(EdtObjNegocio.Text,1) + 1);

           FileInt.WriteString('Setup','AppName','Objetos de Negócio CM ' + EdtversaoPadrao.Text + ' ' + DateTimeToStr(Now) + ' - Build ' + StrPadLeft(EdtObjNegocio.Text,4,'0') + '.2002');
           FileInt.WriteString('Setup','AppVerName','Objetos de Negócio CM ' + EdtversaoPadrao.Text + ' ' + DateTimeToStr(Now) + ' - Build ' + StrPadLeft(EdtObjNegocio.Text,4,'0') + '.2002');
         End
         Else
         Begin
           FileInt.WriteString('Setup','AppName','PadroesCM ' + EdtversaoPadrao.Text + ' ' + DateTimeToStr(Now));
           FileInt.WriteString('Setup','AppVerName','PadroesCM ' + EdtversaoPadrao.Text + ' ' + DateTimeToStr(Now));
         End;
       finally
         FileInt.Free;
       End;

       PnlStatusComp.Caption := 'Gerando ' + sNomeInstal;
       Application.ProcessMessages;

       Result := ShellExecAndWait(PADROESCM5C_ROOTPATH + ISTOLLFOLDERFILE,' /cc "' + EdtInstLocal.Text +  sNomePathInstal + '"');
       If Result Then
          LblCompl.Items.Add('Compilando Instalador: ' + sNomeInstal)
       Else
          LogErro('Compilando Instalador: ' + sNomeInstal);
     End;
  End;                  
begin
   Result := ComplInstal('PadroresCM.Exe',PADROESCMFILE) And
             ComplInstal('AtualizaCM.Exe',ATUALIZACMFILE)And
             ComplInstal('AtualizaObjCM.Exe', ATUALIZAOBJCMFILE) And
             ComplInstal('InstalaCM.Exe',INSTALACMFILE) And
             ComplInstal('AtualizaFrontCM.Exe',ATUALIZAFRONTCMFILE);
end;

Function TFrmPrincipal.ExecutaArquivo(sNomeArquivo, sParams, sLogFileName,
   sCompilador: String; bRun, bDpl, bSaveLog: Boolean) :Boolean;
begin
   CmExecuteFile.FileName := sNomeArquivo;
   CmExecuteFile.Params := sParams;
   CmExecuteFile.LogFileName := sLogFileName;
   CmExecuteFile.Compilador := sCompilador;
   CmExecuteFile.Run := bRun;
   CmExecuteFile.Dpl := bDpl;
   CmExecuteFile.SaveLog := bSaveLog;

   Result := CmExecuteFile.Execute;

   If Not Result Then
   Begin
     PnlErro.Color := clRed;
     LogErro('Compilando: ' + ExtractFileName(sNomeArquivo));

     ReMensCompilador.Lines.Add(CmExecuteFile.FileName);
     ReMensCompilador.Lines.Add(CmExecuteFile.Messages.Text);
     ReMensCompilador.Lines.Add('');
     ReMensCompilador.Lines.Add('------------------------------------------------');
   End
   Else
     LblCompl.Items.Add('Compilando: ' + ExtractFileName(sNomeArquivo));
end;

function TFrmPrincipal.CopiaInstaladores: Boolean;
  function SaveFiles(sNomeInstal, sInstalFolder :String):Boolean;
  Var
     LstFile :TStrings;
     X :Integer;
  Begin
     If bSoBplFront And (Pos('FRONT',UpperCase(sNomeInstal))=0) Then
       Result := True
     Else
     Begin
        LstFile := TStringList.create;
        Try
           PnlStatusComp.Caption := 'Copiando ' + sNomeInstal;
           Application.ProcessMessages;

           Result := DirectoryExists(EdtInstLocal.Text + sInstalFolder + 'Bin');

           If Result Then
           Begin
              If Not DirectoryExists(EdtInstRede.Text + sInstalFolder) Then
                 ForceDirectories(EdtInstRede.Text + sInstalFolder);

              //Apaga Arquivos da Rede
              BuildFileList(EdtInstRede.Text + sInstalFolder + '*.*',faAnyFile,LstFile);
              For X:=0 To LstFile.Count - 1 Do
                  DeleteFile(EdtInstRede.Text + sInstalFolder + LstFile[x]);

              //Copia Arquivos Para Rede
              LstFile.Clear;
              BuildFileList(EdtInstLocal.Text + sInstalFolder + 'Bin\*.*',faAnyFile,LstFile);
              For X:=0 To LstFile.Count - 1 Do
              Begin
                  Result := CopyFile(Pchar(EdtInstLocal.Text + sInstalFolder + 'Bin\' + LstFile[x]),
                                     Pchar(EdtInstRede.Text + sInstalFolder + LstFile[x]),
                                     false);
                  If Not Result Then
                  Begin
                     PnlErro.Color := clRed;
                     LogErro('Copiando Instalador: ' + sNomeInstal);
                     ReMensCompilador.Lines.Add('Erro ao copiar arquivo do Instalador: ' + sNomeInstal);
                     ReMensCompilador.Lines.Add('Arquivo De Origem: ' + EdtInstLocal.Text + sInstalFolder + 'Bin\' + LstFile[x]);
                     ReMensCompilador.Lines.Add('Arquivo De Destino: ' + EdtInstRede.Text + sInstalFolder + LstFile[x]);
                     ReMensCompilador.Lines.Add('');
                     ReMensCompilador.Lines.Add('------------------------------------------------');
                     Break;
                  End;
              End;
           End;

           If Result Then
              LblCompl.Items.Add('Copiando Instalador: ' + sNomeInstal)
        Except
           Result := False;
        End;
        LstFile.Free;
     End;
  End;
begin
  Result := SaveFiles('PadroesCM.Exe', PADROESCMFOLDER) And
            SaveFiles('InstalaCm.Exe', INSTALACMFOLDER) And
            SaveFiles('AtualizaCM.Exe', ATUALIZACMFOLDER) And
            SaveFiles('AtualizaObjCM.Exe', ATUALIZAOBJCMFOLDER) And
            SaveFiles('AtualizaFrontCM.Exe', ATUALIZAFRONTCMFOLDER);
end;

function TFrmPrincipal.CopyFiles(sPathOrigem, SPathDestino,
  sMascara: String): Boolean;
Var
   LstFile :TStrings;
   X :Integer;
begin
   Result := True;

   sPathOrigem := PathAddSeparator(sPathOrigem);
   SPathDestino := PathAddSeparator(SPathDestino);

   LstFile := TStringList.Create;

   BuildFileList(sPathOrigem + sMascara,faAnyFile,LstFile);
   For X:=0 To LstFile.Count - 1 Do
   Begin
       If PgPBuilder.ActivePage = TbsVersoesFuncef Then
          LblProgress.Caption := 'Copiando Arquivo ' + LstFile[x]
       Else
          PnlStatusComp.Caption := 'Copiando Arquivo ' + LstFile[x];
       Application.ProcessMessages;

       Result := CopyFile(Pchar(sPathOrigem + LstFile[x]),
                          Pchar(SPathDestino + LstFile[x]),  false);
       If Not Result Then
       Begin
          If PgPBuilder.ActivePage = TbsVersoesFuncef Then
          Begin
            LblProgress.Caption := 'Erro ao copiar: ' + sPathOrigem + LstFile[x];
            MemLog.Lines.Add('Erro ao copiar arquivo : ' + sPathOrigem + LstFile[x]);
            MemLog.Lines.Add('Arquivo De Origem: ' + sPathOrigem + LstFile[x]);
            MemLog.Lines.Add('Arquivo De Destino: ' + SPathDestino + LstFile[x]);
            MemLog.Lines.Add('');
            MemLog.Lines.Add('------------------------------------------------');
            Break;
          End
          Else
          Begin
            PnlErro.Color := clRed;
            LogErro('Atualizar System32: ' + sPathOrigem + LstFile[x]);
            ReMensCompilador.Lines.Add('Erro ao copiar arquivo : ' + sPathOrigem + LstFile[x]);
            ReMensCompilador.Lines.Add('Arquivo De Origem: ' + sPathOrigem + LstFile[x]);
            ReMensCompilador.Lines.Add('Arquivo De Destino: ' + SPathDestino + LstFile[x]);
            ReMensCompilador.Lines.Add('');
            ReMensCompilador.Lines.Add('------------------------------------------------');
            Break;
          End;
       End;
   End;

   LstFile.Free;
end;

procedure TFrmPrincipal.SetStatusLabel(lbl: TLabel;
  Status: TStatusOperacao);
begin
  Case Status of
    soInProgress :lbl.Font.Color := ClNavy;
    soFail :lbl.Font.Color := ClRed;
    soOk :lbl.Font.Color := ClGreen;
  End;
  Application.ProcessMessages;
end;


Function TFrmPrincipal.IsBpl(sNomeZcm :String) :Boolean;
Var
  sNomeDpl :String;
Begin
   sNomeDpl := Copy(ExtractFileName(sNomeZcm),1,Pos('.',sNomeZcm)-1);
   Result := qryModulo.Locate('NOMEMODULO', sNomeDpl , []);
   Result := (Result And (qryModuloDPL.AsFloat = 1));
End;

Function TFrmPrincipal.ExtraiFontes(sNomeZcm :String) :Boolean;
Begin
   Result := True;

   Try
     SetCurrentDir(WORK_BASE_DIR);
     with ZipExtrFontes do
     begin
        ZipFileName := sNomeZcm;
        ExtrBaseDir := WORK_BASE_DIR;
        Extract;
     end;
   Except
     Result := False;
   End;
End;

Function TFrmPrincipal.CompilaModulo(sNomeZcm :String; buildAll :Boolean) :Boolean;
Var
   sRunTimePackageList, sLibaryPath, sListsaBpl, sDpl :String;

   {
   Function GetRunTimePackageList :String;
   Begin
      Result := '';

      If UpperCase(qryModuloNOMEMODULO.AsString) = 'SAD' Then
         Result := Result + ';CMExperts';

      if ((qryModuloUSADPL.AsInteger and USA_CMBACK) > 0) then
         Result := Result + ';CmBack50';

      if (qryModuloUSADPL.AsInteger and USA_COBRCM  > 0) then
         Result := Result + ';CMIntBanco50';

      if (qryModuloUSADPL.AsInteger and USA_REGRA > 0) then
         Result := Result + ';CMRegra50;CmParser50';

      if (qryModuloFLGGRUPODESENV.AsString =  'T') then
         Result := Result + ';CMTotalPrev50';

      if (qryModuloFLGGRUPODESENV.AsString =  'F') then
         Result := Result + ';TefCM;ImpFiscalPac;CMUtilFront;CMRelatsFront;CMObjFront';
   End;
   }

   procedure SetNomeProjeto(sNomeZcm:String);
   Var
      sNomeModulo :string;
   Begin
      sNomeModulo := Copy(ExtractFileName(sNomeZcm),1,Pos('.',ExtractFileName(sNomeZcm))-1);
      qryModulo.Locate('NOMEMODULO', sNomeModulo ,[]);
   End;

   Procedure DelDofCfg;
   Var
     sAuxFile :String;
   Begin
      sAuxFile := GetPathDpr + qryModuloNOMEPROJETO.AsString;

      If FileExists(sAuxFile + '.cfg') Then  DeleteFile(sAuxFile + '.cfg');

      If FileExists(sAuxFile + '.dof') Then  DeleteFile(sAuxFile + '.dof');
   End;

Begin
   Result := False;

   SetCurrentDir(WORK_BASE_DIR);

   If Not buildAll Then SetNomeProjeto(sNomeZcm);

   sListsaBpl := GetBplList;

   If (Trim(sListsaBpl) <> '') Then
      sDpl := ';' + sListsaBpl
   Else
      sDpl := '';

   If Not DirectoryExists(EdtFontesLocal.Text + '\Dcu\' + qryModuloNOMEPROJETO.AsString) Then
      ForceDirectories(EdtFontesLocal.Text + '\Dcu\' + qryModuloNOMEPROJETO.AsString);

   If Not DirectoryExists(GetPathDpr + 'Lib') Then ForceDirectories(GetPathDpr + 'Lib');

   If buildAll Or ExtraiFontes(sNomeZcm) Then
   Begin
      LblCompl.Items.Add('Extraindo ' + sNomeZcm);

      DelDofCfg;
      PnlStatusComp.Caption := 'Compilando ' + sNomeZcm;
      Application.ProcessMessages;

      If (qryModuloDPL.AsInteger = 2) Or (CkbCompilaSemPadrao.Checked) Then
      Begin
         sRunTimePackageList := '';
         sLibaryPath := ' /U"C:\Arquivos de programas\Borland\Delphi5\Lib";' +
                        '"C:\Arquivos de programas\Borland\Delphi5\Source\Vcl";' +
                        '"C:\Arquivos de programas\Borland\Delphi5\Source";' +
                        '"C:\Arquivos de programas\Borland\Delphi5\Bin";' +
                        '"C:\Arquivos de programas\Borland\Delphi5\Imports";' +
                        '"C:\Arquivos de programas\Borland\Delphi5\rbuilder\extradev\delphi5\lib";' +
                        '"C:\Arquivos de programas\Borland\Delphi5\Source\Toolsapi";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\componentescm\source";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\componentescm\ctrlobjects";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\componentescm\dbobjects";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\forms\source\relatorios";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\forms\source\objRAD\source";' +
                        '"' + WORK_BASE_DIR + 'ProjetosCM5\CM\Forms\Source\objRAD\CtrlObjetos";' +
                        '"' + WORK_BASE_DIR + 'ProjetosCM5\CM\Forms\Source\objRAD\DBObjetos";' +
                        '"' + WORK_BASE_DIR + 'ProjetosCM5\CM\Forms\Source\UsoPessoal";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\forms\sourcemt";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\forms\Source";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\forms\ctrlobjects";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\forms\dbobjects";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\cmsql\source";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\cmbussines\source";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\componentescmold\source";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\totalprev\source";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\regra\source";' +
                        '"' + WORK_BASE_DIR + 'projetoscm5\cm\cmexperts\source";' +
                        '"C:\ProjetosCM5\CM\JCL\Source";' +
                        GetBplListPath +
                        '"C:\projetoscm5\cm\componentesxt\Multilizer\Delphi5";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\1stClass2000vcl5\LIB";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\ip2000d5\LIB";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\RBuilder\Lib";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\RBuilder\Source";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\NDIntraWeb\D5";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\Indy\D5";' +
                        '"C:\projetoscm5\cm\componentesxt\cmadd50\source";' +
                        '"C:\projetoscm5\cm\componentesxt\rbuilder\exrtradev\delphi5\lib";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\ToolBar97";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\RaLib\Lib";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\RBuilder\TeeChart\Tee55";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\RBuilder\TeeChart\Tee50";' +
                        '"C:\ProjetosCM5\CM\ComponentesXT\RBuilder\Exrtradev\DELPHI5\SOURCE";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\ip2000d5\source";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express Inc\ExpressPrinting\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express Inc\ExpressForumLibary";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express Inc\ExpressPrint\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressCommon\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressInplaceEditors\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressQuantumGrid\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressEditors Library\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressCommon\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressInplaceEditors\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressQuantumGrid\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressEditors Library\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressBars\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressBars\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressMemData\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressDBTree\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressMemData\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressDBTree\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressOrgChart\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressOrgChart\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressPrinting System\Delphi 5\Lib";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\Developer Express\ExpressPrinting System\Delphi 5\Sources";' +
                        '"C:\ProjetosCM5\Cm\ComponentesXT\halcn600\source"' +
                        ' /R"C:\Arquivos de programas\Borland\Delphi5\Lib"';
      End
      Else
      Begin
         sLibaryPath := ' /U' + PADROESCM5_PATH;
         sRunTimePackageList := ' /LUVcl50;Vclx50;VclSmp50;Vcldb50;vclado50;ibevnt50;Vclbde50;vcldbx50;Qrpt50;TeeUI50;TeeDB50;Tee50;Dss50;TeeQR50;VCLIB50;Vclmid50;Halcyon6d5;' +
                                'vclie50;Inetdb50;Inet50;NMFast50;webmid50;dclocx50;dclaxserver50;TB97_d5;CMAdd50;Ml42ND50;Ml42DB50;rbTDBC51;rbRCL55;rbCIDE55;TSDG5201;TSG5201;' +
                                'rbIDE55;rbBDE55;rbRIDE55;rbRAP55;rbDBDE55;rbDAD55;rbDIDE55;rbUSER55;xtradev;ip50client_d5;ip50_d5;ip50word_d5;FirstClass2000_vcl5;Indy50;CmCompo50;'+
                                'CmOld50;CmBussines50;CmForms50;CmRelatsOld50;CmSql50;CMTotalPrev50' + sDPL;
      End;

      sLibaryPath := sLibaryPath +
      ';"C:\Arquivos de programas\Developer Express Inc\ExpressCommon\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressInplaceEditors\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressQuantumGrid\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressEditors Library\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressCommon\Delphi 5\Sources";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressInplaceEditors\Delphi 5\Sources";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressQuantumGrid\Delphi 5\Sources";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressEditors Library\Delphi 5\Sources";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressMemData\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressMemData\Delphi 5\Sources";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressOrgChart\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressOrgChart\Delphi 5\Sources";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressDBTree\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressDBTree\Delphi 5\Sources";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressBars\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressBars\Delphi 5\Sources";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressPrinting System\Delphi 5\Lib";' +
      '"C:\Arquivos de programas\Developer Express Inc\ExpressPrinting System\Delphi 5\Sources"';

      If ExecutaArquivo(GetNomeDpr,
                        ' /E' + WORK_BASE_DIR + Copy(EdtFontesLocal.Text,4,Length(EdtFontesLocal.Text)) + '\Bin '+
                        ' /N' + WORK_BASE_DIR + Copy(EdtFontesLocal.Text,4,Length(EdtFontesLocal.Text)) + '\Dcu\' + qryModuloNOMEPROJETO.AsString +
                        sLibaryPath +
                        ' /B'+
                        ' /H'+
                        sRunTimePackageList +
                        ' /W ', GetNomeLog(sNomeZcm) ,EdtPadroesLocal.Text + DCC32FOLDERFILE,True,False,True) Then
      Begin
        DeleteFile(GetNomeLog(sNomeZcm));
        Result := True;
        SendMail(False,sNomeZcm);
      End
      Else
        SendMail(True,sNomeZcm);
   End
   Else
   Begin
     PnlErro.Color := clRed;
     LogErro('Extraindo ' + sNomeZcm);
   End;
End;

procedure TFrmPrincipal.ActRefreshExecute(Sender: TObject);
Var
  Y :Integer;
  T :TextFile;
begin
  with qryModulo Do
  Begin

    AssignFile(T,PathAddSeparator(EdtPadroesLocal.Text) + 'ComponentesCM\Source\uVersoes.Pas');
    ReWrite(T);

    WriteLn(T,'unit uVersoes;');
    WriteLn(T,'');
    WriteLn(T,'interface');
    WriteLn(T,'');
    WriteLn(T,'const');
    WriteLn(T,'     NOME_DPL    = 0;');
    WriteLn(T,'     VERSAO_DPL  = 1;');
    WriteLn(T,'     DATA_DPL    = 2;');
    WriteLn(T,'     PROJETO_DPL = 3;');
    WriteLn(T,'');
    WriteLn(T,'     V_DPL = ' + IntToStr( LvPackages.Items.Count + LstvObj.Items.Count - 1 ) + ';');
    WriteLn(T,'     V_BIBLIOTECAS : array[0..V_DPL, 0..3] of string = (');

    If Active Then Close;
    Open;

    For Y:=0 To LvPackages.Items.Count - 1 Do
        If Locate('NOMEPROJETO',Copy(LvPackages.Items[y].Caption,1,Pos('.',LvPackages.Items[y].Caption)-1),[]) Then
        Begin
           LvPackages.Items[y].SubItems[0] := qryModuloVERSAO.AsString;

           If UpperCase(LvPackages.Items[y].Caption) = 'CMCOMPO50.DPK' Then
              EdtversaoPadrao.text := qryModuloVERSAO.AsString;

           {
           If Y = LvPackages.Items.Count - 1 Then
              WriteLn(T,'     (''' + qryModuloNOMEMODULO.AsString + ''', ''' + qryModuloVERSAO.AsString + ''', ''' + DateToStr(Date) + ''','''+ qryModuloNOMEPROJETO.AsString + '''));')
           Else
           }
           WriteLn(T,'     (''' + qryModuloNOMEMODULO.AsString + ''', ''' + qryModuloVERSAO.AsString + ''', ''' + DateToStr(Date) + ''','''+ qryModuloNOMEPROJETO.AsString + '''),');
        End
        Else
           {
           If Y = LvPackages.Items.Count - 1 Then
              WriteLn(T,'     (''' + Copy(LvPackages.Items[y].Caption,1,Pos('.',LvPackages.Items[y].Caption)-1) + ''', ''05.00.00'', ''' + DateToStr(Date) + ''','''+ LvPackages.Items[y].Caption + '''));')
           Else
           }
           WriteLn(T,'     (''' + Copy(LvPackages.Items[y].Caption,1,Pos('.',LvPackages.Items[y].Caption)-1) + ''', ''05.00.00'', ''' + DateToStr(Date) + ''','''+ LvPackages.Items[y].Caption + '''),');


    For Y:=0 To LstvObj.Items.Count - 1 Do
        If Locate('NOMEPROJETO',Copy(LstvObj.Items[y].Caption,1,Pos('.',LstvObj.Items[y].Caption)-1),[]) Then
        Begin
           LstvObj.Items[y].SubItems[0] := qryModuloVERSAO.AsString;

           If UpperCase(LstvObj.Items[y].Caption) = 'CMCOMPO50.DPK' Then
              EdtversaoPadrao.text := qryModuloVERSAO.AsString;

           If Y = LstvObj.Items.Count - 1 Then
              WriteLn(T,'     (''' + qryModuloNOMEMODULO.AsString + ''', ''' + qryModuloVERSAO.AsString + ''', ''' + DateToStr(Date) + ''','''+ qryModuloNOMEPROJETO.AsString + '''));')
           Else
              WriteLn(T,'     (''' + qryModuloNOMEMODULO.AsString + ''', ''' + qryModuloVERSAO.AsString + ''', ''' + DateToStr(Date) + ''','''+ qryModuloNOMEPROJETO.AsString + '''),');
        End
        Else
           If Y = LstvObj.Items.Count - 1 Then
              WriteLn(T,'     (''' + Copy(LstvObj.Items[y].Caption,1,Pos('.',LstvObj.Items[y].Caption)-1) + ''', ''05.00.00'', ''' + DateToStr(Date) + ''','''+ LstvObj.Items[y].Caption + '''));')
           Else
              WriteLn(T,'     (''' + Copy(LstvObj.Items[y].Caption,1,Pos('.',LstvObj.Items[y].Caption)-1) + ''', ''05.00.00'', ''' + DateToStr(Date) + ''','''+ LstvObj.Items[y].Caption + '''),');

    WriteLn(T,'');
    WriteLn(T,'implementation');
    WriteLn(T,'');
    WriteLn(T,'end.');
    CloseFile(T);

    CopyFile(Pchar(PathAddSeparator(EdtPadroesLocal.Text) + 'ComponentesCM\Source\uVersoes.Pas'),
             Pchar(PathAddSeparator(PADROESCM5C_ROOTPATH) + 'ComponentesCM\Source\uVersoes.Pas'),False);

    ActSave.Execute;

    First;
  End;
end;

procedure TFrmPrincipal.ZipExtrFontesProgress(Sender: TObject;
  ProgrType: ProgressType; Filename: String; FileSize: Integer);
begin
  If ProgrType = NewFile Then
  Begin
     PnlStatusComp.Caption := 'Extraindo ' + Filename;
     Application.ProcessMessages;
  End;
end;

function TFrmPrincipal.CopiaExe : boolean;
var
   FileHandle : integer;
begin
   PnlStatusComp.Caption := 'Copiando ' + qryModulo.FieldByName('NOMEPROJETO').AsString + GetExtensaoProjeto;
   Application.ProcessMessages;
   //Copia o executável do Bin do "E:" para o Bin da rede
   if CopyFile(
       PChar( PathAddSeparator(EdtFontesLocal.Text) + 'bin\' + qryModulo.FieldByName('NOMEPROJETO').AsString+ GetExtensaoProjeto),
       PChar(PathAddSeparator(EdtExecRede.Text)+ 'bin\' + GetCompPasta + qryModulo.FieldByName('NOMEPROJETO').AsString+ GetExtensaoProjeto), false) then
   begin
        FileHandle := FileOpen(PathAddSeparator(EdtExecRede.Text) + 'bin\' + GetCompPasta + qryModulo.FieldByName('NOMEPROJETO').AsString + GetExtensaoProjeto, fmOpenWrite);
        FileSetDate(FileHandle, FileAge(PathAddSeparator(EdtFontesLocal.Text) + 'bin\' + qryModulo.FieldByName('NOMEPROJETO').AsString + GetExtensaoProjeto));
        FileClose(FileHandle);

        LblCompl.Items.Add('Copiando ' + qryModulo.FieldByName('NOMEPROJETO').AsString + GetExtensaoProjeto);
        Result := True;
   End
   else
   begin
        Result := false;
        PnlErro.Color := clRed;
        LogErro('Copiando ' + qryModulo.FieldByName('NOMEPROJETO').AsString + GetExtensaoProjeto);
   end;

   //Copia o ALT do Fontes do "E:" para o Bin da rede
   if FileExists(GetPathDpr + qryModulo.FieldByName('NOMEPROJETO').AsString+'.Alt') Then
   Begin
      If CopyFile(
         PChar(GetPathDpr + qryModulo.FieldByName('NOMEPROJETO').AsString+'.Alt'),
         PChar(PathAddSeparator(EdtExecRede.Text)+ 'Alt\'+qryModulo.FieldByName('NOMEPROJETO').AsString+'.Alt'), false) then
      begin
           FileHandle := FileOpen(PathAddSeparator(EdtExecRede.Text)+'Alt\'+qryModulo.FieldByName('NOMEPROJETO').AsString+'.Alt', fmOpenWrite);
           FileSetDate(FileHandle, FileAge(GetPathDpr + qryModulo.FieldByName('NOMEPROJETO').AsString+'.Alt'));
           FileClose(FileHandle);

           LblCompl.Items.Add('Copiando ' + qryModulo.FieldByName('NOMEPROJETO').AsString+'.Alt');
           Result := True;
      End
      else
      begin
           Result := false;
           PnlErro.Color := clRed;
           LogErro('Copiando ' + qryModulo.FieldByName('NOMEPROJETO').AsString+'.Alt');
      end;
   End;

   Application.ProcessMessages;
end;

function TfrmPrincipal.BackupFontes(sNomeZcm :String):Boolean;
Var
  sNomeFileDest :String;
Begin
  sNomeFileDest := ExtractFileName(sNomeZcm);
  sNomeFileDest := PATH_HIST_FONTES + Copy(sNomeFileDest,1,Pos('.',sNomeFileDest)-1) +
                   '_'+qryModulo.FieldByName('VERSAO').AsString +
                   '.zcm';

  Result := CopyFile(
            PChar( sNomeZcm ),
            PChar( sNomeFileDest ), false);

  If Result Then
     DeleteFile(sNomeZcm);
End;

Function TfrmPrincipal.GetNomeLog(sNomeZcm:String):String;
Var
   sNomeModulo :string;
Begin
   sNomeModulo := Copy(ExtractFileName(sNomeZcm),1,Pos('.',ExtractFileName(sNomeZcm))-1);

   Result := PathAddSeparator(ExtractFilePath(sNomeZcm)) + 'Log\' +  sNomeModulo + '.log';
End;

procedure TfrmPrincipal.SendMail(bError :Boolean; sNomeZcm:string);
Var
  sMensagem, sTitulo, sArquivo :String;
Begin
 If CkbSendMail.Checked Then
 Begin
    If bError Then
    Begin
       sMensagem := 'O projeto ' + qryModuloNOMEPROJETO.AsString + ' Versão ' + qryModuloVERSAO.AsString + ' não pode ser compilado. Verifique o log em anexo.' + (#13+#10) + (#13+#10) + 'Flavio Dias';
       sTitulo := 'Erro na Compilação do Módulo ' + qryModuloNOMEPROJETO.AsString + ' Versão ' + qryModuloVERSAO.AsString;
       sArquivo := GetNomeLog(sNomeZcm);
    End
    Else
    Begin
       sMensagem := 'O projeto ' + qryModuloNOMEPROJETO.AsString + ' Versão ' + qryModuloVERSAO.AsString + ' foi compilado com sucesso.' + (#13+#10) + (#13+#10) + 'Flavio Dias';
       sTitulo := 'Compilação do Módulo ' + qryModuloNOMEPROJETO.AsString + ' Versão ' + qryModuloVERSAO.AsString;
       sArquivo := '';
    End;

    Try
       If qryModuloEMAIL.IsNull Then
          JclSimpleSendMail('dias@cmsolucoes.com.br',
                            'Dias',
                            'E-Mail não cadastrado para o Módulo ' + qryModuloNOMEPROJETO.AsString,
                            'Favor Verificar o cadastro do Módulo ' + qryModuloNOMEPROJETO.AsString + (#13+#10) + (#13+#10) + 'Flavio Dias',
                            sArquivo,False,0);


       If Not qryModuloEMAIL.IsNull Then
          JclSimpleSendMail(qryModuloEMAIL.AsString,
                            qryModuloUSURESPONSAVEL.AsString,
                            sTitulo,
                            sMensagem,
                            sArquivo,False,0);

       If (Not qryModuloEMAILGERENTE.IsNull) And
          (UpperCase(Trim(qryModuloEMAIL.AsString)) <> UpperCase(Trim(qryModuloEMAILGERENTE.AsString))) Then
          JclSimpleSendMail(qryModuloEMAILGERENTE.AsString,
                            qryModuloGERENTEPROJETO.AsString,
                            sTitulo,
                            sMensagem,
                            sArquivo,False,0);
    finally

    end;
 End;
End;



procedure TFrmPrincipal.MnuExibirAplicaoClick(Sender: TObject);
begin
  Show;
  Application.Restore;
  Application.MainForm.SetFocus
end;

procedure TFrmPrincipal.BtnSelAllClick(Sender: TObject);
begin
  qryModulo.DisableControls;
  qryModulo.First;
  While Not qryModulo.Eof Do
  Begin
     qryModulo.Edit;
     qryModuloCOMPILADO.AsString := 'S';
     qryModulo.Post;

     qryModulo.Next;
  End;
  qryModulo.First;
  qryModulo.EnableControls;

  dbSAD.ApplyUpdates([qryModulo]);
end;

procedure TFrmPrincipal.BtnInvSelClick(Sender: TObject);
begin
  qryModulo.DisableControls;
  qryModulo.First;
  While Not qryModulo.Eof Do
  Begin
     qryModulo.Edit;
     If qryModuloCOMPILADO.AsString = 'S' Then
        qryModuloCOMPILADO.AsString := 'N'
     Else
        qryModuloCOMPILADO.AsString := 'S';
     qryModulo.Post;

     qryModulo.Next;
  End;
  qryModulo.First;
  qryModulo.EnableControls;

  dbSAD.ApplyUpdates([qryModulo]);  
end;

procedure TFrmPrincipal.BtnTransFereClick(Sender: TObject);
Var
  X, iUltVersao :Integer;
  ListFiles :TStringList;
begin
  If ((TmrCompilacao.Enabled) Or (Not CkbAutomatico.CheCked)) And
     (Trim(EdtDestino.Text) <> '') And
     (LbAssoc.Items.Count > 0) Then
  Begin
    TmrCompilacao.Enabled := False;

    Try                                           
      //Copia Instaladores
      If CkbCopyInstal.Checked Then
      Begin
        If Not bSoBplFront Then
        Begin
           CriaDiretorio(EdtDestino.Text + PADROESCMFOLDER);
           CopyFiles(EdtInstRede.Text + PADROESCMFOLDER, EdtDestino.Text + PADROESCMFOLDER, '*.*');
           CriaDiretorio(EdtDestino.Text + INSTALACMFOLDER);
           CopyFiles(EdtInstRede.Text + INSTALACMFOLDER, EdtDestino.Text + INSTALACMFOLDER, '*.*');
           CriaDiretorio(EdtDestino.Text + ATUALIZACMFOLDER);
           CopyFiles(EdtInstRede.Text + ATUALIZACMFOLDER, EdtDestino.Text + ATUALIZACMFOLDER, '*.*');
           CriaDiretorio(EdtDestino.Text + ATUALIZAOBJCMFOLDER);
           CopyFiles(EdtInstRede.Text + ATUALIZAOBJCMFOLDER, EdtDestino.Text + ATUALIZAOBJCMFOLDER, '*.*');
        End;
        
        CriaDiretorio(EdtDestino.Text + ATUALIZAFRONTCMFOLDER);
        CopyFiles(EdtInstRede.Text + ATUALIZAFRONTCMFOLDER, EdtDestino.Text + ATUALIZAFRONTCMFOLDER, '*.*');
      End;

      //Copia Fontes
      If CkbFontes.Checked Then
      Begin
        CriaDiretorio(EdtDestino.Text + '\Fontes\',True);
        ListFiles := TStringList.Create;
        Try
          ListFiles.Sorted := True;
          For X:=0 To (LbAssoc.Items.Count - 1) Do
          Begin
             ListFiles.Clear;

             BuildFileList(PATH_HIST_FONTES + '\' + LbAssoc.Items[x] + '_*.zcm',0,ListFiles);
             iUltVersao := ListFiles.Count - 1;
             If iUltVersao <> - 1 Then
             Begin
                LblProgress.Caption := 'Copiando ' + ListFiles[iUltVersao];
                Application.ProcessMessages;

                CopyFile(Pchar(PATH_HIST_FONTES + '\' + ListFiles[iUltVersao]),
                         Pchar(EdtDestino.Text + '\Fontes\' + ListFiles[iUltVersao]),false);
             End;
          End
        finally
          ListFiles.Free;
        End;
      End;

      //Copia Executáveis, Help, Scripts, Alt, TransfRelatórios
      If CkbVersoes.Checked Then
      Begin
        CriaDiretorio(EdtDestino.Text + '\Bin\');
        CriaDiretorio(EdtDestino.Text + '\Alt\');
        CriaDiretorio(EdtDestino.Text + '\Help\');
        CriaDiretorio(EdtDestino.Text + '\Scripts\');
        CriaDiretorio(EdtDestino.Text + '\TransfRelatorios\');

        qryModulo.DisableControls;
        Try
           For X:=0 To (LbAssoc.Items.Count - 1) Do
           Begin
               If qryModulo.Locate('NOMEMODULO', LbAssoc.Items[x] ,[]) Then
               Begin
                  //Copia Executavel
                  LblProgress.Caption := 'Copiando ' + qryModuloNOMEPROJETO.AsString + GetExtensaoProjeto;
                  Application.ProcessMessages;

                  If FileExists(EdtExecRede.Text + '\Bin\' + GetCompPasta + qryModuloNOMEPROJETO.AsString + GetExtensaoProjeto) Then
                     CopyFile(Pchar(EdtExecRede.Text + '\Bin\' + GetCompPasta + qryModuloNOMEPROJETO.AsString + GetExtensaoProjeto),
                              Pchar(EdtDestino.Text + '\Bin\' + qryModuloNOMEPROJETO.AsString + GetExtensaoProjeto),False);
                  //Copia Alt
                  LblProgress.Caption := 'Copiando ' + qryModuloNOMEPROJETO.AsString + '.Alt';
                  Application.ProcessMessages;

                  If FileExists(EdtExecRede.Text + '\Alt\' + qryModuloNOMEPROJETO.AsString + '.Alt') Then
                     CopyFile(Pchar(EdtExecRede.Text + '\Alt\' + qryModuloNOMEPROJETO.AsString + '.Alt'),
                              Pchar(EdtDestino.Text + '\Alt\' + qryModuloNOMEPROJETO.AsString + '.Alt'),False);

                  //Copia Help
                  LblProgress.Caption := 'Copiando ' + qryModuloNOMEPROJETO.AsString + '.hlp';
                  Application.ProcessMessages;

                  If FileExists(EdtExecRede.Text + '\Help\' + qryModuloNOMEPROJETO.AsString + '.hlp') Then
                     CopyFile(Pchar(EdtExecRede.Text + '\Help\' + qryModuloNOMEPROJETO.AsString + '.hlp'),
                              Pchar(EdtDestino.Text + '\Help\' + qryModuloNOMEPROJETO.AsString + '.hlp'),False);
               End;


           End;

           //Copia CMExtraiFontes
           LblProgress.Caption := 'Copiando CMExtraiFontes.exe';
           Application.ProcessMessages;

           If FileExists(EdtExecRede.Text + '\Bin\CMExtraiFontes.exe') Then
              CopyFile(Pchar(EdtExecRede.Text + '\Bin\CMExtraiFontes.exe'),
                       Pchar(EdtDestino.Text + '\Bin\CMExtraiFontes.exe'),False);

           //Copia Mensageiro
           LblProgress.Caption := 'Copiando InstalaMensageiro.exe';
           Application.ProcessMessages;

           If FileExists(EdtExecRede.Text + '\Bin\InstalaMensageiro.exe') Then
              CopyFile(Pchar(EdtExecRede.Text + '\Bin\InstalaMensageiro.exe'),
                       Pchar(EdtDestino.Text + '\Bin\InstalaMensageiro.exe'),False);

           //Copia Scripts
           LblProgress.Caption := 'Copiando CMSCRIPT.zsq';
           Application.ProcessMessages;

           If FileExists('\\DESENV0029\Publico\Scripts\CMSCRIPT.zsq') Then
              CopyFile(Pchar('\\DESENV0029\Publico\Scripts\CMSCRIPT.zsq'),
                       Pchar(EdtDestino.Text + '\Scripts\CMSCRIPT.zsq'),False);

           //Copia TransfRelatórios
           LblProgress.Caption := 'Copiando TransfRelatorios.tcm';
           Application.ProcessMessages;

           If FileExists(EdtExecRede.Text + '\TransfRelatorios\TransfRelatorios.tcm') Then
              CopyFile(Pchar(EdtExecRede.Text +  '\TransfRelatorios\TransfRelatorios.tcm'),
                       Pchar(EdtDestino.Text +  '\TransfRelatorios\TransfRelatorios.tcm'),False);
        finally
          qryModulo.EnableControls;
        End;
      End;

    Except
      On E:Exception Do
      Begin
         Application.MessageBox(PChar(E.Message),'Erro !',Mb_IconStop);
      End;
    End;

    TmrCompilacao.Enabled := (True And CkbAutomatico.Checked);
    LblProgress.Caption := 'Aguardando Comando';
    Application.ProcessMessages;
  End
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  If (LbLiberado.ItemIndex <> - 1) And
     (LbAssoc.Items.IndexOf(LbLiberado.Items[LbLiberado.ItemIndex]) = -1) Then
     LbAssoc.Items.Add(LbLiberado.Items[LbLiberado.ItemIndex]);
end;

procedure TFrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  If (LbAssoc.ItemIndex <> - 1) Then
     LbAssoc.Items.Delete(LbAssoc.ItemIndex);
end;

procedure TFrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  If DlgPath.Execute Then
     EdtDestino.Text := DlgPath.Directory;
end;

procedure TFrmPrincipal.TmrCompilacaoTimer(Sender: TObject);
begin
  MnuExibirAplicao.Click;
  PgPBuilder.ActivePage := TbsCompilacao;
  BtnExecute.Click;
  MnuMinimizarAplicao.Click;
end;

procedure TFrmPrincipal.CriaDiretorio(sPathName: String; bDelTree: Boolean);
begin
  If Not DirectoryExists(sPathName) Then
     ForceDirectories(sPathName)
  Else
    If bDelTree Then
    Begin
       DelTree(sPathName);
       ForceDirectories(sPathName);
    End;
end;

function TFrmPrincipal.AchaETroca(CONST sOldStr, sNewStr, sStr :String): String;
Var
  iPos: Integer;
  sAuxStr :String;
Begin
  sAuxStr := uppercase(sStr);
  iPos := Pos(uppercase(sOldStr), sAuxStr);
  If iPos > 0 Then
  Begin
     While iPos > 0 Do
     Begin
        Delete(sAuxStr, iPos, Length(sOldStr));
        Insert(sNewStr, sAuxStr, iPos);
        iPos := Pos(uppercase(sOldStr), sAuxStr);
     End;

     Result := sAuxStr;
  End
  Else
     Result := sStr;
End;

function TFrmPrincipal.GetExtensaoProjeto: String;
begin
   Case qryModuloDPL.AsInteger of
    0: Result := '.Exe';
    1: Result := '.Bpl';
    2: Result := '.Dll';
   Else
     Result := '';
   End;
end;

function TFrmPrincipal.GetCompPasta: String;
begin
   If qryModuloDPL.AsInteger = 2 Then
     Result := 'Dll\'
   Else
     Result := '';
end;

procedure TFrmPrincipal.LogErro(sMensagem: String);
begin
   LbErro.Items.Add(sMensagem);
   LbErro.ItemIndex := Pred(LbErro.Items.Count);
   JclSimpleSendMail('dias@cmsolucoes.com.br','','Erro no Project Builder', sMensagem, '', false);
end;

end.


