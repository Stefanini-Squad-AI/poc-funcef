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
unit fManutAutCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls;

type
  TFrmManutAutCons = class(TfrmOkCancelar)
    LstTabSelec: TListView;
    LstTabNaoSelec: TListView;
    BtnDireitos: TBitBtn;
    BtnAdd: TSpeedButton;
    BtnAddAll: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnDelAll: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    EdNome: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnAddAllClick(Sender: TObject);
    procedure BtnDelAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDireitosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutAutCons: TFrmManutAutCons;

implementation

uses fTelaAut, fUserManager, dbasedados, uMensErro, fManutColTabCons,
     uCtrlGrupoUsu;

{$R *.DFM}

procedure TFrmManutAutCons.FormCreate(Sender: TObject);
Var
  i: Integer;
  stabela: String;
  liTrab: TListItem;
  slTabelas: TStringList;
begin
  inherited;
  LstTabNaoSelec.Items.Clear;
  LstTabSelec.Items.Clear;

  With FrmUserManager Do
  Begin
       If CdsColunaAcesso.Active Then CdsColunaAcesso.Close;
       If CdsDataViewAcesso.Active Then CdsDataViewAcesso.Close;
       If CdsColunasToAppend.Active Then CdsColunasToAppend.Close;

       SQLColunasToAppend.Open;

       EdNome.Text := ActivePageAutoriza.ItemFocused.Caption;

       If CdsTabelaAcesso.Active Then CdsTabelaAcesso.Close;
       SQLTabelaAcesso.Prepare;
       // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
       if lstUsuario.Focused then
         SQLTabelaAcesso.ParamByName( 'IdEspAcesso' ).AsInteger := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 5 ] );  // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       if lstGrupo.Focused then
         SQLTabelaAcesso.ParamByName( 'IdEspAcesso' ).AsInteger := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 3 ] );
       // Término - Michelle Mota - SOL: 268414 - PPM: 1256276
       SQLTabelaAcesso.Open;

       While Not CdsTabelaAcesso.Eof Do
       Begin
          liTrab := LstTabSelec.Items.Add;
          liTrab.Caption    := CdsTabelaAcesso.FieldByName( 'Table_Name' ).AsString;
          liTrab.ImageIndex := 0;
          CdsTabelaAcesso.Next;
       End;

       slTabelas := TStringList.Create;
       dtmBaseDados.dbBaseDados.Session.GetTableNames( 'BaseDados', 'CM.*', False, False, slTabelas );

       For i := 0 To slTabelas.Count - 1 Do Begin
           stabela := Copy( slTabelas[ i ], 4, Length( slTabelas[ i ] ) - 3 );

           If Not CdsTabelaAcesso.Locate( 'Table_Name', stabela, [] ) Then Begin
              liTrab := LstTabNaoSelec.Items.Add;
              liTrab.Caption    := stabela;
              liTrab.ImageIndex := 0;
           End;
       End;
  End;

  LstTabSelec.SortType    := stText;
  LstTabNaoSelec.SortType := stText;
end;

procedure TFrmManutAutCons.BtnAddClick(Sender: TObject);
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

procedure TFrmManutAutCons.BtnDelClick(Sender: TObject);
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

procedure TFrmManutAutCons.BtnAddAllClick(Sender: TObject);
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

procedure TFrmManutAutCons.BtnDelAllClick(Sender: TObject);
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

procedure TFrmManutAutCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i, idespacesso: Integer;//Michelle Mota - SOL: 268414 - PPM: 1256276
  bAchou: Boolean;
begin
  inherited;
  With FrmUserManager Do
  Begin
     If FrmManutAutCons.ModalResult <> MrOk Then
     Begin
        CdsTabelaAcesso.Close;
        CdsColunaAcesso.Close;
     End
     Else
     Begin
        //Apaga os Registros associados

        CdsTabelaAcesso.First;
        If (lstTabSelec.Items.Count = 0) Then
        Begin
           While Not CdsTabelaAcesso.Eof Do CdsTabelaAcesso.Delete;
        End
        Else
        Begin
           While Not CdsTabelaAcesso.Eof Do
           Begin
              bAchou := True;

              For i := 0 To lstTabSelec.Items.Count - 1 Do
              Begin
                 bAchou := (UpperCase(Trim(CdsTabelaAcesso.FieldByName( 'Table_Name' ).AsString)) = UpperCase(Trim(lstTabSelec.Items[ i ].Caption)));

                 If bAchou Then Break;
              End;

              If Not bAchou Then
                 CdsTabelaAcesso.Delete
              Else
                 CdsTabelaAcesso.Next;
           End;

           //Insere no cds os registros equivalentes as tabelas
           For i := 0 To lstTabSelec.Items.Count - 1 Do
              If Not CdsTabelaAcesso.Locate( 'Table_Name', lstTabSelec.Items[ i ].Caption, [] ) Then
              Begin
                 CdsTabelaAcesso.Append;
                 // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
                 if gUsuario then
                   idespacesso := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 5 ] );// Michelle Mota - SOL: 253300/17804 - PPM: 1093186
                 if gGrupo then
                   idespacesso := StrToInt( ActivePageAutoriza.ItemFocused.SubItems[ 3 ] );

                 CdsTabelaAcesso.FieldByName( 'IdEspAcesso' ).AsInteger := idespacesso;
                 // Término - Michelle Mota - SOL: 268414 - PPM: 1256276

                 CdsTabelaAcesso.FieldByName( 'Table_Name' ).AsString   := lstTabSelec.Items[ i ].Caption;
                 CdsTabelaAcesso.Post;
              End;
        End;

        If Not GrupoUsu.ProcessaGrupoUsu(null, CdsTabelaAcesso.Data, CdsColunasToAppend.Data, null, null, null, null, null, null, null, opTabCol) Then
           MsgDlg(GrupoUsu.MessageInfo, 'Erro', MtError, [MbOk], 0);
     End;
  End;
end;

procedure TFrmManutAutCons.BtnDireitosClick(Sender: TObject);
begin
  inherited;
  If LstTabSelec.ItemFocused <> Nil Then
     AbrirFormModal( FrmManutColTabCons, TFrmManutColTabCons );
end;

end.
