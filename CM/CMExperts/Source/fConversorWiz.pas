unit fConversorWiz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, fcLabel, StdCtrls, Buttons, TreeWzd, ComCtrls, ActnList, ExptIntf,
  BfDialogs, BrowseFolder, uProcuraDir, JclFileUtils, JclStrings;

type
  TTipoConversao = (tcProject, tcPath, tcFile, tcNotaAssigned);

  TfrmConversorWiz = class(TForm)
    Panel2: TPanel;
    wizConversor: TTreeWzd;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    BtnCancela: TBitBtn;
    BtnEncerra: TBitBtn;
    nbWizPages: TNotebook;
    fcLabel1: TfcLabel;
    Panel1: TPanel;
    Image1: TImage;
    fcLabel2: TfcLabel;
    ActionList1: TActionList;
    actNext: TAction;
    actPrior: TAction;
    actFinish: TAction;
    actCancel: TAction;
    lblPjName: TLabel;
    lblPjPath: TLabel;
    Label2: TLabel;
    LblNomeAcao: TLabel;
    lblNewPjPath: TLabel;
    LblDestino: TLabel;
    lblInfo: TLabel;
    cbOpenProject: TCheckBox;
    Image2: TImage;
    mmErrors: TMemo;
    lblErrors: TLabel;
    PnlFile: TPanel;
    AnmConver: TAnimate;
    Label4: TLabel;
    LblArquivo: TLabel;
    Bevel1: TBevel;
    PgTipoConv: TPageControl;
    TbsConvProjeto: TTabSheet;
    TbsConvPath: TTabSheet;
    TbsConvArquivo: TTabSheet;
    Label1: TLabel;
    lvProjects: TListView;
    Label6: TLabel;
    EdtDir: TEdit;
    BtnDlgPath: TSpeedButton;
    DlgPath: TProcuraDirDlg;
    Label7: TLabel;
    EdtFile: TEdit;
    BtnFile: TSpeedButton;
    DlgFile: TOpenDialog;
    procedure MoveWiz(Sender: TObject);
    procedure actionUpdate(Sender: TObject);
    procedure CloseForm(Sender: TObject);
    procedure actFinishUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nbWizPagesPageChanged(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDlgPathClick(Sender: TObject);
    procedure BtnFileClick(Sender: TObject);
  private
    _PjName: string;
    _PjPath: string;
    _NewPjPath: string;
    _Success: Boolean;
    _TipoConversao :TTipoConversao;
    _PathName: string;
    _FileName: string;
    procedure FeedProjects;
    procedure ConvertProject;
  public
    class function Execute: Boolean;
  end;

var
  frmConversorWiz: TfrmConversorWiz;

implementation

uses DelphiParsers, PascalParser, FileCtrl, CMAppWizConsts;

{$R *.DFM}
type
  TFileType = (ftPAS, ftDFM);

const
  sInfo : array [boolean] of string = ('O Projeto %s foi convertido com erros!', 'O Projeto %s foi convertido com Sucesso!');

var
  ExcludedUnits : string = '#uerro#dateedit#Stdctrl#ExtCtrlt#CMTret#DBCtrlt#uDialogs#uBrowseFolder#';

  PasChanges, DfmChanges : TStringList;

procedure TfrmConversorWiz.MoveWiz(Sender: TObject);
begin
  wizConversor.Etapa.Pos := wizConversor.Etapa.Pos + TAction(Sender).Tag;
  nbWizPages.ActivePage := 'Passo' + IntToStr(wizConversor.Etapa.Pos);
end;

procedure TfrmConversorWiz.actionUpdate(Sender: TObject);
var
  NextMove: Integer;
begin
  NextMove := wizConversor.Etapa.Pos + TAction(Sender).Tag;
  case wizConversor.Etapa.Pos of
    2 :
    begin
      Case PgTipoConv.ActivePageIndex of
        0: actNext.Enabled := lvProjects.ItemFocused <> nil;
        1: actNext.Enabled := (EdtDir.text <> '');
        2: actNext.Enabled := (EdtFile.text <> '');
        Else
         actNext.Enabled := False;
      End;

      actPrior.Enabled := True;
    end;
    4 :
    begin
      actNext.Enabled := False;
      actPrior.Enabled := False;
    end;
    else TAction(Sender).Enabled := (NextMove > 0) and (NextMove < 5);
  end;
end;

procedure TfrmConversorWiz.CloseForm(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmConversorWiz.actFinishUpdate(Sender: TObject);
begin
  actFinish.Enabled := wizConversor.Etapa.Pos = wizConversor.Etapa.Quantidade;
end;

procedure TfrmConversorWiz.FormCreate(Sender: TObject);
begin
  wizConversor.Resize;
  _TipoConversao := tcNotaAssigned;
  nbWizPages.ActivePage := 'Passo1';
end;

procedure TfrmConversorWiz.nbWizPagesPageChanged(Sender: TObject);
begin
  case wizConversor.Etapa.Pos of
    1 :;
    2 :
    begin
      Screen.Cursor := crHourGlass;
      try
        FeedProjects;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
    3 :
    begin
      Case PgTipoConv.ActivePageIndex of
      0:
        Begin
           LblNomeAcao.Caption := 'Projeto';
           LblDestino.Caption := 'O projeto atualizado será criado no diretório:';
           _TipoConversao := tcProject;
           _PjName := lvProjects.ItemFocused.Caption;
           _PjPath := IncludeTrailingBackslash(Trim(lvProjects.ItemFocused.SubItems.Text));
           _NewPjPath := StringReplace(_PjPath, 'ProjetosComDPL', 'ProjetosCM5', [rfIgnoreCase]);
           lblPjName.Caption := _PjName;
           lblPjPath.Caption := Trim(lvProjects.ItemFocused.SubItems.Text);
           lblNewPjPath.Caption := StringReplace(lvProjects.ItemFocused.SubItems.Text,
             'ProjetosComDPL', 'ProjetosCM5', [rfIgnoreCase]);
        End;
      1:
        Begin
           LblNomeAcao.Caption := 'Diretório';
           LblDestino.Caption := 'Os Arquivoas do Diretório atualizado serão criados no diretório:';
           _TipoConversao := tcPath;

           _PjName := '';
           _PjPath := '';
           _FileName := '';
           _PathName := IncludeTrailingBackslash(Trim(EdtDir.Text));

           _NewPjPath := StringReplace(_PathName, 'ProjetosComDPL', 'ProjetosCM5', [rfIgnoreCase]);
           lblPjName.Caption := _PathName;
           lblPjPath.Caption := _PathName;
           lblNewPjPath.Caption := _NewPjPath;
        End;
      2:
        Begin
           LblNomeAcao.Caption := 'Arquivo';
           LblDestino.Caption := 'O Arquivio Atualizado será criado no diretório:';
           _TipoConversao := tcFile;

           _PjName := '';
           _PjPath := '';
           _FileName := EdtFile.Text;
           _PathName := IncludeTrailingBackslash(ExtractFilePath(EdtFile.Text));

           _NewPjPath := StringReplace(_PathName, 'ProjetosComDPL', 'ProjetosCM5', [rfIgnoreCase]);
           lblPjName.Caption := _FileName;
           lblPjPath.Caption := _PathName;
           lblNewPjPath.Caption := _NewPjPath;
        End;
      Else
         _TipoConversao := tcNotaAssigned;
      End;
    end;
    4 :
    begin
       If _TipoConversao = tcNotaAssigned Then
          nbWizPages.PageIndex := 0;

       Screen.Cursor := crHourGlass;
       try
         PnlFile.Visible := True;
         AnmConver.Active := True;
         Application.ProcessMessages;
         ConvertProject;
         AnmConver.Active := False;
         PnlFile.Visible := False;
         lblInfo.Caption := Format(sInfo[_Success], [_PjName]);
         lblErrors.Visible := not _Success;
         mmErrors.Visible := not _Success;

         cbOpenProject.Checked := (_TipoConversao = tcProject);
         cbOpenProject.Enabled := (_TipoConversao = tcProject);
       finally
         AnmConver.Active := False;
         Screen.Cursor := crDefault;
       end;
    end;
  end;
end;

procedure TfrmConversorWiz.FeedProjects;

  procedure SearchDir(const InitialDir, FileMask: string; FileList: TListView);
  var
    SearchRec : TSearchRec;
  begin
    if FindFirst(IncludeTrailingBackSlash(InitialDir) + '*.*', faAnyFile, SearchRec) = 0 then
    begin
      repeat
        if (SearchRec.Attr = faDirectory) and (SearchRec.Name[1] <> '.') then
          SearchDir(IncludeTrailingBackSlash(InitialDir) + SearchRec.Name, FileMask, FileList)
        else
          if AnsiCompareText(ExtractFileExt(SearchRec.Name), FileMask) = 0 then
            with FileList.Items.Add do
            begin
              Caption := Copy(SearchRec.Name, 1, Length(SearchRec.Name) -4);
              SubItems.Add(InitialDir);
            end;
      until FindNext(SearchRec) <> 0;
    end;
    FindClose(SearchRec);
  end;
begin
  lvProjects.Items.Clear;
  SearchDir('C:\ProjetosComDPL', '.DPR', lvProjects);
end;

procedure TfrmConversorWiz.ConvertProject;
var
  sAux, oldCurrPath, sTemp : string;
  tmpFile, FileList, PathFileList : TStringList;
  dprParser : TDprParser;
  i, iPos : Integer;
  IncOkCanc, IncSairAjuda : Boolean;
  bFazerOpen, bFazerClose, bFazerInsert, bFazerEdit, bFazerDelete, bFazerCancel,
  bFazerProcurar, bFazerConfirma, bTestarConfirma, bAtualizaBotoes, bFazerInserirDetalhe,
  bFazerAlterarDetalhe, bFazerExcluirDetalhe, bFazerConfirmaDetalhe, bFazerCancelaDetalhe,
  bVerificaBotoesDetalhe, bMudaPessoa, bMudaOutros, bGravaOutros :Boolean;

  iLinhaTypeForm, iLinhaPrivateForm :Integer;


  procedure CheckPath(const PathName: string);
  begin
    if not DirectoryExists(PathName) then
      ForceDirectories(PathName);
  end;

  procedure ConvertFile(const FileName: string; FileType: TFileType);
  var
    NewFile: string;

    procedure AtualizaMetodos(sNomeMetodo :String; X, iLPrivForm :Integer; Var sList :TStringList; bProcecedure :Boolean = True);
    Begin
       If bProcecedure Then
       Begin
         If (Pos(UPPERCASE(sNomeMetodo),UPPERCASE(sList[x])) <> 0) And
            (Pos('PROCEDURE',UPPERCASE(sList[x])) <> 0) And
            (Pos('OVERRIDE',UPPERCASE(sList[x])) <> 0) Then
            Begin
               If iLPrivForm > 0 Then
               Begin
                  sList.Delete(x);
                  sList.insert(iLPrivForm,'    #' + sNomeMetodo);
               End
               Else
                 sList[x] := '    #' + sNomeMetodo;
            End;
       End
       Else
       Begin
         If (Pos(UPPERCASE(sNomeMetodo),UPPERCASE(sList[x])) <> 0) And
            (Pos('FUNCTION',UPPERCASE(sList[x])) <> 0) And
            (Pos('OVERRIDE',UPPERCASE(sList[x])) <> 0) Then
            Begin
               If iLPrivForm > 0 Then
               Begin
                  sList.Delete(x);
                  sList.insert(iLPrivForm,'    #' + sNomeMetodo);
               End
               Else
                 sList[x] := '    #' + sNomeMetodo;
            End;
       End;
    End;

    procedure ConvertDFM;
    var
      dfmParser : TDfmParser;
      i, IxDel, x, IxEnd : Integer;
      DelIni, DelFim: array of Integer;
      InDelArea, InsertTB97: Boolean;
      sEnd, sUserEnd : string;
      UserObjs: TStringList;
    begin
      IxDel := -1;
      IxEnd := 0;
      UserObjs := TStringList.Create;
      dfmParser := TDfmParser.Create;
      try
        dfmParser.LoadFromFile(FileName);

        LblArquivo.Caption := 'Atualizando Arquivo: ' + ExtractFileName(FileName);
        Application.ProcessMessages;

        FileList.Assign(dfmParser.Lines);
        FileList.Text := StringReplace(FileList.Text, 'TDateEdit', 'TCMDateTimePicker', [rfReplaceAll, rfIgnoreCase]);
        FileList.Text := StringReplace(FileList.Text, 'TDBDateEdit', 'TCMDateTimePicker', [rfReplaceAll, rfIgnoreCase]);
        InDelArea := False;

        for x := 0 to Pred(FileList.Count) do
        begin
          if InDelArea then
          begin
            Inc(DelFim[IxDel]);
            if (AnsiCompareText(FileList[x], sEnd) = 0) then
              InDelArea := False;
          end;
          if (Pos('principal', AnsiLowerCase(FileName)) > 0) then
          begin
            if (Pos('inherited pnlstatusbar', AnsiLowerCase(FileList[x])) > 0) then
            begin
              Inc(IxDel);
              SetLength(DelFim, IxDel + 1);
              SetLength(DelIni, IxDel + 1);
              DelIni[IxDel] := x;
              DelFim[IxDel] := x;
              InDelArea := True;
              sEnd := Copy(FileList[x], 1, Pos('i', AnsiLowerCase(FileList[x]))-1) + 'end';
            end else
              if (Pos('inherited dock97bot', AnsiLowerCase(FileList[x])) > 0) then
              begin
                Inc(IxDel);
                SetLength(DelFim, IxDel + 1);
                SetLength(DelIni, IxDel + 1);
                DelIni[IxDel] := x;
                DelFim[IxDel] := x;
                InDelArea := True;
                sEnd := Copy(FileList[x], 1, Pos('i', AnsiLowerCase(FileList[x]))-1) + 'end';
              end;
          end;
          if AnsiCompareText(FileList[x], 'end') = 0 then
          Begin
            IxEnd := x;
          End;
        end;

        if bMudaPessoa Or
           bMudaOutros Or
           bGravaOutros Then
        Begin
           FileList.Insert(IxEnd,'  inherited Pessoa: TPessoa');
           Inc(IxEnd);

           If bMudaPessoa Then
           Begin
              FileList.Insert(IxEnd,'     OnChangePessoa = PessoaChangePessoa');
              Inc(IxEnd);
           End;
           If bMudaOutros Then
           Begin
              FileList.Insert(IxEnd,'     OnChangeSubtipo = PessoaChangeSubtipo');
              Inc(IxEnd);
           End;
           If bGravaOutros Then
           Begin
              FileList.Insert(IxEnd,'     OnSaveSubtipo = PessoaSaveSubtipo');
              Inc(IxEnd);
           End;

           FileList.Insert(IxEnd,'  Left = 300');
           Inc(IxEnd);
           FileList.Insert(IxEnd,'  Top = 8');
           Inc(IxEnd);
           FileList.Insert(IxEnd, 'end');
           Inc(IxEnd);
        End;

        If bFazerOpen or
           bFazerClose or
           bFazerInsert or
           bFazerEdit or
           bFazerDelete or
           bFazerCancel or
           bFazerProcurar or
           bFazerConfirma or
           bTestarConfirma or
           bAtualizaBotoes Then
        Begin
           FileList.Insert(IxEnd,'inherited CmeCadastro: TCmEventosCadastro');
           Inc(IxEnd);

           If bFazerOpen Then
           Begin
              FileList.Insert(IxEnd,'     OnOpenDataSet = CmeCadastroOpenDataSet');
              Inc(IxEnd);
           End;
           If bFazerClose Then
           Begin
              FileList.Insert(IxEnd,'     OnCloseDataSet = CmeCadastroCloseDataSet');
              Inc(IxEnd);
           End;
           If bFazerInsert Then
           Begin
              FileList.Insert(IxEnd,'     OnInsert = CmeCadastroInsert');
              Inc(IxEnd);
           End;
           If bFazerEdit Then
           Begin
              FileList.Insert(IxEnd,'     OnEdit = CmeCadastroEdit');
              Inc(IxEnd);
           End;
           If bFazerDelete Then
           Begin
              FileList.Insert(IxEnd,'     OnDelete = CmeCadastroDelete');
              Inc(IxEnd);
           End;
           If bFazerCancel Then
           Begin
              FileList.Insert(IxEnd,'     OnCancel = CmeCadastroCancel');
              Inc(IxEnd);
           End;
           If bFazerProcurar Then
           Begin
              FileList.Insert(IxEnd,'     OnFind = CmeCadastroFind');
              Inc(IxEnd);
           End;
           If bFazerConfirma Then
           Begin
              FileList.Insert(IxEnd,'     OnConfirma = CmeCadastroConfirma');
              Inc(IxEnd);
           End;
           If bTestarConfirma Then
           Begin
              FileList.Insert(IxEnd,'     BeforeConfirma = CmeCadastroBeforeConfirma');
              Inc(IxEnd);
           End;
           If bAtualizaBotoes Then
           Begin
              FileList.Insert(IxEnd,'     OnAtualizaBotoes = CmeCadastroAtualizaBotoes');
              Inc(IxEnd);
           End;

           FileList.Insert(IxEnd,'  Left = 358');
           Inc(IxEnd);
           FileList.Insert(IxEnd,'  Top = 58');
           Inc(IxEnd);
           FileList.Insert(IxEnd, 'end');
           Inc(IxEnd);
        End;

        If bFazerInserirDetalhe or
          bFazerAlterarDetalhe or
          bFazerAlterarDetalhe or
          bFazerConfirmaDetalhe or
          bFazerCancelaDetalhe or
          bVerificaBotoesDetalhe Then
        Begin
           FileList.Insert(IxEnd,'inherited CmeDetalhe: TCmEventosCadastro');
           Inc(IxEnd);

           If bFazerInserirDetalhe Then
           Begin
              FileList.Insert(IxEnd,'     OnInsert = CmeDetalheInsert');
              Inc(IxEnd);
           End;
           If bFazerAlterarDetalhe Then
           Begin
              FileList.Insert(IxEnd,'     OnEdit = CmeDetalheEdit');
              Inc(IxEnd);
           End;
           If bFazerAlterarDetalhe Then
           Begin
              FileList.Insert(IxEnd,'     OnDelete = CmeDetalheDelete');
              Inc(IxEnd);
           End;
           If bFazerConfirmaDetalhe Then
           Begin
              FileList.Insert(IxEnd,'     OnConfirma = CmeDetalheConfirma');
              Inc(IxEnd);
           End;
           If bFazerCancelaDetalhe Then
           Begin
              FileList.Insert(IxEnd,'     OnCancel = CmeDetalheCancel');
              Inc(IxEnd);
           End;
           If bVerificaBotoesDetalhe Then
           Begin
              FileList.Insert(IxEnd,'     OnAtualizaBotoes = CmeDetalheAtualizaBotoes');
              Inc(IxEnd);
           End;
           FileList.Insert(IxEnd,'  Left = 408');
           Inc(IxEnd);
           FileList.Insert(IxEnd,'  Top = 108');
           Inc(IxEnd);
           FileList.Insert(IxEnd, 'end');
           Inc(IxEnd);
        End;

        for i := Pred(IxDel) downto 0 do
          if (DelFim[i] > 0) and (DelIni[i] > 0) then
            for x := 0 to (DelFim[i] - DelIni[i]) do
              FileList.Delete(DelIni[i]);
        SetLength(DelFim, 0);
        SetLength(DelIni, 0);
        for x := 0 to Pred(DfmChanges.Count) do
          FileList.Text := StringReplace(FileList.Text, DfmChanges.Names[x], DfmChanges.Values[DfmChanges.Names[x]], [rfReplaceAll, rfIgnoreCase]);
        FileList.Text := StringReplace(FileList.Text, '%DPRNAME%', _PjName, [rfReplaceAll, rfIgnoreCase]);
      finally
        UserObjs.Free;
        dfmParser.Free;
      end;
    end;
    procedure ConvertPAS;
    var
      Parser : TPascalParser;
      sTxt, Token: string;
      x : Integer;
      ParseAgain: Boolean;

      procedure DoParse;
      var
        DelIni, DelFim: Integer;
      begin
        Parser.pcProgram := PChar(sTxt);
        Parser.pcPos := Parser.pcProgram;
        Token := LowerCase(Parser.Token);
        while Token <> '' do
        begin
          if Parser.SubSection = ssUses then
          begin
            if Pos('#' + Token + '#', ExcludedUnits) > 0 then
            begin
              if Parser.History[1] = ',' then
                DelIni := Parser.PosBeg[1]
              else
                DelIni := Parser.PosBeg[0];
              DelFim := Parser.PosEnd[0];
              Delete(sTxt, DelIni, DelFim - DelIni);
              ParseAgain := True;
              Exit;
            end;
            if (Token = ',') and (Parser.History[1] = ',') then
            begin
              DelIni := Parser.PosBeg[0];
              DelFim := Parser.PosEnd[0];
              Delete(sTxt, DelIni, DelIni-DelFim);
              ParseAgain := True;
              Exit;
            end;
          end;
          Token := AnsiLowerCase(Parser.Token);
        end;
        ParseAgain := False;
      end;
    begin
      FileList.LoadFromFile(FileName);
      LblArquivo.Caption := 'Atualizando Arquivo: ' + ExtractFileName(FileName);
      Application.ProcessMessages;


      iLinhaTypeForm := 0;
      iLinhaPrivateForm := 0;

      For x := 0 to Pred(FileList.Count) Do
      Begin
         if (Pos('INTERFACE',UpperCase(FileList[x])) > 0) And
            (iLinhaTypeForm > 0) Then Break;

         If (iLinhaTypeForm = 0) And
            (Pos('CLASS(TFRMCADASTRO',UpperCase(FileList[x])) > 0) Then
            iLinhaTypeForm := X
         Else
            If (iLinhaPrivateForm = 0) And (Pos('PRIVATE',UpperCase(FileList[x])) > 0) Then
               iLinhaPrivateForm := X;

         AtualizaMetodos('FazerInserirDetalhe',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerAlterarDetalhe',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerExcluirDetalhe',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerConfirmaDetalhe',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerCancelaDetalhe',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('VerificaBotoesDetalhe',X,iLinhaPrivateForm,FileList);


         AtualizaMetodos('FazerOpen',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerOpen',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerClose',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerInsert',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerEdit',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerDelete',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerCancel',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerProcurar',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('FazerConfirma',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('TestarConfirma',X,iLinhaPrivateForm,FileList,false);
         AtualizaMetodos('AtualizaBotoes',X,iLinhaPrivateForm,FileList);

         AtualizaMetodos('MudaPessoa',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('MudaOutros',X,iLinhaPrivateForm,FileList);
         AtualizaMetodos('GravaOutros',X,iLinhaPrivateForm,FileList);
      End;

      bFazerOpen := (Pos(UpperCase('FazerOpen'),UpperCase(FileList.Text)) <> 0);
      bFazerClose := (Pos(UpperCase('FazerClose'),UpperCase(FileList.Text)) <> 0);
      bFazerInsert := (Pos(UpperCase('FazerInsert'),UpperCase(FileList.Text)) <> 0);
      bFazerEdit := (Pos(UpperCase('FazerEdit'),UpperCase(FileList.Text)) <> 0);
      bFazerDelete := (Pos(UpperCase('FazerDelete'),UpperCase(FileList.Text)) <> 0);
      bFazerCancel := (Pos(UpperCase('FazerCancel'),UpperCase(FileList.Text)) <> 0);
      bFazerProcurar := (Pos(UpperCase('FazerProcurar'),UpperCase(FileList.Text)) <> 0);
      bFazerConfirma := (Pos(UpperCase('FazerConfirma'),UpperCase(FileList.Text)) <> 0);
      bTestarConfirma := (Pos(UpperCase('TestarConfirma'),UpperCase(FileList.Text)) <> 0);
      bAtualizaBotoes := (Pos(UpperCase('AtualizaBotoes'),UpperCase(FileList.Text)) <> 0);

      bFazerInserirDetalhe := (Pos(UpperCase('FazerInserirDetalhe'),UpperCase(FileList.Text)) <> 0);
      bFazerAlterarDetalhe := (Pos(UpperCase('FazerAlterarDetalhe'),UpperCase(FileList.Text)) <> 0);
      bFazerExcluirDetalhe := (Pos(UpperCase('FazerExcluirDetalhe'),UpperCase(FileList.Text)) <> 0);
      bFazerConfirmaDetalhe := (Pos(UpperCase('FazerConfirmaDetalhe'),UpperCase(FileList.Text)) <> 0);
      bFazerCancelaDetalhe := (Pos(UpperCase('FazerCancelaDetalhe'),UpperCase(FileList.Text)) <> 0);
      bVerificaBotoesDetalhe := (Pos(UpperCase('VerificaBotoesDetalhe'),UpperCase(FileList.Text)) <> 0);

      bMudaPessoa := (Pos(UpperCase('MudaPessoa'),UpperCase(FileList.Text)) <> 0);
      bMudaOutros := (Pos(UpperCase('MudaOutros'),UpperCase(FileList.Text)) <> 0);
      bGravaOutros := (Pos(UpperCase('GravaOutros'),UpperCase(FileList.Text)) <> 0);

      FileList.Text := StringReplace(FileList.Text, 'TDateEdit', 'TCMDateTimePicker', [rfReplaceAll, rfIgnoreCase]);
      FileList.Text := StringReplace(FileList.Text, 'TDBDateEdit', 'TCMDateTimePicker', [rfReplaceAll, rfIgnoreCase]);
      sTxt := FileList.Text;
      Parser := TPascalParser.Create;
      try
        DoParse;
        while ParseAgain do
          DoParse;
      finally
        Parser.Free;
      end;
      FileList.Text := sTxt;

      for x := 0 to Pred(PasChanges.Count) do
        FileList.Text := StringReplace(FileList.Text, PasChanges.Names[x], PasChanges.Values[PasChanges.Names[x]], [rfReplaceAll, rfIgnoreCase]);

      FileList.Text := StringReplace(FileList.Text, '%DPRNAME%', _PjName, [rfReplaceAll, rfIgnoreCase]);

      If bTestarConfirma Then
         for x := 0 to Pred(FileList.Count) do
         Begin
             iPos := Pos('CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean):Boolean;',FileList[x]);
             If iPos > 0 Then
             Begin
                sAux := FileList[x];
                Delete(sAux,Pos('FUNCTION',UpperCase(sAux)),8);
                sAux := sAux + 'Procedure';
                Delete(sAUx,IPos + 1,Length(sAux));
                sAux := sAux + 'CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);';
             End;
         End;


    end;
  begin
    try
      NewFile := StringReplace(FileName, 'ProjetosComDPL', 'ProjetosCM5', [rfIgnoreCase]);

      CheckPath(ExtractFileDir(NewFile));

      if FileType = ftPAS then
        ConvertPAS
      else
        ConvertDFM;

      FileList.SaveToFile(NewFile);
    except
      on E : Exception do
      begin
        _Success := False;
        mmErrors.Lines.Append('  * Erro na conversão do arquivo ' + ExtractFileName(NewFile));
        mmErrors.Lines.Append('      ' + E.Message);
      end;
    end;
  end;

  procedure ConvertDPR;
  var
    x : integer;
    SearchRec: TSearchRec;
  begin
    try
      CheckPath(_NewPjPath);

    If Not DirectoryExists(Copy(_NewPjPath,1, Length(_NewPjPath) - 7) + 'Dcu') Then
       ForceDirectories(Copy(_NewPjPath,1, Length(_NewPjPath) - 7) + 'Dcu');

      if FindFirst(_PjPath + _PjName + '.*', faAnyFile, SearchRec) = 0 then
      begin
        repeat
          if (SearchRec.Attr <> faDirectory)  then
            if (AnsiCompareText(ExtractFileExt(SearchRec.Name), '.dpr') <> 0) and (AnsiCompareText(ExtractFileExt(SearchRec.Name), '.dsk') <> 0) then
              CopyFile(PChar(_PjPath + SearchRec.Name), PChar(_NewPjPath + SearchRec.Name), False);
        until FindNext(SearchRec) <> 0;
      end;
      FindClose(SearchRec);

      dprParser.Lines.Text := StringReplace(dprParser.Lines.Text, 'Cm\Forms', 'Cm\Forms\Source', [rfReplaceAll, rfIgnoreCase]);

      For X:=0 To Pred(dprParser.Lines.Count) Do
      Begin
         if (Pos(UpperCase('FCMPrincipal'),UpperCase(dprParser.Lines[X])) <> 0) Then
         Begin
            dprParser.Lines.Insert(X,'  FCadastroPai in ''..\..\CM\Forms\Source\FCadastroPai.pas'' {FrmCadastroPai},');
            Break;
         End;
      end;

      dprParser.Lines.SaveToFile(_NewPjPath + _PjName + '.dpr');

      with TStringList.Create do
      try
        Text := FileDof;
        SaveToFile(_NewPjPath + _PjName + '.dof');
      finally
        Free;
      end;


    except
      on E : Exception do
      begin
        _Success := False;
        mmErrors.Lines.Append('  * Erro na conversão do arquivo DPR:');
        mmErrors.Lines.Append('      ' + E.Message);
      end;
    end;
  end;
begin
  _Success := True;
  mmErrors.Lines.Clear;
  IncOkCanc := False;
  IncSairAjuda := False;
  dprParser := TDprParser.Create;
  tmpFile := TStringList.Create;
  FileList := TStringList.Create;
  PathFileList := TStringList.Create;
  try
    Case _TipoConversao of
    tcProject:
      Begin
         dprParser.LoadFromFile(_pjPath + _pjName + '.dpr');

         LblArquivo.Caption := 'Atualizando Arquivo: ' + _pjName + '.dpr';
         Application.ProcessMessages;

         dprParser.ParseIt;

         ConvertDPR;

         oldCurrPath := GetCurrentDir;
         if SetCurrentDir(_pjPath) then
         begin
           for i := 0 to Pred(dprParser.UnitCount) do
           begin
             sTemp := LowerCase(dprParser.Units[i].Path);
             if Pos('cm\forms', sTemp) > 0 then
               Continue;
             ConvertFile(ExpandFileName(Trim(dprParser.Units[i].Path)), ftPAS);
             if Trim(dprParser.Units[i].FormPath) <> '' then
               ConvertFile(ExpandFileName(Trim(dprParser.Units[i].FormPath)), ftDFM);
           end;
         end;
      End;
    tcPath:
      Begin
         If DirectoryExists(_PathName) Then
         Begin
            BuildFileList(_PathName + '*.pas',faAnyFile,PathFileList);
            for i := 0 to Pred(PathFileList.Count) do
               ConvertFile( IncludeTrailingBackslash(_PathName) + PathFileList[i], ftPAS);

            PathFileList.Clear;

            BuildFileList(_PathName + '*.dfm',faAnyFile,PathFileList);
            for i := 0 to Pred(PathFileList.Count) do            
              ConvertFile( IncludeTrailingBackslash(_PathName) + PathFileList[i], ftDFM);
         End;
      End;
    tcFile:
      Begin
         If FileExists(_FileName) Then
         Begin
           ConvertFile( _FileName, ftPAS);

           If FileExists(StrBefore('.pas',LowerCase(_FileName)) + '.dfm') Then
              ConvertFile( (StrBefore('.pas',LowerCase(_FileName)) + '.dfm'), ftDFM);
         End;
      End;
    End;
  finally
    dprParser.Free;
    tmpFile.Free;
    FileList.Free;
    PathFileList.Free;
    SetCurrentDir(oldCurrPath)
  end;
end;

class function TfrmConversorWiz.Execute: Boolean;
begin
  with Self.Create(nil) do
    try
      Result := ShowModal = idOk;
    finally
      Free;
    end;
end;

procedure TfrmConversorWiz.actCancelUpdate(Sender: TObject);
begin
  actCancel.Enabled := wizConversor.Etapa.Pos < wizConversor.Etapa.Quantidade;
end;

procedure TfrmConversorWiz.Memo1Click(Sender: TObject);
begin
  TControl(Sender).SendToBack;
end;

procedure TfrmConversorWiz.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cbOpenProject.Checked then
  begin
    if ToolServices = nil then
      Exit;
    ToolServices.OpenProject(_NewPjPath + _PjName + '.dpr');
  end;
end;

procedure TfrmConversorWiz.BtnDlgPathClick(Sender: TObject);
begin
   If DlgPath.Execute Then EdtDir.Text := DlgPath.Directory;
end;

procedure TfrmConversorWiz.BtnFileClick(Sender: TObject);
begin
   If DlgFile.Execute Then EdtFile.Text := DlgFile.FileName;
end;

initialization
  PasChanges := TStringList.Create;

  PasChanges.Append('OperacaoCadastro=CmeCadastro.Operacao');
  PasChanges.Append('bRepetirInsert=CmeCadastro.RepetirInsert');

  //Implementação dos métodos
  PasChanges.Append('.MudaPessoa=.PessoaChangePessoa(IdPessoa: Integer)');
  PasChanges.Append('.MudaOutros=.PessoaChangeSubtipo(IdPessoa: Integer)');
  PasChanges.Append('.GravaOutros=.PessoaSaveSubtipo(Sender: TObject)');

  PasChanges.Append('.FazerInserirDetalhe=.CmeDetalheInsert(Sender: TObject)');
  PasChanges.Append('.FazerAlterarDetalhe=.CmeDetalheEdit(Sender: TObject)');
  PasChanges.Append('.FazerExcluirDetalhe=.CmeDetalheDelete(Sender: TObject)');
  PasChanges.Append('.FazerConfirmaDetalhe=.CmeDetalheConfirma(Sender: TObject)');
  PasChanges.Append('.FazerCancelaDetalhe=.CmeDetalheCancel(Sender: TObject)');
  PasChanges.Append('.VerificaBotoesDetalhe=.CmeDetalheAtualizaBotoes(Sender: TObject)');

  PasChanges.Append('.FazerOpen=.CmeCadastroOpenDataSet(Sender: TObject)');
  PasChanges.Append('.FazerClose=.CmeCadastroCloseDataSet(Sender: TObject)');
  PasChanges.Append('.FazerInsert=.CmeCadastroInsert(Sender: TObject)');
  PasChanges.Append('.FazerEdit=.CmeCadastroEdit(Sender: TObject)');
  PasChanges.Append('.FazerDelete=.CmeCadastroDelete(Sender: TObject)');
  PasChanges.Append('.FazerCancel=.CmeCadastroCancel(Sender: TObject)');
  PasChanges.Append('.FazerProcurar=.CmeCadastroFind(Sender: TObject)');
  PasChanges.Append('.FazerConfirma=.CmeCadastroConfirma(Sender: TObject)');
  PasChanges.Append('.TestarConfirma=.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean)');
  PasChanges.Append('.AtualizaBotoes=.CmeCadastroAtualizaBotoes(Sender: TObject)');

  //Declarações dos métodos na unit
  PasChanges.Append('#MudaPessoa=Procedure PessoaChangePessoa(IdPessoa: Integer)');
  PasChanges.Append('#MudaOutros=Procedure PessoaChangeSubtipo(IdPessoa: Integer)');
  PasChanges.Append('#GravaOutros=Procedure PessoaSaveSubtipo(Sender: TObject)');

  PasChanges.Append('#FazerInserirDetalhe=Procedure CmeDetalheInsert(Sender: TObject);');
  PasChanges.Append('#FazerAlterarDetalhe=Procedure CmeDetalheEdit(Sender: TObject);');
  PasChanges.Append('#FazerExcluirDetalhe=Procedure CmeDetalheDelete(Sender: TObject);');
  PasChanges.Append('#FazerConfirmaDetalhe=Procedure CmeDetalheConfirma(Sender: TObject);');
  PasChanges.Append('#FazerCancelaDetalhe=Procedure CmeDetalheCancel(Sender: TObject);');
  PasChanges.Append('#VerificaBotoesDetalhe=Procedure CmeDetalheAtualizaBotoes(Sender: TObject);');

  PasChanges.Append('#FazerOpen=Procedure CmeCadastroOpenDataSet(Sender: TObject);');
  PasChanges.Append('#FazerClose=Procedure CmeCadastroCloseDataSet(Sender: TObject);');
  PasChanges.Append('#FazerInsert=Procedure CmeCadastroInsert(Sender: TObject);');
  PasChanges.Append('#FazerEdit=Procedure CmeCadastroEdit(Sender: TObject);');
  PasChanges.Append('#FazerDelete=Procedure CmeCadastroDelete(Sender: TObject);');
  PasChanges.Append('#FazerCancel=Procedure CmeCadastroCancel(Sender: TObject);');
  PasChanges.Append('#FazerProcurar=Procedure CmeCadastroFind(Sender: TObject);');
  PasChanges.Append('#FazerConfirma=Procedure CmeCadastroConfirma(Sender: TObject);');
  PasChanges.Append('#TestarConfirma=Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);');
  PasChanges.Append('#AtualizaBotoes=Procedure CmeCadastroAtualizaBotoes(Sender: TObject);');

  //Chamadas Aos métodos na implementation
  PasChanges.Append('MudaPessoa=Pessoa.ChangePessoa(IdPessoa)');
  PasChanges.Append('MudaOutros=Pessoa.ChangeSubtipo(IdPessoa)');
  PasChanges.Append('GravaOutros=PessoaSave.Subtipo(Self)');

  PasChanges.Append('FazerInserirDetalhe=CmeDetalhe.Insert(Self)');
  PasChanges.Append('FazerAlterarDetalhe=CmeDetalhe.Edit(Self)');
  PasChanges.Append('FazerExcluirDetalhe=CmeDetalhe.Delete(Self)');
  PasChanges.Append('FazerConfirmaDetalhe=CmeDetalhe.Confirma(Self)');
  PasChanges.Append('FazerCancelaDetalhe=CmeDetalhe.Cancel(Self)');
  PasChanges.Append('VerificaBotoesDetalhe=CmeDetalhe.AtualizaBotoes(Self)');

  PasChanges.Append('FazerOpen=CmeCadastro.OpenDataSet(Self)');
  PasChanges.Append('FazerClose=CmeCadastro.CloseDataSet(Self)');
  PasChanges.Append('FazerInsert=CmeCadastro.Insert(Self)');
  PasChanges.Append('FazerEdit=CmeCadastro.Edit(Self)');
  PasChanges.Append('FazerDelete=CmeCadastro.Delete(Self)');
  PasChanges.Append('FazerCancel=CmeCadastro.Cancel(Self)');
  PasChanges.Append('FazerProcurar=CmeCadastro.Find(Self)');
  PasChanges.Append('FazerConfirma=CmeCadastro.Confirma(Self)');
  PasChanges.Append('TestarConfirma=CmeCadastro.BeforeConfirma(sender,True)');

  DfmChanges := TStringList.Create;

finalization
  PasChanges.Free;
  DfmChanges.Free;

end.
