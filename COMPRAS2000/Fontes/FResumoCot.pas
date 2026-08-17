unit FResumoCot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

type
  TFrmResumoCot = class(TfrmOkCancelar)
    qryProc: TwwQuery;
    qryProcCODPROCESSO: TFloatField;
    Label2: TLabel;
    dblcProc: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmResumoCot: TFrmResumoCot;

implementation

{$R *.DFM}
Uses DRelCompras, uModulo, uSistema, uMensErro;

procedure TFrmResumoCot.FormCreate(Sender: TObject);
begin
  inherited;
  qryProc.Close;
  qryProc.Params[0].AsFloat := Sistema.IdUsuario;
  qryProc.Open;
  Edit1.Text := Modulo.sAssinatura1;
  Edit2.Text := Modulo.sAssinatura2;
  Edit3.Text := Modulo.sAssinatura3;

end;

procedure TFrmResumoCot.FazRel;
Begin
    DtmRelCompras.RegAss1.Visible := False;
    DtmRelCompras.RegAss2.Visible := False;
    DtmRelCompras.RegAss3.Visible := False;
    DtmRelCompras.RegAss4.Visible := False;
    DtmRelCompras.RegAss5.Visible := False;
    If Trim(Edit1.Text) <> '' Then
       Begin
          DtmRelCompras.RegAss1.Visible      := True;
          DtmRelCompras.LbResCotAss1.Caption := Edit1.Text
       End;
    If Trim(Edit2.Text) <> '' Then
       Begin
          DtmRelCompras.RegAss2.Visible      := True;
          DtmRelCompras.LbResCotAss2.Caption := Edit2.Text
       End;
    If Trim(Edit3.Text) <> '' Then
       Begin
          DtmRelCompras.RegAss3.Visible      := True;
          DtmRelCompras.LbResCotAss3.Caption := Edit3.Text
       End;
    If Trim(Edit4.Text) <> '' Then
       Begin
          DtmRelCompras.RegAss4.Visible      := True;
          DtmRelCompras.LbResCotAss4.Caption := Edit4.Text
       End;
    If Trim(Edit5.Text) <> '' Then
       Begin
          DtmRelCompras.RegAss5.Visible      := False;
          DtmRelCompras.LbResCotAss5.Caption := Edit5.Text
       End;
    DtmRelCompras.qryResumoCot.Close;
    DtmRelCompras.qryResumoCot.ParambyName('CODPROCESSO').AsFloat := StrToFloat(dblcProc.LookupValue);
    DtmRelCompras.qryResumoCot.ParambyName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
    DtmRelCompras.qryResumoCot.Open;
End;

procedure TFrmResumoCot.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcProc.Text) = '' Then
     Begin
        MsgDlg('Selecione o Processo','Erro',mtError,[mbOk],0);
        dblcProc.SetFocus;
        ModalResult := mrNone;
     End
  Else
     Begin
        FazRel;
        ModalResult := mrOK;        
     End;
end;

end.
