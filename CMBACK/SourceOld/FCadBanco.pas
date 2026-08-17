unit FCadBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, CMwwQuery, Wwdatsrc,
  Pessoa, TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, checklst, ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask,
  wwdbedit, ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, Wwquery, TREdit;

type
  TfrmCadBanco = class(TfrmPessoa)
    Panel3: TPanel;
    TbsGeral: TTabSheet;
    Label13: TLabel;
    dbedNumBanco: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Label2: TLabel;
    wwDBEdit3: TwwDBEdit;
    DBCheckBox1: TDBCheckBox;
    qrySubTipoIDPESSOA: TFloatField;
    qrySubTipoNUMBANCO: TStringField;
    qrySubTipoMASCARACC: TStringField;
    qrySubTipoMASCARAAGENCIA: TStringField;
    qrySubTipoFLGVALIDACC: TStringField;
    QryBuscaBanco: TwwQuery;
    QryBuscaBancoIDPESSOA: TFloatField;
    Label3: TLabel;
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBanco: TfrmCadBanco;

implementation

{$R *.DFM}

Uses UAutorizacao, uMensErro;


Procedure TfrmCadBanco.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;
  qrySubTipoFLGVALIDACC.AsString := 'S'
End;

Procedure  TfrmCadBanco.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := (Trim(dbedNumBanco.Text) <> '');

  If Not Accept Then
     MsgDlg('Nº do Banco não informado','Atenção',mtError,[mbOk],0)
  Else
  Begin
     With QryBuscaBanco Do
     Begin
        If Active Then Close;
        If Not Prepared Then Prepare;
        Params[0].ASString := qrySubTipoNUMBANCO.AsString;
        Open;

        Accept := (IsEmpty) Or
                  (qrySubTipoIDPESSOA.AsFloat = QryBuscaBancoIDPESSOA.AsFloat);
        Close;

        If Not Accept Then
           MsgDlg('Nº do Banco já cadastrado','Atenção',mtError,[mbOk],0);
     End;
  End;
End;

end.
