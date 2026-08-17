//*****************************************************************************
// SISTEMA : Forms CM 
//******************************************************************************
// Nº SOL: 268414
// Nº KINTANA/PPM: 1256276
// Data da Alteração: 29.01.2016
// Responsável: Michelle Suellyn Mota
// Descrição: ERRO - mensagens de erro ao manipular grupos, conceder permissão
// direitos, visões, tabelas - Cadastro de Usuários.
{******************************************************************************
// Nº SOL: 253300/17804
// Nº KINTANA/PPM: 1093186
// Data da Alteração: 17.11.2015
// Responsável: Michelle S. Mota
// Descrição: Melhoria na funcionalidade de cadastro de usuários disponível em
// todos os módulos do PLANUS.
//******************************************************************************}
unit FManutAutVisoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, ComCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, ExtCtrls;

type
  TFrmManutAutVisoes = class(TfrmOkCancelar)
    Label3: TLabel;
    LstTabSelec: TListView;
    LstTabNaoSelec: TListView;
    Label4: TLabel;
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
  FrmManutAutVisoes: TFrmManutAutVisoes;

implementation

uses fUserManager, dBaseDados, uCtrlGrupoUsu, uMensErro;

{$R *.DFM}

procedure TFrmManutAutVisoes.FormCreate(Sender: TObject);
var
  liTrab: TListItem;
begin
  inherited;
  LstTabNaoSelec.Items.Clear;
  LstTabSelec.Items.Clear;

  With FrmUserManager Do Begin
       EdNome.Text := ActivePageAutoriza.ItemFocused.Caption;

       If CdsDataViewAcesso.Active Then CdsDataViewAcesso.Close;
       If CdsTabelaAcesso.Active Then CdsTabelaAcesso.Close;
       If CdsColunaAcesso.Active Then CdsColunaAcesso.Close;
       If CdsColunasToAppend.Active Then CdsColunasToAppend.Close;

       SQLDataViewAcesso.Prepare;
       // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
       if lstUsuario.Focused then
         SQLDataViewAcesso.ParamByName( 'IdEspAcesso' ).AsInteger := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 5 ] ); // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       if lstGrupo.Focused then
         SQLDataViewAcesso.ParamByName( 'IdEspAcesso' ).AsInteger := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 3 ] );
       // Término - Michelle Mota - SOL: 268414 - PPM: 1256276

       SQLDataViewAcesso.Open;

       While Not CdsDataViewAcesso.Eof Do
       Begin
          liTrab := LstTabSelec.Items.Add;
          liTrab.ImageIndex := 0;
          liTrab.Caption    := CdsDataViewAcesso.FieldByName( 'Name' ).AsString;
          liTrab.SubItems.Add( CdsDataViewAcesso.FieldByName( 'IdDataview' ).AsString );
          liTrab.SubItems.Add( CdsDataViewAcesso.FieldByName( 'Origemcmdv' ).AsString );
          CdsDataViewAcesso.Next;
       End;

       dtmBaseDados.Cds.Close;
       dtmBaseDados.SQL.SQL.Clear;
       dtmBaseDados.SQL.Sql.Add( 'Select Name, IdDataview, OrigemCmDv From Dataview' );
       dtmBaseDados.SQL.Sql.Add( 'Where Not To_Char( IdDataview ) || ''-'' || To_Char( Origemcmdv ) In (' );
       dtmBaseDados.SQL.Sql.Add( '      Select To_Char( IdDataview ) || ''-'' || To_Char( Origemcmdv )' );
       dtmBaseDados.SQL.Sql.Add( '        From DataviewAcesso' );
       dtmBaseDados.SQL.Sql.Add( '       Where IdEspAcesso = :idespacesso )' );
       
       dtmBaseDados.SQL.Prepare;
       // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
       if lstUsuario.Focused then
         dtmBaseDados.SQL.ParamByName( 'IdEspAcesso' ).AsInteger := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 5 ] ); // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       if lstGrupo.Focused then
         dtmBaseDados.SQL.ParamByName( 'IdEspAcesso' ).AsInteger := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 3 ] );
       // Término - Michelle Mota - SOL: 268414 - PPM: 1256276

       dtmBaseDados.SQL.Open;

       While Not dtmBaseDados.Cds.Eof Do Begin
             liTrab := LstTabNaoSelec.Items.Add;
             liTrab.ImageIndex := 0;
             liTrab.Caption    := dtmBaseDados.Cds.FieldByName( 'Name' ).AsString;
             liTrab.SubItems.Add( dtmBaseDados.Cds.FieldByName( 'IdDataview' ).AsString );
             liTrab.SubItems.Add( dtmBaseDados.Cds.FieldByName( 'Origemcmdv' ).AsString );
             dtmBaseDados.Cds.Next;
       End;

       dtmBaseDados.Cds.Close;
  End;

  LstTabSelec.SortType    := stText;
  LstTabNaoSelec.SortType := stText;
end;

procedure TFrmManutAutVisoes.BtnAddClick(Sender: TObject);
Var
   i: Integer;
   liTrab: TListItem;
begin
  inherited;
  i := 0;

  While i < LstTabNaoSelec.Items.Count Do Begin
        If LstTabNaoSelec.Items[ i ].Selected Then Begin
           liTrab := LstTabSelec.Items.Add;
           liTrab.ImageIndex := 0;
           liTrab.Caption  := LstTabNaoSelec.Items[ i ].Caption;
           liTrab.SubItems := LstTabNaoSelec.Items[ i ].SubItems;
           LstTabNaoSelec.Items[ i ].Delete;
        End Else
           Inc( i );
  End;
end;

procedure TFrmManutAutVisoes.BtnDelClick(Sender: TObject);
Var
   i: Integer;
   liTrab: TListItem;
begin
  inherited;
  i := 0;

  While i < LstTabSelec.Items.Count Do Begin
        If LstTabSelec.Items[ i ].Selected Then Begin
           liTrab := LstTabNaoSelec.Items.Add;
           liTrab.ImageIndex := 0;
           liTrab.Caption  := LstTabSelec.Items[ i ].Caption;
           liTrab.SubItems := LstTabSelec.Items[ i ].SubItems;
           LstTabSelec.Items[ i ].Delete;
        End Else
           Inc( i );
  End;
end;

procedure TFrmManutAutVisoes.BtnAddAllClick(Sender: TObject);
Var
   liTrab: TListItem;
begin
  inherited;

  While LstTabNaoSelec.Items.Count > 0 Do Begin
        liTrab := LstTabSelec.Items.Add;
        liTrab.ImageIndex := 0;
        liTrab.Caption  := LstTabNaoSelec.Items[ 0 ].Caption;
        liTrab.SubItems := LstTabNaoSelec.Items[ 0 ].SubItems;
        LstTabNaoSelec.Items[ 0 ].Delete;
  End;
end;

procedure TFrmManutAutVisoes.BtnDelAllClick(Sender: TObject);
Var
   liTrab: TListItem;
begin
  inherited;

  While LstTabSelec.Items.Count > 0 Do Begin
        liTrab := LstTabNaoSelec.Items.Add;
        liTrab.ImageIndex := 0;
        liTrab.Caption  := LstTabSelec.Items[ 0 ].Caption;
        liTrab.SubItems := LstTabSelec.Items[ 0 ].SubItems;
        LstTabSelec.Items[ 0 ].Delete;
  End;
end;

procedure TFrmManutAutVisoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i, idespacesso: Integer;//Michelle Mota - SOL: 268414 - PPM: 1256276
  bAchou: Boolean;
begin
  inherited;
  With FrmuserManager Do
  Begin
     If FrmManutAutVisoes.ModalResult = MrOk Then
     Begin
        CdsDataViewAcesso.First;
        If (lstTabSelec.Items.Count = 0) Then
        Begin
           While Not CdsDataViewAcesso.Eof Do CdsDataViewAcesso.Delete;
        End
        Else
        Begin
           While Not CdsDataViewAcesso.Eof Do
           Begin
              bAchou := True;

              For i := 0 To lstTabSelec.Items.Count - 1 Do
              Begin
                 bAchou := (UpperCase(Trim(CdsDataViewAcesso.FieldByName( 'NAME' ).AsString)) = UpperCase(Trim(lstTabSelec.Items[ i ].Caption)));

                 If bAchou Then Break;
              End;

              If Not bAchou Then
                 CdsDataViewAcesso.Delete
              Else
                 CdsDataViewAcesso.Next;
           End;

           For i := 0 To lstTabSelec.Items.Count - 1 Do
           Begin
              If Not CdsDataViewAcesso.Locate( 'NAME', lstTabSelec.Items[ i ].Caption, [] ) Then
              Begin
                 CdsDataViewAcesso.Append;
                 // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
                 if gUsuario then
                  idespacesso := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 5 ] );  // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
                 if gGrupo then
                  idespacesso := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 3 ] );

                 CdsDataViewAcesso.FieldByName( 'IdEspAcesso' ).AsInteger := idespacesso;
                 // Término - Michelle Mota - SOL: 268414 - PPM: 1256276

                 CdsDataViewAcesso.FieldByName( 'IdDataview' ).AsInteger  := StrToInt( lstTabSelec.Items[ i ].SubItems[ 0 ] );
                 CdsDataViewAcesso.FieldByName( 'Origemcmdv' ).AsInteger  := StrToInt( lstTabSelec.Items[ i ].SubItems[ 1 ] );
                 CdsDataViewAcesso.Post;
              End;
           End;
        End;

        If Not GrupoUsu.ProcessaGrupoUsu(CdsDataViewAcesso.Data, null, null, null, null, null, null, null, null, null, OpVisoes) Then
           MsgDlg(GrupoUsu.MessageInfo, 'Erro', MtError, [MbOk], 0);
     End;
  End;
end;

end.
