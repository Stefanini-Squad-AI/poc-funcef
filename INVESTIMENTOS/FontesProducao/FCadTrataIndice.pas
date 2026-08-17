unit FCadTrataIndice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, wwdblook, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfrmCadTrataIndice = class(TfrmCadastroCS)
    Label4: TLabel;
    Label1: TLabel;
    DblkcMoeda: TwwDBLookupCombo;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    qryMoeda: TwwQuery;
    dsMoeda: TwwDataSource;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOESIGLA: TStringField;
    wwDBComboBox1: TwwDBComboBox;
    qryIDTRATAIND: TFloatField;
    qryMOECODIGO: TFloatField;
    qryDESCTRATAIND: TStringField;
    qryCODTRATAIND: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    Procedure Sel( N : LongInt );
    procedure SetParam(Param: Integer);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTrataIndice: TfrmCadTrataIndice;

implementation

{$R *.DFM}
Uses UDataBase;

procedure TfrmCadTrataIndice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   Qry.Close;
   QryMoeda.Close;
end;

procedure TfrmCadTrataIndice.FormCreate(Sender: TObject);
begin
  inherited;
   Sel(-1);
end;

Procedure TfrmCadTrataIndice.Sel( N : LongInt );
Begin
   qry.Close;
   qry.ParamByName('IDTRATAIND').asInteger  := n;
   qry.Open;
   QryMoeda.Close;
   QryMoeda.Open;
End;

procedure TfrmCadTrataIndice.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
      Begin
          Sel(StrToInt(MontaSelect.ValoresChave[0]));
      End;
End;

procedure TfrmCadTrataIndice.CmeCadastroEdit(Sender: TObject);
begin
     inherited;
     DblkcMoeda.SetFocus
end;

procedure TfrmCadTrataIndice.SetParam(Param: Integer);
begin
     qry.Close;
     qry.Params[0].Value := Param;
     qry.Open
end;

procedure TfrmCadTrataIndice.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   dbeDescricao.SetFocus;
End;

procedure TfrmCadTrataIndice.bbtnConfirmarClick(Sender: TObject);
begin
  If qry.State = dsInsert Then
     qry.FieldByName('IDTRATAIND').asInteger := LeUltRegistro(nil,'TRATAINDICE');
  inherited;
end;

end.
