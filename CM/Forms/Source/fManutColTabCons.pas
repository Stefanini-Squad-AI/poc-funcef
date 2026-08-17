unit fManutColTabCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, ComCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, ExtCtrls;

type
  TFrmManutColTabCons = class(TfrmOkCancelar)
    Label3: TLabel;
    LstColSelec: TListView;
    Label4: TLabel;
    LstColNaoSelec: TListView;
    BtnAdd: TSpeedButton;
    BtnAddAll: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnDelAll: TSpeedButton;
    EdNome: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnAddAllClick(Sender: TObject);
    procedure BtnDelAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutColTabCons: TFrmManutColTabCons;

implementation

uses fManutAutCons, fUserManager, uMensErro, uDatabase, dBaseDados;

{$R *.DFM}

procedure TFrmManutColTabCons.FormCreate(Sender: TObject);
Var
  i, x: Integer;
  liTrab: TListItem;
  slColunas: TStringList;
begin
  inherited;
  EdNome.Text := FrmManutAutCons.LstTabSelec.ItemFocused.Caption;
  LstColNaoSelec.Items.Clear;
  LstColSelec.Items.Clear;

  With FrmUserManager Do
  Begin
     If lstAuxTabelas.IndexOf(FrmManutAutCons.lstTabSelec.ItemFocused.caption) = -1 Then
     Begin
        If CdsColunaAcesso.Active Then CdsColunaAcesso.Close;

        SQLColunaAcesso.Prepare;
        SQLColunaAcesso.ParamByName( 'IdEspAcesso' ).AsInteger := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 3 ] );
        SQLColunaAcesso.ParamByName( 'Table_Name' ).AsString   := FrmManutAutCons.lstTabSelec.ItemFocused.caption;
        SQLColunaAcesso.Open;

        lstAuxTabelas.Add(FrmManutAutCons.lstTabSelec.ItemFocused.caption);

        While Not CdsColunaAcesso.Eof Do
        Begin
           If Not CdsColunasToAppend.Locate( 'TABLE_NAME;COLUMN_NAME', VarArrayOf([FrmManutAutCons.lstTabSelec.ItemFocused.caption,CdsColunaAcesso.FieldByName( 'Column_Name' ).AsString]), [] ) Then
           Begin
              CdsColunasToAppend.Append;
              For X:=0 To CdsColunaAcesso.Fields.Count - 1 Do
                 CdsColunasToAppend.Fields[x].Value := CdsColunaAcesso.Fields[x].Value ;
              CdsColunasToAppend.Post;
           End;

           liTrab := LstColSelec.Items.Add;
           liTrab.Caption    := CdsColunaAcesso.FieldByName( 'Column_Name' ).AsString;
           liTrab.ImageIndex := 0;
           CdsColunaAcesso.Next;
        End;

        slColunas := TStringList.Create;
        Try
          dtmBaseDados.SQL.SQL.Text := 'SELECT * FROM ' +
                                       FrmManutAutCons.lstTabSelec.ItemFocused.caption + ' WHERE 1=2';
          dtmBaseDados.SQL.Open;

          dtmBaseDados.Cds.GetFieldNames( slColunas );

          dtmBaseDados.Cds.Close;

          For i := 0 To slColunas.Count - 1 Do Begin
              If Not CdsColunaAcesso.Locate( 'Column_Name', slColunas[ i ], [] ) Then Begin
                 liTrab := LstColNaoSelec.Items.Add;
                 liTrab.Caption    := slColunas[ i ];
                 liTrab.ImageIndex := 0;
              End;
          End;
        finally
          slColunas.Free;
        End;
     End
     Else
     Begin
        CdsColunasToAppend.First;
        While Not CdsColunasToAppend.Eof Do
        Begin
           If (CdsColunasToAppend.FieldByName('TABLE_NAME').AsString = FrmManutAutCons.lstTabSelec.ItemFocused.caption) Then
           Begin
              liTrab := LstColSelec.Items.Add;
              liTrab.Caption    := CdsColunasToAppend.FieldByName( 'COLUMN_NAME' ).AsString;
              liTrab.ImageIndex := 0;
           End;
           
           CdsColunasToAppend.Next;
        End;

        slColunas := TStringList.Create;
        Try
          dtmBaseDados.SQL.SQL.Text := 'SELECT * FROM ' +
                                       FrmManutAutCons.lstTabSelec.ItemFocused.caption + ' WHERE 1=2';
          dtmBaseDados.SQL.Open;

          dtmBaseDados.Cds.GetFieldNames( slColunas );

          dtmBaseDados.Cds.Close;

          For i := 0 To slColunas.Count - 1 Do Begin
              If Not CdsColunasToAppend.Locate( 'TABLE_NAME;COLUMN_NAME', VarArrayOf([FrmManutAutCons.lstTabSelec.ItemFocused.caption, slColunas[ i ]]), [] ) Then
              Begin
                 liTrab := LstColNaoSelec.Items.Add;
                 liTrab.Caption    := slColunas[ i ];
                 liTrab.ImageIndex := 0;
              End;
          End;
        finally
          slColunas.Free;
        End;
     End;
  End;
end;

procedure TFrmManutColTabCons.BtnAddClick(Sender: TObject);
Var
   i: Integer;
   liTrab: TListItem;
begin
  inherited;
  i := 0;

  While i < LstColNaoSelec.Items.Count Do Begin
      If LstColNaoSelec.Items[ i ].Selected Then Begin
         liTrab := LstColSelec.Items.Add;
         liTrab.ImageIndex := 0;
         liTrab.Caption  := LstColNaoSelec.Items[ i ].Caption;
         liTrab.SubItems := LstColNaoSelec.Items[ i ].SubItems;
         LstColNaoSelec.Items[ i ].Delete;
      End Else
          Inc( i );
  End;
end;

procedure TFrmManutColTabCons.BtnDelClick(Sender: TObject);
Var
   i: Integer;
   liTrab: TListItem;
begin
  inherited;
  i := 0;

  While i < LstColSelec.Items.Count Do Begin
      If LstColSelec.Items[ i ].Selected Then Begin
         liTrab := LstColNaoSelec.Items.Add;
         liTrab.ImageIndex := 0;
         liTrab.Caption  := LstColSelec.Items[ i ].Caption;
         liTrab.SubItems := LstColSelec.Items[ i ].SubItems;
         LstColSelec.Items[ i ].Delete;
      End Else
          Inc( i );
  End;
end;

procedure TFrmManutColTabCons.BtnAddAllClick(Sender: TObject);
Var
   liTrab: TListItem;
begin
  inherited;

  While LstColNaoSelec.Items.Count > 0 Do Begin
        liTrab := LstColSelec.Items.Add;
        liTrab.ImageIndex := 0;
        liTrab.Caption  := LstColNaoSelec.Items[ 0 ].Caption;
        liTrab.SubItems := LstColNaoSelec.Items[ 0 ].SubItems;
        LstColNaoSelec.Items[ 0 ].Delete;
  End;
end;

procedure TFrmManutColTabCons.BtnDelAllClick(Sender: TObject);
Var
   liTrab: TListItem;
begin
  inherited;

  While LstColSelec.Items.Count > 0 Do Begin
        liTrab := LstColNaoSelec.Items.Add;
        liTrab.ImageIndex := 0;
        liTrab.Caption  := LstColSelec.Items[ 0 ].Caption;
        liTrab.SubItems := LstColSelec.Items[ 0 ].SubItems;
        LstColSelec.Items[ 0 ].Delete;
  End;
end;

procedure TFrmManutColTabCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: Integer;
  bAchou: Boolean;
begin
  inherited;
  With FrmUserManager Do
  Begin
     If FrmManutColTabCons.ModalResult <> MrOk Then
     Begin
        If CdsColunaAcesso.ChangeCount > 0 Then
           CdsColunaAcesso.CancelUpdates;
     End
     Else
     Begin
        //Apaga os Registros Associados
        CdsColunasToAppend.First;
        While Not CdsColunasToAppend.Eof Do
           If CdsColunasToAppend.FieldByName('TABLE_NAME').AsString = FrmManutAutCons.lstTabSelec.ItemFocused.Caption Then
              CdsColunasToAppend.Delete
           Else
              CdsColunasToAppend.Next;

        //Inclui as colunas associadas na lista
        For i := 0 To lstColSelec.Items.Count - 1 Do
        Begin
           CdsColunasToAppend.Append;
           CdsColunasToAppend.FieldByName( 'IdEspAcesso' ).AsInteger := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 3 ] );
           CdsColunasToAppend.FieldByName( 'Table_Name' ).AsString   := FrmManutAutCons.lstTabSelec.ItemFocused.Caption;
           CdsColunasToAppend.FieldByName( 'Column_Name' ).AsString  := lstColSelec.Items[ i ].Caption;
           CdsColunasToAppend.Post;
        End;
     End;
  End;
end;

end.
