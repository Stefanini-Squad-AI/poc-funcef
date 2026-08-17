unit FCadMotivoBloqueio;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook, UmensErro, UDataBase,
  TB97Ctls, TB97Tlbr, Wwdotdot, Wwdbcomb, IvDictio, IvMulti, IvEMulti,
  DBCtrls, CmEventosCadastro, ImgList ;

type
  TfrmCadMotivoBloqueio = class(TfrmCadastroCS)
    LbLDescParamEmissor: TLabel;
    wwDBEDescricao: TwwDBEdit;
    qryIDMOTIVOBLOQUEIO: TFloatField;
    qryDESCMOTBLOQ: TStringField;
    qrySIGLAMOTBLOQ: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    wwDBESigla: TwwDBEdit;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMotivoBloqueio: TfrmCadMotivoBloqueio;
  ssql : String;

implementation

uses DBaseDados, USistema, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadMotivoBloqueio.bbtnConfirmarClick(Sender: TObject);
Var
  wTipoAtu:String;
  wIdTipoDespInvest, wIdEmpresa, wIdForCli:Integer;
begin
 if Trim(wwdbeDescricao.Text) = '' then
  begin
   MsgDlg('Descrição deve ser informada. ','Erro',mtError,[mbOK],0);
   wwdbeDescricao.SetFocus;
   exit;
  end
 else
  if Trim(wwdbeSigla.Text) = '' then
   begin
    MsgDlg('Sigla deve ser informada. ','Erro',mtError,[mbOK],0);
    wwdbeSigla.SetFocus;
    exit;
   end
  else
   If Ds.DataSet.State In [dsInsert] Then Begin
     if Qry.FieldByName('IDMOTIVOBLOQUEIO').AsInteger <=0 then
       Qry.FieldByName('IDMOTIVOBLOQUEIO').AsInteger := LeUltRegistro(nil,'MOTIVOBLOQUEIO');
   End;

 If (Qry.State in [DsInsert]) Then Begin
   wTipoAtu:='I';
 End Else If (Qry.State in [DsEdit]) Then Begin
   wTipoAtu:='A';
 End;

 Try
// Heranca
   inherited;
 Except
   Raise;
 End;
end;

procedure TfrmCadMotivoBloqueio.FormShow(Sender: TObject);
begin
  inherited;
  Qry.Open;
end;

procedure TfrmCadMotivoBloqueio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
end;

procedure TfrmCadMotivoBloqueio.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  WWdbeDescricao.SetFocus;
end;

procedure TfrmCadMotivoBloqueio.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) And
    (MontaSelect.ValoresChave[0] <> '') Then	Begin
   	Qry.Locate('IDMOTIVOBLOQUEIO',MontaSelect.ValoresChave[0],[]);
  End;
end;

procedure TfrmCadMotivoBloqueio.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
 WWdbeDescricao.SetFocus;
end;

end.
