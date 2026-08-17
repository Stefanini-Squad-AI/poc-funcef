unit fObjExpert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, EditReg, Buttons, ExtCtrls, Db, DBTables, DBClient,
  Grids, DBGrids, Provider, BfDialogs, BrowseFolder, uProcuraDir, JclfileUtils,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, Wwdbigrd, Wwdbgrid, JclStrings, TB97,
  CmDock;

type
  TFrmObjExpert = class(TForm)
    PgBo: TPageControl;
    TbsConnect: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtUsuario: TEditReg;
    EdtSenha: TEditReg;
    EdtAlias: TEditReg;
    DbBussinesObject: TDatabase;
    BtnTestaCon: TBitBtn;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    DsColunas: TDataSource;
    QryColunas: TQuery;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtNomeUnit: TEdit;
    EdtNomeClasse: TEdit;
    BtnUnit: TSpeedButton;
    BtnGerarClasse: TBitBtn;
    DlgPath: TProcuraDirDlg;
    EdtUnitPath: TEditReg;
    CmbTabelas: TwwDBComboBox;
    GrdColunas: TwwDBGrid;
    QrySelPrimary: TQuery;
    UpdColunas: TUpdateSQL;
    QryColunasCOLUMN_NAME: TStringField;
    QryColunasDATA_TYPE: TStringField;
    QryColunasDATA_LENGTH: TFloatField;
    QryColunasNULLABLE: TStringField;
    QryColunasKEY: TStringField;
    QryColunasOK: TStringField;
    QryColunasNULLIFZERO: TStringField;
    QryColunasREADONLY: TStringField;
    CMOkCancelar1: TCMOkCancelar;
    Image1: TImage;
    Image2: TImage;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    QryColunasSEQUENCENAME: TStringField;
    QryColunasDISPLAYLABEL: TStringField;
    TbsCtrlObj: TTabSheet;
    Label12: TLabel;
    EdtCtrlObjPath: TEditReg;
    Label13: TLabel;
    EdtUnitCtrl: TEdit;
    EdtClasseCtrl: TEdit;
    Label14: TLabel;
    BtnSelUnit: TSpeedButton;
    Label15: TLabel;
    Qry: TQuery;
    Cds: TClientDataSet;
    Dsp: TDataSetProvider;
    Ds: TDataSource;
    wwDBGrid1: TwwDBGrid;
    CmbTipo: TwwDBComboBox;
    CmbEscopo: TwwDBComboBox;
    CmbClasse: TwwDBComboBox;
    BitBtn1: TBitBtn;
    Bevel3: TBevel;
    Image3: TImage;
    Label16: TLabel;
    procedure BtnTestaConClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PgBoChange(Sender: TObject);
    procedure BtnUnitClick(Sender: TObject);
    procedure BtnGerarClasseClick(Sender: TObject);
    procedure CmbTabelasCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CMOkCancelar1SairClick(Sender: TObject);
    procedure BtnSelUnitClick(Sender: TObject);
    procedure CmbClasseExit(Sender: TObject);
    procedure EdtClasseCtrlChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    LstUnit, LstUnitFinal, LstCtrl, LstCtrlFinal: Tstrings;
    function SmartCase(S: String): String;
    function Change(sOldStr, sNewStr, sString: String): String;
    function RemoveOwner(sTableName: String): String;
  public
    { Public declarations }
    class function Execute: Boolean;
  end;

implementation

{$R *.DFM}

procedure TFrmObjExpert.BtnTestaConClick(Sender: TObject);
begin
  If DbBussinesObject.Connected Then DbBussinesObject.Close;
  DbBussinesObject.Params.Values['SERVER NAME'] := EdtAlias.Text;
  DbBussinesObject.Params.Values['USER NAME'] := EdtUsuario.Text;
  DbBussinesObject.Params.Values['PASSWORD'] := EdtSenha.Text;
  Try
    DbBussinesObject.Open;
    ShowMessage('Conectado Com Sucesso!');
  Except
    Raise;
  End;
end;

procedure TFrmObjExpert.FormCreate(Sender: TObject);
begin
  If FileExists(PathAddSeparator(ExtractFilePath(Application.ExeName)) + 'CmObjBuilder.Ini') Then
     CmbClasse.Items.LoadFromFile(PathAddSeparator(ExtractFilePath(Application.ExeName)) + 'CmObjBuilder.Ini');

  PgBo.ActivePageIndex := 0;

  If DbBussinesObject.Connected Then DbBussinesObject.Close;
  DbBussinesObject.Params.Values['SERVER NAME'] := EdtAlias.Text;
  DbBussinesObject.Params.Values['USER NAME'] := EdtUsuario.Text;
  DbBussinesObject.Params.Values['PASSWORD'] := EdtSenha.Text;

  LstUnit := TStringList.Create;
  LstUnitFinal := TStringList.Create;
  LstCtrl := TStringList.Create;
  LstCtrlFinal := TStringList.Create;

//Unit da Classe **********************************
  LstUnit.Append('{*******************************************************}');
  LstUnit.Append('{                                                       }');
  LstUnit.Append('{ CM Soluções Informática                               }');
  LstUnit.Append('{ ** Todos os Direitos Reservados                       }');
  LstUnit.Append('{ Gerada pelo "CM Bussines Object Builder"              }');
  LstUnit.Append('{ Analista Responsável: Nome do Desenvolvedor           }');
  LstUnit.Append('{ Atualizado Em: ' + DateTostr(Date) + '                             }');
  LstUnit.Append('{                                                       }');
  LstUnit.Append('{*******************************************************}');
  LstUnit.Append('');
  LstUnit.Append('unit #nomeunit;');
  LstUnit.Append('');
  LstUnit.Append('interface');
  LstUnit.Append('');
  LstUnit.Append('Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;');
  LstUnit.Append('');
  LstUnit.Append('Type');
  LstUnit.Append('  #nomeclasse = class(TCmDbObject)');
  LstUnit.Append('');
  LstUnit.Append('  private');
  LstUnit.Append('');
  LstUnit.Append('  public');
  LstUnit.Append('');
  LstUnit.Append('     Property f#CriaCampos: TCmDbField;');
  LstUnit.Append('');
  LstUnit.Append('     Constructor Create(Aowner: TCmCustomCdbObject); Override;');
  LstUnit.Append('');
  LstUnit.Append('     Function Insert :Boolean; Override;');
  LstUnit.Append('  End;');
  LstUnit.Append('');
  LstUnit.Append('implementation');
  LstUnit.Append('');
  LstUnit.Append('{ #nomeclasse }');
  LstUnit.Append('');
  LstUnit.Append('constructor #nomeclasse.Create(Aowner: TCmCustomCdbObject);');
  LstUnit.Append('begin');
  LstUnit.Append('  inherited;');
  LstUnit.Append('  ErrorIfNoRowsAffected := False;');
  LstUnit.Append('');
  LstUnit.Append('  TableName := ''#tablename'';');
  LstUnit.Append('');
  LstUnit.Append('  #CriaColunas');
  LstUnit.Append('end;');
  LstUnit.Append('');
  LstUnit.Append('function #nomeclasse.Insert: Boolean;');
  LstUnit.Append('begin');
  LstUnit.Append('');
  LstUnit.Append('   #sequence');
  LstUnit.Append('   Result := Inherited Insert;');
  LstUnit.Append('');
  LstUnit.Append('end;');
  LstUnit.Append('');
  LstUnit.Append('');
  LstUnit.Append('end.');
  LstUnit.Append('');
  LstUnit.Append('');
  LstUnit.Append('');


  LstCtrl.Append('{*******************************************************}');
  LstCtrl.Append('{                                                       }');
  LstCtrl.Append('{ CM Soluções Informática                               }');
  LstCtrl.Append('{ ** Todos os Direitos Reservados                       }');
  LstCtrl.Append('{ Gerada pelo "CM Bussines Object Builder"              }');
  LstCtrl.Append('{ Analista Responsável:                                 }');
  LstCtrl.Append('{ Atualizado Em:                                        }');
  LstCtrl.Append('{                                                       }');
  LstCtrl.Append('{*******************************************************}');
  LstCtrl.Append('');
  LstCtrl.Append('unit #nomeunit;');
  LstCtrl.Append('');
  LstCtrl.Append('interface');
  LstCtrl.Append('');
  LstCtrl.Append('Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject; ');
  LstCtrl.Append('');
  LstCtrl.Append('Type');
  LstCtrl.Append('  #nomeclasse = class(TCmControlObject)');
  LstCtrl.Append('  Protected');
  LstCtrl.Append('     #varprotected');
  LstCtrl.Append('     procedure DoChangeDataBase; Override;');
  LstCtrl.Append('     #procedureprotected');
  LstCtrl.Append('     #functionprotected');
  LstCtrl.Append('     #propertyprotected');

  LstCtrl.Append('  private');
  LstCtrl.Append('     #varprivate');
  LstCtrl.Append('     #procedureprivate');
  LstCtrl.Append('     #functionprivate');
  LstCtrl.Append('     #propertyprivate');
  LstCtrl.Append('');
  LstCtrl.Append('  Public');
  LstCtrl.Append('     #varpublic');
  LstCtrl.Append('     constructor Create;  Override;');
  LstCtrl.Append('     Destructor  Destroy; Override;');
  LstCtrl.Append('     #procedurepublic');
  LstCtrl.Append('     #functionpublic');
  LstCtrl.Append('     #propertypublic');
  LstCtrl.Append('  End;');
  LstCtrl.Append('');
  LstCtrl.Append('implementation');
  LstCtrl.Append('');
  LstCtrl.Append('constructor #nomeclasse.Create;');
  LstCtrl.Append('begin');
  LstCtrl.Append('  inherited;');
  LstCtrl.Append('  #addconstructors');
  LstCtrl.Append('');
  LstCtrl.Append('end;');
  LstCtrl.Append('');
  LstCtrl.Append('destructor #nomeclasse.Destroy;');
  LstCtrl.Append('begin');
  LstCtrl.Append('  #adddestructors');
  LstCtrl.Append('  inherited;');
  LstCtrl.Append('');
  LstCtrl.Append('end;');
  LstCtrl.Append('');
  LstCtrl.Append('procedure #nomeclasse.DoChangeDataBase;');
  LstCtrl.Append('begin');
  LstCtrl.Append('  inherited;');
  LstCtrl.Append('  #adddchangedatabasename');
  LstCtrl.Append('end;');
  LstCtrl.Append('');
  LstCtrl.Append('end.');

//Fim Unit da Classe ******************************

end;

procedure TFrmObjExpert.PgBoChange(Sender: TObject);
begin
   Case PgBo.ActivePageIndex of
   0: ;
   1:
   Begin
      If Not DbBussinesObject.Connected Then   DbBussinesObject.Open;
      If CmbTabelas.Items.Count = 0 Then
         Session.GetTableNames('BussinesObject','',false,false,CmbTabelas.Items);
      QryColunas.Open;
   End;
   2:
   Begin
      If Not Cds.Active Then Cds.Open;
   End;
   End;
end;

procedure TFrmObjExpert.BtnUnitClick(Sender: TObject);
begin
   If DlgPath.Execute Then
      EdtUnitPath.Text := PathAddSeparator(DlgPath.Directory);
end;

procedure TFrmObjExpert.BtnGerarClasseClick(Sender: TObject);

Var
   X: Integer;
   sTipodeDado, sRequerido, sChave, sNullIfZero, sReadOnly: String;

   function VerificaCds: Boolean;
   Var
      Checked: Boolean;
   Begin
      Checked := False;

      QryColunas.DisableControls;
      QryColunas.First;
      While Not QryColunas.Eof Do
      Begin
        Checked := QryColunasOK.AsString = 'Y';

        If Checked Then
          QryColunas.Last
        Else
          QryColunas.Next;
      End;
      QryColunas.First;
      QryColunas.EnableControls;

      Result := Not QryColunas.IsEmpty And Checked;
   End;

   function VerificaArquivo: Boolean;
   Begin
      If (EdtNomeUnit.Text <> '') And
         (FileExists(PathAddSeparator(EdtUnitPath.Text) + EdtNomeUnit.Text)) And
         (Application.MessageBox('Já existe um arquivo com esse nome, deseja sobrescrever ?', 'Atenção', Mb_YesNo + Mb_IConQuestion) = Id_No) Then
         Result := False
      Else
         Result := True;
   End;
begin
   If (VerificaArquivo) And
      (EdtNomeUnit.Text <> '') And
      (EdtNomeClasse.Text <> '') And
      (EdtUnitPath.Text <> '') And
      (VerificaCds) Then
   Begin
      QryColunas.DisableControls;

      LstUnitFinal.Assign(LstUnit);
      X := 0;

      While LstUnitFinal[x] <> 'end.' Do
      Begin
          LstUnitFinal[x] := Change('#nomeunit',EdtNomeUnit.Text,LstUnitFinal[x]);

          LstUnitFinal[x] := Change('#nomeclasse',EdtNomeClasse.Text,LstUnitFinal[x]);

          LstUnitFinal[x] := Change('#tablename',RemoveOwner(CmbTabelas.Text),LstUnitFinal[x]);

          If (Pos('#sequence',LstUnitFinal[x]) <> 0) Then
          Begin
            QryColunas.First;
            LstUnitFinal.Delete(X);

            While Not QryColunas.Eof Do
            Begin
               If (QryColunasOK.AsString = 'Y') And
                 (QryColunasSEQUENCENAME.AsString <> '') Then
                  LstUnitFinal.Insert(X,'   f' + SmartCase(QryColunasCOLUMN_NAME.AsString) + '.AsFloat := GetSequence(' + QuotedStr(QryColunasSEQUENCENAME.AsString) + ');');

              QryColunas.Next;
            End;
          End;


          If (Pos('#CriaCampos',LstUnitFinal[x]) <> 0) Then
          Begin
            QryColunas.First;
            LstUnitFinal.Delete(X);

            While Not QryColunas.Eof Do
            Begin
              If (QryColunasOK.AsString = 'Y') Then
                 LstUnitFinal.Insert(X,'     Property ' + SmartCase(QryColunasCOLUMN_NAME.AsString) + ': TCmDbField;');

              QryColunas.Next;
            End;
          End;

          If (Pos('#CriaColunas',LstUnitFinal[x]) <> 0) Then
          Begin
            QryColunas.First;
            LstUnitFinal.Delete(X);

            While Not QryColunas.Eof Do
            Begin
              If QryColunasOK.AsString = 'Y' Then
              Begin
                 If (Pos(QryColunasDATA_TYPE.AsString,'RAWBLOBCLOBLONGLONG RAW') > 0) Then
                    sTipodeDado := 'ftBlob'
                 Else
                    If (Pos(QryColunasDATA_TYPE.AsString,'CHARVARCHAR2') > 0) Then
                      sTipodeDado := 'ftString'
                    Else
                       If (Pos(QryColunasDATA_TYPE.AsString,'DATE') > 0) Then
                          sTipodeDado := 'ftDateTime'
                       Else
                          If (Pos(QryColunasDATA_TYPE.AsString,'FLOAT, NUMBER') > 0) Then
                             sTipodeDado := 'ftfloat'
                          Else
                             sTipodeDado := '';

                 If QryColunasNULLABLE.AsString = 'N' Then
                   sRequerido := 'False'
                 Else
                   sRequerido := 'True';

                 If QryColunasKEY.AsString = 'Y' Then
                   sChave := 'True'
                 Else
                   sChave := 'False';

                 If QryColunasNULLIFZERO.AsString = 'Y' Then
                   sNullIfZero := 'True'
                 Else
                   sNullIfZero := 'False';

                 If QryColunasREADONLY.AsString = 'Y' Then
                   sReadOnly := 'True'
                 Else
                   sReadOnly := 'False';

                 LstUnitFinal.Insert(X,'   f' + SmartCase(QryColunasCOLUMN_NAME.AsString) + ' := CreateCmDbField(' + QuotedStr(QryColunasCOLUMN_NAME.AsString) + ',' + sTipodeDado + ',' + sRequerido + ',' + sChave + ',' +  sReadOnly + ',' +  sNullIfZero + ',' + QuotedStr(QryColunasDISPLAYLABEL.AsString) + ');');
              End;

              QryColunas.Next;
            End;

          End;

          Inc(x);
      End;

      QryColunas.EnableControls;

      LstUnitFinal.SaveToFile(EdtUnitPath.Text + EdtNomeUnit.Text + '.pas');

      Application.MessageBox(Pchar('Unit "' + EdtUnitPath.Text + EdtNomeUnit.Text + '.pas" Gerada com sucesso !'),'CM Bussines Object Builder',Mb_IconInformation);
   End;
end;

procedure TFrmObjExpert.CmbTabelasCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  If Select Then
     With QryColunas Do
     Begin
        If QrySelPrimary.Active Then QrySelPrimary.Close;
        QrySelPrimary.Params[0].AsString := RemoveOwner(CmbTabelas.Text);
        QrySelPrimary.Open;

        DisableControls;

        If Active Then Close;
        Params[0].AsString := RemoveOwner(CmbTabelas.Text);
        Open;

        While Not Eof Do
        Begin
           Edit;

           If ((Not QrySelPrimary.IsEmpty) And
               QrySelPrimary.Locate('COLUMN_NAME', QryColunasCOLUMN_NAME.AsString, [])) Then
              QryColunasKEY.ASString := 'Y'
           Else
              QryColunasKEY.ASString := 'N';

           If (QryColunasDATA_TYPE.AsString = 'NUMBER') And (QryColunasKEY.ASString = 'Y') Then
               QryColunasSEQUENCENAME.AsString := RemoveOwner(CmbTabelas.Text)
           Else
               QryColunasSEQUENCENAME.AsString := '';

           QryColunasDISPLAYLABEL.AsString := '';

           Post;
           Next;
        End;

        First;

        EnableControls;

        EdtNomeUnit.Text   := 'uDb' + SmartCase(RemoveOwner(CmbTabelas.Text));
        EdtNomeClasse.Text := 'TDb' + SmartCase(RemoveOwner(CmbTabelas.Text));
     End;
end;

procedure TFrmObjExpert.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   LstUnit.Free;
   LstUnitFinal.Free;

   LstCtrl.Free;
   LstCtrlFinal.Free;

   DbBussinesObject.Close;
   Action := caFree;

   CmbClasse.Items.SaveToFile(PathAddSeparator(ExtractFilePath(Application.ExeName)) + 'CmObjBuilder.Ini');
end;

class function TFrmObjExpert.Execute: Boolean;
begin
  with Self.Create(nil) do
    try
      Result := ShowModal = idOk;
    finally
      Free;
    end;
end;

function TFrmObjExpert.SmartCase(S: String): String;
Begin
   If S <> '' Then
     Result := UpperCase(S[1]) + LowerCase(Copy(S,2,Length(s)))
   Else
     Result := S;
End;

procedure TFrmObjExpert.CMOkCancelar1SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmObjExpert.BtnSelUnitClick(Sender: TObject);
begin
   If DlgPath.Execute Then
      EdtCtrlObjPath.Text := PathAddSeparator(DlgPath.Directory);
end;

procedure TFrmObjExpert.CmbClasseExit(Sender: TObject);
begin
  If (CmbClasse.Text <> '') And (CmbClasse.Items.IndexOf(CmbClasse.Text) = -1) Then
     CmbClasse.Items.Append(CmbClasse.Text);
end;

procedure TFrmObjExpert.EdtClasseCtrlChange(Sender: TObject);
begin
  EdtUnitCtrl.Text := 'u' + EdtClasseCtrl.Text + '.pas';
end;

procedure TFrmObjExpert.BitBtn1Click(Sender: TObject);
Var
  X: Integer;

  function VerificaArquivo: Boolean;
  Begin
     If (EdtClasseCtrl.Text <> '') And
        (FileExists(PathAddSeparator(EdtCtrlObjPath.Text) + EdtClasseCtrl.Text)) And
        (Application.MessageBox('Já existe um arquivo com esse nome, deseja sobrescrever ?', 'Atenção', Mb_YesNo + Mb_IConQuestion) = Id_No) Then
        Result := False
     Else
        Result := True;
  End;
begin
  LstCtrlFinal.Assign(LstCtrl);

  If (VerificaArquivo) And
     (EdtClasseCtrl.Text <> '') And
     (EdtUnitCtrl.Text <> '') And
     (EdtCtrlObjPath.Text <> '') And
     (Not Cds.IsEmpty) Then
  Begin

      While LstCtrlFinal[x] <> 'end.' Do
      Begin
          {**
            Processamento com substituição da palavra chave
          **}
          LstCtrlFinal[x] := Change('#palavrachave',EdtNomeUnit.Text,LstUnitFinal[x]);


          If (Pos('#palavrachave',LstUnitFinal[x]) <> 0) Then
          Begin
             {**
               Processamento sem exclusão da palavra chave
             **}
             LstCtrlFinal.Insert(X,'Novo Conteúdo');
          End;
      End;

      LstCtrlFinal.SaveToFile(EdtUnitPath.Text + EdtUnitCtrl.Text + '.pas');

      Application.MessageBox(Pchar('Unit "' + EdtCtrlObjPath.Text + EdtUnitCtrl.Text + '.pas" Gerada com sucesso !'),'CM Bussines Object Builder',Mb_IconInformation);
   End;
end;

function TFrmObjExpert.Change(sOldStr, sNewStr, sString: String) :String;
Var
  sAux: String;
  iPos: Integer;
Begin
  iPos := Pos(sOldStr, sString);

  If iPos > 0 Then
  Begin
    sAux := sString;
    Delete(sAux,iPos,Length(sOldStr));
    Insert(sNewStr,sAux,iPos);
    Result := sAux;
  End
  Else
    Result := sString;
End;


function TFrmObjExpert.RemoveOwner(sTableName: String): String;
begin
   If Pos('CM.',UpperCase(sTableName)) <> 0 Then
     Result := Copy(sTableName,4,Length(sTableName))
   Else
     Result := sTableName;
end;

end.


