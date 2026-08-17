unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
  TB97Ctls, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM,
  fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList, ImgList,
  fcStatusBar, SConnect, MConnect, DBClient;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    RestrioesdosFornecedores1: TMenuItem;
    TipodeAvaliao1: TMenuItem;
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure RestrioesdosFornecedores1Click(Sender: TObject);
    procedure TipodeAvaliao1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure fcLabel2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.DFM}

Uses
    FParamSCQ, FCadRestricao, FCadTipoAvali, FAvaliacao;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmParamSCQ,TFrmParamSCQ,False);
end;

procedure TfrmPrincipal.RestrioesdosFornecedores1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRestricao,TFrmCadRestricao,False);
end;

procedure TfrmPrincipal.TipodeAvaliao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadTipoAvali,TFrmCadTipoAvali,False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
    If Sistema.FezLogin Then
      Begin
          Modulo.SetParametros;
      End;
end;

procedure TfrmPrincipal.fcLabel2Click(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
   For x := 0 To ComponentCount -1 Do
     Begin
        If Components[x] is TMenuItem Then
           (Components[x] as TMenuItem).Enabled := True;
     End;

end;

initialization

   Sistema.NomeModulo := 'Controle de Qualidade';    // Nome do Módulo
   Sistema.IdModulo   := 94 ;              // IdModulo cadastrado no SAD
   Sistema.Versao := '3.00.01';
   Sistema.NomeAplicativo := 'Controle de Qualidade';

   Modulo := TModulo.Create  ;

finalization
   Modulo.free;


end.
