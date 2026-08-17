unit FParamSCQ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, TREdit;

type
  TFrmParamSCQ = class(TfrmCadastroCS)
    qryFLGZEROUM: TStringField;
    qryNUMAVALI: TFloatField;
    chkZeroUm: TDBCheckBox;
    edNumAvali: TDBRealEdit;
    Label1: TLabel;
    qryIDPESSOA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamSCQ: TFrmParamSCQ;

implementation

{$R *.DFM}
Uses uSistema, uModulo;
procedure TFrmParamSCQ.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.Params[0].Value := Sistema.idEmpresa;
  qry.Open;
end;

procedure TFrmParamSCQ.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   If (Not qry.IsEmpty) Then
     Begin
        qry.Cancel;
        qry.Edit;
     End;
     chkZeroUm.SetFocus;
End;

procedure TFrmParamSCQ.CmeCadastroConfirma(Sender: TObject);
Begin
   IF qry.State in [dsInsert,dsEdit] Then
     Begin
       qry.FieldByName('IDPESSOA').asInteger    := Sistema.IdEmpresa;
       Modulo.SetParametros;
     End;
   Inherited;
End;



procedure TFrmParamSCQ.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

end.
