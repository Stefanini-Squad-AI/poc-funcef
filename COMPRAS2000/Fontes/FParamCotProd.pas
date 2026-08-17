unit FParamCotProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery;

type
  TFrmParamCotProd = class(TfrmOkCancelar)
    qryProc: TwwQuery;
    qryProcCODPROCESSO: TFloatField;
    Label1: TLabel;
    dblcProc: TCMDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamCotProd: TFrmParamCotProd;

implementation

{$R *.DFM}

Uses DRelCompras, uMensErro, uSistema, uModulo;

procedure TFrmParamCotProd.FormCreate(Sender: TObject);
begin
  inherited;
  qryProc.Close;
  qryProc.Params[0].AsInteger := Sistema.IdUsuario;
  qryProc.Open;
end;

Procedure TFrmParamCotProd.FazRel;
Begin
  DtmRelCompras.lnLinhaP1.Visible      := False;
  DtmRelCompras.lnLinhaP2.Visible      := False;
  DtmRelCompras.lnLinhaP3.Visible      := False;
  DtmRelCompras.LbCotPAssinat1.Visible := False;
  DtmRelCompras.lbCotPAssinat2.Visible := False;
  DtmRelCompras.lbCotPAssinat3.Visible := False;
  If Trim(Modulo.sAssinatura1) <> '' Then
     Begin
        DtmRelCompras.lnLinhaP1.Visible      := True;
        DtmRelCompras.lbCotPAssinat1.Visible := True;
        DtmRelCompras.lbCotpAssinat1.Caption := Modulo.sAssinatura1;
     End;
  If Trim(Modulo.sAssinatura2) <> '' Then
     Begin
        DtmRelCompras.lnLinhaP2.Visible      := True;
        DtmRelCompras.lbCotPAssinat2.Visible := True;
        DtmRelCompras.lbCotPAssinat2.Caption := Modulo.sAssinatura2;
     End;
  If Trim(Modulo.sAssinatura3) <> '' Then
     Begin
        DtmRelCompras.lnLinhaP3.Visible      := True;
        DtmRelCompras.lbCotPAssinat3.Visible := True;
        DtmRelCompras.lbCotPAssinat3.Caption := Modulo.sAssinatura3;        
     End;
  DtmRelCompras.LbTituloCotProd.Caption := 'Resultado da Cotação do processo Nº '+dblcProc.Text;
  With DtmRelCompras.qryCotProd Do
     Begin
        Close;
        ParamByName('CODPROCESSO').asFloat := StrToFloat(dblcProc.LookUpValue);
        ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
        Open;
     End;
End;

procedure TFrmParamCotProd.bbtnConfirmarClick(Sender: TObject);
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
