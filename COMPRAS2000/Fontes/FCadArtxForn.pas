unit FCadArtxForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo,
  CmEventosCadastro, ImgList, uCMTypes;

type
  TFrmCadArtxForn = class(TfrmCadastroCS)
    Label1: TLabel;
    EdForn: TEdit;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    updArt: TUpdateSQL;
    qryArt: TwwQuery;
    dsArt: TwwDataSource;
    qryArtCODARTIGO: TStringField;
    qryArtDESCPROD: TStringField;
    dblcGrupo: TCMDBLookupCombo;
    Label2: TLabel;
    qryGrupo: TwwQuery;
    qryGrupoCODGRUPOPROD: TStringField;
    qryGrupoDESCGRUPOPROD: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure dblcGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : LongInt );
    Procedure SelArt( sCodGrupoProd : String );
  public
    { Public declarations }
  end;

var
  FrmCadArtxForn : TFrmCadArtxForn;
  iIdForCli      : LongInt;
implementation

{$R *.DFM}

Uses uSistema, uMensErro;

procedure TFrmCadArtxForn.FormCreate(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := False;
  MontaSelect.Filtro.Add('EMPRESAFORN.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('EMPRESAFORN.IDFORCLI = PESSOA.IDPESSOA');
  sel(-1);
end;

Procedure TFrmCadArtxForn.Sel( n : LongInt );
begin
   iIdForCli := n;
   qry.Close;
   qry.ParamByName('pIDFORCLI').asInteger := n;
   qry.Open;
   //
   dblcGrupo.Text := qryGrupo.FieldByName('DESCGRUPOPROD').asString;
   SelArt(qryGrupo.FieldByName('CODGRUPOPROD').asString);
end;

Procedure TFrmCadArtxForn.SelArt( sCodGrupoProd : String );
Begin
   qryArt.Close;
   qryArt.ParamByName('pIDFORCLI').asInteger    := iIdForCli;
   qryArt.ParamByName('pCODGRUPOPROD').asString := sCodGrupoProd;
   qryArt.Open;
End;

Procedure TFrmCadArtxForn.CmeCadastroInsert(Sender: TObject);
Begin
    Inherited;
    If Trim(edForn.Text) = '' Then
      Begin
          MsgDlg('Não há Nenhum usuário selecionado','Atenção',mtWarning,[mbOk],0);
          bbtnCancelar.Click;
      End
    Else
      qry.Cancel;
End;

procedure TFrmCadArtxForn.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
      Begin
           Sel(StrToInt(MontaSelect.ValoresChave[0]) );
           edForn.Text := MontaSelect.ValoresChave[1];
      End;
End;

procedure TFrmCadArtxForn.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.Down Then
    Begin
       If Not qryArt.IsEmpty Then
         Begin
            With qry Do
               Begin
                 Append;
                 FieldByName('IDFORCLI').asInteger := iIdForCli;
                 FieldByName('CODARTIGO').asString := qryArt.FieldByName('CODARTIGO').asString;
                 FieldByName('DESCPROD').asString  := qryArt.FieldByName('DESCPROD').asString;
                End;
            qryArt.Delete;
         End;
    End;
end;

procedure TFrmCadArtxForn.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
       If Not qry.IsEmpty Then
         Begin
            With qryArt Do
               Begin
                 Append;
                 FieldByName('CODARTIGO').asString := qry.FieldByName('CODARTIGO').asString;
                 FieldByName('DESCPROD').asString  := qry.FieldByName('DESCPROD').asString;
                End;
            qry.Delete;
         End;
    End;
end;

procedure TFrmCadArtxForn.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  qryArt.First;
  While Not qryArt.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmCadArtxForn.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
 qry.First;
  While Not qry.Eof Do
    btnRemove.Click;
end;

procedure TFrmCadArtxForn.dblcGrupoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     SelArt(dblcGrupo.LookupValue);
end;

procedure TFrmCadArtxForn.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

end.
