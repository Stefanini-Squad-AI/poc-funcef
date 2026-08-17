unit FCadGrupoRespon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, CmEventosCadastro,
  ImgList;

type
  TFrmCadGrupoRespon = class(TfrmCadastroCS)
    qryIDGRPRESPON: TFloatField;
    qryNOME: TStringField;
    EdDesGrp: TDBEdit;
    Label1: TLabel;
    plnGrp: TPanel;
    Panel1: TPanel;
    grdGrupoSelec: TwwDBGrid;
    grdGrupoDispo: TwwDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    btnRemover: TSpeedButton;
    btnAdicionar: TSpeedButton;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dsDet: TwwDataSource;
    qryUsu: TwwQuery;
    dsUsu: TwwDataSource;
    updUsu: TUpdateSQL;
    qryDetIDUSUARIO: TFloatField;
    qryDetIDGRPRESPON: TFloatField;
    qryDetNOMEUSUARIO: TStringField;
    qryUsuIDUSUARIO: TFloatField;
    qryUsuNOMEUSUARIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    
    Procedure Sel( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadGrupoRespon : TFrmCadGrupoRespon;
  idGrupo           : LongInt;
implementation

{$R *.DFM}
Uses uDataBase, dBaseDados, uMensErro;

Procedure TFrmCadGrupoRespon.Sel( n : LongInt );
Begin
    qry.Close;
    qry.Params[0].AsInteger := n;
    qry.Open;
    
    qryUsu.Close;
    qryUsu.Params[0].AsInteger := n;
    qryUsu.Open;
    
    qryDet.Close;
    qryDet.Params[0].AsInteger := n;
    qryDet.Open;
End;

procedure TFrmCadGrupoRespon.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

procedure TFrmCadGrupoRespon.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;
  qryIDGRPRESPON.AsInteger := LeUltRegistro(nil,'RADGRPRESPON');
  idGrupo                  := qryIDGRPRESPON.AsInteger;
  if Not qryDet.IsEmpty Then
    Begin
        qryUsu.Close;
        qryUsu.Params[0].AsInteger := idGrupo;
        qryUsu.Open;

        qryDet.Close;
        qryDet.Params[0].AsInteger := idGrupo;
        qryDet.Open;
    End;

  EdDesGrp.SetFocus;
End;

procedure TFrmCadGrupoRespon.CmeCadastroEdit(Sender: TObject);
Begin
 Inherited;
 EdDesGrp.SetFocus;
End;

procedure TFrmCadGrupoRespon.btnAdicionarClick(Sender: TObject);
begin
  inherited;
   If Not qryUsu.IsEmpty Then
     Begin
        With qryDet Do
           Begin
             Append;
             FieldByName('IDGRPRESPON').asInteger := qryIDGRPRESPON.AsInteger;
             FieldByName('IDUSUARIO').asInteger   := qryUsu.FieldByName('IDUSUARIO').asInteger;
             FieldByName('NOMEUSUARIO').asString  := qryUsu.FieldByName('NOMEUSUARIO').asString;
            End;
        qryUsu.Delete;
     End;
end;

procedure TFrmCadGrupoRespon.btnRemoverClick(Sender: TObject);
begin
  inherited;
   If Not qryDet.IsEmpty Then
     Begin
        With qryUsu Do
           Begin
             Append;
             FieldByName('IDUSUARIO').asInteger   := qryDet.FieldByName('IDUSUARIO').asInteger;
             FieldByName('NOMEUSUARIO').asString  := qryDet.FieldByName('NOMEUSUARIO').asString;
            End;
        qryDet.Delete;
     End;
end;

procedure TFrmCadGrupoRespon.CmeCadastroDelete(Sender: TObject);
Begin
    qryDet.DisableControls;
    qryDet.First;
    While Not qryDet.EOF Do
      qryDet.Delete;
    qryDet.EnableControls;
    Inherited;
End;

procedure TFrmCadGrupoRespon.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
      Begin
         Sel(StrToInt(MontaSelect.ValoresChave[0]) );
         idGrupo := StrToInt(MontaSelect.ValoresChave[0]);
      End;
End;
procedure TFrmCadGrupoRespon.CmeCadastroConfirma(Sender: TObject);
Begin
    if qry.State in [dsInsert,dsEdit] Then
       Begin
            AplicaAlteracoes([qry,qryDet]);
            qryUsu.CancelUpdates;
       End
    Else
      Begin
         AplicaAlteracoes([qryDet,qry]);
         Inherited;
      End;
End;

Procedure TFrmCadGrupoRespon.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := True;
   if Trim(EdDesGrp.Text) = '' Then
      Begin
          Accept := False;
          MsgDlg('Descrição não preenchida','Erro',mtError,[mbOk],0);
          EdDesGrp.SetFocus;
      End
   Else
   if qryDet.IsEmpty Then
      Begin
          Accept := False;
          MsgDlg('Não posso criar um grupo sem usuários','Erro',mtError,[mbOk],0);
      End;
End;

procedure TFrmCadGrupoRespon.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Sel( IdGrupo );
end;

procedure TFrmCadGrupoRespon.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

end.
