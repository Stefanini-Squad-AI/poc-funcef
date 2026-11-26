//*****************************************************************************
//  SISTEMA    : Forms CM
//******************************************************************************
// Nº SOL: 268414
// Nº KINTANA/PPM: 1256276
// Data da Alteração: 29.01.2016
// Responsável: Michelle Suellyn Mota
// Descrição: ERRO - mensagens de erro ao manipular grupos, conceder permissão
// direitos, visões, tabelas - Cadastro de Usuários.
//******************************************************************************
// Nº SOL: 253300/17804
// Nº KINTANA/PPM: 1093186
// Data da Alteração: 17.11.2015
// Responsável: Michelle S. Mota
// Descrição: Melhoria na funcionalidade de cadastro de usuários disponível em
// todos os módulos do PLANUS.
//******************************************************************************
//  Autor      : Higor Nayde Ferreira
//  Rotina     : FormSize
//  Data       : 11/12/2014
//  Descrição  : Ajuste para maximizar o form e ajustar os componentes
//  Pendência  : 224064   Kintana: 2059453
//******************************************************************************
//  Autor      : Antonio Marcos (amf)
//  Rotina     : FormCreate
//  Data       : 30.03.2003
//  Descrição  : Verificação do parâmetro que indica ativação de crítica de grupo.
//  Pendência  : 24190
//------------------------------------------------------------------------------
//  Autor      : David
//  Rotina     : FormCreate
//  Data       : 09.12.2003
//  Descrição  : Restrição de associação de funcionário a grupos cujos cargos,
//               funções e centros de custos são incompatíveis aos seus.
//  Pendencia  : 15759
//------------------------------------------------------------------------------

unit FGrupoxUsu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, ComCtrls, ImgList;

type
  TFrmGrupoxUsu = class(TfrmOkCancelar)
    ImlImages: TImageList;
    Bevel1: TBevel;
    BtnDelAll: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnAddAll: TSpeedButton;
    BtnAdd: TSpeedButton;
    LstGrupoMembros: TListView;
    Label3: TLabel;
    DbEdNome: TwwDBEdit;
    Label1: TLabel;
    LstGrupoNaoMembros: TListView;
    Label4: TLabel;
    grpObs: TGroupBox;
    lblObs: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnAddAllClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnDelAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    bdireto: Boolean;
    iusuario, iespacesso: Integer;
  public
    { Public declarations }
  end;

var
  FrmGrupoxUsu: TFrmGrupoxUsu;

implementation

Uses FUserManager, uFormManager, fCadUsuarioNew, uMensErro, uDatabase, uCtrlGrupoUsu;

{$R *.DFM}

procedure TFrmGrupoxUsu.FormCreate(Sender: TObject);
var
  i: Integer;
  lstitem: TListItem;

  { Restrição de associação de funcionário a grupos cujos cargos, funções e
    centros de custos são incompatíveis aos seus. }
  LstItem2 :TListItem;
begin
  inherited;
  bdireto := Not ExisteForm( FRMCADUSUARIONEW );

  With FrmUserManager Do Begin
       DbEdNome.DataSource := DsUsuario;

       If bnovo Then Begin
          iusuario   := CdsUsuario.FieldByName( 'idusuario' ).AsInteger;
          iespacesso := -1;
       End Else Begin
         // Início - Michelle Mota - SOL: 268414 - PPM: 1256276
         If lstUsuario.Focused Then
           begin
             iusuario   := StrToInt( lstUsuario.ItemFocused.SubItems[ 4 ] ); // Michelle Mota - SOL: 253300/17804 - PPM: 1093186
             iespacesso := StrToInt( lstUsuario.ItemFocused.SubItems[ 5 ] ); // Michelle Mota - SOL: 253300/17804 - PPM: 1093186

           end;
         If lstgrupo.Focused Then
          begin
            iusuario   := StrToInt( lstUsuario.ItemFocused.SubItems[ 2 ] );
            iespacesso := StrToInt( lstUsuario.ItemFocused.SubItems[ 3 ] );

          end;
         // Término - Michelle Mota - SOL: 268414 - PPM: 1256276
       End;
  End;

  If bdireto Then
  Begin
     FrmUserManager.SqlUsuario.Prepare;
     FrmUserManager.SqlUsuario.ParamByName( 'idusuario' ).AsInteger := iusuario;
     FrmUserManager.SqlUsuario.Open;
  End;

  // Critica de grupo ativada.
  if (not frmUserManager.GrupoUsu.CriticaGrupoAtivada) then
  begin
     LstGrupoNaoMembros.Items.Assign( FrmUserManager.lstgrupo.Items );
     grpObs.Visible := False;
  end
  else
  begin
     grpObs.Visible := True;
     { Restrição de associação de funcionário a grupos cujos cargos, funções e
       centros de custos são incompatíveis aos seus.

       A linha abaixo foi substituída pela rotina seguinte:
       //LstGrupoNaoMembros.Items.Assign( FrmUserManager.lstgrupo.Items );    }

     //---------- Início da alteração
     FrmUserManager.SQLGrupoXCargoXFuncaoXCCusto.Prepare;
     FrmUserManager.SQLGrupoXCargoXFuncaoXCCusto.ParamByName('IDPESSOA').AsInteger      := iusuario;
     FrmUserManager.SQLGrupoXCargoXFuncaoXCCusto.Open;
     LstGrupoNaoMembros.Items.Clear;


     while not FrmUserManager.CdsGrupoXCargoXFuncaoXCCusto.Eof do
     begin
       LstItem2            := LstGrupoNaoMembros.Items.Add;
       LstItem2.Caption := FrmUserManager.CdsGrupoXCargoXFuncaoXCCusto.Fields[1].AsString;
       LstItem2.SubItems.Add( FrmUserManager.CdsGrupoXCargoXFuncaoXCCusto.Fields[2].AsString );
       LstItem2.SubItems.Add( FrmUserManager.CdsGrupoXCargoXFuncaoXCCusto.Fields[4].AsString );
       LstItem2.SubItems.Add( FrmUserManager.CdsGrupoXCargoXFuncaoXCCusto.Fields[0].AsString );
       LstItem2.SubItems.Add( FrmUserManager.CdsGrupoXCargoXFuncaoXCCusto.Fields[3].AsString );
       FrmUserManager.CdsGrupoXCargoXFuncaoXCCusto.Next;
     end;
     //---------- Fim da alteração
  end;


  LstGrupoMembros.Items.Clear;

  With FrmUserManager Do
  Begin
       If bdireto Then
       Begin
          SqlGrupoAtu.Prepare;
          SqlGrupoAtu.ParamByName( 'IdGrupo' ).AsInteger   := -1;
          SqlGrupoAtu.ParamByName( 'IdUsuario' ).AsInteger := iusuario;
          SqlGrupoAtu.Open;
       End;

       i := 0;

       While i < lstGrupoNaoMembros.Items.Count Do
             If CdsGrupoAtu.Locate( 'IdGrupo', StrToInt( lstGrupoNaoMembros.Items[ i ].SubItems[ 2 ] ), [] ) Then // Michelle Mota - SOL: 268414 - PPM: 1256276
             Begin
                LstItem := lstGrupoMembros.Items.Add;
                LstItem.ImageIndex := 1;
                LstItem.Caption := lstGrupoNaoMembros.Items[ i ].Caption;
                LstItem.SubItems := lstGrupoNaoMembros.Items[ i ].SubItems;
                lstGrupoNaoMembros.Items[ i ].Delete;
             End Else
                Inc( i );
  End;
end;

procedure TFrmGrupoxUsu.BtnAddClick(Sender: TObject);
Var
   i: Integer;
   LstItem: TListItem;
begin
  inherited;
  // Inclui Grupo(s)
  i := 0;

  While i < LstGrupoNaoMembros.Items.Count Do Begin
      If LstGrupoNaoMembros.Items[ i ].Selected Then Begin
         LstItem := LstGrupoMembros.Items.Add;
         LstItem.ImageIndex := 1;
         LstItem.Caption := LstGrupoNaoMembros.Items[ i ].Caption;
         LstItem.SubItems := LstGrupoNaoMembros.Items[ i ].SubItems;
         LstGrupoNaoMembros.Items[ i ].Delete;
      End Else
          Inc( i );
  End;
end;

procedure TFrmGrupoxUsu.BtnAddAllClick(Sender: TObject);
Var
   LstItem: TListItem;
begin
  inherited;
  // Inclui Todos os Grupo

  While LstGrupoNaoMembros.Items.Count > 0 Do Begin
        LstItem := LstGrupoMembros.Items.Add;
        LstItem.ImageIndex := 1;
        LstItem.Caption := LstGrupoNaoMembros.Items[ 0 ].Caption;
        LstItem.SubItems := LstGrupoNaoMembros.Items[ 0 ].SubItems;
        LstGrupoNaoMembros.Items[ 0 ].Delete;
  End;
end;

procedure TFrmGrupoxUsu.BtnDelClick(Sender: TObject);
Var
   i: Integer;
   LstItem: TListItem;
begin
  inherited;
  // Retira Grupo(s)
  i := 0;

  While i < LstGrupoMembros.Items.Count Do Begin
      If LstGrupoMembros.Items[ i ].Selected Then Begin
         LstItem := LstGrupoNaoMembros.Items.Add;
         LstItem.ImageIndex := 1;
         LstItem.Caption := LstGrupoMembros.Items[ i ].Caption;
         LstItem.SubItems := LstGrupoMembros.Items[ i ].SubItems;
         LstGrupoMembros.Items[ i ].Delete;
      End Else
          Inc( i );
  End;
end;

procedure TFrmGrupoxUsu.BtnDelAllClick(Sender: TObject);
Var
   LstItem: TListItem;
begin
  inherited;
  // Retira todos os grupos

  While LstGrupoMembros.Items.Count > 0 Do Begin
        LstItem := LstGrupoNaoMembros.Items.Add;
        LstItem.ImageIndex := 1;
        LstItem.Caption := LstGrupoMembros.Items[ 0 ].Caption;
        LstItem.SubItems := LstGrupoMembros.Items[ 0 ].SubItems;
        LstGrupoMembros.Items[ 0 ].Delete;
  End;
end;

procedure TFrmGrupoxUsu.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
   i: Integer;
begin
  inherited;
  If ModalResult = MrOk Then
     With FrmUserManager, CdsGrupoAtu Do
     Begin
          For i := 0 To LstGrupoNaoMembros.Items.Count - 1 Do
              If Locate( 'IdGrupo', StrToInt( lstGrupoNaoMembros.Items[ i ].SubItems[ 2 ] ), [] ) Then // Michelle Mota - SOL: 268414 - PPM: 1256276
                 Delete;

          For i := 0 To LstGrupoMembros.Items.Count - 1 Do
              If Not Locate( 'IdGrupo', StrToInt( lstGrupoMembros.Items[ i ].SubItems[ 2 ] ), [] ) Then Begin // Michelle Mota - SOL: 268414 - PPM: 1256276
                 Append;
                 FieldByName( 'IdUsuario' ).AsInteger := iusuario;
                 FieldByName( 'IdGrupo' ).AsInteger   := StrToInt( lstGrupoMembros.Items[ i ].SubItems[ 2 ] );  // Michelle Mota - SOL: 268414 - PPM: 1256276
                 Post;
              End;

          If bdireto Then
          Begin
             If Not GrupoUsu.ProcessaGrupoUsu(null, null, null, null, null, null, CdsGrupoAtu.Data, null, null, null, opSoGrupoUsu) Then
                MsgDlg(GrupoUsu.MessageInfo, 'Atenção', mtError, [MbOk], 0);
          End;

     End
  Else
     With FrmUserManager.CdsGrupoAtu Do
          If bdireto Then
             If ChangeCount > 0 Then
                CancelUpdates;

  If bdireto Then
  Begin
     FrmUserManager.CdsGrupoAtu.Close;
     FrmUserManager.CdsUsuario.Close;
  End;
end;

procedure TFrmGrupoxUsu.FormResize(Sender: TObject);
begin
  inherited;
  //Higor Nayde Ferreira  KTN: 2059453 Inicio
  if IsZoomed(FrmGrupoxUsu.Handle) then begin

    LstGrupoMembros.width := 620;
    LstGrupoNaoMembros.width := 620;
    BtnAdd.left :=  LstGrupoMembros.width + 35;
    LstGrupoNaoMembros.left := BtnAdd.left + 50;
    BtnAddAll.left :=BtnAdd.left;
    BtnDel.left    :=BtnAdd.left;
    BtnDelAll.left :=BtnAdd.left;
    Label4.left := LstGrupoNaoMembros.left;

    LstGrupoMembros.Height := FrmGrupoxUsu.Height -250;
    LstGrupoNaoMembros.Height := FrmGrupoxUsu.Height -250;
  end else begin
    LstGrupoMembros.width := 272;
    LstGrupoNaoMembros.width := 272;
    LstGrupoMembros.Height := 219;
    LstGrupoMembros.width := 238;
    LstGrupoNaoMembros.Height := 219;
    LstGrupoNaoMembros.width := 238;
    LstGrupoNaoMembros.left := 336;
    Label4.left := 336;
    BtnAdd.left := 286;
    BtnAddAll.left :=BtnAdd.left;
    BtnDel.left    :=BtnAdd.left;
    BtnDelAll.left :=BtnAdd.left;

  end;//Higor Nayde Ferreira  KTN: 2059453 fim
end;

end.
